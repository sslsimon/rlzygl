object frm_ryzl_qry_edit: Tfrm_ryzl_qry_edit
  Left = 232
  Top = 329
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #20154#21592#36164#26009#20462#25913#26597#35810
  ClientHeight = 422
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 41
    Width = 862
    Height = 340
    Align = alClient
    TabOrder = 0
    object dbgrd1: TDBGrid
      Left = 1
      Top = 1
      Width = 860
      Height = 338
      Align = alClient
      DataSource = ds1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgrd1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'RY_NO'
          Title.Caption = #20154#21592#32534#21495
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RY_NAME'
          Title.Caption = #22995#21517
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Width = 202
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RY_MOBEL_PHONE'
          Title.Caption = #25163#26426#21495#30721
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Width = 163
          Visible = True
        end>
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 381
    Width = 862
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btn_ok: TButton
      Left = 384
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = btn_okClick
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 41
    Align = alTop
    TabOrder = 2
    object lbl_ygname: TLabel
      Left = 240
      Top = 10
      Width = 51
      Height = 16
      Caption = #22995#21517#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_ygno: TLabel
      Left = 32
      Top = 10
      Width = 85
      Height = 16
      Caption = #20154#21592#32534#21495#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt_ygname: TEdit
      Left = 288
      Top = 8
      Width = 161
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = edt_ygnameChange
    end
    object edt_ygno: TEdit
      Left = 112
      Top = 8
      Width = 121
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnChange = edt_ygnoChange
    end
  end
  object btn_show_all: TButton
    Left = 480
    Top = 8
    Width = 75
    Height = 25
    Caption = #26174#31034#20840#37096
    TabOrder = 3
    OnClick = btn_show_allClick
  end
  object ds1: TDataSource
    AutoEdit = False
    DataSet = ibqry_qryyg_edit
    Left = 256
    Top = 97
  end
  object IBTransaction1: TIBCTransaction
    DefaultConnection = MainForm.IBCConnection1
    Left = 312
    Top = 97
  end
  object IBTransaction_qry_photo: TIBCTransaction
    DefaultConnection = MainForm.IBCConnection1
    Left = 536
    Top = 105
  end
  object ibqry_qryyg_edit: TIBCQuery
    Connection = MainForm.IBCConnection1
    Transaction = IBTransaction1
    Left = 176
    Top = 97
  end
  object ibtbl_qry_photo: TIBCTable
    TableName = 'RYXX_PHOTO'
    Connection = MainForm.IBCConnection1
    Transaction = IBTransaction_qry_photo
    Left = 448
    Top = 89
  end
  object ibqry_ryxx_photo: TIBCQuery
    Connection = MainForm.IBCConnection1
    Transaction = IBTransaction_qry_photo
    Left = 464
    Top = 145
  end
end
