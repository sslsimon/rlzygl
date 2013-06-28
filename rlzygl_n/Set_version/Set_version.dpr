program Set_version;

uses
  Forms,
  Unit_set_version in 'Unit_set_version.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '更新系统版本号';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
