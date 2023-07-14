object Form2: TForm2
  Left = 0
  Top = 0
  Caption = #50752#46300' '#47564#46308#44592
  ClientHeight = 614
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 28
  object ListBox_WodSelected: TListBox
    Left = 0
    Top = 177
    Width = 566
    Height = 83
    Align = alClient
    ItemHeight = 28
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 260
    Width = 566
    Height = 274
    Align = alBottom
    TabOrder = 1
    object ComboBox_Level: TComboBox
      AlignWithMargins = True
      Left = 4
      Top = 3
      Width = 558
      Height = 36
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
      Left = 4
      Top = 43
      Width = 558
      Height = 36
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
    object CheckListBox_WeightCount: TCheckListBox
      Left = 1
      Top = 81
      Width = 564
      Height = 34
      Align = alTop
      Columns = 2
      ItemHeight = 28
      Items.Strings = (
        #47924#44172
        #44060#49688)
      TabOrder = 2
      OnClick = CheckListBox_WeightCountClick
    end
    object Panel3: TPanel
      Left = 1
      Top = 115
      Width = 564
      Height = 158
      Align = alClient
      TabOrder = 3
      object LabeledEdit_Weight: TLabeledEdit
        AlignWithMargins = True
        Left = 81
        Top = 3
        Width = 479
        Height = 36
        Margins.Left = 80
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alTop
        EditLabel.Width = 40
        EditLabel.Height = 28
        EditLabel.Caption = #47924#44172
        LabelPosition = lpLeft
        LabelSpacing = 20
        TabOrder = 0
        Text = ''
        Visible = False
      end
      object LabeledEdit_Count: TLabeledEdit
        AlignWithMargins = True
        Left = 81
        Top = 43
        Width = 479
        Height = 36
        Margins.Left = 80
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alTop
        EditLabel.Width = 40
        EditLabel.Height = 28
        EditLabel.Caption = #44060#49688
        LabelPosition = lpLeft
        LabelSpacing = 20
        TabOrder = 1
        Text = ''
        Visible = False
      end
      object LabeledEdit_VideoLink: TLabeledEdit
        AlignWithMargins = True
        Left = 106
        Top = 83
        Width = 454
        Height = 36
        Margins.Left = 105
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alTop
        EditLabel.Width = 80
        EditLabel.Height = 28
        EditLabel.Caption = #50689#49345#47553#53356
        LabelPosition = lpLeft
        LabelSpacing = 20
        TabOrder = 2
        Text = ''
        Visible = False
      end
      object Btn_Check: TButton
        Left = 1
        Top = 124
        Width = 562
        Height = 33
        Align = alBottom
        Caption = #54869#51064
        TabOrder = 3
        OnClick = Btn_CheckClick
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 534
    Width = 566
    Height = 38
    Align = alBottom
    TabOrder = 2
    object Btn_Modify: TButton
      Left = 1
      Top = 1
      Width = 288
      Height = 36
      Align = alLeft
      Caption = #50868#46041' '#49688#51221#54616#44592
      TabOrder = 0
      OnClick = Btn_ModifyClick
    end
    object Btn_Link: TButton
      Left = 289
      Top = 1
      Width = 276
      Height = 36
      Align = alClient
      Caption = #46041#50689#49345#47553#53356' '#52392#48512#54616#44592
      TabOrder = 1
      OnClick = Btn_LinkClick
    end
  end
  object ComboBox_StopWatch: TComboBox
    AlignWithMargins = True
    Left = 3
    Top = 59
    Width = 560
    Height = 36
    Margins.Top = 2
    Margins.Bottom = 2
    Align = alTop
    Style = csDropDownList
    TabOrder = 3
    TextHint = #53440#51060#47672
    Items.Strings = (
      'For Time'
      'Tabata'
      'Amrap'
      'Emom')
  end
  object LabeledEdit_TimeCap: TLabeledEdit
    AlignWithMargins = True
    Left = 80
    Top = 99
    Width = 483
    Height = 36
    Margins.Left = 80
    Margins.Top = 2
    Margins.Bottom = 2
    Align = alTop
    EditLabel.Width = 40
    EditLabel.Height = 28
    EditLabel.Caption = #49884#44036
    LabelPosition = lpLeft
    LabelSpacing = 20
    TabOrder = 4
    Text = ''
  end
  object LabeledEdit_Round: TLabeledEdit
    AlignWithMargins = True
    Left = 80
    Top = 139
    Width = 483
    Height = 36
    Margins.Left = 80
    Margins.Top = 2
    Margins.Bottom = 2
    Align = alTop
    EditLabel.Width = 60
    EditLabel.Height = 28
    EditLabel.Caption = #46972#50868#46300
    LabelPosition = lpLeft
    LabelSpacing = 15
    TabOrder = 5
    Text = ''
  end
  object Panel4: TPanel
    Left = 0
    Top = 572
    Width = 566
    Height = 42
    Align = alBottom
    TabOrder = 6
    object Btn_Save: TButton
      Left = 1
      Top = 1
      Width = 564
      Height = 40
      Align = alClient
      Caption = #51200#51109#54616#44592
      TabOrder = 0
      OnClick = Btn_SaveClick
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 566
    Height = 57
    Align = alTop
    Caption = 'Panel5'
    TabOrder = 7
    object DatePicker1: TDatePicker
      Left = 1
      Top = 1
      Width = 481
      Height = 55
      Align = alClient
      Date = 44847.000000000000000000
      DateFormat = 'yyyy/mm/dd'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      AlignWithMargins = True
      Left = 485
      Top = 4
      Width = 77
      Height = 49
      Align = alRight
      Caption = #44592#47197
      TabOrder = 1
    end
  end
end
