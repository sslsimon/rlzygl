unit htgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, DB, MemDS, IBC, DBAccess;

type
  Tfrm_htgl = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    btn_ht_id: TButton;
    edt_ht_id: TEdit;
    edt_ht_code: TEdit;
    edt_ppmc: TEdit;
    cbb_htlb: TComboBox;
    cbb_htxz: TComboBox;
    edt_qyjf: TEdit;
    edt_qyyf: TEdit;
    edt_ht_name: TEdit;
    dtp_ht_qsrq: TDateTimePicker;
    dtp_ht_sxrq: TDateTimePicker;
    dtp_ht_jsrq: TDateTimePicker;
    edt_ht_zydz: TEdit;
    mmo_ht_hztj: TMemo;
    edt_ht_jbr: TEdit;
    lbl1: TLabel;
    edt_ht_cfdd: TEdit;
    btn_add_ht: TButton;
    btn_edit_ht: TButton;
    btn_sh_ht: TButton;
    btn_save_ht: TButton;
    btn_cancel_ht: TButton;
    IBCTransaction1: TIBCTransaction;
    IBCQuery1: TIBCQuery;
    ibcqr_add: TIBCQuery;
    ibctrnsctn_add: TIBCTransaction;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edt_kd: TEdit;
    edt_bd: TEdit;
    edt_fc: TEdit;
    procedure btn_save_htClick(Sender: TObject);
    procedure btn_add_htClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btn_cancel_htClick(Sender: TObject);
    procedure btn_edit_htClick(Sender: TObject);
    procedure btn_ht_idClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure get_max_id;
  end;

var
  frm_htgl: Tfrm_htgl;
var max_ID, HT_ID: Integer; // -- max_ID最大记录号 HT_ID 人员编号
implementation
uses MainUnit, qry_ht;
{$R *.dfm}

procedure tfrm_htgl.get_max_id;
begin
  with IBCQuery1 do begin
    Close;
    sql.Clear;
    sql.Add('select max(ht_id) from htgl');
    Open;
  end;
  if IBCQuery1.Fields[0].Value = null then begin
    max_ID := 90000000;
  end
  else
  begin
    max_ID := IBCQuery1.Fields[0].AsInteger;
  end;
end;

procedure Tfrm_htgl.btn_save_htClick(Sender: TObject);
var i: integer;
begin
      //判断必填项目是否都填写
 { if Trim(edt_ht_code.Text) = '' then begin
    ShowMessage('请输入合同编号！');
    edt_ht_code.SetFocus;
  end
  else }
    if Trim(edt_ppmc.Text) = '' then begin
      ShowMessage('请输入品牌名称！');
      edt_ppmc.SetFocus;
    end
    else
      if Trim(edt_ht_name.Text) = '' then begin
        ShowMessage('请输入合同名称！');
        edt_ht_name.SetFocus;
      end
      else
        if Trim(edt_qyjf.Text) = '' then begin
          ShowMessage('请输入甲方名称！');
          edt_qyjf.SetFocus;
        end
           else
        if Trim(edt_qyyf.Text) = '' then begin
          ShowMessage('请输入乙方名称！');
          edt_qyyf.SetFocus;
        end

          else
            if DateToStr(dtp_ht_sxrq.Date) = '1900-01-01' then begin
              ShowMessage('请选择合同生效日！');
              dtp_ht_sxrq.SetFocus;
            end
            else
              if DateToStr(dtp_ht_jsrq.Date) = '1900-01-01' then begin
                ShowMessage('请选择合同到期日！');
                dtp_ht_jsrq.SetFocus;
              end
              else
                if Trim(edt_ht_zydz.Text) = '' then begin
                  ShowMessage('请输入合同履行地址！');
                  edt_ht_zydz.SetFocus;
                end
                  else
                  begin //没有漏填的项目，以下代码开始保存提交。
                    if is_edit = 0 then begin //添加模式
                      with ibcqr_add do begin
                        Close;
                        SQL.Clear;
                        SQL.Add('insert into htgl(HT_ID,HT_CODE,PPMC,HT_NAME,HTLB,HTXZ,QYJF,QYYF,HT_QSRQ,HT_SXRQ,HT_JSRQ,HTZYDZ,HT_HZTZ,HT_JBR,HT_CFDD,HTKD,HTBD,HTFC)'
                          + ' values(:HT_ID,:HT_CODE,:PPMC,:HT_NAME,:HTLB,:HTXZ,:QYJF,:QYYF,:HT_QSRQ,:HT_SXRQ,:HT_JSRQ,:HTZYDZ,:HT_HZTZ,:HT_JBR,:HT_CFDD,:HTKD,:HTBD,:HTFC)');
                        ParamByName('HT_ID').value := HT_ID;
                        ParamByName('HT_CODE').value := Trim(edt_ht_code.Text);
                        ParamByName('PPMC').value := Trim(edt_ppmc.Text);
                        ParamByName('HT_NAME').value := Trim(edt_ht_name.Text);
                        ParamByName('HTLB').value := cbb_htlb.Text;
                        ParamByName('HTXZ').value := cbb_htxz.Text;
                        ParamByName('QYJF').value := Trim(edt_qyjf.Text);
                        ParamByName('QYYF').value := Trim(edt_qyyf.Text);
                        ParamByName('HT_QSRQ').AsDate := dtp_ht_qsrq.Date;
                        ParamByName('HT_SXRQ').AsDate := dtp_ht_sxrq.Date;
                        parambyname('HT_JSRQ').AsDate := dtp_ht_jsrq.Date;
                        ParamByName('HTZYDZ').value := Trim(edt_ht_zydz.Text);
                        ParamByName('HT_HZTZ').value := Trim(mmo_ht_hztj.Text);
                        ParamByName('HT_JBR').value := Trim(edt_ht_jbr.Text);
                        ParamByName('HT_CFDD').value := Trim(edt_ht_cfdd.Text);
                        if Trim(edt_kd.Text)='' then
                         ParamByName('HTKD').value :='0'
                         else
                        ParamByName('HTKD').value := Trim(edt_kd.Text);
                        if Trim(edt_bd.Text)='' then
                         ParamByName('HTBD').value :='0'
                         else
                        ParamByName('HTBD').value := Trim(edt_bd.Text);

                        if Trim(edt_fc.Text)='' then
                         ParamByName('HTFC').value :='0'
                         else
                        ParamByName('HTFC').value := Trim(edt_fc.Text);
                        ExecSQL;
                      end;

                      for i := 0 to self.componentcount - 1 do begin //设置组件属性
                        if self.components[i] is Tedit then
                        begin
                          Tedit(self.components[i]).Color := clBtnFace;
                          Tedit(self.components[i]).Enabled := False;
                        end;
                        if self.components[i] is TComboBox then
                          TComboBox(self.components[i]).Enabled := False;
                        if self.components[i] is tdatetimepicker then
                          tdatetimepicker(self.components[i]).Enabled := False;
                        if self.components[i] is TMemo then
                          TMemo(self.components[i]).Enabled := False;
                      end;
                      btn_save_ht.Enabled := False;
                      btn_cancel_ht.Enabled := False;
                      btn_add_ht.Enabled := True;
                      ShowMessage('添加成功！');
                    end;
                    if is_edit = 1 then begin //修改模式
                      with ibcqr_add do begin
                        Close;
                        SQL.Clear;
                        SQL.Add('update htgl set HT_CODE=:HT_CODE,PPMC=:PPMC,HT_NAME=:HT_NAME,HTLB=:HTLB,HTXZ=:HTXZ,QYJF=:QYJF,QYYF=:QYYF'
                          + ',HT_QSRQ=:HT_QSRQ,HT_SXRQ=:HT_SXRQ,HT_JSRQ=:HT_JSRQ,HTZYDZ=:HTZYDZ,HT_HZTZ=:HT_HZTZ,HT_JBR=:HT_JBR,HT_CFDD=:HT_CFDD,HTKD=:HTKD,HTBD=:HTBD,HTFC=:HTFC where HT_ID=' + quotedstr(edt_ht_id.Text));
                        ParamByName('HT_CODE').value := Trim(edt_ht_code.Text);
                        ParamByName('PPMC').value := Trim(edt_ppmc.Text);
                        ParamByName('HT_NAME').value := Trim(edt_ht_name.Text);
                        ParamByName('HTLB').value := cbb_htlb.Text;
                        ParamByName('HTXZ').value := cbb_htxz.Text;
                        ParamByName('QYJF').value := Trim(edt_qyjf.Text);
                        ParamByName('QYYF').value := Trim(edt_qyyf.Text);
                        ParamByName('HT_QSRQ').AsDate := dtp_ht_qsrq.Date;
                        ParamByName('HT_SXRQ').AsDate := dtp_ht_sxrq.Date;
                        parambyname('HT_JSRQ').AsDate := dtp_ht_jsrq.Date;
                        ParamByName('HTZYDZ').value := Trim(edt_ht_zydz.Text);
                        ParamByName('HT_HZTZ').value := Trim(mmo_ht_hztj.Text);
                        ParamByName('HT_JBR').value := Trim(edt_ht_jbr.Text);
                        ParamByName('HT_CFDD').value := Trim(edt_ht_cfdd.Text);
                       if Trim(edt_kd.Text)='' then
                         ParamByName('HTKD').value :='0'
                         else
                        ParamByName('HTKD').value := Trim(edt_kd.Text);
                        if Trim(edt_bd.Text)='' then
                         ParamByName('HTBD').value :='0'
                         else
                        ParamByName('HTBD').value := Trim(edt_bd.Text);

                        if Trim(edt_fc.Text)='' then
                         ParamByName('HTFC').value :='0'
                         else
                        ParamByName('HTFC').value := Trim(edt_fc.Text);
                        ExecSQL;
                      end;
                      for i := 0 to self.componentcount - 1 do begin //设置组件属性
                        if self.components[i] is Tedit then
                        begin
                          Tedit(self.components[i]).Color := clBtnFace;
                          Tedit(self.components[i]).Enabled := False;
                        end;
                        if self.components[i] is TComboBox then
                          TComboBox(self.components[i]).Enabled := False;
                        if self.components[i] is tdatetimepicker then
                          tdatetimepicker(self.components[i]).Enabled := False;
                        if self.components[i] is TMemo then
                          TMemo(self.components[i]).Enabled := False;
                      end;
                      btn_ht_id.Enabled := true;
                      btn_edit_ht.Enabled := true;
                      btn_save_ht.Enabled := False;
                      btn_cancel_ht.Enabled := False;
                      ShowMessage('修改成功！');
                    end;
                    if is_edit = 2 then begin //审核模式
                      btn_ht_id.Enabled := true;
                      btn_sh_ht.Enabled := True;
                    end;



                  end;



end;

procedure Tfrm_htgl.btn_add_htClick(Sender: TObject);
var i: Integer;
begin
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
  btn_ht_id.Enabled := False;
  btn_add_ht.Enabled := False;
  btn_save_ht.Enabled := true;
  btn_cancel_ht.Enabled := True;
 //清空表单
  edt_ht_code.Clear;
  edt_ht_name.Clear;
  edt_ppmc.Clear;
  cbb_htlb.ItemIndex := -1;
  cbb_htxz.ItemIndex := -1;
  edt_qyjf.Clear;
  edt_qyyf.Clear;
  edt_ht_zydz.Clear;
  mmo_ht_hztj.Clear;
  edt_ht_jbr.Clear;
  edt_ht_cfdd.Clear;
  dtp_ht_sxrq.Date := StrToDate('1900-01-01');
  dtp_ht_qsrq.Date := StrToDate('1900-01-01');
  dtp_ht_jsrq.Date := StrToDate('1900-01-01');
  edt_kd.Clear;
  edt_fc.Clear;
  edt_bd.Clear;
  get_max_id;
  HT_ID := max_ID + 1;
  edt_ht_id.Text := IntToStr(ht_id);
end;

procedure Tfrm_htgl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  frm_htgl := nil;
end;

procedure Tfrm_htgl.FormShow(Sender: TObject);
var i: Integer;
begin
  for i := 0 to self.componentcount - 1 do begin
    if self.components[i] is Tedit then
    begin
      Tedit(self.components[i]).Color := clBtnFace;
      Tedit(self.components[i]).Enabled := False;
    end;
    if self.components[i] is TComboBox then
      TComboBox(self.components[i]).Enabled := False;
    if self.components[i] is tdatetimepicker then
      tdatetimepicker(self.components[i]).Enabled := False;
    if self.components[i] is TMemo then
      TMemo(self.components[i]).Enabled := False;
  end;
  btn_save_ht.Enabled := False;
  btn_cancel_ht.Enabled := False;
  btn_add_ht.Enabled := False;
  btn_edit_ht.Enabled := False;
  btn_sh_ht.Enabled := False;
  btn_ht_id.Enabled := False;
  if is_edit = 0 then begin //添加模式
    btn_add_ht.Enabled := True;
  end;
  if is_edit = 1 then begin //修改模式
    btn_ht_id.Enabled := true;
    btn_edit_ht.Enabled := True;
  end;
  if is_edit = 2 then begin //审核模式
    btn_ht_id.Enabled := true;
    btn_sh_ht.Enabled := True;
  end;
end;

procedure Tfrm_htgl.btn_cancel_htClick(Sender: TObject);
var i: Integer;
begin
  for i := 0 to self.componentcount - 1 do begin
    if self.components[i] is Tedit then
    begin
      Tedit(self.components[i]).Color := clBtnFace;
      Tedit(self.components[i]).Enabled := False;
    end;
    if self.components[i] is TComboBox then
      TComboBox(self.components[i]).Enabled := False;
    if self.components[i] is tdatetimepicker then
      tdatetimepicker(self.components[i]).Enabled := False;
    if self.components[i] is TMemo then
      TMemo(self.components[i]).Enabled := False;
  end;
  if is_edit = 0 then begin //添加模式
    btn_add_ht.Enabled := True;
  end;
  if is_edit = 1 then begin //修改模式
    btn_ht_id.Enabled := true;
    btn_edit_ht.Enabled := True;
  end;
  if is_edit = 2 then begin //审核模式
    btn_ht_id.Enabled := true;
    btn_sh_ht.Enabled := True;
  end;
  btn_save_ht.Enabled := False;
  btn_cancel_ht.Enabled := False;
end;

procedure Tfrm_htgl.btn_edit_htClick(Sender: TObject);
var i: Integer;
begin
 if Trim(edt_ht_id.Text) <> '' then begin

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
  edt_ht_id.Enabled := False;
  edt_ht_id.Color := clBtnFace;
  btn_ht_id.Enabled := false;
  btn_edit_ht.Enabled := False;
  btn_save_ht.Enabled := true;
  btn_cancel_ht.Enabled := True;
  end
  else
    begin
      btn_ht_id.Click;
    end;
end;

procedure Tfrm_htgl.btn_ht_idClick(Sender: TObject);
begin
  is_edit := 1; //修改模式
  if frm_qry_htgl = nil then frm_qry_htgl := Tfrm_qry_htgl.Create(application);
  frm_qry_htgl.Show;
end;

end.

