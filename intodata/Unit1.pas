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
var lm: Integer; //��������
implementation

{$R *.dfm}

procedure XLSWriteStringCell(nRow,nCol : WORD;AValue: String);//д�ַ������� 
var L: Word; 
var _str : AnsiString;
var arXlsString: array[0..5] of Word;
var aFileStream: TFileStream;
begin 
_str:=AnsiString(AValue);//ǿ������ת��,����Delphi2009,����String����Ҫ����,Delphi2007���´��д�������ν 
L := Length(_str);//Length���ص��ַ�����,����AnsiStringҲ�����ֽڳ��� 
arXlsString[1] := 8 + L; 
arXlsString[2] := nRow; 
arXlsString[3] := nCol; 
arXlsString[5] := L; 
aFileStream.WriteBuffer(arXlsString, SizeOf(arXlsString));
aFileStream.WriteBuffer(Pointer(_str)^, L);//�ֽڳ��� 
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
      Application.MessageBox('ϵͳû�а�װMicrosoft   Excel', 'Microsoft   Excel', MB_OK + MB_ICONWarning);
      Exit;
    end;

    try
      WorkBook := eclApp.workbooks.Add;
      for i := 0 to DBGridEh1.Columns.Count - 1 do begin
          //������Ը�����������if   ...   then�����жϺ�ָ������
      { case DBGridEh1.Columns[i].Field.DataType of
                ftSmallint, ftInteger, ftWord, ftAutoInc: //�����ֶ�
                    XLSWriteIntegerCell(Row,Col,DBGridEh1.Columns[i].Field.AsInteger);
                ftFloat, ftCurrency, ftBCD://�����ֶ�
                    XLSWriteFloatCell(Row,Col,DBGridEh1.Columns[i].Field.AsFloat)
                else //�������������ֶ�,�˴���DisplayText��������AsString ,Ϊ��ģ�º�DBGrid������ȫһ�µ���ʾЧ��,��ν������������Ч����...
                    XLSWriteStringCell(Row,Col,DBGridEh1.Columns[i].Field.DisplayText);
                end;//end of case of      }
            //XLSWriteStringCell(Row,Col,DBGridEh1.Columns[i].Field.DisplayText);
           // xlSheet.WorkSheets[1].Cells[ARow, iLoop+1] :=''+dataset.Fields[iLoop].asstring;
         eclapp.cells[1,i+1].numberformatlocal:= '@ ';
//��Ϊ�ı���ʽ��Ĭ�����ָ�ʽ����ѧ������
       // eclApp.Cells(1, i + 1) := DBGridEh1.Columns[i].FieldName;
        if DBGridEh1.Columns[i].FieldName = 'RQ' then
          eclApp.Cells(1, i + 1) := '����';
        if DBGridEh1.Columns[i].FieldName = 'XQ' then
          eclApp.Cells(1, i + 1) := '����';
        if DBGridEh1.Columns[i].FieldName = 'LCHZ' then
          eclApp.Cells(1, i + 1) := '�̵�';
        if DBGridEh1.Columns[i].FieldName = 'FLOOT1' then
          eclApp.Cells(1, i + 1) := 'һ¥�̳�';
        if DBGridEh1.Columns[i].FieldName = 'FLOOT2' then
          eclApp.Cells(1, i + 1) := '��¥�̳�';
        if DBGridEh1.Columns[i].FieldName = 'FLOOT3' then
          eclApp.Cells(1, i + 1) := '��¥�̳�';
        if DBGridEh1.Columns[i].FieldName = 'FLOOT4' then
          eclApp.Cells(1, i + 1) := '��¥�̳�';
        if DBGridEh1.Columns[i].FieldName = 'FLOOT5' then
          eclApp.Cells(1, i + 1) := '��¥�̳�';
        if DBGridEh1.Columns[i].FieldName = 'CS' then
          eclApp.Cells(1, i + 1) := '���г���';
      end;

      DBGridEh1.DataSource.DataSet.First;
      j := 1; //������XLS�ӵڼ��п�ʼ
      while not DBGridEh1.DataSource.DataSet.Eof do begin
        for i := 0 to DBGridEh1.DataSource.DataSet.FieldCount - 2 do begin //-2 ��ʾ�����������ʱ�ֶ����ݲ�����
          eclApp.Cells(j, i + 1) := DBGridEh1.DataSource.DataSet.Fields[i].Value;
        end;
        DBGridEh1.DataSource.DataSet.Next;
        inc(j);
      end;

      WorkBook.SaveAS(xlsFileName);
      WorkBook.close;
    except
      ShowMessage('�ļ�����ʧ�ܣ�');
      Exit;
    end;
    Application.MessageBox('����ɹ�!�ȴ����ø�ʽ', '��ϲ', MB_OK + MB_ICONINFORMATION);
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
      WorkSheet := WorkBook.WorkSheets.Item[1]; //��sheet1
      sqltext := 'CREATE TABLE IN_RYGZ (';
    //CREATE TABLE iN_RYGZ ("IMYA" varchar(20),"TEST" VARCHAR(20));
      for I := 1 to WorkSheet.UsedRange.Columns.Count - 1 do //ѭ����
      begin
        mmo1.Lines.Add(WorkSheet.Cells[1, I]);
      end;
      lm := mmo1.Lines.Count - 1;

      sqltext1 := '"' + '0' + '"' + ' ' + 'VARCHAR(20)'; //��������������
  //sqltext1 := '"'+mmo1.Lines[0]+'"'+' '+'VARCHAR(20)';  //ȡԭEXCEL���������������ģ����õı������⡣
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
        ShowMessage('����ɹ�');
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
      ShowMessage('��ճɹ�');
      IBCTable1.Close;
      IBCTable1.Open;
    end

  end;

end;

procedure TForm1.btn2Click(Sender: TObject);
const
 // BeginRow = 2; BeginCol = 1;   //��ʼ������У���ʼ�������
  BeginRow = 1; BeginCol = 1; //��ʼ������У���ʼ�������
var
  filepath: string;
  Excel, Workbook, Worksheet: OLEVARIANT;
  i, j, k: Integer;
  sqltext, sqltext1: string;
  iRow, iCol: integer;
begin
  OpenDialog1.Execute;
  filepath := OpenDialog1.FileName;
 // FilePath := 'D:\My Documents\����\FLUER���ʱ�\���ʱ��ʽ.xls';
  Excel := CreateOLEObject('Excel.Application');
  WorkBook := Excel.WorkBooks.Open(FilePath);
  WorkSheet := WorkBook.WorkSheets.Item[1]; //��sheet1
  RzProgressBar1.Percent := 0;
  try
    iRow := BeginRow; //��
    iCol := BeginCol; //��
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
    Application.MessageBox('�������ݳ���', '��ʾ��Ϣ', MB_OK + MB_ICONASTERISK + MB_DEFBUTTON1 + MB_APPLMODAL);
    Excel.Quit;
  end;
  MessageBox(GetActiveWindow(), '���ݵ���ɹ�', '��ʾ��Ϣ', MB_OK +
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

