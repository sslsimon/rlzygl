unit Operator_dy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids, DBGrids, IBDatabase,
  DB, IBCustomDataSet, IBTable, IBQuery, IBC, MemDS, DBAccess, GridsEh,
  DBGridEh;

type
  TFrm_operator_dy = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btn_add: TButton;
    btn_edit: TButton;
    btn_save: TButton;
    btn_cancle: TButton;
    DBGrid1: TDBGrid;
    Label11: TLabel;
    Label10: TLabel;
    DataSource1: TDataSource;
    edt_operator_name: TEdit;
    edt_operator_password: TEdit;
    Label1: TLabel;
    lbl_operator_no: TLabel;
    IBCQuery1: TIBCQuery;
    IBCTable1: TIBCTable;
    IBCTransaction1: TIBCTransaction;
    edt1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_addClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_cancleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure refsh_date;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_operator_dy: TFrm_operator_dy;
  is_add: Integer; //否添加模式  0 是 1否
implementation
uses MainUnit;
{$R *.dfm}

procedure tfrm_operator_dy.refsh_date;
begin
  IBCTable1.Close;
  IBCTable1.Open;
  IBCTable1.Last;
end;

procedure TFrm_operator_dy.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IBCTable1.Close;
  Action := caFree;
  Frm_operator_dy := nil;//
end;

procedure TFrm_operator_dy.btn_addClick(Sender: TObject);
begin
  is_add := 0;
  btn_add.Enabled := false;
  btn_edit.Enabled := False;
  DBGrid1.Enabled := false;
  btn_save.Enabled := True;
  btn_cancle.Enabled := True;
    edt1.Enabled :=true;
  edt_operator_name.Enabled :=true;
  edt_operator_password.Enabled :=true;
   edt1.Clear;
  edt_operator_name.Clear;
  edt_operator_password.Clear;
  edt1.SetFocus;
  //edt_operator_name.SetFocus;

end;

procedure TFrm_operator_dy.btn_editClick(Sender: TObject);
begin
  btn_add.Enabled := false;
  btn_edit.Enabled := False;
  //DBGrid1.Enabled := false;
  btn_save.Enabled := True;
  btn_cancle.Enabled := True;

  edt1.Enabled :=False;
  edt_operator_name.Enabled :=true;
  edt_operator_password.Enabled :=true;
   edt_operator_name.SetFocus;
  is_add := 1;
end;

procedure TFrm_operator_dy.btn_saveClick(Sender: TObject);
begin
  btn_add.Enabled := True;
  btn_edit.Enabled := True;
  DBGrid1.Enabled := True;
  btn_save.Enabled := false;
  btn_cancle.Enabled := false;
    edt1.Enabled :=false;
  edt_operator_name.Enabled :=False;
  edt_operator_password.Enabled :=false;
  if is_add = 0 then //添加
  begin

    with IBCQuery1 do begin
      close;
      sql.Clear;
      sql.Add('insert into operator_xx (operator_no,OPERATOR_NAME,OPERATOR_PASSWORD) values (:operator_no,:OPERATOR_NAME,:OPERATOR_PASSWORD)');
      ParamByName('operator_no').AsString := edt1.Text;
      ParamByName('OPERATOR_NAME').AsString := edt_operator_name.Text;
      ParamByName('OPERATOR_PASSWORD').AsString := edt_operator_password.Text;
      ExecSQL;
      ShowMessage('保存成功');
    end;
  end;
  if is_add = 1 then //修改
  begin
    with IBCQuery1 do begin
      close;
      sql.Clear;
      sql.Add('update operator_xx set OPERATOR_NAME=:OPERATOR_NAME,OPERATOR_PASSWORD=:OPERATOR_PASSWORD where OPERATOR_NO=' + quotedstr(lbl_operator_no.Caption));
      ParamByName('OPERATOR_NAME').AsString := edt_operator_name.Text;
      ParamByName('OPERATOR_PASSWORD').AsString := edt_operator_password.Text;
      ExecSQL;
      ShowMessage('保存成功');
    end;
  end;
refsh_date;
end;

procedure TFrm_operator_dy.btn_cancleClick(Sender: TObject);
begin
     edt1.Enabled :=false;
  edt_operator_name.Enabled :=False;
  edt_operator_password.Enabled :=false;
  btn_add.Enabled := True;
  btn_edit.Enabled := True;
  DBGrid1.Enabled := True;
  btn_save.Enabled := false;
  btn_cancle.Enabled := false;

  //IBTable1.Cancel;
  //IBCTransaction1.Rollback;
  refsh_date;
end;

procedure TFrm_operator_dy.FormCreate(Sender: TObject);
begin
  refsh_date;
  edt1.Enabled :=false;
  edt_operator_name.Enabled :=False;
  edt_operator_password.Enabled :=false;
end;

procedure TFrm_operator_dy.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  lbl_operator_no.Caption := IBCTable1.Fields[0].AsString;
  edt1.Text :=IBCTable1.Fields[0].AsString;
  edt_operator_name.Text := IBCTable1.Fields[1].AsString;
  edt_operator_password.Text := IBCTable1.Fields[2].AsString;
end;

procedure TFrm_operator_dy.FormDestroy(Sender: TObject);
begin
 // Frm_operator_dy := nil;
end;

end.

