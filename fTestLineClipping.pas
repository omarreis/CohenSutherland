unit fTestLineClipping;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    lab1: TLabel;
    edX0: TEdit;
    lab2: TLabel;
    edY0: TEdit;
    lab3: TLabel;
    edX1: TEdit;
    lab4: TLabel;
    edY1: TEdit;
    btnClipAndDraw: TButton;
    procedure btnClipAndDrawClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
  public
    mouseState:Integer;
  end;

var
  Form1: TForm1;

implementation

uses
   CohenSutherlandClipping;

{$R *.dfm}

const
  xmin=100;  //my clipping rect corners
  ymin=100;
  xmax=600;
  ymax=500;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  mouseState:=0;
  CohenSutherland_SetClippingRect(xmin, ymin, xmax, ymax );  //set clipping rect
end;

procedure TForm1.btnClipAndDrawClick(Sender: TObject);
var x0,y0,x1,y1:Double;
begin
  x0:=StrToFloat(edX0.Text);
  y0:=StrToFloat(edY0.Text);
  x1:=StrToFloat(edX1.Text);
  y1:=StrToFloat(edY1.Text);

  Canvas.Rectangle(xmin, ymin, xmax, ymax );

  if CohenSutherland_LineVisible(x0,y0,x1,y1) then
      begin
        Canvas.MoveTo( Trunc(x0),  Trunc(y0) );
        Canvas.LineTo( Trunc(x1),  Trunc(y1) );
      end
      else MessageBeep(0);
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if mouseState=0 then
    begin
      edX0.Text := IntToStr(x);
      edY0.Text := IntToStr(y);
      mouseState:=1;
    end
    else begin
      edX1.Text := IntToStr(x);
      edY1.Text := IntToStr(y);
      btnClipAndDrawClick(nil);
      mouseState:=0;
    end;
end;

end.
