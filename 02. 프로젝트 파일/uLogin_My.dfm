object fLogin_MyBox: TfLogin_MyBox
  Left = 0
  Top = 0
  Caption = #45236' '#51221#48372' '#48372#44592
  ClientHeight = 441
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 25
  object LabeledEdit_BoxName: TLabeledEdit
    Left = 144
    Top = 181
    Width = 226
    Height = 33
    EditLabel.Width = 112
    EditLabel.Height = 25
    EditLabel.Caption = #48149'  '#49828'     '#51060' '#47492
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 0
    Text = ''
  end
  object LabeledEdit_BoxMaster: TLabeledEdit
    Left = 144
    Top = 230
    Width = 226
    Height = 33
    EditLabel.Width = 110
    EditLabel.Height = 25
    EditLabel.Caption = #48149'  '#49828'  '#52293#51076#51088
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 1
    Text = ''
  end
  object LabeledEdit_BoxMobile: TLabeledEdit
    Left = 144
    Top = 272
    Width = 226
    Height = 33
    EditLabel.Width = 113
    EditLabel.Height = 25
    EditLabel.Caption = #48149#49828' '#45824#54364#48264#54840
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 2
    Text = ''
    TextHint = #51204#54868#48264#54840#47564#51077#47141#54644#51452#49464#50836'.'
  end
  object Button1: TButton
    Left = 16
    Top = 328
    Width = 354
    Height = 41
    Caption = #49688#51221#54616#44592
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 375
    Width = 354
    Height = 41
    Caption = #52712'       '#49548
    TabOrder = 4
    OnClick = Button2Click
  end
  object LabeledEdit_BoxNum: TLabeledEdit
    Left = 144
    Top = 8
    Width = 226
    Height = 33
    EditLabel.Width = 107
    EditLabel.Height = 25
    EditLabel.Caption = #48149'  '#49828'    '#48264' '#54840
    Enabled = False
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 5
    Text = ''
  end
  object LabeledEdit_BoxId: TLabeledEdit
    Left = 144
    Top = 53
    Width = 226
    Height = 33
    EditLabel.Width = 109
    EditLabel.Height = 25
    EditLabel.Caption = #50500'     '#51060'     '#46356' '
    Enabled = False
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 6
    Text = ''
  end
  object LabeledEdit_BoxPw: TLabeledEdit
    Left = 144
    Top = 96
    Width = 226
    Height = 33
    EditLabel.Width = 107
    EditLabel.Height = 25
    EditLabel.Caption = #48708'  '#48128'   '#48264'  '#54840
    LabelPosition = lpLeft
    LabelSpacing = 10
    PasswordChar = '*'
    TabOrder = 7
    Text = ''
  end
  object LabeledEdit_CheckPw: TLabeledEdit
    Left = 144
    Top = 138
    Width = 226
    Height = 33
    EditLabel.Width = 108
    EditLabel.Height = 25
    EditLabel.Caption = #48708#48128#48264#54840#54869#51064
    LabelPosition = lpLeft
    LabelSpacing = 10
    PasswordChar = '*'
    TabOrder = 8
    Text = ''
  end
end
