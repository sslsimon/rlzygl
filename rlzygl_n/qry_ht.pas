unit qry_ht;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, GridsEh, DBGridEh, StdCtrls, DB, MemDS, IBC,
  ComCtrls, DBAccess, Mask, RzEdit, RzLstBox, RzChkLst, Menus, DBGridEhImpExp;

type
  Tfrm_qry_htgl = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    IBCTransaction1: TIBCTransaction;
    IBCQuery1: TIBCQuery;
    DataSource1: TDataSource;
    Button1: TButton;
    edt_ht_code: TEdit;
    edt_ht_name: TEdit;
    edt_ppmc: TEdit;
    Shape1: TShape;
    edt_ht_zydz: TEdit;
    dtp_ht_sxrq: TRzDateTimeEdit;
    dtp_ht_jsrq: TRzDateTimeEdit;
    chk_ppmc: TCheckBox;
    chk_ht_name: TCheckBox;
    chk_htzydz: TCheckBox;
    chk_ht_code: TCheckBox;
    chk_ht_qx: TCheckBox;
    btn1: TButton;
    IBCQuery1HT_ID: TIntegerField;
    IBCQuery1HT_CODE: TStringField;
    IBCQuery1PPMC: TStringField;
    IBCQuery1HT_NAME: TStringField;
    IBCQuery1HTLB: TStringField;
    IBCQuery1HTXZ: TStringField;
    IBCQuery1QYJF: TStringField;
    IBCQuery1QYYF: TStringField;
    IBCQuery1HT_QSRQ: TDateField;
    IBCQuery1HT_SXRQ: TDateField;
    IBCQuery1HT_JSRQ: TDateField;
    IBCQuery1HTZYDZ: TStringField;
    IBCQuery1HT_HZTZ: TStringField;
    IBCQuery1HT_JBR: TStringField;
    IBCQuery1HT_CFDD: TStringField;
    IBCQuery1HTKD: TStringField;
    IBCQuery1HTBD: TStringField;
    IBCQuery1HTFC: TStringField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure chk_ppmcClick(Sender: TObject);
    procedure chk_ht_nameClick(Sender: TObject);
    procedure chk_htzydzClick(Sender: TObject);
    procedure chk_ht_codeClick(Sender: TObject);
    procedure chk_ht_qxClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SortQueryeh(Columneh: TColumnEh);
  public
    { Public declarations }

  end;

var
  frm_qry_htgl: Tfrm_qry_htgl;

implementation
uses MainUnit, htgl;
{$R *.dfm}

procedure Tfrm_qry_htgl.SortQueryeh(Columneh: TColumnEh);
var
  SqlStr, myFieldName, TempStr: string;
  OrderPos: integer;
  SavedParams: TParams;
  ii: integer;
  cStr: string;
  c: TColumnEh;
begin
 { for ii := 0 to tdbgrideh(ColumnEh.Grid).Columns.Count - 1 do
   begin
     c := tdbgrideh(ColumnEh.Grid).Columns[ii];
     cStr := c.Title.Caption;
     if (pos('▲',cStr ) = 1) or (pos('▼',cStr ) = 1) then begin
       Delete(cStr, 1, 2);
       c.Title.Caption := cStr;
     end;
   end; }

  if not (ColumnEh.Field.FieldKind in [fkData, fkLookup]) then exit;
  if ColumnEh.Field.FieldKind = fkData then
    myFieldName := UpperCase(ColumnEh.Field.FieldName)
  else
    myFieldName := UpperCase(ColumnEh.Field.KeyFields);
  while Pos(myFieldName, ';') <> 0 do
    myFieldName := copy(myFieldName, 1, Pos(myFieldName, ';') - 1) + ',' + copy(myFieldName, Pos(myFieldName, ';') + 1, 100);
  with TIBCQuery(tdbgrideh(ColumnEh.Grid).DataSource.DataSet) do
  begin
    SqlStr := UpperCase(Sql.Text);
   // if pos(myFieldName,SqlStr)=0 then exit;
    if ParamCount > 0 then
    begin
      SavedParams := TParams.Create;
      SavedParams.Assign(Params);
    end;
    OrderPos := pos('ORDER', SqlStr);
    if (OrderPos = 0) or (pos(myFieldName, copy(SqlStr, OrderPos, 100)) = 0) then
    begin
      TempStr := ' Order By ' + myFieldName + ' Asc';
   // ColumnEh.Title.Caption :='▲'+ColumnEh.Title.Caption;
    end
    else if pos('ASC', SqlStr) = 0 then
    begin
      TempStr := ' Order By ' + myFieldName + ' Asc';
   //  ColumnEh.Title.Caption := '▲'+ColumnEh.Title.Caption;
    end
    else
    begin
      TempStr := ' Order By ' + myFieldName + ' Desc';
   //  ColumnEh.Title.Caption :='▼'+ ColumnEh.Title.Caption;
    end;
    if OrderPos <> 0 then SqlStr := Copy(SqlStr, 1, OrderPos - 1);
    SqlStr := SqlStr + TempStr;
    Active := False;
    Sql.Clear;
    Sql.Text := SqlStr;
    if ParamCount > 0 then
    begin
      Params.AssignValues(SavedParams);
      SavedParams.Free;
    end;
    Prepare;
    Open;
  end;
end;

procedure Tfrm_qry_htgl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
  frm_qry_htgl := nil;
end;

procedure Tfrm_qry_htgl.Button1Click(Sender: TObject);
begin
  if edt_ppmc.text <> '' then
  begin
    with IBCQuery1 do begin
      Close;
      sql.Clear;
      sql.Add('select * from htgl where ppmc like ' + quotedstr('%' + edt_ppmc.Text + '%'));
      open;
    end;
    Exit;
  end;
  if edt_ht_name.text <> '' then
  begin
    with IBCQuery1 do begin
      Close;
      sql.Clear;
      sql.Add('select * from htgl where ht_name like ' + quotedstr('%' + edt_ht_name.Text + '%'));
      open;
    end;
    Exit;
  end;
  if edt_ht_zydz.text <> '' then
  begin
    with IBCQuery1 do begin
      Close;
      sql.Clear;
      sql.Add('select * from htgl where HTZYDZ like ' + quotedstr('%' + edt_ht_zydz.Text + '%'));
      open;
    end;
    Exit;
  end;
  if dtp_ht_sxrq.Text <> '' then
  begin
    if dtp_ht_jsrq.Text <> '' then
    begin
      with IBCQuery1 do begin
        Close;
        sql.Clear;
        sql.Add('select * from htgl where HT_SXRQ >= ' + quotedstr(DateToStr(dtp_ht_sxrq.Date)) + ' and HT_JSRQ <= ' + quotedstr(DateToStr(dtp_ht_jsrq.Date)));
        open;
      end;
    end
    else
    begin
      with IBCQuery1 do begin
        Close;
        sql.Clear;
        sql.Add('select * from htgl where HT_SXRQ >= ' + quotedstr(DateToStr(dtp_ht_sxrq.Date)));
        open;
      end;
      Exit;
    end { ;
  end;
  if (DateToStr(dtp_ht_sxrq.Date) <> '1900-01-01') or (DateToStr(dtp_ht_jsrq.Date) <> '1900-01-01')then
  begin
    with IBCQuery1 do begin
      Close;
      sql.Clear;
      sql.Add('select * from htgl where HT_SXRQ >= ' + quotedstr(DateToStr(dtp_ht_sxrq.Date))+' and HT_JSRQ <= '+ quotedstr(DateToStr(dtp_ht_jsrq.Date)));
      open;
    end;
    Exit;}
  end
  else //不填写条件，查询所有
  begin
    with IBCQuery1 do begin
      Close;
      sql.Clear;
      sql.Add('select * from htgl');
      open;
    end;
  end;
end;

procedure Tfrm_qry_htgl.DBGridEh1DblClick(Sender: TObject);
begin
  if is_edit = 1 then
  begin
    frm_qry_htgl.Close;
    frm_htgl.edt_ht_id.Text := IBCQuery1.fieldbyname('ht_id').Value;
    frm_htgl.edt_ht_code.Text := IBCQuery1.fieldbyname('ht_code').Value;
    frm_htgl.edt_ppmc.Text := IBCQuery1.fieldbyname('ppmc').Value;
    frm_htgl.edt_ht_name.Text := IBCQuery1.fieldbyname('HT_NAME').Value;

    if IBCQuery1.fieldbyname('HTLB').Value = '经营合同' then
      frm_htgl.cbb_htlb.ItemIndex := 0;
    if IBCQuery1.fieldbyname('HTLB').Value = '品牌合同' then
      frm_htgl.cbb_htlb.ItemIndex := 1;
    if IBCQuery1.fieldbyname('HTLB').Value = '装修合同' then
      frm_htgl.cbb_htlb.ItemIndex := 2;
    if IBCQuery1.fieldbyname('HTLB').Value = '办公/仓库租赁合同' then
      frm_htgl.cbb_htlb.ItemIndex := 3;
    if IBCQuery1.fieldbyname('HTLB').Value = '物流外包合同' then
      frm_htgl.cbb_htlb.ItemIndex := 4;
    if IBCQuery1.fieldbyname('HTLB').Value = '并购合资合同' then
      frm_htgl.cbb_htlb.ItemIndex := 5;
    if IBCQuery1.fieldbyname('HTLB').Value = '其它' then
      frm_htgl.cbb_htlb.ItemIndex := 6;

    if IBCQuery1.fieldbyname('HTXZ').Value = '新签' then
      frm_htgl.cbb_htxz.ItemIndex := 0;
    if IBCQuery1.fieldbyname('HTXZ').Value = '续约' then
      frm_htgl.cbb_htxz.ItemIndex := 1;

    frm_htgl.edt_qyjf.Text := IBCQuery1.fieldbyname('QYJF').Value;
    frm_htgl.edt_qyyf.Text := IBCQuery1.fieldbyname('QYYF').Value;
    frm_htgl.dtp_ht_qsrq.Date := IBCQuery1.fieldbyname('HT_QSRQ').Value;
    frm_htgl.dtp_ht_sxrq.Date := IBCQuery1.fieldbyname('HT_SXRQ').Value;
    frm_htgl.dtp_ht_jsrq.Date := IBCQuery1.fieldbyname('HT_JSRQ').Value;
    frm_htgl.edt_ht_zydz.Text := IBCQuery1.fieldbyname('HTZYDZ').Value;
    frm_htgl.mmo_ht_hztj.Text := IBCQuery1.fieldbyname('HT_HZTZ').Value;
    frm_htgl.edt_ht_jbr.Text := IBCQuery1.fieldbyname('HT_JBR').Value;
    frm_htgl.edt_ht_cfdd.Text := IBCQuery1.fieldbyname('HT_CFDD').Value;
    frm_htgl.edt_kd.Text := IBCQuery1.fieldbyname('HTKD').Value;
    frm_htgl.edt_bd.Text := IBCQuery1.fieldbyname('HTBD').Value;
    frm_htgl.edt_fc.Text := IBCQuery1.fieldbyname('HTFC').Value;


  end;
  if is_edit = 0 then
  begin
    if frm_htgl = nil then frm_htgl := Tfrm_htgl.Create(Self);

    frm_htgl.Show;
    frm_htgl.BorderStyle := bsSizeToolWin;
    frm_htgl.btn_add_ht.Enabled := false;
    frm_htgl.edt_ht_id.Text := IBCQuery1.fieldbyname('ht_id').Value;
    frm_htgl.edt_ht_code.Text := IBCQuery1.fieldbyname('ht_code').Value;
    frm_htgl.edt_ppmc.Text := IBCQuery1.fieldbyname('ppmc').Value;
    frm_htgl.edt_ht_name.Text := IBCQuery1.fieldbyname('HT_NAME').Value;

    if IBCQuery1.fieldbyname('HTLB').Value = '经营合同' then
      frm_htgl.cbb_htlb.ItemIndex := 0;
    if IBCQuery1.fieldbyname('HTLB').Value = '品牌合同' then
      frm_htgl.cbb_htlb.ItemIndex := 1;
    if IBCQuery1.fieldbyname('HTLB').Value = '装修合同' then
      frm_htgl.cbb_htlb.ItemIndex := 2;
    if IBCQuery1.fieldbyname('HTLB').Value = '办公/仓库租赁合同' then
      frm_htgl.cbb_htlb.ItemIndex := 3;
    if IBCQuery1.fieldbyname('HTLB').Value = '物流外包合同' then
      frm_htgl.cbb_htlb.ItemIndex := 4;
    if IBCQuery1.fieldbyname('HTLB').Value = '并购合资合同' then
      frm_htgl.cbb_htlb.ItemIndex := 5;
    if IBCQuery1.fieldbyname('HTLB').Value = '其它' then
      frm_htgl.cbb_htlb.ItemIndex := 6;

    if IBCQuery1.fieldbyname('HTXZ').Value = '新签' then
      frm_htgl.cbb_htxz.ItemIndex := 0;
    if IBCQuery1.fieldbyname('HTXZ').Value = '续约' then
      frm_htgl.cbb_htxz.ItemIndex := 1;

    frm_htgl.edt_qyjf.Text := IBCQuery1.fieldbyname('QYJF').Value;
    frm_htgl.edt_qyyf.Text := IBCQuery1.fieldbyname('QYYF').Value;
    frm_htgl.dtp_ht_qsrq.Date := IBCQuery1.fieldbyname('HT_QSRQ').Value;
    frm_htgl.dtp_ht_sxrq.Date := IBCQuery1.fieldbyname('HT_SXRQ').Value;
    frm_htgl.dtp_ht_jsrq.Date := IBCQuery1.fieldbyname('HT_JSRQ').Value;
    frm_htgl.edt_ht_zydz.Text := IBCQuery1.fieldbyname('HTZYDZ').Value;
    frm_htgl.mmo_ht_hztj.Text := IBCQuery1.fieldbyname('HT_HZTZ').Value;
    frm_htgl.edt_ht_jbr.Text := IBCQuery1.fieldbyname('HT_JBR').Value;
    frm_htgl.edt_ht_cfdd.Text := IBCQuery1.fieldbyname('HT_CFDD').Value;
    frm_htgl.edt_kd.Text := IBCQuery1.fieldbyname('HTKD').Value;
    frm_htgl.edt_bd.Text := IBCQuery1.fieldbyname('HTBD').Value;
    frm_htgl.edt_fc.Text := IBCQuery1.fieldbyname('HTFC').Value;

  end;
end;

procedure Tfrm_qry_htgl.DBGridEh1TitleClick(Column: TColumnEh);
begin
  SortQueryeh(Column);
end;

procedure Tfrm_qry_htgl.FormShow(Sender: TObject);
var i: integer;
begin
  for i := 0 to self.componentcount - 1 do begin //设置组件属性
    if self.components[i] is Tedit then
    begin
      Tedit(self.components[i]).Color := clBtnFace;
      Tedit(self.components[i]).Enabled := False;
    end;
  end;
  dtp_ht_sxrq.Enabled := false;
  dtp_ht_jsrq.Enabled := false;
  if MainForm.N23.Enabled = Enabled then //判断是否有合同导出权限
    N1.Enabled := True //有  右键导出菜单可用
  else
    N1.Enabled := False; //没有 右键导出菜单不可用
end;

procedure Tfrm_qry_htgl.btn1Click(Sender: TObject);
var i: integer;
begin
  for i := 0 to self.componentcount - 1 do begin //设置组件属性
    if self.components[i] is TCheckBox then
    begin
      TCheckBox(self.components[i]).Checked := false;
    end;
    if self.components[i] is Tedit then
    begin
      Tedit(self.components[i]).Clear;
    end;
  end;
  dtp_ht_sxrq.Clear;
  dtp_ht_jsrq.Clear;
  dtp_ht_sxrq.Enabled := False;
  dtp_ht_jsrq.Enabled := False;
end;

procedure Tfrm_qry_htgl.chk_ppmcClick(Sender: TObject);
begin
  if chk_ppmc.Checked then
  begin
    edt_ppmc.Enabled := True;
    edt_ppmc.Color := clWindow;
  end
  else
  begin
    edt_ppmc.Enabled := False;
    edt_ppmc.Color := clBtnFace;
  end;
end;

procedure Tfrm_qry_htgl.chk_ht_nameClick(Sender: TObject);
begin
  if chk_ht_name.Checked then
  begin
    edt_ht_name.Enabled := True;
    edt_ht_name.Color := clWindow;
  end
  else
  begin
    edt_ht_name.Enabled := False;
    edt_ht_name.Color := clBtnFace;
  end;
end;

procedure Tfrm_qry_htgl.chk_htzydzClick(Sender: TObject);
begin
  if chk_htzydz.Checked then
  begin
    edt_ht_zydz.Enabled := True;
    edt_ht_zydz.Color := clWindow;
  end
  else
  begin
    edt_ht_zydz.Enabled := False;
    edt_ht_zydz.Color := clBtnFace;
  end;
end;

procedure Tfrm_qry_htgl.chk_ht_codeClick(Sender: TObject);
begin
  if chk_ht_code.Checked then
  begin
    edt_ht_code.Enabled := True;
    edt_ht_code.Color := clWindow;
  end
  else
  begin
    edt_ht_code.Enabled := False;
    edt_ht_code.Color := clBtnFace;
  end;
end;

procedure Tfrm_qry_htgl.chk_ht_qxClick(Sender: TObject);
begin
  if chk_ht_qx.Checked then
  begin
    dtp_ht_sxrq.Enabled := True;
    dtp_ht_jsrq.Enabled := True;
  end
  else
  begin
    dtp_ht_sxrq.Enabled := False;
    dtp_ht_jsrq.Enabled := False;
  end;
end;

procedure Tfrm_qry_htgl.N1Click(Sender: TObject);
begin
  if IBCQuery1.Active = true then
  begin
    if SaveDialog1.Execute then
    begin
      SaveDBGridEhToExportFile(TdbGridEhExportAsXls, DBGridEh1, SaveDialog1.FileName, true);
      Application.MessageBox('导出成功！', '数据导出', MB_OK);
    end;
  end;
end;

end.

