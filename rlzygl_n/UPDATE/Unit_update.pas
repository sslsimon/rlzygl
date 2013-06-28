unit Unit_update;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient,
  IdTrivialFTP, IdTCPConnection, IdTCPClient, IdFTP, ComCtrls, RzStatus, IniFiles,
  DB, MemDS, DBAccess, IBC, ExtCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    IdFTP1: TIdFTP;
    RPBA: TRzProgressStatus;
    IBCConnection1: TIBCConnection;
    IBCTransaction1: TIBCTransaction;
    IBCQuery1: TIBCQuery;
    Timer1: TTimer;
    Label1: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure IdFTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function FGetFileTime(sFileName: string;
      TimeType: integer): TDateTime;
  end;

var
  Form1: TForm1;
  BytesToTransfer: LongWord;
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

procedure SetFileDateTime(FileName: string; dtDate: TDateTime);
var
  hFile: THandle;
  ModifyTime: SYSTEMTIME;
  ModifyFileTime, UpdateFileTime: FILETIME;
  sDateTime: string;
begin
  hFile := CreateFile(pChar(FileName), GENERIC_WRITE, FILE_SHARE_READ, nil, OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, 0);
  if hFile = INVALID_HANDLE_VALUE then
  begin
    Exit;
  end;
  DateTimeToSystemTime(dtDate, ModifyTime); //将日期转换为系统时间SYSTEMTIME 类型。
  SystemTimeToFileTime(ModifyTime, ModifyFileTime); //将系统时间转换为文件时间
  LocalFileTimeToFileTime(ModifyFileTime, UpdateFileTime); //转换本地日期。
  SetFileTime(hFile, @UpdateFileTime, @UpdateFileTime, @UpdateFileTime);
   //修改文件时间。第一个为：CreateTime,第二个为：最后访问时间 LastAccessTime, 第三个为:最后修改时间 LastModifyTime.
  CloseHandle(hFile);
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  try
    //datetime:=IBCQuery1.Fields[0].Value;
    IdFTP1.Host := Server_ip;
    IdFTP1.Username := 'guest';
    IdFTP1.Password := '';
    IdFTP1.Port := 21;
    IdFTP1.Connect(true, -1);
    BytesToTransfer := IdFTP1.Size('rlzy_n.exe');
    //IdFTP1.Get('rlzy_n.exe', 'rlzygl_n_new.exe', true);
    IdFTP1.Get('rlzy_n.exe', 'rlzy_n1.exe', true);
    idftp1.Disconnect;
    RenameFile('rlzy_n.exe', 'rlzy_n.exe.bak');
    RenameFile('rlzy_n1.exe', 'rlzy_n.exe');
    SetFileDateTime('rlzy_n.exe', datetime);
    ShowMessage('更新成功！');

    WinExec('rlzy_n.exe', SW_SHOW);
    DeleteFile('rlzy_n1.exe');
    Close;
    Exit;
  except
    ShowMessage('不能与服务器建立连接,更新失败！');
    DeleteFile('rlzy_n1.exe');
    Close;
    Exit;
  end;
end;

procedure TForm1.IdFTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  if BytesToTransfer > 0 then
    RPBA.Percent := 100; // strtoint(Format('%.*f', [0, (BytesToTransfer / BytesToTransfer) * 100]));
  BytesToTransfer := 0;

end;

procedure TForm1.IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin

  if BytesToTransfer > 0 then
    RPBA.Percent := strtoint(Format('%.*f', [0, (AWorkCount / BytesToTransfer) * 100]));
  application.ProcessMessages;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  PATH_SET := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Path.ini'); //从INI文件读设置数据库路径
  Server_ip := PATH_SET.ReadString('Spath', 'Saddress', '');
  PATH_SET.Free;
  Form1.Caption := '瀚文人力资源管理系统-网络版-更新程序';
  try
    IBCConnection1.Server := '';
    IBCConnection1.Server := Server_ip;
    IBCConnection1.Connect;
  except
    Application.MessageBox('网络异常或服务器未开机！', PChar('瀚文人力资源管理系统-网络版'),
      MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2 + MB_TOPMOST);
    Application.Terminate;
  end;
  with IBcQuery1 do //判断程序版本过程开始
  begin
    Close;
    SQL.Clear;
    sql.Add('select YXQ,sys_time from system_set');
    Open;
  end;
  datetime := StrToDateTime(DateToStr(IBCQuery1.Fields[0].Value) + ' ' + TimeToStr(IBCQuery1.Fields[1].Value));
  
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
Timer1.Enabled :=false;
DeleteFile('rlzy_n.exe.bak');
try
    //datetime:=IBCQuery1.Fields[0].Value;
    IdFTP1.Host := Server_ip;
    IdFTP1.Username := 'guest';
    IdFTP1.Password := '';
    IdFTP1.Port := 21;
    IdFTP1.Connect(true, -1);
    BytesToTransfer := IdFTP1.Size('rlzy_n.exe');
    //IdFTP1.Get('rlzy_n.exe', 'rlzygl_n_new.exe', true);
    IdFTP1.Get('rlzy_n.exe', 'rlzy_n1.exe', true);
    idftp1.Disconnect;
    RenameFile('rlzy_n.exe', 'rlzy_n.exe.bak');
    RenameFile('rlzy_n1.exe', 'rlzy_n.exe');
    SetFileDateTime('rlzy_n.exe', datetime);
    ShowMessage('更新成功！');
    WinExec('rlzy_n.exe', SW_SHOW);
    DeleteFile('rlzy_n1.exe');
    Application.Terminate;
  except
    ShowMessage('不能与服务器建立连接,更新失败！');
    DeleteFile('rlzy_n1.exe');
    Close;
    Exit;
  end;
end;

end.

