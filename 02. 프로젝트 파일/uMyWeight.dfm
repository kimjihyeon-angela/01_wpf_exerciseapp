object fMyWeight: TfMyWeight
  Left = 0
  Top = 0
  Caption = #45236' '#47924#44172' '#44228#49328#54616#44592
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
    Height = 81
    Align = alTop
    TabOrder = 0
    object LabeledEdit_Get1RM: TLabeledEdit
      AlignWithMargins = True
      Left = 161
      Top = 21
      Width = 120
      Height = 39
      Margins.Left = 160
      Margins.Top = 20
      Margins.Bottom = 20
      Align = alLeft
      EditLabel.Width = 126
      EditLabel.Height = 28
      EditLabel.Caption = '1RM '#51077#47141#54616#44592
      LabelPosition = lpLeft
      LabelSpacing = 20
      TabOrder = 0
      Text = ''
      ExplicitHeight = 36
    end
    object Btn_Calculator: TButton
      Left = 463
      Top = 1
      Width = 97
      Height = 79
      Align = alRight
      Caption = #44228#49328#44592
      TabOrder = 1
      OnClick = Btn_CalculatorClick
    end
    object Btn_GetWeight: TButton
      Left = 366
      Top = 1
      Width = 97
      Height = 79
      Align = alRight
      Caption = #44228#49328#54616#44592
      TabOrder = 2
      OnClick = Btn_GetWeightClick
    end
    object RadioGroup_Gender: TRadioGroup
      Left = 284
      Top = 1
      Width = 82
      Height = 79
      Align = alClient
      Caption = #49457#48324
      Items.Strings = (
        #45224#51088
        #50668#51088)
      TabOrder = 3
    end
    object Button1: TButton
      Left = 560
      Top = 1
      Width = 57
      Height = 79
      Align = alRight
      Caption = #51333#47308
      TabOrder = 4
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 313
    Height = 343
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object Sg_MyWeight: TStringGrid
      Left = 1
      Top = 1
      Width = 311
      Height = 341
      Align = alClient
      ColCount = 2
      DefaultColWidth = 150
      DefaultRowHeight = 25
      RowCount = 15
      FixedRows = 0
      TabOrder = 0
      OnSelectCell = Sg_MyWeightSelectCell
    end
  end
  object Panel3: TPanel
    Left = 313
    Top = 81
    Width = 305
    Height = 343
    Align = alRight
    Caption = 'Panel3'
    TabOrder = 2
    Visible = False
    object Sg_UsingPlate: TStringGrid
      Left = 1
      Top = 1
      Width = 303
      Height = 341
      Align = alClient
      ColCount = 2
      DefaultColWidth = 150
      DefaultRowHeight = 50
      RowCount = 7
      FixedRows = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
end
