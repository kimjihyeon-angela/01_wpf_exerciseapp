object fCommunity_Write: TfCommunity_Write
  Left = 0
  Top = 0
  Caption = #52964#48036#45768#54000'_'#44544#50416#44592
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
    Height = 49
    Align = alTop
    TabOrder = 0
    object Btn_Cancel: TButton
      Left = 489
      Top = 1
      Width = 128
      Height = 47
      Align = alRight
      Caption = #52712#49548
      TabOrder = 0
      OnClick = Btn_CancelClick
    end
    object Btn_Save: TButton
      Left = 361
      Top = 1
      Width = 128
      Height = 47
      Align = alRight
      Caption = #51200#51109
      TabOrder = 1
    end
    object Btn_AddVideo: TButton
      Left = 217
      Top = 1
      Width = 144
      Height = 47
      Align = alRight
      Caption = #46041#50689#49345#52392#48512
      TabOrder = 2
      OnClick = Btn_AddVideoClick
    end
  end
  object Memo_Writing: TMemo
    Left = 0
    Top = 49
    Width = 618
    Height = 375
    Align = alClient
    Lines.Strings = (
      '')
    TabOrder = 1
  end
  object OpenDialog1: TOpenDialog
    Left = 308
    Top = 192
  end
end
