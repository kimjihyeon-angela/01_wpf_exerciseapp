object fManager_NotRecord: TfManager_NotRecord
  Left = 0
  Top = 0
  Caption = #54924#50896' '#44592#47197' '#44288#47532'('#44288#47532#51088')'
  ClientHeight = 559
  ClientWidth = 774
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
    Width = 774
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 195
      Height = 55
      Align = alLeft
      Caption = #44592#47197' '#48120#51077#47141' '#54924#50896' '#44288#47532
      Layout = tlCenter
      ExplicitHeight = 28
    end
    object Btn_Select: TButton
      Left = 623
      Top = 1
      Width = 89
      Height = 55
      Align = alRight
      Caption = #51312#54924#54616#44592
      TabOrder = 0
      OnClick = Btn_SelectClick
    end
    object Button3: TButton
      Left = 712
      Top = 1
      Width = 61
      Height = 55
      Align = alRight
      Caption = #51333#47308
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 440
    Height = 502
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    Visible = False
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 438
      Height = 500
      Align = alClient
      DataSource = fDm.ds_Record
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -20
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
    end
  end
  object Panel_Save: TPanel
    Left = 440
    Top = 57
    Width = 334
    Height = 502
    Align = alRight
    TabOrder = 2
    Visible = False
    object LabeledEdit_Name: TLabeledEdit
      AlignWithMargins = True
      Left = 91
      Top = 21
      Width = 239
      Height = 36
      Margins.Left = 90
      Margins.Top = 20
      Align = alTop
      EditLabel.Width = 80
      EditLabel.Height = 28
      EditLabel.Caption = #51060'        '#47492
      Enabled = False
      LabelPosition = lpLeft
      LabelSpacing = 5
      TabOrder = 0
      Text = ''
    end
    object LabeledEdit_BirthYear: TLabeledEdit
      AlignWithMargins = True
      Left = 91
      Top = 80
      Width = 239
      Height = 36
      Margins.Left = 90
      Margins.Top = 20
      Align = alTop
      EditLabel.Width = 80
      EditLabel.Height = 28
      EditLabel.Caption = #49373#45380#50900#51068
      Enabled = False
      LabelPosition = lpLeft
      LabelSpacing = 5
      TabOrder = 1
      Text = ''
    end
    object LabeledEdit_Gender: TLabeledEdit
      AlignWithMargins = True
      Left = 91
      Top = 139
      Width = 239
      Height = 36
      Margins.Left = 90
      Margins.Top = 20
      Align = alTop
      EditLabel.Width = 80
      EditLabel.Height = 28
      EditLabel.Caption = #49457'        '#48324
      Enabled = False
      LabelPosition = lpLeft
      LabelSpacing = 5
      TabOrder = 2
      Text = ''
    end
    object LabeledEdit_Record: TLabeledEdit
      AlignWithMargins = True
      Left = 91
      Top = 316
      Width = 239
      Height = 36
      Margins.Left = 90
      Margins.Top = 20
      Align = alTop
      EditLabel.Width = 80
      EditLabel.Height = 28
      EditLabel.Caption = #44592'        '#47197
      LabelPosition = lpLeft
      LabelSpacing = 5
      TabOrder = 3
      Text = ''
    end
    object Panel4: TPanel
      Left = 1
      Top = 433
      Width = 332
      Height = 68
      Align = alBottom
      TabOrder = 4
      object Btn_Save: TButton
        Left = 105
        Top = 1
        Width = 113
        Height = 66
        Align = alLeft
        Caption = #51200#51109#54616#44592
        TabOrder = 0
        OnClick = Btn_SaveClick
      end
      object Btn_Cancel: TButton
        Left = 218
        Top = 1
        Width = 113
        Height = 66
        Align = alClient
        Caption = #51200#51109#52712#49548
        TabOrder = 1
        OnClick = Btn_CancelClick
      end
      object Button1: TButton
        Left = 1
        Top = 1
        Width = 104
        Height = 66
        Align = alLeft
        Caption = #49688#51221#54616#44592
        TabOrder = 2
        OnClick = Button1Click
      end
    end
    object DatePicker1: TDatePicker
      AlignWithMargins = True
      Left = 4
      Top = 375
      Width = 326
      Height = 49
      Margins.Top = 20
      Align = alTop
      Date = 44862.000000000000000000
      DateFormat = 'yyyy/mm/dd'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 5
    end
    object LabeledEdit_Wod2: TLabeledEdit
      AlignWithMargins = True
      Left = 91
      Top = 198
      Width = 239
      Height = 36
      Margins.Left = 90
      Margins.Top = 20
      Align = alTop
      EditLabel.Width = 80
      EditLabel.Height = 28
      EditLabel.Caption = #50868'        '#46041
      Enabled = False
      LabelPosition = lpLeft
      LabelSpacing = 5
      TabOrder = 6
      Text = ''
    end
    object ComboBox_Level: TComboBox
      AlignWithMargins = True
      Left = 4
      Top = 257
      Width = 326
      Height = 36
      Margins.Top = 20
      Align = alTop
      TabOrder = 7
      TextHint = #45212#51060#46020
      Items.Strings = (
        'Rxd'
        'Scale A'
        'Scale B'
        'Scale C'
        'All')
    end
  end
end
