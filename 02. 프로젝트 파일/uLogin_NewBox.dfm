object fLogin_NewBox: TfLogin_NewBox
  Left = 0
  Top = 0
  Caption = #48149#49828' '#54924#50896#44032#51077
  ClientHeight = 440
  ClientWidth = 379
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 28
  object LabeledEdit_BoxName: TLabeledEdit
    Left = 144
    Top = 181
    Width = 226
    Height = 36
    EditLabel.Width = 120
    EditLabel.Height = 28
    EditLabel.Caption = #48149'  '#49828'     '#51060' '#47492
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 6
    Text = ''
  end
  object LabeledEdit_BoxMaster: TLabeledEdit
    Left = 144
    Top = 230
    Width = 226
    Height = 36
    EditLabel.Width = 120
    EditLabel.Height = 28
    EditLabel.Caption = #48149'  '#49828'  '#52293#51076#51088
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 7
    Text = ''
  end
  object LabeledEdit_BoxMobile: TLabeledEdit
    Left = 144
    Top = 272
    Width = 226
    Height = 36
    EditLabel.Width = 125
    EditLabel.Height = 28
    EditLabel.Caption = #48149#49828' '#45824#54364#48264#54840
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 8
    Text = ''
  end
  object Btn_NewBox: TButton
    Left = 16
    Top = 328
    Width = 354
    Height = 41
    Caption = #44032#51077#54616#44592
    TabOrder = 9
    OnClick = Btn_NewBoxClick
  end
  object Btn_Cancel: TButton
    Left = 16
    Top = 375
    Width = 354
    Height = 41
    Caption = #52712'       '#49548
    TabOrder = 10
    OnClick = Btn_CancelClick
  end
  object LabeledEdit_BoxNum: TLabeledEdit
    Left = 144
    Top = 8
    Width = 145
    Height = 36
    EditLabel.Width = 115
    EditLabel.Height = 28
    EditLabel.Caption = #48149'  '#49828'    '#48264' '#54840
    Enabled = False
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 0
    Text = ''
  end
  object LabeledEdit_BoxId: TLabeledEdit
    Left = 144
    Top = 53
    Width = 145
    Height = 36
    EditLabel.Width = 115
    EditLabel.Height = 28
    EditLabel.Caption = #50500'     '#51060'     '#46356' '
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 2
    Text = ''
  end
  object Btn_Check: TButton
    Left = 295
    Top = 56
    Width = 75
    Height = 34
    Caption = #51473#48373#54869#51064
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Btn_CheckClick
  end
  object LabeledEdit_BoxPw: TLabeledEdit
    Left = 144
    Top = 96
    Width = 226
    Height = 36
    EditLabel.Width = 115
    EditLabel.Height = 28
    EditLabel.Caption = #48708'  '#48128'   '#48264'  '#54840
    LabelPosition = lpLeft
    LabelSpacing = 10
    PasswordChar = '*'
    TabOrder = 4
    Text = ''
  end
  object LabeledEdit_CheckPw: TLabeledEdit
    Left = 144
    Top = 138
    Width = 226
    Height = 36
    EditLabel.Width = 120
    EditLabel.Height = 28
    EditLabel.Caption = #48708#48128#48264#54840#54869#51064
    LabelPosition = lpLeft
    LabelSpacing = 10
    PasswordChar = '*'
    TabOrder = 5
    Text = ''
  end
  object Btn_NewCode: TButton
    Left = 295
    Top = 8
    Width = 75
    Height = 34
    Caption = #48264#54840#48512#50668
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Btn_NewCodeClick
  end
end
