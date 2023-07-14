object fCompetition_Make: TfCompetition_Make
  Left = 0
  Top = 0
  Margins.Top = 8
  Caption = #45824#54924#47564#46308#44592
  ClientHeight = 461
  ClientWidth = 819
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 28
  object RadioGroup_CompetitionMember: TRadioGroup
    Left = 0
    Top = 49
    Width = 819
    Height = 61
    Align = alTop
    Caption = #52280#44032#54805#53468
    Columns = 2
    Items.Strings = (
      #48149#49828
      #44060#51064)
    TabOrder = 0
    OnClick = RadioGroup_CompetitionMemberClick
    ExplicitTop = 42
  end
  object Panel_Box: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 118
    Width = 813
    Height = 50
    Margins.Top = 8
    Align = alTop
    TabOrder = 1
    Visible = False
    ExplicitTop = 111
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 85
      Height = 48
      Align = alLeft
      Alignment = taCenter
      Caption = #52280#44032' '#48149#49828
      Layout = tlCenter
      ExplicitHeight = 28
    end
    object ComboBox_BoxName: TComboBox
      AlignWithMargins = True
      Left = 94
      Top = 9
      Width = 486
      Height = 36
      Margins.Left = 8
      Margins.Top = 8
      Margins.Bottom = 0
      Align = alClient
      Style = csDropDownList
      TabOrder = 0
      TextHint = #48149#49828' '#51060#47492
    end
    object Btn_AddBox: TButton
      Left = 718
      Top = 1
      Width = 94
      Height = 48
      Align = alRight
      Caption = #48149#49828#52628#44032
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Btn_AddBoxClick
    end
    object Btn_Set: TButton
      Left = 583
      Top = 1
      Width = 75
      Height = 48
      Align = alRight
      Caption = #46321#47197
      TabOrder = 2
      OnClick = Btn_SetClick
    end
    object Btn_AddRuleBook: TButton
      Left = 658
      Top = 1
      Width = 60
      Height = 48
      Align = alRight
      Caption = #47344#48513
      TabOrder = 3
      OnClick = Btn_AddRuleBookClick
    end
  end
  object Panel_Member: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 176
    Width = 813
    Height = 48
    Margins.Top = 5
    Align = alTop
    TabOrder = 2
    Visible = False
    ExplicitTop = 169
    object Btn_Set_Indi: TButton
      AlignWithMargins = True
      Left = 817
      Top = 4
      Width = 0
      Height = 40
      Margins.Left = 10
      Align = alClient
      Caption = #46321#47197
      TabOrder = 0
      OnClick = Btn_Set_IndiClick
    end
    object DatePicker1: TDatePicker
      Left = 446
      Top = 1
      Height = 46
      Align = alLeft
      Date = 44858.000000000000000000
      DateFormat = 'yyyy/mm/dd'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 1
    end
    object LabeledEdit_MemName: TLabeledEdit
      AlignWithMargins = True
      Left = 61
      Top = 4
      Width = 100
      Height = 40
      Margins.Left = 60
      Align = alLeft
      EditLabel.Width = 50
      EditLabel.Height = 28
      EditLabel.Caption = #51060#47492'  '
      LabelPosition = lpLeft
      TabOrder = 2
      Text = ''
      ExplicitHeight = 36
    end
    object LabeledEdit_Mobile: TLabeledEdit
      AlignWithMargins = True
      Left = 264
      Top = 4
      Width = 179
      Height = 40
      Margins.Left = 100
      Align = alLeft
      EditLabel.Width = 90
      EditLabel.Height = 28
      EditLabel.Caption = #51204#54868#48264#54840'  '
      LabelPosition = lpLeft
      TabOrder = 3
      Text = ''
      ExplicitHeight = 36
    end
    object RadioGroup_Gender: TRadioGroup
      Left = 596
      Top = 1
      Width = 211
      Height = 46
      Align = alLeft
      Caption = #49457#48324
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      Items.Strings = (
        #45224#51088
        #50668#51088)
      ParentFont = False
      TabOrder = 4
    end
  end
  object Panel_ShowMember: TPanel
    Left = 0
    Top = 227
    Width = 819
    Height = 234
    Align = alClient
    TabOrder = 3
    Visible = False
    ExplicitTop = 220
    ExplicitHeight = 241
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 817
      Height = 232
      Align = alClient
      DataSource = fDm.ds_Competition
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -20
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 819
    Height = 49
    Align = alTop
    TabOrder = 4
    ExplicitLeft = 1
    ExplicitTop = -6
    object LabeledEdit_CompetitionName: TLabeledEdit
      AlignWithMargins = True
      Left = 81
      Top = 4
      Width = 659
      Height = 41
      Margins.Left = 80
      Align = alClient
      EditLabel.Width = 60
      EditLabel.Height = 28
      EditLabel.Caption = #45824#54924#47749
      EditLabel.Layout = tlCenter
      LabelPosition = lpLeft
      LabelSpacing = 15
      TabOrder = 0
      Text = ''
      ExplicitWidth = 36
      ExplicitHeight = 734
    end
    object Button1: TButton
      Left = 743
      Top = 1
      Width = 75
      Height = 47
      Align = alRight
      Caption = #51333#47308
      TabOrder = 1
      OnClick = Button1Click
      ExplicitLeft = 528
      ExplicitTop = 32
      ExplicitHeight = 25
    end
  end
  object OpenDialog_RuleBook: TOpenDialog
    Left = 447
    Top = 360
  end
end
