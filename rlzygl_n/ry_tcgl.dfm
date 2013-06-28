object frm_rytcgl: Tfrm_rytcgl
  Left = 150
  Top = 160
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #19994#32489#31649#29702
  ClientHeight = 649
  ClientWidth = 1089
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 600
    Width = 1089
    Height = 49
    Align = alBottom
    BorderStyle = bsSingle
    TabOrder = 0
    OnClick = Panel1Click
    object btn_edit: TButton
      Left = 360
      Top = 11
      Width = 75
      Height = 25
      Caption = #20462#25913
      TabOrder = 0
      OnClick = btn_editClick
    end
    object btn_del: TButton
      Left = 32
      Top = 11
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 1
      OnClick = btn_delClick
    end
    object btn_save: TButton
      Left = 664
      Top = 11
      Width = 75
      Height = 25
      Caption = #20445#23384
      Enabled = False
      TabOrder = 2
      OnClick = btn_saveClick
    end
    object btn_cancel: TButton
      Left = 760
      Top = 11
      Width = 75
      Height = 25
      Caption = #21462#28040
      Enabled = False
      TabOrder = 3
      OnClick = btn_cancelClick
    end
    object btn_sh: TButton
      Left = 448
      Top = 11
      Width = 75
      Height = 25
      Caption = #23457#26680
      Enabled = False
      TabOrder = 4
      OnClick = btn_shClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1089
    Height = 57
    Align = alTop
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label7: TLabel
      Left = 5
      Top = 8
      Width = 70
      Height = 14
      Caption = #25552#25104#24180#26376#65306
    end
    object Label8: TLabel
      Left = 177
      Top = 8
      Width = 42
      Height = 14
      Caption = #20844#21496#65306
    end
    object lbl_dw_no: TLabel
      Left = 181
      Top = 21
      Width = 6
      Height = 12
      Caption = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label9: TLabel
      Left = 369
      Top = 8
      Width = 42
      Height = 14
      Caption = #37096#38376#65306
    end
    object lbl_bm_no: TLabel
      Left = 426
      Top = 24
      Width = 6
      Height = 12
      Caption = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 593
      Top = 8
      Width = 70
      Height = 14
      Caption = #19979#23646#37096#38376#65306
    end
    object lbl_xsbm_no: TLabel
      Left = 593
      Top = 21
      Width = 6
      Height = 12
      Caption = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label11: TLabel
      Left = 5
      Top = 32
      Width = 56
      Height = 14
      Caption = #21046#34920#20154#65306
    end
    object lbl_xgr: TLabel
      Left = 61
      Top = 32
      Width = 21
      Height = 14
      Caption = '801'
    end
    object Label12: TLabel
      Left = 120
      Top = 32
      Width = 70
      Height = 14
      Caption = #21046#34920#26085#26399#65306
    end
    object lbl_xgrq: TLabel
      Left = 183
      Top = 32
      Width = 133
      Height = 14
      Caption = '2011-09-12 14:00:00'
    end
    object Label14: TLabel
      Left = 464
      Top = 32
      Width = 70
      Height = 14
      Caption = #23457#26680#26085#26399#65306
    end
    object lbl_shrq: TLabel
      Left = 533
      Top = 32
      Width = 133
      Height = 14
      Caption = '2011-09-12 14:00:00'
    end
    object Label13: TLabel
      Left = 344
      Top = 32
      Width = 56
      Height = 14
      Caption = #23457#26680#20154#65306
    end
    object lbl_shr: TLabel
      Left = 403
      Top = 32
      Width = 21
      Height = 14
      Caption = '801'
    end
    object Label1: TLabel
      Left = 672
      Top = 32
      Width = 42
      Height = 14
      Caption = #29366#24577#65306
    end
    object lbl_gzd_zt: TLabel
      Left = 712
      Top = 32
      Width = 45
      Height = 14
      Caption = #26410#23457#26680
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 72
      Top = 4
      Width = 81
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      ItemIndex = 0
      TabOrder = 0
      Text = '201101'
      OnSelect = ComboBox1Select
      Items.Strings = (
        '201101'
        '201102'
        '201103'
        '201104'
        '201105'
        '201106'
        '201107'
        '201108'
        '201109'
        '201110'
        '201111'
        '201112')
    end
    object cbb_dw: TComboBox
      Left = 225
      Top = 4
      Width = 120
      Height = 22
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
      ItemHeight = 14
      TabOrder = 1
      OnSelect = cbb_dwSelect
    end
    object cbb_bm: TComboBox
      Left = 409
      Top = 4
      Width = 160
      Height = 22
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
      ItemHeight = 14
      TabOrder = 2
      OnSelect = cbb_bmSelect
    end
    object cbb_xsbm: TComboBox
      Left = 664
      Top = 4
      Width = 145
      Height = 22
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
      ItemHeight = 14
      TabOrder = 3
      OnSelect = cbb_xsbmSelect
    end
    object btn1: TButton
      Left = 984
      Top = 12
      Width = 75
      Height = 25
      Caption = #27719#24635#25171#21360
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btn1Click
    end
    object btn_print: TButton
      Left = 904
      Top = 12
      Width = 75
      Height = 25
      Caption = #25171#21360#20840#37096
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btn_printClick
    end
    object Button1: TButton
      Left = 824
      Top = 12
      Width = 75
      Height = 25
      Caption = #25353#37096#38376#25171#21360
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = Button1Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 57
    Width = 1089
    Height = 502
    Align = alClient
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Caption = 'Panel3'
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 2
      Width = 1081
      Height = 494
      Align = alClient
      DataSource = IBCDataSource1
      ShowSerialNo = True
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      FooterRowCount = 1
      ParentFont = False
      ReadOnly = True
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Color = clMenuBar
          EditButtons = <>
          FieldName = 'GZD_MONTH'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Footer.Font.Charset = ANSI_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -12
          Footer.Font.Name = 'Tahoma'
          Footer.Font.Style = []
          Footer.Value = #20154#21592#35745#25968
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #24037#36164#24180#26376
          Width = 58
        end
        item
          Color = clMenuBar
          EditButtons = <>
          FieldName = 'RY_NO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Footer.Alignment = taCenter
          Footer.FieldName = 'RY_NO'
          Footer.Font.Charset = ANSI_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -12
          Footer.Font.Name = 'Tahoma'
          Footer.Font.Style = []
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #20154#21592#32534#21495
          Width = 50
        end
        item
          Color = clMenuBar
          EditButtons = <>
          FieldName = 'RY_NAME'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Footer.Font.Charset = ANSI_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -12
          Footer.Font.Name = 'Tahoma'
          Footer.Font.Style = []
          Footer.Value = #21512#35745
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #22995#21517
          Width = 49
        end
        item
          EditButtons = <>
          FieldName = 'GWGZ'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Footer.FieldName = 'GWGZ'
          Footer.Font.Charset = ANSI_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -12
          Footer.Font.Name = 'Tahoma'
          Footer.Font.Style = []
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taRightJustify
          Title.Caption = #19994#32489
          Width = 82
        end>
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 559
    Width = 1089
    Height = 41
    Align = alBottom
    BorderStyle = bsSingle
    TabOrder = 3
    object lbl_name: TLabel
      Left = 196
      Top = 12
      Width = 14
      Height = 14
      Caption = '12'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl_glgz: TLabel
      Left = 216
      Top = 12
      Width = 42
      Height = 14
      Caption = '123456'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Button2: TButton
      Left = 256
      Top = 7
      Width = 75
      Height = 25
      Caption = #22686#21152#20154#21592
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button2Click
    end
    object edt_ryno: TEdit
      Left = 70
      Top = 9
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 1
      OnExit = edt_rynoExit
      OnKeyPress = edt_rynoKeyPress
    end
    object btn_ryno: TButton
      Left = 3
      Top = 8
      Width = 66
      Height = 23
      Caption = #20154#21592#32534#21495#65306
      TabOrder = 2
      OnClick = btn_rynoClick
    end
  end
  object IBCDataSource1: TIBCDataSource
    DataSet = IBCTable1
    Left = 344
    Top = 145
  end
  object IBCTable1: TIBCTable
    TableName = 'GZD_ITEM'
    Connection = MainForm.IBCConnection1
    Transaction = IBCTransaction1
    AutoCommit = False
    RefreshOptions = [roAfterInsert, roAfterUpdate, roBeforeEdit]
    IndexFieldNames = 'RY_NO'
    AfterOpen = IBCTable1AfterOpen
    Left = 264
    Top = 153
    object IBCTable1GZD_MONTH: TStringField
      DisplayWidth = 16
      FieldName = 'GZD_MONTH'
      ReadOnly = True
      Required = True
      Size = 6
    end
    object IBCTable1BM_NO: TStringField
      DisplayWidth = 12
      FieldName = 'BM_NO'
      Required = True
    end
    object IBCTable1RY_NO: TIntegerField
      DisplayWidth = 12
      FieldName = 'RY_NO'
      ReadOnly = True
      Required = True
    end
    object IBCTable1GWGZ: TFloatField
      DisplayWidth = 10
      FieldName = 'GWGZ'
      DisplayFormat = '0.00'
    end
    object IBCTable1CQQK: TStringField
      DisplayWidth = 12
      FieldName = 'CQQK'
    end
    object IBCTable1QQ: TFloatField
      DisplayWidth = 15
      FieldName = 'QQ'
      DisplayFormat = '0.00'
    end
    object IBCTable1GLGZ: TFloatField
      DisplayWidth = 15
      FieldName = 'GLGZ'
      DisplayFormat = '0.00'
    end
    object IBCTable1QQQK: TFloatField
      DisplayWidth = 15
      FieldName = 'QQQK'
      DisplayFormat = '-0.00'
    end
    object IBCTable1DHBZ: TFloatField
      DisplayWidth = 15
      FieldName = 'DHBZ'
      DisplayFormat = '0.00'
    end
    object IBCTable1BF: TFloatField
      DisplayWidth = 15
      FieldName = 'BF'
      DisplayFormat = '0.00'
    end
    object IBCTable1DK: TFloatField
      DisplayWidth = 15
      FieldName = 'DK'
      DisplayFormat = '-0.00'
    end
    object IBCTable1SBDK: TFloatField
      DisplayWidth = 15
      FieldName = 'SBDK'
      DisplayFormat = '-0.00'
    end
    object IBCTable1YFJE: TFloatField
      DisplayWidth = 15
      FieldName = 'YFJE'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object IBCTable1SFJE: TFloatField
      DisplayWidth = 15
      FieldName = 'SFJE'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object IBCTable1BZ: TStringField
      DisplayWidth = 288
      FieldName = 'BZ'
      Size = 200
    end
    object IBCTable1ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object IBCTable1RY_NAME: TStringField
      FieldName = 'RY_NAME'
      ReadOnly = True
    end
  end
  object IBCTransaction1: TIBCTransaction
    DefaultConnection = MainForm.IBCConnection1
    Left = 264
    Top = 209
  end
  object Ibcqry_bmxx: TIBCQuery
    Connection = MainForm.IBCConnection1
    Transaction = MainForm.IBTransaction1
    Left = 480
    Top = 121
  end
  object ibcqry_gzd: TIBCQuery
    Connection = MainForm.IBCConnection1
    Transaction = MainForm.IBTransaction1
    Left = 176
    Top = 113
  end
  object frxrprt_BM_HJ: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbPageSetup]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    ReportOptions.CreateDate = 40799.440435474500000000
    ReportOptions.LastChange = 40804.397629838000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 968
    Top = 129
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 52.913402910000000000
        Top = 207.874150000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo2: TfrxMemoView
          Left = 30.236240000000000000
          Top = 26.456709999999990000
          Width = 60.472440940000000000
          Height = 26.456692910000000000
          DataField = 'RY_NO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."RY_NO"]')
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 90.708720000000000000
          Top = 26.456709999999990000
          Width = 60.472440940000000000
          Height = 26.456692910000000000
          DataField = 'RY_NAME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."RY_NAME"]')
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 151.181200000000000000
          Top = 26.456709999999990000
          Width = 71.811030940000000000
          Height = 26.456692910000000000
          DataField = 'CQQK'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."CQQK"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 222.992270000000000000
          Top = 26.456709999999990000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          DataField = 'GWGZ'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."GWGZ"]')
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 291.023810000000000000
          Top = 26.456709999999990000
          Width = 60.472440940000000000
          Height = 26.456692910000000000
          DataField = 'QQ'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."QQ"]')
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 351.496290000000000000
          Top = 26.456709999999990000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          DataField = 'GLGZ'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."GLGZ"]')
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 415.748300000000000000
          Top = 26.456709999999990000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          DataField = 'QQQK'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '-%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."QQQK"]')
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 480.000310000000000000
          Top = 26.456709999999990000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          DataField = 'DHBZ'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."DHBZ"]')
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 544.252320000000000000
          Top = 26.456709999999990000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          DataField = 'BF'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."BF"]')
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 608.504330000000000000
          Top = 26.456709999999990000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          DataField = 'YFJE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."YFJE"]')
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 676.535870000000000000
          Top = 26.456709999999990000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          DataField = 'DK'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '-%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."DK"]')
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 740.787880000000000000
          Top = 26.456709999999990000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          DataField = 'SBDK'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '-%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."SBDK"]')
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 805.039890000000000000
          Top = 26.456709999999990000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          DataField = 'SFJE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."SFJE"]')
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 873.071430000000000000
          Top = 26.456709999999990000
          Width = 86.929141180000000000
          Height = 26.456692910000000000
          DataField = 'BZ'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."BZ"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 960.000620000000000000
          Top = 26.456709999999990000
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Top = 26.456709999999990000
          Width = 30.236220470000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[Line]')
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 90.708720000000000000
          Width = 60.472440940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #22995#21517)
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 151.181200000000000000
          Width = 71.811030940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #20986#21220#24773#20917)
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 222.992270000000000000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #22522#26412)
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 291.023810000000000000
          Width = 60.472440940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #20840#21220)
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 351.496290000000000000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #24037#40836)
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 415.748300000000000000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #32570#21220)
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 480.000310000000000000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #30005#35805#34917#21161)
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 544.252320000000000000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #34917#21457)
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 608.504330000000000000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #24212#21457#39069)
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 676.535870000000000000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #20195#25187)
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 740.787880000000000000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #31038#20445#20195#25187)
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 805.039890000000000000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #23454#21457#39069)
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 873.071430000000000000
          Width = 86.929141180000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #22791#27880)
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 960.000620000000000000
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #31614#25910#20154)
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 30.236240000000000000
          Width = 60.472440940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #20154#21592#32534#21495)
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Width = 30.236220470000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #24207#21495)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 79.370130000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 445.984540000000000000
          Top = 3.779530000000001000
          Width = 139.842610000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #38451#20809#38632#24037#36164#26465)
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 332.598640000000000000
          Top = 30.236240000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #29366#24577#65306)
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 385.512060000000000000
          Top = 30.236240000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 737.008350000000000000
          Top = 34.015770000000010000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #25171#21360#26085#26399#65306'[<Date>][<Time>]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 22.677180000000000000
          Top = 30.236240000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #24180#26376#65306)
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 68.031540000000000000
          Top = 30.236240000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 26.456692910000000000
        Top = 370.393940000000000000
        Width = 1046.929810000000000000
        object Memo45: TfrxMemoView
          Left = 22.677180000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          Memo.Strings = (
            #21046#34920#20154#65306)
        end
        object Memo46: TfrxMemoView
          Left = 287.244280000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          Memo.Strings = (
            #24635#32463#29702#65306)
        end
        object Memo47: TfrxMemoView
          Left = 551.811380000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          Memo.Strings = (
            #36130#21153#65306)
        end
        object Memo48: TfrxMemoView
          Left = 86.929190000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
        end
        object Memo49: TfrxMemoView
          Left = 616.063390000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
        end
        object Memo55: TfrxMemoView
          Left = 801.260360000000000000
          Top = 7.559059999999988000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #31532'[Page#]'#39029#65292#20849'[TotalPages#]'#39029)
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 26.456710000000000000
        Top = 158.740260000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBDataset1."BM_NO"'
        KeepTogether = True
        ReprintOnNewPage = True
        object Memo56: TfrxMemoView
          Top = 3.779529999999994000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDBDataset1."BMMC"]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 26.456692910000000000
        Top = 283.464750000000000000
        Width = 1046.929810000000000000
        object Memo15: TfrxMemoView
          Left = 222.992270000000000000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."GWGZ">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 291.023810000000000000
          Width = 60.472440940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."QQ">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 351.496290000000000000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."GLGZ">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 415.748300000000000000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '-%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."QQQK">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 480.000310000000000000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."DHBZ">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 544.252320000000000000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."BF">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 608.504330000000000000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."YFJE">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 676.535870000000000000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '-%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."DK">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 740.787880000000000000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '-%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."SBDK">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 805.039890000000000000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."SFJE">,MasterData1)]')
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Width = 222.992230940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #23567#35745)
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 873.071430000000000000
          Width = 86.929141180000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 960.000620000000000000
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = IBCQuery1
    Left = 1008
    Top = 129
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#0
    Subject = 'FastReport?PDF export'
    Background = False
    Creator = 'FastReport?(http://www.fast-report.com)'
    HTMLTags = True
    Left = 448
    Top = 265
  end
  object IBCQuery1: TIBCQuery
    Connection = MainForm.IBCConnection1
    Transaction = MainForm.IBTransaction1
    SQL.Strings = (
      'select * from'
      'GZD_ITEM_VIEW where GZD_month=201108 order by bm_no,ry_no')
    Active = True
    Left = 840
    Top = 121
  end
  object frxrprt_HJ: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbPageSetup]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    ReportOptions.CreateDate = 40799.883810219900000000
    ReportOptions.LastChange = 40808.920821759300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 968
    Top = 169
    Datasets = <
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 3
      ColumnWidth = 63.300000000000000000
      ColumnPositions.Strings = (
        '0'
        '63.30'
        '126.70')
      object MasterData1: TfrxMasterData
        Height = 26.456692910000000000
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object Memo2: TfrxMemoView
          Width = 120.944881890000000000
          Height = 26.456692910000000000
          DataField = 'BMMC'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset2."BMMC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 120.944960000000000000
          Width = 94.488188980000000000
          Height = 26.456692910000000000
          DataField = 'SFJE'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset2."SFJE"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 26.456710000000000000
        Top = 136.063080000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset2."BMMC1"'
        KeepTogether = True
        ReprintOnNewPage = True
        object Memo1: TfrxMemoView
          Top = 7.559059999999988000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDBDataset2."BMMC1"]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 26.456692910000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Width = 120.944881890000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #23567#35745#65306)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 120.944972200000000000
          Width = 94.488188980000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset2."SFJE">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ColumnFooter1: TfrxColumnFooter
        Height = 26.456692910000000000
        Top = 321.260050000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          Left = 120.944960000000000000
          Width = 94.488188980000000000
          Height = 26.456692910000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset2."SFJE">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Width = 120.944881889764000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #24635#35745#65306)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 109.606370000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'GZD_MONTH'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            '[frxDBDataset2."GZD_MONTH"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 45.354360000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #24037#36164#24180#26376#65306)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 222.992270000000000000
          Width = 158.740260000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #38451#20809#38632#24037#36164#24635#34920)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 15.118120000000000000
          Top = 37.795300000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #29366#24577#65306)
        end
        object Memo18: TfrxMemoView
          Left = 60.472480000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 26.456692910000000000
        Top = 370.393940000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Left = 483.779840000000000000
          Top = 7.559059999999988000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #31532'[Page#]'#39029#65292#20849'[TotalPages#]'#39029)
        end
        object Memo12: TfrxMemoView
          Left = 3.779530000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          Memo.Strings = (
            #21046#34920#20154#65306)
        end
        object Memo13: TfrxMemoView
          Left = 287.244280000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          Memo.Strings = (
            #24635#32463#29702#65306)
        end
        object Memo14: TfrxMemoView
          Left = 143.622140000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          Memo.Strings = (
            #36130#21153#65306)
        end
        object Memo15: TfrxMemoView
          Left = 56.692950000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
        end
        object Memo16: TfrxMemoView
          Left = 181.417440000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
        end
      end
    end
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = IBCQuery1
    Left = 1008
    Top = 169
  end
  object IBCDataSource2: TIBCDataSource
    DataSet = IBCQuery1
    Left = 664
    Top = 177
  end
  object frxrprt_BM: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbPageSetup]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    ReportOptions.CreateDate = 40799.440435474500000000
    ReportOptions.LastChange = 40804.979206446760000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 968
    Top = 97
    Datasets = <
      item
        DataSet = frxDBDataset3
        DataSetName = 'frxDBDataset3'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Top = 173.858380000000000000
        Width = 1046.929810000000000000
        RowCount = 1
      end
      object DetailData1: TfrxDetailData
        Height = 26.456692910000000000
        Top = 196.535560000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset3
        DataSetName = 'frxDBDataset3'
        RowCount = 0
        object Memo2: TfrxMemoView
          Left = 30.236240000000000000
          Width = 56.692910940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset3."RY_NO"]')
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 86.929190000000000000
          Width = 60.472440940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset3."RY_NAME"]')
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 147.401670000000000000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset3."CQQK"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 215.433210000000000000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset3."GWGZ"]')
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 283.464750000000000000
          Width = 60.472440940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset3."QQ"]')
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 343.937230000000000000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset3."GLGZ"]')
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 411.968770000000000000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '-%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset3."QQQK"]')
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 476.220780000000000000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset3."DHBZ"]')
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 540.472790000000000000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset3."BF"]')
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 604.724800000000000000
          Width = 71.811030940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset3."YFJE"]')
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 676.535870000000000000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '-%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset3."DK"]')
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 744.567410000000000000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '-%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset3."SBDK"]')
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 812.598950000000000000
          Width = 71.811030940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset3."SFJE"]')
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 884.410020000000000000
          Width = 75.590551180000000000
          Height = 26.456692910000000000
          DataField = 'BZ'
          DataSet = frxDBDataset3
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset3."BZ"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 960.000620000000000000
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Width = 30.236220470000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[Line]')
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo3: TfrxMemoView
          Left = 86.929190000000000000
          Top = 68.031540000000010000
          Width = 60.472440940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #22995#21517)
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 147.401670000000000000
          Top = 68.031540000000010000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #20986#21220#24773#20917)
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 215.433210000000000000
          Top = 68.031540000000010000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #22522#26412)
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 283.464750000000000000
          Top = 68.031540000000010000
          Width = 60.472440940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #20840#21220)
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 343.937230000000000000
          Top = 68.031540000000010000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #24037#40836)
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 411.968770000000000000
          Top = 68.031540000000010000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #32570#21220)
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 476.220780000000000000
          Top = 68.031540000000010000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #30005#35805#34917#21161)
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 540.472790000000000000
          Top = 68.031540000000010000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #34917#21457)
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 604.724800000000000000
          Top = 68.031540000000010000
          Width = 71.811030940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #24212#21457#39069)
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 676.535870000000000000
          Top = 68.031540000000010000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #20195#25187)
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 744.567410000000000000
          Top = 68.031540000000010000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #31038#20445#20195#25187)
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 812.598950000000000000
          Top = 68.031540000000010000
          Width = 71.811030940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #23454#21457#39069)
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 884.410020000000000000
          Top = 68.031540000000010000
          Width = 75.590551180000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #22791#27880)
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 960.000620000000000000
          Top = 68.031540000000010000
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #31614#25910#20154)
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 30.236240000000000000
          Top = 68.031540000000010000
          Width = 56.692910940000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #20154#21592#32534#21495)
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Top = 68.031540000000010000
          Width = 30.236220470000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #24207#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 445.984540000000000000
          Top = 3.779530000000001000
          Width = 139.842610000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #38451#20809#38632#24037#36164#26465)
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 136.063080000000000000
          Top = 30.236240000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #37096#38376#65306)
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 188.976500000000000000
          Top = 30.236239999999990000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 381.732530000000000000
          Top = 30.236239999999990000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #29366#24577#65306)
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 434.645950000000000000
          Top = 30.236239999999990000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 737.008350000000000000
          Top = 34.015770000000010000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #25171#21360#26085#26399#65306'[<Date>][<Time>]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 22.677180000000000000
          Top = 30.236240000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #24180#26376#65306)
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 68.031540000000000000
          Top = 30.236240000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 26.456692910000000000
        Top = 283.464750000000000000
        Width = 1046.929810000000000000
        object Memo15: TfrxMemoView
          Left = 215.433210000000000000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset3."GWGZ">,DetailData1)]')
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 283.464750000000000000
          Width = 60.472440940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset3."QQ">,DetailData1)]')
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 343.937230000000000000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset3."GLGZ">,DetailData1)]')
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 411.968770000000000000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '-%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset3."QQQK">,DetailData1)]')
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 476.220780000000000000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset3."DHBZ">,DetailData1)]')
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 540.472790000000000000
          Width = 64.251970940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset3."BF">,DetailData1)]')
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 604.724800000000000000
          Width = 71.811030940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset3."YFJE">,DetailData1)]')
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 676.535870000000000000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '-%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset3."DK">,DetailData1)]')
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 744.567410000000000000
          Width = 68.031500940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '-%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset3."SBDK">,DetailData1)]')
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 812.598950000000000000
          Width = 71.811030940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset3."SFJE">,DetailData1)]')
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Width = 215.433170940000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #21512#35745)
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 884.410020000000000000
          Width = 75.590551180000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 960.000620000000000000
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 26.456692910000000000
        Top = 332.598640000000000000
        Width = 1046.929810000000000000
        object Memo45: TfrxMemoView
          Left = 34.015770000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          Memo.Strings = (
            #21046#34920#20154#65306)
        end
        object Memo46: TfrxMemoView
          Left = 298.582870000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          Memo.Strings = (
            #24635#32463#29702#65306)
        end
        object Memo47: TfrxMemoView
          Left = 563.149970000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          Memo.Strings = (
            #36130#21153#65306)
        end
        object Memo55: TfrxMemoView
          Left = 98.267780000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
        end
        object Memo56: TfrxMemoView
          Left = 627.401980000000000000
          Top = 7.559060000000045000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
        end
        object Memo57: TfrxMemoView
          Left = 789.921770000000000000
          Top = 7.559060000000045000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #31532'[Page#]'#39029#65292#20849'[TotalPages#]'#39029)
        end
      end
    end
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'frxDBDataset3'
    CloseDataSource = False
    DataSet = IBCTable1
    Left = 1016
    Top = 97
  end
end
