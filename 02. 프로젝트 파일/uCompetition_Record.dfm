object fCompetition_Record: TfCompetition_Record
  Left = 0
  Top = 0
  Caption = #45824#54924#44592#47197' '#51077#47141#54616#44592
  ClientHeight = 519
  ClientWidth = 837
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 28
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 8
    Width = 831
    Height = 105
    Margins.Top = 8
    Align = alTop
    TabOrder = 0
    object Label_CompetitionName: TLabel
      Left = 1
      Top = 57
      Width = 110
      Height = 47
      Align = alLeft
      Caption = '     '#45824#54924#47749'     '
      Layout = tlCenter
      ExplicitHeight = 28
    end
    object SearchBox_CompetitionName: TSearchBox
      AlignWithMargins = True
      Left = 114
      Top = 62
      Width = 713
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
    object Panel7: TPanel
      Left = 1
      Top = 1
      Width = 829
      Height = 56
      Align = alTop
      TabOrder = 1
      object RadioGroup_Type: TRadioGroup
        Left = 1
        Top = 1
        Width = 752
        Height = 54
        Align = alClient
        Caption = #52280#50668#54805#53468
        Columns = 2
        Items.Strings = (
          #48149#49828
          #44060#51064)
        TabOrder = 0
        OnClick = RadioGroup_TypeClick
      end
      object Button1: TButton
        Left = 753
        Top = 1
        Width = 75
        Height = 54
        Align = alRight
        Caption = #51333#47308
        TabOrder = 1
        OnClick = Button1Click
      end
    end
  end
  object Panel_Box: TPanel
    Left = 0
    Top = 116
    Width = 837
    Height = 47
    Align = alTop
    TabOrder = 1
    object ComboBox_BoxName: TComboBox
      Left = 1
      Top = 1
      Width = 509
      Height = 36
      Align = alClient
      TabOrder = 0
      TextHint = #48149#49828' '#51060#47492
      OnChange = ComboBox_BoxNameChange
    end
    object ComboBox_Name: TComboBox
      Left = 510
      Top = 1
      Width = 326
      Height = 36
      Align = alRight
      TabOrder = 1
      TextHint = #51060#47492
      OnChange = ComboBox_NameChange
    end
  end
  object Panel2: TPanel
    Left = 433
    Top = 163
    Width = 404
    Height = 356
    Align = alRight
    TabOrder = 2
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 402
      Height = 354
      Margins.Left = 100
      Align = alClient
      TabOrder = 0
      object Panel4: TPanel
        Left = 1
        Top = 310
        Width = 400
        Height = 43
        Align = alBottom
        TabOrder = 0
        Visible = False
        object Btn_Save: TButton
          Left = 1
          Top = 1
          Width = 144
          Height = 41
          Align = alLeft
          Caption = #44592#47197#54616#44592
          TabOrder = 0
          OnClick = Btn_SaveClick
        end
        object Btn_Check: TButton
          Left = 145
          Top = 1
          Width = 160
          Height = 41
          Align = alLeft
          Caption = #44592#47197' '#54869#51064#54616#44592
          TabOrder = 1
          OnClick = Btn_CheckClick
        end
        object Button2: TButton
          Left = 305
          Top = 1
          Width = 94
          Height = 41
          Align = alClient
          Caption = #46028#50500#44032#44592
          TabOrder = 2
          OnClick = Button2Click
        end
      end
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 400
        Height = 268
        Align = alClient
        TabOrder = 1
        object LabeledEdit_Mobile: TLabeledEdit
          AlignWithMargins = True
          Left = 101
          Top = 88
          Width = 295
          Height = 36
          Margins.Left = 100
          Align = alTop
          EditLabel.Width = 80
          EditLabel.Height = 28
          EditLabel.Caption = #48264'        '#54840
          Enabled = False
          LabelPosition = lpLeft
          LabelSpacing = 10
          TabOrder = 0
          Text = ''
        end
        object LabeledEdit_Gender: TLabeledEdit
          AlignWithMargins = True
          Left = 101
          Top = 172
          Width = 295
          Height = 36
          Margins.Left = 100
          Align = alTop
          EditLabel.Width = 80
          EditLabel.Height = 28
          EditLabel.Caption = #49457'        '#48324
          Enabled = False
          LabelPosition = lpLeft
          LabelSpacing = 10
          TabOrder = 1
          Text = ''
        end
        object LabeledEdit_BirthYear: TLabeledEdit
          AlignWithMargins = True
          Left = 101
          Top = 130
          Width = 295
          Height = 36
          Margins.Left = 100
          Align = alTop
          EditLabel.Width = 80
          EditLabel.Height = 28
          EditLabel.Caption = #49373#45380#50900#51068
          Enabled = False
          LabelPosition = lpLeft
          LabelSpacing = 10
          TabOrder = 2
          Text = ''
        end
        object LabeledEdit_Name: TLabeledEdit
          AlignWithMargins = True
          Left = 101
          Top = 46
          Width = 295
          Height = 36
          Margins.Left = 100
          Align = alTop
          EditLabel.Width = 80
          EditLabel.Height = 28
          EditLabel.Caption = #51060'        '#47492
          Enabled = False
          LabelPosition = lpLeft
          LabelSpacing = 10
          TabOrder = 3
          Text = ''
          OnChange = LabeledEdit_NameChange
        end
        object LabeledEdit_CompetitionName: TLabeledEdit
          AlignWithMargins = True
          Left = 101
          Top = 4
          Width = 295
          Height = 36
          Margins.Left = 100
          Align = alTop
          EditLabel.Width = 80
          EditLabel.Height = 28
          EditLabel.Caption = #45824'  '#54924'  '#47749
          Enabled = False
          LabelPosition = lpLeft
          LabelSpacing = 10
          TabOrder = 4
          Text = ''
          OnChange = LabeledEdit_NameChange
        end
        object LabeledEdit_Record: TLabeledEdit
          AlignWithMargins = True
          Left = 101
          Top = 214
          Width = 295
          Height = 36
          Margins.Left = 100
          Align = alTop
          EditLabel.Width = 80
          EditLabel.Height = 28
          EditLabel.Caption = #44592'        '#47197
          LabelPosition = lpLeft
          LabelSpacing = 10
          TabOrder = 5
          Text = ''
        end
      end
      object Panel_Modify: TPanel
        Left = 1
        Top = 269
        Width = 400
        Height = 41
        Align = alBottom
        Caption = 'Panel_Modify'
        TabOrder = 2
        Visible = False
        object Btn_Modify: TButton
          Left = 1
          Top = 1
          Width = 216
          Height = 39
          Align = alLeft
          Caption = #49688#51221#54616#44592
          TabOrder = 0
          OnClick = Btn_ModifyClick
        end
        object Btn_Cancel: TButton
          Left = 217
          Top = 1
          Width = 182
          Height = 39
          Align = alClient
          Caption = #52712#49548
          TabOrder = 1
        end
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 163
    Width = 433
    Height = 356
    Align = alClient
    TabOrder = 3
    object RadioGroup1: TRadioGroup
      Left = 1
      Top = 1
      Width = 431
      Height = 354
      Align = alClient
      Caption = #45212#51060#46020
      Items.Strings = (
        'Rxd'
        'Scale A'
        'Scale B'
        'Scale C')
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 431
      Height = 354
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
      OnCellClick = DBGrid1CellClick
    end
  end
end
