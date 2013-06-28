object Frm_Addjczl: TFrm_Addjczl
  Left = 290
  Top = 140
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #22522#30784#36164#26009#23450#20041
  ClientHeight = 630
  ClientWidth = 861
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 861
    Height = 630
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #20844#21496#26426#26500#35774#32622
      object JsDbTree1: TJsDbTree
        Left = 0
        Top = 0
        Width = 345
        Height = 603
        Align = alLeft
        Title.Caption = #26426#26500#35774#32622
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        DataField = 'BM_NO'
        McData = 'BMMC'
        DataSource = ds_qry_bmxx
        ButtonCloseVisible = False
        ReadOnly = True
        Menu = JsDbTree1.Menu
        TreeCodeSeperate = '.'
        OnTreeChange = JsDbTree1TreeChange
      end
      object Panel1: TPanel
        Left = 344
        Top = 488
        Width = 509
        Height = 113
        Align = alCustom
        BorderStyle = bsSingle
        TabOrder = 1
        object Label1: TLabel
          Left = 216
          Top = 1
          Width = 18
          Height = 16
          Caption = '22'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 312
          Top = 1
          Width = 45
          Height = 16
          Caption = '22.01'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 424
          Top = 1
          Width = 72
          Height = 16
          Caption = '22.01.01'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 6
          Top = 4
          Width = 72
          Height = 12
          Caption = #21508#32423#37096#38376#20351#29992
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 94
          Top = 4
          Width = 24
          Height = 12
          Caption = #20998#38548
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 79
          Top = -1
          Width = 11
          Height = 23
          Caption = '.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Consolas'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 128
          Top = 4
          Width = 84
          Height = 12
          Caption = #20363#22914' '#19968#32423#37096#38376' '
        end
        object Label8: TLabel
          Left = 248
          Top = 4
          Width = 54
          Height = 12
          Caption = #20108#32423#37096#38376' '
        end
        object Label9: TLabel
          Left = 368
          Top = 4
          Width = 54
          Height = 12
          Caption = #19977#32423#37096#38376' '
        end
        object Label10: TLabel
          Left = 8
          Top = 34
          Width = 75
          Height = 14
          Caption = #26426#26500#32534#21495#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 216
          Top = 34
          Width = 75
          Height = 14
          Caption = #26426#26500#21517#31216#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_add: TButton
          Left = 82
          Top = 76
          Width = 75
          Height = 25
          Caption = #28155#21152
          TabOrder = 0
          OnClick = btn_addClick
        end
        object btn_edit: TButton
          Left = 170
          Top = 76
          Width = 75
          Height = 25
          Caption = #20462#25913
          TabOrder = 1
          OnClick = btn_editClick
        end
        object btn_save: TButton
          Left = 259
          Top = 76
          Width = 75
          Height = 25
          Caption = #20445#23384
          Enabled = False
          TabOrder = 2
          OnClick = btn_saveClick
        end
        object btn_cancle: TButton
          Left = 347
          Top = 76
          Width = 75
          Height = 25
          Caption = #21462#28040
          Enabled = False
          TabOrder = 3
          OnClick = btn_cancleClick
        end
        object dbedt_bm_no: TDBEdit
          Left = 80
          Top = 32
          Width = 121
          Height = 20
          DataField = 'bm_no'
          DataSource = ds_bmxx
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_bmmc: TDBEdit
          Left = 296
          Top = 32
          Width = 121
          Height = 20
          DataField = 'bmmc'
          DataSource = ds_bmxx
          ReadOnly = True
          TabOrder = 5
        end
        object DBCheckBox1: TDBCheckBox
          Left = 216
          Top = 56
          Width = 121
          Height = 17
          Caption = #26159#21542#29983#25104#24037#36164#21333
          DataField = 'IN_GZD'
          DataSource = ds_bmxx
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
      object DBGridEh1: TDBGridEh
        Left = 344
        Top = 0
        Width = 505
        Height = 465
        BiDiMode = bdLeftToRight
        Ctl3D = False
        DataSource = ds_bmxx
        ShowSerialNo = False
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        OptionsEh = [dghHighlightFocus, dghClearSelection, dghDialogFind]
        ParentBiDiMode = False
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = #23435#20307
        TitleFont.Style = [fsBold]
        Columns = <
          item
            EditButtons = <>
            FieldName = 'BM_NO'
            Footers = <>
            Title.Caption = #26426#26500#32534#21495
            Width = 121
          end
          item
            EditButtons = <>
            FieldName = 'BMMC'
            Footers = <>
            Title.Caption = #26426#26500#21517#31216
            Width = 279
          end
          item
            EditButtons = <>
            FieldName = 'IN_GZD'
            Footers = <>
            Title.Caption = #24037#36164#21333
            Width = 59
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #32844#21153#21450#23398#21382#23450#20041
      ImageIndex = 1
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 853
        Height = 300
        Align = alTop
        Caption = #32844#21153#23450#20041
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object DBGrid2: TDBGrid
          Left = 2
          Top = 21
          Width = 849
          Height = 237
          Align = alClient
          DataSource = ds_zwdy
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -19
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ZWMC'
              Title.Caption = #32844#21153#21517#31216
              Width = 306
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GWGZ'
              Title.Caption = #23703#20301#24037#36164
              Visible = True
            end>
        end
        object Panel2: TPanel
          Left = 2
          Top = 258
          Width = 849
          Height = 40
          Align = alBottom
          BorderStyle = bsSingle
          TabOrder = 1
          object Label12: TLabel
            Left = 16
            Top = 8
            Width = 95
            Height = 19
            Caption = #32844#21153#21517#31216#65306
          end
          object lbl1: TLabel
            Left = 248
            Top = 8
            Width = 84
            Height = 19
            AutoSize = False
            Caption = #23703#20301#24037#36164#65306
          end
          object Edit1: TEdit
            Left = 104
            Top = 4
            Width = 137
            Height = 27
            TabOrder = 0
          end
          object Button1: TButton
            Left = 451
            Top = 5
            Width = 75
            Height = 25
            Caption = #28155#21152
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = Button1Click
          end
          object Button2: TButton
            Left = 539
            Top = 5
            Width = 75
            Height = 25
            Caption = #20462#25913
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = Button2Click
          end
          object Button3: TButton
            Left = 676
            Top = 5
            Width = 75
            Height = 25
            Caption = #20445#23384
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnClick = Button3Click
          end
          object Button4: TButton
            Left = 764
            Top = 5
            Width = 75
            Height = 25
            Caption = #21462#28040
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnClick = Button4Click
          end
          object Edit3: TEdit
            Left = 332
            Top = 4
            Width = 114
            Height = 27
            TabOrder = 5
            Text = '0'
          end
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 300
        Width = 853
        Height = 303
        Align = alClient
        Caption = #23398#21382#23450#20041
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object DBGrid3: TDBGrid
          Left = 2
          Top = 21
          Width = 849
          Height = 239
          Align = alClient
          DataSource = ds_xl_dy
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -19
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'XLMC'
              Title.Caption = #23398#21382#21517#31216
              Width = 220
              Visible = True
            end>
        end
        object Panel3: TPanel
          Left = 2
          Top = 260
          Width = 849
          Height = 41
          Align = alBottom
          BorderStyle = bsSingle
          TabOrder = 1
          object Label13: TLabel
            Left = 16
            Top = 8
            Width = 95
            Height = 19
            Caption = #23398#21382#21517#31216#65306
          end
          object Edit2: TEdit
            Left = 104
            Top = 4
            Width = 121
            Height = 27
            TabOrder = 0
          end
          object Button5: TButton
            Left = 451
            Top = 6
            Width = 75
            Height = 25
            Caption = #28155#21152
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = Button5Click
          end
          object Button6: TButton
            Left = 539
            Top = 6
            Width = 75
            Height = 25
            Caption = #20462#25913
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = Button6Click
          end
          object Button7: TButton
            Left = 676
            Top = 6
            Width = 75
            Height = 25
            Caption = #20445#23384
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnClick = Button7Click
          end
          object Button8: TButton
            Left = 764
            Top = 6
            Width = 75
            Height = 25
            Caption = #21462#28040
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnClick = Button8Click
          end
        end
      end
    end
  end
  object ds_bmxx: TDataSource
    DataSet = ibtbl_bmxx
    Left = 132
    Top = 255
  end
  object ds_xl_dy: TDataSource
    DataSet = ibtbl_xl_dy
    OnDataChange = ds_xl_dyDataChange
    Left = 516
    Top = 55
  end
  object ds_qry_bmxx: TDataSource
    DataSet = ibqry_BMXX
    Left = 108
    Top = 99
  end
  object IBCTransaction1: TIBCTransaction
    DefaultConnection = MainForm.IBCConnection1
    Left = 348
    Top = 135
  end
  object ibqry_zw_dy: TIBCQuery
    Connection = MainForm.IBCConnection1
    Transaction = IBCTransaction1
    Left = 260
    Top = 143
  end
  object ibqry_xl_dy: TIBCQuery
    Connection = MainForm.IBCConnection1
    Transaction = IBCTransaction1
    Left = 444
    Top = 55
  end
  object ibtbl_bmxx: TIBCTable
    TableName = 'BMXX'
    Connection = MainForm.IBCConnection1
    Transaction = IBTransaction_bmxx_edit
    AutoCommit = False
    Filtered = True
    Filter = 'bm_no<>'#39'0'#39
    IndexFieldNames = 'BM_NO'
    BeforeDelete = ibtbl_bmxxBeforeDelete
    Left = 68
    Top = 247
    object ibtbl_bmxxBM_NO: TStringField
      FieldName = 'BM_NO'
      Required = True
    end
    object ibtbl_bmxxBMMC: TStringField
      FieldName = 'BMMC'
      Required = True
    end
    object ibtbl_bmxxIN_GZD: TBooleanField
      FieldName = 'IN_GZD'
    end
  end
  object ibtbl_zw_dy: TIBCTable
    TableName = 'ZWXX'
    Connection = MainForm.IBCConnection1
    Transaction = IBCTransaction1
    IndexFieldNames = 'ZW_NO'
    Left = 308
    Top = 71
    object ibtbl_zw_dyZW_NO: TIntegerField
      FieldName = 'ZW_NO'
      Required = True
    end
    object ibtbl_zw_dyZWMC: TStringField
      FieldName = 'ZWMC'
    end
    object ibtbl_zw_dyGWGZ: TFloatField
      FieldName = 'GWGZ'
    end
  end
  object ibtbl_xl_dy: TIBCTable
    TableName = 'XLXX'
    Connection = MainForm.IBCConnection1
    Transaction = IBCTransaction1
    IndexFieldNames = 'XL_NO'
    Left = 212
    Top = 255
    object ibtbl_xl_dyXL_NO: TIntegerField
      FieldName = 'XL_NO'
      Required = True
    end
    object ibtbl_xl_dyXLMC: TStringField
      FieldName = 'XLMC'
    end
  end
  object ibqry_BMXX: TIBCQuery
    Connection = MainForm.IBCConnection1
    Transaction = IBCTransaction1
    SQL.Strings = (
      'select * from bmxx where bm_no<>'#39'0'#39' order by bm_no')
    Left = 52
    Top = 99
  end
  object ds_zwdy: TDataSource
    DataSet = ibtbl_zw_dy
    OnDataChange = ds_zwdyDataChange
    Left = 356
    Top = 71
  end
  object IBTransaction_bmxx_edit: TIBCTransaction
    DefaultConnection = MainForm.IBCConnection1
    Left = 180
    Top = 359
  end
  object ibcqry1: TIBCQuery
    Connection = MainForm.IBCConnection1
    Transaction = MainForm.IBTransaction1
    Left = 300
    Top = 275
  end
end
