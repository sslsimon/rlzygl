program Set_version;

uses
  Forms,
  Unit_set_version in 'Unit_set_version.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '����ϵͳ�汾��';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
