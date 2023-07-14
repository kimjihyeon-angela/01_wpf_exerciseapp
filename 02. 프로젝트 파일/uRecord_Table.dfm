object fRecord_Table: TfRecord_Table
  Left = 0
  Top = 0
  Caption = #44592#47197#54364' '#48372#44592
  ClientHeight = 424
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 28
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 618
    Height = 65
    Align = alTop
    TabOrder = 0
    object ComboBox_Gender: TComboBox
      AlignWithMargins = True
      Left = 6
      Top = 16
      Width = 112
      Height = 36
      Margins.Left = 5
      Margins.Top = 15
      Align = alLeft
      TabOrder = 0
      TextHint = #49457#48324#44592#51456
      OnChange = ComboBox_GenderChange
      Items.Strings = (
        #45224#51088
        #50668#51088)
    end
    object ComboBox_Level: TComboBox
      AlignWithMargins = True
      Left = 126
      Top = 16
      Width = 144
      Height = 36
      Margins.Left = 5
      Margins.Top = 15
      Align = alLeft
      TabOrder = 1
      TextHint = #45212#51060#46020' '#44592#51456
      OnChange = ComboBox_LevelChange
      Items.Strings = (
        'Rxd'
        'ScaleA'
        'ScaleB'
        'ScaleC'
        'All')
    end
    object DatePicker1: TDatePicker
      AlignWithMargins = True
      Left = 278
      Top = 4
      Height = 57
      Margins.Left = 5
      Align = alLeft
      Date = 44832.000000000000000000
      DateFormat = 'yyyy/mm/dd'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 2
      OnChange = DatePicker1Change
    end
    object Btn_All: TButton
      Left = 431
      Top = 1
      Width = 137
      Height = 63
      Align = alRight
      Caption = #51204#52404#48372#44592
      TabOrder = 3
      OnClick = Btn_AllClick
    end
    object Button1: TButton
      Left = 568
      Top = 1
      Width = 49
      Height = 63
      Align = alRight
      Caption = #51333#47308
      TabOrder = 4
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 65
    Width = 618
    Height = 359
    Align = alClient
    DataSource = fDm.ds_q
    Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -20
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
end
