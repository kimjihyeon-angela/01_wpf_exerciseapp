object fCalendar: TfCalendar
  Left = 0
  Top = 0
  Caption = #45804#47141#48372#44592
  ClientHeight = 491
  ClientWidth = 913
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
    Width = 913
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label_YearMonth: TLabel
      Left = 16
      Top = 8
      Width = 149
      Height = 28
      Caption = 'Label_YearMonth'
    end
    object Btn_Today: TButton
      Left = 687
      Top = 1
      Width = 86
      Height = 47
      Align = alRight
      Caption = #45804#47141#48372#44592
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Btn_TodayClick
    end
    object Btn_Up: TButton
      Left = 773
      Top = 1
      Width = 49
      Height = 47
      Align = alRight
      Caption = #55357#56636
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Btn_UpClick
    end
    object Btn_Down: TButton
      Left = 822
      Top = 1
      Width = 42
      Height = 47
      Align = alRight
      Caption = #55357#56637
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Btn_DownClick
    end
    object Button1: TButton
      Left = 596
      Top = 1
      Width = 91
      Height = 47
      Align = alRight
      Caption = #50696#50557#54616#44592
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 480
      Top = 1
      Width = 116
      Height = 47
      Align = alRight
      Caption = #50696#50557#54869#51064#54616#44592
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 864
      Top = 1
      Width = 48
      Height = 47
      Align = alRight
      Caption = #51333#47308
      TabOrder = 5
      OnClick = Button3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 635
    Height = 442
    Align = alClient
    TabOrder = 1
    object Sg_Calendar: TStringGrid
      Left = 1
      Top = 1
      Width = 287
      Height = 440
      Align = alClient
      ColCount = 7
      DefaultColWidth = 120
      DefaultRowHeight = 90
      FixedCols = 0
      RowCount = 7
      Options = [goFixedVertLine, goVertLine, goHorzLine, goFixedRowDefAlign]
      TabOrder = 0
      OnDrawCell = Sg_CalendarDrawCell
      OnSelectCell = Sg_CalendarSelectCell
    end
    object Panel_Wod: TPanel
      Left = 288
      Top = 1
      Width = 346
      Height = 440
      Align = alRight
      Caption = 'Wod'
      TabOrder = 1
      Visible = False
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 344
        Height = 438
        Align = alClient
        DataSource = fDm.ds_q
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -20
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
  end
  object Panel_Reservation: TPanel
    Left = 635
    Top = 49
    Width = 278
    Height = 442
    Align = alRight
    TabOrder = 2
    Visible = False
  end
end
