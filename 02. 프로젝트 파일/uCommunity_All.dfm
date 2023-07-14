object fCommunity_All: TfCommunity_All
  Left = 0
  Top = 0
  Caption = #52964#48036#45768#54000
  ClientHeight = 424
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 28
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 618
    Height = 41
    Align = alTop
    TabOrder = 0
    object Btn_AllWriting: TButton
      Left = 129
      Top = 1
      Width = 136
      Height = 39
      Align = alLeft
      Caption = #51204#52404' '#44544' '#48372#44592
      TabOrder = 0
      OnClick = Btn_AllWritingClick
      ExplicitLeft = 289
    end
    object Btn_Write: TButton
      Left = 1
      Top = 1
      Width = 128
      Height = 39
      Align = alLeft
      Caption = #44544#50416#44592
      TabOrder = 1
      OnClick = Btn_WriteClick
    end
    object Button1: TButton
      Left = 464
      Top = 1
      Width = 153
      Height = 39
      Align = alRight
      Caption = #44277#51648#49324#54637#48372#44592
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object Panel_Write: TPanel
    Left = 0
    Top = 41
    Width = 618
    Height = 383
    Align = alClient
    TabOrder = 1
    object Panel_Video: TPanel
      Left = 1
      Top = 1
      Width = 616
      Height = 176
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 5
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 614
        Height = 28
        Align = alTop
        Caption = '     '#46041#50689#49345' '#48372#44592
        ExplicitWidth = 130
      end
      object Panel2: TPanel
        Left = 1
        Top = 136
        Width = 614
        Height = 39
        Align = alBottom
        TabOrder = 0
        object Btn_Up: TButton
          Left = 522
          Top = 1
          Width = 49
          Height = 37
          Align = alRight
          Caption = #55357#56636
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -22
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitLeft = 524
          ExplicitTop = 112
          ExplicitHeight = 63
        end
        object Btn_Down: TButton
          Left = 571
          Top = 1
          Width = 42
          Height = 37
          Align = alRight
          Caption = #55357#56637
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -22
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          ExplicitLeft = 627
          ExplicitHeight = 47
        end
      end
    end
    object Panel_Writing: TPanel
      Left = 1
      Top = 177
      Width = 616
      Height = 205
      Align = alClient
      TabOrder = 1
      object Label2: TLabel
        Left = 1
        Top = 1
        Width = 614
        Height = 28
        Align = alTop
        Caption = '     '#44544' '#48372#44592
        ExplicitWidth = 90
      end
      object Panel3: TPanel
        Left = 1
        Top = 168
        Width = 614
        Height = 36
        Align = alBottom
        TabOrder = 0
        object Button2: TButton
          Left = 522
          Top = 1
          Width = 49
          Height = 34
          Align = alRight
          Caption = #55357#56636
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -22
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitHeight = 39
        end
        object Button3: TButton
          Left = 571
          Top = 1
          Width = 42
          Height = 34
          Align = alRight
          Caption = #55357#56637
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -22
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          ExplicitHeight = 39
        end
      end
    end
  end
end
