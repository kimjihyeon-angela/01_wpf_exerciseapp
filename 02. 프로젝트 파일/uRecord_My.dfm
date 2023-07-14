object fRecord_My: TfRecord_My
  Left = 0
  Top = 0
  Caption = #44592#47197' '#51077#47141#54616#44592
  ClientHeight = 545
  ClientWidth = 985
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
    Width = 985
    Height = 345
    Align = alClient
    TabOrder = 0
    object Panel_ScaleWod: TPanel
      Left = 473
      Top = 49
      Width = 511
      Height = 295
      Align = alClient
      TabOrder = 0
      object Label_Scale: TLabel
        Left = 1
        Top = 1
        Width = 509
        Height = 28
        Align = alTop
        Caption = 'Scale'
        ExplicitWidth = 45
      end
      object Label_All: TLabel
        Left = 1
        Top = 29
        Width = 509
        Height = 28
        Align = alTop
        Caption = 'All'
        Visible = False
        ExplicitWidth = 23
      end
      object DBGrid2: TDBGrid
        Left = 1
        Top = 57
        Width = 509
        Height = 237
        Align = alClient
        DataSource = fDm.ds_Wod_Scale
        Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -20
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object Panel_RxdWod: TPanel
      Left = 1
      Top = 49
      Width = 472
      Height = 295
      Align = alLeft
      TabOrder = 1
      object Label_Rxd: TLabel
        Left = 1
        Top = 1
        Width = 470
        Height = 28
        Align = alTop
        Caption = 'Rxd'
        ExplicitWidth = 33
      end
      object DBGrid1: TDBGrid
        Left = 1
        Top = 29
        Width = 470
        Height = 265
        Align = alClient
        DataSource = fDm.ds_Wod_Rxd
        Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -20
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 983
      Height = 48
      Align = alTop
      TabOrder = 2
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 105
        Height = 46
        Align = alLeft
        Caption = #50724#45720#51032' '#50868#46041
        Layout = tlCenter
        ExplicitHeight = 28
      end
      object Label2: TLabel
        Left = 176
        Top = 8
        Width = 57
        Height = 28
        Caption = 'Label2'
        Visible = False
      end
      object DatePicker1: TDatePicker
        Left = 692
        Top = 1
        Width = 215
        Height = 46
        Align = alRight
        Date = 44854.000000000000000000
        DateFormat = 'yyyy/mm/dd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = []
        TabOrder = 0
        OnChange = DatePicker1Change
      end
      object Button1: TButton
        Left = 907
        Top = 1
        Width = 75
        Height = 46
        Align = alRight
        Caption = #51333#47308
        TabOrder = 1
        OnClick = Button1Click
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 345
    Width = 985
    Height = 200
    Align = alBottom
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 168
      Height = 198
      Align = alLeft
      TabOrder = 0
      object RadioGroup1: TRadioGroup
        Left = 1
        Top = 1
        Width = 166
        Height = 196
        Align = alClient
        Caption = #45212#51060#46020' '#49444#51221
        Items.Strings = (
          'Rxd'
          'Scale A'
          'Scale B'
          'Scale C'
          'All')
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 627
      Top = 1
      Width = 357
      Height = 198
      Align = alClient
      TabOrder = 1
      object Label4: TLabel
        Left = 1
        Top = 1
        Width = 355
        Height = 28
        Align = alTop
        Caption = #44592#47197' '#51077#47141#54616#44592
        ExplicitWidth = 125
      end
      object LabeledEdit_Record: TLabeledEdit
        AlignWithMargins = True
        Left = 151
        Top = 69
        Width = 202
        Height = 36
        Margins.Left = 150
        Margins.Top = 40
        Align = alTop
        EditLabel.Width = 125
        EditLabel.Height = 28
        EditLabel.Caption = #44592#47197' '#51077#47141#54616#44592
        LabelPosition = lpLeft
        LabelSpacing = 20
        TabOrder = 0
        Text = ''
      end
      object Btn_Check: TButton
        Left = 1
        Top = 156
        Width = 355
        Height = 41
        Align = alBottom
        Caption = #54869#51064
        TabOrder = 1
        OnClick = Btn_CheckClick
        ExplicitLeft = 2
      end
    end
    object Panel6: TPanel
      Left = 169
      Top = 1
      Width = 458
      Height = 198
      Align = alLeft
      TabOrder = 2
      object LabeledEdit_Name: TLabeledEdit
        AlignWithMargins = True
        Left = 101
        Top = 7
        Width = 353
        Height = 36
        Margins.Left = 100
        Margins.Top = 6
        Align = alTop
        EditLabel.Width = 80
        EditLabel.Height = 28
        EditLabel.Caption = #51060'        '#47492
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 0
        Text = ''
      end
      object LabeledEdit_Mobile: TLabeledEdit
        AlignWithMargins = True
        Left = 101
        Top = 52
        Width = 353
        Height = 36
        Margins.Left = 100
        Margins.Top = 6
        Align = alTop
        EditLabel.Width = 80
        EditLabel.Height = 28
        EditLabel.Caption = #48264'        '#54840
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 1
        Text = ''
      end
      object LabeledEdit_BirthYear: TLabeledEdit
        AlignWithMargins = True
        Left = 101
        Top = 97
        Width = 353
        Height = 36
        Margins.Left = 100
        Margins.Top = 6
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
      object LabeledEdit_Gender: TLabeledEdit
        AlignWithMargins = True
        Left = 101
        Top = 142
        Width = 353
        Height = 36
        Margins.Left = 100
        Margins.Top = 6
        Align = alTop
        EditLabel.Width = 80
        EditLabel.Height = 28
        EditLabel.Caption = #49457'        '#48324
        Enabled = False
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 3
        Text = ''
      end
    end
  end
end
