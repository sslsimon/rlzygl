unit Change_passowrd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, MemDS, IBC, DBAccess;

type
  TFrm_Change_password = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edt_old_passowrd: TEdit;
    Label2: TLabel;
    edt_new_password: TEdit;
    Label3: TLabel;
    edt_new_password2: TEdit;
    Button1: TButton;
    Button2: TButton;
    IBCQuery1: TIBCQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edt_old_passowrdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_new_passwordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_new_password2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Change_password: TFrm_Change_password;

implementation
uses MainUnit, Login;
{$R *.dfm}

procedure TFrm_Change_password.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
  Frm_Change_password := nil;
end;

procedure TFrm_Change_password.Button1Click(Sender: TObject);
begin
  if Trim(edt_old_passowrd.Text) <> user_passowrd then
  begin
    ShowMessage('原密码输入错误，请重新输入！');
    edt_old_passowrd.SetFocus;
    edt_old_passowrd.SelectAll;
  end
  else
    if Trim(edt_new_password.Text) <> Trim(edt_new_password2.Text) then
    begin
      ShowMessage('新旧密码输入不一致，请重新输入！');
      edt_new_password2.SetFocus;
      edt_new_password2.SelectAll;
    end
    else
    begin
      with IBCQuery1 do begin
        Close;
        sql.Clear;
        sql.Add('update operator_xx set OPERATOR_PASSWORD=:OPERATOR_PASSWORD where OPERATOR_NO=' + quotedstr(user_no));
        ParamByName('OPERATOR_PASSWORD').AsString := Trim(edt_new_password2.Text);
        ExecSQL;
      end;      
      ShowMessage('修改密码成功！')
    end;
end;

procedure TFrm_Change_password.Button2Click(Sender: TObject);
begin
  Frm_Change_password.Close;
end;

procedure TFrm_Change_password.edt_old_passowrdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    edt_new_password.SetFocus;
end;

procedure TFrm_Change_password.edt_new_passwordKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    edt_new_password2.SetFocus;
end;

procedure TFrm_Change_password.edt_new_password2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    Button1.SetFocus;
end;

procedure TFrm_Change_password.FormShow(Sender: TObject);
begin
  edt_old_passowrd.SetFocus;
end;

end.
