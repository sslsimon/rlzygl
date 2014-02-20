unit Changyong_cx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Grids, DBGrids, DateUtils, DB,
  IBCustomDataSet, IBQuery, MemDS, IBC, RzTabs, GridsEh, DBGridEh,
  frxClass, frxDBSet, frxExportPDF, Menus, StrUtils, DBAccess,DBGridEhImpExp;

type
  Tfrm_changyong_cx = class(TForm)
    ds1: TDataSource;
    IBQuery1: TIBCQuery;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    pnl1: TPanel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    shp1: TShape;
    lbl_SR: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    Button1: TButton;
    Label3: TLabel;
    TabSheet2: TRzTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Shape1: TShape;
    Label4: TLabel;
    Label7: TLabel;
    dtp3: TDateTimePicker;
    dtp4: TDateTimePicker;
    Button2: TButton;
    Label12: TLabel;
    cbb_ygzt: TComboBox;
    GroupBox1: TGroupBox;
    rb1: TRadioButton;
    rb2: TRadioButton;
    Label8: TLabel;
    ComboBox1: TComboBox;
    IBCQuery2: TIBCQuery;
    ds2: TDataSource;
    IBQuery1RY_NO: TIntegerField;
    IBQuery1RY_NAME: TStringField;
    IBQuery1RY_SEX: TStringField;
    IBQuery1RY_RZRQ: TDateField;
    IBQuery1RY_ZZRQ: TDateField;
    IBQuery1RY_CSRQ: TDateField;
    IBQuery1RY_MOBEL_PHONE: TStringField;
    IBQuery1RY_JTZZ: TStringField;
    IBQuery1RY_GL: TLargeintField;
    IBQuery1RY_HTRQ_BEGIN: TDateField;
    IBQuery1RY_HTRQ_END: TDateField;
    IBQuery1RY_ZT: TIntegerField;
    IBQuery1RY_ZT1: TStringField;
    DBGridEh1: TDBGridEh;
    TabSheet3: TRzTabSheet;
    GroupBox2: TGroupBox;
    cbb_dw: TComboBox;
    cbb_bm: TComboBox;
    IBCQuery1: TIBCQuery;
    frxPDFExport1: TfrxPDFExport;
    frxDBDataset1: TfrxDBDataset;
    PopupMenu1: TPopupMenu;
    PDF1: TMenuItem;
    Panel4: TPanel;
    btn_rygz_cx: TButton;
    DBGridEh2: TDBGridEh;
    IBCQry_rygz: TIBCQuery;
    ds_rygz: TDataSource;
    GroupBox3: TGroupBox;
    edt_ry_no: TEdit;
    RadioButton1: TRadioButton;
    edt_ry_name: TEdit;
    RadioButton2: TRadioButton;
    Label10: TLabel;
    ComboBox2: TComboBox;
    Shape2: TShape;
    ComboBox3: TComboBox;
    cbb_xsbm1: TComboBox;
    lbl_dw_no: TLabel;
    lbl_bm_no: TLabel;
    lbl_rybm: TLabel;
    lbl_xsbm_no: TLabel;
    cbb_xsbm: TComboBox;
    ComboBox4: TComboBox;
    Label5: TLabel;
    frxrprt1: TfrxReport;
    N1: TMenuItem;
    SaveDialog1: TSaveDialog;
    //IBQuery1RY_GL: TLargeintField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure RzPageControl1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure IBQuery1CalcFields(DataSet: TDataSet);
    procedure SortQuery(Column: TColumn);
    procedure dbgrd2TitleClick(Column: TColumn);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure SortQueryeh(Columneh: TColumneh);
    procedure FormShow(Sender: TObject);
    procedure cbb_dwSelect(Sender: TObject);
    procedure cbb_bmSelect(Sender: TObject);
    procedure cbb_bmDropDown(Sender: TObject);
    procedure cbb_xsbm3DropDown(Sender: TObject);
    procedure cbb_xsbm3Select(Sender: TObject);
    procedure PDF1Click(Sender: TObject);
    procedure ComboBox2Select(Sender: TObject);
    procedure btn_rygz_cxClick(Sender: TObject);
    procedure cbb_xsbmSelect(Sender: TObject);
    procedure cbb_xsbm1Select(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    //  procedure setTitle;
  private
    { Private declarations }


  public
    { Public declarations }
  end;

var
  frm_changyong_cx: Tfrm_changyong_cx;

implementation
uses MainUnit, About;
{$R *.dfm}

{RY_ZT
0临时
1在职
2离职
3其它}


procedure Tfrm_changyong_cx.SortQuery(Column: TColumn);
var
  SqlStr, myFieldName, TempStr: string;
  OrderPos: integer;
  SavedParams: TParams;
  ii: integer;
  cStr: string;
  c: TColumn;
begin
  for ii := 0 to TDBGrid(Column.Grid).Columns.Count - 1 do
  begin
    c := TDBGrid(Column.Grid).Columns[ii];
    cStr := c.Title.Caption;
    if (pos('▲', cStr) = 1) or (pos('▼', cStr) = 1) then begin
      Delete(cStr, 1, 2);
      c.Title.Caption := cStr;
    end;
  end;

  if not (Column.Field.FieldKind in [fkData, fkLookup]) then exit;
  if Column.Field.FieldKind = fkData then
    myFieldName := UpperCase(Column.Field.FieldName)
  else
    myFieldName := UpperCase(Column.Field.KeyFields);
  while Pos(myFieldName, ';') <> 0 do
    myFieldName := copy(myFieldName, 1, Pos(myFieldName, ';') - 1) + ',' + copy(myFieldName, Pos(myFieldName, ';') + 1, 100);
  with TIBCQuery(TDBGrid(Column.Grid).DataSource.DataSet) do
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
      Column.Title.Caption := '▲' + Column.Title.Caption;
    end
    else if pos('ASC', SqlStr) = 0 then
    begin
      TempStr := ' Order By ' + myFieldName + ' Asc';
      Column.Title.Caption := '▲' + Column.Title.Caption;
    end
    else
    begin
      TempStr := ' Order By ' + myFieldName + ' Desc';
      Column.Title.Caption := '▼' + Column.Title.Caption;
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

procedure Tfrm_changyong_cx.SortQueryeh(Columneh: TColumnEh);
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

 { procedure Tfrm_changyong_cx.setTitle;
 var ii: integer;
   cStr: string;
   c: TColumn;
 begin
   for ii := 0 to TDBGrid(Column.Grid).Columns.Count - 1 do
   begin
     c := TDBGrid(Column.Grid).Columns[ii];
     cStr := c.Title.Caption;
     if (pos('▲', cStr) = 1) or (pos('▼', cStr) = 1) then begin
       Delete(cStr, 1, 2);
       c.Title.Caption := cStr;
     end;
   end;
 end;}

{procedure tfrm_changyong_cx.OrderGrid(dataSet: TClientDataset; orderField: string);
var
  i: integer;
begin
   if dataSet.IndexFieldNames <> '' then
  begin
    i := TClientDataSet(DataSet).IndexDefs.IndexOf('i' + orderField);
     if i = -1 then
     begin
        with Dataset.IndexDefs.AddIndexDef do
        begin
          Name := 'i' + orderField;
          Fields := orderField;
          DescFields := orderField;
        end;
      end;
       dataSet.IndexFieldNames := '';
     dataSet.IndexName := 'i' + orderField;
   end
   else
   begin
     dataSet.IndexName := '';
     dataSet.IndexFieldNames := orderfield;
   end;
 end; }


procedure Tfrm_changyong_cx.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frm_changyong_cx := nil;
end;

procedure Tfrm_changyong_cx.Button1Click(Sender: TObject);
begin
  //if rb1.Checked then begin
  with IBQuery1 do begin
    Close;
    sql.Text := 'select RY_NO,RY_NAME,RY_SEX,RY_RZRQ,RY_ZZRQ,RY_CSRQ,RY_MOBEL_PHONE,RY_JTZZ,RY_GL,RY_HTRQ_BEGIN,RY_HTRQ_END,RY_ZT from ryxx'
      + ' where RY_ZT<>2 AND EXTRACT(month from ry_csrq)>=' + quotedstr(FormatDateTime('MM', dtp1.Date))
      + ' and EXTRACT(month from ry_csrq)<=' + quotedstr(FormatDateTime('MM', dtp2.Date)) + ' order by RY_CSRQ';
    Open;
  end;
  if IBQuery1.IsEmpty then begin
    Application.MessageBox('没有符合条件的记录！', '常用查询', MB_OK +
      MB_ICONINFORMATION);
    lbl_SR.Caption := '0 位员工过生日';
  end
  else
  begin
    lbl_SR.Caption := IntToStr(IBQuery1.RecordCount) + ' 位员工过生日';
  end;
end;
 { if rb2.Checked then begin
        with IBQuery1 do begin
      Close;
      sql.Text := 'select RY_NO,RY_NAME,RY_SEX,RY_RZRQ,RY_ZZRQ,RY_CSRQ,RY_MOBEL_PHONE,RY_JTZZ,RY_GL from ryxx'
        + ' where RY_ZT<>2 AND RY_RZRQ>=' + quotedstr(FormatDateTime('YYYY-MM-DD', dtp1.Date))
        + ' and RY_RZRQ<=' + quotedstr(FormatDateTime('YYYY-MM-DD', dtp2.Date)) + ' order by RY_CSRQ';
      Open;
    end;
    if IBQuery1.IsEmpty then begin
      ShowMessage('没有符合条件的记录！');
     // lbl_SR.Caption := '0';
    end
    else
    begin
     // lbl_SR.Caption := IntToStr(IBQuery1.RecordCount);
     end;
  end;
end;  }

procedure Tfrm_changyong_cx.rb2Click(Sender: TObject);
begin
  cbb_ygzt.Enabled := false;
  ComboBox1.Enabled := True;
   Label12.Enabled :=false;
  Label8.Enabled  :=True;
  dtp3.Date := StrToDate('1900-01-01');
  dtp4.Date := IncMonth(Date, +3);
  dtp3.Enabled := false;
end;

procedure Tfrm_changyong_cx.RzPageControl1Change(Sender: TObject);
var my_month: array[0..11] of string; //用于设置年月
  i, l, k, min_year: integer;
begin
  if RzPageControl1.ActivePage = TabSheet1 then
  begin
    dtp1.Date := StartOfTheMonth(IncMonth(Date, 1));
    dtp2.Date := EndOfTheMonth(IncMonth(Date, 1));
  end;
  if RzPageControl1.ActivePage = TabSheet2 then
  begin
    dtp3.Date := StrToDate('1900-01-01');
    dtp4.Date := DATE;
  end;
  if RzPageControl1.ActivePage = TabSheet3 then

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
    ComboBox2.Clear;
    with IBCQuery1 do begin //取历史最小工资年月
      Close;
      sql.Clear;
      sql.Add('select min(gzd_month) from gzd order by gzd_month');
      Open;
    end;
  // ShowMessage(LeftStr(Ibcqry_bmxx.Fields[0].value,4));
    l := StrToInt(LeftStr(IBCQuery1.Fields[0].value, 4));
    min_year := l;
    l := StrToInt(FormatDateTime('yyyy', date)) - l; //得到历史最小年份与当前年份相差数字
    for k := 1 to l do
    begin
      for i := Low(my_month) to High(my_month) do
      begin
         //IncYear(date)-1
        ComboBox2.Items.Add(IntToStr(min_year) + my_month[i]);
        ComboBox3.Items.Add(IntToStr(min_year) + my_month[i]);
      end;
      min_year := min_year + 1;
    end;
    for i := Low(my_month) to High(my_month) do
    begin
      ComboBox2.Items.Add(FormatDateTime('yyyy', date) + my_month[i]);
      ComboBox3.Items.Add(FormatDateTime('yyyy', date) + my_month[i]);
    end;
    IBCQuery1.Close;
  end;
end;

procedure Tfrm_changyong_cx.Button2Click(Sender: TObject);
//var yg_syq:string; //员工试用期
begin
IBCQuery2.Filtered:=False;
  if rb1.Checked then begin
   DBGridEh1.Columns.Grid.FieldColumns['GZ_ZWMC'].Visible:=true;
    with IBCQuery2 do begin
     Close;
      if cbb_dw.ItemIndex =0 then begin //查询全公司
       sql.Text := 'select a.RY_BM,a.RY_NO,a.RY_NAME,a.RY_SEX,a.RY_SFZH,a.RY_RZRQ,a.RY_LZRQ,a.RY_ZZRQ,a.RY_CSRQ,a.RY_MOBEL_PHONE,a.RY_JTZZ,a.RY_GL,a.RY_HTRQ_BEGIN,a.RY_HTRQ_END,a.RY_ZGXL,(current_date-a.ry_csrq)/365 as NL,B.BMMC,d.gz_zwmc'
      +' from ryxx a,bmxx b,get_last_zwrq c,ryxx_gzjl d'
        + ' where a.RY_RZRQ>=' + quotedstr(FormatDateTime('YYYY-MM-DD', dtp3.Date))
        + ' and a.RY_RZRQ<=' + quotedstr(FormatDateTime('YYYY-MM-DD', dtp4.Date)) + ' and a.RY_ZT=' + quotedstr(inttostr(CBB_YGZT.ItemIndex))
        + ' and a.ry_bm=b.bm_no and c.ry_no=d.ry_no and c.max_id=d.gzjl_id  and a.ry_no=c.ry_no'
        + ' order by a.RY_RZRQ';
      Open;
      end
      else
      begin
      sql.Text := 'select a.RY_BM,a.RY_NO,a.RY_NAME,a.RY_SEX,a.RY_SFZH,a.RY_RZRQ,a.RY_LZRQ,a.RY_ZZRQ,a.RY_CSRQ,a.RY_MOBEL_PHONE,a.RY_JTZZ,a.RY_GL,a.RY_HTRQ_BEGIN,a.RY_HTRQ_END,a.RY_ZGXL,(current_date-a.ry_csrq)/365 as NL,B.BMMC,d.gz_zwmc'
      +' from ryxx a,bmxx b,get_last_zwrq c,ryxx_gzjl d'
        + ' where a.RY_RZRQ>=' + quotedstr(FormatDateTime('YYYY-MM-DD', dtp3.Date))
        + ' and a.RY_RZRQ<=' + quotedstr(FormatDateTime('YYYY-MM-DD', dtp4.Date)) + ' and a.RY_ZT=' + quotedstr(inttostr(CBB_YGZT.ItemIndex))
        + ' and a.RY_BM like' + quotedstr(lbl_rybm.Caption + '%')
        + ' and a.ry_bm=b.bm_no and c.ry_no=d.ry_no and c.max_id=d.gzjl_id  and a.ry_no=c.ry_no'
        + ' order by a.RY_RZRQ';
      Open;
      end;
    end;
    if IBCQuery2.IsEmpty then begin

      Application.MessageBox('没有符合条件的记录！', '常用查询', MB_OK +
        MB_ICONINFORMATION);
      label4.Caption := '0 位符合条件的员工';
      PDF1.Enabled := false;
    end
    else
    begin
      label4.Caption := IntToStr(IBCQuery2.RecordCount) + ' 位符合条件的员工';
      PDF1.Enabled := true;
    end;
  end;
  if rb2.Checked then begin
    DBGridEh1.Columns.Grid.FieldColumns['GZ_ZWMC'].Visible:=false;
    if ComboBox1.ItemIndex = 0 then begin //试用期
      with IBCQuery2 do begin
        Close;
        sql.Text := 'select a.RY_BM,A.RY_NO,A.RY_NAME,A.RY_SEX,a.RY_SFZH,A.RY_RZRQ,a.RY_LZRQ,A.RY_ZZRQ,A.RY_CSRQ,A.RY_MOBEL_PHONE,A.RY_JTZZ,A.RY_GL,A.RY_HTRQ_BEGIN,A.RY_HTRQ_END,B.BMMC from ryxx A,BMXX B'
          + ' where CAST(EXTRACT(YEAR FROM A.ry_rzrq) as varchar(4))|| ''-''||CAST(EXTRACT(MONTH FROM A.ry_rzrq)+3 as varchar(4))|| ''-''||CAST(EXTRACT(DAY FROM A.ry_rzrq) as varchar(4))=' + quotedstr(DateToStr(dtp4.date))
          + ' and A.RY_ZT<>2 and a.ry_bm=b.bm_no order by RY_RZRQ';
        Open;
      end;
      if IBCQuery2.IsEmpty then begin

        Application.MessageBox('没有符合条件的记录！', '常用查询', MB_OK +
          MB_ICONINFORMATION);
        label4.Caption := '0 位符合条件的员工 (试用期到期)';
        PDF1.Enabled := false;
      end
      else
      begin
        label4.Caption := IntToStr(IBCQuery2.RecordCount) + ' 位符合条件的员工 (试用期到期)';
        PDF1.Enabled := true;
      end;
    end;
    if ComboBox1.ItemIndex = 1 then begin //有合同
      dtp3.Date := StrToDate('1900-01-01');
      dtp4.Date := DATE;
      with IBCQuery2 do begin
        Close;
        sql.Text := 'select a.RY_BM,A.RY_NO,A.RY_NAME,A.RY_SEX,a.RY_SFZH,A.RY_RZRQ,a.RY_LZRQ,A.RY_ZZRQ,A.RY_CSRQ,A.RY_MOBEL_PHONE,A.RY_JTZZ,A.RY_GL,A.RY_HTRQ_BEGIN,A.RY_HTRQ_END,B.BMMC from ryxx a,bmxx b'
          + ' where A.RY_RZRQ>=' + quotedstr(FormatDateTime('YYYY-MM-DD', dtp3.Date))
          + ' and A.RY_RZRQ<=' + quotedstr(FormatDateTime('YYYY-MM-DD', dtp4.Date)) + ' and A.RY_ZT<>2 and A.RY_HTRQ_BEGIN is not null and a.ry_bm=b.bm_no order by RY_HTRQ_BEGIN';
        Open;
      end;
      if IBCQuery2.IsEmpty then begin

        Application.MessageBox('没有符合条件的记录！', '常用查询', MB_OK +
          MB_ICONINFORMATION);
        label4.Caption := '0 位符合条件的员工 (已签合同)';
        PDF1.Enabled := false;
      end
      else
      begin
        label4.Caption := IntToStr(IBCQuery2.RecordCount) + ' 位符合条件的员工 (已签合同)';
        PDF1.Enabled := true;
      end;
    end;
    if ComboBox1.ItemIndex = 2 then begin //无合同
      dtp3.Date := StrToDate('1900-01-01');
      dtp4.Date := DATE;
      with IBCQuery2 do begin
        Close;
        sql.Text := 'select a.RY_BM,A.RY_NO,A.RY_NAME,A.RY_SEX,a.RY_SFZH,A.RY_RZRQ,a.RY_LZRQ,A.RY_ZZRQ,A.RY_CSRQ,A.RY_MOBEL_PHONE,A.RY_JTZZ,A.RY_GL,A.RY_HTRQ_BEGIN,A.RY_HTRQ_END,B.BMMC from ryxx a,bmxx b'
          + ' where A.RY_RZRQ>=' + quotedstr(FormatDateTime('YYYY-MM-DD', dtp3.Date))
          + ' and A.RY_RZRQ<=' + quotedstr(FormatDateTime('YYYY-MM-DD', dtp4.Date)) + ' and A.RY_ZT<>2 and A.RY_HTRQ_BEGIN is null and a.ry_bm=b.bm_no order by RY_RZRQ';
        Open;
      end;
      if IBCQuery2.IsEmpty then begin

        Application.MessageBox('没有符合条件的记录！', '常用查询', MB_OK +
          MB_ICONINFORMATION);
        label4.Caption := '0 位符合条件的员工 (未签合同)';
        PDF1.Enabled := false;
      end
      else
      begin
        label4.Caption := IntToStr(IBCQuery2.RecordCount) + ' 位符合条件的员工 (未签合同)';
        PDF1.Enabled := true;
      end;
    end;
    if ComboBox1.ItemIndex = 3 then begin //合同到期
      dtp3.Date := StrToDate('1900-01-01');
      //dtp4.Date := DATE;
      with IBCQuery2 do begin
        Close;
        sql.Text := 'select a.RY_BM,a.RY_NO,a.RY_NAME,a.RY_SEX,a.RY_SFZH,a.RY_RZRQ,a.RY_LZRQ,a.RY_ZZRQ,a.RY_CSRQ,a.RY_MOBEL_PHONE,a.RY_JTZZ,a.RY_GL,a.RY_HTRQ_BEGIN,a.RY_HTRQ_END,B.BMMC from ryxx a,bmxx b'
          + ' where a.ry_bm=b.bm_no and a.RY_HTRQ_END=' + quotedstr(FormatDateTime('YYYY-MM-DD', dtp4.Date))
          + ' order by a.RY_HTRQ_END';
        Open;
      end;
      if IBCQuery2.IsEmpty then begin

        Application.MessageBox('没有符合条件的记录！', '常用查询', MB_OK +
          MB_ICONINFORMATION);
        label4.Caption := '0 位符合条件的员工  (合同到期)';
        PDF1.Enabled := false;
      end
      else
      begin
        label4.Caption := IntToStr(IBCQuery2.RecordCount) + ' 位符合条件的员工  (合同到期)';
        PDF1.Enabled := true;
      end;
    end;
  end;
end;

procedure Tfrm_changyong_cx.rb1Click(Sender: TObject);
begin
  cbb_ygzt.Enabled := true;
  ComboBox1.Enabled := false;
  Label12.Enabled :=True;
  Label8.Enabled  :=False;
  dtp3.Date := StrToDate('1900-01-01');
  dtp4.Date := DATE;
end;

procedure Tfrm_changyong_cx.ComboBox1Select(Sender: TObject);
begin
  if (ComboBox1.ItemIndex = 0) or (ComboBox1.ItemIndex = 3) then begin
    dtp3.Enabled := False;
    dtp4.Date := IncMonth(Date, 3);
  end
  else
  begin
    dtp3.Enabled := True;
    dtp4.Date := date;
  end;

end;

procedure Tfrm_changyong_cx.IBQuery1CalcFields(DataSet: TDataSet);
begin
  if IBQuery1.FieldByName('RY_ZT').Value = 0 then
    IBQuery1.FieldByName('RY_ZT1').Value := '临时';
  if IBQuery1.FieldByName('RY_ZT').Value = 1 then
    IBQuery1.FieldByName('RY_ZT1').Value := '在职';
  if IBQuery1.FieldByName('RY_ZT').Value = 2 then
    IBQuery1.FieldByName('RY_ZT1').Value := '离职';
  if IBQuery1.FieldByName('RY_ZT').Value = 3 then
    IBQuery1.FieldByName('RY_ZT1').Value := '其它';
end;

procedure Tfrm_changyong_cx.dbgrd2TitleClick(Column: TColumn);
begin
//SortQuery(Column);
end;

procedure Tfrm_changyong_cx.DBGridEh1TitleClick(Column: TColumnEh);
begin
  SortQueryeh(Column);
end;

procedure Tfrm_changyong_cx.FormShow(Sender: TObject);
begin
  dtp1.Date := StartOfTheMonth(IncMonth(Date, 1));
  dtp2.Date := EndOfTheMonth(IncMonth(Date, 1));
  PDF1.Enabled := false;
  with IBCQuery1 do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr('__') + 'ORDER BY BM_NO');
    Open;
  end;
  cbb_dw.Items.Clear;
 // cbb_dw.Items.Add(gsmc);
  while not IBCQuery1.Eof do
  begin
    cbb_dw.Items.Add(IBCQuery1.Fields[1].AsString);
    IBCQuery1.Next;
  end;

  with IBCQuery1 do begin
    Close;
    sql.Clear;
    sql.Add('select distinct zwmc from zwxx ORDER BY ZW_NO');
    Open;
  end;
  ComboBox4.Items.Clear;
  ComboBox4.Items.Add('清除过滤条件');
  while not IBCQuery1.Eof do
  begin
    ComboBox4.Items.Add(IBCQuery1.Fields[0].AsString);
    IBCQuery1.Next;
  end;


{  with IBCQuery1 do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr('__.__') + ' ORDER BY BM_NO');
    Open;
  end;
  cbb_bm.Items.Clear;
  while not IBCQuery1.Eof do
  begin
    cbb_bm.Items.Add(IBCQuery1.Fields[1].AsString);
    IBCQuery1.Next;
  end;
  with IBCQuery1 do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr('__.__.__') + ' ORDER BY BM_NO');
    Open;
  end;
  cbb_xsbm.Items.Clear;
  while not IBCQuery1.Eof do
  begin
    cbb_xsbm.Items.Add(IBCQuery1.Fields[1].AsString);
    IBCQuery1.Next;
  end;
  cbb_dw.ItemIndex := 0;
  with IBCQuery1 do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bmmc=' + quotedstr(cbb_dw.Text));
    Open;
  end;
  lbl_dw_no.Caption := IBCQuery1.Fields[0].AsString;
  lbl_rybm.Caption := lbl_dw_no.Caption; }
end;

procedure Tfrm_changyong_cx.cbb_dwSelect(Sender: TObject);
begin
  lbl_bm_no.Caption := '0';
  lbl_xsbm_no.Caption := '0';
  cbb_bm.Clear;
  cbb_xsbm.Clear;
  cbb_xsbm1.Clear;
  with IBCQuery1 do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bmmc=' + quotedstr(cbb_dw.Text));
    Open;
  end;
  lbl_dw_no.Caption := IBCQuery1.Fields[0].AsString;
  lbl_rybm.Caption := IBCQuery1.Fields[0].AsString;
  with IBCQuery1 do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr(lbl_dw_no.Caption + '.__'));
    Open;
  end;
  while not IBCQuery1.Eof do
  begin
    cbb_bm.Items.Add(IBCQuery1.Fields[1].AsString);
    IBCQuery1.Next;
  end;
end;

procedure Tfrm_changyong_cx.cbb_bmSelect(Sender: TObject);
begin
  lbl_xsbm_no.Caption := '0';
  cbb_xsbm.Items.Clear;
  cbb_xsbm1.Clear;
  with IBCQuery1 do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bmmc=' + quotedstr(cbb_bm.Text));
    Open;
  end;
  lbl_bm_no.Caption := IBCQuery1.Fields[0].AsString;
  lbl_rybm.Caption := IBCQuery1.Fields[0].AsString;
  with IBCQuery1 do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr(lbl_bm_no.Caption + '.__'));
    Open;
  end;
  while not IBCQuery1.Eof do
  begin
    cbb_xsbm.Items.Add(IBCQuery1.Fields[1].AsString);
    IBCQuery1.Next;
  end;
end;

procedure Tfrm_changyong_cx.cbb_bmDropDown(Sender: TObject);
begin
{  lbl_bm_no.Caption := '0';
  lbl_xsbm_no.Caption := '0';
  cbb_bm.Clear;
  cbb_xsbm.Clear;
  with IBCQuery1 do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bmmc=' + quotedstr(cbb_dw.Text));
    Open;
  end;
  lbl_dw_no.Caption := IBCQuery1.Fields[0].AsString;
  with IBCQuery1 do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr(lbl_dw_no.Caption + '.__'));
    Open;
  end;
  while not IBCQuery1.Eof do
  begin
    cbb_bm.Items.Add(IBCQuery1.Fields[1].AsString);
    IBCQuery1.Next;
  end;}
end;

procedure Tfrm_changyong_cx.cbb_xsbm3DropDown(Sender: TObject);
begin
  lbl_xsbm_no.Caption := '0';
  cbb_xsbm.Items.Clear;
  with IBCQuery1 do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bmmc=' + quotedstr(cbb_bm.Text));
    Open;
  end;
  lbl_bm_no.Caption := IBCQuery1.Fields[0].AsString;

  with IBCQuery1 do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr(lbl_bm_no.Caption + '.%'));
    Open;
  end;
  while not IBCQuery1.Eof do
  begin
    cbb_xsbm.Items.Add(IBCQuery1.Fields[1].AsString);
    IBCQuery1.Next;
  end;
end;

procedure Tfrm_changyong_cx.cbb_xsbm3Select(Sender: TObject);
begin
  with IBCQuery1 do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bmmc=' + quotedstr(cbb_xsbm.Text));
    Open;
  end;
  lbl_xsbm_no.Caption := IBCQuery1.Fields[0].AsString;
  lbl_rybm.Caption := IBCQuery1.Fields[0].AsString;
end;

procedure Tfrm_changyong_cx.PDF1Click(Sender: TObject);
begin
  frxrprt1.ShowReport(true);
end;

procedure Tfrm_changyong_cx.ComboBox2Select(Sender: TObject);
begin
  ComboBox3.ItemIndex := ComboBox3.Items.Count - 1;
end;

procedure Tfrm_changyong_cx.btn_rygz_cxClick(Sender: TObject);
begin
  with IBCQry_rygz do begin
    Close;
    SQL.Clear;
    sql.Add('select * from gzd_item where gzd_month>='+quotedstr(ComboBox2.Text)+' and gzd_month<='+quotedstr(ComboBox3.Text));
    open;
  end;
  if RadioButton1.Checked then  //按员工编号查询
  begin
   if edt_ry_no.Text <>'' then begin
   with IBCQry_rygz do begin
    Close;
    SQL.Clear;
    sql.Add('select * from gzd_item where gzd_month>='+quotedstr(ComboBox2.Text)+' and gzd_month<='+quotedstr(ComboBox3.Text)+' and ry_no='+quotedstr(edt_ry_no.Text));
    open;
    end;
  end
  else
  begin
    ShowMessage('请输入员工编号');
    edt_ry_no.SetFocus;
  end;
  end;
  if RadioButton2.Checked then   //按员工姓名模糊查询
  begin
   with IBCQry_rygz do begin
    Close;
    SQL.Clear;
    sql.Add('select * from gzd_item where gzd_month>='+quotedstr(ComboBox2.Text)+' and gzd_month<='+quotedstr(ComboBox3.Text)+' and ry_name like '+quotedstr('%'+edt_ry_name.Text+'%'));
    open;
    end;
  end;
 // end;
end;

procedure Tfrm_changyong_cx.cbb_xsbmSelect(Sender: TObject);
begin
 cbb_xsbm1.Clear;
  with IBCQuery1 do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bmmc=' + quotedstr(cbb_xsbm.Text));
    Open;
  end;
  lbl_xsbm_no.Caption := IBCQuery1.Fields[0].AsString;
  lbl_rybm.Caption := IBCQuery1.Fields[0].AsString;
  with IBCQuery1 do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr(lbl_rybm.Caption + '.__'));
    Open;
  end;
  while not IBCQuery1.Eof do
  begin
    cbb_xsbm1.Items.Add(IBCQuery1.Fields[1].AsString);
    IBCQuery1.Next;
  end;
end;

procedure Tfrm_changyong_cx.cbb_xsbm1Select(Sender: TObject);
begin
  with IBCQuery1 do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bmmc=' + quotedstr(cbb_xsbm1.Text));
    Open;
  end;
  lbl_xsbm_no.Caption := IBCQuery1.Fields[0].AsString;
  lbl_rybm.Caption := IBCQuery1.Fields[0].AsString;
end;

procedure Tfrm_changyong_cx.ComboBox4Change(Sender: TObject);
begin
   if ComboBox4.ItemIndex <>0 then begin
    IBCQuery2.Filter := 'GZ_ZWMC like '+quotedstr('%'+ComboBox4.Text+'%');
    IBCQuery2.Filtered:=True;
    label4.Caption := IntToStr(IBCQuery2.RecordCount) + ' 位符合条件的员工';
    end
    else
    begin
       IBCQuery2.Filtered :=False;
       label4.Caption := IntToStr(IBCQuery2.RecordCount) + ' 位符合条件的员工';
    end;  
end;

procedure Tfrm_changyong_cx.N1Click(Sender: TObject);
var 
  ExpClass:TDBGridEhExportClass;
begin
ExpClass := TDBGridEhExportAsXLS;
  SaveDialog1.Execute;
  SaveDBGridEhToExportFile(ExpClass,DBGridEh1,SaveDialog1.FileName,True);
  ShowMessage('导出成功');
end;

end.

