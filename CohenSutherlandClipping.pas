unit CohenSutherlandClipping;
// line clipping to a rectangle
// Ported to Delphi from wikipedia C code by Omar Reis - 2012
// see http://en.wikipedia.org/wiki/Cohen%E2%80%93Sutherland

interface

// CohenSutherland_SetClippingRect() sets clipping rectangle corners
procedure CohenSutherland_SetClippingRect(const x0,y0,x1,y1:double);

// CohenSutherland_LineVisible() returns true if line visible
// vars x0,y0,x1,y1 return clipped line end points
function  CohenSutherland_LineVisible(var x0,y0,x1,y1:double):boolean;

implementation //--------------------------------------------------

const
  INSIDE = 0; // 0000
  LEFT   = 1; // 0001
  RIGHT  = 2; // 0010
  BOTTOM = 4; // 0100
  TOP    = 8; // 1000

  // Clipping rectangle corners
  CRC_xmin:double=0;      //  CRC_xmin,CRC_ymin +----------------
  CRC_ymin:double=0;      //                    |               |
  CRC_xmax:double=2000;   //                    |               |
  CRC_ymax:double=1000;   //                    ----------------+ CRC_xmax,CRC_ymax

procedure CohenSutherland_SetClippingRect(const x0,y0,x1,y1:double);
begin
  CRC_xmin:=x0;
  CRC_ymin:=y0;
  CRC_xmax:=x1;
  CRC_ymax:=y1;
end;

// Compute the bit code for a point (x, y) using the clip rectangle
// bounded diagonally by (xmin, ymin), and (xmax, ymax)
// ASSUME THAT xmax , xmin , ymax and ymin are global constants.

function ComputeOutCode(const x,y:double):Integer;
var code:Integer;
begin
  code := INSIDE; // initialised as being inside of clip window

  if (x < CRC_xmin) then code := code or  LEFT        // to the left of clip window
  else if (x > CRC_xmax) then code := code or  RIGHT; // to the right of clip window

  if (y < CRC_ymin) then code := code or  BOTTOM    // below the clip window
  else if (y > CRC_ymax) then code := code or  TOP; // above the clip window
  Result := code;
end;

// Cohen–Sutherland clipping algorithm clips a line from
// P0 = (x0, y0) to P1 = (x1, y1) against a rectangle with
// diagonal from (xmin, ymin) to (xmax, ymax).
function CohenSutherland_LineVisible(var x0,y0,x1,y1:double):boolean; //returns true if line visible
var outcode0,outcode1,outcodeOut:Integer; accept:Boolean; x,y:Double;
begin
  // compute outcodes for P0, P1, and whatever point lies outside the clip rectangle
  outcode0 := ComputeOutCode(x0, y0);
  outcode1 := ComputeOutCode(x1, y1);
  accept   := false;
  x:=0; y:=0;
  while (true) do
    begin
      if (outcode0 or outcode1 = 0 ) then // Bitwise OR is 0. Trivially accept and get out of loop
        begin
          accept := true;
          break;
        end
        else if (outcode0 and outcode1<>0) then // Bitwise AND is not 0. Trivially reject and get out of loop
        begin
          break;
        end
        else begin
          // failed both tests, so calculate the line segment to clip
          // from an outside point to an intersection with clip edge
          // At least one endpoint is outside the clip rectangle; pick it.
          if (outcode0 <> 0) then outcodeOut:=outcode0
            else outcodeOut:=outcode1;     //outcodeOut = outcode0 ? outcode0 : outcode1;
          // Now find the intersection point;
          // use formulas y = y0 + slope * (x - x0), x = x0 + (1 / slope) * (y - y0)
          if (outcodeOut and TOP <>0 ) then           // point is above the clip rectangle
            begin
              x := x0 + (x1 - x0) * (CRC_ymax - y0) / (y1 - y0);
              y := CRC_ymax;
            end
          else if (outcodeOut and BOTTOM <>0) then  // point is below the clip rectangle
            begin
              x := x0 + (x1 - x0) * (CRC_ymin - y0) / (y1 - y0);
              y := CRC_ymin;
            end
          else if (outcodeOut and RIGHT <>0) then  // point is to the right of clip rectangle
            begin
              y := y0 + (y1 - y0) * (CRC_xmax - x0) / (x1 - x0);
              x := CRC_xmax;
            end
          else if (outcodeOut and LEFT <>0) then   // point is to the left of clip rectangle
            begin
              y := y0 + (y1 - y0) * (CRC_xmin - x0) / (x1 - x0);
              x := CRC_xmin;
            end;

          (* NOTE:if you follow this algorithm exactly(at least for c#), then you will fall into an infinite loop
          in case a line crosses more than two segments. to avoid that problem, leave out the last else
          if(outcodeOut & LEFT) and just make it else *)

          // Now we move outside point to intersection point to clip
          // and get ready for next pass.
          if (outcodeOut = outcode0) then
            begin
              x0 := x;
              y0 := y;
              outcode0 := ComputeOutCode(x0, y0);
            end
            else begin
              x1 := x;
              y1 := y;
              outcode1 := ComputeOutCode(x1, y1);
            end;
        end;
    end;
  Result := accept;
end;

end.
