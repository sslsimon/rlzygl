object Frm_Change_password: TFrm_Change_password
  Left = 434
  Top = 363
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #23494#30721#20462#25913
  ClientHeight = 205
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 152
    Width = 466
    Height = 53
    Align = alBottom
    BorderStyle = bsSingle
    TabOrder = 0
    object Button1: TButton
      Left = 110
      Top = 8
      Width = 90
      Height = 35
      Caption = #30830#23450
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 262
      Top = 8
      Width = 90
      Height = 35
      Caption = #21462#28040
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 466
    Height = 152
    Align = alClient
    BorderStyle = bsSingle
    TabOrder = 1
    object Label1: TLabel
      Left = 136
      Top = 21
      Width = 80
      Height = 20
      Caption = #21407#23494#30721#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 137
      Top = 60
      Width = 80
      Height = 20
      Caption = #26032#23494#30721#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 97
      Top = 98
      Width = 120
      Height = 20
      Caption = #30830#35748#26032#23494#30721#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object edt_old_passowrd: TEdit
      Left = 210
      Top = 16
      Width = 160
      Height = 28
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 0
      OnKeyDown = edt_old_passowrdKeyDown
    end
    object edt_new_password: TEdit
      Left = 210
      Top = 56
      Width = 160
      Height = 28
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
      OnKeyDown = edt_new_passwordKeyDown
    end
    object edt_new_password2: TEdit
      Left = 210
      Top = 96
      Width = 160
      Height = 28
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
      OnKeyDown = edt_new_password2KeyDown
    end
  end
  object IBCQuery1: TIBCQuery
    Connection = MainForm.IBCConnection1
    Transaction = MainForm.IBTransaction1
    Left = 72
    Top = 16
  end
end
