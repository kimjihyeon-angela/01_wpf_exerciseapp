object fStopWatch_EMOM: TfStopWatch_EMOM
  Left = 0
  Top = 0
  Caption = #53440#51060#47672'_EMOM'
  ClientHeight = 424
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
  object Label_Round: TLabel
    Left = 6
    Top = 232
    Width = 111
    Height = 28
    Caption = 'Label_Round'
    Layout = tlCenter
    Visible = False
  end
  object Label_Time: TLabel
    Left = 112
    Top = 232
    Width = 283
    Height = 73
    AutoSize = False
    Caption = 'Label_Time'
    Layout = tlCenter
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 398
    Height = 121
    Align = alTop
    TabOrder = 0
    object Btn_Set: TButton
      Left = 320
      Top = 1
      Width = 77
      Height = 119
      Align = alRight
      Caption = #49444#51221
      TabOrder = 0
      OnClick = Btn_SetClick
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 319
      Height = 119
      Align = alClient
      TabOrder = 1
      ExplicitLeft = -5
      ExplicitTop = 41
      object Label1: TLabel
        Left = 22
        Top = 16
        Width = 47
        Height = 28
        Caption = 'Every'
      end
      object Label2: TLabel
        Left = 122
        Top = 16
        Width = 70
        Height = 28
        Caption = 'Minutes'
      end
      object Label3: TLabel
        Left = 40
        Top = 72
        Width = 29
        Height = 28
        Caption = 'For'
      end
      object Label4: TLabel
        Left = 199
        Top = 72
        Width = 65
        Height = 28
        Caption = 'Rounds'
      end
      object Label6: TLabel
        Left = 259
        Top = 16
        Width = 30
        Height = 28
        Caption = 'Sec'
      end
      object Edit_EveryMin: TEdit
        Left = 75
        Top = 13
        Width = 41
        Height = 36
        NumbersOnly = True
        TabOrder = 0
      end
      object Edit_ForMin: TEdit
        Left = 104
        Top = 69
        Width = 81
        Height = 36
        NumbersOnly = True
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 212
        Top = 13
        Width = 41
        Height = 36
        NumbersOnly = True
        TabOrder = 2
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 398
    Height = 56
    Align = alTop
    TabOrder = 1
    object Label_CheckRound: TLabel
      AlignWithMargins = True
      Left = 225
      Top = 4
      Width = 65
      Height = 48
      Margins.Left = 50
      Align = alLeft
      AutoSize = False
      Caption = 'Label_CheckRound'
      Layout = tlCenter
      Visible = False
      ExplicitLeft = 199
      ExplicitTop = 1
      ExplicitHeight = 54
    end
    object Label5: TLabel
      AlignWithMargins = True
      Left = 101
      Top = 4
      Width = 71
      Height = 48
      Margins.Left = 100
      Align = alLeft
      Caption = 'Round : '
      Layout = tlCenter
      ExplicitHeight = 28
    end
    object Label_TotalRound: TLabel
      Left = 344
      Top = 1
      Width = 53
      Height = 54
      Align = alRight
      AutoSize = False
      Caption = 'Label_TotalRound'
      Layout = tlCenter
      Visible = False
    end
    object Label7: TLabel
      Left = 293
      Top = 1
      Width = 51
      Height = 54
      Align = alClient
      Caption = '  /  '
      Layout = tlCenter
      ExplicitWidth = 28
      ExplicitHeight = 28
    end
  end
end
