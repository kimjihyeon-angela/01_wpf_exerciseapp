object fStopWatch_ForTime: TfStopWatch_ForTime
  Left = 0
  Top = 0
  Caption = #53440#51060#47672'_ForTime'
  ClientHeight = 465
  ClientWidth = 401
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
    Width = 401
    Height = 121
    Align = alTop
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 399
      Height = 119
      Align = alClient
      TabOrder = 0
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 298
        Height = 117
        Align = alClient
        TabOrder = 0
        object LabeledEdit_Time: TLabeledEdit
          AlignWithMargins = True
          Left = 111
          Top = 4
          Width = 183
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
          Width = 296
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
        Left = 299
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
          ExplicitLeft = 5
          ExplicitTop = 54
        end
      end
    end
  end
  object Panel_FrotimeTimer: TPanel
    Left = 0
    Top = 121
    Width = 401
    Height = 344
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -72
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label_CountDown: TLabel
      Left = 40
      Top = 1
      Width = 78
      Height = 96
      Caption = '11'
      Visible = False
    end
    object Label_Min: TLabel
      Left = 57
      Top = 103
      Width = 78
      Height = 96
      Caption = '00'
      Visible = False
    end
    object Label_Sec: TLabel
      Left = 165
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
  end
  object Timer_CountDown: TTimer
    Enabled = False
    OnTimer = Timer_CountDownTimer
    Left = 82
    Top = 178
  end
  object Timer_Up: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer_UpTimer
    Left = 38
    Top = 221
  end
  object Timer_Down: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer_DownTimer
    Left = 160
    Top = 129
  end
end
