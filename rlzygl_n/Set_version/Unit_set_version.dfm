object Form1: TForm1
  Left = 396
  Top = 302
  BorderStyle = bsDialog
  Caption = #35774#32622#31243#24207#29256#26412#21495
  ClientHeight = 185
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 84
    Top = 28
    Width = 290
    Height = 19
    Caption = #21382#21490#29256#26412#21495#26159#65306'2012-01-01 00:00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 84
    Top = 60
    Width = 119
    Height = 19
    Caption = #26368#26032#29256#26412#21495#26159#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 184
    Top = 124
    Width = 75
    Height = 25
    Caption = #37325#32622
    TabOrder = 0
    OnClick = Button1Click
  end
  object IBCConnection1: TIBCConnection
    Database = 'D:\RLZYGL\DATA\RYXX.GDB'
    ClientLibrary = 'gds32.dll'
    Username = 'sysdba'
    Password = 'masterkey'
    Left = 360
    Top = 16
  end
  object IBCTransaction1: TIBCTransaction
    DefaultConnection = IBCConnection1
    Left = 392
    Top = 16
  end
  object IBCQuery1: TIBCQuery
    Transaction = IBCTransaction1
    Left = 424
    Top = 16
  end
end
