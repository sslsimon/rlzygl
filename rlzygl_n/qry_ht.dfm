object frm_qry_htgl: Tfrm_qry_htgl
  Left = 106
  Top = 200
  BorderStyle = bsSingle
  Caption = #21512#21516#26597#35810
  ClientHeight = 622
  ClientWidth = 1268
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1268
    Height = 108
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Shape1: TShape
      Left = 610
      Top = 59
      Width = 18
      Height = 4
      Brush.Color = clBlack
    end
    object Button1: TButton
      Left = 229
      Top = 77
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 3
      OnClick = Button1Click
    end
    object edt_ht_code: TEdit
      Left = 118
      Top = 75
      Width = 90
      Height = 20
      TabOrder = 0
    end
    object edt_ht_name: TEdit
      Left = 104
      Top = 28
      Width = 273
      Height = 20
      TabOrder = 2
    end
    object edt_ppmc: TEdit
      Left = 104
      Top = 5
      Width = 241
      Height = 20
      TabOrder = 1
    end
    object edt_ht_zydz: TEdit
      Left = 104
      Top = 49
      Width = 297
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object dtp_ht_sxrq: TRzDateTimeEdit
      Left = 509
      Top = 50
      Width = 98
      Height = 20
      EditType = etDate
      TabOrder = 5
    end
    object dtp_ht_jsrq: TRzDateTimeEdit
      Left = 632
      Top = 50
      Width = 98
      Height = 20
      EditType = etDate
      TabOrder = 6
    end
    object chk_ppmc: TCheckBox
      Left = 27
      Top = 8
      Width = 76
      Height = 17
      Caption = #21697#29260#21517#31216#65306
      TabOrder = 7
      OnClick = chk_ppmcClick
    end
    object chk_ht_name: TCheckBox
      Left = 27
      Top = 30
      Width = 77
      Height = 17
      Caption = #21512#21516#21517#31216#65306
      TabOrder = 8
      OnClick = chk_ht_nameClick
    end
    object chk_htzydz: TCheckBox
      Left = 4
      Top = 52
      Width = 98
      Height = 17
      Caption = #21512#21516#23653#34892#22320#22336':'
      TabOrder = 9
      OnClick = chk_htzydzClick
    end
    object chk_ht_code: TCheckBox
      Left = 5
      Top = 79
      Width = 113
      Height = 17
      Caption = #21512#21516#12289#21327#35758#32534#21495#65306
      TabOrder = 10
      OnClick = chk_ht_codeClick
    end
    object chk_ht_qx: TCheckBox
      Left = 433
      Top = 52
      Width = 76
      Height = 17
      Caption = #21512#21516#26399#38480#65306
      TabOrder = 11
      OnClick = chk_ht_qxClick
    end
    object btn1: TButton
      Left = 368
      Top = 77
      Width = 83
      Height = 25
      Caption = #28165#31354#26597#35810#26465#20214
      TabOrder = 12
      OnClick = btn1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 108
    Width = 1268
    Height = 514
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 1266
      Height = 512
      Align = alClient
      DataSource = DataSource1
      ShowSerialNo = True
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind]
      PopupMenu = PopupMenu1
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = DBGridEh1DblClick
      OnTitleClick = DBGridEh1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'HT_ID'
          Footer.Value = #35760#24405#25968
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.Caption = #20869#37096#20195#30721
          Title.TitleButton = True
          Width = 56
        end
        item
          EditButtons = <>
          FieldName = 'HT_CODE'
          Footer.FieldName = 'HT_CODE'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #21512#21516#32534#21495
          Title.TitleButton = True
          Width = 84
        end
        item
          EditButtons = <>
          FieldName = 'QYJF'
          Footers = <>
          Title.Caption = #31614#32422#30002#26041
          Title.TitleButton = True
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'HT_NAME'
          Footers = <>
          Title.Caption = #21512#21516#21517#31216
          Title.TitleButton = True
          Width = 160
        end
        item
          EditButtons = <>
          FieldName = 'PPMC'
          Footers = <>
          Title.Caption = #21697#29260#21517#31216
          Title.TitleButton = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'HTZYDZ'
          Footers = <>
          Title.Caption = #31199#29992#22320#22336
          Title.TitleButton = True
          Width = 200
        end
        item
          EditButtons = <>
          FieldName = 'HT_SXRQ'
          Footers = <>
          Title.Caption = #29983#25928#26085#26399
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'HT_JSRQ'
          Footers = <>
          Title.Caption = #32467#26463#26085#26399
          Title.TitleButton = True
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'HTKD'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #25187#28857'%'
          Width = 40
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'HTBD'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #20445#24213
          Title.TitleButton = True
          Width = 50
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'HTFC'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #20998#25104
          Title.TitleButton = True
          Width = 50
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'HTLB'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21512#21516#31867#21035
          Title.TitleButton = True
          Width = 88
        end
        item
          EditButtons = <>
          FieldName = 'HTXZ'
          Footers = <>
          Title.Caption = #21512#21516#24615#36136
          Title.TitleButton = True
          Width = 53
        end
        item
          EditButtons = <>
          FieldName = 'HT_CFDD'
          Footers = <>
          Title.Caption = #23384#25918#22320#28857
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'HT_QSRQ'
          Footers = <>
          Title.Caption = #31614#32626#26085#26399
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'HT_JBR'
          Footers = <>
          Title.Caption = #32463#21150#20154
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'QYYF'
          Footers = <>
          Title.Caption = #31614#32422#20057#26041
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'HT_HZTZ'
          Footers = <>
          Title.Caption = #21512#20316#26465#20214
          Title.TitleButton = True
        end>
    end
  end
  object IBCTransaction1: TIBCTransaction
    DefaultConnection = MainForm.IBCConnection1
    Left = 880
    Top = 17
  end
  object IBCQuery1: TIBCQuery
    Transaction = IBCTransaction1
    SQL.Strings = (
      'select * from htgl')
    Left = 848
    Top = 17
    object IBCQuery1HT_ID: TIntegerField
      FieldName = 'HT_ID'
      Required = True
    end
    object IBCQuery1HT_CODE: TStringField
      FieldName = 'HT_CODE'
      Size = 50
    end
    object IBCQuery1PPMC: TStringField
      FieldName = 'PPMC'
      Size = 50
    end
    object IBCQuery1HT_NAME: TStringField
      FieldName = 'HT_NAME'
      Size = 100
    end
    object IBCQuery1HTLB: TStringField
      FieldName = 'HTLB'
    end
    object IBCQuery1HTXZ: TStringField
      FieldName = 'HTXZ'
    end
    object IBCQuery1QYJF: TStringField
      FieldName = 'QYJF'
      Size = 60
    end
    object IBCQuery1QYYF: TStringField
      FieldName = 'QYYF'
      Size = 60
    end
    object IBCQuery1HT_QSRQ: TDateField
      FieldName = 'HT_QSRQ'
    end
    object IBCQuery1HT_SXRQ: TDateField
      FieldName = 'HT_SXRQ'
    end
    object IBCQuery1HT_JSRQ: TDateField
      FieldName = 'HT_JSRQ'
    end
    object IBCQuery1HTZYDZ: TStringField
      FieldName = 'HTZYDZ'
      Size = 100
    end
    object IBCQuery1HT_HZTZ: TStringField
      FieldName = 'HT_HZTZ'
      Size = 200
    end
    object IBCQuery1HT_JBR: TStringField
      FieldName = 'HT_JBR'
      Size = 10
    end
    object IBCQuery1HT_CFDD: TStringField
      FieldName = 'HT_CFDD'
      Size = 50
    end
    object IBCQuery1HTKD: TStringField
      FieldName = 'HTKD'
      Size = 12
    end
    object IBCQuery1HTBD: TStringField
      FieldName = 'HTBD'
      Size = 12
    end
    object IBCQuery1HTFC: TStringField
      FieldName = 'HTFC'
      Size = 12
    end
  end
  object DataSource1: TDataSource
    DataSet = IBCQuery1
    Left = 816
    Top = 17
  end
  object PopupMenu1: TPopupMenu
    Left = 456
    Top = 196
    object N1: TMenuItem
      Caption = #23548#20986#26597#35810#32467#26524
      OnClick = N1Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.xls'
    Filter = 'Microsoft Office Excel'#24037#20316#31807'(*.xls)|*.xls'
    Left = 416
    Top = 196
  end
end
