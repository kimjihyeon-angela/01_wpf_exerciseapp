object fManager_Notice: TfManager_Notice
  Left = 0
  Top = 0
  Caption = #44277#51648#49324#54637#44288#47532' ('#44288#47532#51088')'
  ClientHeight = 424
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 28
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 618
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 145
      Height = 39
      Align = alLeft
      Caption = #44277#51648#49324#54637' '#50732#47532#44592
      Layout = tlCenter
      ExplicitHeight = 28
    end
    object Button1: TButton
      Left = 504
      Top = 1
      Width = 113
      Height = 39
      Align = alRight
      Caption = #46321#47197
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 360
      Top = 1
      Width = 144
      Height = 39
      Align = alRight
      Caption = #51648#45212' '#44277#51648' '#48372#44592
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Memo_Content: TMemo
    Left = 0
    Top = 83
    Width = 618
    Height = 341
    Align = alClient
    TabOrder = 1
  end
  object LabeledEdit_Title: TLabeledEdit
    AlignWithMargins = True
    Left = 80
    Top = 44
    Width = 535
    Height = 36
    Margins.Left = 80
    Align = alTop
    EditLabel.Width = 60
    EditLabel.Height = 28
    EditLabel.Caption = #51228'    '#47785
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 2
    Text = ''
  end
end
