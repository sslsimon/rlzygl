unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, DB, IBCustomDataSet, IBQuery,
  IBDatabase, MemDS, IBC, DBAccess;

type
  TFrm_Login = class(TForm)
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Image1: TImage;
    IBCQuery1: TIBCQuery;
    IBCTransaction1: TIBCTransaction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Login: TFrm_Login;
  user_no, user_passowrd, user_name: string;
  is_login, is_yx: Integer; //是否确认登录，0确认，1取消结束程序  是否在有效期 0 在 1 超出
implementation
uses mainunit;
{$R *.dfm}


procedure TFrm_Login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Frm_Login := nil;
end;

procedure TFrm_Login.Button2Click(Sender: TObject);
begin
  is_login := 1;
  Application.Terminate;
end;

procedure TFrm_Login.Button1Click(Sender: TObject);
var user_is_login:Boolean;
begin
  is_login := 0;
 { user_no := '800';
  user_passowrd := '456852'; }

  user_no := edit1.text;
  user_passowrd := edit2.text;  //修改程序暂时屏蔽用户密码登录
  with IBCQuery1 do begin //查询用户是否存在或密码正确
    Close;
    SQL.Clear;
    sql.Add('select OPERATOR_NO,OPERATOR_NAME,OPERATOR_PASSWORD,IS_LOGIN from OPERATOR_XX where OPERATOR_NO=' + quotedstr(user_no) + ' and OPERATOR_password=' + quotedstr(user_passowrd));
    open;
  end;

  if not IBCQuery1.IsEmpty then
  begin
     user_name := IBCQuery1.Fieldbyname('OPERATOR_NAME').AsString;
    user_is_login := IBCQuery1.Fieldbyname('IS_LOGIN').Value;
    with IBCQuery1 do //判断用户是否允许登录或有操作权限
    begin
      Close;
      sql.Clear;
      SQL.Add('select user_id,user_right from user_right where user_id=' + quotedstr(user_no));
  {  sql.add('select a.OPERATOR_NO,a.OPERATOR_NAME,a.OPERATOR_PASSWORD,b.user_right,c.right_caption');
    sql.Add(' from OPERATOR_xx a,user_right b,system_right c');
    sql.Add(' where a.OPERATOR_no=b.user_id and b.user_right=c.right_name and a.OPERATOR_no=:ygno and a.OPERATOR_password=:password');
    if Trim(edit1.Text) = '' then
      ParamByName('ygno').AsString := '0'
    else
      ParamByName('ygno').AsString := Trim(edit1.Text);
    ParamByName('password').AsString := Trim(edit2.Text);}
      Open;
    end;
    if (user_is_login =true) and (not IBCQuery1.IsEmpty) then
    begin
      frm_login.Close;
    end
    else
    begin
      Application.MessageBox('该用户禁止登录或无操作权限！', '用户登录', MB_OK +
        MB_ICONSTOP + MB_DEFBUTTON2);
    end;
  end
  else
  begin
    Application.MessageBox('用户名或密码有误！', '用户登录', MB_OK +
      MB_ICONSTOP + MB_DEFBUTTON2);
    edit1.SetFocus;
    edit1.SelectAll;
  end;



end;



procedure TFrm_Login.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    Edit2.SetFocus;
end;

procedure TFrm_Login.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    Button1.SetFocus;
end;

end.

