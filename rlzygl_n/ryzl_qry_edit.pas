unit ryzl_qry_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DB, IBCustomDataSet,
  IBQuery, IBDatabase, IBTable, jpeg, IBC, MemDS, DBAccess,StrUtils;

type
  Tfrm_ryzl_qry_edit = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btn_ok: TButton;
    pnl3: TPanel;
    lbl_ygname: TLabel;
    edt_ygname: TEdit;
    lbl_ygno: TLabel;
    edt_ygno: TEdit;
    ds1: TDataSource;
    dbgrd1: TDBGrid;
    btn_show_all: TButton;
    IBTransaction1: TIBCTransaction;
    IBTransaction_qry_photo: TIBCTransaction;
    ibqry_qryyg_edit: TIBCQuery;
    ibtbl_qry_photo: TIBCTable;
    ibqry_ryxx_photo: TIBCQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_okClick(Sender: TObject);
    procedure dbgrd1DblClick(Sender: TObject);
    procedure edt_ygnoChange(Sender: TObject);
    procedure edt_ygnameChange(Sender: TObject);
    procedure QRY_RY_PHOTO;
    procedure btn_show_allClick(Sender: TObject);
    procedure get_bmxx;
    procedure get_ryzw;
    procedure get_ry_now_xz;
    procedure get_ry_cpjg;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ryzl_qry_edit: Tfrm_ryzl_qry_edit;

implementation
uses MainUnit, Add_ryzl, qry_ryxx,ry_gzgl;
{$R *.dfm}

procedure TFRM_ryzl_qry_edit.QRY_RY_PHOTO; //读照片
var
  pics: TStream;
  Jpeg: TJpegImage;
begin
  if Frm_Addryzl <> nil then begin
    with ibqry_ryxx_photo do begin
      Close;
      sql.Text := 'select ry_no from ryxx_photo where ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.Text);
      Open;
    end;
    if ibqry_ryxx_photo.IsEmpty then begin
      Frm_Addryzl.Image1.Picture := nil;
      exit;

    end
 { ibtbl_qry_photo.open;
 // ibtbl_qry_photo.Locate('ry_no', Frm_Addryzl.edt_ygno.Text, [loPartialKey]);

  if TBlobField(ibtbl_qry_photo.FieldByName('photo')).value = '' then
  begin
    Frm_Addryzl.Image1.Picture := nil;
    exit;
  end }
    else
    begin
      ibtbl_qry_photo.open;
      pics := TMemoryStream.Create;

      ibtbl_qry_photo.Locate('ry_no', Frm_Addryzl.edt_ygno.Text, [loPartialKey]);
      TBlobField(ibtbl_qry_photo.FieldByName('photo')).SaveToStream(pics); //将二进制存入内存流
      pics.Position := 0;
      Jpeg := TJpegImage.Create;
      Jpeg.LoadFromStream(pics); //将流识别为JPEG格式
      Frm_Addryzl.Image1.Picture.Assign(jpeg);
      pics.Free;
      jpeg.Free;
    end;
  end
  else
  begin
    with ibqry_ryxx_photo do begin
      Close;
      sql.Text := 'select ry_no from ryxx_photo where ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.Text);
      Open;
    end;
    if ibqry_ryxx_photo.IsEmpty then begin
      Frm_qry_ryxx.Image1.Picture := nil;
      exit;
    end
    else
    begin
      ibtbl_qry_photo.open;
      pics := TMemoryStream.Create;

      ibtbl_qry_photo.Locate('ry_no', Frm_qry_ryxx.edt_ygno.Text, [loPartialKey]);
      TBlobField(ibtbl_qry_photo.FieldByName('photo')).SaveToStream(pics); //将二进制存入内存流
      pics.Position := 0;
      Jpeg := TJpegImage.Create;
      Jpeg.LoadFromStream(pics); //将流识别为JPEG格式
      Frm_qry_ryxx.Image1.Picture.Assign(jpeg);
      pics.Free;
      jpeg.Free;
    end;
  end;
end;

procedure tfrm_ryzl_qry_edit.get_bmxx; //取部门信息
var ry_bm:string;
begin
  if Frm_Addryzl <> nil then begin
   with ibqry_qryyg_edit do begin
      Close;
      sql.Text := 'select a.bmmc,B.RY_BM from bmxx a,ryxx b'
        + ' where a.bm_no=b.ry_BM and b.ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text);
      Open;
      ry_bm := ibqry_qryyg_edit.Fields[1].asstring;
      if Length(ry_bm) = 2 then begin //一级部门
        Frm_Addryzl.cbb_dw.ItemIndex := Frm_Addryzl.cbb_dw.Items.IndexOf(ibqry_qryyg_edit.Fields[0].AsString);
        Frm_Addryzl.cbb_bm.ItemIndex := -1;
        Frm_Addryzl.cbb_xsbm.ItemIndex := -1;
        Frm_Addryzl.cbb_xsbm1.ItemIndex := -1;
        Frm_Addryzl.lbl_rybm.Caption := RY_BM;
      end;
      if Length(ry_bm) = 5 then begin //二级部门
         with ibqry_qryyg_edit do begin
          Close;
          SQL.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 2));
          open;
          Frm_Addryzl.cbb_dw.ItemIndex := Frm_Addryzl.cbb_dw.Items.IndexOf(ibqry_qryyg_edit.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(ry_bm);
          open;
          Frm_Addryzl.cbb_bm.ItemIndex := Frm_Addryzl.cbb_bm.Items.IndexOf(ibqry_qryyg_edit.Fields[0].AsString);
          Frm_Addryzl.cbb_xsbm.ItemIndex := -1;
           Frm_Addryzl.cbb_xsbm1.ItemIndex := -1;
          end;
          Frm_Addryzl.lbl_rybm.Caption := RY_BM;
      end;
      if Length(ry_bm) = 8 then begin //三级部门
        with ibqry_qryyg_edit do begin
          Close;
          SQL.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 2));
          open;
          Frm_Addryzl.cbb_dw.ItemIndex := Frm_Addryzl.cbb_dw.Items.IndexOf(ibqry_qryyg_edit.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 5));
          open;
          Frm_Addryzl.cbb_bm.ItemIndex := Frm_Addryzl.cbb_bm.Items.IndexOf(ibqry_qryyg_edit.Fields[0].AsString);
          Close;
          sql.Text := 'select bm_no,bmmc from bmxx where bm_no=' + quotedstr(ry_bm);
          open;
          Frm_Addryzl.cbb_xsbm.ItemIndex := Frm_Addryzl.cbb_xsbm.Items.IndexOf(ibqry_qryyg_edit.Fields[1].AsString);
          Frm_Addryzl.cbb_xsbm1.ItemIndex :=-1;
        end;
        Frm_Addryzl.lbl_rybm.Caption := RY_BM;
      end;
      if Length(ry_bm) = 11 then begin //四级部门
        with ibqry_qryyg_edit do begin
          Close;
          SQL.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 2));
          open;
          Frm_Addryzl.cbb_dw.ItemIndex :=  Frm_Addryzl.cbb_dw.Items.IndexOf(ibqry_qryyg_edit.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 5));
          open;
           Frm_Addryzl.cbb_bm.ItemIndex :=  Frm_Addryzl.cbb_bm.Items.IndexOf(ibqry_qryyg_edit.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 8));
          Open;
           Frm_Addryzl.cbb_xsbm.ItemIndex :=  Frm_Addryzl.cbb_xsbm.Items.IndexOf(ibqry_qryyg_edit.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(ry_bm);
          open;
           Frm_Addryzl.cbb_xsbm1.ItemIndex :=  Frm_Addryzl.cbb_xsbm1.Items.IndexOf(ibqry_qryyg_edit.Fields[0].AsString);
        end;
        Frm_Addryzl.lbl_rybm.Caption := RY_BM;
      end;
      //end;
     with ibqry_qryyg_edit do begin

      sql.text:='select a.xlmc from xlxx a,ryxx b'
        + ' where a.xlmc=b.ry_zgxl and b.ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text);
      Open;
      Frm_Addryzl.cbb_ygzgxl.Text := ibqry_qryyg_edit.Fields[0].AsString;
      end;
    end;
  end
  else
  begin
    with ibqry_qryyg_edit do begin
    Close;
      sql.Text := 'select a.bmmc,B.RY_BM from bmxx a,ryxx b'
        + ' where a.bm_no=b.ry_BM and b.ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.text);
      Open;
      ry_bm := ibqry_qryyg_edit.Fields[1].asstring;
      if Length(ry_bm) = 2 then begin //一级部门
        Frm_qry_ryxx.cbb_dw.text := ibqry_qryyg_edit.Fields[0].AsString;
        Frm_qry_ryxx.cbb_bm.ItemIndex := -1;
        Frm_qry_ryxx.cbb_xsbm.ItemIndex := -1;
      end;
      if Length(ry_bm) = 5 then begin //二级部门
         with ibqry_qryyg_edit do begin
          Close;
          SQL.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 2));
          open;
          Frm_qry_ryxx.cbb_dw.text := ibqry_qryyg_edit.Fields[0].AsString;
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(ry_bm);
          open;
          Frm_qry_ryxx.cbb_bm.Text := ibqry_qryyg_edit.Fields[0].AsString;
          Frm_qry_ryxx.cbb_xsbm.ItemIndex := -1;
          end;
      end;
      if Length(ry_bm) = 8 then begin //三级部门
        with ibqry_qryyg_edit do begin
          Close;
          SQL.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 2));
          open;
          Frm_qry_ryxx.cbb_dw.text := ibqry_qryyg_edit.Fields[0].AsString;
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 5));
          open;
          Frm_qry_ryxx.cbb_bm.text := ibqry_qryyg_edit.Fields[0].AsString;
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(ry_bm);
          open;
          Frm_qry_ryxx.cbb_xsbm.text := ibqry_qryyg_edit.Fields[0].AsString;
          Frm_Addryzl.cbb_xsbm1.ItemIndex :=-1;
        end;
        end;
         if Length(ry_bm) = 11 then begin //四级部门
        with ibqry_qryyg_edit do begin
          Close;
          SQL.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 2));
          open;
          Frm_Addryzl.cbb_dw.ItemIndex :=  Frm_Addryzl.cbb_dw.Items.IndexOf(ibqry_qryyg_edit.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 5));
          open;
           Frm_Addryzl.cbb_bm.ItemIndex :=  Frm_Addryzl.cbb_bm.Items.IndexOf(ibqry_qryyg_edit.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(LeftStr(ry_bm, 8));
          Open;
           Frm_Addryzl.cbb_xsbm.ItemIndex :=  Frm_Addryzl.cbb_xsbm.Items.IndexOf(ibqry_qryyg_edit.Fields[0].AsString);
          Close;
          sql.Text := 'select bmmc from bmxx where bm_no=' + quotedstr(ry_bm);
          open;
           Frm_Addryzl.cbb_xsbm1.ItemIndex :=  Frm_Addryzl.cbb_xsbm1.Items.IndexOf(ibqry_qryyg_edit.Fields[0].AsString);
        end;
        Frm_Addryzl.lbl_rybm.Caption := RY_BM;
      end;
       with ibqry_qryyg_edit do begin

      sql.Clear;
      sql.Add('select a.xlmc from xlxx a,ryxx b'
        + ' where a.xlmc=b.ry_zgxl and b.ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.text));
      Open;
      Frm_qry_ryxx.cbb_ygzgxl.Text := ibqry_qryyg_edit.Fields[0].AsString;
         end;
    end;
  //end;
  end;
end;

procedure tfrm_ryzl_qry_edit.get_ryzw; //取人员最新职务
begin
  if Frm_Addryzl <> nil then begin
    with ibqry_qryyg_edit do begin
      Close;
      sql.Text := 'select ry_no, gz_zwmc from ryxx_gzjl'
        + ' where gz_jsrq=(select max(gz_jsrq) from ryxx_gzjl where ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text) + ') and ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text);
      Open;
    end;
    if ibqry_qryyg_edit.IsEmpty then begin
      Frm_Addryzl.lbl_zw.Caption := '无';
    end
    else
    begin
      Frm_Addryzl.lbl_zw.Caption := ibqry_qryyg_edit.Fields[1].AsString;
    end;
  end
  else
  begin
    with ibqry_qryyg_edit do begin
      Close;
       Close;
      sql.Text := 'select ry_no, gz_zwmc from ryxx_gzjl'
        + ' where gz_jsrq=(select max(gz_jsrq) from ryxx_gzjl where ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.text) + ') and ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.text);
      Open;
    end;
    if ibqry_qryyg_edit.IsEmpty then begin
      Frm_qry_ryxx.lbl_zw.Caption := '无';
    end
    else
    begin
      Frm_qry_ryxx.lbl_zw.Caption := ibqry_qryyg_edit.Fields[1].AsString;
    end;
  end;
end;

procedure tfrm_ryzl_qry_edit.get_ry_now_xz;
begin
  if Frm_Addryzl <> nil then begin
    with ibqry_qryyg_edit do begin
      close;
      sql.Text := 'select ry_no, xzbd_bdhje from ryxx_xzbdjl'
        + ' where xzbd_bdrq=(select max(xzbd_bdrq) from ryxx_xzbdjl where ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text) + ')';
      Open;
    end;
    if ibqry_qryyg_edit.IsEmpty then begin
      Frm_Addryzl.lbl_now_gz.Caption := '目前薪资：￥0元';
    end
    else
    begin
      Frm_Addryzl.lbl_now_gz.Caption := '目前薪资：￥' + ibqry_qryyg_edit.Fields[1].AsString + '元';
    end;
  end;
end;

procedure tfrm_ryzl_qry_edit.get_ry_cpjg;
begin
if Frm_Addryzl <> nil then begin
    with ibqry_qryyg_edit do begin
     close;
      sql.Text := 'select ry_no, ry_cpjg from ryxx_cpjg'
        + ' where ry_no=' + quotedstr(Frm_Addryzl.edt_ygno.text);
      Open;
    end;
    if ibqry_qryyg_edit.IsEmpty then begin
      Frm_Addryzl.Memo1.Text := '无';
      Frm_Addryzl.btn_edit_cpjg.Enabled :=False;
      if Frm_Addryzl.lbl_is_edit.Caption ='0'then
      begin
      Frm_Addryzl.btn_add_cpjg.Enabled :=true;
      end
      else
      begin
      Frm_Addryzl.btn_add_cpjg.Enabled :=false;
      end;
    end
    else
    begin
      Frm_Addryzl.Memo1.Text := ibqry_qryyg_edit.Fields[1].AsString;
      if Frm_Addryzl.lbl_is_edit.Caption ='0' then
      Frm_Addryzl.btn_add_cpjg.Enabled :=false
      else
       Frm_Addryzl.btn_edit_cpjg.Enabled :=true;
    end;
  end
  else               //查询员工资料界面调用
   begin
         with ibqry_qryyg_edit do begin
     close;
      sql.Text := 'select ry_no, ry_cpjg from ryxx_cpjg'
        + ' where ry_no=' + quotedstr(Frm_qry_ryxx.edt_ygno.text);
      Open;
    end;
    if ibqry_qryyg_edit.IsEmpty then begin
     Frm_qry_ryxx.mmo1.Text := '无';
    end
    else
    begin
      Frm_qry_ryxx.mmo1.Text := ibqry_qryyg_edit.Fields[1].AsString;
    end;
   end;

end;

procedure Tfrm_ryzl_qry_edit.FormClose(Sender: TObject;
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
  frm_ryzl_qry_edit := nil;
end;

procedure Tfrm_ryzl_qry_edit.btn_okClick(Sender: TObject);
begin
  frm_ryzl_qry_edit.Close;
end;

procedure Tfrm_ryzl_qry_edit.dbgrd1DblClick(Sender: TObject);
begin
  frm_ryzl_qry_edit.Close;
  if Frm_Addryzl <> nil then begin //录入，修改人员资料界面
    Frm_Addryzl.Button1.Enabled :=True;
    Frm_Addryzl.Button2.Enabled :=True;
    Frm_Addryzl.edt_ygno.Text := ibqry_qryyg_edit.Fields[0].AsString;
    Frm_Addryzl.lbl_ygno.Caption := Frm_Addryzl.edt_ygno.Text;
    Frm_Addryzl.lbl_ygno1.Caption := Frm_Addryzl.edt_ygno.Text;
    Frm_Addryzl.lbl_ygno2.Caption := Frm_Addryzl.edt_ygno.Text;
    Frm_Addryzl.lbl_ygno0.Caption := Frm_Addryzl.edt_ygno.Text;
    Frm_Addryzl.lbl_ygno3.Caption := Frm_Addryzl.edt_ygno.Text;
    Frm_Addryzl.edt_ygname.Text := ibqry_qryyg_edit.fieldbyname('RY_NAME').AsString;
    if ibqry_qryyg_edit.fieldbyname('RY_SEX').AsString = '男' then
      Frm_Addryzl.cbb_ybxb.itemindex := 0;
    if ibqry_qryyg_edit.fieldbyname('RY_SEX').AsString = '女' then
      Frm_Addryzl.cbb_ybxb.itemindex := 1;
    if ibqry_qryyg_edit.fieldbyname('RY_CSRQ').Value = null then
      Frm_Addryzl.dtp_csrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_csrq.date := ibqry_qryyg_edit.fieldbyname('RY_CSRQ').Value;
    Frm_Addryzl.edt_ygsfzh.Text := ibqry_qryyg_edit.fieldbyname('RY_SFZH').AsString;
    Frm_Addryzl.edt_ygmphone.Text := ibqry_qryyg_edit.fieldbyname('RY_MOBEL_PHONE').AsString;
    Frm_Addryzl.edt_ygphone.Text := ibqry_qryyg_edit.fieldbyname('RY_PHONE').AsString;
    Frm_Addryzl.edt_yg_jt_address.Text := ibqry_qryyg_edit.fieldbyname('RY_JTZZ').AsString;
    Frm_Addryzl.edt_yg_address_poscode.Text := ibqry_qryyg_edit.fieldbyname('RY_JTZZYZBM').AsString;
    Frm_Addryzl.edt_yghkszd.Text := ibqry_qryyg_edit.fieldbyname('RY_HKSZD').AsString;

    if ibqry_qryyg_edit.FieldByName('RY_HKXZ').AsString = '本地城镇' then
      Frm_Addryzl.cbb_yghkxz.ItemIndex := 0;
    if ibqry_qryyg_edit.FieldByName('RY_HKXZ').AsString = '本地农村' then
      Frm_Addryzl.cbb_yghkxz.ItemIndex := 1;
    if ibqry_qryyg_edit.FieldByName('RY_HKXZ').AsString = '非本地城镇' then
      Frm_Addryzl.cbb_yghkxz.ItemIndex := 2;
    if ibqry_qryyg_edit.FieldByName('RY_HKXZ').AsString = '非本地农村' then
      Frm_Addryzl.cbb_yghkxz.ItemIndex := 3;
    if ibqry_qryyg_edit.fieldbyname('RY_RZRQ').Value = null then
      Frm_Addryzl.dtp_rzrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_rzrq.date := ibqry_qryyg_edit.fieldbyname('RY_RZRQ').Value;
    if ibqry_qryyg_edit.fieldbyname('RY_ZZRQ').Value = null then
      Frm_Addryzl.dtp_zzrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_zzrq.date := ibqry_qryyg_edit.fieldbyname('RY_ZZRQ').Value;
    if ibqry_qryyg_edit.fieldbyname('RY_LZRQ').Value = null then
      Frm_Addryzl.dtp_lzrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_lzrq.date := ibqry_qryyg_edit.fieldbyname('RY_LZRQ').Value;

    if ibqry_qryyg_edit.FieldByName('RY_HY').AsString = '未婚' then
      Frm_Addryzl.cbb_yghyzk.ItemIndex := 0;
    if ibqry_qryyg_edit.FieldByName('RY_HY').AsString = '已婚' then
      Frm_Addryzl.cbb_yghyzk.ItemIndex := 1;
    if ibqry_qryyg_edit.FieldByName('RY_HY').AsString = '其它' then
      Frm_Addryzl.cbb_yghyzk.ItemIndex := 2;
    Frm_Addryzl.edt_ygzy.Text := ibqry_qryyg_edit.fieldbyname('RY_ZY').AsString;

    if ibqry_qryyg_edit.fieldbyname('RY_HTRQ_BEGIN').Value = null then
      Frm_Addryzl.dtp_htqdrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_htqdrq.date := ibqry_qryyg_edit.fieldbyname('RY_HTRQ_BEGIN').Value;
    if ibqry_qryyg_edit.fieldbyname('RY_HTRQ_END').Value = null then
      Frm_Addryzl.dtp_htdqrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_htdqrq.date := ibqry_qryyg_edit.fieldbyname('RY_HTRQ_END').Value;


    if ibqry_qryyg_edit.FieldByName('RY_zt').AsString = '0' then
      Frm_Addryzl.cbb_ygzt.ItemIndex := 0;
    if ibqry_qryyg_edit.FieldByName('RY_zt').AsString = '1' then
      Frm_Addryzl.cbb_ygzt.ItemIndex := 1;
    if ibqry_qryyg_edit.FieldByName('RY_zt').AsString = '2' then
      Frm_Addryzl.cbb_ygzt.ItemIndex := 2;
    if ibqry_qryyg_edit.FieldByName('RY_zt').AsString = '3' then
      Frm_Addryzl.cbb_ygzt.ItemIndex := 3;
    Frm_Addryzl.edt_ygsbzh.Text := ibqry_qryyg_edit.fieldbyname('RY_SBZH').AsString;
    if ibqry_qryyg_edit.fieldbyname('RY_SB_SQRQ').Value = null then
      Frm_Addryzl.dtp_sbsgrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_sbsgrq.date := ibqry_qryyg_edit.fieldbyname('RY_SB_SQRQ').Value;

    if ibqry_qryyg_edit.fieldbyname('RY_SB_TBRQ').Value = null then
      Frm_Addryzl.dtp_sbtbrq.date := StrToDate('1900-01-01')
    else
      Frm_Addryzl.dtp_sbtbrq.date := ibqry_qryyg_edit.fieldbyname('RY_SB_TBRQ').Value;
    Frm_Addryzl.lbl_bm_no.Caption := ibqry_qryyg_edit.fieldbyname('RY_BM').AsString;
    Frm_Addryzl.edt_zic.Text := ibqry_qryyg_edit.fieldbyname('RY_ZIC').AsString;
    Frm_Addryzl.edt_ziGz.Text := ibqry_qryyg_edit.fieldbyname('RY_ZIGZ').AsString;
    Frm_Addryzl.lbl_yggl.Caption := '员工工龄：' + ibqry_qryyg_edit.fieldbyname('RY_GL').AsString + '年';
    FRM_ADDRYZL.mmo_bz.Text := ibqry_qryyg_edit.fieldbyname('RY_BZ').AsString;
    get_bmxx;
    QRY_RY_PHOTO;
    get_ryzw;
    get_ry_now_xz;
    get_ry_cpjg;
    Frm_Addryzl.refsh_data;
  end
  else
   if Frm_qry_ryxx<>nil then  //查询人员资料界面
  begin
    Frm_qry_ryxx.edt_ygno.Text := ibqry_qryyg_edit.Fields[0].AsString;

    Frm_qry_ryxx.edt_ygname.Text := ibqry_qryyg_edit.fieldbyname('RY_NAME').AsString;
    if ibqry_qryyg_edit.fieldbyname('RY_SEX').AsString = '男' then
      Frm_qry_ryxx.cbb_ybxb.itemindex := 0;
    if ibqry_qryyg_edit.fieldbyname('RY_SEX').AsString = '女' then
      Frm_qry_ryxx.cbb_ybxb.itemindex := 1;
    if ibqry_qryyg_edit.fieldbyname('RY_CSRQ').Value = null then
      Frm_qry_ryxx.dtp_csrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_csrq.date := ibqry_qryyg_edit.fieldbyname('RY_CSRQ').Value;
    Frm_qry_ryxx.edt_ygsfzh.Text := ibqry_qryyg_edit.fieldbyname('RY_SFZH').AsString;
    Frm_qry_ryxx.edt_ygmphone.Text := ibqry_qryyg_edit.fieldbyname('RY_MOBEL_PHONE').AsString;
    Frm_qry_ryxx.edt_ygphone.Text := ibqry_qryyg_edit.fieldbyname('RY_PHONE').AsString;
    Frm_qry_ryxx.edt_yg_jt_address.Text := ibqry_qryyg_edit.fieldbyname('RY_JTZZ').AsString;
    Frm_qry_ryxx.edt_yg_address_poscode.Text := ibqry_qryyg_edit.fieldbyname('RY_JTZZYZBM').AsString;
    Frm_qry_ryxx.edt_yghkszd.Text := ibqry_qryyg_edit.fieldbyname('RY_HKSZD').AsString;

    if ibqry_qryyg_edit.FieldByName('RY_HKXZ').AsString = '本地城镇' then
      Frm_qry_ryxx.cbb_yghkxz.ItemIndex := 0;
    if ibqry_qryyg_edit.FieldByName('RY_HKXZ').AsString = '本地农村' then
      Frm_qry_ryxx.cbb_yghkxz.ItemIndex := 1;
    if ibqry_qryyg_edit.FieldByName('RY_HKXZ').AsString = '非本地城镇' then
      Frm_qry_ryxx.cbb_yghkxz.ItemIndex := 2;
    if ibqry_qryyg_edit.FieldByName('RY_HKXZ').AsString = '非本地农村' then
      Frm_qry_ryxx.cbb_yghkxz.ItemIndex := 3;
    if ibqry_qryyg_edit.fieldbyname('RY_RZRQ').Value = null then
      Frm_qry_ryxx.dtp_rzrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_rzrq.date := ibqry_qryyg_edit.fieldbyname('RY_RZRQ').Value;
    if ibqry_qryyg_edit.fieldbyname('RY_ZZRQ').Value = null then
      Frm_qry_ryxx.dtp_zzrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_zzrq.date := ibqry_qryyg_edit.fieldbyname('RY_ZZRQ').Value;
    if ibqry_qryyg_edit.fieldbyname('RY_LZRQ').Value = null then
      Frm_qry_ryxx.dtp_lzrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_lzrq.date := ibqry_qryyg_edit.fieldbyname('RY_LZRQ').Value;

    if ibqry_qryyg_edit.FieldByName('RY_HY').AsString = '未婚' then
      Frm_qry_ryxx.cbb_yghyzk.ItemIndex := 0;
    if ibqry_qryyg_edit.FieldByName('RY_HY').AsString = '已婚' then
      Frm_qry_ryxx.cbb_yghyzk.ItemIndex := 1;
    if ibqry_qryyg_edit.FieldByName('RY_HY').AsString = '其它' then
      Frm_qry_ryxx.cbb_yghyzk.ItemIndex := 2;
    Frm_qry_ryxx.edt_ygzy.Text := ibqry_qryyg_edit.fieldbyname('RY_ZY').AsString;

    if ibqry_qryyg_edit.fieldbyname('RY_HTRQ_BEGIN').Value = null then
      Frm_qry_ryxx.dtp_htqdrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_htqdrq.date := ibqry_qryyg_edit.fieldbyname('RY_HTRQ_BEGIN').Value;
    if ibqry_qryyg_edit.fieldbyname('RY_HTRQ_END').Value = null then
      Frm_qry_ryxx.dtp_htdqrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_htdqrq.date := ibqry_qryyg_edit.fieldbyname('RY_HTRQ_END').Value;


    if ibqry_qryyg_edit.FieldByName('RY_zt').AsString = '0' then
      Frm_qry_ryxx.cbb_ygzt.ItemIndex := 0;
    if ibqry_qryyg_edit.FieldByName('RY_zt').AsString = '1' then
      Frm_qry_ryxx.cbb_ygzt.ItemIndex := 1;
    if ibqry_qryyg_edit.FieldByName('RY_zt').AsString = '2' then
      Frm_qry_ryxx.cbb_ygzt.ItemIndex := 2;
    if ibqry_qryyg_edit.FieldByName('RY_zt').AsString = '3' then
      Frm_qry_ryxx.cbb_ygzt.ItemIndex := 3;
    Frm_qry_ryxx.edt_ygsbzh.Text := ibqry_qryyg_edit.fieldbyname('RY_SBZH').AsString;
    if ibqry_qryyg_edit.fieldbyname('RY_SB_SQRQ').Value = null then
      Frm_qry_ryxx.dtp_sbsgrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_sbsgrq.date := ibqry_qryyg_edit.fieldbyname('RY_SB_SQRQ').Value;

    if ibqry_qryyg_edit.fieldbyname('RY_SB_TBRQ').Value = null then
      Frm_qry_ryxx.dtp_sbtbrq.date := StrToDate('1900-01-01')
    else
      Frm_qry_ryxx.dtp_sbtbrq.date := ibqry_qryyg_edit.fieldbyname('RY_SB_TBRQ').Value;
    Frm_qry_ryxx.lbl_bm_no.Caption := ibqry_qryyg_edit.fieldbyname('RY_BM').AsString;
    Frm_qry_ryxx.edt_zic.Text := ibqry_qryyg_edit.fieldbyname('RY_ZIC').AsString;
    Frm_qry_ryxx.edt_ziGz.Text := ibqry_qryyg_edit.fieldbyname('RY_ZIGZ').AsString;
    Frm_qry_ryxx.lbl_yggl.Caption := '员工工龄：' + ibqry_qryyg_edit.fieldbyname('RY_GL').AsString + '年';
    FRM_QRY_RYXX.mmo_bz.Text := ibqry_qryyg_edit.fieldbyname('RY_BZ').AsString;
    get_bmxx;
    QRY_RY_PHOTO;
    get_ryzw;
    get_ry_now_xz;
    get_ry_cpjg;
    Frm_qry_ryxx.refsh_data;

  end
  else
   begin
     frm_rygzgl.edt_ryno.Text :=ibqry_qryyg_edit.fieldbyname('RY_NO').AsString;
     frm_rygzgl.lbl_name.Caption :=ibqry_qryyg_edit.fieldbyname('RY_name').AsString;
     frm_rygzgl.lbl_glgz.Caption := ibqry_qryyg_edit.fieldbyname('RY_GLGZ').AsString;
   end;
end;

procedure Tfrm_ryzl_qry_edit.edt_ygnoChange(Sender: TObject);
begin
  with ibqry_qryyg_edit do begin
    close;
    sql.Clear;
    sql.Add('select * from ryxx where RY_NO=:RY_NO');
    ParamByName('RY_NO').AsString := edt_ygno.Text;
    open;
  end;
end;

procedure Tfrm_ryzl_qry_edit.edt_ygnameChange(Sender: TObject);
begin
  with ibqry_qryyg_edit do begin
    close;
    sql.Clear;
    sql.Add('select * from ryxx where RY_NAME like :RY_NAME');
    ParamByName('RY_NAME').AsString := '%' + edt_ygname.Text + '%';
    open;
  end;
end;

procedure Tfrm_ryzl_qry_edit.btn_show_allClick(Sender: TObject);
begin
  with ibqry_qryyg_edit do begin
    Close;
    SQL.Clear;
    sql.add('select * from RYXX order by RY_NO');
    open;
  end;
end;

end.

