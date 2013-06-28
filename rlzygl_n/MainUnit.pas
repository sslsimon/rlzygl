unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ActnList, ExtCtrls,
  jpeg, DB, IBDatabase, IBCustomDataSet, IBQuery, IniFiles, StdCtrls,
  DBXpress, FMTBcd, SqlExpr, IBC, IbDacVcl, MemDS, DBAccess;

type
  TMainForm = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    About1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    ActionList1: TActionList;
    Image1: TImage;
    N13: TMenuItem;
    N14: TMenuItem;
    Timer1: TTimer;
    N15: TMenuItem;
    N16: TMenuItem;
    IBCConnection1: TIBCConnection;
    IBTransaction1: TIBCTransaction;
    IBQuery1: TIBCQuery;
    N9: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N17: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    procedure N5Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
  private
    { Private declarations }
  public
    function write_log(write_text: string): Boolean; //写事件日志
    function FGetFileTime(sFileName: string; TimeType: integer): TDateTime; //取文件日期
    { Public declarations }

  end;

var
  MainForm: TMainForm;
  PATH_SET: TIniFile;
  Server_ip, File_path: string;
 //  hnd: THandle;
var is_edit: Integer; //is_edit:是否处于编辑模式 取值 0新增  1编辑 ,2审核
  is_edit1, is_edit2, is_edit3, is_edit4, is_edit5, is_edit6: Integer; //人员资料管理各页面是否编辑模式  取值 0新增  1编辑
  gzd_shr: string;
  ryqx_name: array[0..10] of string;
 // ryqx_name: array of string ; //操作员拥有的权限名，用于对比是否有特殊权限？
  qx_count: Integer; //操作员拥有的权限数
  App_ver: tdatetime; //程序版本，用于判断是否需要更新
  htdc:boolean;//合同导出权限。
  gsmc:string;  //0级部门名称
implementation
uses Add_ryzl, Add_jczl, Login, user_right, Change_passowrd, Operator_dy,
  qry_ryxx, About, Changyong_cx, ry_gzgl, ry_tcgl, htgl, qry_ht;

{$R *.dfm}

function TMainForm.write_log(write_text: string): Boolean; //写事件日志
var log_txt: TextFile;
begin
  assignfile(log_txt, 'log.txt');
  if fileexists('log.txt') = false then
  begin
    rewrite(log_txt);
  end
  else
  begin
    append(log_txt);
    write(log_txt, write_text);
    writeln(log_txt, '');
    closefile(log_txt);
    Result := True;
  end;
end;

function TMainForm.FGetFileTime(sFileName: string;
  TimeType: integer): TDateTime;
var
  ffd: TWin32FindData;
  dft: DWord;
  lft, Time: TFileTime;
  h: THandle;
begin
  h := FindFirstFile(Pchar(sFileName), ffd);
  case TimeType of
    0: Time := ffd.ftCreationTime;
    1: Time := ffd.ftLastWriteTime;
    2: Time := ffd.ftLastAccessTime;
  end; //case
 //获取文件信息
  if h <> INVALID_HANDLE_VALUE then
  begin
  //转换FILETIME格式为localFILETIME格式
    FileTimeToLocalFileTime(Time, lft);
  //localFILETIME转换为DOStime格式
    FileTimeToDosDateTime(lft, LongRec(dft).Hi, LongRec(dft).Lo);
  //转换DOStime格式为Delphi的TDateTime格式
    Result := FileDateToDateTime(dft);
  end
  else
    result := 0;
end;

procedure TMainForm.N5Click(Sender: TObject);
begin
  is_edit := 0;
  if Frm_Addryzl = nil then Frm_Addryzl := TFrm_Addryzl.Create(self);
  Frm_Addryzl.btn_ygno.Enabled := false;
  Frm_Addryzl.lbl_is_edit.Caption := '0';
  Frm_Addryzl.Caption := '员工资料录入';
  Frm_Addryzl.ShowModal;

end;

procedure TMainForm.N8Click(Sender: TObject);
begin
  if Frm_Addjczl = nil then Frm_Addjczl := TFrm_Addjczl.Create(self);
  Frm_Addjczl.Showmodal;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var i, j: integer;
  yxq,sys_id: real; //有效期，库里存的日期
begin
  is_yx := 1; //有效期 0 在有效期内 1 过期
  ShortDateFormat := 'yyyy-MM-dd';
  PATH_SET := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Path.ini'); //从INI文件读设置数据库路径
  Server_ip := PATH_SET.ReadString('Spath', 'Saddress', '');
  PATH_SET.Free;
  App_ver := FGetFileTime('rlzy_n.exe', 1);
  IBCConnection1.Server := '';
  IBCConnection1.Server := Server_ip;
  try
    IBCConnection1.Connect;
  except
    Application.MessageBox('网络异常或服务器未开机！', PChar('瀚文人力资源管理系统-网络版'),
      MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2 + MB_TOPMOST);
    Application.Terminate;
  end;
  yxq := StrToFloat(formatDateTime('yyyymmdd', Now)) * StrToFloat(formatDateTime('yyyymmdd', Now));
  with IBQuery1 do //程序有效期
  begin
    Close;
    SQL.Clear;
    sql.Add('select SYS_ID from SYS_VERSION');
    Open;
    sys_id:=IBQuery1.Fields[0].Value;
  end;
  if yxq >= IBQuery1.Fields[0].Value then //失效 开始
  begin
    is_yx := 1;
    with IBQuery1 do //取消除管理员外所有人员登录权限
    begin
      Close;
      SQL.Clear;
      sql.Add('update OPERATOR_XX SET IS_LOGIN=false where OPERATOR_NO<>999');
      ExecSQL;
    end;
    ShowMessage('该程序执行了非法操作');
    Application.Terminate;
  end //失效结束
  else
  begin
    with IBQuery1 do //判断程序版本过程开始
    begin
      Close;
      SQL.Clear;
      sql.Add('select YXQ,SYS_TIME from SYSTEM_SET');
      Open;
    end;
    if App_ver >=StrToDateTime(DateToStr(IBQuery1.Fields[0].Value)+' '+timetostr(IBQuery1.Fields[1].Value))  then begin //当前程序修改日期大于数据库记录的修改日期 不需要更新
      MainForm.Caption := Application.Title;
      MainForm.StatusBar1.Panels[3].Text := 'ID：1.' + FloatToStr(sys_id);

      Frm_Login := TFrm_Login.Create(SELF);
      //Frm_Login.Show;
      Frm_Login.ShowModal;
      StatusBar1.Panels[0].Text := '操作员：' + user_name;
      begin
        if is_login = 0 then begin
          is_yx := 0;
          perform(WM_SIZE, SIZE_MAXIMIZED, 0); //窗体最大化
          for i := 0 to MainMenu1.Items.Count - 1 do //所有菜单变灰
            for j := 0 to MainMenu1.Items[i].Count - 1 do
            begin
              mainmenu1.Items[i].enabled := false;
              MainMenu1.Items[i].Items[j].Enabled := false;
            end;

          with IBQuery1 do //查询用户权限
          begin
            Close;
            sql.Clear;
            sql.add('select a.OPERATOR_NO,a.OPERATOR_NAME,a.OPERATOR_PASSWORD,b.user_right,c.right_caption');
            sql.Add(' from OPERATOR_xx a,user_right b,system_right c');
            sql.Add(' where a.OPERATOR_no=b.user_id and b.user_right=c.right_name and a.OPERATOR_no=:ygno and a.OPERATOR_password=:password');
            ParamByName('ygno').AsString := Trim(user_no);
            ParamByName('password').AsString := Trim(user_passowrd);
            //write_log(SQL.Text);
            Open;
            IBQuery1.First;
          end;
          if not IBQuery1.IsEmpty then
          begin
            qx_count := IBQuery1.RecordCount; //操作员所有的权限数
         // SetLength(ryqx_name, qx_count);
            while not IBQuery1.Eof do //按权限打开菜单
            begin
              for i := 0 to MainForm.MainMenu1.Items.Count - 1 do
                for j := 0 to MainForm.MainMenu1.Items[i].Count - 1 do
                begin
                  if Trim(MainForm.MainMenu1.Items[i].Items[j].name) = Trim(IBQuery1.Fields[3].AsString) then
                  begin
                    mainmenu1.Items[i].enabled := true;
                    MainForm.MainMenu1.Items[i].Items[j].Enabled := Enabled;
                 // ryqx_name[i] := IBQuery1.Fields[4].AsString;
                  //ShowMessage(ryqx_name[i]);
                  end;
                end;
//-----------打开菜单结束-----------------------
              IBQuery1.Next;
            end;
          end;
        end;
      end;
    end
    else
    begin
          //需要更新
           Application.MessageBox('发现新版本程序，将在下载后更新！', PChar('瀚文人力资源管理系统-网络版'),
      MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2 + MB_TOPMOST);
      WinExec('update.exe', SW_SHOW);
    end;
  end;
  //取0级部门-当前使用公司名称
  with IBQuery1 do
  begin
    Close;
    SQL.Text :='select bm_no,BMMC from bmxx where bm_no=''0''';
    open;
    gsmc :=IBQuery1.Fields[1].AsString;
  end;
end;
//end;

procedure TMainForm.N6Click(Sender: TObject);
begin
  is_edit := 1;
  if Frm_Addryzl = nil then Frm_Addryzl := TFrm_Addryzl.Create(self);
  Frm_Addryzl.btn_ygno.Enabled := True;
  Frm_Addryzl.lbl_is_edit.Caption := '1';
  Frm_Addryzl.Caption := '员工资料修改';
  //ShowMessage(Frm_Addryzl.lbl_is_edit.Caption);
  Frm_Addryzl.ShowModal;
end;

procedure TMainForm.N12Click(Sender: TObject);
begin
  MainForm.Close;
end;

procedure TMainForm.N10Click(Sender: TObject);
begin
  if frm_user_right = nil then frm_user_right := Tfrm_user_right.Create(self);
  frm_user_right.ShowModal;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := FormatDateTime('YYYY年mm月dd日 HH:MM:SS', Now);
end;

procedure TMainForm.N15Click(Sender: TObject);
begin
  if Frm_Change_password = nil then Frm_Change_password := TFrm_Change_password.Create(self);
  Frm_Change_password.ShowModal;
end;

procedure TMainForm.N14Click(Sender: TObject);
begin
  if Frm_operator_dy = nil then Frm_operator_dy := TFrm_operator_dy.Create(self);
  Frm_operator_dy.ShowModal;
end;

procedure TMainForm.N13Click(Sender: TObject);
var i: Integer;
begin
  Frm_Addryzl := nil;
  if Frm_qry_ryxx = nil then Frm_qry_ryxx := TFrm_qry_ryxx.Create(self);
  Frm_qry_ryxx.ShowModal;
    // else
     // Frm_qry_ryxx.mmo1.Visible :=False;
end;

procedure TMainForm.About1Click(Sender: TObject);
begin
  if Frm_About = nil then Frm_About := TFrm_About.Create(self);
  Frm_About.ShowModal;
end;

procedure TMainForm.N16Click(Sender: TObject);
begin
  if frm_changyong_cx = nil then frm_changyong_cx := Tfrm_changyong_cx.Create(self);
  frm_changyong_cx.Show;
end;

procedure TMainForm.N18Click(Sender: TObject);
begin
  is_edit := 0;
  if frm_rygzgl = nil then frm_rygzgl := Tfrm_rygzgl.Create(self);
  frm_rygzgl.Caption := '工资单录入';
  frm_rygzgl.ShowModal;

end;

procedure TMainForm.N19Click(Sender: TObject);
begin
  is_edit := 1;
  if frm_rygzgl = nil then frm_rygzgl := Tfrm_rygzgl.Create(self);
  frm_rygzgl.Caption := '工资单审核';
  frm_rygzgl.ShowModal;

end;

{在程序主窗口的implementation之前写下
var
   hnd: THandle;
在程序主窗口的end.之前写下
initialization   //比较好的防止程序再次执行语句
    hnd := CreateMutex(nil, True, 'irgendwaseinmaliges');
    if GetLastError = ERROR_ALREADY_EXISTS then Halt;
这是目前我发现的最有效防止再次运行程序的代码}

procedure TMainForm.N20Click(Sender: TObject);
begin
//is_edit :=0;
 //  if frm_rytcgl = nil then frm_rytcgl := Tfrm_rytcgl.Create(self);
 // frm_rytcgl.ShowModal;
end;

procedure TMainForm.N21Click(Sender: TObject);
begin
 // is_edit :=1;
 //  if frm_rytcgl = nil then frm_rytcgl := Tfrm_rytcgl.Create(self);
 // frm_rytcgl.ShowModal;
end;

procedure TMainForm.N25Click(Sender: TObject);
begin
  is_edit := 0;
  if frm_htgl = nil then frm_htgl := Tfrm_htgl.Create(self);
  frm_htgl.Caption := '合同管理--新增';
  frm_htgl.Show;
end;

procedure TMainForm.N26Click(Sender: TObject);
begin
  is_edit := 1;
  if frm_htgl = nil then frm_htgl := Tfrm_htgl.Create(self);
  frm_htgl.Caption := '合同管理--修改';
  frm_htgl.Show;
end;

procedure TMainForm.N27Click(Sender: TObject);
begin
  is_edit := 2;
  if frm_htgl = nil then frm_htgl := Tfrm_htgl.Create(self);
  frm_htgl.Caption := '合同管理--审核';
  frm_htgl.Show;
end;

procedure TMainForm.N29Click(Sender: TObject);
begin
  is_edit := 0; //查询模式;
  if frm_qry_htgl = nil then frm_qry_htgl := Tfrm_qry_htgl.Create(self);
  frm_qry_htgl.Show;
end;

end.

