object fReservation_Check: TfReservation_Check
  Left = 0
  Top = 0
  Caption = #50696#50557#54869#51064#54616#44592
  ClientHeight = 507
  ClientWidth = 385
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
    Width = 385
    Height = 89
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 50
      Height = 28
      Caption = #49884#44036'  '
    end
    object Label_Time: TLabel
      Left = 96
      Top = 8
      Width = 96
      Height = 28
      Caption = 'Label_Time'
    end
    object Label3: TLabel
      Left = 16
      Top = 44
      Width = 40
      Height = 28
      Caption = #50868#46041
    end
    object Label_Wod: TLabel
      Left = 96
      Top = 44
      Width = 96
      Height = 28
      Caption = 'Label_Wod'
    end
    object Panel2: TPanel
      Left = 240
      Top = 1
      Width = 144
      Height = 87
      Align = alRight
      TabOrder = 0
      object Button1: TButton
        Left = 1
        Top = 1
        Width = 142
        Height = 40
        Align = alTop
        Caption = #48320#44221
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 1
        Top = 41
        Width = 142
        Height = 45
        Align = alClient
        Caption = #52636#49437
        TabOrder = 1
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 89
    Width = 385
    Height = 418
    Align = alClient
    TabOrder = 1
  end
end
