# CohenSutherland
Cohen Sutherland line clipping in Pascal ( Delphi )

This is a port of C code from Wikipedia to Delphi:  

   http://en.wikipedia.org/wiki/Cohen%E2%80%93Sutherland

The test application (VCL) can be used either by typing the line end-points coordinates or by clicking two points in the form.

![Test app shot](TespAppShot.png)

App tested with D11.1

I did that port to use with graphics32, because the standard "Safe" clipping TBitmap32.LineToAS() doesn't work for large x, y ( this was for 2012, don't know if it works now ) 

See this post: 
http://graphics32.org/news/newsgroups.php?art_group=graphics32.general&article_id=11833





