object fStopWatch_Amrap: TfStopWatch_Amrap
  Left = 0
  Top = 0
  Caption = #53440#51060#47672'_Amrap'
  ClientHeight = 440
  ClientWidth = 398
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
    Top = 0
    Width = 398
    Height = 121
    Align = alTop
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 396
      Height = 119
      Align = alClient
      TabOrder = 0
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 295
        Height = 117
        Align = alClient
        TabOrder = 0
        object LabeledEdit_Time: TLabeledEdit
          AlignWithMargins = True
          Left = 111
          Top = 4
          Width = 180
          Height = 36
          Margins.Left = 110
          Align = alTop
          EditLabel.Width = 81
          EditLabel.Height = 28
          EditLabel.Caption = 'Time Cap'
          LabelPosition = lpLeft
          LabelSpacing = 20
          NumbersOnly = True
          TabOrder = 0
          Text = ''
        end
        object RadioGroup_UpDown: TRadioGroup
          Left = 1
          Top = 43
          Width = 293
          Height = 73
          Align = alClient
          Caption = 'Up Or Down'
          Columns = 2
          Items.Strings = (
            'Up'
            'Down')
          TabOrder = 1
        end
      end
      object Panel4: TPanel
        Left = 296
        Top = 1
        Width = 99
        Height = 117
        Align = alRight
        TabOrder = 1
        object Btn_Set: TButton
          Left = 1
          Top = 1
          Width = 97
          Height = 56
          Align = alClient
          Caption = 'START'
          TabOrder = 0
          OnClick = Btn_SetClick
        end
        object Btn_Reset: TButton
          Left = 1
          Top = 57
          Width = 97
          Height = 59
          Align = alBottom
          Caption = 'Reset'
          TabOrder = 1
          OnClick = Btn_ResetClick
        end
      end
    end
  end
  object Panel_AmrapTimer: TPanel
    Left = 0
    Top = 121
    Width = 398
    Height = 319
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -72
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object Label_Min: TLabel
      Left = 57
      Top = 103
      Width = 78
      Height = 96
      Caption = '00'
      Visible = False
    end
    object Label_Sec: TLabel
      Left = 163
      Top = 103
      Width = 78
      Height = 96
      Caption = '00'
      Visible = False
    end
    object Label_MSec: TLabel
      Left = 269
      Top = 103
      Width = 78
      Height = 96
      Caption = '00'
      Visible = False
    end
    object Label1: TLabel
      Left = 143
      Top = 95
      Width = 16
      Height = 96
      Caption = ':'
      Visible = False
    end
    object Label2: TLabel
      Left = 249
      Top = 95
      Width = 16
      Height = 96
      Caption = ':'
      Visible = False
    end
    object Label_CountDown: TLabel
      Left = 137
      Top = 16
      Width = 78
      Height = 96
      Caption = '11'
      Layout = tlCenter
      Visible = False
    end
  end
  object Timer_10to0: TTimer
    Enabled = False
    OnTimer = Timer_10to0Timer
    Left = 28
    Top = 138
  end
  object Timer_Up: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer_UpTimer
    Left = 32
    Top = 238
  end
  object Timer_Down: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer_DownTimer
    Left = 32
    Top = 337
  end
end
