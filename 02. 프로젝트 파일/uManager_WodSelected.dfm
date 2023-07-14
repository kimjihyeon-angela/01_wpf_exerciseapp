object fManager_WodSelected: TfManager_WodSelected
  Left = 0
  Top = 0
  Caption = 'fManager_WodSelected'
  ClientHeight = 565
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 25
  object ComboBox_Level: TComboBox
    AlignWithMargins = True
    Left = 3
    Top = 85
    Width = 292
    Height = 33
    Margins.Top = 2
    Margins.Bottom = 2
    Align = alTop
    Style = csDropDownList
    TabOrder = 0
    TextHint = #45212#51060#46020
    Items.Strings = (
      'Rxd'
      'Scale A'
      'Scale B'
      'Scale C'
      'All')
  end
  object ComboBox_Gender: TComboBox
    AlignWithMargins = True
    Left = 3
    Top = 122
    Width = 292
    Height = 33
    Margins.Top = 2
    Margins.Bottom = 2
    Align = alTop
    Style = csDropDownList
    TabOrder = 1
    TextHint = #49457#48324
    Items.Strings = (
      #45224#51088
      #50668#51088
      'All')
  end
  object ComboBox_StopWatch: TComboBox
    AlignWithMargins = True
    Left = 3
    Top = 159
    Width = 292
    Height = 33
    Margins.Top = 2
    Margins.Bottom = 2
    Align = alTop
    Style = csDropDownList
    TabOrder = 2
    TextHint = #53440#51060#47672
    Items.Strings = (
      'For Time'
      'Tabata'
      'Amrap'
      'Emom')
  end
  object Panel1: TPanel
    Left = 0
    Top = 345
    Width = 298
    Height = 32
    Align = alTop
    TabOrder = 3
    object Btn_WodSelect: TButton
      Left = 1
      Top = 1
      Width = 136
      Height = 30
      Align = alLeft
      Caption = #50868#46041#51077#47141#54616#44592
      TabOrder = 0
    end
    object Btn_Video: TButton
      Left = 137
      Top = 1
      Width = 160
      Height = 30
      Align = alClient
      Caption = #46041#50689#49345#52392#48512#54616#44592
      TabOrder = 1
    end
  end
  object DatePicker1: TDatePicker
    AlignWithMargins = True
    Left = 3
    Top = 2
    Width = 292
    Height = 41
    Margins.Top = 2
    Margins.Bottom = 2
    Align = alTop
    Date = 44847.000000000000000000
    DateFormat = 'yyyy/mm/dd'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 4
  end
  object Panel2: TPanel
    Left = 0
    Top = 45
    Width = 298
    Height = 38
    Align = alTop
    TabOrder = 5
    object Label_SelectWod: TLabel
      Left = 1
      Top = 1
      Width = 296
      Height = 36
      Align = alClient
      Caption = 'Label_SelectWod'
      Layout = tlCenter
      ExplicitWidth = 132
      ExplicitHeight = 25
    end
  end
  object CheckListBox_WeightCount: TCheckListBox
    Left = 0
    Top = 194
    Width = 298
    Height = 29
    Align = alTop
    Columns = 2
    ItemHeight = 25
    Items.Strings = (
      #47924#44172
      #44060#49688)
    TabOrder = 6
  end
  object LabeledEdit_VideoLink: TLabeledEdit
    AlignWithMargins = True
    Left = 110
    Top = 380
    Width = 185
    Height = 33
    Margins.Left = 110
    Align = alTop
    EditLabel.Width = 95
    EditLabel.Height = 25
    EditLabel.Caption = #46041#50689#49345' '#47553#53356
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 7
    Text = ''
    Visible = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 416
    Width = 298
    Height = 149
    Align = alClient
    DataSource = fDm.ds_Wod
    Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -18
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Panel3: TPanel
    Left = 0
    Top = 223
    Width = 298
    Height = 122
    Align = alTop
    TabOrder = 9
    Visible = False
    object LabeledEdit_Weight: TLabeledEdit
      AlignWithMargins = True
      Left = 81
      Top = 43
      Width = 213
      Height = 33
      Margins.Left = 80
      Align = alTop
      EditLabel.Width = 36
      EditLabel.Height = 25
      EditLabel.Caption = #47924#44172
      LabelPosition = lpLeft
      LabelSpacing = 20
      NumbersOnly = True
      TabOrder = 0
      Text = ''
      Visible = False
    end
    object LabeledEdit_Count: TLabeledEdit
      AlignWithMargins = True
      Left = 81
      Top = 82
      Width = 213
      Height = 33
      Margins.Left = 80
      Align = alTop
      EditLabel.Width = 36
      EditLabel.Height = 25
      EditLabel.Caption = #44060#49688
      LabelPosition = lpLeft
      LabelSpacing = 20
      NumbersOnly = True
      TabOrder = 1
      Text = ''
      Visible = False
    end
    object LabeledEdit_TimeCap: TLabeledEdit
      AlignWithMargins = True
      Left = 81
      Top = 4
      Width = 213
      Height = 33
      Margins.Left = 80
      Align = alTop
      EditLabel.Width = 36
      EditLabel.Height = 25
      EditLabel.Caption = #49884#44036
      LabelPosition = lpLeft
      LabelSpacing = 20
      NumbersOnly = True
      TabOrder = 2
      Text = ''
      Visible = False
    end
  end
  object FDQuery1: TFDQuery
    SQL.Strings = (
      'select * from WodTbl')
    Left = 90
    Top = 440
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 178
    Top = 440
  end
end
