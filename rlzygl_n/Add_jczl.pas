unit Add_jczl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, JsDbTree, DB, IBQuery, IBDatabase, Grids, DBGrids, Menus, IBTable, Mask, DBCtrls,
  IBC, MemDS, GridsEh, DBGridEh, DBAccess;

type
  TFrm_Addjczl = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ds_bmxx: TDataSource;
    JsDbTree1: TJsDbTree;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    ds_xl_dy: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    btn_add: TButton;
    btn_edit: TButton;
    ds_qry_bmxx: TDataSource;
    btn_save: TButton;
    btn_cancle: TButton;
    dbedt_bm_no: TDBEdit;
    dbedt_bmmc: TDBEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Label12: TLabel;
    Edit1: TEdit;
    Label13: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    IBCTransaction1: TIBCTransaction;
    ibqry_zw_dy: TIBCQuery;
    ibqry_xl_dy: TIBCQuery;
    ibtbl_bmxx: TIBCTable;
    ibtbl_zw_dy: TIBCTable;
    ibtbl_xl_dy: TIBCTable;
    ibqry_BMXX: TIBCQuery;
    ibtbl_zw_dyZW_NO: TIntegerField;
    ibtbl_zw_dyZWMC: TStringField;
    ibtbl_xl_dyXL_NO: TIntegerField;
    ibtbl_xl_dyXLMC: TStringField;
    ds_zwdy: TDataSource;
    IBTransaction_bmxx_edit: TIBCTransaction;
    ibcqry1: TIBCQuery;
    DBCheckBox1: TDBCheckBox;
    DBGridEh1: TDBGridEh;
    ibtbl_bmxxBM_NO: TStringField;
    ibtbl_bmxxBMMC: TStringField;
    ibtbl_bmxxIN_GZD: TBooleanField;
    ibtbl_zw_dyGWGZ: TFloatField;
    lbl1: TLabel;
    Edit3: TEdit;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid4: TDBGrid;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    ibctbl_jbdy: TIBCTable;
    ibctbl_pxlbdy: TIBCTable;
    ds_jbdy: TDataSource;
    ds_pxlbdy: TDataSource;
    ibcqry_jbdy: TIBCQuery;
    ibcqry_pxlbdy: TIBCQuery;
    ibctbl_jbdyJBNO: TIntegerField;
    ibctbl_jbdyJBNAME: TStringField;
    ibctbl_pxlbdyLBNO: TIntegerField;
    ibctbl_pxlbdyLBNAME: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_cancleClick(Sender: TObject);
    procedure refsh_date;
    procedure PageControl1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure ds_zwdyDataChange(Sender: TObject; Field: TField);
    procedure ds_xl_dyDataChange(Sender: TObject; Field: TField);
    procedure ibtbl_bmxxBeforeDelete(DataSet: TDataSet);
    procedure JsDbTree1TreeChange(Sender: TObject; Node: TTreeNode);
    procedure Button9Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure ds_jbdyDataChange(Sender: TObject; Field: TField);
    procedure ds_pxlbdyDataChange(Sender: TObject; Field: TField);
    procedure Button15Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Addjczl: TFrm_Addjczl;
  is_add: Integer; //否添加模式  0 是 1否

implementation
uses MainUnit;
{$R *.dfm}

procedure TFrm_Addjczl.refsh_date;
begin
  try
    ibtbl_bmxx.Close;
    ibtbl_zw_dy.Close;
    ibtbl_xl_dy.Close;
    ibctbl_jbdy.Close;
    ibctbl_pxlbdy.Close;

    ibtbl_bmxx.Open;
    ibtbl_zw_dy.Open;
    ibtbl_xl_dy.Open;
    ibctbl_jbdy.Open;
    ibctbl_pxlbdy.Open;

    ibtbl_bmxx.Last;
    ibtbl_zw_dy.Last;
    ibtbl_xl_dy.Last;
    ibctbl_jbdy.Last;
    ibctbl_pxlbdy.Last;

    with ibqry_BMXX do
    begin
      Close;
      SQL.Text := 'select bm_no,bmmc,in_gzd from bmxx where bm_no<>''0'' order by bm_no';
    //SQL.Text :='select bm_no, bm_no||''_''||bmmc as bmmc from bmxx where bm_no<>''0'' order by bm_no';
      open;
    end;
    JsDbTree1.TreeRefresh;
  except
  end;
end;

procedure TFrm_Addjczl.FormClose(Sender: TObject;
  var Action: TCloseAction);
var i: integer;
begin
  for i := 0 to self.componentcount - 1 do begin
    if self.components[i] is TIBCTable then
      TIBCTable(self.components[i]).Close;
    if self.components[i] is TIBCQuery then
      TIBCQuery(self.components[i]).Close;
  end;
  action := cafree;
  Frm_Addjczl := nil;
end;

procedure TFrm_Addjczl.FormCreate(Sender: TObject);
begin
  with ibqry_BMXX do
  begin
    Close;
    SQL.Text := 'select bm_no,BMMC from bmxx where bm_no=''0''';
    open;
    gsmc := ibqry_BMXX.Fields[1].AsString;
  end;
  JsDbTree1.TreeName := gsmc;
  refsh_date;
  DBCheckBox1.Enabled := false;
end;

procedure TFrm_Addjczl.btn_addClick(Sender: TObject);
begin
  dbedt_bm_no.ReadOnly := False;
  dbedt_bmmc.ReadOnly := False;
  DBGrideh1.ReadOnly := TRUE;
  btn_edit.Enabled := false;
  btn_add.Enabled := false;
  btn_save.Enabled := true;
  btn_cancle.Enabled := true;
  DBCheckBox1.Enabled := true;
  dbedt_bm_no.Clear;
  dbedt_bmmc.Clear;
  ibtbl_bmxx.Append;
  //IBTransaction_bmxx_edit.StartTransaction;
end;

procedure TFrm_Addjczl.btn_editClick(Sender: TObject);
begin
  DBGrideh1.ReadOnly := FALSE;
  btn_edit.Enabled := false;
  btn_add.Enabled := False;
  btn_save.Enabled := True;
  btn_cancle.Enabled := True;
  DBCheckBox1.Enabled := True;
  ibtbl_bmxx.Edit;
  //IBTransaction_bmxx_edit.StartTransaction;

end;

procedure TFrm_Addjczl.btn_saveClick(Sender: TObject);
begin
  DBGrideh1.ReadOnly := TRUE;
  btn_edit.Enabled := true;
  btn_add.Enabled := true;
  btn_save.Enabled := false;
  btn_cancle.Enabled := false;
  dbedt_bm_no.ReadOnly := true;
  dbedt_bmmc.ReadOnly := true;
  //ibtbl_bmxx.Post;
  try
    if ds_bmxx.State in [dsinsert, dsedit] then begin
      ibtbl_bmxx.Post;
    end;
    ShowMessage('保存成功！');
    DBCheckBox1.Enabled := false;

    IBTransaction_bmxx_edit.Commit;
  except
    ShowMessage('保存失败！');
  end;

  refsh_date;
end;

procedure TFrm_Addjczl.btn_cancleClick(Sender: TObject);
begin
  DBGrideh1.ReadOnly := TRUE;
  btn_edit.Enabled := true;
  btn_add.Enabled := true;
  btn_save.Enabled := false;
  btn_cancle.Enabled := false;
  DBCheckBox1.Enabled := false;
  ibtbl_bmxx.Cancel;
  dbedt_bm_no.ReadOnly := true;
  dbedt_bmmc.ReadOnly := true;
  IBTransaction_bmxx_edit.Rollback;
  refsh_date;
end;

procedure TFrm_Addjczl.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet1 then begin
    refsh_date;
  end;
  if PageControl1.ActivePage = TabSheet2 then begin
    refsh_date;
  end;
end;

procedure TFrm_Addjczl.Button1Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button2.Enabled := false;
  Button3.Enabled := true;
  Button4.Enabled := true;
  is_add := 0;
  Edit1.Clear;
  Edit3.Text :='0';
end;

procedure TFrm_Addjczl.Button5Click(Sender: TObject);
begin
  Button5.Enabled := false;
  Button6.Enabled := false;
  Button7.Enabled := true;
  Button8.Enabled := true;
  is_add := 0;
  Edit2.Clear;
end;

procedure TFrm_Addjczl.Button2Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button2.Enabled := false;
  Button3.Enabled := true;
  Button4.Enabled := true;
  is_add := 1;
end;

procedure TFrm_Addjczl.Button6Click(Sender: TObject);
begin
  Button5.Enabled := false;
  Button6.Enabled := false;
  Button7.Enabled := true;
  Button8.Enabled := true;
  is_add := 1;
end;

procedure TFrm_Addjczl.Button3Click(Sender: TObject);
begin
  if Edit1.Text <> '' then begin
    Button1.Enabled := true;
    Button2.Enabled := true;
    Button3.Enabled := false;
    Button4.Enabled := false;

    if is_add = 0 then //添加
    begin

      with ibqry_zw_dy do begin
        Close;
        sql.Clear;
        sql.Add('insert into ZWXX (ZWMC,GWGZ) values (:ZWMC,:GWGZ)');
        ParamByName('ZWMC').AsString := Trim(Edit1.Text);
        ParamByName('GWGZ').AsString := Trim(Edit3.Text);
        ExecSQL;
      end;

    end;
    if is_add = 1 then //修改
    begin
      with ibqry_zw_dy do begin
        Close;
        sql.Clear;
        sql.Add('update ZWXX set ZWMC=:ZWMC,GWGZ=:GWGZ where ZW_NO=' + quotedstr(ibtbl_zw_dyZW_NO.AsString));
        ParamByName('ZWMC').AsString := Trim(Edit1.Text);
        ParamByName('GWGZ').AsString := Trim(Edit3.Text);
        ExecSQL;
      end;
    end;
    try
    //IBTransaction_bmxx_edit.Commit;
      ShowMessage('保存成功！');
    except
      ShowMessage('保存失败！');
    end;
    refsh_date;
  end
  else
  begin
    ShowMessage('请输入职务名称！');
  end;

end;

procedure TFrm_Addjczl.Button4Click(Sender: TObject);
begin
  Button1.Enabled := true;
  Button2.Enabled := true;
  Button3.Enabled := false;
  Button4.Enabled := false;
end;

procedure TFrm_Addjczl.Button7Click(Sender: TObject);
begin
  Button5.Enabled := true;
  Button6.Enabled := true;
  Button7.Enabled := false;
  Button8.Enabled := false;
  if is_add = 0 then //添加
  begin
    with ibqry_zw_dy do begin
      Close;
      sql.Clear;
      sql.Add('insert into XLXX (XLMC) values (:XLMC)');
      ParamByName('XLMC').AsString := Trim(Edit2.Text);
      ExecSQL;
    end;
  end;

  if is_add = 1 then //修改
  begin
    with ibqry_zw_dy do begin
      Close;
      sql.Clear;
      sql.Add('update XLXX set XLMC=:XLMC where XL_NO=' + quotedstr(ibtbl_xl_dyXL_NO.AsString));
      ParamByName('XLMC').AsString := Trim(Edit2.Text);
      ExecSQL;
    end;
  end;
  try
   // IBTransaction_bmxx_edit.Commit;
    ShowMessage('保存成功！');

  except
    ShowMessage('保存失败！');
  end;
  refsh_date;
end;

procedure TFrm_Addjczl.Button8Click(Sender: TObject);
begin
  Button5.Enabled := true;
  Button6.Enabled := true;
  Button7.Enabled := false;
  Button8.Enabled := false;
end;

procedure TFrm_Addjczl.ds_zwdyDataChange(Sender: TObject; Field: TField);
begin
  edit1.Text := ibtbl_zw_dyZWMC.AsString;
  Edit3.Text:=ibtbl_zw_dyGWGZ.asstring;
end;

procedure TFrm_Addjczl.ds_xl_dyDataChange(Sender: TObject; Field: TField);
begin
  Edit2.Text := ibtbl_xl_dyXLMC.AsString;
end;

procedure TFrm_Addjczl.ibtbl_bmxxBeforeDelete(DataSet: TDataSet);
begin
  with ibcqry1 do begin
    Close;
    sql.Text := 'select ry_bm from ryxx where ry_bm like' + quotedstr(ibtbl_bmxx.Fields[0].asstring + '%');
    open;
  end;
  if ibcqry1.RecordCount >= 1 then begin
    Application.MessageBox('有员工属于该部门，禁止删除！', '部门定义', MB_OK +
      MB_ICONINFORMATION + MB_DEFBUTTON2);
    ibtbl_bmxx.Cancel;
    IBTransaction_bmxx_edit.Rollback;
    refsh_date;
     //IBCTransaction1.Rollback;
  end;
end;

procedure TFrm_Addjczl.JsDbTree1TreeChange(Sender: TObject;
  Node: TTreeNode);
begin
  //ShowMessage('');
end;

procedure TFrm_Addjczl.Button9Click(Sender: TObject);
begin
  Button9.Enabled := false;
  Button10.Enabled := false;
  Button11.Enabled := true;
  Button12.Enabled := true;
  is_add := 0;
  Edit4.Clear;
  Edit4.SetFocus;
end;

procedure TFrm_Addjczl.Button13Click(Sender: TObject);
begin
  Button13.Enabled := false;
  Button14.Enabled := false;
  Button15.Enabled := true;
  Button16.Enabled := true;
  is_add := 0;
  Edit5.Clear;
  Edit5.SetFocus;
end;

procedure TFrm_Addjczl.Button10Click(Sender: TObject);
begin
Button9.Enabled := false;
  Button10.Enabled := false;
  Button11.Enabled := true;
  Button12.Enabled := true;
  is_add := 1;
  Edit4.SetFocus;
end;

procedure TFrm_Addjczl.Button14Click(Sender: TObject);
begin
Button13.Enabled := false;
  Button14.Enabled := false;
  Button15.Enabled := true;
  Button16.Enabled := true;
  is_add := 1;
  Edit5.SetFocus;
end;

procedure TFrm_Addjczl.Button12Click(Sender: TObject);
begin
  Button9.Enabled := true;
  Button10.Enabled := true;
  Button11.Enabled := false;
  Button12.Enabled := false;
end;

procedure TFrm_Addjczl.Button16Click(Sender: TObject);
begin
  Button13.Enabled := true;
  Button14.Enabled := true;
  Button15.Enabled := false;
  Button16.Enabled := false;
end;

procedure TFrm_Addjczl.Button11Click(Sender: TObject);
begin
  Button9.Enabled := true;
  Button10.Enabled := true;
  Button11.Enabled := false;
  Button12.Enabled := false;
 if is_add = 0 then //添加
  begin
    with ibqry_zw_dy do begin
      Close;
      sql.Clear;
      sql.Add('insert into JBXX (JBNAME) values (:JBNAME)');
      ParamByName('JBNAME').AsString := Trim(Edit4.Text);
      ExecSQL;
    end;
  end;

  if is_add = 1 then //修改
  begin
    with ibqry_zw_dy do begin
      Close;
      sql.Clear;
      sql.Add('update JBXX set JBNAME=:JBNAME where JBNO=' + quotedstr(ibctbl_jbdyJBNO.AsString));
      ParamByName('JBNAME').AsString := Trim(Edit4.Text);
      ExecSQL;
    end;
  end;
  try
   // IBTransaction_bmxx_edit.Commit;
    ShowMessage('保存成功！');

  except
    ShowMessage('保存失败！');
  end;
  refsh_date;
end;

procedure TFrm_Addjczl.ds_jbdyDataChange(Sender: TObject; Field: TField);
begin
Edit4.Text :=ibctbl_jbdyJBNAME.AsString;
end;

procedure TFrm_Addjczl.ds_pxlbdyDataChange(Sender: TObject; Field: TField);
begin
Edit5.Text :=ibctbl_pxlbdyLBNAME.AsString;
end;

procedure TFrm_Addjczl.Button15Click(Sender: TObject);
begin
Button13.Enabled := true;
  Button14.Enabled := true;
  Button15.Enabled := false;
  Button16.Enabled := false;
 if is_add = 0 then //添加
  begin
    with ibqry_zw_dy do begin
      Close;
      sql.Clear;
      sql.Add('insert into PXLB (LBNAME) values (:LBNAME)');
      ParamByName('LBNAME').AsString := Trim(Edit5.Text);
      ExecSQL;
    end;
  end;

  if is_add = 1 then //修改
  begin
    with ibqry_zw_dy do begin
      Close;
      sql.Clear;
      sql.Add('update PXLB set LBNAME=:LBNAME where LBNO=' + quotedstr(ibctbl_pxlbdyLBNO.AsString));
      ParamByName('LBNAME').AsString := Trim(Edit5.Text);
      ExecSQL;
    end;
  end;
  try
    ShowMessage('保存成功！');

  except
    ShowMessage('保存失败！');
  end;
  refsh_date;
end;

end.

