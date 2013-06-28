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
    function write_log(write_text: string): Boolean; //д�¼���־
    function FGetFileTime(sFileName: string; TimeType: integer): TDateTime; //ȡ�ļ�����
    { Public declarations }

  end;

var
  MainForm: TMainForm;
  PATH_SET: TIniFile;
  Server_ip, File_path: string;
 //  hnd: THandle;
var is_edit: Integer; //is_edit:�Ƿ��ڱ༭ģʽ ȡֵ 0����  1�༭ ,2���
  is_edit1, is_edit2, is_edit3, is_edit4, is_edit5, is_edit6: Integer; //��Ա���Ϲ����ҳ���Ƿ�༭ģʽ  ȡֵ 0����  1�༭
  gzd_shr: string;
  ryqx_name: array[0..10] of string;
 // ryqx_name: array of string ; //����Աӵ�е�Ȩ���������ڶԱ��Ƿ�������Ȩ�ޣ�
  qx_count: Integer; //����Աӵ�е�Ȩ����
  App_ver: tdatetime; //����汾�������ж��Ƿ���Ҫ����
  htdc:boolean;//��ͬ����Ȩ�ޡ�
  gsmc:string;  //0����������
implementation
uses Add_ryzl, Add_jczl, Login, user_right, Change_passowrd, Operator_dy,
  qry_ryxx, About, Changyong_cx, ry_gzgl, ry_tcgl, htgl, qry_ht;

{$R *.dfm}

function TMainForm.write_log(write_text: string): Boolean; //д�¼���־
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
 //��ȡ�ļ���Ϣ
  if h <> INVALID_HANDLE_VALUE then
  begin
  //ת��FILETIME��ʽΪlocalFILETIME��ʽ
    FileTimeToLocalFileTime(Time, lft);
  //localFILETIMEת��ΪDOStime��ʽ
    FileTimeToDosDateTime(lft, LongRec(dft).Hi, LongRec(dft).Lo);
  //ת��DOStime��ʽΪDelphi��TDateTime��ʽ
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
  Frm_Addryzl.Caption := 'Ա������¼��';
  Frm_Addryzl.ShowModal;

end;

procedure TMainForm.N8Click(Sender: TObject);
begin
  if Frm_Addjczl = nil then Frm_Addjczl := TFrm_Addjczl.Create(self);
  Frm_Addjczl.Showmodal;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var i, j: integer;
  yxq,sys_id: real; //��Ч�ڣ�����������
begin
  is_yx := 1; //��Ч�� 0 ����Ч���� 1 ����
  ShortDateFormat := 'yyyy-MM-dd';
  PATH_SET := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Path.ini'); //��INI�ļ����������ݿ�·��
  Server_ip := PATH_SET.ReadString('Spath', 'Saddress', '');
  PATH_SET.Free;
  App_ver := FGetFileTime('rlzy_n.exe', 1);
  IBCConnection1.Server := '';
  IBCConnection1.Server := Server_ip;
  try
    IBCConnection1.Connect;
  except
    Application.MessageBox('�����쳣�������δ������', PChar('���������Դ����ϵͳ-�����'),
      MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2 + MB_TOPMOST);
    Application.Terminate;
  end;
  yxq := StrToFloat(formatDateTime('yyyymmdd', Now)) * StrToFloat(formatDateTime('yyyymmdd', Now));
  with IBQuery1 do //������Ч��
  begin
    Close;
    SQL.Clear;
    sql.Add('select SYS_ID from SYS_VERSION');
    Open;
    sys_id:=IBQuery1.Fields[0].Value;
  end;
  if yxq >= IBQuery1.Fields[0].Value then //ʧЧ ��ʼ
  begin
    is_yx := 1;
    with IBQuery1 do //ȡ��������Ա��������Ա��¼Ȩ��
    begin
      Close;
      SQL.Clear;
      sql.Add('update OPERATOR_XX SET IS_LOGIN=false where OPERATOR_NO<>999');
      ExecSQL;
    end;
    ShowMessage('�ó���ִ���˷Ƿ�����');
    Application.Terminate;
  end //ʧЧ����
  else
  begin
    with IBQuery1 do //�жϳ���汾���̿�ʼ
    begin
      Close;
      SQL.Clear;
      sql.Add('select YXQ,SYS_TIME from SYSTEM_SET');
      Open;
    end;
    if App_ver >=StrToDateTime(DateToStr(IBQuery1.Fields[0].Value)+' '+timetostr(IBQuery1.Fields[1].Value))  then begin //��ǰ�����޸����ڴ������ݿ��¼���޸����� ����Ҫ����
      MainForm.Caption := Application.Title;
      MainForm.StatusBar1.Panels[3].Text := 'ID��1.' + FloatToStr(sys_id);

      Frm_Login := TFrm_Login.Create(SELF);
      //Frm_Login.Show;
      Frm_Login.ShowModal;
      StatusBar1.Panels[0].Text := '����Ա��' + user_name;
      begin
        if is_login = 0 then begin
          is_yx := 0;
          perform(WM_SIZE, SIZE_MAXIMIZED, 0); //�������
          for i := 0 to MainMenu1.Items.Count - 1 do //���в˵����
            for j := 0 to MainMenu1.Items[i].Count - 1 do
            begin
              mainmenu1.Items[i].enabled := false;
              MainMenu1.Items[i].Items[j].Enabled := false;
            end;

          with IBQuery1 do //��ѯ�û�Ȩ��
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
            qx_count := IBQuery1.RecordCount; //����Ա���е�Ȩ����
         // SetLength(ryqx_name, qx_count);
            while not IBQuery1.Eof do //��Ȩ�޴򿪲˵�
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
//-----------�򿪲˵�����-----------------------
              IBQuery1.Next;
            end;
          end;
        end;
      end;
    end
    else
    begin
          //��Ҫ����
           Application.MessageBox('�����°汾���򣬽������غ���£�', PChar('���������Դ����ϵͳ-�����'),
      MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2 + MB_TOPMOST);
      WinExec('update.exe', SW_SHOW);
    end;
  end;
  //ȡ0������-��ǰʹ�ù�˾����
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
  Frm_Addryzl.Caption := 'Ա�������޸�';
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
  StatusBar1.Panels[1].Text := FormatDateTime('YYYY��mm��dd�� HH:MM:SS', Now);
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
  frm_rygzgl.Caption := '���ʵ�¼��';
  frm_rygzgl.ShowModal;

end;

procedure TMainForm.N19Click(Sender: TObject);
begin
  is_edit := 1;
  if frm_rygzgl = nil then frm_rygzgl := Tfrm_rygzgl.Create(self);
  frm_rygzgl.Caption := '���ʵ����';
  frm_rygzgl.ShowModal;

end;

{�ڳ��������ڵ�implementation֮ǰд��
var
   hnd: THandle;
�ڳ��������ڵ�end.֮ǰд��
initialization   //�ȽϺõķ�ֹ�����ٴ�ִ�����
    hnd := CreateMutex(nil, True, 'irgendwaseinmaliges');
    if GetLastError = ERROR_ALREADY_EXISTS then Halt;
����Ŀǰ�ҷ��ֵ�����Ч��ֹ�ٴ����г���Ĵ���}

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
  frm_htgl.Caption := '��ͬ����--����';
  frm_htgl.Show;
end;

procedure TMainForm.N26Click(Sender: TObject);
begin
  is_edit := 1;
  if frm_htgl = nil then frm_htgl := Tfrm_htgl.Create(self);
  frm_htgl.Caption := '��ͬ����--�޸�';
  frm_htgl.Show;
end;

procedure TMainForm.N27Click(Sender: TObject);
begin
  is_edit := 2;
  if frm_htgl = nil then frm_htgl := Tfrm_htgl.Create(self);
  frm_htgl.Caption := '��ͬ����--���';
  frm_htgl.Show;
end;

procedure TMainForm.N29Click(Sender: TObject);
begin
  is_edit := 0; //��ѯģʽ;
  if frm_qry_htgl = nil then frm_qry_htgl := Tfrm_qry_htgl.Create(self);
  frm_qry_htgl.Show;
end;

end.

