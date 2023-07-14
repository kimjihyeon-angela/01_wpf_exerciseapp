object fFind_Pw: TfFind_Pw
  Left = 0
  Top = 0
  Caption = #48708#48128#48264#54840' '#51116#49444#51221
  ClientHeight = 424
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 28
  object LabeledEdit_BoxNum: TLabeledEdit
    AlignWithMargins = True
    Left = 150
    Top = 74
    Width = 183
    Height = 36
    Margins.Left = 150
    Margins.Top = 10
    Align = alTop
    EditLabel.Width = 125
    EditLabel.Height = 28
    EditLabel.Caption = #48149'  '#49828'     '#48264'  '#54840
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 0
    Text = ''
  end
  object LabeledEdit_Id: TLabeledEdit
    AlignWithMargins = True
    Left = 150
    Top = 123
    Width = 183
    Height = 36
    Margins.Left = 150
    Margins.Top = 10
    Align = alTop
    EditLabel.Width = 125
    EditLabel.Height = 28
    EditLabel.Caption = #50500'      '#51060'      '#46356' '
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 1
    Text = ''
  end
  object LabeledEdit_Name: TLabeledEdit
    AlignWithMargins = True
    Left = 150
    Top = 172
    Width = 183
    Height = 36
    Margins.Left = 150
    Margins.Top = 10
    Align = alTop
    EditLabel.Width = 130
    EditLabel.Height = 28
    EditLabel.Caption = #51060'                  '#47492
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 2
    Text = ''
  end
  object Button1: TButton
    Left = 0
    Top = 211
    Width = 336
    Height = 38
    Align = alTop
    Caption = #54869#51064#54616#44592
    TabOrder = 3
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 0
    Width = 336
    Height = 64
    Align = alTop
    Caption = #48149#49828' or  '#44060#51064
    Columns = 2
    Items.Strings = (
      #48149#49828
      #44060#51064)
    TabOrder = 4
    ExplicitLeft = 1
    ExplicitTop = -3
  end
  object Panel_Reset: TPanel
    Left = 0
    Top = 249
    Width = 336
    Height = 175
    Align = alClient
    TabOrder = 5
    Visible = False
    object LabeledEdit_Pw: TLabeledEdit
      AlignWithMargins = True
      Left = 151
      Top = 11
      Width = 181
      Height = 36
      Margins.Left = 150
      Margins.Top = 10
      Align = alTop
      EditLabel.Width = 125
      EditLabel.Height = 28
      EditLabel.Caption = #48708'  '#48128'     '#48264'  '#54840
      LabelPosition = lpLeft
      LabelSpacing = 10
      PasswordChar = '*'
      TabOrder = 0
      Text = ''
    end
    object LabeledEdit_CheckPw: TLabeledEdit
      AlignWithMargins = True
      Left = 151
      Top = 60
      Width = 181
      Height = 36
      Margins.Left = 150
      Margins.Top = 10
      Align = alTop
      EditLabel.Width = 125
      EditLabel.Height = 28
      EditLabel.Caption = #48708#48128#48264#54840' '#54869#51064
      LabelPosition = lpLeft
      LabelSpacing = 10
      PasswordChar = '*'
      TabOrder = 1
      Text = ''
    end
    object Panel1: TPanel
      Left = 1
      Top = 99
      Width = 334
      Height = 75
      Align = alClient
      Caption = 'Panel1'
      TabOrder = 2
      object Button_Modify: TButton
        Left = 1
        Top = 1
        Width = 176
        Height = 73
        Align = alLeft
        Caption = #49688#51221
        TabOrder = 0
        OnClick = Button_ModifyClick
      end
      object Button_Cancel: TButton
        Left = 177
        Top = 1
        Width = 156
        Height = 73
        Align = alClient
        Caption = #52712#49548
        TabOrder = 1
        OnClick = Button_CancelClick
      end
    end
  end
end
