unit ry_tcgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, IBC, DB, MemDS, DBAccess,
  frxClass, frxDBSet, frxExportPDF, DateUtils, StrUtils, GridsEh, DBGridEh;

type
  Tfrm_rytcgl = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btn_edit: TButton;
    btn_del: TButton;
    btn_save: TButton;
    btn_cancel: TButton;
    btn_sh: TButton;
    IBCDataSource1: TIBCDataSource;
    IBCTable1: TIBCTable;
    IBCTransaction1: TIBCTransaction;
    Label7: TLabel;
    ComboBox1: TComboBox;
    IBCTable1GZD_MONTH: TStringField;
    IBCTable1BM_NO: TStringField;
    IBCTable1RY_NO: TIntegerField;
    IBCTable1GWGZ: TFloatField;
    IBCTable1CQQK: TStringField;
    IBCTable1QQ: TFloatField;
    IBCTable1GLGZ: TFloatField;
    IBCTable1QQQK: TFloatField;
    IBCTable1DHBZ: TFloatField;
    IBCTable1BF: TFloatField;
    IBCTable1DK: TFloatField;
    IBCTable1SBDK: TFloatField;
    IBCTable1YFJE: TFloatField;
    IBCTable1SFJE: TFloatField;
    IBCTable1BZ: TStringField;
    IBCTable1ID: TIntegerField;
    Ibcqry_bmxx: TIBCQuery;
    Label8: TLabel;
    cbb_dw: TComboBox;
    lbl_dw_no: TLabel;
    Label9: TLabel;
    cbb_bm: TComboBox;
    lbl_bm_no: TLabel;
    Label10: TLabel;
    cbb_xsbm: TComboBox;
    lbl_xsbm_no: TLabel;
    IBCTable1RY_NAME: TStringField;
    Label11: TLabel;
    lbl_xgr: TLabel;
    Label12: TLabel;
    lbl_xgrq: TLabel;
    Label14: TLabel;
    lbl_shrq: TLabel;
    Label13: TLabel;
    lbl_shr: TLabel;
    Label1: TLabel;
    lbl_gzd_zt: TLabel;
    ibcqry_gzd: TIBCQuery;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    IBCQuery1: TIBCQuery;
    frxDBDataset2: TfrxDBDataset;
    btn1: TButton;
    btn_print: TButton;
    IBCDataSource2: TIBCDataSource;
    Button1: TButton;
    frxDBDataset3: TfrxDBDataset;
    Panel4: TPanel;
    Button2: TButton;
    edt_ryno: TEdit;
    lbl_name: TLabel;
    lbl_glgz: TLabel;
    btn_ryno: TButton;
    frxrprt_BM: TfrxReport;
    DBGridEh1: TDBGridEh;
    frxrprt_BM_HJ: TfrxReport;
    frxrprt_HJ: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cbb_dwSelect(Sender: TObject);
    procedure cbb_bmSelect(Sender: TObject);
    procedure cbb_xsbmSelect(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure btn_printClick(Sender: TObject);
    procedure btn_delClick(Sender: TObject);
    procedure IBCTable1AfterOpen(DataSet: TDataSet);
    procedure btn1Click(Sender: TObject);
    procedure btn_shClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edt_rynoExit(Sender: TObject);
    procedure btn_rynoClick(Sender: TObject);
    procedure edt_rynoKeyPress(Sender: TObject; var Key: Char);
    procedure Panel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_rytcgl: Tfrm_rytcgl;

implementation
uses MainUnit, Login,ryzl_qry_edit;
{$R *.dfm}

procedure Tfrm_rytcgl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IBCTable1.close;
  Ibcqry_bmxx.Close;
  Action := caFree;
  frm_rytcgl := nil;
end;

procedure Tfrm_rytcgl.FormCreate(Sender: TObject);
var my_month: array[0..11] of string;
  i: integer;
begin
 // ShowMessage(f(incyear(date)));
  my_month[0] := '01';
  my_month[1] := '02';
  my_month[2] := '03';
  my_month[3] := '04';
  my_month[4] := '05';
  my_month[5] := '06';
  my_month[6] := '07';
  my_month[7] := '08';
  my_month[8] := '09';
  my_month[9] := '10';
  my_month[10] := '11';
  my_month[11] := '12';
  ComboBox1.Clear;
  lbl_name.Caption := '';
  lbl_glgz.Caption := '0';
  for i := Low(my_month) to High(my_month) do
  begin
    ComboBox1.Items.Add(FormatDateTime('yyyy', date) + my_month[i]);
  end;
  btn_edit.Enabled := False;
  btn_del.Enabled := False;
  btn_sh.Enabled := False;
  btn_ryno.Enabled :=False;
  ComboBox1.ItemIndex := -1;
  lbl_xgr.Caption := User_Name;
  lbl_shr.Caption := User_Name;
  lbl_xgrq.Caption := FormatDateTime('YYYY-MM-DD hh:mm:ss', now);
  lbl_shrq.Caption := '';

  with ibcqry_bmxx do begin //取单位信息
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr('__') + ' order by bm_no');
    Open;
  end;
  cbb_dw.Items.Clear;
  while not ibcqry_bmxx.Eof do
  begin
    cbb_dw.Items.Add(ibcqry_bmxx.Fields[1].AsString);
    ibcqry_bmxx.Next;
  end;
  cbb_dw.ItemIndex := 0;
  with ibcqry_bmxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bmmc=' + quotedstr(cbb_dw.Text));
    Open;
  end;
  lbl_dw_no.Caption := ibcqry_bmxx.Fields[0].AsString;
  lbl_bm_no.Caption := ibcqry_bmxx.Fields[0].AsString;
  with ibcqry_bmxx do begin //取部门信息
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr(lbl_dw_no.Caption + '.__') + ' order by bm_no');
    Open;
  end;
  cbb_bm.Items.Clear;
  while not ibcqry_bmxx.Eof do
  begin
    cbb_bm.Items.Add(ibcqry_bmxx.Fields[1].AsString);
    ibcqry_bmxx.Next;
  end;

  with ibcqry_bmxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr('__.__.__') + ' order by bm_no');
    Open;
  end;
  cbb_xsbm.Items.Clear;
  while not ibcqry_bmxx.Eof do
  begin
    cbb_xsbm.Items.Add(ibcqry_bmxx.Fields[1].AsString);
    ibcqry_bmxx.Next;
  end;

end;

procedure Tfrm_rytcgl.cbb_dwSelect(Sender: TObject);
begin
  if ComboBox1.ItemIndex = -1 then
  begin
    Application.MessageBox('请选择工资年月', '工资管理', MB_OK +
      MB_ICONINFORMATION);
    ComboBox1.SetFocus;
  end
  else
  begin
    lbl_bm_no.Caption := '0';
    lbl_xsbm_no.Caption := '0';
    cbb_bm.Clear;
    cbb_xsbm.Clear;
    with ibcqry_bmxx do begin
      Close;
      sql.Clear;
      sql.Add('select * from bmxx where bmmc=' + quotedstr(cbb_dw.Text));
      Open;
    end;
    lbl_dw_no.Caption := ibcqry_bmxx.Fields[0].AsString;
    lbl_bm_no.Caption :=ibcqry_bmxx.Fields[0].AsString;
    with ibcqry_bmxx do begin
      Close;
      sql.Clear;
      sql.Add('select * from bmxx where bm_no like ' + quotedstr(lbl_dw_no.Caption + '.__'));
      Open;
    end;
    while not ibcqry_bmxx.Eof do
    begin
      cbb_bm.Items.Add(ibcqry_bmxx.Fields[1].AsString);
      ibcqry_bmxx.Next;
    end;
    IBCTable1.Close;
    IBCTable1.Open;
    IBCTable1.Filter := 'BM_NO like ' + QuotedStr(lbl_DW_no.Caption+'%') + ' and GZD_MONTH=' + QuotedStr(ComboBox1.Text);
    IBCTable1.Filtered := true;
  end;
end;

procedure Tfrm_rytcgl.cbb_bmSelect(Sender: TObject);
begin
  if ComboBox1.ItemIndex = -1 then
  begin
    Application.MessageBox('请选择工资年月', '工资管理', MB_OK +
      MB_ICONINFORMATION);
    ComboBox1.SetFocus;
  end
  else
  begin
    lbl_xsbm_no.Caption := '0';
    cbb_xsbm.Items.Clear;
    with ibcqry_bmxx do begin
      Close;
      sql.Clear;
      sql.Add('select * from bmxx where bmmc=' + quotedstr(cbb_bm.Text));
      Open;
    end;
    lbl_bm_no.Caption := ibcqry_bmxx.Fields[0].AsString;

    with ibcqry_bmxx do begin
      Close;
      sql.Clear;
      sql.Add('select * from bmxx where bm_no like ' + quotedstr(lbl_bm_no.Caption + '.%'));
      Open;
    end;
    while not ibcqry_bmxx.Eof do
    begin
      cbb_xsbm.Items.Add(ibcqry_bmxx.Fields[1].AsString);
      ibcqry_bmxx.Next;
    end;

    IBCTable1.Close;
    IBCTable1.Open;
    IBCTable1.Filter := 'BM_NO like' + QuotedStr(lbl_bm_no.Caption+'%') + ' and GZD_MONTH=' + QuotedStr(ComboBox1.Text);
    IBCTable1.Filtered := true;
  end;
end;

procedure Tfrm_rytcgl.cbb_xsbmSelect(Sender: TObject);
begin
  if ComboBox1.ItemIndex = -1 then
  begin
    Application.MessageBox('请选择工资年月', '工资管理', MB_OK +
      MB_ICONINFORMATION);
    ComboBox1.SetFocus;
  end
  else
  begin
    with ibcqry_bmxx do begin
      Close;
      sql.Clear;
      sql.Add('select * from bmxx where bmmc=' + quotedstr(cbb_xsbm.Text));
      Open;
    end;
    lbl_xsbm_no.Caption := ibcqry_bmxx.Fields[0].AsString;
    lbl_bm_no.Caption :=ibcqry_bmxx.Fields[0].AsString;
    IBCTable1.Close;
    IBCTable1.Open;
    IBCTable1.Filter := 'BM_NO like' + QuotedStr(lbl_xsbm_no.Caption+'%') + ' and GZD_MONTH=' + QuotedStr(ComboBox1.Text);
    IBCTable1.Filtered := true;
  end;
end;

procedure Tfrm_rytcgl.btn_editClick(Sender: TObject);
begin
  btn_edit.Enabled := False;
  btn_del.Enabled := false;
  btn_sh.Enabled := false;
  btn_save.Enabled := True;
  btn_cancel.Enabled := true;
  DBGridEH1.ReadOnly := False;
  edt_ryno.Enabled :=True;
  btn_ryno.Enabled :=true;
  Button2.Enabled :=True;
  IBCTable1.Edit;
  //IBCTransaction1.StartTransaction;
end;

procedure Tfrm_rytcgl.btn_saveClick(Sender: TObject);
begin
  with ibcqry_gzd do begin
    Close;
    sql.Text := 'update GZD SET XGR_NO=:XGR_NO,XGR_NAME=:XGR_NAME,XGRQ=:XGRQ where GZD_MONTH=' + QuotedStr(ComboBox1.Text);
    ParamByName('XGR_NO').Value := user_no;
    ParamByName('XGR_NAME').Value := user_name;
    ParamByName('XGRQ').Value := now;
  end;
  try
    ibcqry_gzd.ExecSQL;
    if IBCTable1.State in [dsedit] then begin
      iBCTable1.Post;
    end
    else
    IBCTransaction1.Commit;
    ShowMessage('保存成功！');
    btn_edit.Enabled := True;
    btn_del.Enabled := True;
    //btn_sh.Enabled := True;
    btn_save.Enabled := False;
    btn_cancel.Enabled := False;
    DBGridEH1.ReadOnly := True;
      edt_ryno.Enabled :=false;
      btn_ryno.Enabled :=False;
  Button2.Enabled :=false;
    IBCTable1.Close;
    IBCTable1.Open;
    IBCTable1.Filter := 'BM_NO like' + QuotedStr(lbl_BM_no.Caption+'%') + ' and GZD_MONTH=' + QuotedStr(ComboBox1.Text);
    IBCTable1.Filtered := true;
  except
    ShowMessage('保存失败！');
    IBCTransaction1.Rollback;
  end;


end;

procedure Tfrm_rytcgl.btn_cancelClick(Sender: TObject);
begin
  if is_edit = 0 then begin
    btn_edit.Enabled := True;
    btn_del.Enabled := True;
    btn_sh.Enabled := False;
    btn_save.Enabled := False;
    btn_cancel.Enabled := False;
     edt_ryno.Enabled :=false;
  Button2.Enabled :=false;
  btn_ryno.Enabled :=False;
  end
  else
  begin
    btn_edit.Enabled := false;
    btn_del.Enabled := false;
    btn_sh.Enabled := true;
    btn_save.Enabled := False;
    btn_cancel.Enabled := False;
     edt_ryno.Enabled :=false;
  Button2.Enabled :=false;
  btn_ryno.Enabled :=False;
  end;

  DBGridEH1.ReadOnly := True;
  IBCTable1.Cancel;
  IBCTransaction1.Rollback;
  IBCTable1.Close;
      IBCTable1.Open;
      IBCTable1.Filter := 'BM_NO like' + QuotedStr(lbl_DW_no.Caption+'%') + ' and GZD_MONTH=' + QuotedStr(ComboBox1.Text);
      IBCTable1.Filtered := TRUE;
end;

procedure Tfrm_rytcgl.ComboBox1Select(Sender: TObject);
var mmm,mmm1:string; // mmm存 选取年月的上个月，mmm1存最大月
begin
 mmm:= DateToStr(IncMonth(StrToDate(LeftStr(ComboBox1.Text,4)+'-'+RightStr(ComboBox1.Text, 2)+'-01'),-1));
mmm:= LeftStr( DateToStr(IncMonth(StrToDate(LeftStr(ComboBox1.Text,4)+'-'+RightStr(ComboBox1.Text, 2)+'-01'),-1)),7);
mmm:=StringReplace(mmm, '-', '', [rfReplaceAll]); //取到COBOBOX1选取的年月的上个月
//ShowMessage(mmm);
  with ibcqry_gzd do begin
    Close;
    sql.Text := 'select * from GZD where GZD_MONTH=' + QUOTEDSTR(ComboBox1.Text);
    open
  end;
  if ibcqry_gzd.IsEmpty then begin
    if Application.MessageBox('没有对应年月的工资单,是否生成?', '工资单管理',
      MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      with ibcqry_gzd do begin
        close;
         SQL.Text :='select gzd_month from gzd where GZD_MONTH='+QUOTEDSTR(MMM);//查询是否有上个月工资表记录，如有，从上月工资表取数。
         Open;
         end;
         if ibcqry_gzd.IsEmpty then begin
           with ibcqry_gzd do begin
            Close;
            sql.text :='select max(GZD_MONTH) FROM GZD_ITEM'; //没有对应上月记录，取最大月工资表
            open;
            mmm1:= ibcqry_gzd.Fields[0].AsString;
            end;
            with  ibcqry_gzd do begin
        sql.Text := ' INSERT INTO GZD (GZD_MONTH,LRY_NO,LRRQ,GZD_TIMESTAMP) VALUES (' + ComboBox1.Text + ',' + user_no + ',current_date,current_timestamp)';
        ExecSQL;
        {sql.Text := 'select b.gzd_month,a.ry_bm,a.ry_no,a.ry_name,b.gwgz,a.ry_glgz,b.dhbz,b.sbdk,a.bz from get_gzd_ryxx a left join gzd_item b on
b.gzd_month='201108' and a.ry_no=b.ry_no where (a.ry_zt<>2 or EXTRACT(month from a.ry_lzrq)+2= '11')}
        sql.Text :='INSERT INTO GZD_ITEM (GZD_MONTH,BM_NO,RY_NO,RY_NAME,GWGZ,GLGZ,DHBZ,SBDK,BZ)'
                 +' select '+ combobox1.Text +', a.RY_BM, a.RY_NO, a.RY_NAME,b.GWGZ, a.RY_GLGZ,b.dhbz,b.sbdk,a.BZ'
                 +' from get_gzd_ryxx a left join gzd_item b on b.gzd_month='+mmm1+' and a.ry_no=b.ry_no'
                 +' where (a.ry_zt<>2 or EXTRACT(month from a.ry_lzrq)+2='+ quotedstr(RightStr(ComboBox1.Text, 2)) +')';
       ExecSQL;
      end;
         end
          else
            begin
              with  ibcqry_gzd do begin  //有上个月记录，取上个月工资表。
        sql.Text := ' INSERT INTO GZD (GZD_MONTH,LRY_NO,LRRQ,GZD_TIMESTAMP) VALUES (' + ComboBox1.Text + ',' + user_no + ',current_date,current_timestamp)';
        ExecSQL;
        {sql.Text := 'INSERT INTO GZD_ITEM (GZD_MONTH,BM_NO,RY_NO,RY_NAME,GLGZ,BZ)'
          + ' select b.gzd_month,a.ry_bm,a.ry_no,a.ry_name,b.gwgz,a.ry_glgz,b.dhbz,b.sbdk,a.bz from get_gzd_ryxx a left join gzd_item b on
b.gzd_month='201108' and a.ry_no=b.ry_no where (a.ry_zt<>2 or EXTRACT(month from a.ry_lzrq)+2= '11')}
        sql.Text :='INSERT INTO GZD_ITEM (GZD_MONTH,BM_NO,RY_NO,RY_NAME,GWGZ,GLGZ,DHBZ,SBDK,BZ)'
                 +' select '+ combobox1.Text +', a.RY_BM, a.RY_NO, a.RY_NAME,b.GWGZ, a.RY_GLGZ,b.dhbz,b.sbdk,a.BZ'
                 +' from get_gzd_ryxx a left join gzd_item b on b.gzd_month='+mmm+' and a.ry_no=b.ry_no'
                 +' where (a.ry_zt<>2 or EXTRACT(month from a.ry_lzrq)+2='+ quotedstr(RightStr(ComboBox1.Text, 2)) +')';
        ExecSQL;
      end;
            end;

      IBCTable1.Close;
      IBCTable1.Open;
      IBCTable1.Filter := 'BM_NO like' + QuotedStr(lbl_DW_no.Caption+'%') + ' and GZD_MONTH=' + QuotedStr(ComboBox1.Text);
      IBCTable1.Filtered := TRUE;
      if is_edit = 0 then begin  //修改模式
        btn_edit.Enabled := true;
        btn_del.Enabled := True;
        btn_sh.Enabled := false;
      
      end
      else
      begin                    // 审核模式
        btn_edit.Enabled := false;
        btn_del.Enabled := false;
        btn_sh.Enabled := true;
        Button2.Enabled :=False;
        edt_ryno.Enabled :=false;
      end;

    end;
  end
  else
  begin
    IBCTable1.Open;
    IBCTable1.Filter := 'GZD_MONTH=' + QUOTEDSTR(ComboBox1.Text);
    IBCTable1.Filtered := TRUE;
    if is_edit = 0 then begin //修改模式
      if ibcqry_gzd.FieldByName('SHBJ').Value = 0 then
      begin
        lbl_xgr.Caption := ibcqry_gzd.fieldbyname('XGR_NAME').AsString;
        lbl_xgrq.Caption := ibcqry_gzd.fieldbyname('XGRQ').AsString;
        lbl_shr.Caption := '';
        lbl_shrq.Caption := '';
        lbl_gzd_zt.Caption := '未审核';
        btn_edit.Enabled := true;
        btn_del.Enabled := True;
        btn_sh.Enabled := False;
      end;
      if ibcqry_gzd.FieldByName('SHBJ').Value = 1 then
      begin
        lbl_shr.Caption := ibcqry_gzd.fieldbyname('SHR_NAME').AsString;
        lbl_shrq.Caption := ibcqry_gzd.fieldbyname('SHRQ').AsString;
        lbl_gzd_zt.Caption := '已审核';
        btn_edit.Enabled := False;
        btn_sh.Enabled := false;
        btn_del.Enabled := false;
      end;
    end
    else //审核模式
    begin
      if ibcqry_gzd.FieldByName('SHBJ').Value = 0 then
      begin
        lbl_xgr.Caption := ibcqry_gzd.fieldbyname('XGR_NAME').AsString;
        lbl_xgrq.Caption := ibcqry_gzd.fieldbyname('XGRQ').AsString;
        lbl_shr.Caption := '';
        lbl_shrq.Caption := '';
        lbl_gzd_zt.Caption := '未审核';
        btn_edit.Enabled := false;
        btn_del.Enabled := false;
        btn_sh.Enabled := True;
      end;
      if ibcqry_gzd.FieldByName('SHBJ').Value = 1 then
      begin
        lbl_shr.Caption := ibcqry_gzd.fieldbyname('SHR_NAME').AsString;
        lbl_shrq.Caption := ibcqry_gzd.fieldbyname('SHRQ').AsString;
        lbl_gzd_zt.Caption := '已审核';
        btn_edit.Enabled := False;
        btn_sh.Enabled := false;
        btn_del.Enabled := false;
      end;
    end;
  end;
end;

procedure Tfrm_rytcgl.btn_printClick(Sender: TObject);
begin
  with IBCQuery1 do begin
    Close;
    SQL.Text := 'select * from GZD_ITEM_VIEW where GZD_month=' + Quotedstr(ComboBox1.Text) + 'order by bm_no,ry_no';
    Open;
  end;
  TfrxMemoView(frxrprt_BM_HJ.FindObject('memo48')).Memo.Text := lbl_xgr.Caption;
  TfrxMemoView(frxrprt_BM_HJ.FindObject('memo49')).Memo.Text := lbl_shr.Caption;
  TfrxMemoView(frxrprt_BM_HJ.FindObject('memo54')).Memo.Text := ComboBox1.Text;
  TfrxMemoView(frxrprt_BM_HJ.FindObject('memo51')).Memo.Text := lbl_gzd_zt.caption;
  frxrprt_BM_HJ.ShowReport(true); //GZD_ITEM2.FR3
end;

procedure Tfrm_rytcgl.btn_delClick(Sender: TObject);
begin
  if Application.MessageBox('确定删除该月工资单吗?' + #13#10 +
    '该操作不可恢复！', '工资单管理', MB_OKCANCEL + MB_ICONQUESTION +
    MB_DEFBUTTON2) = IDOK then
  begin
    with ibcqry_gzd do begin
      Close;
      sql.Text := 'delete from gzd where GZD_MONTH=' + Quotedstr(ComboBox1.Text);
      ExecSQL;
      Application.MessageBox('删除成功!', '工资单管理', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON2);
      IBCTable1.Close;
    end;
  end;


end;

procedure Tfrm_rytcgl.IBCTable1AfterOpen(DataSet: TDataSet);
begin
  btn_print.Enabled := true;
  btn1.Enabled := True;
  Button1.Enabled := True;
end;

procedure Tfrm_rytcgl.btn1Click(Sender: TObject);
begin
  with IBCQuery1 do begin
    Close;
    sql.Text := 'select a.gzd_month,substr(A.BM_NO,1,5),A.BMMC,A.YFJE,A.SFJE,b.bmmc  as bmmc1 from gzd_xsbm_hj a, BMXX B'
      + ' where substr(A.BM_NO,1,5)=B.BM_NO AND A.gzd_month=' + Quotedstr(ComboBox1.Text) + ' order by a.bm_no';
    Open;
  end;
  TfrxMemoView(frxrprt_HJ.FindObject('memo15')).Memo.Text := lbl_xgr.Caption;
  TfrxMemoView(frxrprt_HJ.FindObject('memo16')).Memo.Text := lbl_shr.caption;
  TfrxMemoView(frxrprt_HJ.FindObject('memo18')).Memo.Text := lbl_gzd_zt.caption;
  frxrprt_HJ.ShowReport(true); //GZD.FR3
end;

procedure Tfrm_rytcgl.btn_shClick(Sender: TObject);
begin

  if Application.MessageBox('工资单审核后将无法修改，删除！' + #13#10 +
    '是否确定审核？', '工资单审核', MB_YESNO + MB_ICONQUESTION +
    MB_DEFBUTTON2) = IDYES then
  begin
    with ibcqry_gzd do begin
      Close;
      SQL.Text := 'update GZD set SHR_NO=:SHR_NO,SHR_NAME=:SHR_NAME,SHRQ=:SHRQ,SHBJ=1 where GZD_MONTH=' + Quotedstr(ComboBox1.Text);
      ParamByName('SHR_NO').Value := user_no;
      ParamByName('SHR_NAME').Value := user_name;
      ParamByName('SHRQ').Value := Now;
      ExecSQL;
    end;
    Application.MessageBox('工资单审核成功！', '工资单审核', MB_OK +
      MB_ICONINFORMATION + MB_DEFBUTTON2);
    DBGridEH1.ReadOnly := True;
    IBCTable1.Close;
    IBCTable1.Open;             
    IBCTable1.Filter := 'BM_NO like' + QuotedStr(lbl_DW_no.Caption+'%') + ' and GZD_MONTH=' + QuotedStr(ComboBox1.Text);
    IBCTable1.Filtered := true;
    btn_sh.Enabled := false;
    lbl_gzd_zt.Caption :='已审核'
  end;
end;

procedure Tfrm_rytcgl.Button1Click(Sender: TObject);
begin
 // IBCTable1.Filtered := true;
  if cbb_xsbm.ItemIndex <>-1 then
    TfrxMemoView(frxrprt_BM.FindObject('memo49')).Memo.Text := cbb_xsbm.Text
     else
     if cbb_bm.ItemIndex <>-1 then
    TfrxMemoView(frxrprt_BM.FindObject('memo49')).Memo.Text := cbb_bm.Text
    else
     if cbb_dw.ItemIndex <>-1 then
    TfrxMemoView(frxrprt_BM.FindObject('memo49')).Memo.Text := cbb_dw.Text;

  TfrxMemoView(frxrprt_BM.FindObject('memo54')).Memo.Text := ComboBox1.Text;
  TfrxMemoView(frxrprt_BM.FindObject('memo51')).Memo.Text := lbl_gzd_zt.caption;
  TfrxMemoView(frxrprt_BM.FindObject('memo55')).Memo.Text := lbl_xgr.Caption;
  TfrxMemoView(frxrprt_BM.FindObject('memo56')).Memo.Text := lbl_shr.caption;
  frxrprt_BM.ShowReport(true); //GZD_ITEM.FR3
end;

procedure Tfrm_rytcgl.Button2Click(Sender: TObject);
var ss: string;
begin

  if ComboBox1.ItemIndex = -1 then
  begin
    Application.MessageBox('请选择工资年月', '工资管理', MB_OK +
      MB_ICONINFORMATION);
    ComboBox1.SetFocus;
  end
  else
    if cbb_dw.ItemIndex = -1 then
    begin
      Application.MessageBox('请选择公司', '工资管理', MB_OK +
        MB_ICONINFORMATION);
      cbb_dw.SetFocus;
    end
    else
     if (edt_ryno.Text ='') or (edt_ryno.Text ='0') then
      begin
        Application.MessageBox('请输入人员编号或点击人员编号查询人员', '工资管理', MB_OK +
        MB_ICONINFORMATION);
      //edt_ryno.SetFocus;
      end
      else
    begin
      ss := '是否确定添加人员到当前工资表？' + #13#10 + #13#10 + '编码：' + edt_ryno.text + #13#10 + '姓名：' + lbl_name.caption;
      if Application.MessageBox(PansiChar(ss), '工资管理',
        MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
      begin
        with IBCQuery1 do begin
          Close;
         { sql.Text := 'select GZD_MONTH,DW_NO,BM_NO,XSBM_NO,RY_NO FROM gzd_item where GZD_MONTH=' + QUOTEDSTR(ComboBox1.Text)
            + ' and DW_NO=' + QUOTEDSTR(lbl_dw_no.Caption) + ' and BM_NO=' + QUOTEDSTR(lbl_bm_no.Caption) + ' and XSBM_NO=' + QUOTEDSTR(lbl_xsbm_no.Caption)
            + ' and RY_NO=' + QUOTEDSTR(edt_ryno.Text);}
            sql.Text := 'select GZD_MONTH,BM_NO,RY_NO FROM gzd_item where GZD_MONTH=' + QUOTEDSTR(ComboBox1.Text)
            + ' and BM_NO=' + QUOTEDSTR(lbl_bm_no.Caption)+ ' and RY_NO=' + QUOTEDSTR(edt_ryno.Text);
            
          OPEN;
        end;
        if IBCQuery1.IsEmpty then begin

          with ibcqry_gzd do begin
            Close;
            SQL.Text := 'insert into GZD_ITEM (GZD_MONTH,BM_NO,RY_NO,RY_NAME,GLGZ) values (:GZD_MONTH,:BM_NO,:RY_NO,:RY_NAME,:GLGZ)';
            ParamByName('GZD_MONTH').Value := ComboBox1.Text;
            //ParamByName('DW_NO').Value := lbl_dw_no.Caption;
            ParamByName('BM_NO').Value := lbl_bm_no.Caption;
           // ParamByName('XSBM_NO').Value := lbl_xsbm_no.Caption;
            ParamByName('RY_NO').Value := edt_ryno.Text;
            ParamByName('RY_NAME').Value := lbl_name.Caption;
            ParamByName('GLGZ').Value := lbl_glgz.Caption;
            try
              ExecSQL;
              Application.MessageBox('添加成功！', '工资管理', MB_OK +
                MB_ICONINFORMATION);
              edt_ryno.Clear;
              lbl_name.Caption := '';
              lbl_glgz.Caption := '0';
              IBCTable1.Close;
              IBCTable1.Open;
            except
              Application.MessageBox('添加失败！', '工资管理', MB_OK +
                MB_ICONINFORMATION);
            end;
          end;
        end
        else
          Application.MessageBox('该部门下已有相同编号的员工！', '工资管理', MB_OK +
            MB_ICONINFORMATION);

      end;

    end;
end;

procedure Tfrm_rytcgl.edt_rynoExit(Sender: TObject);
begin
  if edt_ryno.Text = '' then
    edt_ryno.Text := '0'

  else
    with IBCQuery1 do begin
      Close;
      SQL.Text := 'select ry_no,ry_name,ry_glgz from ryxx where ry_no=' + quotedstr(edt_ryno.Text);
      Open;
    end;
  if IBCQuery1.IsEmpty then
  begin
    Application.MessageBox('没有该员工资料，请重新输入！', '工资管理', MB_OK + mb_iconinformation);
   // edt_ryno.SetFocus;
    //edt_ryno.SelectAll;
  end
  else
  begin
    lbl_name.Caption := IBCQuery1.fieldbyname('ry_name').AsString;
    lbl_glgz.Caption := IBCQuery1.fieldbyname('ry_glgz').AsString;
  end;
end;

procedure Tfrm_rytcgl.btn_rynoClick(Sender: TObject);
begin
  if frm_ryzl_qry_edit = nil then frm_ryzl_qry_edit := Tfrm_ryzl_qry_edit.Create(application);
  frm_ryzl_qry_edit.ShowModal;
end;

procedure Tfrm_rytcgl.edt_rynoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    with IBCQuery1 do begin
      Close;
      SQL.Text := 'select ry_no,ry_name,ry_glgz from ryxx where ry_no=' + quotedstr(edt_ryno.Text);
      Open;
    end;
  if IBCQuery1.IsEmpty then
  begin
    Application.MessageBox('没有该员工资料，请重新输入！', '工资管理', MB_OK + mb_iconinformation);
   // edt_ryno.SetFocus;
    //edt_ryno.SelectAll;
  end
  else
  begin
    lbl_name.Caption := IBCQuery1.fieldbyname('ry_name').AsString;
    lbl_glgz.Caption := IBCQuery1.fieldbyname('ry_glgz').AsString;
  end;
  end;
end;

procedure Tfrm_rytcgl.Panel1Click(Sender: TObject);
var mmm:string;
begin
{
 //ShowMessage(LeftStr(ComboBox1.Text,4) +'-'+RightStr(ComboBox1.Text, 2)+'-01');
//ShowMessage( DateToStr(IncMonth(StrToDate(LeftStr(ComboBox1.Text,4)+'-'+RightStr(ComboBox1.Text, 2)+'-01'),-1)));
mmm:= DateToStr(IncMonth(StrToDate(LeftStr(ComboBox1.Text,4)+'-'+RightStr(ComboBox1.Text, 2)+'-01'),-1));
mmm:= LeftStr( DateToStr(IncMonth(StrToDate(LeftStr(ComboBox1.Text,4)+'-'+RightStr(ComboBox1.Text, 2)+'-01'),-1)),7);
 ShowMessage(mmm);
mmm:=StringReplace(mmm, '-', '', [rfReplaceAll]);
ShowMessage(mmm);}
end;

end.

