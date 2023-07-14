object fCompetition_Rank: TfCompetition_Rank
  Left = 0
  Top = 0
  Caption = #45824#54924' '#44592#47197#48372#44592
  ClientHeight = 424
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 28
  object Panel_Box: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 125
    Width = 612
    Height = 50
    Margins.Top = 8
    Align = alTop
    TabOrder = 0
    Visible = False
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
      Top = 4
      Width = 444
      Height = 36
      Margins.Left = 8
      Margins.Bottom = 0
      Align = alLeft
      TabOrder = 0
      TextHint = #48149#49828' '#51060#47492
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 178
    Width = 618
    Height = 246
    Align = alClient
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 616
      Height = 48
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 1
        Top = 1
        Width = 70
        Height = 46
        Align = alLeft
        Caption = '      '#49692#50948
        Layout = tlCenter
        ExplicitHeight = 28
      end
      object Label_CompetitionName2: TLabel
        Left = 152
        Top = 14
        Width = 227
        Height = 28
        Caption = 'Label_CompetitionName2'
        Visible = False
      end
      object ComboBox_Level: TComboBox
        AlignWithMargins = True
        Left = 372
        Top = 6
        Width = 145
        Height = 36
        Margins.Top = 5
        Align = alRight
        TabOrder = 0
        TextHint = #45212#51060#46020
        OnChange = ComboBox_LevelChange
        Items.Strings = (
          'Rxd'
          'Scale A'
          'Scale B'
          'Scale C')
      end
      object Button1: TButton
        Left = 520
        Top = 1
        Width = 95
        Height = 46
        Align = alRight
        Caption = #51204#52404#48372#44592
        TabOrder = 1
        OnClick = Button1Click
      end
    end
    object DBGrid_Rank: TDBGrid
      Left = 1
      Top = 49
      Width = 616
      Height = 196
      Align = alClient
      DataSource = fDm.ds_Competition
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -20
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Visible = False
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 65
    Width = 612
    Height = 49
    Margins.Top = 8
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 2
    object Label_CompetitionName: TLabel
      Left = 1
      Top = 1
      Width = 85
      Height = 47
      Align = alLeft
      Caption = #45824#54924#47749'     '
      Layout = tlCenter
      ExplicitHeight = 28
    end
    object SearchBox_CompetitionName: TSearchBox
      AlignWithMargins = True
      Left = 89
      Top = 6
      Width = 519
      Height = 37
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alClient
      Enabled = False
      ImeMode = imSHanguel
      TabOrder = 0
      OnInvokeSearch = SearchBox_CompetitionNameInvokeSearch
      ExplicitHeight = 36
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 618
    Height = 57
    Align = alTop
    TabOrder = 3
    object RadioGroup_Type: TRadioGroup
      Left = 1
      Top = 1
      Width = 547
      Height = 55
      Align = alClient
      Caption = #52280#44032#54805#53468
      Columns = 2
      Items.Strings = (
        #48149#49828
        #44060#51064)
      TabOrder = 0
      OnClick = RadioGroup_TypeClick
    end
    object Button2: TButton
      Left = 548
      Top = 1
      Width = 69
      Height = 55
      Align = alRight
      Caption = #51333#47308
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
