object fLogin_NewPerson: TfLogin_NewPerson
  Left = 0
  Top = 0
  Caption = 'fLogin_NewPerson'
  ClientHeight = 433
  ClientWidth = 371
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 28
  object LabeledEdit_Pw: TLabeledEdit
    AlignWithMargins = True
    Left = 135
    Top = 142
    Width = 233
    Height = 36
    Margins.Left = 135
    Align = alTop
    EditLabel.Width = 120
    EditLabel.Height = 28
    EditLabel.Caption = #48708'   '#48128'   '#48264'  '#54840
    LabelPosition = lpLeft
    LabelSpacing = 10
    PasswordChar = '*'
    TabOrder = 3
    Text = ''
  end
  object LabeledEdit_CheckPw: TLabeledEdit
    AlignWithMargins = True
    Left = 135
    Top = 184
    Width = 233
    Height = 36
    Margins.Left = 135
    Align = alTop
    EditLabel.Width = 120
    EditLabel.Height = 28
    EditLabel.Caption = #48708#48128#48264#54840#54869#51064
    LabelPosition = lpLeft
    LabelSpacing = 10
    PasswordChar = '*'
    TabOrder = 4
    Text = ''
  end
  object Btn_NewPerson: TButton
    Left = 0
    Top = 313
    Width = 371
    Height = 41
    Align = alTop
    Caption = #44032#51077#54616#44592
    TabOrder = 7
    OnClick = Btn_NewPersonClick
  end
  object Btn_Cancel: TButton
    Left = 0
    Top = 354
    Width = 371
    Height = 41
    Align = alTop
    Caption = #52712'       '#49548
    TabOrder = 8
    OnClick = Btn_CancelClick
  end
  object LabeledEdit_Name: TLabeledEdit
    AlignWithMargins = True
    Left = 135
    Top = 100
    Width = 233
    Height = 36
    Margins.Left = 135
    Align = alTop
    EditLabel.Width = 115
    EditLabel.Height = 28
    EditLabel.Caption = #51060'               '#47492
    LabelPosition = lpLeft
    LabelSpacing = 15
    TabOrder = 2
    Text = ''
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 371
    Height = 48
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object LabeledEdit_BoxNum: TLabeledEdit
      AlignWithMargins = True
      Left = 131
      Top = 4
      Width = 145
      Height = 40
      Margins.Left = 130
      Align = alClient
      EditLabel.Width = 110
      EditLabel.Height = 28
      EditLabel.Caption = #48149' '#49828'    '#48264' '#54840
      LabelPosition = lpLeft
      LabelSpacing = 10
      TabOrder = 0
      Text = ''
      ExplicitHeight = 36
    end
    object Btn_CheckBox: TButton
      Left = 279
      Top = 1
      Width = 91
      Height = 46
      Align = alRight
      Caption = #48149#49828#54869#51064
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Btn_CheckBoxClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 48
    Width = 371
    Height = 49
    Align = alTop
    Caption = 'Panel2'
    TabOrder = 1
    object LabeledEdit_Id: TLabeledEdit
      AlignWithMargins = True
      Left = 131
      Top = 4
      Width = 145
      Height = 41
      Margins.Left = 130
      Align = alClient
      EditLabel.Width = 110
      EditLabel.Height = 28
      EditLabel.Caption = #50500'    '#51060'     '#46356' '
      LabelPosition = lpLeft
      LabelSpacing = 10
      TabOrder = 0
      Text = ''
      ExplicitHeight = 36
    end
    object Btn_Check: TButton
      Left = 279
      Top = 1
      Width = 91
      Height = 47
      Align = alRight
      Caption = #51473#48373#54869#51064
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Btn_CheckClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 223
    Width = 371
    Height = 50
    Align = alTop
    Caption = 'Panel3'
    TabOrder = 5
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 110
      Height = 42
      Align = alLeft
      Caption = #49373'  '#45380'  '#50900'  '#51068
      Layout = tlCenter
      ExplicitHeight = 28
    end
    object DatePicker1: TDatePicker
      Left = 117
      Top = 1
      Width = 253
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
    Top = 273
    Width = 371
    Height = 40
    Align = alTop
    Caption = 'Panel4'
    TabOrder = 6
    object Label2: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 110
      Height = 32
      Align = alLeft
      Caption = #49457'              '#48324
      Layout = tlCenter
      ExplicitHeight = 28
    end
    object ComboBox_Gender: TComboBox
      Left = 117
      Top = 1
      Width = 253
      Height = 36
      Align = alClient
      Style = csDropDownList
      TabOrder = 0
      TextHint = #49457#48324
      Items.Strings = (
        #45224#51088
        #50668#51088)
    end
  end
end
