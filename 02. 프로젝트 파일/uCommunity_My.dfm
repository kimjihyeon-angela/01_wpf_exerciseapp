object fCommunity_My: TfCommunity_My
  Left = 0
  Top = 0
  Caption = #48149#49828' '#44277#51648#49324#54637' '#48372#44592
  ClientHeight = 508
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 28
  object Label2: TLabel
    Left = 279
    Top = 0
    Width = 57
    Height = 28
    Caption = 'Label2'
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 467
    Width = 788
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 1
      Top = 1
      Width = 786
      Height = 39
      Align = alClient
      Caption = #54869'  '#51064
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 457
    Top = 28
    Width = 331
    Height = 439
    Align = alClient
    Caption = #48149#49828' '#44277#51648#49324#54637
    TabOrder = 1
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 329
      Height = 437
      Align = alClient
      Lines.Strings = (
        'Memo1')
      TabOrder = 0
    end
  end
  object Panel_LastNotice: TPanel
    Left = 0
    Top = 28
    Width = 457
    Height = 439
    Align = alLeft
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 453
      Top = 1
      Height = 437
      Align = alRight
      ExplicitLeft = 360
      ExplicitTop = 168
      ExplicitHeight = 100
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 452
      Height = 437
      Align = alClient
      DataSource = fDm.ds_Notice
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -20
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 788
    Height = 28
    Align = alTop
    TabOrder = 3
    ExplicitLeft = 8
    ExplicitTop = 8
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 208
      Height = 26
      Align = alLeft
      Caption = #44277#51648#49324#54637
    end
    object Button3: TButton
      Left = 728
      Top = 1
      Width = 59
      Height = 26
      Align = alRight
      Caption = #51333#47308
      TabOrder = 0
      OnClick = Button3Click
    end
  end
end
