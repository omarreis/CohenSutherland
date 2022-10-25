program TestLineClipping;

uses
  Forms,
  fTestLineClipping in 'fTestLineClipping.pas' {Form1},
  CohenSutherlandClipping in 'CohenSutherlandClipping.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
