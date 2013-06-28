unit qry_ryxx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, jpeg, Mask, DB,
  IBQuery, IBDatabase, IBTable, Grids, DBGrids,
  frxClass, IBCustomDataSet, MemDS, IBC,StrUtils, DBAccess;

type
  TFrm_qry_ryxx = class(TForm)
    OpenDialog1: TOpenDialog;
    ds_jyjl: TDataSource;
    ds_gzjl: TDataSource;
    ds_GZBD: TDataSource;
    ds_jtgx: TDataSource;
    frxReport1: TfrxReport;
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
    ibcqry_ryxx: TIBCQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ScrollBox1: TScrollBox;
    lbl_BZ: TLabel;
    Panel1: TPanel;
    btn_cx: TButton;
    btn_next: TButton;
    Button1: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    lbl_dw_no: TLabel;
    Label2: TLabel;
    lbl_bm_no: TLabel;
    Label3: TLabel;
    lbl_xsbm_no: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    lbl_yggl: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label39: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label18: TLabel;
    Label24: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    lbl_zw: TLabel;
    Label16: TLabel;
    cbb_dw: TComboBox;
    cbb_bm: TComboBox;
    cbb_xsbm: TComboBox;
    btn_ygno: TButton;
    edt_ygno: TEdit;
    edt_ygname: TEdit;
    cbb_ybxb: TComboBox;
    dtp_csrq: TDateTimePicker;
    edt_ygsfzh: TEdit;
    edt_ygmphone: TEdit;
    edt_ygphone: TEdit;
    edt_yg_jt_address: TEdit;
    edt_yg_address_poscode: TEdit;
    edt_zic: TEdit;
    edt_ygzy: TEdit;
    cbb_ygzgxl: TComboBox;
    cbb_yghyzk: TComboBox;
    dtp_lzrq: TDateTimePicker;
    dtp_zzrq: TDateTimePicker;
    dtp_rzrq: TDateTimePicker;
    dtp_htqdrq: TDateTimePicker;
    dtp_htdqrq: TDateTimePicker;
    cbb_ygzt: TComboBox;
    edt_ygsbzh: TEdit;
    dtp_sbsgrq: TDateTimePicker;
    dtp_sbtbrq: TDateTimePicker;
    edt_zigz: TEdit;
    GroupBox1: TGroupBox;
    Image1: TImage;
    lbl1: TLabel;
    btn_ins_photo: TButton;
    btn_del_photo: TButton;
    cbb_yghkxz: TComboBox;
    edt_yghkszd: TEdit;
    mmo_bz: TMemo;
    Panel3: TPanel;
    DBGrid4: TDBGrid;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    TabSheet2: TTabSheet;
    mmo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
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
    procedure btn_cxClick(Sender: TObject);
    procedure btn_nextClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  Frm_qry_ryxx: TFrm_qry_ryxx;
var is_edit, max_no, yg_no: Integer; //is_edit:是否处于编辑模式 取值 0新增  1编辑 -- max_no最大记录号 yg_no 人员编号

implementation
uses ryzl_qry_edit, MainUnit;
{$R *.dfm}

procedure tFrm_qry_ryxx.get_max_no;
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

procedure tFrm_qry_ryxx.refsh_data;
begin
  ibtbl_JYJL.Close;
  ibtbl_JYJL.Open;
  ibtbl_JYJL.Filter := 'ry_no=' + edt_ygno.Text;
  ibtbl_JYJL.Filtered := true;
  ibtbl_JYJL.Last;
  ibtbl_gzjl.Close;
  ibtbl_gzjl.Open;
  ibtbl_gzjl.Filter := 'ry_no=' + edt_ygno.Text;
  ibtbl_gzjl.Filtered := true;
  ibtbl_gzjl.Last;
  ibtbl_xzbd.Close;
  ibtbl_xzbd.Open;
  ibtbl_xzbd.Filter := 'ry_no=' + edt_ygno.Text;
  ibtbl_xzbd.Filtered := true;
  ibtbl_XZBD.Last;
  ibtbl_jtgx.Close;
  ibtbl_jtgx.Open;
  ibtbl_jtgx.Filter := 'ry_no=' + edt_ygno.Text;
  ibtbl_jtgx.filtered := True;

end;

procedure TFrm_qry_ryxx.FormClose(Sender: TObject;
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
  Frm_qry_ryxx := nil;
end;

procedure TFrm_qry_ryxx.FormCreate(Sender: TObject);
begin
  //lbl_yggl.Caption := '员工工龄：0年';

end;

procedure TFrm_qry_ryxx.btn_ygnoClick(Sender: TObject);
begin
  if frm_ryzl_qry_edit = nil then frm_ryzl_qry_edit := Tfrm_ryzl_qry_edit.Create(application);
  frm_ryzl_qry_edit.ShowModal;
  //frm_ryzl_qry_edit.Free;
end;

procedure TFrm_qry_ryxx.FormShow(Sender: TObject);
var
  i: integer;
begin
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
  end;
  refsh_data;

   //SetLength(ryqx_name,qx_count);
 { for i:=0 to 20-1 do begin
   ShowMessage(ryqx_name[i]);
    if ryqx_name[i] ='测评结果' then
      begin
      TabSheet2.TabVisible :=True;
      mmo1.Enabled :=true;
      Exit;
      end
      else
      TabSheet2.TabVisible :=False;
   end; }
end;

procedure TFrm_qry_ryxx.btn_del_photoClick(Sender: TObject);
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

procedure TFrm_qry_ryxx.btn_ins_photoClick(Sender: TObject);
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

procedure TFrm_qry_ryxx.cbb_dwSelect(Sender: TObject);
begin
  lbl_bm_no.Caption := '0';
  lbl_xsbm_no.Caption := '0';
  cbb_bm.Clear;
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
    sql.Add('select * from bmxx where bm_no like ' + quotedstr(lbl_dw_no.Caption + '.%'));
    Open;
  end;
  while not ibqry_bmxx.Eof do
  begin
    cbb_bm.Items.Add(ibqry_bmxx.Fields[1].AsString);
    ibqry_bmxx.Next;
  end;
end;

procedure TFrm_qry_ryxx.dtp_rzrqChange(Sender: TObject);
begin
  dtp_zzrq.Date := IncMonth(dtp_rzrq.Date, 3);
end;

procedure TFrm_qry_ryxx.cbb_bmSelect(Sender: TObject);
begin
  lbl_xsbm_no.Caption := '0';
  cbb_xsbm.Items.Clear;
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
    sql.Add('select * from bmxx where bm_no like ' + quotedstr(lbl_bm_no.Caption + '.%'));
    Open;
  end;
  while not ibqry_bmxx.Eof do
  begin
    cbb_xsbm.Items.Add(ibqry_bmxx.Fields[1].AsString);
    ibqry_bmxx.Next;
  end;
end;

procedure TFrm_qry_ryxx.cbb_xsbmSelect(Sender: TObject);
begin
  with ibqry_bmxx do begin
    Close;
    sql.Clear;
    sql.Add('select * from bmxx where bmmc=' + quotedstr(cbb_xsbm.Text));
    Open;
  end;
  lbl_xsbm_no.Caption := ibqry_bmxx.Fields[0].AsString;
end;

procedure TFrm_qry_ryxx.btn_cxClick(Sender: TObject);
begin
  btn_ygno.Click;
end;

procedure TFrm_qry_ryxx.btn_nextClick(Sender: TObject);
var
  pics: TStream;
  Jpeg: TJpegImage;
  ry_bm:string;
begin
  with ibcqry_ryxx do begin
    Close;
    SQL.Text :='select * from ryxx where ry_no='+quotedstr(IntToStr(StrToInt(edt_ygno.Text)+1));
    open;
  end;
  edt_ygno.Text :=ibcqry_ryxx.fieldbyname('RY_NO').AsString;
  if not ibcqry_ryxx.IsEmpty then begin
    //Frm_qry_ryxx.lbl_ygno.Caption := Frm_qry_ryxx.edt_ygno.Text;
    //Frm_qry_ryxx.lbl_ygno1.Caption := Frm_qry_ryxx.edt_ygno.Text;
    //Frm_qry_ryxx.lbl_ygno2.Caption := Frm_qry_ryxx.edt_ygno.Text;
   // Frm_qry_ryxx.lbl_ygno0.Caption := Frm_qry_ryxx.edt_ygno.Text;
    Frm_qry_ryxx.edt_ygname.Text := ibcqry_ryxx.fieldbyname('RY_NAME').AsString;
    if ibcqry_ryxx.fieldbyname('RY_SEX').AsString = '男' then
      Frm_qry_ryxx.cbb_ybxb.itemindex := 0;
    if ibcqry_ryxx.fieldbyname('RY_SEX').AsString = '女' then
      Frm_qry_ryxx.cbb_ybxb.itemindex := 1;
    if ibcqry_ryxx.fieldbyname('RY_CSRQ').Value = null then
      Frm_qry_ryxx.dtp_csrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_csrq.date := ibcqry_ryxx.fieldbyname('RY_CSRQ').Value;
    Frm_qry_ryxx.edt_ygsfzh.Text := ibcqry_ryxx.fieldbyname('RY_SFZH').AsString;
    Frm_qry_ryxx.edt_ygmphone.Text := ibcqry_ryxx.fieldbyname('RY_MOBEL_PHONE').AsString;
    Frm_qry_ryxx.edt_ygphone.Text := ibcqry_ryxx.fieldbyname('RY_PHONE').AsString;
    Frm_qry_ryxx.edt_yg_jt_address.Text := ibcqry_ryxx.fieldbyname('RY_JTZZ').AsString;
    Frm_qry_ryxx.edt_yg_address_poscode.Text := ibcqry_ryxx.fieldbyname('RY_JTZZYZBM').AsString;
    Frm_qry_ryxx.edt_yghkszd.Text := ibcqry_ryxx.fieldbyname('RY_HKSZD').AsString;

    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '本地城镇' then
      Frm_qry_ryxx.cbb_yghkxz.ItemIndex := 0;
    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '本地农村' then
      Frm_qry_ryxx.cbb_yghkxz.ItemIndex := 1;
    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '非本地城镇' then
      Frm_qry_ryxx.cbb_yghkxz.ItemIndex := 2;
    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '非本地农村' then
      Frm_qry_ryxx.cbb_yghkxz.ItemIndex := 3;
    if ibcqry_ryxx.fieldbyname('RY_RZRQ').Value = null then
      Frm_qry_ryxx.dtp_rzrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_rzrq.date := ibcqry_ryxx.fieldbyname('RY_RZRQ').Value;
    if ibcqry_ryxx.fieldbyname('RY_ZZRQ').Value = null then
      Frm_qry_ryxx.dtp_zzrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_zzrq.date := ibcqry_ryxx.fieldbyname('RY_ZZRQ').Value;
    if ibcqry_ryxx.fieldbyname('RY_LZRQ').Value = null then
      Frm_qry_ryxx.dtp_lzrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_lzrq.date := ibcqry_ryxx.fieldbyname('RY_LZRQ').Value;

    if ibcqry_ryxx.FieldByName('RY_HY').AsString = '未婚' then
      Frm_qry_ryxx.cbb_yghyzk.ItemIndex := 0;
    if ibcqry_ryxx.FieldByName('RY_HY').AsString = '已婚' then
      Frm_qry_ryxx.cbb_yghyzk.ItemIndex := 1;
    if ibcqry_ryxx.FieldByName('RY_HY').AsString = '其它' then
      Frm_qry_ryxx.cbb_yghyzk.ItemIndex := 2;
    Frm_qry_ryxx.edt_ygzy.Text := ibcqry_ryxx.fieldbyname('RY_ZY').AsString;

    if ibcqry_ryxx.fieldbyname('RY_HTRQ_BEGIN').Value = null then
      Frm_qry_ryxx.dtp_htqdrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_htqdrq.date := ibcqry_ryxx.fieldbyname('RY_HTRQ_BEGIN').Value;
    if ibcqry_ryxx.fieldbyname('RY_HTRQ_END').Value = null then
      Frm_qry_ryxx.dtp_htdqrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_htdqrq.date := ibcqry_ryxx.fieldbyname('RY_HTRQ_END').Value;


    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '0' then
      Frm_qry_ryxx.cbb_ygzt.ItemIndex := 0;
    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '1' then
      Frm_qry_ryxx.cbb_ygzt.ItemIndex := 1;
    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '2' then
      Frm_qry_ryxx.cbb_ygzt.ItemIndex := 2;
    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '3' then
      Frm_qry_ryxx.cbb_ygzt.ItemIndex := 3;
    Frm_qry_ryxx.edt_ygsbzh.Text := ibcqry_ryxx.fieldbyname('RY_SBZH').AsString;
    if ibcqry_ryxx.fieldbyname('RY_SB_SQRQ').Value = null then
      Frm_qry_ryxx.dtp_sbsgrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_sbsgrq.date := ibcqry_ryxx.fieldbyname('RY_SB_SQRQ').Value;

    if ibcqry_ryxx.fieldbyname('RY_SB_TBRQ').Value = null then
      Frm_qry_ryxx.dtp_sbtbrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_sbtbrq.date := ibcqry_ryxx.fieldbyname('RY_SB_TBRQ').Value;
    //Frm_qry_ryxx.lbl_dw_no.Caption := ibcqry_ryxx.fieldbyname('RY_DW').AsString;
    Frm_qry_ryxx.lbl_bm_no.Caption := ibcqry_ryxx.fieldbyname('RY_BM').AsString;
    //Frm_qry_ryxx.lbl_xsbm_no.Caption := ibcqry_ryxx.fieldbyname('RY_XSBM').AsString;
    Frm_qry_ryxx.edt_zic.Text := ibcqry_ryxx.fieldbyname('RY_ZIC').AsString;
    Frm_qry_ryxx.edt_ziGz.Text := ibcqry_ryxx.fieldbyname('RY_ZIGZ').AsString;
    Frm_qry_ryxx.lbl_yggl.Caption := '员工工龄：' + ibcqry_ryxx.fieldbyname('RY_GL').AsString + '年';
    FRM_QRY_RYXX.mmo_bz.Text := ibcqry_ryxx.fieldbyname('RY_BZ').AsString;
    refsh_data;
  //取部门信息
with ibcqry_ryxx do begin
 Close;
      sql.Text := 'select a.bmmc,B.RY_BM from bmxx a,ryxx b'
        + ' where a.bm_no=b.ry_BM and b.ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.text);
      Open;
      ry_bm := ibcqry_ryxx.Fields[1].asstring;
      if Length(ry_bm) = 2 then begin //一级部门
        Frm_qry_ryxx.cbb_dw.text := ibcqry_ryxx.Fields[0].AsString;
        Frm_qry_ryxx.cbb_bm.ItemIndex := -1;
        Frm_qry_ryxx.cbb_xsbm.ItemIndex := -1;
      end;
      if Length(ry_bm) = 5 then begin //二级部门
         with ibcqry_ryxx do begin
          Close;
          SQL.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 2));
          open;
          Frm_qry_ryxx.cbb_dw.text := ibcqry_ryxx.Fields[0].AsString;
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(ry_bm);
          open;
          Frm_qry_ryxx.cbb_bm.Text := ibcqry_ryxx.Fields[0].AsString;
          Frm_qry_ryxx.cbb_xsbm.ItemIndex := -1;
          end;
      end;
      if Length(ry_bm) = 8 then begin //三级部门
        with ibcqry_ryxx do begin
          Close;
          SQL.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 2));
          open;
          Frm_qry_ryxx.cbb_dw.text := ibcqry_ryxx.Fields[0].AsString;
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 5));
          open;
          Frm_qry_ryxx.cbb_bm.text := ibcqry_ryxx.Fields[0].AsString;
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(ry_bm);
          open;
          Frm_qry_ryxx.cbb_xsbm.text := ibcqry_ryxx.Fields[0].AsString;
        end;
      end;
      sql.Clear;
      sql.Add('select a.xlmc from xlxx a,ryxx b'
        + ' where a.xlmc=b.ry_zgxl and b.ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.text));
      Open;
      Frm_qry_ryxx.cbb_ygzgxl.Text := ibcqry_ryxx.Fields[0].AsString;
    end;

    //取联系人照片
        with ibcqry_ryxx do begin
      Close;
      sql.Text := 'select ry_no from ryxx_photo where ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.Text);
      Open;
    end;
    if ibcqry_ryxx.IsEmpty then begin
      Frm_qry_ryxx.Image1.Picture := nil;
      //exit;

    end
    else
    begin
      with ibcqry_ryxx do begin
      Close;
      sql.Text := 'select ry_no,PHOTO from ryxx_photo where ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.Text);
      Open;
    end;
      pics := TMemoryStream.Create;

      ibcqry_ryxx.Locate('ry_no', Frm_qry_ryxx.edt_ygno.Text, [loPartialKey]);
      TBlobField(ibcqry_ryxx.FieldByName('photo')).SaveToStream(pics); //将二进制存入内存流
      pics.Position := 0;
      Jpeg := TJpegImage.Create;
      Jpeg.LoadFromStream(pics); //将流识别为JPEG格式
      Frm_qry_ryxx.Image1.Picture.Assign(jpeg);
      pics.Free;
      jpeg.Free;
    end;


    //人员职务
     with ibcqry_ryxx do begin
      Close;
      sql.Text := 'select ry_no, gz_zwmc from ryxx_gzjl'
        + ' where gz_jsrq=(select max(gz_jsrq) from ryxx_gzjl where ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.text) + ') and ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.text);
      Open;
    end;
    if ibcqry_ryxx.IsEmpty then begin
      Frm_qry_ryxx.lbl_zw.Caption := '无';
    end
    else
    begin
      Frm_qry_ryxx.lbl_zw.Caption := ibcqry_ryxx.Fields[1].AsString;
    end;


 with ibcqry_ryxx do begin
      close;
      sql.Text := 'select ry_no, xzbd_bdhje from ryxx_xzbdjl'
        + ' where xzbd_bdrq=(select max(xzbd_bdrq) from ryxx_xzbdjl where ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.text) + ')';
      Open;
    end;
       with ibcqry_ryxx do begin //取测评结果
      close;
      sql.Text := 'select ry_no, ry_cpjg from ryxx_cpjg'
        + ' where ry_no=' + quotedstr(edt_ygno.text);
      Open;
    end;
    if ibcqry_ryxx.IsEmpty then begin
      mmo1.Text := '无';
    end
    else
    begin
      mmo1.Text := ibcqry_ryxx.Fields[1].AsString;
    end;
  end
  else
  begin
   Application.MessageBox('最后一条记录了', '人员资料', MB_OK +
      MB_ICONINFORMATION);
    get_max_no;
    edt_ygno.Text := inttostr(max_no) ;
  end;

end;

procedure TFrm_qry_ryxx.Button1Click(Sender: TObject);
var
  pics: TStream;
  Jpeg: TJpegImage;
  var ry_bm:string;
begin
   with ibcqry_ryxx do begin
    Close;
    SQL.Text :='select * from ryxx where ry_no='+quotedstr(IntToStr(StrToInt(edt_ygno.Text)-1));
    open;
  end;
  edt_ygno.Text :=ibcqry_ryxx.fieldbyname('RY_NO').AsString;
  if not ibcqry_ryxx.IsEmpty then begin
    //Frm_qry_ryxx.lbl_ygno.Caption := Frm_qry_ryxx.edt_ygno.Text;
    //Frm_qry_ryxx.lbl_ygno1.Caption := Frm_qry_ryxx.edt_ygno.Text;
    //Frm_qry_ryxx.lbl_ygno2.Caption := Frm_qry_ryxx.edt_ygno.Text;
   // Frm_qry_ryxx.lbl_ygno0.Caption := Frm_qry_ryxx.edt_ygno.Text;
    Frm_qry_ryxx.edt_ygname.Text := ibcqry_ryxx.fieldbyname('RY_NAME').AsString;
    if ibcqry_ryxx.fieldbyname('RY_SEX').AsString = '男' then
      Frm_qry_ryxx.cbb_ybxb.itemindex := 0;
    if ibcqry_ryxx.fieldbyname('RY_SEX').AsString = '女' then
      Frm_qry_ryxx.cbb_ybxb.itemindex := 1;
    if ibcqry_ryxx.fieldbyname('RY_CSRQ').Value = null then
      Frm_qry_ryxx.dtp_csrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_csrq.date := ibcqry_ryxx.fieldbyname('RY_CSRQ').Value;
    Frm_qry_ryxx.edt_ygsfzh.Text := ibcqry_ryxx.fieldbyname('RY_SFZH').AsString;
    Frm_qry_ryxx.edt_ygmphone.Text := ibcqry_ryxx.fieldbyname('RY_MOBEL_PHONE').AsString;
    Frm_qry_ryxx.edt_ygphone.Text := ibcqry_ryxx.fieldbyname('RY_PHONE').AsString;
    Frm_qry_ryxx.edt_yg_jt_address.Text := ibcqry_ryxx.fieldbyname('RY_JTZZ').AsString;
    Frm_qry_ryxx.edt_yg_address_poscode.Text := ibcqry_ryxx.fieldbyname('RY_JTZZYZBM').AsString;
    Frm_qry_ryxx.edt_yghkszd.Text := ibcqry_ryxx.fieldbyname('RY_HKSZD').AsString;

    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '本地城镇' then
      Frm_qry_ryxx.cbb_yghkxz.ItemIndex := 0;
    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '本地农村' then
      Frm_qry_ryxx.cbb_yghkxz.ItemIndex := 1;
    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '非本地城镇' then
      Frm_qry_ryxx.cbb_yghkxz.ItemIndex := 2;
    if ibcqry_ryxx.FieldByName('RY_HKXZ').AsString = '非本地农村' then
      Frm_qry_ryxx.cbb_yghkxz.ItemIndex := 3;
    if ibcqry_ryxx.fieldbyname('RY_RZRQ').Value = null then
      Frm_qry_ryxx.dtp_rzrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_rzrq.date := ibcqry_ryxx.fieldbyname('RY_RZRQ').Value;
    if ibcqry_ryxx.fieldbyname('RY_ZZRQ').Value = null then
      Frm_qry_ryxx.dtp_zzrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_zzrq.date := ibcqry_ryxx.fieldbyname('RY_ZZRQ').Value;
    if ibcqry_ryxx.fieldbyname('RY_LZRQ').Value = null then
      Frm_qry_ryxx.dtp_lzrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_lzrq.date := ibcqry_ryxx.fieldbyname('RY_LZRQ').Value;

    if ibcqry_ryxx.FieldByName('RY_HY').AsString = '未婚' then
      Frm_qry_ryxx.cbb_yghyzk.ItemIndex := 0;
    if ibcqry_ryxx.FieldByName('RY_HY').AsString = '已婚' then
      Frm_qry_ryxx.cbb_yghyzk.ItemIndex := 1;
    if ibcqry_ryxx.FieldByName('RY_HY').AsString = '其它' then
      Frm_qry_ryxx.cbb_yghyzk.ItemIndex := 2;
    Frm_qry_ryxx.edt_ygzy.Text := ibcqry_ryxx.fieldbyname('RY_ZY').AsString;

    if ibcqry_ryxx.fieldbyname('RY_HTRQ_BEGIN').Value = null then
      Frm_qry_ryxx.dtp_htqdrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_htqdrq.date := ibcqry_ryxx.fieldbyname('RY_HTRQ_BEGIN').Value;
    if ibcqry_ryxx.fieldbyname('RY_HTRQ_END').Value = null then
      Frm_qry_ryxx.dtp_htdqrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_htdqrq.date := ibcqry_ryxx.fieldbyname('RY_HTRQ_END').Value;


    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '0' then
      Frm_qry_ryxx.cbb_ygzt.ItemIndex := 0;
    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '1' then
      Frm_qry_ryxx.cbb_ygzt.ItemIndex := 1;
    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '2' then
      Frm_qry_ryxx.cbb_ygzt.ItemIndex := 2;
    if ibcqry_ryxx.FieldByName('RY_zt').AsString = '3' then
      Frm_qry_ryxx.cbb_ygzt.ItemIndex := 3;
    Frm_qry_ryxx.edt_ygsbzh.Text := ibcqry_ryxx.fieldbyname('RY_SBZH').AsString;
    if ibcqry_ryxx.fieldbyname('RY_SB_SQRQ').Value = null then
      Frm_qry_ryxx.dtp_sbsgrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_sbsgrq.date := ibcqry_ryxx.fieldbyname('RY_SB_SQRQ').Value;

    if ibcqry_ryxx.fieldbyname('RY_SB_TBRQ').Value = null then
      Frm_qry_ryxx.dtp_sbtbrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_sbtbrq.date := ibcqry_ryxx.fieldbyname('RY_SB_TBRQ').Value;
    //Frm_qry_ryxx.lbl_dw_no.Caption := ibcqry_ryxx.fieldbyname('RY_DW').AsString;
    Frm_qry_ryxx.lbl_bm_no.Caption := ibcqry_ryxx.fieldbyname('RY_BM').AsString;
   // Frm_qry_ryxx.lbl_xsbm_no.Caption := ibcqry_ryxx.fieldbyname('RY_XSBM').AsString;
    Frm_qry_ryxx.edt_zic.Text := ibcqry_ryxx.fieldbyname('RY_ZIC').AsString;
    Frm_qry_ryxx.edt_ziGz.Text := ibcqry_ryxx.fieldbyname('RY_ZIGZ').AsString;
    Frm_qry_ryxx.lbl_yggl.Caption := '员工工龄：' + ibcqry_ryxx.fieldbyname('RY_GL').AsString + '年';
    FRM_QRY_RYXX.mmo_bz.Text := ibcqry_ryxx.fieldbyname('RY_BZ').AsString;
    refsh_data;
  //取部门信息
with ibcqry_ryxx do begin
    Close;
      sql.Text := 'select a.bmmc,B.RY_BM from bmxx a,ryxx b'
        + ' where a.bm_no=b.ry_BM and b.ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.text);
      Open;
      ry_bm := ibcqry_ryxx.Fields[1].asstring;
      if Length(ry_bm) = 2 then begin //一级部门
        Frm_qry_ryxx.cbb_dw.text := ibcqry_ryxx.Fields[0].AsString;
        Frm_qry_ryxx.cbb_bm.ItemIndex := -1;
        Frm_qry_ryxx.cbb_xsbm.ItemIndex := -1;
      end;
      if Length(ry_bm) = 5 then begin //二级部门
         with ibcqry_ryxx do begin
          Close;
          SQL.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 2));
          open;
          Frm_qry_ryxx.cbb_dw.text := ibcqry_ryxx.Fields[0].AsString;
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(ry_bm);
          open;
          Frm_qry_ryxx.cbb_bm.Text := ibcqry_ryxx.Fields[0].AsString;
          Frm_qry_ryxx.cbb_xsbm.ItemIndex := -1;
          end;
      end;
      if Length(ry_bm) = 8 then begin //三级部门
        with ibcqry_ryxx do begin
          Close;
          SQL.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 2));
          open;
          Frm_qry_ryxx.cbb_dw.text := ibcqry_ryxx.Fields[0].AsString;
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 5));
          open;
          Frm_qry_ryxx.cbb_bm.text := ibcqry_ryxx.Fields[0].AsString;
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(ry_bm);
          open;
          Frm_qry_ryxx.cbb_xsbm.text := ibcqry_ryxx.Fields[0].AsString;
        end;
      end;

      sql.Clear;
      sql.Add('select a.xlmc from xlxx a,ryxx b'
        + ' where a.xlmc=b.ry_zgxl and b.ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.text));
      Open;
      Frm_qry_ryxx.cbb_ygzgxl.Text := ibcqry_ryxx.Fields[0].AsString;
    end;

    //取联系人照片
        with ibcqry_ryxx do begin
      Close;
      sql.Text := 'select ry_no from ryxx_photo where ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.Text);
      Open;
    end;
    if ibcqry_ryxx.IsEmpty then begin
      Frm_qry_ryxx.Image1.Picture := nil;
     // exit;

    end
    else
    begin
      with ibcqry_ryxx do begin
      Close;
      sql.Text := 'select ry_no,PHOTO from ryxx_photo where ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.Text);
      Open;
    end;
      pics := TMemoryStream.Create;

      ibcqry_ryxx.Locate('ry_no', Frm_qry_ryxx.edt_ygno.Text, [loPartialKey]);
      TBlobField(ibcqry_ryxx.FieldByName('photo')).SaveToStream(pics); //将二进制存入内存流
      pics.Position := 0;
      Jpeg := TJpegImage.Create;
      Jpeg.LoadFromStream(pics); //将流识别为JPEG格式
      Frm_qry_ryxx.Image1.Picture.Assign(jpeg);
      pics.Free;
      jpeg.Free;
    end;


    //人员职务
     with ibcqry_ryxx do begin
      Close;
      sql.Text := 'select ry_no, gz_zwmc from ryxx_gzjl'
        + ' where gz_jsrq=(select max(gz_jsrq) from ryxx_gzjl where ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.text) + ') and ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.text);
      Open;
    end;
    if ibcqry_ryxx.IsEmpty then begin
      Frm_qry_ryxx.lbl_zw.Caption := '无';
    end
    else
    begin
      Frm_qry_ryxx.lbl_zw.Caption := ibcqry_ryxx.Fields[1].AsString;
    end;


 with ibcqry_ryxx do begin
      close;
      sql.Text := 'select ry_no, xzbd_bdhje from ryxx_xzbdjl'
        + ' where xzbd_bdrq=(select max(xzbd_bdrq) from ryxx_xzbdjl where ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.text) + ')';
      Open;
    end;
   with ibcqry_ryxx do begin //取测评结果
      close;
      sql.Text := 'select ry_no, ry_cpjg from ryxx_cpjg'
        + ' where ry_no=' + quotedstr(edt_ygno.text);
      Open;
    end;
    if ibcqry_ryxx.IsEmpty then begin
      mmo1.Text := '无';
    end
    else
    begin
      mmo1.Text := ibcqry_ryxx.Fields[1].AsString;
    end;

  end
  else
  begin
    edt_ygno.Text := '8001';
  end;

end;

end.

