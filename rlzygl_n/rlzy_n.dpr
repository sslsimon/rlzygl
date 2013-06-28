program rlzy_n;

uses
  MidasFastMM4,
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  qry_ryxx in 'qry_ryxx.pas' {Frm_qry_ryxx},
  Add_jczl in 'Add_jczl.pas' {Frm_Addjczl},
  Login in 'Login.pas' {Frm_Login},
  user_right in 'user_right.pas' {frm_user_right},
  ryzl_qry_edit in 'ryzl_qry_edit.pas' {frm_ryzl_qry_edit},
  Change_passowrd in 'Change_passowrd.pas' {Frm_Change_password},
  Operator_dy in 'Operator_dy.pas' {Frm_operator_dy},
  About in 'About.pas' {frm_about},
  Changyong_cx in 'Changyong_cx.pas' {frm_changyong_cx},
  Add_ryzl in 'Add_ryzl.pas' {Frm_Addryzl},
  ry_gzgl in 'ry_gzgl.pas' {frm_rygzgl},
  ry_tcgl in 'ry_tcgl.pas' {frm_rytcgl},
  htgl in 'htgl.pas' {frm_htgl},
  qry_ht in 'qry_ht.pas' {frm_qry_htgl};

{$R *.res}
begin
  Application.Initialize;
  Application.Title := '瀚文人力资源管理系统-网络版';
  Application.CreateForm(TMainForm, MainForm);
  if is_yx = 0 then
  begin
    Application.Run;
  end
  else
  begin
    Application.Terminate;
  end;
end.

