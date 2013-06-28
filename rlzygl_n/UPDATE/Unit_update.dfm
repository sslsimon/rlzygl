object Form1: TForm1
  Left = 342
  Top = 317
  BorderStyle = bsDialog
  Caption = 'Form1'
  ClientHeight = 84
  ClientWidth = 405
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
  object RPBA: TRzProgressStatus
    Left = 13
    Top = 30
    Width = 380
    Height = 25
    ParentShowHint = False
    PartsComplete = 0
    Percent = 0
    ShowPercent = True
    TotalParts = 0
  end
  object Label1: TLabel
    Left = 17
    Top = 11
    Width = 74
    Height = 13
    Caption = #31243#24207#26356#26032#20013'...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn1: TButton
    Left = 165
    Top = 58
    Width = 75
    Height = 25
    Caption = #19979#36733#26356#26032
    TabOrder = 0
    Visible = False
    OnClick = btn1Click
  end
  object IdFTP1: TIdFTP
    OnWork = IdFTP1Work
    OnWorkEnd = IdFTP1WorkEnd
    AutoLogin = True
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 704
    Top = 8
  end
  object IBCConnection1: TIBCConnection
    Database = 'D:\rlzygl\Data\RYXX.GDB'
    ClientLibrary = 'gds32.dll'
    Username = 'sysdba'
    Password = 'masterkey'
    Left = 40
    Top = 16
  end
  object IBCTransaction1: TIBCTransaction
    DefaultConnection = IBCConnection1
    Left = 96
    Top = 32
  end
  object IBCQuery1: TIBCQuery
    Transaction = IBCTransaction1
    Left = 200
    Top = 16
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 352
    Top = 8
  end
end
