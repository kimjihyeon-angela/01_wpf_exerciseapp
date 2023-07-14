object fLogin_My_Person: TfLogin_My_Person
  Left = 0
  Top = 0
  Caption = #45236' '#51221#48372' '#48372#44592
  ClientHeight = 406
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 25
  object LabeledEdit_Pw: TLabeledEdit
    AlignWithMargins = True
    Left = 135
    Top = 120
    Width = 249
    Height = 33
    Margins.Left = 135
    Align = alTop
    EditLabel.Width = 112
    EditLabel.Height = 25
    EditLabel.Caption = #48708'   '#48128'   '#48264'  '#54840
    LabelPosition = lpLeft
    LabelSpacing = 10
    PasswordChar = '*'
    TabOrder = 0
    Text = ''
    ExplicitTop = 149
  end
  object LabeledEdit_CheckPw: TLabeledEdit
    AlignWithMargins = True
    Left = 135
    Top = 159
    Width = 249
    Height = 33
    Margins.Left = 135
    Align = alTop
    EditLabel.Width = 108
    EditLabel.Height = 25
    EditLabel.Caption = #48708#48128#48264#54840#54869#51064
    LabelPosition = lpLeft
    LabelSpacing = 10
    PasswordChar = '*'
    TabOrder = 1
    Text = ''
    ExplicitTop = 188
  end
  object LabeledEdit_Name: TLabeledEdit
    AlignWithMargins = True
    Left = 135
    Top = 81
    Width = 249
    Height = 33
    Margins.Left = 135
    Align = alTop
    EditLabel.Width = 111
    EditLabel.Height = 25
    EditLabel.Caption = #51060'               '#47492
    LabelPosition = lpLeft
    LabelSpacing = 15
    TabOrder = 2
    Text = ''
    ExplicitTop = 98
  end
  object Panel3: TPanel
    Left = 0
    Top = 195
    Width = 387
    Height = 50
    Align = alTop
    Caption = 'Panel3'
    TabOrder = 3
    ExplicitTop = 212
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 102
      Height = 42
      Align = alLeft
      Caption = #49373'  '#45380'  '#50900'  '#51068
      Layout = tlCenter
      ExplicitHeight = 25
    end
    object DatePicker1: TDatePicker
      Left = 109
      Top = 1
      Width = 277
      Height = 48
      Align = alClient
      Date = 44846.000000000000000000
      DateFormat = 'yyyy/mm/dd'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 0
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 245
    Width = 387
    Height = 40
    Align = alTop
    Caption = 'Panel4'
    TabOrder = 4
    ExplicitTop = 262
    object Label2: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 106
      Height = 32
      Align = alLeft
      Caption = #49457'              '#48324
      Layout = tlCenter
      ExplicitHeight = 25
    end
    object ComboBox_Gender: TComboBox
      Left = 113
      Top = 1
      Width = 273
      Height = 33
      Align = alClient
      Style = csDropDownList
      TabOrder = 0
      TextHint = #49457#48324
      Items.Strings = (
        #45224#51088
        #50668#51088)
    end
  end
  object LabeledEdit_Id: TLabeledEdit
    AlignWithMargins = True
    Left = 130
    Top = 42
    Width = 254
    Height = 33
    Margins.Left = 130
    Align = alTop
    EditLabel.Width = 104
    EditLabel.Height = 25
    EditLabel.Caption = #50500'    '#51060'     '#46356' '
    Enabled = False
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 5
    Text = ''
    ExplicitTop = 51
  end
  object LabeledEdit_BoxNum: TLabeledEdit
    AlignWithMargins = True
    Left = 130
    Top = 3
    Width = 254
    Height = 33
    Margins.Left = 130
    Align = alTop
    EditLabel.Width = 102
    EditLabel.Height = 25
    EditLabel.Caption = #48149' '#49828'    '#48264' '#54840
    Enabled = False
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 6
    Text = ''
  end
  object Panel1: TPanel
    Left = 0
    Top = 285
    Width = 387
    Height = 121
    Align = alClient
    TabOrder = 7
    object Button1: TButton
      Left = 1
      Top = 1
      Width = 385
      Height = 41
      Align = alTop
      Caption = #49688#51221#54616#44592
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 1
      Top = 42
      Width = 385
      Height = 41
      Align = alTop
      Caption = #52712'       '#49548
      TabOrder = 1
    end
  end
end
