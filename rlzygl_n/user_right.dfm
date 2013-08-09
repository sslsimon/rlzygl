object frm_user_right: Tfrm_user_right
  Left = 346
  Top = 184
  BorderStyle = bsDialog
  Caption = #29992#25143#26435#38480#35774#23450
  ClientHeight = 621
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 580
    Align = alClient
    BevelInner = bvLowered
    BorderStyle = bsSingle
    ParentBackground = False
    TabOrder = 0
    object Bevel1: TBevel
      Left = 322
      Top = 2
      Width = 3
      Height = 572
      Align = alLeft
      Style = bsRaised
    end
    object RzCheckTree1: TRzCheckTree
      Left = 325
      Top = 24
      Width = 357
      Height = 550
      BorderWidth = 1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      Indent = 19
      ParentFont = False
      ReadOnly = False
      SelectionPen.Color = clBtnShadow
      StateImages = RzCheckTree1.CheckImages
      TabOrder = 0
      Items.Data = {
        0100000019000000000000000000000001000000FFFFFFFF0000000000000000
        00}
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 320
      Height = 572
      Align = alLeft
      DataSource = DataSource1
      ImeName = #20013#25991' ('#31616#20307') - '#32654#24335#38190#30424
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -14
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'OPERATOR_NO'
          Title.Caption = #20195#30721
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OPERATOR_NAME'
          Title.Caption = #22995#21517
          Width = 132
          Visible = True
        end>
    end
    object RzDBCheckBox1: TRzDBCheckBox
      Left = 444
      Top = 6
      Width = 116
      Height = 17
      DataField = 'IS_LOGIN'
      DataSource = DataSource1
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Caption = #20801#35768#30331#24405#31995#32479
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 580
    Width = 688
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object Button1: TButton
      Left = 280
      Top = 6
      Width = 75
      Height = 25
      Caption = #21047#26032
      TabOrder = 0
      Visible = False
      OnClick = Button1Click
    end
    object btn_int_right: TButton
      Left = 576
      Top = 6
      Width = 75
      Height = 25
      Caption = #21021#22987#21270#26435#38480
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = btn_int_rightClick
    end
    object btn_save_right: TButton
      Left = 112
      Top = 6
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 2
      OnClick = btn_save_rightClick
    end
  end
  object DataSource1: TDataSource
    DataSet = ibqry_user
    Left = 544
    Top = 32
  end
  object IBTransaction_user1: TIBCTransaction
    DefaultConnection = MainForm.IBCConnection1
    Left = 408
    Top = 40
  end
  object ibqry_user: TIBCQuery
    Connection = MainForm.IBCConnection1
    Transaction = IBTransaction_user1
    SQL.Strings = (
      
        'select OPERATOR_no,OPERATOR_name,OPERATOR_PASSWORD,OPERATOR_LX,I' +
        'S_LOGIN from OPERATOR_xx where operator_no<>'#39'999'#39)
    Left = 360
    Top = 40
    object ibqry_userOPERATOR_NO: TIntegerField
      FieldName = 'OPERATOR_NO'
      Required = True
    end
    object ibqry_userOPERATOR_NAME: TStringField
      FieldName = 'OPERATOR_NAME'
      Required = True
    end
    object ibqry_userOPERATOR_PASSWORD: TStringField
      FieldName = 'OPERATOR_PASSWORD'
      Size = 10
    end
    object ibqry_userOPERATOR_LX: TIntegerField
      FieldName = 'OPERATOR_LX'
    end
    object ibqry_userIS_LOGIN: TBooleanField
      FieldName = 'IS_LOGIN'
    end
  end
  object ibtbl_sys_right: TIBCTable
    TableName = 'SYSTEM_RIGHT'
    Connection = MainForm.IBCConnection1
    Transaction = IBTransaction_sys_right
    Left = 376
    Top = 112
    object ibtbl_sys_rightRIGHT_NAME: TStringField
      FieldName = 'RIGHT_NAME'
      FixedChar = True
      Size = 15
    end
    object ibtbl_sys_rightRIGHT_CAPTION: TStringField
      FieldName = 'RIGHT_CAPTION'
      FixedChar = True
      Size = 30
    end
    object ibtbl_sys_rightRIGHT_TAG: TIntegerField
      FieldName = 'RIGHT_TAG'
    end
  end
  object IBTransaction_sys_right: TIBCTransaction
    DefaultConnection = MainForm.IBCConnection1
    Left = 480
    Top = 128
  end
  object IBQuery1: TIBCQuery
    Connection = MainForm.IBCConnection1
    Transaction = IBTransaction1
    Left = 368
    Top = 224
  end
  object IBTransaction1: TIBCTransaction
    DefaultConnection = MainForm.IBCConnection1
    Left = 472
    Top = 224
  end
  object ibqry_set_right: TIBCQuery
    Connection = MainForm.IBCConnection1
    Transaction = IBTransaction_set_right
    Left = 376
    Top = 320
  end
  object IBTransaction_set_right: TIBCTransaction
    DefaultConnection = MainForm.IBCConnection1
    Left = 488
    Top = 320
  end
end
