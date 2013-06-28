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
    function FGetFileTime(sFileName: string; TimeType: integer): TDateTime; //取文件日期
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  with IBcQuery1 do //重置程序版本过程开始
  begin
    Close;
    SQL.Clear;
    sql.Add('update system_set set YXQ='+quotedstr(DateToStr(FGetFileTime('rlzy_n.exe', 1)))+',sys_time='+quotedstr(TimeToStr(FGetFileTime('rlzy_n.exe', 1))));
    ExecSQL;
  end;
  ShowMessage('更新成功！');
  with IBcQuery1 do //取系统程序版本过程开始
  begin
    Close;
    SQL.Clear;
    sql.Add('select YXQ,sys_time from system_set');
    Open;
  end;
  datetime := StrToDateTime(DateToStr(IBCQuery1.Fields[0].Value) + ' ' + TimeToStr(IBCQuery1.Fields[1].Value));
  Label1.Caption := '历史版本号是： ' + datetimetostr(datetime);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  PATH_SET := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Path.ini'); //从INI文件读设置数据库路径
  Server_ip := PATH_SET.ReadString('Spath', 'Saddress', '');
  PATH_SET.Free;
  try
    IBCConnection1.Server := '';
    IBCConnection1.Server := Server_ip;
    IBCConnection1.Connect;
  except
    Application.MessageBox('网络异常或服务器未开机！', PChar('更新系统版本号'),
      MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2 + MB_TOPMOST);
    Application.Terminate;
  end;
  with IBcQuery1 do //取系统程序版本过程开始
  begin
    Close;
    SQL.Clear;
    sql.Add('select YXQ,sys_time from system_set');
    Open;
  end;
  datetime := StrToDateTime(DateToStr(IBCQuery1.Fields[0].Value) + ' ' + TimeToStr(IBCQuery1.Fields[1].Value));
  Label1.Caption := '历史版本号是： ' + datetimetostr(datetime);
  label2.Caption := '最新版本号是： ' +datetimetostr(FGetFileTime('rlzy_n.exe', 1));
  //ShowMessage(DateToStr(FGetFileTime('rlzy_n.exe', 1)));
 // ShowMessage(TimeToStr(FGetFileTime('rlzy_n.exe', 1)));
end;

end.

