object Form1: TForm1
  Left = 212
  Top = 139
  Width = 870
  Height = 640
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RzProgressBar1: TRzProgressBar
    Left = 8
    Top = 576
    Width = 849
    BorderWidth = 0
    InteriorOffset = 0
    PartsComplete = 0
    Percent = 0
    TotalParts = 49
  end
  object btn1: TButton
    Left = 8
    Top = 368
    Width = 75
    Height = 25
    Caption = #29983#25104#34920
    TabOrder = 0
    OnClick = btn1Click
  end
  object mmo1: TMemo
    Left = 672
    Top = 304
    Width = 185
    Height = 209
    Lines.Strings = (
      'mmo1')
    TabOrder = 1
    Visible = False
  end
  object edt1: TEdit
    Left = 8
    Top = 528
    Width = 833
    Height = 21
    TabOrder = 2
    Text = 'edt1'
  end
  object btn2: TButton
    Left = 88
    Top = 368
    Width = 75
    Height = 25
    Caption = #23548#20837
    TabOrder = 3
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 248
    Top = 368
    Width = 75
    Height = 25
    Caption = #23548#20986
    TabOrder = 4
    OnClick = btn3Click
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 8
    Width = 849
    Height = 289
    DataSource = ds1
    ShowSerialNo = False
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btn4: TButton
    Left = 272
    Top = 424
    Width = 75
    Height = 25
    Caption = 'btn4'
    TabOrder = 6
    OnClick = btn4Click
  end
  object ds1: TDataSource
    DataSet = IBCQuery2
    Left = 384
    Top = 72
  end
  object IBCConnection1: TIBCConnection
    Database = 'D:\rlzygl\data\RYXX.GDB'
    ClientLibrary = 'gds32.dll'
    Username = 'sysdba'
    Password = 'masterkey'
    Server = '127.0.0.1'
    Connected = True
    LoginPrompt = False
    Left = 96
    Top = 224
  end
  object IBCTransaction1: TIBCTransaction
    DefaultConnection = IBCConnection1
    Left = 144
    Top = 224
  end
  object IBCQuery1: TIBCQuery
    Connection = IBCConnection1
    Left = 192
    Top = 224
  end
  object IBCTable1: TIBCTable
    TableName = 'IN_RYGZ'
    Connection = IBCConnection1
    Transaction = IBCTransaction2
    Left = 504
    Top = 304
  end
  object IBCTransaction2: TIBCTransaction
    DefaultConnection = IBCConnection1
    Left = 280
    Top = 184
  end
  object OpenDialog1: TOpenDialog
    Left = 440
    Top = 168
  end
  object IBCQuery2: TIBCQuery
    SQL.Strings = (
      'select * from in_rygz')
    Left = 352
    Top = 264
  end
  object SaveDialog1: TSaveDialog
    Left = 560
    Top = 256
  end
end
