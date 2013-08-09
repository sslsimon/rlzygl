unit Add_ryzl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, jpeg, Mask, DB,
  IBQuery, IBDatabase, IBTable, Grids, DBGrids,
  frxClass, IBCustomDataSet, MemDS, IBC, StrUtils, DBAccess, Menus;

type
  TFrm_Addryzl = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edt_ygmphone: TEdit;
    edt_yg_jt_address: TEdit;
    edt_ygphone: TEdit;
    edt_yghkszd: TEdit;
    edt_yg_address_poscode: TEdit;
    edt_ygno: TEdit;
    edt_ygname: TEdit;
    edt_ygsfzh: TEdit;
    cbb_ybxb: TComboBox;
    cbb_yghkxz: TComboBox;
    edt_ygsbzh: TEdit;
    cbb_ygzt: TComboBox;
    cbb_yghyzk: TComboBox;
    edt_ygzy: TEdit;
    cbb_ygzgxl: TComboBox;
    btn_ygno: TButton;
    GroupBox1: TGroupBox;
    btn_ins_photo: TButton;
    btn_del_photo: TButton;
    Image1: TImage;
    lbl1: TLabel;
    dtp_csrq: TDateTimePicker;
    dtp_rzrq: TDateTimePicker;
    dtp_zzrq: TDateTimePicker;
    dtp_lzrq: TDateTimePicker;
    dtp_htqdrq: TDateTimePicker;
    dtp_htdqrq: TDateTimePicker;
    dtp_sbsgrq: TDateTimePicker;
    dtp_sbtbrq: TDateTimePicker;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Label7: TLabel;
    lbl_ygno: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    dtp_pxjl1: TDateTimePicker;
    dtp_pxjl2: TDateTimePicker;
    edt_jy_address: TEdit;
    edt_jy_zymc: TEdit;
    cbb_jy_xl: TComboBox;
    Label33: TLabel;
    lbl_ygno1: TLabel;
    dtp_gzjl1: TDateTimePicker;
    dtp_gzjl2: TDateTimePicker;
    Label35: TLabel;
    Label36: TLabel;
    edt_gzjl_address: TEdit;
    Label37: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    lbl_ygno2: TLabel;
    dtp_xzbd_bdrq: TDateTimePicker;
    Label44: TLabel;
    Label46: TLabel;
    edt_xzbd_bdhje: TEdit;
    Label48: TLabel;
    mmo_jy_bz: TMemo;
    mmo_gzjl_bz: TMemo;
    lbl_yggl: TLabel;
    lbl_now_gz: TLabel;
    mmo_xzbd_bz: TMemo;
    Panel1: TPanel;
    btn_save: TButton;
    btn_cancel: TButton;
    btn_add: TButton;
    btn_edit: TButton;
    Panel2: TPanel;
    btn_jyjl_save: TButton;
    btn_jyjl_cancel: TButton;
    btn_jyjl_add: TButton;
    btn_jyjl_edit: TButton;
    Panel3: TPanel;
    btn_gzjl_save: TButton;
    btn_gzjl_cancel: TButton;
    btn_gzjl_add: TButton;
    btn_gzjl_edit: TButton;
    Panel4: TPanel;
    btn_xzbd_save: TButton;
    btn_xzbd_cancel: TButton;
    btn_xzbd_add: TButton;
    btn_xzbd_edit: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    ds_jyjl: TDataSource;
    ds_gzjl: TDataSource;
    ds_GZBD: TDataSource;
    cbb_gzjl_zwmc: TComboBox;
    TabSheet2: TTabSheet;
    Label34: TLabel;
    lbl_ygno0: TLabel;
    Label42: TLabel;
    DBGrid4: TDBGrid;
    Label43: TLabel;
    Label45: TLabel;
    Label47: TLabel;
    Label49: TLabel;
    edt_jtry_name: TEdit;
    edt_jtry_gx: TEdit;
    edt_jtry_address: TEdit;
    edt_jtry_work_address: TEdit;
    edt_jtry_phone: TEdit;
    Panel5: TPanel;
    btn_jtgx_save: TButton;
    btn_jtgx_cancel: TButton;
    btn_jtgx_add: TButton;
    btn_jtgx_edit: TButton;
    ds_jtgx: TDataSource;
    btn_cx: TButton;
    Label39: TLabel;
    edt_zic: TEdit;
    Label50: TLabel;
    edt_zigz: TEdit;
    frxReport1: TfrxReport;
    Label51: TLabel;
    lbl_zw: TLabel;
    ibqry_insert: TIBCQuery;
    ibqry_ry_zwxx: TIBCQuery;
    ibqry_ryxl: TIBCQuery;
    IBQuery_edit_photo: TIBCQuery;
    ibqry_get_maxno: TIBCQuery;
    ibqry_bmxx: TIBCQuery;
    ibqry_ry_photo: TIBCQuery;
    ibtbl_edit_photo: TIBCTable;
    IBTransaction_jtgx: TIBCTransaction;
    ibtbl_jtgx: TIBCTable;
    ibtbl_jtgxJTGX_ID: TIntegerField;
    ibtbl_jtgxRY_NO: TIntegerField;
    ibtbl_jtgxJTRY_NAME: TStringField;
    ibtbl_jtgxJTRY_GX: TStringField;
    ibtbl_jtgxJTRY_ADDRESS: TStringField;
    ibtbl_jtgxJTRY_WORK_ADDRESS: TStringField;
    ibtbl_jtgxJTRY_PHONE: TStringField;
    ibtbl_JYJL: TIBCTable;
    IBTransaction_JYJL: TIBCTransaction;
    ibtbl_JYJLJYJL_ID: TIntegerField;
    ibtbl_JYJLRY_NO: TIntegerField;
    ibtbl_JYJLJY_KSRQ: TDateField;
    ibtbl_JYJLJY_JSRQ: TDateField;
    ibtbl_JYJLJY_ADDRESS: TStringField;
    ibtbl_JYJLJY_ZYMC: TStringField;
    ibtbl_JYJLJY_XLMC: TStringField;
    ibtbl_JYJLJY_BZ: TStringField;
    ibtbl_gzjl: TIBCTable;
    IBTransaction_GZJL: TIBCTransaction;
    ibtbl_gzjlGZJL_ID: TIntegerField;
    ibtbl_gzjlRY_NO: TIntegerField;
    ibtbl_gzjlGZ_KSRQ: TDateField;
    ibtbl_gzjlGZ_JSRQ: TDateField;
    ibtbl_gzjlGZ_ADDRESS: TStringField;
    ibtbl_gzjlGZ_ZWMC: TStringField;
    ibtbl_gzjlGZ_BZ: TStringField;
    IBTransaction_XZBD: TIBCTransaction;
    ibtbl_XZBD: TIBCTable;
    ibtbl_XZBDXZBDJL_ID: TIntegerField;
    ibtbl_XZBDRY_NO: TIntegerField;
    ibtbl_XZBDXZBD_BDRQ: TDateField;
    ibtbl_XZBDXZBD_BDHJE: TStringField;
    ibtbl_XZBDXZBD_BZ: TStringField;
    mmo_bz: TMemo;
    lbl_BZ: TLabel;
    ibcqry_ry_sfz: TIBCQuery;
    Button1: TButton;
    ibcqry_ryxx: TIBCQuery;
    Button2: TButton;
    TabSheet6: TTabSheet;
    lbl_ygno3: TLabel;
    Label53: TLabel;
    Memo1: TMemo;
    Panel6: TPanel;
    Btn_save_cpjg: TButton;
    Btn_cancel_cpjg: TButton;
    btn_add_cpjg: TButton;
    btn_edit_cpjg: TButton;
    OpenDialog1: TOpenDialog;
    lbl_is_edit: TLabel;
    GroupBox2: TGroupBox;
    cbb_dw: TComboBox;
    cbb_bm: TComboBox;
    cbb_xsbm: TComboBox;
    cbb_xsbm1: TComboBox;
    lbl_xsbm_no: TLabel;
    lbl_rybm: TLabel;
    lbl_bm_no: TLabel;
    lbl_dw_no: TLabel;
    pm1: TPopupMenu;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_addClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure btn_ygnoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_del_photoClick(Sender: TObject);
    procedure btn_ins_photoClick(Sender: TObject);
    procedure get_max_no;
    procedure cbb_dwSelect(Sender: TObject);
    procedure dtp_rzrqChange(Sender: TObject);
    procedure cbb_bmSelect(Sender: TObject);
    procedure cbb_xsbmSelect(Sender: TObject);
    procedure refsh_data;
    procedure ds_jyjlDataChange(Sender: TObject; Field: TField);
    procedure ds_gzjlDataChange(Sender: TObject; Field: TField);
    procedure ds_GZBDDataChange(Sender: TObject; Field: TField);
    procedure btn_jyjl_addClick(Sender: TObject);
    procedure btn_jyjl_editClick(Sender: TObject);
    procedure btn_jyjl_saveClick(Sender: TObject);
    procedure btn_jyjl_cancelClick(Sender: TObject);
    procedure btn_gzjl_addClick(Sender: TObject);
    procedure btn_gzjl_editClick(Sender: TObject);
    procedure btn_gzjl_saveClick(Sender: TObject);
    procedure btn_gzjl_cancelClick(Sender: TObject);
    procedure btn_xzbd_addClick(Sender: TObject);
    procedure btn_xzbd_editClick(Sender: TObject);
    procedure btn_xzbd_saveClick(Sender: TObject);
    procedure btn_xzbd_cancelClick(Sender: TObject);
    procedure ds_jtgxDataChange(Sender: TObject; Field: TField);
    procedure btn_jtgx_addClick(Sender: TObject);
    procedure btn_jtgx_editClick(Sender: TObject);
    procedure btn_jtgx_cancelClick(Sender: TObject);
    procedure btn_jtgx_saveClick(Sender: TObject);
    procedure btn_cxClick(Sender: TObject);
    procedure cbb_xsbmDropDown(Sender: TObject);
    procedure cbb_bmDropDown(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dtp_lzrqChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure get_ryxx_last;
    procedure PageControl1Change(Sender: TObject);
    procedure btn_add_cpjgClick(Sender: TObject);
    procedure btn_edit_cpjgClick(Sender: TObject);
    procedure Btn_save_cpjgClick(Sender: TObject);
    procedure Btn_cancel_cpjgClick(Sender: TObject);
    procedure dtp_htqdrqChange(Sender: TObject);
    procedure cbb_xsbm1DropDown(Sender: TObject);
    procedure cbb_xsbm1Select(Sender: TObject);
    procedure cbb_gzjl_zwmcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbb_gzjl_zwmcKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  Frm_Addryzl: TFrm_Addryzl;
var max_no, yg_no: Integer; // -- max_no最大记录号 yg_no 人员编号

implementation
uses ryzl_qry_edit, MainUnit;
{$R *.dfm}

procedure tfrm_addryzl.get_max_no;
begin
  with ibqry_get_maxno do begin
    Close;
    sql.Clear;
    sql.Add('select max(ry_no) from ryxx');
    Open;
  end;
  if ibqry_get_maxno.Fields[0].Value = null then begin
    max_no := 8000;
  end
  else
  begin
    max_no := ibqry_get_maxno.Fields[0].AsInteger;
  end;
end;

procedure tfrm_addryzl.refsh_data; //刷新数据
begin
  try

  ibtbl_JYJL.Close; //教育经历表
  ibtbl_JYJL.Open;
  ibtbl_JYJL.Filter := 'ry_no=' + lbl_ygno.Caption;
  ibtbl_JYJL.Filtered := true;
  ibtbl_JYJL.Last;

  ibtbl_gzjl.Close; //工作经历表
  ibtbl_gzjl.Open;
  ibtbl_gzjl.Filter := 'ry_no=' + lbl_ygno.Caption;
  ibtbl_gzjl.Filtered := true;
  ibtbl_gzjl.Last;

  ibtbl_xzbd.Close; // 薪资变动表
  ibtbl_xzbd.Open;
  ibtbl_xzbd.Filter := 'ry_no=' + lbl_ygno.Caption;
  ibtbl_xzbd.Filtered := true;
  ibtbl_XZBD.Last;

  ibtbl_jtgx.Close;
  ibtbl_jtgx.Open; //家庭关系表
  ibtbl_jtgx.Filter := 'ry_no=' + lbl_ygno.Caption;
  ibtbl_jtgx.filtered := True;
  ibtbl_jtgx.Last;
  with ibcqry_ryxx do begin
    Close;
   if edt_ygno.Text <>'' then
    SQL.Text := 'select RY_GL FROM RYXX WHERE RY_NO=' + quotedstr(edt_ygno.Text)
    else
    Exit;
    Open;
    lbl_yggl.Caption := '员工工龄：' + ibcqry_ryxx.fieldbyname('RY_GL').AsString + '年';
  end;

      with ibcqry_ryxx do begin //取薪资变动
      close;
      sql.Text := 'select ry_no, xzbd_bdhje from ryxx_xzbdjl'
        + ' where xzbd_bdrq=(select max(xzbd_bdrq) from ryxx_xzbdjl where ry_no=' + quotedstr(edt_ygno.text) + ') and ry_no=' + quotedstr(edt_ygno.text);
      Open;
    end;
    if ibcqry_ryxx.IsEmpty then begin
      lbl_now_gz.Caption := '目前薪资：￥0元';
    end
    else
    begin
      lbl_now_gz.Caption := '目前薪资：￥' + ibcqry_ryxx.Fields[1].AsString + '元';
    end;

  except
    end;
end;

procedure tfrm_addryzl.get_ryxx_last;
var
  pics: TStream;
  Jpeg: TJpegImage;
  ry_bm: string;
begin
  get_max_no;
  with ibcqry_ryxx do begin
    Close;
    SQL.Text := 'select * from ryxx where ry_no=' + quotedstr(IntToStr(max_no));
    open;
  end;
  edt_ygno.Text := ibcqry_ryxx.fieldbyname('RY_NO').AsString;
  if not ibcqry_ryxx.IsEmpty then begin
    lbl_ygno.Caption := edt_ygno.Text;
    lbl_ygno1.Caption := edt_ygno.Text;
    lbl_ygno2.Caption := edt_ygno.Text;
    lbl_ygno0.Caption := edt_ygno.Text;
    lbl_ygno3.Caption := edt_ygno.Text;
    edt_ygname.Text := ibcqry_ryxx.fieldbyname('RY_NAME').AsString;
    if ibcqry_ryxx.fieldbyname('RY_SEX').AsString = '男' then
      cbb_ybxb.itemindex := 0;
    if ibcqry_ryxx.fieldbyname('RY_SEX').AsString = '女' then
      cbb_ybxb.itemindex := 1;
    if ibcqry_ryxx.fieldbyname('RY_CSRQ').Value = null then
      dtp_csrq.DateTime := StrToDate('1900-01-01')
    else
      dtp_csrq.DateTime := ibcqry_ryxx.fieldbyname('RY_CSRQ').Value;
    edt_ygsfzh.Text := ibcqry_ryxx.fieldbyname('RY_SFZH').AsString;
    edt_ygmphone.Text := ibcqry_ryxx.fieldbyname('RY_MOBEL_PHONE').AsString;
    edt_ygphone.Text := ibcqry_ryxx.fieldbyname('RY_PHONE').AsString;
    edt_yg_jt_address.Text := ibcqry_ryxx.fieldbyname('RY_JTZZ').AsString;
    edt_yg_address_poscode.Text := ibcqry_ryxx.fieldbyname('RY_JTZZYZBM').AsString;
    edt_yghkszd.Text := ibcqry_ryxx.fieldbyname('RY_HKSZD').AsString;

    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '本地城镇' then
      cbb_yghkxz.ItemIndex := 0;
    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '本地农村' then
      cbb_yghkxz.ItemIndex := 1;
    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '非本地城镇' then
      cbb_yghkxz.ItemIndex := 2;
    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '非本地农村' then
      cbb_yghkxz.ItemIndex := 3;
    if ibcqry_ryxx.fieldbyname('RY_RZRQ').Value = null then
      dtp_rzrq.date := StrToDate('1900-01-01')
    else
      dtp_rzrq.date := ibcqry_ryxx.fieldbyname('RY_RZRQ').Value;
    if ibcqry_ryxx.fieldbyname('RY_ZZRQ').Value = null then
      dtp_zzrq.date := StrToDate('1900-01-01')
    else
      dtp_zzrq.date := ibcqry_ryxx.fieldbyname('RY_ZZRQ').Value;
    if ibcqry_ryxx.fieldbyname('RY_LZRQ').Value = null then
      dtp_lzrq.date := StrToDate('1900-01-01')
    else
      dtp_lzrq.date := ibcqry_ryxx.fieldbyname('RY_LZRQ').Value;

    if ibcqry_ryxx.FieldByName('RY_HY').AsString = '未婚' then
      cbb_yghyzk.ItemIndex := 0;
    if ibcqry_ryxx.FieldByName('RY_HY').AsString = '已婚' then
      cbb_yghyzk.ItemIndex := 1;
    if ibcqry_ryxx.FieldByName('RY_HY').AsString = '其它' then
      cbb_yghyzk.ItemIndex := 2;
    edt_ygzy.Text := ibcqry_ryxx.fieldbyname('RY_ZY').AsString;

    if ibcqry_ryxx.fieldbyname('RY_HTRQ_BEGIN').Value = null then
      dtp_htqdrq.date := StrToDate('1900-01-01')
    else
      dtp_htqdrq.date := ibcqry_ryxx.fieldbyname('RY_HTRQ_BEGIN').Value;
    if ibcqry_ryxx.fieldbyname('RY_HTRQ_END').Value = null then
      dtp_htdqrq.date := StrToDate('1900-01-01')
    else
      dtp_htdqrq.date := ibcqry_ryxx.fieldbyname('RY_HTRQ_END').Value;


    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '0' then
      cbb_ygzt.ItemIndex := 0;
    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '1' then
      cbb_ygzt.ItemIndex := 1;
    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '2' then
      cbb_ygzt.ItemIndex := 2;
    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '3' then
      cbb_ygzt.ItemIndex := 3;
    edt_ygsbzh.Text := ibcqry_ryxx.fieldbyname('RY_SBZH').AsString;
    if ibcqry_ryxx.fieldbyname('RY_SB_SQRQ').Value = null then
      dtp_sbsgrq.date := StrToDate('1900-01-01')
    else
      dtp_sbsgrq.date := ibcqry_ryxx.fieldbyname('RY_SB_SQRQ').Value;

    if ibcqry_ryxx.fieldbyname('RY_SB_TBRQ').Value = null then
      dtp_sbtbrq.date := StrToDate('1900-01-01')
    else
      dtp_sbtbrq.date := ibcqry_ryxx.fieldbyname('RY_SB_TBRQ').Value;
    //lbl_dw_no.Caption := ibcqry_ryxx.fieldbyname('RY_DW').AsString;
    lbl_bm_no.Caption := ibcqry_ryxx.fieldbyname('RY_BM').AsString;
    //lbl_xsbm_no.Caption := ibcqry_ryxx.fieldbyname('RY_XSBM').AsString;
    edt_zic.Text := ibcqry_ryxx.fieldbyname('RY_ZIC').AsString;
    edt_ziGz.Text := ibcqry_ryxx.fieldbyname('RY_ZIGZ').AsString;
    lbl_yggl.Caption := '员工工龄：' + ibcqry_ryxx.fieldbyname('RY_GL').AsString + '年';
    mmo_bz.Text := ibcqry_ryxx.fieldbyname('RY_BZ').AsString;
  //取部门信息
    with ibcqry_ryxx do begin
      Close;
      sql.Text := 'select a.bmmc,B.RY_BM from bmxx a,ryxx b'
        + ' where a.bm_no=b.ry_BM and b.ry_no=' + quotedstr(edt_ygno.text);
      Open;
      ry_bm := ibcqry_ryxx.Fields[1].asstring;
      if Length(ry_bm) = 2 then begin //一级部门
        cbb_dw.ItemIndex := cbb_dw.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
        cbb_bm.ItemIndex := -1;
        cbb_xsbm.ItemIndex := -1;
        lbl_rybm.Caption := RY_BM;
      end;
      if Length(ry_bm) = 5 then begin //二级部门
        with ibcqry_ryxx do begin
          Close;
          SQL.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 2));
          open;
          cbb_dw.ItemIndex := cbb_dw.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(ry_bm);
          open;
          cbb_bm.ItemIndex := cbb_bm.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          cbb_xsbm.ItemIndex := -1;
        end;
        lbl_rybm.Caption := RY_BM;
      end;

      if Length(ry_bm) = 8 then begin //三级部门
        with ibcqry_ryxx do begin
          Close;
          SQL.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 2));
          open;
          cbb_dw.ItemIndex := cbb_dw.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 5));
          open;
          cbb_bm.ItemIndex := cbb_bm.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(ry_bm);
          open;
          cbb_xsbm.ItemIndex := cbb_xsbm.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
        end;
        lbl_rybm.Caption := RY_BM;
      end;
      if Length(ry_bm) = 11 then begin //四级部门
        with ibcqry_ryxx do begin
          Close;
          SQL.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 2));
          open;
          cbb_dw.ItemIndex := cbb_dw.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 5));
          open;
          cbb_bm.ItemIndex := cbb_bm.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 8));
          Open;
          cbb_xsbm.ItemIndex := cbb_xsbm.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(ry_bm);
          open;
          cbb_xsbm1.ItemIndex := cbb_xsbm1.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
        end;
        lbl_rybm.Caption := RY_BM;
      end;

           sql.Clear; //取人员学历
      sql.Add('select a.xlmc from xlxx a,ryxx b'
        + ' where a.xlmc=b.ry_zgxl and b.ry_no=' + quotedstr(edt_ygno.text));
      Open;
      cbb_ygzgxl.Text := ibcqry_ryxx.Fields[0].AsString;
    end;

    //取联系人照片
    with ibqry_ry_photo do begin
      Close;
      sql.Text := 'select ry_no from ryxx_photo where ry_no=' + quotedstr(edt_ygno.Text);
      Open;
    end;
    if ibqry_ry_photo.IsEmpty then begin
      Image1.Picture := nil;
      //abort;
    end
    else
    begin
      with ibqry_ry_photo do begin
        Close;
        sql.Text := 'select ry_no,PHOTO from ryxx_photo where ry_no=' + quotedstr(edt_ygno.Text);
        Open;
      end;
      pics := TMemoryStream.Create;

      ibqry_ry_photo.Locate('ry_no', edt_ygno.Text, [loPartialKey]);
      TBlobField(ibqry_ry_photo.FieldByName('photo')).SaveToStream(pics); //将二进制存入内存流
      pics.Position := 0;
      Jpeg := TJpegImage.Create;
      Jpeg.LoadFromStream(pics); //将流识别为JPEG格式
      Image1.Picture.Assign(jpeg);
      pics.Free;
      jpeg.Free;
    end;


    with ibcqry_ryxx do begin //取人员职务
      Close;
      sql.Text := 'select ry_no, gz_zwmc from ryxx_gzjl where gz_jsrq=(select max(gz_jsrq)'
        + ' from ryxx_gzjl where ry_no=' + quotedstr(edt_ygno.text) + ') and ry_no=' + quotedstr(edt_ygno.text);
      Open;
    end;
    if ibcqry_ryxx.IsEmpty then begin
      lbl_zw.Caption := '无';
    end
    else
    begin
      lbl_zw.Caption := ibcqry_ryxx.Fields[1].AsString;
    end;

    with ibcqry_ryxx do begin //取薪资变动
      close;
      sql.Text := 'select ry_no, xzbd_bdhje from ryxx_xzbdjl'
        + ' where xzbd_bdrq=(select max(xzbd_bdrq) from ryxx_xzbdjl where ry_no=' + quotedstr(edt_ygno.text) + ') and ry_no=' + quotedstr(edt_ygno.text);
      Open;
    end;
    if ibcqry_ryxx.IsEmpty then begin
      lbl_now_gz.Caption := '目前薪资：￥0元';
    end
    else
    begin
      lbl_now_gz.Caption := '目前薪资：￥' + ibcqry_ryxx.Fields[1].AsString + '元';
    end;

    with ibcqry_ryxx do begin
     close;
      sql.Text := 'select ry_no, ry_cpjg from ryxx_cpjg'
        + ' where ry_no=' + quotedstr(edt_ygno.text);
      Open;
    end;
    if ibcqry_ryxx.IsEmpty then begin
      Memo1.Text := '无';
      //ShowMessage(lbl_is_edit.Caption);
      btn_edit_cpjg.Enabled :=False;
      if lbl_is_edit.Caption ='0'then
      begin
      btn_add_cpjg.Enabled :=true;
      end
      else
      begin
      btn_add_cpjg.Enabled :=false;
      end;
    end
    else
    begin
      Memo1.Text := ibcqry_ryxx.Fields[1].AsString;
      if lbl_is_edit.Caption ='0' then
      btn_add_cpjg.Enabled :=false
      else
       btn_edit_cpjg.Enabled :=true;
       //end;
end;


    refsh_data;
  end
end;

procedure TFrm_Addryzl.FormClose(Sender: TObject;
  var Action: TCloseAction);
var i: Integer;
begin

  for i := 0 to self.componentcount - 1 do begin
    if self.components[i] is TIBCTable then
      TIBCTable(self.components[i]).Close;
    if self.components[i] is TIBCQuery then
      TIBCQuery(self.components[i]).Close;
  end;

  action := cafree;
  Frm_Addryzl := nil;
end;

procedure TFrm_Addryzl.btn_addClick(Sender: TObject);
var i: Integer;
begin
  is_edit1 := 0;
  lbl_is_edit.Caption  :='0';
  btn_save.Enabled := true;
  btn_cancel.Enabled := true;
  btn_add.Enabled := false;
  btn_edit.Enabled := False;
  btn_cx.Enabled := False;
  Button1.Enabled :=false;
  Button2.Enabled := false;
  btn_ins_photo.Enabled := true;
  btn_del_photo.Enabled := true;
  TabSheet2.TabVisible := False;
  TabSheet3.TabVisible := False;
  TabSheet4.TabVisible := False;
  TabSheet5.TabVisible := False;
  TabSheet6.TabVisible := false;

  for i := 0 to self.componentcount - 1 do begin
    if self.components[i] is Tedit then
    begin
      Tedit(self.components[i]).Color := clWindow;
      Tedit(self.components[i]).Enabled := true;
    end;
    if self.components[i] is TComboBox then
      TComboBox(self.components[i]).Enabled := true;
    if self.components[i] is tdatetimepicker then
      tdatetimepicker(self.components[i]).Enabled := true;
    if self.components[i] is TMemo then
      TMemo(self.components[i]).Enabled := true;
  end;
 //清空表单
  cbb_dw.ItemIndex := -1;
  cbb_bm.ItemIndex := -1;
  cbb_xsbm.ItemIndex := -1;
  cbb_xsbm1.ItemIndex := -1;
  edt_ygname.Clear;
  cbb_ybxb.ItemIndex := -1;
  dtp_csrq.Date := StrToDate('1900-01-01');
  edt_ygsfzh.Clear;
  edt_ygmphone.Clear;
  edt_ygphone.Clear;
  edt_yg_jt_address.Clear;
  edt_yg_address_poscode.Clear;
  edt_yghkszd.Clear;
  cbb_yghkxz.ItemIndex := -1;
  dtp_rzrq.Date := StrToDate('1900-01-01');
  dtp_zzrq.Date := StrToDate('1900-01-01');
  dtp_lzrq.Date := StrToDate('1900-01-01');
  cbb_yghyzk.ItemIndex := -1;
  cbb_ygzgxl.ItemIndex := -1;
  edt_ygzy.Clear;
  dtp_htqdrq.date := StrToDate('1900-01-01');
  dtp_htdqrq.date := StrToDate('1900-01-01');
  cbb_ygzt.ItemIndex := -1;
  edt_ygsbzh.Clear;
  dtp_sbsgrq.date := StrToDate('1900-01-01');
  dtp_sbtbrq.date := StrToDate('1900-01-01');
  get_max_no; //取最大记录号
  yg_no := max_no + 1;
  lbl_zw.Caption := '无';
  edt_ygno.Text := IntToStr(yg_no);
  lbl_ygno.Caption := edt_ygno.Text;
  lbl_ygno1.Caption := edt_ygno.Text;
  lbl_ygno2.Caption := edt_ygno.Text;
  lbl_ygno0.Caption := edt_ygno.Text;
  lbl_ygno3.Caption := edt_ygno.Text;
end;

procedure TFrm_Addryzl.btn_editClick(Sender: TObject);
var i: Integer;
begin
  is_edit1 := 1;
  lbl_is_edit.Caption :='1';
  if edt_ygno.Text = '0' then
  begin
    //ShowMessage('请点击员工编号，查询需要修改的人员');
    btn_ygno.Click;
  end
  else
  begin
    btn_save.Enabled := true;
    btn_cancel.Enabled := true;
    btn_add.Enabled := false;
    btn_edit.Enabled := False;
    btn_ins_photo.Enabled := true;
    btn_del_photo.Enabled := true;
    btn_cx.Enabled := false;
    Button1.Enabled := False;
    button2.Enabled := false;
    for i := 0 to self.componentcount - 1 do begin
      if self.components[i] is Tedit then
      begin
        Tedit(self.components[i]).Color := clWindow;
        Tedit(self.components[i]).Enabled := true;
      end;
      if self.components[i] is TComboBox then
        TComboBox(self.components[i]).Enabled := true;
      if self.components[i] is tdatetimepicker then
        tdatetimepicker(self.components[i]).Enabled := true;

      if self.components[i] is TMemo then
        TMemo(self.components[i]).Enabled := true;
    end;
    btn_ygno.Enabled := false;
    edt_ygno.Enabled := false;
  end;
end;

procedure TFrm_Addryzl.btn_saveClick(Sender: TObject);
var i: Integer;
begin
  ShortDateFormat := 'yyyy-MM-dd';
  //判断必填项目是否都填写
  if Trim(edt_ygname.Text) = '' then
  begin
    ShowMessage('忘了填写姓名了！');
    edt_ygname.SetFocus;
  end
  else
    if Trim(edt_ygsfzh.Text) = '' then
    begin
      ShowMessage('忘了填写身份证号了！');
      edt_ygsfzh.SetFocus;
    end
    else
      if Trim(edt_ygmphone.Text) = '' then
      begin
        ShowMessage('忘了填写手机号了！');
        edt_ygmphone.SetFocus;
      end
      else
        if datetostr(dtp_rzrq.Date) = '1900-01-01' then
        begin
          ShowMessage('忘了填写入职日期了！');
          dtp_rzrq.SetFocus;
        end
        else
         { if DateToStr(dtp_htqdrq.Date) = '1900-01-01' then
          begin
            ShowMessage('忘了填写合同签订日期了！');
            dtp_htqdrq.SetFocus;
          end
          else
            if datetostr(dtp_htdqrq.Date) = '1900-01-01' then
            begin
              ShowMessage('忘了填写合同到期日期了！');
              dtp_htdqrq.SetFocus;
            end
            else }
          if cbb_ygzt.ItemIndex = -1 then
          begin
            ShowMessage('忘了选择员工状态了！');
            cbb_ygzt.SetFocus;
          end
          else
          begin
            if is_edit1 = 0 then //插入开始
            begin
              with ibcqry_ry_sfz do begin //判断身份证是否重复
                Close;
                sql.Text := 'select RY_SFZH from RYXX where RY_SFZH=' + quotedstr(Trim(edt_ygsfzh.Text));
                open;
              end;
              if not ibcqry_ry_sfz.IsEmpty then
              begin
                Application.MessageBox('已存在相同的身份证号，请检查！', '资料录入',
                  MB_OK + MB_ICONWARNING);
                edt_ygsfzh.SetFocus;
              end
              else
              begin
                get_max_no;
                if max_no >= yg_no then begin
                  yg_no := yg_no + 1;
                  edt_ygno.Text := IntToStr(yg_no);
                  lbl_ygno.Caption := edt_ygno.Text;
                  lbl_ygno1.Caption := edt_ygno.Text;
                  lbl_ygno2.Caption := edt_ygno.Text;
                  lbl_ygno0.Caption := edt_ygno.Text;
                  lbl_ygno3.Caption := edt_ygno.Text;
                end;
                with ibqry_insert do begin
                  Close;
                  sql.Clear;
                  sql.Add('insert into ryxx (RY_NO,RY_NAME,RY_RZRQ,RY_ZT,RY_SFZH,RY_HTRQ_BEGIN,RY_HTRQ_END,RY_MOBEL_PHONE,'
                    + 'RY_BM,'
                    + 'RY_SEX,RY_ZZRQ,RY_LZRQ,RY_HY,RY_ZGXL,RY_ZY,RY_CSRQ,RY_JTZZ,RY_JTZZYZBM,RY_HKSZD,RY_HKXZ,RY_SBZH,RY_SB_SQRQ,RY_SB_TBRQ,RY_PHONE,RY_ZIC,RY_ZIGZ,RY_BZ)'
                    + ' values(:RY_NO,:RY_NAME,:RY_RZRQ,:RY_ZT,:RY_SFZH,:RY_HTRQ_BEGIN,:RY_HTRQ_END,:RY_MOBEL_PHONE,:RY_BM,'
                    + ':RY_SEX,:RY_ZZRQ,:RY_LZRQ,:RY_HY,:RY_ZGXL,:RY_ZY,:RY_CSRQ,:RY_JTZZ,:RY_JTZZYZBM,:RY_HKSZD,:RY_HKXZ,:RY_SBZH,:RY_SB_SQRQ,:RY_SB_TBRQ,:RY_PHONE,:RY_ZIC,:RY_ZIGZ,:RY_BZ)');
                  ParamByName('RY_NO').value := yg_no;
                  ParamByName('RY_NAME').asstring := edt_ygname.Text;

                  ParamByName('RY_RZRQ').AsDate := dtp_rzrq.Date;
                  ParamByName('RY_ZT').AsInteger := cbb_ygzt.ItemIndex;
                  ParamByName('RY_SFZH').AsString := Trim(edt_ygsfzh.Text);

                  if DateToStr(dtp_htqdrq.Date) = '1900-01-01' then
                    ParamByName('RY_HTRQ_BEGIN').Value := null
                  else
                    ParamByName('RY_HTRQ_BEGIN').AsDate := dtp_htqdrq.Date;
                  if DateToStr(dtp_htdqrq.Date) = '1900-01-01' then
                    ParamByName('RY_HTRQ_END').Value := null
                  else
                    ParamByName('RY_HTRQ_END').AsDate := dtp_htdqrq.Date;
                  ParamByName('RY_MOBEL_PHONE').AsString := Trim(edt_ygmphone.Text);
                 // ParamByName('RY_DW').AsString := lbl_dw_no.Caption;
                  ParamByName('RY_BM').AsString := lbl_rybm.Caption;
                  //ParamByName('RY_XSBM').AsString := lbl_xsbm_no.Caption;
                  ParamByName('RY_SEX').AsString := cbb_ybxb.Text;
                  if DateToStr(dtp_zzrq.Date) = '1900-01-01' then
                    ParamByName('RY_ZZRQ').Value := null
                  else
                    ParamByName('RY_ZZRQ').AsDate := dtp_zzrq.date;
                  if DateToStr(dtp_lzrq.Date) = '1900-01-01' then
                    ParamByName('RY_LZRQ').Value := null
                  else
                    ParamByName('RY_LZRQ').AsDate := dtp_lzrq.Date;
                  ParamByName('RY_HY').AsString := cbb_yghyzk.Text;
                  ParamByName('RY_ZGXL').AsString := cbb_ygzgxl.Text;
                  ParamByName('RY_ZY').AsString := Trim(edt_ygzy.Text);
                  if DateToStr(dtp_csrq.Date) = '1900-01-01' then
                    ParamByName('RY_CSRQ').Value := null
                  else
                    ParamByName('RY_CSRQ').AsDate := dtp_csrq.Date;

                  ParamByName('RY_JTZZ').AsString := Trim(edt_yg_jt_address.Text);
                  ParamByName('RY_JTZZYZBM').AsString := Trim(edt_yg_address_poscode.Text);
                  ParamByName('RY_HKSZD').AsString := Trim(edt_yghkszd.Text);
                  ParamByName('RY_HKXZ').AsString := cbb_yghkxz.Text;
                  ParamByName('RY_SBZH').AsString := Trim(edt_ygsbzh.Text);
                  ParamByName('RY_SB_SQRQ').AsDate := dtp_sbsgrq.Date;
                  if DateToStr(dtp_sbtbrq.Date) = '1900-01-01' then
                    ParamByName('RY_SB_TBRQ').value := null
                  else
                    ParamByName('RY_SB_TBRQ').asdate := dtp_sbtbrq.Date;
                  ParamByName('RY_PHONE').Value := Trim(edt_ygphone.Text);
                  ParamByName('RY_ZIC').Value := Trim(edt_ZIC.Text);
                  ParamByName('RY_ZIGZ').Value := Trim(edt_ZIGZ.Text);
                  ParamByName('RY_BZ').Value := Trim(mmo_bz.Text);
                  try
                    ExecSQL;
                    ShowMessage('添加成功！');
                    btn_add.Enabled := true;
                    btn_save.Enabled := false;
                    btn_cancel.Enabled := false;
                    Button2.Enabled := false;
                    btn_ins_photo.Enabled := true;
                    btn_del_photo.Enabled := true;
                    TabSheet2.TabVisible := true;
                    TabSheet3.TabVisible := true;
                    TabSheet4.TabVisible := true;
                    TabSheet5.TabVisible := true;
                    TabSheet6.TabVisible := true;
                    refsh_data;
                    for i := 0 to self.componentcount - 1 do begin
                      if self.components[i] is Tedit then
                        Tedit(self.components[i]).Enabled := false;
                      if self.components[i] is TComboBox then
                        TComboBox(self.components[i]).Enabled := false;
                      if self.components[i] is tdatetimepicker then
                        tdatetimepicker(self.components[i]).Enabled := false;
                      if self.components[i] is TMemo then
                        TMemo(self.components[i]).Enabled := false;
                      if Self.Components[i] is TDBGrid then
                        TDBGrid(self.Components[i]).Enabled := false;
                    end;
                  except
                    ShowMessage('添加失败！');
                    btn_add.Enabled := false;
                    btn_save.Enabled := true;
                    btn_cancel.Enabled := true;
                    Button2.Enabled := false;
                    btn_ins_photo.Enabled := false;
                    btn_del_photo.Enabled := false;
                    TabSheet2.TabVisible := false;
                    TabSheet3.TabVisible := false;
                    TabSheet4.TabVisible := false;
                    TabSheet5.TabVisible := false;
                    TabSheet6.TabVisible := false;
                  end;
                end;
              end;
            end // 插入结束
            else
              if is_edit1 = 1 then //修改开始
              begin
                with ibcqry_ry_sfz do begin //判断身份证是否重复
                  Close;
                  sql.Text := 'select RY_SFZH from RYXX where RY_SFZH=' + quotedstr(Trim(edt_ygsfzh.Text)) + ' and ry_no<>' + quotedstr(edt_ygno.Text);
                  open;
                end;
                if ibcqry_ry_sfz.RecordCount >= 1 then
                begin
                  Application.MessageBox('已存在相同的身份证号，请检查！', '资料录入',
                    MB_OK + MB_ICONWARNING);
                  edt_ygsfzh.SetFocus;
                end
                else
                begin
                  with ibqry_insert do begin
                    Close;
                    sql.Clear;
                    sql.Add('update ryxx set RY_NAME=:ry_name,RY_SFZH=:ry_sfzh,RY_MOBEL_PHONE=:RY_MOBEL_PHONE,'
                      + 'RY_RZRQ=:RY_RZRQ,RY_HTRQ_BEGIN=:RY_HTRQ_BEGIN,RY_HTRQ_END=:RY_HTRQ_END,RY_ZT=:RY_ZT,'
                      + 'RY_BM=:RY_BM,'
                      + 'RY_SEX=:ry_sex,RY_CSRQ=:RY_CSRQ,RY_PHONE=:RY_PHONE,RY_JTZZ=:RY_JTZZ,RY_JTZZYZBM=:RY_JTZZYZBM,'
                      + 'RY_HKSZD=:RY_HKSZD,RY_HKXZ=:RY_HKXZ,RY_ZZRQ=:RY_ZZRQ,RY_LZRQ=:RY_LZRQ,RY_HY=:RY_HY,RY_ZGXL=:RY_ZGXL,'
                      + 'RY_ZY=:RY_ZY,RY_SBZH=:RY_SBZH,RY_SB_SQRQ=:RY_SB_SQRQ,RY_SB_TBRQ=:RY_SB_TBRQ,RY_ZIC=:RY_ZIC,RY_ZIGZ=:RY_ZIGZ,RY_BZ=:RY_BZ'
                      + ' where ry_no=' + quotedstr(edt_ygno.Text));

                    ParamByName('ry_name').AsString := edt_ygname.Text;
                    ParamByName('ry_sfzh').AsString := edt_ygsfzh.Text;
                    ParamByName('RY_MOBEL_PHONE').AsString := edt_ygmphone.Text;

                    ParamByName('RY_RZRQ').AsString := FormatDateTime('yyyy-mm-dd', dtp_rzrq.Date);
                    if DateToStr(dtp_htqdrq.Date) = '1900-01-01' then
                      ParamByName('RY_HTRQ_BEGIN').value := null
                    else
                      ParamByName('RY_HTRQ_BEGIN').AsString := FormatDateTime('yyyy-mm-dd', dtp_htqdrq.Date);
                    if DateToStr(dtp_htdqrq.Date) = '1900-01-01' then
                      ParamByName('RY_HTRQ_END').value := null
                    else
                      ParamByName('RY_HTRQ_END').AsString := FormatDateTime('yyyy-mm-dd', dtp_htdqrq.Date);
                    ParamByName('RY_ZT').AsString := IntToStr(cbb_ygzt.ItemIndex);

                   // ParamByName('RY_DW').AsString := lbl_dw_no.Caption;
                    ParamByName('RY_BM').AsString := lbl_rybm.Caption;
                    //ParamByName('RY_XSBM').AsString := lbl_xsbm_no.Caption;

                    ParamByName('ry_SEX').AsString := cbb_ybxb.Text; ;
                    if DateToStr(dtp_csrq.Date) = '1900-01-01' then
                      ParamByName('RY_CSRQ').value := null
                    else
                      ParamByName('RY_CSRQ').AsString := FormatDateTime('yyyy-mm-dd', dtp_csrq.date);
                    ParamByName('RY_PHONE').AsString := edt_ygphone.Text;
                    ParamByName('RY_JTZZ').AsString := edt_yg_jt_address.Text;
                    ParamByName('RY_JTZZYZBM').AsString := edt_yg_address_poscode.Text;
                    ParamByName('RY_HKSZD').AsString := edt_yghkszd.Text;
                    ParamByName('RY_HKXZ').AsString := cbb_yghkxz.Text;
                    if DateToStr(dtp_zzrq.Date) = '1900-01-01' then
                      ParamByName('RY_ZZRQ').value := null
                    else
                      ParamByName('RY_ZZRQ').AsString := FormatDateTime('yyyy-mm-dd', dtp_zzrq.Date);
                    if DateToStr(dtp_lzrq.Date) = '1900-01-01' then
                      ParamByName('RY_LZRQ').value := null
                    else
                      ParamByName('RY_LZRQ').AsString := FormatDateTime('yyyy-mm-dd', dtp_lzrq.Date);
                    ParamByName('RY_HY').AsString := cbb_yghyzk.Text;
                    ParamByName('RY_ZGXL').AsString := cbb_ygzgxl.Text;
                    ParamByName('RY_ZY').AsString := edt_ygzy.Text;
                    ParamByName('RY_SBZH').AsString := edt_ygsbzh.Text;
                    if DateToStr(dtp_sbsgrq.Date) = '1900-01-01' then
                      ParamByName('RY_SB_SQRQ').value := null
                    else
                      ParamByName('RY_SB_SQRQ').AsString := FormatDateTime('yyyy-mm-dd', dtp_sbsgrq.Date);
                    if DateToStr(dtp_sbtbrq.Date) = '1900-01-01' then
                      ParamByName('RY_SB_TBRQ').value := null
                    else
                      ParamByName('RY_SB_TBRQ').AsString := FormatDateTime('yyyy-mm-dd', dtp_sbtbrq.Date);
                    ParamByName('RY_ZIC').Value := Trim(edt_ZIC.Text);
                    ParamByName('RY_ZIGZ').Value := Trim(edt_ZIGZ.Text);
                    ParamByName('RY_BZ').Value := Trim(mmo_bz.Text);
                    try
                      ExecSQL;
                      ShowMessage('修改成功！');
                      btn_edit.Enabled := true;
                      btn_save.Enabled := false;
                      btn_cancel.Enabled := false;
                      btn_ins_photo.Enabled := false;
                      btn_del_photo.Enabled := false;
                      btn_cx.Enabled := TRUE;
                      btn_ygno.Enabled := true;
                      Button1.Enabled := true;
                      Button2.Enabled := true;
                      refsh_data;
                      for i := 0 to self.componentcount - 1 do begin
                        if self.components[i] is Tedit then
                          Tedit(self.components[i]).Enabled := false;
                        if self.components[i] is TComboBox then
                          TComboBox(self.components[i]).Enabled := false;
                        if self.components[i] is tdatetimepicker then
                          tdatetimepicker(self.components[i]).Enabled := false;
                        if self.components[i] is TMemo then
                          TMemo(self.components[i]).Enabled := false;
                        if Self.Components[i] is TDBGrid then
                          TDBGrid(self.Components[i]).Enabled := false;
                      end;
                    except
                      ShowMessage('修改失败');
                      btn_edit.Enabled := false;
                      btn_save.Enabled := true;
                      btn_cancel.Enabled := true;
                      btn_ins_photo.Enabled := true;
                      btn_del_photo.Enabled := true;
                      btn_cx.Enabled := false;
                      btn_ygno.Enabled := false;
                      Button1.Enabled := false;
                      Button2.Enabled := false;
                    end;
                  end;
                end;
              end; //修改结果

          end;


end;

procedure TFrm_Addryzl.btn_cancelClick(Sender: TObject);
var I: Integer;
begin
  btn_save.Enabled := false;
  btn_cancel.Enabled := false;
  btn_ins_photo.Enabled := false;
  btn_del_photo.Enabled := false;
  TabSheet2.TabVisible := true;
  TabSheet3.TabVisible := true;
  TabSheet4.TabVisible := true;
  TabSheet5.TabVisible := true;
 TabSheet6.TabVisible := true;
  btn_cx.Enabled := TRUE;
  Button1.Enabled := true;
  Button2.Enabled := true;
   //相同组件统一设置
  for i := 0 to self.componentcount - 1 do begin
    if self.components[i] is Tedit then
    begin
      Tedit(self.components[i]).Color := clBtnFace;
      Tedit(self.components[i]).Enabled := false;
    end;
    if self.components[i] is TComboBox then
      TComboBox(self.components[i]).Enabled := false;
    if self.components[i] is tdatetimepicker then
      tdatetimepicker(self.components[i]).Enabled := false;
    if Self.Components[i] is TDBGrid then
      TDBGrid(self.Components[i]).Enabled := false;
  end;
  if is_edit = 0 then
  begin
    btn_add.Enabled := true;
  end
  else
  begin
    btn_edit.Enabled := true;
    btn_ygno.Enabled := true;
  end;
end;

procedure TFrm_Addryzl.btn_ygnoClick(Sender: TObject);
begin
  if frm_ryzl_qry_edit = nil then frm_ryzl_qry_edit := Tfrm_ryzl_qry_edit.Create(application);
  frm_ryzl_qry_edit.ShowModal;
end;

procedure TFrm_Addryzl.FormShow(Sender: TObject);
var
  i: integer;
begin
 lbl_dw_no.Caption := '0';
  lbl_bm_no.Caption := '0';
  lbl_xsbm_no.Caption := '0';
  btn_ins_photo.Enabled := false;
  btn_del_photo.Enabled := False;
  if is_edit = 0 then begin //添加
    btn_add.Enabled := true;
    btn_edit.Enabled := False;
    btn_jtgx_add.Enabled := True;
    btn_jtgx_edit.Enabled := False;
    btn_jyjl_add.Enabled := True;
    btn_jyjl_edit.Enabled := False;
    btn_gzjl_add.Enabled := true;
    btn_gzjl_edit.Enabled := false;
    btn_xzbd_add.Enabled := true;
    btn_xzbd_edit.Enabled := False;
    btn_add_cpjg.Enabled := True;
    btn_edit_cpjg.Enabled := False;
  end
  else
    if is_edit = 1 then begin
      begin //修改
        btn_add.Enabled := False;
        btn_edit.Enabled := true;
        Button1.Enabled := True;
        button2.Enabled := True;
        btn_jtgx_add.Enabled := false;
        btn_jtgx_edit.Enabled := True;
        btn_jyjl_add.Enabled := false;
        btn_jyjl_edit.Enabled := True;
        btn_gzjl_add.Enabled := false;
        btn_gzjl_edit.Enabled := True;
        btn_xzbd_add.Enabled := true;
        btn_xzbd_edit.Enabled := True;
        btn_add_cpjg.Enabled := false;
        btn_edit_cpjg.Enabled := True;
      end;
    end;
   { else
      if is_edit = 2 then //查询
      begin
        for i := 0 to self.componentcount - 1 do begin
          if self.components[i] is Tbutton then
            Tbutton(self.components[i]).Enabled := false;
        end;
        btn_cx.Enabled := true;
      end; }
  with ibqry_bmxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr('__') + ' ORDER BY BM_NO');
    Open;
  end;
  cbb_dw.Items.Clear;
  while not ibqry_bmxx.Eof do
  begin
    cbb_dw.Items.Add(ibqry_bmxx.Fields[1].AsString);
    ibqry_bmxx.Next;
  end;
  with ibqry_bmxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr('__.__') + ' ORDER BY BM_NO');
    Open;
  end;
  cbb_bm.Items.Clear;
  while not ibqry_bmxx.Eof do
  begin
    cbb_bm.Items.Add(ibqry_bmxx.Fields[1].AsString);
    ibqry_bmxx.Next;
  end;
  with ibqry_bmxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr('__.__.__') + ' ORDER BY BM_NO');
    Open;
  end;
  cbb_xsbm.Items.Clear;
  while not ibqry_bmxx.Eof do
  begin
    cbb_xsbm.Items.Add(ibqry_bmxx.Fields[1].AsString);
    ibqry_bmxx.Next;
  end;
    with ibqry_bmxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr('__.__.__.__') + ' ORDER BY BM_NO');
    Open;
  end;
  cbb_xsbm1.Items.Clear;
  while not ibqry_bmxx.Eof do
  begin
    cbb_xsbm1.Items.Add(ibqry_bmxx.Fields[1].AsString);
    ibqry_bmxx.Next;
  end;
  with ibqry_ryxl do begin
    Close;
    sql.Clear;
    SQL.Add('select * from XLXX');
    Open;
  end;
  cbb_ygzgxl.Items.Clear;
  while not ibqry_ryxl.Eof do
  begin
    cbb_ygzgxl.Items.Add(ibqry_ryxl.Fields[1].AsString);
    cbb_jy_xl.Items.Add(ibqry_ryxl.Fields[1].AsString);
    ibqry_ryxl.next;
  end;
  with ibqry_ry_zwxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from ZWXX');
    Open;
  end;
  cbb_gzjl_zwmc.Clear;
  while not ibqry_ry_zwxx.Eof do
  begin
    cbb_gzjl_zwmc.Items.Add(ibqry_ry_zwxx.Fields[1].AsString);
    ibqry_ry_zwxx.Next;
  end;
  lbl_yggl.Caption := '员工工龄：0年';
  lbl_now_gz.Caption := '目前薪资：￥0元';
 // ShowMessage(lbl_is_edit.Caption);
  get_ryxx_last;
 //相同组件统一设置
  for i := 0 to self.componentcount - 1 do begin
    if self.components[i] is Tedit then
    begin
      Tedit(self.components[i]).Color := clBtnFace;
      Tedit(self.components[i]).Enabled := false;
    end;

    if self.components[i] is TComboBox then
      TComboBox(self.components[i]).Enabled := false;
    if self.components[i] is tdatetimepicker then
      tdatetimepicker(self.components[i]).Enabled := false;
    if self.components[i] is TMemo then
      TMemo(self.components[i]).Enabled := false;
    if Self.Components[i] is TDBGrid then
      TDBGrid(self.Components[i]).Enabled := false;
  end;

  refsh_data;
end;

procedure TFrm_Addryzl.btn_del_photoClick(Sender: TObject);
begin
  if Application.MessageBox('是否确认删除？', '员工相片', MB_OKCANCEL +
    MB_DEFBUTTON2) = IDOK then
  begin
    with IBQuery_edit_photo do begin
      close;
      SQL.Clear;
      sql.Add('delete from ryxx_photo where ry_no=' + QuotedStr(Trim(edt_ygno.Text)));
      ExecSQL;
    end;
   // MainForm.IBDatabase1.Close;
   // MainForm.IBCConnection1.DefaultTransaction.Commit;
   // MainForm.IBCConnection1.DefaultTransaction.StartTransaction;
   // MainForm.IBCConnection1.DefaultTransaction.Rollback;
    Image1.Picture.Graphic := nil;
    ShowMessage('删除照片成功！');
  end;

end;

procedure TFrm_Addryzl.btn_ins_photoClick(Sender: TObject);
var
  pics: TStream;
  Jpeg: TJpegImage;
  bmp: TBitMap;
begin
  if Trim(edt_ygno.Text) <> '' then begin
    with ibqry_ry_photo do begin
      Close;
      sql.Clear;
      sql.Add('select ry_no from ryxx_photo where ry_no=' + quotedstr(Trim(edt_ygno.Text)));
      open;
    end;

    if not OpenDialog1.Execute() then
    begin
      exit;
    end
    else
    begin
      if ibqry_ry_photo.IsEmpty then //插入图片
      begin
        ibtbl_edit_photo.Open;
        ibtbl_edit_photo.Insert;
        Image1.Picture.LoadFromFile(OpenDialog1.FileName);
        pics := TMemoryStream.Create;
        bmp := TBitMap.Create;
        bmp.Width := Image1.Picture.Width; //指定长度与宽度
        bmp.Height := Image1.Picture.Height;
        bmp.Canvas.Draw(0, 0, Image1.Picture.Graphic); //注意此句，这是与其它方法不同的地方，之所以能实现存储所有操作系统能识别的图片格式，原因就在此处：采用了截图方式。
        Jpeg := TjpegImage.Create;
        Jpeg.CompressionQuality := 80;
        jpeg.Assign(bmp);
        jpeg.Compress; //压缩为JPEG格式
        jpeg.SaveToStream(pics); //存入内存流
        pics.Position := 0;

        ibtbl_edit_photo.Fields[0].AsString := trim(edt_ygno.Text);
        TBlobField(ibtbl_edit_photo.FieldByName('photo')).LoadFromStream(pics); //数据库从流中接受数据
        ibtbl_edit_photo.Post;
        pics.Free;
        jpeg.Free;
        bmp.Free;
        ShowMessage('添加照片成功！');
      end
      else
      begin // 修改
        ibtbl_edit_photo.Open;
        Image1.Picture.LoadFromFile(OpenDialog1.FileName);
        pics := TMemoryStream.Create;
        bmp := TBitMap.Create;
        bmp.Width := Image1.Picture.Width; //指定长度与宽度
        bmp.Height := Image1.Picture.Height;
        bmp.Canvas.Draw(0, 0, Image1.Picture.Graphic); //注意此句，这是与其它方法不同的地方，之所以能实现存储所有操作系统能识别的图片格式，原因就在此处：采用了截图方式。
        Jpeg := TjpegImage.Create;
        Jpeg.CompressionQuality := 80;
        jpeg.Assign(bmp);
        jpeg.Compress; //压缩为JPEG格式
        jpeg.SaveToStream(pics); //存入内存流
        pics.Position := 0;


        ibtbl_edit_photo.Locate('ry_no', trim(edt_ygno.Text), [loPartialKey]);
        ibtbl_edit_photo.edit;
        TBlobField(ibtbl_edit_photo.FieldByName('photo')).LoadFromStream(pics); //数据库从流中接受数据
        ibtbl_edit_photo.Post;
        pics.Free;
        jpeg.Free;
        bmp.Free;
        ShowMessage('修改照片成功！');
      end;
    end;

  end;

end;

procedure TFrm_Addryzl.cbb_dwSelect(Sender: TObject);
begin
  lbl_bm_no.Caption := '0';
  lbl_xsbm_no.Caption := '0';
  cbb_bm.Clear;
  cbb_xsbm.Clear;
  with ibqry_bmxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where  bm_no like ''__'' and bmmc=' + quotedstr(cbb_dw.Text));
    Open;
  end;
  lbl_dw_no.Caption := ibqry_bmxx.Fields[0].AsString;
  lbl_rybm.Caption := ibqry_bmxx.Fields[0].AsString;
  with ibqry_bmxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr(lbl_dw_no.Caption + '.__'));
    Open;
  end;
  while not ibqry_bmxx.Eof do
  begin
    cbb_bm.Items.Add(ibqry_bmxx.Fields[1].AsString);
    ibqry_bmxx.Next;
  end;

end;

procedure TFrm_Addryzl.dtp_rzrqChange(Sender: TObject);
begin
  dtp_zzrq.Date := IncMonth(dtp_rzrq.Date, 1);
end;

procedure TFrm_Addryzl.cbb_bmSelect(Sender: TObject);
begin
  lbl_xsbm_no.Caption := '0';
  cbb_xsbm.Items.Clear;
  with ibqry_bmxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where  bm_no like ''__.__'' and bmmc=' + quotedstr(cbb_bm.Text));
    Open;
  end;
  lbl_bm_no.Caption := ibqry_bmxx.Fields[0].AsString;
  lbl_rybm.Caption := ibqry_bmxx.Fields[0].AsString;
  with ibqry_bmxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr(lbl_bm_no.Caption + '.__'));
    //sql.Add('select * from bmxx where bm_no like ' + quotedstr(lbl_bm_no.Caption + '.%'));
    Open;
  end;
  while not ibqry_bmxx.Eof do
  begin
    cbb_xsbm.Items.Add(ibqry_bmxx.Fields[1].AsString);
    ibqry_bmxx.Next;
  end;
end;

procedure TFrm_Addryzl.cbb_xsbmSelect(Sender: TObject);
begin
  with ibqry_bmxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where  bm_no like ''__.__.__'' and bmmc=' + quotedstr(cbb_xsbm.Text));
    Open;
  end;
  lbl_xsbm_no.Caption := ibqry_bmxx.Fields[0].AsString;
  lbl_rybm.Caption := ibqry_bmxx.Fields[0].AsString; 
end;

procedure TFrm_Addryzl.ds_jyjlDataChange(Sender: TObject; Field: TField);
begin
  dtp_pxjl1.Date := ibtbl_JYJLJY_KSRQ.Value;
  dtp_pxjl2.date := ibtbl_JYJLJY_jsrq.Value;
  edt_jy_address.Text := ibtbl_JYJLJY_ADDRESS.AsString;
  edt_jy_zymc.Text := ibtbl_JYJLJY_ZYMC.AsString;
  if ibtbl_JYJLJYJL_ID.AsString <> '' then begin
    with ibqry_ryxl do begin

      sql.Clear;
      sql.Add('select JY_XLMC from RYXX_JYJL'
        + ' where JYJL_ID=' + quotedstr(ibtbl_JYJLJYJL_ID.AsString));
      Open;
      cbb_jy_xl.Text := ibqry_ryxl.Fields[0].AsString;

    end;
  end;
  mmo_jy_bz.Text := ibtbl_JYJLJY_BZ.AsString;
end;

procedure TFrm_Addryzl.ds_gzjlDataChange(Sender: TObject; Field: TField);
begin
  dtp_gzjl1.Date := ibtbl_gzjlGZ_KSRQ.AsDateTime;
  dtp_gzjl2.Date := ibtbl_gzjlGZ_JSRQ.AsDateTime;
  edt_gzjl_address.Text := ibtbl_gzjlGZ_ADDRESS.AsString;
  if ibtbl_gzjlGZJL_ID.AsString <> '' then begin
    with ibqry_ry_zwxx do begin
      sql.Clear;
      sql.Add('select GZ_ZWMC from RYXX_GZJL'
        + ' where ry_no=' + quotedstr(lbl_ygno1.Caption));
      Open;
      cbb_gzjl_zwmc.Text := ibqry_ry_zwxx.Fields[0].AsString;
    end;
  end;
  mmo_gzjl_bz.Text := ibtbl_gzjlGZ_BZ.AsString;
end;

procedure TFrm_Addryzl.ds_GZBDDataChange(Sender: TObject; Field: TField);
begin
  dtp_xzbd_bdrq.Date := ibtbl_XZBDXZBD_BDRQ.AsDateTime;
  edt_xzbd_bdhje.Text := ibtbl_XZBDXZBD_BDHJE.AsString;
  mmo_xzbd_bz.Text := ibtbl_XZBDXZBD_BZ.AsString;
end;

procedure TFrm_Addryzl.btn_jyjl_addClick(Sender: TObject);
var i: Integer;
begin
  is_edit3 := 0;
  if lbl_ygno.Caption = '0' then
  begin
    btn_ygno.Click; //员工编号，查询需要修改的人员
  end
  else
  begin
    btn_jyjl_add.Enabled := False;
    btn_jyjl_edit.Enabled := False;
    btn_jyjl_save.Enabled := True;
    btn_jyjl_cancel.Enabled := True;
    for i := 0 to self.componentcount - 1 do begin
      if self.components[i] is Tedit then
      begin
        Tedit(self.components[i]).Color := clWindow;
        Tedit(self.components[i]).Enabled := true;
      end;
      if self.components[i] is TComboBox then
        TComboBox(self.components[i]).Enabled := true;
      if self.components[i] is tdatetimepicker then
        tdatetimepicker(self.components[i]).Enabled := true;
      if self.components[i] is TMemo then
        TMemo(self.components[i]).Enabled := true;
    end;
    edt_jy_address.Clear;
    edt_jy_zymc.Clear;
    cbb_jy_xl.ItemIndex := -1;
   // MainForm.IBTransaction1.Active := False;
   // MainForm.IBTransaction1.StartTransaction;
  end;
end;

procedure TFrm_Addryzl.btn_jyjl_editClick(Sender: TObject);
var i: Integer;
begin
  is_edit3 := 1;
  if edt_ygno.Text = '0' then
  begin
    //ShowMessage('请点击员工编号，查询需要修改的人员');
    btn_ygno.Click;
  end
  else
  begin
    btn_jyjl_add.Enabled := False;
    btn_jyjl_edit.Enabled := False;
    btn_jyjl_save.Enabled := True;
    btn_jyjl_cancel.Enabled := True;

    for i := 0 to self.componentcount - 1 do begin
      if self.components[i] is Tedit then
      begin
        Tedit(self.components[i]).Color := clWindow;
        Tedit(self.components[i]).Enabled := true;
      end;
      if self.components[i] is TComboBox then
        TComboBox(self.components[i]).Enabled := true;
      if self.components[i] is tdatetimepicker then
        tdatetimepicker(self.components[i]).Enabled := true;
      if self.components[i] is TMemo then
        TMemo(self.components[i]).Enabled := true;
      if Self.Components[i] is TDBGrid then
        TDBGrid(self.Components[i]).Enabled := true;
    end;
   // MainForm.IBTransaction1.Active := False;
   // MainForm.IBTransaction1.StartTransaction;
  end;
end;

procedure TFrm_Addryzl.btn_jyjl_saveClick(Sender: TObject);
var i: Integer;
begin
  if is_edit3 = 0 then //新增
  begin
    with ibqry_insert do begin
      Close;
      sql.Clear;
      sql.Add('insert into RYXX_JYJL (RY_NO,JY_KSRQ,JY_JSRQ,JY_ADDRESS,JY_ZYMC,JY_XLMC,JY_BZ)'
        + ' VALUES (:RY_NO,:JY_KSRQ,:JY_JSRQ,:JY_ADDRESS,:JY_ZYMC,:JY_XLMC,:JY_BZ)');
      ParamByName('RY_NO').AsString := lbl_ygno.Caption;
      ParamByName('JY_KSRQ').AsDate := dtp_pxjl1.Date;
      ParamByName('JY_JSRQ').AsDate := dtp_pxjl2.Date;
      ParamByName('JY_ADDRESS').AsString := edt_jy_address.Text;
      ParamByName('JY_ZYMC').AsString := edt_jy_zymc.Text;
      ParamByName('JY_XLMC').AsString := cbb_jy_xl.Text;
      ParamByName('JY_BZ').AsString := mmo_jy_bz.Text;
      try
        ExecSQL;
        ShowMessage('保存成功！');
        btn_jyjl_save.Enabled := False;
        btn_jyjl_cancel.Enabled := False;
        btn_jyjl_add.Enabled := True;
        btn_jyjl_edit.Enabled := False;
      //相同组件统一设置
        for i := 0 to self.componentcount - 1 do begin
          if self.components[i] is Tedit then
            Tedit(self.components[i]).Enabled := false;
          if self.components[i] is TComboBox then
            TComboBox(self.components[i]).Enabled := false;
          if self.components[i] is tdatetimepicker then
            tdatetimepicker(self.components[i]).Enabled := false;
          if self.components[i] is TMemo then
            TMemo(self.components[i]).Enabled := false;
          if Self.Components[i] is TDBGrid then
            TDBGrid(self.Components[i]).Enabled := false;
        end;
        refsh_data;
      except
        ShowMessage('保存失败！');
        btn_jyjl_save.Enabled := True;
        btn_jyjl_cancel.Enabled := True;
        btn_jyjl_add.Enabled := false;
        btn_jyjl_edit.Enabled := false;
      end;
    end;
  end
  else
  begin
      //修改
    with ibqry_insert do begin
      Close;
      sql.Clear;
      sql.Add('update RYXX_JYJL set JY_KSRQ=:JY_KSRQ,JY_JSRQ=:JY_JSRQ,JY_ADDRESS=:JY_ADDRESS,'
        + 'JY_ZYMC=:JY_ZYMC,JY_XLMC=:JY_XLMC,JY_BZ=:JY_BZ where JYJL_ID=' + quotedstr(ibtbl_JYJLJYJL_ID.AsString));
      ParamByName('JY_KSRQ').AsDate := dtp_pxjl1.Date;
      ParamByName('JY_JSRQ').AsDate := dtp_pxjl2.Date;
      ParamByName('JY_ADDRESS').AsString := edt_jy_address.Text;
      ParamByName('JY_ZYMC').AsString := edt_jy_zymc.Text;
      ParamByName('JY_XLMC').AsString := cbb_jy_xl.Text;
      ParamByName('JY_BZ').AsString := mmo_jy_bz.Text;
      try
        ExecSQL;
        ShowMessage('保存成功！');
        btn_jyjl_save.Enabled := False;
        btn_jyjl_cancel.Enabled := False;
        btn_jyjl_add.Enabled := False;
        btn_jyjl_edit.Enabled := True;
      //相同组件统一设置
        for i := 0 to self.componentcount - 1 do begin
          if self.components[i] is Tedit then
            Tedit(self.components[i]).Enabled := false;
          if self.components[i] is TComboBox then
            TComboBox(self.components[i]).Enabled := false;
          if self.components[i] is tdatetimepicker then
            tdatetimepicker(self.components[i]).Enabled := false;
          if self.components[i] is TMemo then
            TMemo(self.components[i]).Enabled := false;
          if Self.Components[i] is TDBGrid then
            TDBGrid(self.Components[i]).Enabled := false;
        end;
        refsh_data;
      except
        ShowMessage('保存失败！');
        btn_jyjl_save.Enabled := True;
        btn_jyjl_cancel.Enabled := True;
        btn_jyjl_add.Enabled := false;
        btn_jyjl_edit.Enabled := false;
      end;
    end;
  end;

end;

procedure TFrm_Addryzl.btn_jyjl_cancelClick(Sender: TObject);
var i: Integer;
begin
  if is_edit3 = 0 then begin
    btn_jyjl_add.Enabled := True;
    btn_jyjl_edit.Enabled := False;
    btn_jyjl_save.Enabled := False;
    btn_jyjl_cancel.Enabled := False;
  end
  else
  begin
    btn_jyjl_add.Enabled := False;
    btn_jyjl_edit.Enabled := True;
    btn_jyjl_save.Enabled := False;
    btn_jyjl_cancel.Enabled := False;

  end;
  //相同组件统一设置
  for i := 0 to self.componentcount - 1 do begin
    if self.components[i] is Tedit then
      Tedit(self.components[i]).Enabled := false;
    if self.components[i] is TComboBox then
      TComboBox(self.components[i]).Enabled := false;
    if self.components[i] is tdatetimepicker then
      tdatetimepicker(self.components[i]).Enabled := false;
    if self.components[i] is TMemo then
      TMemo(self.components[i]).Enabled := false;
    if Self.Components[i] is TDBGrid then
      TDBGrid(self.Components[i]).Enabled := false;
  end;
end;

procedure TFrm_Addryzl.btn_gzjl_addClick(Sender: TObject);
var i: Integer;
begin
  is_edit4 := 0;
  if lbl_ygno1.Caption = '0' then
  begin
    btn_ygno.Click; //员工编号，查询需要修改的人员
  end
  else
  begin
    btn_gzjl_add.Enabled := false;
    btn_gzjl_edit.Enabled := false;
    btn_gzjl_save.Enabled := True;
    btn_gzjl_cancel.Enabled := True;
    for i := 0 to self.componentcount - 1 do begin
      if self.components[i] is Tedit then
      begin
        Tedit(self.components[i]).Color := clWindow;
        Tedit(self.components[i]).Enabled := true;
      end;
      if self.components[i] is TComboBox then
        TComboBox(self.components[i]).Enabled := true;
      if self.components[i] is tdatetimepicker then
        tdatetimepicker(self.components[i]).Enabled := true;
      if self.components[i] is TMemo then
        TMemo(self.components[i]).Enabled := true;
    end;
    edt_gzjl_address.Clear;
    mmo_gzjl_bz.Clear;
    cbb_gzjl_zwmc.ItemIndex := -1;
   // MainForm.IBTransaction1.Active := False;
   // MainForm.IBTransaction1.StartTransaction;
  end;
end;

procedure TFrm_Addryzl.btn_gzjl_editClick(Sender: TObject);
var i: Integer;
begin
  is_edit4 := 1;
  if edt_ygno.Text = '0' then
  begin
    //ShowMessage('请点击员工编号，查询需要修改的人员');
    btn_ygno.Click;
  end
  else
  begin
    btn_gzjl_add.Enabled := false;
    btn_gzjl_edit.Enabled := false;
    btn_gzjl_save.Enabled := True;
    btn_gzjl_cancel.Enabled := True;
    for i := 0 to self.componentcount - 1 do begin
      if self.components[i] is Tedit then
      begin
        Tedit(self.components[i]).Color := clWindow;
        Tedit(self.components[i]).Enabled := true;
      end;
      if self.components[i] is TComboBox then
        TComboBox(self.components[i]).Enabled := true;
      if self.components[i] is tdatetimepicker then
        tdatetimepicker(self.components[i]).Enabled := true;
      if self.components[i] is TMemo then
        TMemo(self.components[i]).Enabled := true;
      if Self.Components[i] is TDBGrid then
        TDBGrid(self.Components[i]).Enabled := true;
    end;
   // MainForm.IBTransaction1.Active := False;
   // MainForm.IBTransaction1.StartTransaction;
  end;
end;

procedure TFrm_Addryzl.btn_gzjl_saveClick(Sender: TObject);
var i: Integer;
begin
  if is_edit4 = 0 then
  begin
    //新增
    with ibqry_insert do begin
      Close;
      SQL.Clear;
      SQL.Add('insert into RYXX_GZJL (RY_NO,GZ_KSRQ,GZ_JSRQ,GZ_ADDRESS,GZ_ZWMC,GZ_BZ)'
        + ' values (:RY_NO,:GZ_KSRQ,:GZ_JSRQ,:GZ_ADDRESS,:GZ_ZWMC,:GZ_BZ)');
      ParamByName('RY_NO').AsString := lbl_ygno1.Caption;
      ParamByName('GZ_KSRQ').AsDate := dtp_gzjl1.Date;
      ParamByName('GZ_JSRQ').AsDate := dtp_gzjl2.Date;
      ParamByName('GZ_ADDRESS').AsString := edt_gzjl_address.Text;
      ParamByName('GZ_ZWMC').AsString := cbb_gzjl_zwmc.Text;
      ParamByName('GZ_BZ').AsString := mmo_gzjl_bz.Text;
      try
        ExecSQL;
        ShowMessage('保存成功！');
        btn_gzjl_add.Enabled := True;
        btn_gzjl_edit.Enabled := False;
        btn_gzjl_save.Enabled := False;
        btn_gzjl_cancel.Enabled := False;
  //相同组件统一设置
        for i := 0 to self.componentcount - 1 do begin
          if self.components[i] is Tedit then
            Tedit(self.components[i]).Enabled := false;
          if self.components[i] is TComboBox then
            TComboBox(self.components[i]).Enabled := false;
          if self.components[i] is tdatetimepicker then
            tdatetimepicker(self.components[i]).Enabled := false;
          if self.components[i] is TMemo then
            TMemo(self.components[i]).Enabled := false;
          if Self.Components[i] is TDBGrid then
            TDBGrid(self.Components[i]).Enabled := false;
        end;
        refsh_data;
      except
        ShowMessage('保存失败！');
        btn_gzjl_add.Enabled := False;
        btn_gzjl_edit.Enabled := False;
        btn_gzjl_save.Enabled := True;
        btn_gzjl_cancel.Enabled := True;
      end;
    end;

  end
  else
  begin
      //修改
    with ibqry_insert do begin
      Close;
      SQL.Clear;
      SQL.Add('update RYXX_GZJL set RY_NO=:RY_NO,GZ_KSRQ=:GZ_KSRQ,GZ_JSRQ=:GZ_JSRQ,'
        + 'GZ_ADDRESS=:GZ_ADDRESS,GZ_ZWMC=:GZ_ZWMC,GZ_BZ=:GZ_BZ where GZJL_ID=' + quotedstr(ibtbl_gzjlGZJL_ID.AsString));

      ParamByName('RY_NO').AsString := lbl_ygno1.Caption;
      ParamByName('GZ_KSRQ').AsDate := dtp_gzjl1.Date;
      ParamByName('GZ_JSRQ').AsDate := dtp_gzjl2.Date;
      ParamByName('GZ_ADDRESS').AsString := edt_gzjl_address.Text;
      ParamByName('GZ_ZWMC').AsString := cbb_gzjl_zwmc.Text;
      ParamByName('GZ_BZ').AsString := mmo_gzjl_bz.Text;
      try
        ExecSQL;
        ShowMessage('保存成功！');
        btn_gzjl_add.Enabled := False;
        btn_gzjl_edit.Enabled := True;
        btn_gzjl_save.Enabled := False;
        btn_gzjl_cancel.Enabled := False;
  //相同组件统一设置
        for i := 0 to self.componentcount - 1 do begin
          if self.components[i] is Tedit then
            Tedit(self.components[i]).Enabled := false;
          if self.components[i] is TComboBox then
            TComboBox(self.components[i]).Enabled := false;
          if self.components[i] is tdatetimepicker then
            tdatetimepicker(self.components[i]).Enabled := false;
          if self.components[i] is TMemo then
            TMemo(self.components[i]).Enabled := false;
          if Self.Components[i] is TDBGrid then
            TDBGrid(self.Components[i]).Enabled := false;
        end;
        refsh_data;
      except
        ShowMessage('保存失败！');
        btn_gzjl_add.Enabled := False;
        btn_gzjl_edit.Enabled := False;
        btn_gzjl_save.Enabled := True;
        btn_gzjl_cancel.Enabled := True;
      end;
    end;
  end;
end;

procedure TFrm_Addryzl.btn_gzjl_cancelClick(Sender: TObject);
var i: Integer;
begin
  if is_edit4 = 0 then begin
    btn_gzjl_add.Enabled := True;
    btn_gzjl_edit.Enabled := False;
    btn_gzjl_save.Enabled := False;
    btn_gzjl_cancel.Enabled := False;
  end
  else
  begin
    btn_gzjl_add.Enabled := False;
    btn_gzjl_edit.Enabled := True;
    btn_gzjl_save.Enabled := False;
    btn_gzjl_cancel.Enabled := False;
  end;
  //相同组件统一设置
  for i := 0 to self.componentcount - 1 do begin
    if self.components[i] is Tedit then
      Tedit(self.components[i]).Enabled := false;
    if self.components[i] is TComboBox then
      TComboBox(self.components[i]).Enabled := false;
    if self.components[i] is tdatetimepicker then
      tdatetimepicker(self.components[i]).Enabled := false;
    if self.components[i] is TMemo then
      TMemo(self.components[i]).Enabled := false;
    if Self.Components[i] is TDBGrid then
      TDBGrid(self.Components[i]).Enabled := false;
  end;
end;

procedure TFrm_Addryzl.btn_xzbd_addClick(Sender: TObject);
var i: Integer;
begin
  is_edit5 := 0;
  if lbl_ygno2.Caption = '0' then
  begin
    btn_ygno.Click; //员工编号，查询需要修改的人员
  end
  else
  begin
    btn_xzbd_add.Enabled := False;
    btn_xzbd_edit.Enabled := False;
    btn_xzbd_save.Enabled := true;
    btn_xzbd_cancel.Enabled := true;

    for i := 0 to self.componentcount - 1 do begin
      if self.components[i] is Tedit then
      begin
        Tedit(self.components[i]).Color := clWindow;
        Tedit(self.components[i]).Enabled := true;
      end;
      if self.components[i] is TComboBox then
        TComboBox(self.components[i]).Enabled := true;
      if self.components[i] is tdatetimepicker then
        tdatetimepicker(self.components[i]).Enabled := true;
      if self.components[i] is TMemo then
        TMemo(self.components[i]).Enabled := true;
    end;
    edt_xzbd_bdhje.Clear;
    mmo_xzbd_bz.Clear;
   // MainForm.IBTransaction1.Active := False;
   // MainForm.IBTransaction1.StartTransaction;
  end;
end;

procedure TFrm_Addryzl.btn_xzbd_editClick(Sender: TObject);
var i: Integer;
begin
  is_edit5 := 1;
  if edt_ygno.Text = '0' then
  begin
    btn_ygno.Click; //员工编号，查询需要修改的人员
  end
  else
  begin
    btn_xzbd_add.Enabled := False;
    btn_xzbd_edit.Enabled := False;
    btn_xzbd_save.Enabled := true;
    btn_xzbd_cancel.Enabled := true;
    for i := 0 to self.componentcount - 1 do begin
      if self.components[i] is Tedit then
      begin
        Tedit(self.components[i]).Color := clWindow;
        Tedit(self.components[i]).Enabled := true;
      end;
      if self.components[i] is TComboBox then
        TComboBox(self.components[i]).Enabled := true;
      if self.components[i] is tdatetimepicker then
        tdatetimepicker(self.components[i]).Enabled := true;
      if self.components[i] is TMemo then
        TMemo(self.components[i]).Enabled := true;
      if Self.Components[i] is TDBGrid then
        TDBGrid(self.Components[i]).Enabled := true;
    end;
   // MainForm.IBTransaction1.Active := False;
   // MainForm.IBTransaction1.StartTransaction;
  end;
end;

procedure TFrm_Addryzl.btn_xzbd_saveClick(Sender: TObject);
var i: Integer;
begin
  if is_edit5 = 0 then
  begin
    //新增
    with ibqry_insert do begin
      Close;
      SQL.Clear;
      sql.Add('insert into RYXX_XZBDJL (RY_NO,XZBD_BDRQ,XZBD_BDHJE,XZBD_BZ)'
        + ' values(:RY_NO,:XZBD_BDRQ,:XZBD_BDHJE,:XZBD_BZ)');
      ParamByName('RY_NO').AsString := lbl_ygno2.Caption;
      ParamByName('XZBD_BDRQ').AsDate := dtp_xzbd_bdrq.Date;
      ParamByName('XZBD_BDHJE').AsString := edt_xzbd_bdhje.Text;
      ParamByName('XZBD_BZ').AsString := mmo_xzbd_bz.Text;
      try
        ExecSQL;
        ShowMessage('保存成功！');
        btn_xzbd_add.Enabled := True;
        btn_xzbd_edit.Enabled := True;
        btn_xzbd_save.Enabled := False;
        btn_xzbd_cancel.Enabled := False;
     //相同组件统一设置
        for i := 0 to self.componentcount - 1 do begin
          if self.components[i] is Tedit then
            Tedit(self.components[i]).Enabled := false;
          if self.components[i] is TComboBox then
            TComboBox(self.components[i]).Enabled := false;
          if self.components[i] is tdatetimepicker then
            tdatetimepicker(self.components[i]).Enabled := false;
          if self.components[i] is TMemo then
            TMemo(self.components[i]).Enabled := false;
          if Self.Components[i] is TDBGrid then
            TDBGrid(self.Components[i]).Enabled := false;

        end;
        refsh_data;
      except
        ShowMessage('保存失败！');
        btn_xzbd_add.Enabled := False;
        btn_xzbd_edit.Enabled := False;
        btn_xzbd_save.Enabled := True;
        btn_xzbd_cancel.Enabled := True;
      end;
    end;

  end
  else
  begin
      //修改
    with ibqry_insert do begin
      Close;
      SQL.Clear;
      sql.Add('update RYXX_XZBDJL set RY_NO=:RY_NO,XZBD_BDRQ=:XZBD_BDRQ,XZBD_BDHJE=:XZBD_BDHJE,XZBD_BZ=:XZBD_BZ'
        + ' where XZBDJL_ID=' + QUOtedstr(ibtbl_XZBDXZBDJL_ID.AsString));
      ParamByName('RY_NO').AsString := lbl_ygno2.Caption;
      ParamByName('XZBD_BDRQ').AsDate := dtp_xzbd_bdrq.Date;
      ParamByName('XZBD_BDHJE').AsString := edt_xzbd_bdhje.Text;
      ParamByName('XZBD_BZ').AsString := mmo_xzbd_bz.Text;
      try
        ExecSQL;
        ShowMessage('保存成功！');
        btn_xzbd_add.Enabled := true;
        btn_xzbd_edit.Enabled := True;
        btn_xzbd_save.Enabled := False;
        btn_xzbd_cancel.Enabled := False;
     //相同组件统一设置
        for i := 0 to self.componentcount - 1 do begin
          if self.components[i] is Tedit then
            Tedit(self.components[i]).Enabled := false;
          if self.components[i] is TComboBox then
            TComboBox(self.components[i]).Enabled := false;
          if self.components[i] is tdatetimepicker then
            tdatetimepicker(self.components[i]).Enabled := false;
          if self.components[i] is TMemo then
            TMemo(self.components[i]).Enabled := false;
          if Self.Components[i] is TDBGrid then
            TDBGrid(self.Components[i]).Enabled := false;

        end;
        refsh_data;
      except
        ShowMessage('保存失败！');
        btn_xzbd_add.Enabled := False;
        btn_xzbd_edit.Enabled := False;
        btn_xzbd_save.Enabled := True;
        btn_xzbd_cancel.Enabled := True;
      end;
    end;
  end;


end;

procedure TFrm_Addryzl.btn_xzbd_cancelClick(Sender: TObject);
var i: Integer;
begin
  if is_edit5 = 0 then begin
    btn_xzbd_add.Enabled := True;
    btn_xzbd_edit.Enabled := True;
    btn_xzbd_save.Enabled := False;
    btn_xzbd_cancel.Enabled := False;
  end
  else
  begin
    btn_xzbd_add.Enabled := True;
    btn_xzbd_edit.Enabled := True;
    btn_xzbd_save.Enabled := False;
    btn_xzbd_cancel.Enabled := False;
  end;
  //相同组件统一设置
  for i := 0 to self.componentcount - 1 do begin
    if self.components[i] is Tedit then
      Tedit(self.components[i]).Enabled := false;
    if self.components[i] is TComboBox then
      TComboBox(self.components[i]).Enabled := false;
    if self.components[i] is tdatetimepicker then
      tdatetimepicker(self.components[i]).Enabled := false;
    if self.components[i] is TMemo then
      TMemo(self.components[i]).Enabled := false;
    if Self.Components[i] is TDBGrid then
      TDBGrid(self.Components[i]).Enabled := false;
  end;
  refsh_data;
end;

procedure TFrm_Addryzl.ds_jtgxDataChange(Sender: TObject; Field: TField);
begin
  edt_jtry_name.Text := ibtbl_jtgxJTRY_NAME.AsString;
  edt_jtry_gx.Text := ibtbl_jtgxJTRY_GX.AsString;
  edt_jtry_address.Text := ibtbl_jtgxJTRY_ADDRESS.asstring;
  edt_jtry_work_address.text := ibtbl_jtgxJTRY_WORK_ADDRESS.asstring;
  edt_jtry_phone.text := ibtbl_jtgxJTRY_PHONE.AsString;
end;

procedure TFrm_Addryzl.btn_jtgx_addClick(Sender: TObject);
var i: integer;
begin
  is_edit2 := 0;
  btn_jtgx_add.Enabled := False;
  btn_jtgx_edit.Enabled := False;
  btn_jtgx_save.Enabled := True;
  btn_jtgx_cancel.Enabled := True;
  edt_jtry_name.Clear;
  edt_jtry_gx.clear;
  edt_jtry_address.Clear;
  edt_jtry_work_address.Clear;
  edt_jtry_phone.Clear;
  for i := 0 to self.componentcount - 1 do begin
    if self.components[i] is Tedit then
    begin
      Tedit(self.components[i]).Color := clWindow;
      Tedit(self.components[i]).Enabled := true;
    end;
    if self.components[i] is TComboBox then
      TComboBox(self.components[i]).Enabled := true;
    if self.components[i] is tdatetimepicker then
      tdatetimepicker(self.components[i]).Enabled := true;
    if self.components[i] is TMemo then
      TMemo(self.components[i]).Enabled := true;
  end;
 // MainForm.IBTransaction1.Active := False;
 // MainForm.IBTransaction1.StartTransaction;
end;

procedure TFrm_Addryzl.btn_jtgx_editClick(Sender: TObject);
var i: integer;
begin
  is_edit2 := 1;
  if edt_ygno.Text = '0' then
  begin
    //ShowMessage('请点击员工编号，查询需要修改的人员');
    btn_ygno.Click;
  end
  else
  begin
    btn_jtgx_add.Enabled := False;
    btn_jtgx_edit.Enabled := False;
    btn_jtgx_save.Enabled := True;
    btn_jtgx_cancel.Enabled := True;
    for i := 0 to self.componentcount - 1 do begin
      if self.components[i] is Tedit then
      begin
        Tedit(self.components[i]).Color := clWindow;
        Tedit(self.components[i]).Enabled := true;
      end;
      if self.components[i] is TComboBox then
        TComboBox(self.components[i]).Enabled := true;
      if self.components[i] is tdatetimepicker then
        tdatetimepicker(self.components[i]).Enabled := true;
      if self.components[i] is TMemo then
        TMemo(self.components[i]).Enabled := true;
      if Self.Components[i] is TDBGrid then
        TDBGrid(self.Components[i]).Enabled := true;
    end;
   // MainForm.IBTransaction1.Active := False;
   // MainForm.IBTransaction1.StartTransaction;
  end;
end;

procedure TFrm_Addryzl.btn_jtgx_cancelClick(Sender: TObject);
var i: integer;
begin
  if is_edit2 = 0 then begin
    btn_jtgx_add.Enabled := True;
    btn_jtgx_edit.Enabled := False;
    btn_jtgx_save.Enabled := False;
    btn_jtgx_cancel.Enabled := False;
  end
  else
  begin
    btn_jtgx_add.Enabled := False;
    btn_jtgx_edit.Enabled := True;
    btn_jtgx_save.Enabled := False;
    btn_jtgx_cancel.Enabled := False;
  end;

 //相同组件统一设置
  for i := 0 to self.componentcount - 1 do begin
    if self.components[i] is Tedit then
      Tedit(self.components[i]).Enabled := false;
    if self.components[i] is TComboBox then
      TComboBox(self.components[i]).Enabled := false;
    if self.components[i] is tdatetimepicker then
      tdatetimepicker(self.components[i]).Enabled := false;
    if self.components[i] is TMemo then
      TMemo(self.components[i]).Enabled := false;
    if Self.Components[i] is TDBGrid then
      TDBGrid(self.Components[i]).Enabled := false;
  end;
end;

procedure TFrm_Addryzl.btn_jtgx_saveClick(Sender: TObject);
var i: integer;
begin
  if is_edit2 = 0 then begin //添加
    with ibqry_insert do begin
      Close;
      sql.Clear;
      sql.Add('insert into RYXX_JTGX(RY_NO,JTRY_NAME,JTRY_GX,JTRY_ADDRESS,JTRY_WORK_ADDRESS,JTRY_PHONE)'
        + ' values (:RY_NO,:JTRY_NAME,:JTRY_GX,:JTRY_ADDRESS,:JTRY_WORK_ADDRESS,:JTRY_PHONE)');
      ParamByName('RY_NO').Value := StrToInt(lbl_ygno0.Caption);
      ParamByName('JTRY_NAME').AsString := edt_jtry_name.Text;
      ParamByName('JTRY_GX').AsString := edt_jtry_gx.Text;
      ParamByName('JTRY_ADDRESS').AsString := edt_jtry_address.Text;
      ParamByName('JTRY_WORK_ADDRESS').AsString := edt_jtry_work_address.Text;
      ParamByName('JTRY_PHONE').AsString := edt_jtry_phone.Text;
      try
        ExecSQL;
        ShowMessage('保存成功！');
        btn_jtgx_add.Enabled := True;
        btn_jtgx_edit.Enabled := False;
        btn_jtgx_save.Enabled := False;
        btn_jtgx_cancel.Enabled := False;

          //相同组件统一设置
        for i := 0 to self.componentcount - 1 do begin
          if self.components[i] is Tedit then
            Tedit(self.components[i]).Enabled := false;
          if self.components[i] is TComboBox then
            TComboBox(self.components[i]).Enabled := false;
          if self.components[i] is tdatetimepicker then
            tdatetimepicker(self.components[i]).Enabled := false;
          if self.components[i] is TMemo then
            TMemo(self.components[i]).Enabled := false;
          if Self.Components[i] is TDBGrid then
            TDBGrid(self.Components[i]).Enabled := false;
        end;
        refsh_data;
      except
        ShowMessage('保存失败！');
        btn_jtgx_add.Enabled := False;
        btn_jtgx_edit.Enabled := False;
        btn_jtgx_save.Enabled := true;
        btn_jtgx_cancel.Enabled := true;
      end;
    end;
  end
  else
  begin //修改
    with ibqry_insert do begin
      Close;
      sql.Clear;
      sql.Add('update RYXX_JTGX set JTRY_NAME=:JTRY_NAME,JTRY_GX=:JTRY_GX,JTRY_ADDRESS=:JTRY_ADDRESS,JTRY_WORK_ADDRESS=:JTRY_WORK_ADDRESS,JTRY_PHONE=:JTRY_PHONE'
        + ' where JTGX_ID=' + quotedstr(ibtbl_jtgxJTGX_ID.AsString));
      ParamByName('JTRY_NAME').AsString := edt_jtry_name.Text;
      ParamByName('JTRY_GX').AsString := edt_jtry_gx.Text;
      ParamByName('JTRY_ADDRESS').AsString := edt_jtry_address.Text;
      ParamByName('JTRY_WORK_ADDRESS').AsString := edt_jtry_work_address.Text;
      ParamByName('JTRY_PHONE').AsString := edt_jtry_phone.Text;
      try
        ExecSQL;
        ShowMessage('保存成功！');
        btn_jtgx_add.Enabled := False;
        btn_jtgx_edit.Enabled := True;
        btn_jtgx_save.Enabled := False;
        btn_jtgx_cancel.Enabled := False;
  //相同组件统一设置
        for i := 0 to self.componentcount - 1 do begin
          if self.components[i] is Tedit then
            Tedit(self.components[i]).Enabled := false;
          if self.components[i] is TComboBox then
            TComboBox(self.components[i]).Enabled := false;
          if self.components[i] is tdatetimepicker then
            tdatetimepicker(self.components[i]).Enabled := false;
          if self.components[i] is TMemo then
            TMemo(self.components[i]).Enabled := false;
          if Self.Components[i] is TDBGrid then
            TDBGrid(self.Components[i]).Enabled := false;
        end;
        refsh_data;
      except
        ShowMessage('保存失败！');
        btn_jtgx_add.Enabled := False;
        btn_jtgx_edit.Enabled := False;
        btn_jtgx_save.Enabled := true;
        btn_jtgx_cancel.Enabled := true;
      end;
    end;
  end;


end;

procedure TFrm_Addryzl.btn_cxClick(Sender: TObject);
begin
  btn_ygno.Click;
end;

procedure TFrm_Addryzl.cbb_xsbmDropDown(Sender: TObject);
begin
  lbl_xsbm_no.Caption := '0';
  cbb_xsbm.Items.Clear;
  cbb_xsbm1.Items.Clear;
  with ibqry_bmxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bmmc=' + quotedstr(cbb_bm.Text));
    Open;
  end;
  lbl_bm_no.Caption := ibqry_bmxx.Fields[0].AsString;

  with ibqry_bmxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr(lbl_bm_no.Caption + '.__'));
   //sql.Add('select * from bmxx where bm_no like ' + quotedstr(lbl_bm_no.Caption + '.%'));
    Open;
  end;
  while not ibqry_bmxx.Eof do
  begin
    cbb_xsbm.Items.Add(ibqry_bmxx.Fields[1].AsString);
    ibqry_bmxx.Next;
  end;
end;

procedure TFrm_Addryzl.cbb_bmDropDown(Sender: TObject);
begin
  lbl_bm_no.Caption := '0';
  lbl_xsbm_no.Caption := '0';
  cbb_bm.Clear;
  cbb_xsbm.Clear;
  with ibqry_bmxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bmmc=' + quotedstr(cbb_dw.Text));
    Open;
  end;
  lbl_dw_no.Caption := ibqry_bmxx.Fields[0].AsString;
  with ibqry_bmxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr(lbl_dw_no.Caption + '.__'));
    Open;
  end;
  while not ibqry_bmxx.Eof do
  begin
    cbb_bm.Items.Add(ibqry_bmxx.Fields[1].AsString);
    ibqry_bmxx.Next;
  end;
end;

procedure TFrm_Addryzl.Button1Click(Sender: TObject);
var
  pics: TStream;
  Jpeg: TJpegImage;
  ry_bm: string;
begin
  with ibcqry_ryxx do begin
    Close;
    SQL.Text := 'select * from ryxx where ry_no=' + quotedstr(IntToStr(StrToInt(edt_ygno.Text) + 1));
    open;
  end;
  edt_ygno.Text := ibcqry_ryxx.fieldbyname('RY_NO').AsString;
  if not ibcqry_ryxx.IsEmpty then begin
    Frm_Addryzl.lbl_ygno.Caption := Frm_Addryzl.edt_ygno.Text;
    Frm_Addryzl.lbl_ygno1.Caption := Frm_Addryzl.edt_ygno.Text;
    Frm_Addryzl.lbl_ygno2.Caption := Frm_Addryzl.edt_ygno.Text;
    Frm_Addryzl.lbl_ygno0.Caption := Frm_Addryzl.edt_ygno.Text;
    lbl_ygno3.Caption := edt_ygno.Text;
    Frm_Addryzl.edt_ygname.Text := ibcqry_ryxx.fieldbyname('RY_NAME').AsString;
    if ibcqry_ryxx.fieldbyname('RY_SEX').AsString = '男' then
      Frm_Addryzl.cbb_ybxb.itemindex := 0;
    if ibcqry_ryxx.fieldbyname('RY_SEX').AsString = '女' then
      Frm_Addryzl.cbb_ybxb.itemindex := 1;
    if ibcqry_ryxx.fieldbyname('RY_CSRQ').Value = null then
      Frm_Addryzl.dtp_csrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_csrq.date := ibcqry_ryxx.fieldbyname('RY_CSRQ').Value;
    Frm_Addryzl.edt_ygsfzh.Text := ibcqry_ryxx.fieldbyname('RY_SFZH').AsString;
    Frm_Addryzl.edt_ygmphone.Text := ibcqry_ryxx.fieldbyname('RY_MOBEL_PHONE').AsString;
    Frm_Addryzl.edt_ygphone.Text := ibcqry_ryxx.fieldbyname('RY_PHONE').AsString;
    Frm_Addryzl.edt_yg_jt_address.Text := ibcqry_ryxx.fieldbyname('RY_JTZZ').AsString;
    Frm_Addryzl.edt_yg_address_poscode.Text := ibcqry_ryxx.fieldbyname('RY_JTZZYZBM').AsString;
    Frm_Addryzl.edt_yghkszd.Text := ibcqry_ryxx.fieldbyname('RY_HKSZD').AsString;

    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '本地城镇' then
      Frm_Addryzl.cbb_yghkxz.ItemIndex := 0;
    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '本地农村' then
      Frm_Addryzl.cbb_yghkxz.ItemIndex := 1;
    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '非本地城镇' then
      Frm_Addryzl.cbb_yghkxz.ItemIndex := 2;
    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '非本地农村' then
      Frm_Addryzl.cbb_yghkxz.ItemIndex := 3;
    if ibcqry_ryxx.fieldbyname('RY_RZRQ').Value = null then
      Frm_Addryzl.dtp_rzrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_rzrq.date := ibcqry_ryxx.fieldbyname('RY_RZRQ').Value;
    if ibcqry_ryxx.fieldbyname('RY_ZZRQ').Value = null then
      Frm_Addryzl.dtp_zzrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_zzrq.date := ibcqry_ryxx.fieldbyname('RY_ZZRQ').Value;
    if ibcqry_ryxx.fieldbyname('RY_LZRQ').Value = null then
      Frm_Addryzl.dtp_lzrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_lzrq.date := ibcqry_ryxx.fieldbyname('RY_LZRQ').Value;

    if ibcqry_ryxx.FieldByName('RY_HY').AsString = '未婚' then
      Frm_Addryzl.cbb_yghyzk.ItemIndex := 0;
    if ibcqry_ryxx.FieldByName('RY_HY').AsString = '已婚' then
      Frm_Addryzl.cbb_yghyzk.ItemIndex := 1;
    if ibcqry_ryxx.FieldByName('RY_HY').AsString = '其它' then
      Frm_Addryzl.cbb_yghyzk.ItemIndex := 2;
    Frm_Addryzl.edt_ygzy.Text := ibcqry_ryxx.fieldbyname('RY_ZY').AsString;

    if ibcqry_ryxx.fieldbyname('RY_HTRQ_BEGIN').Value = null then
      Frm_Addryzl.dtp_htqdrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_htqdrq.date := ibcqry_ryxx.fieldbyname('RY_HTRQ_BEGIN').Value;
    if ibcqry_ryxx.fieldbyname('RY_HTRQ_END').Value = null then
      Frm_Addryzl.dtp_htdqrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_htdqrq.date := ibcqry_ryxx.fieldbyname('RY_HTRQ_END').Value;


    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '0' then
      Frm_Addryzl.cbb_ygzt.ItemIndex := 0;
    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '1' then
      Frm_Addryzl.cbb_ygzt.ItemIndex := 1;
    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '2' then
      Frm_Addryzl.cbb_ygzt.ItemIndex := 2;
    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '3' then
      Frm_Addryzl.cbb_ygzt.ItemIndex := 3;
    Frm_Addryzl.edt_ygsbzh.Text := ibcqry_ryxx.fieldbyname('RY_SBZH').AsString;
    if ibcqry_ryxx.fieldbyname('RY_SB_SQRQ').Value = null then
      Frm_Addryzl.dtp_sbsgrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_sbsgrq.date := ibcqry_ryxx.fieldbyname('RY_SB_SQRQ').Value;

    if ibcqry_ryxx.fieldbyname('RY_SB_TBRQ').Value = null then
      Frm_Addryzl.dtp_sbtbrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_sbtbrq.date := ibcqry_ryxx.fieldbyname('RY_SB_TBRQ').Value;
    //Frm_Addryzl.lbl_dw_no.Caption := ibcqry_ryxx.fieldbyname('RY_DW').AsString;
    Frm_Addryzl.lbl_bm_no.Caption := ibcqry_ryxx.fieldbyname('RY_BM').AsString;
   // Frm_Addryzl.lbl_xsbm_no.Caption := ibcqry_ryxx.fieldbyname('RY_XSBM').AsString;
    Frm_Addryzl.edt_zic.Text := ibcqry_ryxx.fieldbyname('RY_ZIC').AsString;
    Frm_Addryzl.edt_ziGz.Text := ibcqry_ryxx.fieldbyname('RY_ZIGZ').AsString;
    Frm_Addryzl.lbl_yggl.Caption := '员工工龄：' + ibcqry_ryxx.fieldbyname('RY_GL').AsString + '年';
    FRM_ADDRYZL.mmo_bz.Text := ibcqry_ryxx.fieldbyname('RY_BZ').AsString;
  //取部门信息
    with ibcqry_ryxx do begin
      Close;
      sql.Text := 'select a.bmmc,B.RY_BM from bmxx a,ryxx b'
        + ' where a.bm_no=b.ry_BM and b.ry_no=' + quotedstr(edt_ygno.text);
      Open;
      ry_bm := ibcqry_ryxx.Fields[1].asstring;
      if Length(ry_bm) = 2 then begin //一级部门
        cbb_dw.ItemIndex := cbb_dw.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
        cbb_bm.ItemIndex := -1;
        cbb_xsbm.ItemIndex := -1;
        Frm_Addryzl.lbl_rybm.Caption := RY_BM;
      end;
      if Length(ry_bm) = 5 then begin //二级部门
        with ibcqry_ryxx do begin
          Close;
          SQL.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 2));
          open;
          cbb_dw.ItemIndex := cbb_dw.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(ry_bm);
          open;
          cbb_bm.ItemIndex := cbb_bm.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          cbb_xsbm.ItemIndex := -1;
        end;
        Frm_Addryzl.lbl_rybm.Caption := RY_BM;
      end;

      if Length(ry_bm) = 8 then begin //三级部门
        with ibcqry_ryxx do begin
          Close;
          SQL.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 2));
          open;
          cbb_dw.ItemIndex := cbb_dw.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 5));
          open;
          cbb_bm.ItemIndex := cbb_bm.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(ry_bm);
          open;
          cbb_xsbm.ItemIndex := cbb_xsbm.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          cbb_xsbm1.ItemIndex :=-1;
        end;
        Frm_Addryzl.lbl_rybm.Caption := RY_BM;
      end;
       if Length(ry_bm) = 11 then begin //四级部门
        with ibcqry_ryxx do begin
          Close;
          SQL.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 2));
          open;
          cbb_dw.ItemIndex := cbb_dw.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 5));
          open;
          cbb_bm.ItemIndex := cbb_bm.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 8));
          open;
          cbb_xsbm.ItemIndex := cbb_xsbm.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);

          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(ry_bm);
          open;
          cbb_xsbm1.ItemIndex := cbb_xsbm1.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
        end;
        Frm_Addryzl.lbl_rybm.Caption := RY_BM;
      end;
   { with ibcqry_ryxx do begin
      Close;
      SQL.Clear;
      sql.Add('select a.bmmc from bmxx a,ryxx b'
        + ' where a.bm_no=b.ry_dw and b.ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text));
      Open;
      //Frm_Addryzl.cbb_dw.Text := ibcqry_ryxx.Fields[0].AsString;
      Frm_Addryzl.cbb_dw.ItemIndex := Frm_Addryzl.cbb_dw.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
      sql.Clear;
      sql.Add('select a.bmmc from bmxx a,ryxx b'
        + ' where a.bm_no=b.ry_bm and b.ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text));
      Open;
      //Frm_Addryzl.cbb_bm.Text := ibcqry_ryxx.Fields[0].AsString;
      Frm_Addryzl.cbb_bm.ItemIndex := Frm_Addryzl.cbb_bm.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
      sql.Clear;
      sql.Add('select a.bmmc from bmxx a,ryxx b'
        + ' where a.bm_no=b.ry_xsbm and b.ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text));
      Open;
     // Frm_Addryzl.cbb_xsbm.Text := ibcqry_ryxx.Fields[0].AsString;
      Frm_Addryzl.cbb_xsbm.ItemIndex := Frm_Addryzl.cbb_xsbm.Items.indexof(ibcqry_ryxx.Fields[0].AsString);}

      sql.Clear;
      sql.Add('select a.xlmc from xlxx a,ryxx b'
        + ' where a.xlmc=b.ry_zgxl and b.ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text));
      Open;
      Frm_Addryzl.cbb_ygzgxl.Text := ibcqry_ryxx.Fields[0].AsString;
    end;

    //取联系人照片
    with ibcqry_ryxx do begin
      Close;
      sql.Text := 'select ry_no from ryxx_photo where ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.Text);
      Open;
    end;
    if ibcqry_ryxx.IsEmpty then begin
      Frm_Addryzl.Image1.Picture := nil;
      //exit;

    end
    else
    begin
      with ibcqry_ryxx do begin
        Close;
        sql.Text := 'select ry_no,PHOTO from ryxx_photo where ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.Text);
        Open;
      end;
      pics := TMemoryStream.Create;

      ibcqry_ryxx.Locate('ry_no', Frm_Addryzl.edt_ygno.Text, [loPartialKey]);
      TBlobField(ibcqry_ryxx.FieldByName('photo')).SaveToStream(pics); //将二进制存入内存流
      pics.Position := 0;
      Jpeg := TJpegImage.Create;
      Jpeg.LoadFromStream(pics); //将流识别为JPEG格式
      Frm_Addryzl.Image1.Picture.Assign(jpeg);
      pics.Free;
      jpeg.Free;
    end;


    //人员职务
    with ibcqry_ryxx do begin
      Close;
      sql.Text := 'select ry_no, gz_zwmc from ryxx_gzjl'
        + ' where gz_jsrq=(select max(gz_jsrq) from ryxx_gzjl where ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text) + ') and ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text);
      Open;
    end;
    if ibcqry_ryxx.IsEmpty then begin
      Frm_Addryzl.lbl_zw.Caption := '无';
    end
    else
    begin
      Frm_Addryzl.lbl_zw.Caption := ibcqry_ryxx.Fields[1].AsString;
    end;


    with ibcqry_ryxx do begin  //取薪资
      close;
      sql.Text := 'select ry_no, xzbd_bdhje from ryxx_xzbdjl'
        + ' where xzbd_bdrq=(select max(xzbd_bdrq) from ryxx_xzbdjl where ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text) + ') and ry_no=' + quotedstr(edt_ygno.text);
      Open;
    end;
    if ibcqry_ryxx.IsEmpty then begin
      Frm_Addryzl.lbl_now_gz.Caption := '目前薪资：￥0元';
    end
    else
    begin
      Frm_Addryzl.lbl_now_gz.Caption := '目前薪资：￥' + ibcqry_ryxx.Fields[1].AsString + '元';
    end;
   with ibcqry_ryxx do begin
     close;
      sql.Text := 'select ry_no, ry_cpjg from ryxx_cpjg'
        + ' where ry_no=' + quotedstr(edt_ygno.text);
      Open;
    end;
    if ibcqry_ryxx.IsEmpty then begin
      Memo1.Text := '无';
      //ShowMessage(lbl_is_edit.Caption);
      btn_edit_cpjg.Enabled :=False;
      if lbl_is_edit.Caption ='0'then
      begin
      btn_add_cpjg.Enabled :=true;
      end
      else
      begin
      btn_add_cpjg.Enabled :=false;
      end;
    end
    else
    begin
      Memo1.Text := ibcqry_ryxx.Fields[1].AsString;
      if lbl_is_edit.Caption ='0' then
      btn_add_cpjg.Enabled :=false
      else
       btn_edit_cpjg.Enabled :=true;
    end;
    refsh_data;
  end
  else
  begin
    Application.MessageBox('最后一条记录了', '人员资料', MB_OK +
      MB_ICONINFORMATION);
    get_max_no;
    edt_ygno.Text := inttostr(max_no);
  end;
end;

procedure TFrm_Addryzl.dtp_lzrqChange(Sender: TObject);
begin
  if DateToStr(dtp_lzrq.Date) <> '1900-01-01' then
  begin
    cbb_ygzt.ItemIndex := 2;
  end
end;

procedure TFrm_Addryzl.Button2Click(Sender: TObject);
var
  pics: TStream;
  Jpeg: TJpegImage;
  ry_bm: string;
begin
  with ibcqry_ryxx do begin
    Close;
    SQL.Text := 'select * from ryxx where ry_no=' + quotedstr(IntToStr(StrToInt(edt_ygno.Text) - 1));
    open;
  end;
  edt_ygno.Text := ibcqry_ryxx.fieldbyname('RY_NO').AsString;
  if not ibcqry_ryxx.IsEmpty then begin
    Frm_Addryzl.lbl_ygno.Caption := Frm_Addryzl.edt_ygno.Text;
    Frm_Addryzl.lbl_ygno1.Caption := Frm_Addryzl.edt_ygno.Text;
    Frm_Addryzl.lbl_ygno2.Caption := Frm_Addryzl.edt_ygno.Text;
    Frm_Addryzl.lbl_ygno0.Caption := Frm_Addryzl.edt_ygno.Text;
    lbl_ygno3.Caption := edt_ygno.Text;
    Frm_Addryzl.edt_ygname.Text := ibcqry_ryxx.fieldbyname('RY_NAME').AsString;
    if ibcqry_ryxx.fieldbyname('RY_SEX').AsString = '男' then
      Frm_Addryzl.cbb_ybxb.itemindex := 0;
    if ibcqry_ryxx.fieldbyname('RY_SEX').AsString = '女' then
      Frm_Addryzl.cbb_ybxb.itemindex := 1;
    if ibcqry_ryxx.fieldbyname('RY_CSRQ').Value = null then
      Frm_Addryzl.dtp_csrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_csrq.date := ibcqry_ryxx.fieldbyname('RY_CSRQ').Value;
    Frm_Addryzl.edt_ygsfzh.Text := ibcqry_ryxx.fieldbyname('RY_SFZH').AsString;
    Frm_Addryzl.edt_ygmphone.Text := ibcqry_ryxx.fieldbyname('RY_MOBEL_PHONE').AsString;
    Frm_Addryzl.edt_ygphone.Text := ibcqry_ryxx.fieldbyname('RY_PHONE').AsString;
    Frm_Addryzl.edt_yg_jt_address.Text := ibcqry_ryxx.fieldbyname('RY_JTZZ').AsString;
    Frm_Addryzl.edt_yg_address_poscode.Text := ibcqry_ryxx.fieldbyname('RY_JTZZYZBM').AsString;
    Frm_Addryzl.edt_yghkszd.Text := ibcqry_ryxx.fieldbyname('RY_HKSZD').AsString;

    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '本地城镇' then
      Frm_Addryzl.cbb_yghkxz.ItemIndex := 0;
    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '本地农村' then
      Frm_Addryzl.cbb_yghkxz.ItemIndex := 1;
    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '非本地城镇' then
      Frm_Addryzl.cbb_yghkxz.ItemIndex := 2;
    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '非本地农村' then
      Frm_Addryzl.cbb_yghkxz.ItemIndex := 3;
    if ibcqry_ryxx.fieldbyname('RY_RZRQ').Value = null then
      Frm_Addryzl.dtp_rzrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_rzrq.date := ibcqry_ryxx.fieldbyname('RY_RZRQ').Value;
    if ibcqry_ryxx.fieldbyname('RY_ZZRQ').Value = null then
      Frm_Addryzl.dtp_zzrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_zzrq.date := ibcqry_ryxx.fieldbyname('RY_ZZRQ').Value;
    if ibcqry_ryxx.fieldbyname('RY_LZRQ').Value = null then
      Frm_Addryzl.dtp_lzrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_lzrq.date := ibcqry_ryxx.fieldbyname('RY_LZRQ').Value;

    if ibcqry_ryxx.FieldByName('RY_HY').AsString = '未婚' then
      Frm_Addryzl.cbb_yghyzk.ItemIndex := 0;
    if ibcqry_ryxx.FieldByName('RY_HY').AsString = '已婚' then
      Frm_Addryzl.cbb_yghyzk.ItemIndex := 1;
    if ibcqry_ryxx.FieldByName('RY_HY').AsString = '其它' then
      Frm_Addryzl.cbb_yghyzk.ItemIndex := 2;
    Frm_Addryzl.edt_ygzy.Text := ibcqry_ryxx.fieldbyname('RY_ZY').AsString;

    if ibcqry_ryxx.fieldbyname('RY_HTRQ_BEGIN').Value = null then
      Frm_Addryzl.dtp_htqdrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_htqdrq.date := ibcqry_ryxx.fieldbyname('RY_HTRQ_BEGIN').Value;
    if ibcqry_ryxx.fieldbyname('RY_HTRQ_END').Value = null then
      Frm_Addryzl.dtp_htdqrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_htdqrq.date := ibcqry_ryxx.fieldbyname('RY_HTRQ_END').Value;


    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '0' then
      Frm_Addryzl.cbb_ygzt.ItemIndex := 0;
    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '1' then
      Frm_Addryzl.cbb_ygzt.ItemIndex := 1;
    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '2' then
      Frm_Addryzl.cbb_ygzt.ItemIndex := 2;
    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '3' then
      Frm_Addryzl.cbb_ygzt.ItemIndex := 3;
    Frm_Addryzl.edt_ygsbzh.Text := ibcqry_ryxx.fieldbyname('RY_SBZH').AsString;
    if ibcqry_ryxx.fieldbyname('RY_SB_SQRQ').Value = null then
      Frm_Addryzl.dtp_sbsgrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_sbsgrq.date := ibcqry_ryxx.fieldbyname('RY_SB_SQRQ').Value;

    if ibcqry_ryxx.fieldbyname('RY_SB_TBRQ').Value = null then
      Frm_Addryzl.dtp_sbtbrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_sbtbrq.date := ibcqry_ryxx.fieldbyname('RY_SB_TBRQ').Value;
   // Frm_Addryzl.lbl_dw_no.Caption := ibcqry_ryxx.fieldbyname('RY_DW').AsString;
    Frm_Addryzl.lbl_bm_no.Caption := ibcqry_ryxx.fieldbyname('RY_BM').AsString;
    //Frm_Addryzl.lbl_xsbm_no.Caption := ibcqry_ryxx.fieldbyname('RY_XSBM').AsString;
    Frm_Addryzl.edt_zic.Text := ibcqry_ryxx.fieldbyname('RY_ZIC').AsString;
    Frm_Addryzl.edt_ziGz.Text := ibcqry_ryxx.fieldbyname('RY_ZIGZ').AsString;
    Frm_Addryzl.lbl_yggl.Caption := '员工工龄：' + ibcqry_ryxx.fieldbyname('RY_GL').AsString + '年';
    FRM_ADDRYZL.mmo_bz.Text := ibcqry_ryxx.fieldbyname('RY_BZ').AsString;
  //取部门信息
    with ibcqry_ryxx do begin
      Close;
      sql.Text := 'select a.bmmc,B.RY_BM from bmxx a,ryxx b'
        + ' where a.bm_no=b.ry_BM and b.ry_no=' + quotedstr(edt_ygno.text);
      Open;
      ry_bm := ibcqry_ryxx.Fields[1].asstring;
      if Length(ry_bm) = 2 then begin //一级部门
        cbb_dw.ItemIndex := cbb_dw.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
        cbb_bm.ItemIndex := -1;
        cbb_xsbm.ItemIndex := -1;
        cbb_xsbm1.ItemIndex :=-1;
        Frm_Addryzl.lbl_rybm.Caption := RY_BM;
      end;
      if Length(ry_bm) = 5 then begin //二级部门
        with ibcqry_ryxx do begin
          Close;
          SQL.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 2));
          open;
          cbb_dw.ItemIndex := cbb_dw.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(ry_bm);
          open;
          cbb_bm.ItemIndex := cbb_bm.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          cbb_xsbm.ItemIndex := -1;
        end;
        Frm_Addryzl.lbl_rybm.Caption := RY_BM;
      end;
      if Length(ry_bm) = 8 then begin //三级部门
        with ibcqry_ryxx do begin
          Close;
          SQL.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 2));
          open;
          cbb_dw.ItemIndex := cbb_dw.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 5));
          open;
          cbb_bm.ItemIndex := cbb_bm.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(ry_bm);
          open;
          cbb_xsbm.ItemIndex := cbb_xsbm.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          cbb_xsbm1.ItemIndex :=-1;
        end;
        Frm_Addryzl.lbl_rybm.Caption := RY_BM;
      end;
       if Length(ry_bm) = 11 then begin //四级部门
        with ibcqry_ryxx do begin
          Close;
          SQL.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 2));
          open;
          cbb_dw.ItemIndex := cbb_dw.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 5));
          open;
          cbb_bm.ItemIndex := cbb_bm.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 8));
          Open;
          cbb_xsbm.ItemIndex := cbb_xsbm.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(ry_bm);
          open;
          cbb_xsbm1.ItemIndex := cbb_xsbm1.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
        end;
        Frm_Addryzl.lbl_rybm.Caption := RY_BM;
      end;
   {    with ibcqry_ryxx do begin
      Close;
      SQL.Clear;
      sql.Add('select a.bmmc from bmxx a,ryxx b'
        + ' where a.bm_no=b.ry_dw and b.ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text));
      Open;
      //Frm_Addryzl.cbb_dw.Text := ibcqry_ryxx.Fields[0].AsString;
      Frm_Addryzl.cbb_dw.ItemIndex := Frm_Addryzl.cbb_dw.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
      sql.Clear;
      sql.Add('select a.bmmc from bmxx a,ryxx b'
        + ' where a.bm_no=b.ry_bm and b.ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text));
      Open;
      //Frm_Addryzl.cbb_bm.Text := ibcqry_ryxx.Fields[0].AsString;
      Frm_Addryzl.cbb_bm.ItemIndex := Frm_Addryzl.cbb_bm.Items.IndexOf(ibcqry_ryxx.Fields[0].AsString);
      sql.Clear;
      sql.Add('select a.bmmc from bmxx a,ryxx b'
        + ' where a.bm_no=b.ry_xsbm and b.ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text));
      Open;
     // Frm_Addryzl.cbb_xsbm.Text := ibcqry_ryxx.Fields[0].AsString;
      Frm_Addryzl.cbb_xsbm.ItemIndex := Frm_Addryzl.cbb_xsbm.Items.indexof(ibcqry_ryxx.Fields[0].AsString); }


      sql.Clear;
      sql.Add('select a.xlmc from xlxx a,ryxx b'
        + ' where a.xlmc=b.ry_zgxl and b.ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text));
      Open;
      Frm_Addryzl.cbb_ygzgxl.Text := ibcqry_ryxx.Fields[0].AsString;
    end;

    //取联系人照片
    with ibcqry_ryxx do begin
      Close;
      sql.Text := 'select ry_no from ryxx_photo where ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.Text);
      Open;
    end;
    if ibcqry_ryxx.IsEmpty then begin
      Frm_Addryzl.Image1.Picture := nil;
     // exit;

    end
    else
    begin
      with ibcqry_ryxx do begin
        Close;
        sql.Text := 'select ry_no,PHOTO from ryxx_photo where ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.Text);
        Open;
      end;
      pics := TMemoryStream.Create;

      ibcqry_ryxx.Locate('ry_no', Frm_Addryzl.edt_ygno.Text, [loPartialKey]);
      TBlobField(ibcqry_ryxx.FieldByName('photo')).SaveToStream(pics); //将二进制存入内存流
      pics.Position := 0;
      Jpeg := TJpegImage.Create;
      Jpeg.LoadFromStream(pics); //将流识别为JPEG格式
      Frm_Addryzl.Image1.Picture.Assign(jpeg);
      pics.Free;
      jpeg.Free;
    end;


    with ibcqry_ryxx do begin //取人员职务
      Close;
      sql.Text := 'select ry_no, gz_zwmc from ryxx_gzjl'
        + ' where gz_jsrq=(select max(gz_jsrq) from ryxx_gzjl where ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text) + ') and ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text);
      Open;
    end;
    if ibcqry_ryxx.IsEmpty then begin
      Frm_Addryzl.lbl_zw.Caption := '无';
    end
    else
    begin
      Frm_Addryzl.lbl_zw.Caption := ibcqry_ryxx.Fields[1].AsString;
    end;

    with ibcqry_ryxx do begin      //取薪资
      close;
      sql.Text := 'select ry_no, xzbd_bdhje from ryxx_xzbdjl'
        + ' where xzbd_bdrq=(select max(xzbd_bdrq) from ryxx_xzbdjl where ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text) + ') and ry_no=' + quotedstr(edt_ygno.text);
      Open;
    end;
    if ibcqry_ryxx.IsEmpty then begin
      Frm_Addryzl.lbl_now_gz.Caption := '目前薪资：￥0元';
    end
    else
    begin
      Frm_Addryzl.lbl_now_gz.Caption := '目前薪资：￥' + ibcqry_ryxx.Fields[1].AsString + '元';
    end;
    with ibcqry_ryxx do begin
     close;
      sql.Text := 'select ry_no, ry_cpjg from ryxx_cpjg'
        + ' where ry_no=' + quotedstr(edt_ygno.text);
      Open;
    end;
    if ibcqry_ryxx.IsEmpty then begin
      Memo1.Text := '无';
      //ShowMessage(lbl_is_edit.Caption);
      btn_edit_cpjg.Enabled :=False;
      if lbl_is_edit.Caption ='0'then
      begin
      btn_add_cpjg.Enabled :=true;
      end
      else
      begin
      btn_add_cpjg.Enabled :=false;
      end;
    end
    else
    begin
      Memo1.Text := ibcqry_ryxx.Fields[1].AsString;
      if lbl_is_edit.Caption ='0' then
      btn_add_cpjg.Enabled :=false
      else
       btn_edit_cpjg.Enabled :=true;
    end;
    refsh_data;
  end
  else
  begin
    edt_ygno.Text := '8001';
  end;
end;

procedure TFrm_Addryzl.PageControl1Change(Sender: TObject);
begin
  if btn_save.Enabled = True then
  begin
    ShowMessage('请先保存当前页面！');
    PageControl1.ActivePage := TabSheet1;
  end;
  if btn_jtgx_save.Enabled = True then
  begin
    ShowMessage('请先保存当前页面！');
    PageControl1.ActivePage := TabSheet2;
  end;
  if btn_jyjl_save.Enabled = True then
  begin
    ShowMessage('请先保存当前页面！');
    PageControl1.ActivePage := TabSheet3;
  end;
  if btn_gzjl_save.Enabled = True then
  begin
    ShowMessage('请先保存当前页面！');
    PageControl1.ActivePage := TabSheet4;
  end;
  if btn_xzbd_save.Enabled = True then
  begin
    ShowMessage('请先保存当前页面！');
    PageControl1.ActivePage := TabSheet5;
  end;
  if Btn_save_cpjg.Enabled = True then
  begin
    ShowMessage('请先保存当前页面！');
    PageControl1.ActivePage := TabSheet6;
  end;

  refsh_data;
end;

procedure TFrm_Addryzl.btn_add_cpjgClick(Sender: TObject);
begin
  is_edit6 := 0;
  btn_add_cpjg.Enabled := False;
  btn_edit_cpjg.Enabled := false;
  Btn_save_cpjg.Enabled := True;
  btn_cancel_cpjg.Enabled := True;
  Memo1.Enabled := True;
  Memo1.ReadOnly := False;
  Memo1.Clear;
end;

procedure TFrm_Addryzl.btn_edit_cpjgClick(Sender: TObject);
begin
  is_edit6 := 1;
  btn_add_cpjg.Enabled := False;
  btn_edit_cpjg.Enabled := false;
  Btn_save_cpjg.Enabled := True;
  btn_cancel_cpjg.Enabled := True;
  Memo1.Enabled := true;
  Memo1.ReadOnly := false;
end;

procedure TFrm_Addryzl.Btn_save_cpjgClick(Sender: TObject);
begin
  if is_edit6 = 0 then begin //添加
    try
      with ibqry_insert do begin
        Close;
        SQL.Text := 'insert into RYXX_CPJG (RY_NO,RY_CPJG) VALUES (:RY_NO,:RY_CPJG)';
        ParamByName('RY_NO').AsString := lbl_ygno3.Caption;
        ParamByName('RY_CPJG').Value := Memo1.Text;
        ExecSQL;
      end;
      ShowMessage('保存成功');
      btn_add_cpjg.Enabled := True;
      btn_edit_cpjg.Enabled := false;
      Btn_save_cpjg.Enabled := false;
      btn_cancel_cpjg.Enabled := false;
      Memo1.Enabled := False;
    except
      ShowMessage('此员工已有测评结果！');
      btn_add_cpjg.Enabled := false;
      btn_edit_cpjg.Enabled := false;
      Btn_save_cpjg.Enabled := false;
      btn_cancel_cpjg.Enabled := false;
      Memo1.Enabled := False;
    end;
  end
  else
  begin // 修改
    try
      with ibqry_insert do begin
        Close;
        SQL.Text := 'update RYXX_CPJG set RY_CPJG=:RY_CPJG where RY_NO=:RY_NO';
        ParamByName('RY_NO').AsString := lbl_ygno3.Caption;
        ParamByName('RY_CPJG').Value := Memo1.Text;
        ExecSQL;
      end;
      ShowMessage('保存成功');
      btn_add_cpjg.Enabled := false;
      btn_edit_cpjg.Enabled := True;
      Btn_save_cpjg.Enabled := false;
      btn_cancel_cpjg.Enabled := false;
      Memo1.Enabled := false;
    except
      ShowMessage('保存失败！');
      btn_add_cpjg.Enabled := false;
      btn_edit_cpjg.Enabled := True;
      Btn_save_cpjg.Enabled := false;
      btn_cancel_cpjg.Enabled := false;
    end;
  end;
end;

procedure TFrm_Addryzl.Btn_cancel_cpjgClick(Sender: TObject);
begin
  if is_edit6 = 0 then begin //添加
    btn_add_cpjg.Enabled := True;
    btn_edit_cpjg.Enabled := false;
    Btn_save_cpjg.Enabled := false;
    btn_cancel_cpjg.Enabled := false;
  end
  else
  begin // 修改
    btn_add_cpjg.Enabled := false;
    btn_edit_cpjg.Enabled := True;
    Btn_save_cpjg.Enabled := false;
    btn_cancel_cpjg.Enabled := false;
  end;
  Memo1.Enabled := False;
end;

procedure TFrm_Addryzl.dtp_htqdrqChange(Sender: TObject);
begin
dtp_htdqrq.Date := IncMonth(dtp_rzrq.Date, 12);
end;

procedure TFrm_Addryzl.cbb_xsbm1DropDown(Sender: TObject);
begin
lbl_xsbm_no.Caption := '0';
  cbb_xsbm1.Items.Clear;
  with ibqry_bmxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bmmc=' + quotedstr(cbb_xsbm.Text));
    Open;
  end;
  lbl_bm_no.Caption := ibqry_bmxx.Fields[0].AsString;

  with ibqry_bmxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bm_no like ' + quotedstr(lbl_bm_no.Caption + '.%'));
    Open;
  end;
  while not ibqry_bmxx.Eof do
  begin
    cbb_xsbm1.Items.Add(ibqry_bmxx.Fields[1].AsString);
    ibqry_bmxx.Next;
  end;
end;

procedure TFrm_Addryzl.cbb_xsbm1Select(Sender: TObject);
begin
  with ibqry_bmxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bmmc=' + quotedstr(cbb_xsbm1.Text));
    Open;
  end;
  lbl_xsbm_no.Caption := ibqry_bmxx.Fields[0].AsString;
  lbl_rybm.Caption := ibqry_bmxx.Fields[0].AsString;
end;

procedure TFrm_Addryzl.cbb_gzjl_zwmcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
key:=0;
end;

procedure TFrm_Addryzl.cbb_gzjl_zwmcKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=#0;
end;

end.

