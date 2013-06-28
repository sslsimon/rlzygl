unit Unit_set_version;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, IBC, StdCtrls, IniFiles;

type
  TForm1 = class(TForm)
    IBCConnection1: TIBCConnection;
    IBCTransaction1: TIBCTransaction;
    IBCQuery1: TIBCQuery;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function FGetFileTime(sFileName: string; TimeType: integer): TDateTime; //ȡ�ļ�����
  end;

var
  Form1: TForm1;
  PATH_SET: TIniFile;
  Server_ip, File_path: string;
  datetime: TDateTime;
implementation

{$R *.dfm}

function TForm1.FGetFileTime(sFileName: string;
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  with IBcQuery1 do //���ó���汾���̿�ʼ
  begin
    Close;
    SQL.Clear;
    sql.Add('update system_set set YXQ='+quotedstr(DateToStr(FGetFileTime('rlzy_n.exe', 1)))+',sys_time='+quotedstr(TimeToStr(FGetFileTime('rlzy_n.exe', 1))));
    ExecSQL;
  end;
  ShowMessage('���³ɹ���');
  with IBcQuery1 do //ȡϵͳ����汾���̿�ʼ
  begin
    Close;
    SQL.Clear;
    sql.Add('select YXQ,sys_time from system_set');
    Open;
  end;
  datetime := StrToDateTime(DateToStr(IBCQuery1.Fields[0].Value) + ' ' + TimeToStr(IBCQuery1.Fields[1].Value));
  Label1.Caption := '��ʷ�汾���ǣ� ' + datetimetostr(datetime);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  PATH_SET := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Path.ini'); //��INI�ļ����������ݿ�·��
  Server_ip := PATH_SET.ReadString('Spath', 'Saddress', '');
  PATH_SET.Free;
  try
    IBCConnection1.Server := '';
    IBCConnection1.Server := Server_ip;
    IBCConnection1.Connect;
  except
    Application.MessageBox('�����쳣�������δ������', PChar('����ϵͳ�汾��'),
      MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2 + MB_TOPMOST);
    Application.Terminate;
  end;
  with IBcQuery1 do //ȡϵͳ����汾���̿�ʼ
  begin
    Close;
    SQL.Clear;
    sql.Add('select YXQ,sys_time from system_set');
    Open;
  end;
  datetime := StrToDateTime(DateToStr(IBCQuery1.Fields[0].Value) + ' ' + TimeToStr(IBCQuery1.Fields[1].Value));
  Label1.Caption := '��ʷ�汾���ǣ� ' + datetimetostr(datetime);
  label2.Caption := '���°汾���ǣ� ' +datetimetostr(FGetFileTime('rlzy_n.exe', 1));
  //ShowMessage(DateToStr(FGetFileTime('rlzy_n.exe', 1)));
 // ShowMessage(TimeToStr(FGetFileTime('rlzy_n.exe', 1)));
end;

end.

