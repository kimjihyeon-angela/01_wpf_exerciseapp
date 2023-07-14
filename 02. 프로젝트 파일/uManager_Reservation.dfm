object fManager_Reservation: TfManager_Reservation
  Left = 0
  Top = 0
  Caption = #50696#50557#44288#47532'('#44288#47532#51088')'
  ClientHeight = 424
  ClientWidth = 645
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
    Width = 645
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 77
      Height = 47
      Margins.Left = 10
      Align = alLeft
      Caption = #49884#44036' '#49444#51221
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 25
    end
    object TimePicker1: TTimePicker
      Left = 291
      Top = 1
      Width = 126
      Height = 47
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 0
      Time = 44839.384748576390000000
      TimeFormat = 'AMPM h:nn'
    end
    object Btn_SetReservation: TButton
      Left = 399
      Top = 1
      Width = 76
      Height = 47
      Align = alRight
      Caption = #49444#51221#54616#44592
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Btn_SetReservationClick
    end
    object Btn_CheckReservation: TButton
      Left = 475
      Top = 1
      Width = 121
      Height = 47
      Align = alRight
      Caption = #50696#50557#51312#54924#54616#44592
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Btn_CheckReservationClick
    end
    object DatePicker1: TDatePicker
      Left = 161
      Top = 1
      Width = 130
      Height = 47
      Align = alLeft
      Date = 44839.000000000000000000
      DateFormat = 'yyyy/mm/dd'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 3
      OnChange = DatePicker1Change
    end
    object Edit_Person: TEdit
      Left = 78
      Top = 1
      Width = 83
      Height = 47
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 4
      TextHint = #50696#50557#51064#50896
      ExplicitHeight = 36
    end
    object Button3: TButton
      Left = 596
      Top = 1
      Width = 48
      Height = 47
      Align = alRight
      Caption = #51333#47308
      TabOrder = 5
      OnClick = Button3Click
    end
  end
  object Panel_ReservTime: TPanel
    Left = 0
    Top = 49
    Width = 645
    Height = 40
    Align = alTop
    TabOrder = 1
    Visible = False
    object ComboBox_Time: TComboBox
      Left = 1
      Top = 1
      Width = 643
      Height = 36
      Margins.Left = 10
      Margins.Top = 10
      Align = alClient
      Style = csDropDownList
      TabOrder = 0
      TextHint = #49884#44036
      OnChange = ComboBox_TimeChange
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 89
    Width = 645
    Height = 335
    Align = alClient
    DataSource = fDm.ds_q
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -20
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Visible = False
  end
end
