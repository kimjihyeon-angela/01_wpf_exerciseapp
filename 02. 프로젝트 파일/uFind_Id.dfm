object fFind_Id: TfFind_Id
  Left = 0
  Top = 0
  Caption = #50500#51060#46356' '#52286#44592
  ClientHeight = 413
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  TextHeight = 28
  object Panel1: TPanel
    Left = 0
    Top = 321
    Width = 344
    Height = 92
    Align = alBottom
    TabOrder = 0
    object Btn_Find_Id: TButton
      Left = 1
      Top = 1
      Width = 342
      Height = 41
      Align = alTop
      Caption = 'Id '#52286#44592
      TabOrder = 0
      OnClick = Btn_Find_IdClick
    end
    object Btn_Cancel: TButton
      Left = 1
      Top = 42
      Width = 342
      Height = 41
      Align = alTop
      Caption = #52712'       '#49548
      TabOrder = 1
      OnClick = Btn_CancelClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 344
    Height = 73
    Align = alTop
    TabOrder = 1
    object RadioGroup1: TRadioGroup
      Left = 1
      Top = 1
      Width = 342
      Height = 71
      Align = alClient
      Caption = #48149#49828' or  '#44060#51064
      Columns = 2
      Items.Strings = (
        #48149#49828
        #44060#51064)
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 73
    Width = 344
    Height = 248
    Align = alClient
    TabOrder = 2
    object LabeledEdit_BoxNum: TLabeledEdit
      AlignWithMargins = True
      Left = 151
      Top = 11
      Width = 189
      Height = 36
      Margins.Left = 150
      Margins.Top = 10
      Align = alTop
      EditLabel.Width = 125
      EditLabel.Height = 28
      EditLabel.Caption = #48149'  '#49828'     '#48264'  '#54840
      Enabled = False
      LabelPosition = lpLeft
      LabelSpacing = 10
      TabOrder = 0
      Text = ''
    end
    object LabeledEdit_Id: TLabeledEdit
      AlignWithMargins = True
      Left = 151
      Top = 60
      Width = 189
      Height = 36
      Margins.Left = 150
      Margins.Top = 10
      Align = alTop
      EditLabel.Width = 125
      EditLabel.Height = 28
      EditLabel.Caption = #50500'      '#51060'      '#46356' '
      Enabled = False
      LabelPosition = lpLeft
      LabelSpacing = 10
      TabOrder = 1
      Text = ''
    end
    object LabeledEdit_BoxManager: TLabeledEdit
      AlignWithMargins = True
      Left = 151
      Top = 109
      Width = 189
      Height = 36
      Margins.Left = 150
      Margins.Top = 10
      Align = alTop
      EditLabel.Width = 120
      EditLabel.Height = 28
      EditLabel.Caption = #48149#49828'    '#52293#51076#51088
      LabelPosition = lpLeft
      LabelSpacing = 15
      TabOrder = 2
      Text = ''
      Visible = False
    end
    object LabeledEdit_Name: TLabeledEdit
      AlignWithMargins = True
      Left = 151
      Top = 158
      Width = 189
      Height = 36
      Margins.Left = 150
      Margins.Top = 10
      Align = alTop
      EditLabel.Width = 120
      EditLabel.Height = 28
      EditLabel.Caption = #51060'                '#47492
      LabelPosition = lpLeft
      LabelSpacing = 15
      TabOrder = 3
      Text = ''
      Visible = False
    end
    object LabeledEdit_BoxName: TLabeledEdit
      AlignWithMargins = True
      Left = 151
      Top = 298
      Width = 189
      Height = 36
      Margins.Left = 150
      Margins.Top = 10
      Align = alTop
      EditLabel.Width = 120
      EditLabel.Height = 28
      EditLabel.Caption = #48149'  '#49828'    '#51060'  '#47492
      LabelPosition = lpLeft
      LabelSpacing = 15
      TabOrder = 4
      Text = ''
      Visible = False
    end
    object Panel_BirthYear: TPanel
      Left = 1
      Top = 197
      Width = 342
      Height = 50
      Margins.Top = 10
      Align = alTop
      TabOrder = 5
      Visible = False
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
        AlignWithMargins = True
        Left = 120
        Top = 4
        Width = 218
        Height = 42
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
    object Panel_Gender: TPanel
      Left = 1
      Top = 247
      Width = 342
      Height = 41
      Margins.Top = 10
      Align = alTop
      TabOrder = 6
      Visible = False
      object Label2: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 110
        Height = 33
        Align = alLeft
        Caption = #49457'              '#48324
        Layout = tlCenter
        ExplicitHeight = 28
      end
      object ComboBox_Gender: TComboBox
        Left = 117
        Top = 1
        Width = 224
        Height = 36
        Align = alClient
        TabOrder = 0
        TextHint = #49457#48324
        Items.Strings = (
          #45224#51088
          #50668#51088)
      end
    end
  end
end
