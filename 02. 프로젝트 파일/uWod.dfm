object fWod: TfWod
  Left = 0
  Top = 0
  Caption = 'fWod'
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
    Height = 288
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 616
      Height = 28
      Align = alTop
      Caption = '     '#50724#45720#51032' '#50868#46041
      ExplicitWidth = 130
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 29
      Width = 320
      Height = 258
      Align = alLeft
      Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -20
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object DBGrid2: TDBGrid
      Left = 321
      Top = 29
      Width = 296
      Height = 258
      Align = alClient
      Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -20
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 288
    Width = 618
    Height = 136
    Align = alBottom
    Caption = 'Panel2'
    TabOrder = 1
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 616
      Height = 28
      Align = alTop
      Caption = '    '#51452#50836#46041#51089' '#50696#49845#54616#44592
      ExplicitWidth = 185
    end
  end
end
