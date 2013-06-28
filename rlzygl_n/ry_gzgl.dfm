object frm_rygzgl: Tfrm_rygzgl
  Left = 162
  Top = 143
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24037#36164#31649#29702
  ClientHeight = 649
  ClientWidth = 975
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
    Width = 975
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
    Width = 975
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
      Top = 9
      Width = 70
      Height = 14
      Caption = #24037#36164#24180#26376#65306
    end
    object Label8: TLabel
      Left = 273
      Top = 8
      Width = 60
      Height = 14
      Caption = #37096#38376#21517#31216
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
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
      Width = 90
      Height = 25
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Consolas'
      Font.Style = []
      ItemHeight = 17
      ItemIndex = 0
      ParentFont = False
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
    object btn1: TButton
      Left = 816
      Top = 29
      Width = 65
      Height = 21
      Caption = #27719#24635#25171#21360
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btn1Click
    end
    object btn_print: TButton
      Left = 816
      Top = 5
      Width = 65
      Height = 21
      Caption = #25171#21360#20840#37096
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btn_printClick
    end
    object Button1: TButton
      Left = 896
      Top = 5
      Width = 65
      Height = 21
      Caption = #25353#37096#38376#25171#21360
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 896
      Top = 29
      Width = 65
      Height = 21
      Caption = #25171#21360#24037#36164#26465
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Button3Click
    end
    object chk_prit_SHBJ: TCheckBox
      Left = 672
      Top = 9
      Width = 97
      Height = 15
      Caption = #25171#21360#23457#26680#29366#24577
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object Button4: TButton
      Left = 172
      Top = 3
      Width = 89
      Height = 25
      Caption = #25353#37096#38376#36807#28388
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = Button4Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 57
    Width = 975
    Height = 502
    Align = alClient
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Caption = 'Panel3'
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 2
      Width = 967
      Height = 494
      Align = alClient
      DataSource = IBCDataSource1
      ShowSerialNo = True
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
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
          Width = 46
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
          Width = 40
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
          Title.Caption = #23703#20301#24037#36164
          Width = 72
        end
        item
          EditButtons = <>
          FieldName = 'CQQK'
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
          Footers = <>
          PickList.Strings = (
            #20840#21220
            #36831#21040
            #26089#36864
            #26103#24037
            #20107#20551
            #30149#20551
            #22823#20363#20250#20551)
          Title.Alignment = taRightJustify
          Title.Caption = #20986#21220#24773#20917#35828#26126
          Width = 79
        end
        item
          EditButtons = <>
          FieldName = 'QQ'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Footer.FieldName = 'QQ'
          Footer.Font.Charset = ANSI_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -12
          Footer.Font.Name = 'Tahoma'
          Footer.Font.Style = []
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taRightJustify
          Title.Caption = #20840#21220#22870
          Width = 98
        end
        item
          EditButtons = <>
          FieldName = 'GLGZ'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Footer.FieldName = 'GLGZ'
          Footer.Font.Charset = ANSI_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -12
          Footer.Font.Name = 'Tahoma'
          Footer.Font.Style = []
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taRightJustify
          Title.Caption = #24037#40836#24037#36164
          Width = 88
        end
        item
          EditButtons = <>
          FieldName = 'QQQK'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Footer.FieldName = 'QQQK'
          Footer.Font.Charset = ANSI_CHARSET
          Footer.Font.Color = clRed
          Footer.Font.Height = -12
          Footer.Font.Name = 'Tahoma'
          Footer.Font.Style = []
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taRightJustify
          Title.Caption = #32570#21220#24212#25187
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'DHBZ'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Footer.FieldName = 'DHBZ'
          Footer.Font.Charset = ANSI_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -12
          Footer.Font.Name = 'Tahoma'
          Footer.Font.Style = []
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taRightJustify
          Title.Caption = #30005#35805#34917#21161
          Width = 67
        end
        item
          EditButtons = <>
          FieldName = 'BF'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Footer.FieldName = 'BF'
          Footer.Font.Charset = ANSI_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -12
          Footer.Font.Name = 'Tahoma'
          Footer.Font.Style = []
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taRightJustify
          Title.Caption = #20854#23427#34917#21457
          Width = 65
        end
        item
          Color = clMenuBar
          EditButtons = <>
          FieldName = 'YFJE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Footer.FieldName = 'YFJE'
          Footer.Font.Charset = ANSI_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -12
          Footer.Font.Name = 'Tahoma'
          Footer.Font.Style = []
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taRightJustify
          Title.Caption = #24212#21457#37329#39069
        end
        item
          EditButtons = <>
          FieldName = 'DK'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Footer.FieldName = 'DK'
          Footer.Font.Charset = ANSI_CHARSET
          Footer.Font.Color = clRed
          Footer.Font.Height = -12
          Footer.Font.Name = 'Tahoma'
          Footer.Font.Style = []
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taRightJustify
          Title.Caption = #20854#23427#20195#25187
          Width = 84
        end
        item
          EditButtons = <>
          FieldName = 'SBDK'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Footer.FieldName = 'SBDK'
          Footer.Font.Charset = ANSI_CHARSET
          Footer.Font.Color = clRed
          Footer.Font.Height = -12
          Footer.Font.Name = 'Tahoma'
          Footer.Font.Style = []
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taRightJustify
          Title.Caption = #31038#20445#20195#25187
          Width = 76
        end
        item
          Color = clMenuBar
          EditButtons = <>
          FieldName = 'SFJE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Footer.FieldName = 'SFJE'
          Footer.Font.Charset = ANSI_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -12
          Footer.Font.Name = 'Tahoma'
          Footer.Font.Style = []
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taRightJustify
          Title.Caption = #23454#21457#37329#39069
          Width = 98
        end
        item
          EditButtons = <>
          FieldName = 'BZ'
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
          Footers = <>
          Title.Caption = #22791#27880
          Width = 525
        end>
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 559
    Width = 975
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
      Left = 281
      Top = 5
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
  object Panel5: TPanel
    Left = 264
    Top = 30
    Width = 137
    Height = 139
    TabOrder = 4
    Visible = False
    object lbl_dw_no: TLabel
      Left = 141
      Top = 5
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
    object lbl_bm_no: TLabel
      Left = 140
      Top = 32
      Width = 5
      Height = 10
      Caption = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lbl_xsbm_no: TLabel
      Left = 139
      Top = 53
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
    object cbb_dw: TComboBox
      Left = 9
      Top = 4
      Width = 120
      Height = 21
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
      ItemHeight = 13
      TabOrder = 0
      OnSelect = cbb_dwSelect
    end
    object cbb_bm: TComboBox
      Left = 9
      Top = 28
      Width = 120
      Height = 21
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
      ItemHeight = 13
      TabOrder = 1
      OnSelect = cbb_bmSelect
    end
    object cbb_xsbm: TComboBox
      Left = 8
      Top = 52
      Width = 120
      Height = 21
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
      ItemHeight = 13
      TabOrder = 2
      OnSelect = cbb_xsbmSelect
    end
    object Button5: TButton
      Left = 31
      Top = 104
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 3
      OnClick = Button5Click
    end
    object cbb_xsbm1: TComboBox
      Left = 8
      Top = 76
      Width = 120
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
    end
  end
  object Memo1: TMemo
    Left = 16
    Top = 128
    Width = 137
    Height = 25
    ScrollBars = ssVertical
    TabOrder = 5
    Visible = False
    WordWrap = False
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
    AfterDelete = IBCTable1AfterDelete
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
    ReportOptions.LastChange = 40830.531458865700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 864
    Top = 225
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
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 26.456692910000000000
        Top = 136.063080000000000000
        Width = 755.905999999999900000
        RowCount = 1
        object Memo3: TfrxMemoView
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #22995#21517)
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 52.913420000000000000
          Width = 56.692913390000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #20986#21220#24773#20917)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 109.606370000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #22522#26412)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 162.519790000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #20840#21220)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 215.433210000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #24037#40836)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 268.346630000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #32570#21220)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 321.260050000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #30005#35805#34917#21161)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 374.173470000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #34917#21457)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 427.086890000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #24212#21457#39069)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 480.000310000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #20195#25187)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 532.913730000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #31038#20445#20195#25187)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 585.827150000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #23454#21457#39069)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 638.740570000000000000
          Width = 49.133858270000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #22791#27880)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 687.874460000000000000
          Width = 64.251968500000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #31614#25910#20154)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object DetailData1: TfrxDetailData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        Height = 26.456692910000000000
        ParentFont = False
        Top = 185.196970000000000000
        Width = 755.905999999999900000
        DataSet = frxDBDataset3
        DataSetName = 'frxDBDataset3'
        RowCount = 0
        object Memo4: TfrxMemoView
          Width = 52.913385830000000000
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
          Left = 52.913420000000000000
          Width = 56.692913390000000000
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
          Left = 109.606370000000000000
          Width = 52.913385830000000000
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
          Left = 162.519790000000000000
          Width = 52.913385830000000000
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
          Left = 215.433210000000000000
          Width = 52.913385830000000000
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
          Left = 268.346630000000000000
          Width = 52.913385830000000000
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
          Left = 321.260050000000000000
          Width = 52.913385830000000000
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
          Left = 374.173470000000000000
          Width = 52.913385830000000000
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
          Left = 427.086890000000000000
          Width = 52.913385830000000000
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
          Left = 480.000310000000000000
          Width = 52.913385830000000000
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
          Left = 532.913730000000000000
          Width = 52.913385830000000000
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
          Left = 585.827150000000000000
          Width = 52.913385830000000000
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
          Left = 638.740570000000000000
          Width = 49.133858270000000000
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
          Left = 687.874460000000000000
          Width = 64.251968500000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 755.905999999999900000
        object Memo1: TfrxMemoView
          Left = 309.921460000000000000
          Width = 139.842610000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #38451#20809#38632#24037#36164#34920)
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 124.724490000000000000
          Top = 37.795300000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #37096#38376#65306)
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 166.299320000000000000
          Top = 37.795300000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 355.275820000000000000
          Top = 37.795300000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #29366#24577#65306)
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 396.850650000000000000
          Top = 37.795300000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 532.913730000000000000
          Top = 3.779530000000001000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #25171#21360#26085#26399#65306'[<Date>]  [<Time>]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #24180#26376#65306)
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 49.133890000000000000
          Top = 37.795300000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        Height = 26.456692910000000000
        ParentFont = False
        Top = 272.126160000000000000
        Width = 755.905999999999900000
        object Memo15: TfrxMemoView
          Left = 109.606370000000000000
          Width = 52.913385830000000000
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
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 162.519790000000000000
          Width = 52.913385830000000000
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
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 215.433210000000000000
          Width = 52.913385830000000000
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
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 268.346630000000000000
          Width = 52.913385830000000000
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
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 321.260050000000000000
          Width = 52.913385830000000000
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
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 374.173470000000000000
          Width = 52.913385830000000000
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
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 427.086890000000000000
          Width = 52.913385830000000000
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
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 480.000310000000000000
          Width = 52.913385830000000000
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
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 532.913730000000000000
          Width = 52.913385830000000000
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
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 585.827150000000000000
          Width = 52.913385830000000000
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
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Width = 109.606299212598000000
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
          Left = 638.740570000000000000
          Width = 49.133858267716500000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 687.874460000000000000
          Width = 64.251968500000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
      end
      object ColumnFooter1: TfrxColumnFooter
        Height = 22.677180000000000000
        Top = 321.260050000000000000
        Width = 755.905999999999900000
        object Memo45: TfrxMemoView
          Top = 3.779530000000022000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          Memo.Strings = (
            #21046#34920#20154#65306)
        end
        object Memo46: TfrxMemoView
          Left = 139.842610000000000000
          Top = 3.779530000000022000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          Memo.Strings = (
            #24635#32463#29702#65306)
        end
        object Memo47: TfrxMemoView
          Left = 298.582870000000000000
          Top = 3.779530000000022000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          Memo.Strings = (
            #36130#21153#65306)
        end
        object Memo55: TfrxMemoView
          Left = 64.252010000000000000
          Top = 3.779530000000022000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
        end
        object Memo56: TfrxMemoView
          Left = 362.834880000000000000
          Top = 3.779530000000022000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
        end
        object Memo57: TfrxMemoView
          Left = 631.181510000000000000
          Top = 3.779530000000022000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #31532'[Page#]'#39029#65292#20849'[TotalPages#]'#39029)
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = IBCQuery1
    Left = 776
    Top = 161
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
    Left = 800
    Top = 113
  end
  object frxrprt_HJ: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbPageSetup]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    ReportOptions.CreateDate = 40799.883810219900000000
    ReportOptions.LastChange = 40829.964904687500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 872
    Top = 297
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
        Top = 215.433210000000000000
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
        Height = 56.692950000000000000
        Top = 136.063080000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset2."BMMC1"'
        KeepTogether = True
        ReprintOnNewPage = True
        object Memo19: TfrxMemoView
          Top = 37.795300000000000000
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
        Top = 264.567100000000000000
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #29366#24577#65306)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 60.472480000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        Height = 30.236240000000000000
        ParentFont = False
        Top = 400.630180000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Left = 480.000310000000000000
          Top = 3.779530000000022000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #31532'[Page#]'#39029#65292#20849'[TotalPages#]'#39029)
        end
        object Memo12: TfrxMemoView
          Top = 3.779530000000022000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          Memo.Strings = (
            #21046#34920#20154#65306)
        end
        object Memo13: TfrxMemoView
          Left = 283.464750000000000000
          Top = 3.779530000000022000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          Memo.Strings = (
            #24635#32463#29702#65306)
        end
        object Memo14: TfrxMemoView
          Left = 139.842610000000000000
          Top = 3.779530000000022000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          Memo.Strings = (
            #36130#21153#65306)
        end
        object Memo15: TfrxMemoView
          Left = 52.913420000000000000
          Top = 3.779530000000022000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
        end
        object Memo16: TfrxMemoView
          Left = 177.637910000000000000
          Top = 3.779530000000022000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
        end
      end
      object Footer1: TfrxFooter
        Height = 26.456692910000000000
        Top = 313.700990000000000000
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
            #24635#35745#65306)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = IBCQuery1
    Left = 768
    Top = 257
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
    ReportOptions.LastChange = 40886.487120405090000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 856
    Top = 177
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
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 26.456692910000000000
        Top = 143.622140000000000000
        Width = 755.906000000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo4: TfrxMemoView
          Width = 56.692913390000000000
          Height = 26.456692910000000000
          DataField = 'RY_NAME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."RY_NAME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 56.692950000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataField = 'CQQK'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."CQQK"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 109.606370000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataField = 'GWGZ'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."GWGZ"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 162.519790000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataField = 'QQ'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."QQ"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 215.433210000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataField = 'GLGZ'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."GLGZ"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 268.346630000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataField = 'QQQK'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '-%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."QQQK"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 321.260050000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataField = 'DHBZ'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."DHBZ"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 374.173470000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataField = 'BF'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."BF"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 427.086890000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataField = 'YFJE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."YFJE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 480.000310000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataField = 'DK'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '-%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."DK"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 532.913730000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataField = 'SBDK'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '-%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."SBDK"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 585.827150000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataField = 'SFJE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."SFJE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 638.740570000000000000
          Width = 49.133858270000000000
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
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 687.874460000000000000
          Width = 64.251968500000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 102.047292910000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        Condition = 'frxDBDataset1."BM_NO"'
        KeepTogether = True
        ReprintOnNewPage = True
        object Memo1: TfrxMemoView
          Left = 298.582870000000000000
          Width = 139.842610000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = #23435#20307
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #38451#20809#38632#24037#36164#34920)
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 313.700990000000000000
          Top = 30.236240000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #29366#24577#65306)
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 366.614410000000000000
          Top = 30.236240000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 650.079160000000000000
          Top = 37.795300000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #24180#26376#65306)
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 695.433520000000000000
          Top = 37.795300000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 75.590600000000000000
          Width = 56.692913390000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #22995#21517)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 56.692950000000000000
          Top = 75.590600000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #20986#21220#24773#20917)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 109.606370000000000000
          Top = 75.590600000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #22522#26412)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 162.519790000000000000
          Top = 75.590600000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #20840#21220)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 215.433210000000000000
          Top = 75.590600000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #24037#40836)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 268.346630000000000000
          Top = 75.590600000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #32570#21220)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 321.260050000000000000
          Top = 75.590600000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #30005#35805#34917#21161)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 374.173470000000000000
          Top = 75.590600000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #34917#21457)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 427.086890000000000000
          Top = 75.590600000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #24212#21457#39069)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 480.000310000000000000
          Top = 75.590600000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #20195#25187)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 532.913730000000000000
          Top = 75.590600000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #31038#20445#20195#25187)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 585.827150000000000000
          Top = 75.590600000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #23454#21457#39069)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 638.740570000000000000
          Top = 75.590600000000000000
          Width = 49.133858270000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #22791#27880)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 687.874460000000000000
          Top = 75.590600000000000000
          Width = 64.251968500000000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #31614#25910#20154)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 600.945270000000000000
          Top = 56.692949999999990000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."BMMC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 173.858362910000000000
        Top = 192.756030000000000000
        Width = 755.906000000000000000
        object Memo15: TfrxMemoView
          Left = 109.606370000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."GWGZ">,MasterData1)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 162.519790000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."QQ">,MasterData1)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 215.433210000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."GLGZ">,MasterData1)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 268.346630000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '-%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."QQQK">,MasterData1)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 321.260050000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."DHBZ">,MasterData1)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 374.173470000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."BF">,MasterData1)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 427.086890000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."YFJE">,MasterData1)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 480.000310000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '-%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."DK">,MasterData1)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 532.913730000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '-%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."SBDK">,MasterData1)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 585.827150000000000000
          Width = 52.913385830000000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."SFJE">,MasterData1)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Width = 109.606299212598000000
          Height = 26.456692910000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #23567#35745)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 638.740570000000000000
          Width = 49.133858267716500000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 687.874460000000000000
          Width = 64.251968503937000000
          Height = 26.456692910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Top = 30.236240000000010000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          Memo.Strings = (
            #21046#34920#20154#65306)
        end
        object Memo46: TfrxMemoView
          Left = 154.960730000000000000
          Top = 30.236240000000010000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          Memo.Strings = (
            #24635#32463#29702#65306)
        end
        object Memo47: TfrxMemoView
          Left = 347.716760000000000000
          Top = 30.236240000000010000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          Memo.Strings = (
            #36130#21153#65306)
        end
        object Memo48: TfrxMemoView
          Left = 64.252010000000000000
          Top = 30.236240000000010000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
        end
        object Memo49: TfrxMemoView
          Left = 411.968770000000000000
          Top = 30.236240000000010000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
        end
        object Memo55: TfrxMemoView
          Left = 593.386210000000000000
          Top = 34.015770000000010000
          Width = 136.063080000000000000
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
    Left = 880
    Top = 113
  end
  object ibcqry_check_gzd: TIBCQuery
    Transaction = IBCTransaction2
    Left = 344
    Top = 321
  end
  object IBCTransaction2: TIBCTransaction
    DefaultConnection = MainForm.IBCConnection1
    Left = 408
    Top = 361
  end
end
