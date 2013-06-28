program Update;

uses
  Forms,
  Unit_update in 'Unit_update.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '¸üÐÂ³ÌÐò';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
