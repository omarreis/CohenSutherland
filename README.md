# CohenSutherland
Cohen Sutherland line clipping in Pascal ( Delphi )


This is a port of C code from Wikipedia to Delphi:  http://en.wikipedia.org/wiki/Cohen%E2%80%93Sutherland

The test application can be used either by typing the line end-points coordinates or by clicking two points in the form.

I did that port to use with graphics32, because the standard "Safe" clipping TBitmap32.LineToAS() doesn't work for large x, y 

See this post: http://graphics32.org/news/newsgroups.php?art_group=graphics32.general&article_id=11833



