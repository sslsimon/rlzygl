unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, comobj, MemDS, DBAccess, IBC,
  RzPrgres, GridsEh, DBGridEh,DBGridEhImpExp;

type
  TForm1 = class(TForm)
    ds1: TDataSource;
    btn1: TButton;
    mmo1: TMemo;
    IBCConnection1: TIBCConnection;
    IBCTransaction1: TIBCTransaction;
    IBCQuery1: TIBCQuery;
    edt1: TEdit;
    btn2: TButton;
    IBCTable1: TIBCTable;
    IBCTransaction2: TIBCTransaction;
    btn3: TButton;
    RzProgressBar1: TRzProgressBar;
    OpenDialog1: TOpenDialog;
    IBCQuery2: TIBCQuery;
    SaveDialog1: TSaveDialog;
    DBGridEh1: TDBGridEh;
    btn4: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure exp_excel;
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
var lm: Integer; //列名记数
implementation

{$R *.dfm}

procedure XLSWriteStringCell(nRow,nCol : WORD;AValue: String);//写字符串数据 
var L: Word; 
var _str : AnsiString;
var arXlsString: array[0..5] of Word;
var aFileStream: TFileStream;
begin 
_str:=AnsiString(AValue);//强制类型转换,兼容Delphi2009,采用String类型要乱码,Delphi2007以下此行代码无所谓 
L := Length(_str);//Length返回的字符个数,采用AnsiString也就是字节长度 
arXlsString[1] := 8 + L; 
arXlsString[2] := nRow; 
arXlsString[3] := nCol; 
arXlsString[5] := L; 
aFileStream.WriteBuffer(arXlsString, SizeOf(arXlsString));
aFileStream.WriteBuffer(Pointer(_str)^, L);//字节长度 
end;

procedure TForm1.exp_excel;
var
  eclApp, WorkBook: olevariant;
  xlsFileName: string;
  i, j: integer;
  var Col, Row: WORD;
begin

  if SaveDialog1.Execute then begin
    xlsFileName := SaveDialog1.FileName;
    try
      eclApp := CreateOleObject('Excel.Application');
      WorkBook := CreateOleObject('Excel.Sheet');
    except
      Application.MessageBox('系统没有安装Microsoft   Excel', 'Microsoft   Excel', MB_OK + MB_ICONWarning);
      Exit;
    end;

    try
      WorkBook := eclApp.workbooks.Add;
      for i := 0 to DBGridEh1.Columns.Count - 1 do begin
          //这里可以更改列名，用if   ...   then进行判断和指定列名
      { case DBGridEh1.Columns[i].Field.DataType of
                ftSmallint, ftInteger, ftWord, ftAutoInc: //整数字段
                    XLSWriteIntegerCell(Row,Col,DBGridEh1.Columns[i].Field.AsInteger);
                ftFloat, ftCurrency, ftBCD://浮点字段
                    XLSWriteFloatCell(Row,Col,DBGridEh1.Columns[i].Field.AsFloat)
                else //其它所有类型字段,此处用DisplayText，而不用AsString ,为了模仿和DBGrid里面完全一致的显示效果,所谓的所见即所得效果嘛...
                    XLSWriteStringCell(Row,Col,DBGridEh1.Columns[i].Field.DisplayText);
                end;//end of case of      }
            //XLSWriteStringCell(Row,Col,DBGridEh1.Columns[i].Field.DisplayText);
           // xlSheet.WorkSheets[1].Cells[ARow, iLoop+1] :=''+dataset.Fields[iLoop].asstring;
         eclapp.cells[1,i+1].numberformatlocal:= '@ ';
//改为文本格式，默认数字格式，科学计数法
       // eclApp.Cells(1, i + 1) := DBGridEh1.Columns[i].FieldName;
        if DBGridEh1.Columns[i].FieldName = 'RQ' then
          eclApp.Cells(1, i + 1) := '日期';
        if DBGridEh1.Columns[i].FieldName = 'XQ' then
          eclApp.Cells(1, i + 1) := '星期';
        if DBGridEh1.Columns[i].FieldName = 'LCHZ' then
          eclApp.Cells(1, i + 1) := '商店';
        if DBGridEh1.Columns[i].FieldName = 'FLOOT1' then
          eclApp.Cells(1, i + 1) := '一楼商场';
        if DBGridEh1.Columns[i].FieldName = 'FLOOT2' then
          eclApp.Cells(1, i + 1) := '二楼商场';
        if DBGridEh1.Columns[i].FieldName = 'FLOOT3' then
          eclApp.Cells(1, i + 1) := '三楼商场';
        if DBGridEh1.Columns[i].FieldName = 'FLOOT4' then
          eclApp.Cells(1, i + 1) := '四楼商场';
        if DBGridEh1.Columns[i].FieldName = 'FLOOT5' then
          eclApp.Cells(1, i + 1) := '五楼商场';
        if DBGridEh1.Columns[i].FieldName = 'CS' then
          eclApp.Cells(1, i + 1) := '其中超市';
      end;

      DBGridEh1.DataSource.DataSet.First;
      j := 1; //导出的XLS从第几行开始
      while not DBGridEh1.DataSource.DataSet.Eof do begin
        for i := 0 to DBGridEh1.DataSource.DataSet.FieldCount - 2 do begin //-2 表示用于排序的临时字段内容不导出
          eclApp.Cells(j, i + 1) := DBGridEh1.DataSource.DataSet.Fields[i].Value;
        end;
        DBGridEh1.DataSource.DataSet.Next;
        inc(j);
      end;

      WorkBook.SaveAS(xlsFileName);
      WorkBook.close;
    except
      ShowMessage('文件导出失败！');
      Exit;
    end;
    Application.MessageBox('保存成功!等待设置格式', '恭喜', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  filepath: string;
  Excel, Workbook, Worksheet: OLEVARIANT;
  i, j: Integer;
  sqltext, sqltext1: string;
begin
  mmo1.Clear;

  with IBCQuery1 do begin
    Close;
    SQL.Clear;
    sql.Add('Select * From RDB$RELATIONS  WHERE RDB$RELATION_NAME=''IN_RYGZ''');
    Open;
    Last;
  end;

  if not IBCQuery1.Eof then begin
    with IBCQuery1 do begin
      Close;
      SQL.Clear;
      sql.Add('drop table in_rygz');
      ExecSQL;
    end;
    try
      OpenDialog1.Execute;
      filepath := OpenDialog1.FileName;
      Excel := CreateOLEObject('Excel.Application');
      WorkBook := Excel.WorkBooks.Open(FilePath);
      WorkSheet := WorkBook.WorkSheets.Item[1]; //打开sheet1
      sqltext := 'CREATE TABLE IN_RYGZ (';
    //CREATE TABLE iN_RYGZ ("IMYA" varchar(20),"TEST" VARCHAR(20));
      for I := 1 to WorkSheet.UsedRange.Columns.Count - 1 do //循环列
      begin
        mmo1.Lines.Add(WorkSheet.Cells[1, I]);
      end;
      lm := mmo1.Lines.Count - 1;

      sqltext1 := '"' + '0' + '"' + ' ' + 'VARCHAR(20)'; //用数字做列名。
  //sqltext1 := '"'+mmo1.Lines[0]+'"'+' '+'VARCHAR(20)';  //取原EXCEL列名，由于是中文，建好的表有问题。
      for i := 1 to mmo1.Lines.Count - 1 do
      begin
      //sqltext1 :=sqltext1+','+'"'+mmo1.Lines[i]+'"'+' '+'VARCHAR(20)';
        sqltext1 := sqltext1 + ',' + '"' + inttostr(i) + '"' + ' ' + 'VARCHAR(20)';
      end;
      edt1.Text := 'CREATE TABLE IN_RYGZ ( ' + sqltext1 + ')';
      with IBCQuery1 do begin
        Close;
        sql.Clear;
        sql.Text := edt1.text;
        ExecSQL;
        ShowMessage('建表成功');
      end;

    finally
      WorkBook.Close;
      Excel := Null;
    end;
  end

  else
  begin
    with IBCQuery1 do begin
      Close;
      SQL.Clear;
      sql.Add('delete from in_rygz');
      ExecSQL;
      ShowMessage('清空成功');
      IBCTable1.Close;
      IBCTable1.Open;
    end

  end;

end;

procedure TForm1.btn2Click(Sender: TObject);
const
 // BeginRow = 2; BeginCol = 1;   //开始导入的行，开始导入的列
  BeginRow = 1; BeginCol = 1; //开始导入的行，开始导入的列
var
  filepath: string;
  Excel, Workbook, Worksheet: OLEVARIANT;
  i, j, k: Integer;
  sqltext, sqltext1: string;
  iRow, iCol: integer;
begin
  OpenDialog1.Execute;
  filepath := OpenDialog1.FileName;
 // FilePath := 'D:\My Documents\桌面\FLUER工资表\工资表格式.xls';
  Excel := CreateOLEObject('Excel.Application');
  WorkBook := Excel.WorkBooks.Open(FilePath);
  WorkSheet := WorkBook.WorkSheets.Item[1]; //打开sheet1
  RzProgressBar1.Percent := 0;
  try
    iRow := BeginRow; //行
    iCol := BeginCol; //列
    while trim(Excel.WorkSheets[1].Cells[iRow, iCol].value) <> '' do begin
      with IBCTable1 do begin
        Open;
        Append;
       {Fields[0].AsString := trim(Excel.WorkSheets[1].Cells[iRow,iCol].value);
       Fields[1].AsString := trim(Excel.WorkSheets[1].Cells[iRow,iCol+1].value);
       Fields[2].Asstring := trim(Excel.WorkSheets[1].Cells[iRow,iCol+2].value);}
        for i := 0 to 21 do begin
          Fields[i].AsString := trim(Excel.WorkSheets[1].Cells[iRow, iCol].value);
          Fields[i].AsString := trim(Excel.WorkSheets[1].Cells[iRow, iCol + i].value);

        end;
        iRow := iRow + 1;
        RzProgressBar1.PartsComplete := RzProgressBar1.PartsComplete + 1;
      end;
    end;
    with IBCTable1 do begin
      Append;
      Fields[0].AsString := trim(Excel.WorkSheets[1].Cells[iRow, iCol].value);
      Fields[1].AsString := trim(Excel.WorkSheets[1].Cells[iRow, iCol + 1].value);
      Fields[2].Asstring := trim(Excel.WorkSheets[1].Cells[iRow, iCol + 2].value);
    end;
    Excel.Quit;
  except
    Application.MessageBox('导入数据出错', '提示信息', MB_OK + MB_ICONASTERISK + MB_DEFBUTTON1 + MB_APPLMODAL);
    Excel.Quit;
  end;
  MessageBox(GetActiveWindow(), '数据导入成功', '提示信息', MB_OK +
    MB_ICONWARNING);
  IBCTable1.Close;
  Excel.Quit;
  with IBCQuery2 do begin
    Close;
    SQL.Clear;
    sql.Add('select * from in_rygz');
    open;
  end;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  exp_excel;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
SaveDialog1.Execute;
SaveDBGridEhToExportFile(TdbGridEhExportAsXls,DBGridEh1,SaveDialog1.FileName,true);
end;

end.

