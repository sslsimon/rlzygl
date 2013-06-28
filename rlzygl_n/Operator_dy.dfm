object Frm_operator_dy: TFrm_operator_dy
  Left = 371
  Top = 225
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25805#20316#21592#23450#20041
  ClientHeight = 384
  ClientWidth = 623
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 623
    Height = 304
    Align = alClient
    BorderStyle = bsSingle
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 617
      Height = 298
      Align = alClient
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -19
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'OPERATOR_NO'
          Title.Caption = #25805#20316#21592#21495
          Width = 118
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OPERATOR_NAME'
          Title.Caption = #25805#20316#21592#22995#21517
          Width = 153
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 304
    Width = 623
    Height = 80
    Align = alBottom
    BorderStyle = bsSingle
    TabOrder = 1
    object Label11: TLabel
      Left = 368
      Top = 16
      Width = 45
      Height = 14
      Caption = #23494#30721#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 144
      Top = 16
      Width = 90
      Height = 14
      Caption = #25805#20316#21592#22995#21517#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 75
      Height = 14
      Caption = #25805#20316#21592#21495#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_operator_no: TLabel
      Left = 75
      Top = 14
      Width = 11
      Height = 19
      Caption = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_add: TButton
      Left = 91
      Top = 46
      Width = 75
      Height = 25
      Caption = #28155#21152
      TabOrder = 0
      OnClick = btn_addClick
    end
    object btn_edit: TButton
      Left = 179
      Top = 46
      Width = 75
      Height = 25
      Caption = #20462#25913
      TabOrder = 1
      OnClick = btn_editClick
    end
    object btn_save: TButton
      Left = 316
      Top = 46
      Width = 75
      Height = 25
      Caption = #20445#23384
      Enabled = False
      TabOrder = 2
      OnClick = btn_saveClick
    end
    object btn_cancle: TButton
      Left = 404
      Top = 46
      Width = 75
      Height = 25
      Caption = #21462#28040
      Enabled = False
      TabOrder = 3
      OnClick = btn_cancleClick
    end
    object edt_operator_name: TEdit
      Left = 229
      Top = 11
      Width = 130
      Height = 27
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object edt_operator_password: TEdit
      Left = 410
      Top = 11
      Width = 191
      Height = 27
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 5
    end
    object edt1: TEdit
      Left = 76
      Top = 11
      Width = 60
      Height = 27
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
  end
  object DataSource1: TDataSource
    DataSet = IBCTable1
    OnDataChange = DataSource1DataChange
    Left = 232
    Top = 96
  end
  object IBCQuery1: TIBCQuery
    Connection = MainForm.IBCConnection1
    Transaction = IBCTransaction1
    Left = 344
    Top = 32
  end
  object IBCTable1: TIBCTable
    TableName = 'OPERATOR_XX'
    Connection = MainForm.IBCConnection1
    Transaction = IBCTransaction1
    Filtered = True
    Filter = 'operator_no<>'#39'999'#39
    Left = 368
    Top = 88
  end
  object IBCTransaction1: TIBCTransaction
    DefaultConnection = MainForm.IBCConnection1
    Left = 416
    Top = 32
  end
end
