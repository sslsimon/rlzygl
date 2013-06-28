object frm_changyong_cx: Tfrm_changyong_cx
  Left = 143
  Top = 157
  BorderStyle = bsSingle
  Caption = #24120#29992#26597#35810
  ClientHeight = 622
  ClientWidth = 1129
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
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 1129
    Height = 622
    ActivePage = TabSheet2
    Align = alClient
    TabIndex = 1
    TabOrder = 0
    OnChange = RzPageControl1Change
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = #21592#24037#29983#26085
      object pnl1: TPanel
        Left = 0
        Top = 83
        Width = 1125
        Height = 516
        Align = alClient
        BevelInner = bvLowered
        BorderStyle = bsSingle
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 2
          Top = 2
          Width = 1117
          Height = 508
          Align = alClient
          DataSource = ds1
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'RY_NO'
              Title.Caption = #20154#21592#32534#21495
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RY_NAME'
              Title.Caption = #22995#21517
              Width = 80
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'RY_SEX'
              Title.Caption = #24615#21035
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RY_RZRQ'
              Title.Caption = #20837#32844#26085#26399
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RY_ZZRQ'
              Title.Caption = #36716#27491#26085#26399
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'RY_GL'
              Title.Caption = #24037#40836'('#24180')'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RY_HTRQ_BEGIN'
              Title.Caption = #21512#21516#24320#22987
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RY_HTRQ_END'
              Title.Caption = #21512#21516#21040#26399
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RY_CSRQ'
              Title.Caption = #20986#29983#26085#26399
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RY_ZT1'
              Title.Caption = #29366#24577
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RY_MOBEL_PHONE'
              Title.Caption = #25163#26426
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RY_JTZZ'
              Title.Caption = #23478#24237#20303#22336
              Width = 321
              Visible = True
            end>
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1125
        Height = 83
        Align = alTop
        BevelInner = bvLowered
        BorderStyle = bsSingle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label1: TLabel
          Left = 16
          Top = 16
          Width = 51
          Height = 16
          Caption = #26085#26399#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object shp1: TShape
          Left = 188
          Top = 22
          Width = 28
          Height = 3
          Brush.Color = clBlack
        end
        object lbl_SR: TLabel
          Left = 426
          Top = 16
          Width = 120
          Height = 16
          Caption = '0 '#20301#21592#24037#36807#29983#26085
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 352
          Top = 17
          Width = 75
          Height = 14
          Caption = #19979#26376#23558#26377#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dtp1: TDateTimePicker
          Left = 61
          Top = 11
          Width = 120
          Height = 25
          Date = 40787.466293217590000000
          Time = 40787.466293217590000000
          TabOrder = 0
        end
        object dtp2: TDateTimePicker
          Left = 221
          Top = 11
          Width = 120
          Height = 25
          Date = 40787.466337881950000000
          Time = 40787.466337881950000000
          TabOrder = 1
        end
        object Button1: TButton
          Left = 161
          Top = 47
          Width = 75
          Height = 25
          Caption = #26597#35810
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = Button1Click
        end
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = #21592#24037#29366#24577
      object Panel2: TPanel
        Left = 0
        Top = 121
        Width = 1125
        Height = 478
        Align = alClient
        BevelInner = bvLowered
        BorderStyle = bsSingle
        TabOrder = 0
        object DBGridEh1: TDBGridEh
          Left = 2
          Top = 2
          Width = 1117
          Height = 470
          Align = alClient
          DataSource = ds2
          ShowSerialNo = True
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind]
          ParentFont = False
          PopupMenu = PopupMenu1
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnTitleClick = DBGridEh1TitleClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'RY_BM'
              Footers = <>
              Title.Caption = #37096#38376#32534#30721
              Width = 77
            end
            item
              EditButtons = <>
              FieldName = 'BMMC'
              Footers = <>
              Title.Caption = #37096#38376
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'RY_NO'
              Footers = <>
              Title.Caption = #20154#21592#32534#21495
              Title.TitleButton = True
              Width = 54
            end
            item
              EditButtons = <>
              FieldName = 'RY_NAME'
              Footers = <>
              Title.Caption = #22995#21517
              Title.TitleButton = True
              Width = 65
            end
            item
              EditButtons = <>
              FieldName = 'RY_SEX'
              Footers = <>
              Title.Caption = #24615#21035
              Title.TitleButton = True
              Width = 32
            end
            item
              EditButtons = <>
              FieldName = 'RY_SFZH'
              Footers = <>
              Title.Caption = #36523#20221#35777
              Width = 148
            end
            item
              DisplayFormat = 'yyyy-MM-dd'
              EditButtons = <>
              FieldName = 'RY_RZRQ'
              Footers = <>
              Title.Caption = #20837#32844#26085#26399
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'RY_LZRQ'
              Footers = <>
              Title.Caption = #31163#32844#26085#26399
            end
            item
              DisplayFormat = 'yyyy-MM-dd'
              EditButtons = <>
              FieldName = 'RY_ZZRQ'
              Footers = <>
              Title.Caption = #36716#27491#26085#26399
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'RY_GL'
              Footers = <>
              Title.Caption = #24037#40836'('#24180')'
              Title.TitleButton = True
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'GZ_ZWMC'
              Footers = <>
              Title.Caption = #32844#21153
              Width = 125
            end
            item
              DisplayFormat = 'yyyy-MM-dd'
              EditButtons = <>
              FieldName = 'RY_HTRQ_BEGIN'
              Footers = <>
              Title.Caption = #21512#21516#24320#22987
              Title.TitleButton = True
              Width = 75
            end
            item
              DisplayFormat = 'yyyy-MM-dd'
              EditButtons = <>
              FieldName = 'RY_HTRQ_END'
              Footers = <>
              Title.Caption = #21512#21516#21040#26399
              Title.TitleButton = True
            end
            item
              DisplayFormat = 'yyyy-MM-dd'
              EditButtons = <>
              FieldName = 'RY_CSRQ'
              Footers = <>
              Title.Caption = #20986#29983#26085#26399
              Title.TitleButton = True
              Width = 68
            end
            item
              EditButtons = <>
              FieldName = 'NL'
              Footers = <>
              Title.Caption = #24180#40836
              Title.TitleButton = True
              Width = 34
            end
            item
              EditButtons = <>
              FieldName = 'RY_ZGXL'
              Footers = <>
              Title.Caption = #26368#39640#23398#21382
              Title.TitleButton = True
              Width = 61
            end
            item
              EditButtons = <>
              FieldName = 'RY_MOBEL_PHONE'
              Footers = <>
              Title.Caption = #25163#26426
              Title.TitleButton = True
              Width = 94
            end
            item
              EditButtons = <>
              FieldName = 'RY_JTZZ'
              Footers = <>
              Title.Caption = #23478#24237#20303#22336
              Title.TitleButton = True
            end>
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1125
        Height = 121
        Align = alTop
        BevelInner = bvLowered
        BorderStyle = bsSingle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label2: TLabel
          Left = 362
          Top = 16
          Width = 51
          Height = 16
          Caption = #26085#26399#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape1: TShape
          Left = 533
          Top = 22
          Width = 28
          Height = 3
          Brush.Color = clBlack
        end
        object Label4: TLabel
          Left = 743
          Top = 16
          Width = 154
          Height = 16
          Caption = '0 '#20301#31526#21512#26465#20214#30340#21592#24037
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 694
          Top = 16
          Width = 43
          Height = 16
          AutoSize = False
          Caption = #20849#26377#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 362
          Top = 51
          Width = 71
          Height = 14
          AutoSize = False
          Caption = #21592#24037#29366#24577#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 514
          Top = 51
          Width = 71
          Height = 14
          AutoSize = False
          Caption = #21592#24037#21512#21516#65306
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbl_dw_no: TLabel
          Left = 235
          Top = 76
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
          Left = 235
          Top = 86
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
        object lbl_rybm: TLabel
          Left = 235
          Top = 96
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
        object lbl_xsbm_no: TLabel
          Left = 235
          Top = 106
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
        object dtp3: TDateTimePicker
          Left = 406
          Top = 11
          Width = 120
          Height = 25
          Date = 40787.466293217590000000
          Time = 40787.466293217590000000
          TabOrder = 0
        end
        object dtp4: TDateTimePicker
          Left = 566
          Top = 11
          Width = 120
          Height = 25
          Date = 40787.466337881950000000
          Time = 40787.466337881950000000
          TabOrder = 1
        end
        object Button2: TButton
          Left = 523
          Top = 85
          Width = 75
          Height = 25
          Caption = #26597#35810
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = Button2Click
        end
        object cbb_ygzt: TComboBox
          Left = 434
          Top = 48
          Width = 58
          Height = 22
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          ItemHeight = 14
          ItemIndex = 0
          ParentFont = False
          TabOrder = 3
          Text = #20020#26102
          Items.Strings = (
            #20020#26102
            #22312#32844
            #31163#32844
            #20854#23427)
        end
        object GroupBox1: TGroupBox
          Left = 4
          Top = 2
          Width = 140
          Height = 73
          Caption = #26465#20214#36873#25321
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object rb1: TRadioButton
            Left = 5
            Top = 24
            Width = 133
            Height = 17
            Caption = #25353#26085#26399'+'#21592#24037#29366#24577
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = rb1Click
          end
          object rb2: TRadioButton
            Left = 5
            Top = 48
            Width = 133
            Height = 17
            Caption = #25353#26085#26399'+'#21592#24037#21512#21516
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = rb2Click
          end
        end
        object ComboBox1: TComboBox
          Left = 586
          Top = 48
          Width = 96
          Height = 22
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
          ItemHeight = 14
          ItemIndex = 0
          ParentFont = False
          TabOrder = 5
          Text = #35797#29992#26399
          OnSelect = ComboBox1Select
          Items.Strings = (
            #35797#29992#26399
            #26377#21512#21516
            #26080#21512#21516
            #21512#21516#21040#26399)
        end
        object GroupBox2: TGroupBox
          Left = 146
          Top = 1
          Width = 214
          Height = 113
          Caption = #37096#38376#36873#25321
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -14
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          object cbb_dw: TComboBox
            Left = 8
            Top = 19
            Width = 197
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
            ItemHeight = 14
            ParentFont = False
            TabOrder = 0
            OnSelect = cbb_dwSelect
          end
          object cbb_bm: TComboBox
            Left = 8
            Top = 41
            Width = 197
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
            ItemHeight = 14
            ParentFont = False
            TabOrder = 1
            OnDropDown = cbb_bmDropDown
            OnSelect = cbb_bmSelect
          end
          object cbb_xsbm1: TComboBox
            Left = 8
            Top = 85
            Width = 197
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            TabOrder = 2
            OnSelect = cbb_xsbm1Select
          end
          object cbb_xsbm: TComboBox
            Left = 8
            Top = 63
            Width = 197
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemHeight = 14
            ParentFont = False
            TabOrder = 3
            OnSelect = cbb_xsbmSelect
          end
        end
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = #24037#36164#26597#35810
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 1125
        Height = 97
        Align = alTop
        BevelInner = bvLowered
        BorderStyle = bsSingle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label10: TLabel
          Left = 30
          Top = 68
          Width = 85
          Height = 16
          Caption = #24037#36164#24180#26376#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape2: TShape
          Left = 183
          Top = 72
          Width = 28
          Height = 3
          Brush.Color = clBlack
        end
        object btn_rygz_cx: TButton
          Left = 515
          Top = 63
          Width = 75
          Height = 25
          Caption = #26597#35810
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btn_rygz_cxClick
        end
        object GroupBox3: TGroupBox
          Left = 6
          Top = 4
          Width = 379
          Height = 53
          Caption = #26465#20214#36873#25321
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object edt_ry_no: TEdit
            Left = 108
            Top = 19
            Width = 77
            Height = 24
            TabOrder = 0
          end
          object RadioButton1: TRadioButton
            Left = 6
            Top = 24
            Width = 94
            Height = 17
            Caption = #21592#24037#32534#21495#65306
            TabOrder = 1
          end
          object edt_ry_name: TEdit
            Left = 256
            Top = 19
            Width = 113
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object RadioButton2: TRadioButton
            Left = 190
            Top = 24
            Width = 63
            Height = 17
            Caption = #22995#21517#65306
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
        object ComboBox2: TComboBox
          Left = 109
          Top = 63
          Width = 74
          Height = 25
          Style = csDropDownList
          ItemHeight = 17
          TabOrder = 2
          OnSelect = ComboBox2Select
        end
        object ComboBox3: TComboBox
          Left = 215
          Top = 63
          Width = 74
          Height = 25
          Style = csDropDownList
          ItemHeight = 17
          TabOrder = 3
        end
      end
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 97
        Width = 1125
        Height = 502
        Align = alClient
        DataSource = ds_rygz
        ShowSerialNo = False
        Flat = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = [fsBold]
        FooterRowCount = 1
        ParentFont = False
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'GZD_MONTH'
            Footers = <>
            Title.Caption = #24180#26376
            Width = 48
          end
          item
            EditButtons = <>
            FieldName = 'BM_NO'
            Footers = <>
            Title.Caption = #37096#38376#20195#30721
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'RY_NO'
            Footers = <>
            Title.Caption = #21592#24037#32534#21495
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'RY_NAME'
            Footer.Value = #21512#35745
            Footer.ValueType = fvtStaticText
            Footers = <>
            Title.Caption = #22995#21517
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'GWGZ'
            Footer.FieldName = 'GWGZ'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #23703#20301#24037#36164
            Width = 52
          end
          item
            EditButtons = <>
            FieldName = 'CQQK'
            Footers = <>
            Title.Caption = #20986#21220#24773#20917#35828#26126
          end
          item
            EditButtons = <>
            FieldName = 'QQ'
            Footer.FieldName = 'QQ'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #20840#21220#22870
          end
          item
            EditButtons = <>
            FieldName = 'GLGZ'
            Footer.FieldName = 'GLGZ'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #24037#40836#24037#36164
          end
          item
            DisplayFormat = '-#'
            EditButtons = <>
            FieldName = 'QQQK'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.DisplayFormat = '-#'
            Footer.FieldName = 'QQQK'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clRed
            Footer.Font.Height = -11
            Footer.Font.Name = 'Tahoma'
            Footer.Font.Style = []
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #32570#21220#24212#25187
          end
          item
            EditButtons = <>
            FieldName = 'DHBZ'
            Footer.FieldName = 'DHBZ'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #30005#35805#34917#21161
          end
          item
            EditButtons = <>
            FieldName = 'BF'
            Footer.FieldName = 'BF'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #20854#23427#34917#21457
          end
          item
            DisplayFormat = '-#'
            EditButtons = <>
            FieldName = 'DK'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.DisplayFormat = '-#'
            Footer.FieldName = 'DK'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clRed
            Footer.Font.Height = -11
            Footer.Font.Name = 'Tahoma'
            Footer.Font.Style = []
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #20854#23427#20195#25187
          end
          item
            DisplayFormat = '-#'
            EditButtons = <>
            FieldName = 'SBDK'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Footer.DisplayFormat = '-#'
            Footer.FieldName = 'SBDK'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clRed
            Footer.Font.Height = -11
            Footer.Font.Name = 'Tahoma'
            Footer.Font.Style = []
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #31038#20445#20195#25187
          end
          item
            EditButtons = <>
            FieldName = 'YFJE'
            Footer.FieldName = 'YFJE'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #24212#21457#37329#39069
          end
          item
            EditButtons = <>
            FieldName = 'SFJE'
            Footer.FieldName = 'SFJE'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #23454#21457#37329#39069
          end
          item
            EditButtons = <>
            FieldName = 'BZ'
            Footers = <>
            Title.Caption = #22791#27880
          end>
      end
    end
  end
  object ds1: TDataSource
    DataSet = IBQuery1
    Left = 128
    Top = 196
  end
  object IBQuery1: TIBCQuery
    Connection = MainForm.IBCConnection1
    Transaction = MainForm.IBTransaction1
    SQL.Strings = (
      
        'select RY_NO,RY_NAME,RY_SEX,RY_RZRQ,RY_ZZRQ,RY_CSRQ,RY_MOBEL_PHO' +
        'NE,RY_JTZZ,RY_GL,RY_HTRQ_BEGIN,RY_HTRQ_END,RY_ZT,'#39'RY_ZT1'#39' from r' +
        'yxx'#39
      ' where RY_ZT<>2')
    FetchAll = True
    OnCalcFields = IBQuery1CalcFields
    Left = 104
    Top = 156
    object IBQuery1RY_NO: TIntegerField
      FieldName = 'RY_NO'
      Required = True
    end
    object IBQuery1RY_NAME: TStringField
      FieldName = 'RY_NAME'
    end
    object IBQuery1RY_SEX: TStringField
      FieldName = 'RY_SEX'
      Size = 10
    end
    object IBQuery1RY_RZRQ: TDateField
      FieldName = 'RY_RZRQ'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object IBQuery1RY_ZZRQ: TDateField
      FieldName = 'RY_ZZRQ'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object IBQuery1RY_CSRQ: TDateField
      FieldName = 'RY_CSRQ'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object IBQuery1RY_MOBEL_PHONE: TStringField
      FieldName = 'RY_MOBEL_PHONE'
      Size = 13
    end
    object IBQuery1RY_JTZZ: TStringField
      FieldName = 'RY_JTZZ'
      Size = 100
    end
    object IBQuery1RY_GL: TLargeintField
      FieldName = 'RY_GL'
    end
    object IBQuery1RY_HTRQ_BEGIN: TDateField
      FieldName = 'RY_HTRQ_BEGIN'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object IBQuery1RY_HTRQ_END: TDateField
      FieldName = 'RY_HTRQ_END'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object IBQuery1RY_ZT: TIntegerField
      FieldName = 'RY_ZT'
    end
    object IBQuery1RY_ZT1: TStringField
      FieldKind = fkCalculated
      FieldName = 'RY_ZT1'
      Calculated = True
    end
  end
  object IBCQuery2: TIBCQuery
    Connection = MainForm.IBCConnection1
    Transaction = MainForm.IBTransaction1
    SQL.Strings = (
      
        'select a.RY_BM,a.RY_NO,a.RY_NAME,a.RY_SEX,a.ry_sfzh,a.RY_RZRQ,a.' +
        'RY_ZZRQ,'
      'a.RY_CSRQ,a.RY_MOBEL_PHONE,a.RY_JTZZ,a.RY_GL,'
      'a.RY_HTRQ_BEGIN,a.RY_HTRQ_END,a.RY_ZGXL,'
      '(current_date-a.ry_csrq)/365 as NL,'
      'b.bmmc,d.gz_zwmc '
      'from ryxx a,bmxx b,get_last_zwrq c,ryxx_gzjl d'
      
        'where a.ry_bm=b.bm_no and c.ry_no=d.ry_no and c.max_id=d.gzjl_id' +
        '  and a.ry_no=c.ry_no')
    FetchAll = True
    Left = 273
    Top = 167
  end
  object ds2: TDataSource
    DataSet = IBCQuery2
    Left = 281
    Top = 223
  end
  object IBCQuery1: TIBCQuery
    Connection = MainForm.IBCConnection1
    Transaction = MainForm.IBTransaction1
    Left = 377
    Top = 173
  end
  object frxPDFExport1: TfrxPDFExport
    FileName = 'D:\My Documents\'#26700#38754'\1.pdf'
    UseFileCache = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#0
    Subject = 'FastReport?PDF export'
    Background = False
    Creator = 'FastReport?(http://www.fast-report.com)'
    HTMLTags = True
    Left = 529
    Top = 253
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'RY_NO=RY_NO'
      'RY_NAME=RY_NAME'
      'RY_SEX=RY_SEX'
      'RY_RZRQ=RY_RZRQ'
      'RY_ZZRQ=RY_ZZRQ'
      'RY_CSRQ=RY_CSRQ'
      'RY_MOBEL_PHONE=RY_MOBEL_PHONE'
      'RY_JTZZ=RY_JTZZ'
      'RY_GL=RY_GL'
      'RY_HTRQ_BEGIN=RY_HTRQ_BEGIN'
      'RY_HTRQ_END=RY_HTRQ_END'
      'RY_ZGXL=RY_ZGXL'
      'NL=NL'
      'BMMC=BMMC')
    DataSet = IBCQuery2
    Left = 465
    Top = 173
  end
  object PopupMenu1: TPopupMenu
    Left = 625
    Top = 277
    object PDF1: TMenuItem
      Caption = #25171#21360#21592#24037#36890#35759#24405'...'
      OnClick = PDF1Click
    end
  end
  object frxrprt1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbPageSetup, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    ReportOptions.CreateDate = 41055.682392222200000000
    ReportOptions.LastChange = 41057.476366284720000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 409
    Top = 285
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
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
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        RowCount = 1
        object Memo4: TfrxMemoView
          Left = 170.078850000000000000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #32534#21495)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 226.771760940000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #22995#21517)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 321.259949920000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #25163#26426#21495#30721)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Width = 170.078740160000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #37096#38376)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object DetailData1: TfrxDetailData
        Height = 18.897650000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 170.078850000000000000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          DataField = 'RY_NO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."RY_NO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 226.771760940000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataField = 'RY_NAME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."RY_NAME"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 321.259949920000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          DataField = 'RY_MOBEL_PHONE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."RY_MOBEL_PHONE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Width = 170.078740160000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."BMMC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          Left = 241.889920000000000000
          Width = 196.535560000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -37
          Font.Name = #23435#20307
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #21592#24037#36890#35759#24405)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Left = 241.889920000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #31532'[<Page>]'#39029#65292#20849'[TotalPages#]'#39029)
          ParentFont = False
        end
      end
    end
  end
  object IBCQry_rygz: TIBCQuery
    SQL.Strings = (
      'select * from gzd_item')
    Left = 697
    Top = 180
  end
  object ds_rygz: TDataSource
    DataSet = IBCQry_rygz
    Left = 753
    Top = 180
  end
end
