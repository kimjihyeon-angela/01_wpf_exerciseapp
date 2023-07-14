object fManager_Wod: TfManager_Wod
  Left = 0
  Top = 0
  Caption = #50868#46041#44288#47532' ('#44288#47532#51088')'
  ClientHeight = 424
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 28
  object Panel_Wod: TPanel
    Left = 425
    Top = 33
    Width = 193
    Height = 350
    Align = alClient
    TabOrder = 0
    Visible = False
    object DBGrid2: TDBGrid
      Left = 1
      Top = 1
      Width = 191
      Height = 348
      Align = alClient
      DataSource = fDm.ds_q
      Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -20
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Visible = False
    end
  end
  object Btn_Re: TButton
    Left = 221
    Top = 383
    Width = 75
    Height = 33
    Caption = #49352#47196#44256#52840
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
    OnClick = Btn_ReClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 383
    Width = 618
    Height = 41
    Align = alBottom
    TabOrder = 2
    Visible = False
    object Panel_NewWod2: TPanel
      Left = 1
      Top = 1
      Width = 422
      Height = 39
      Align = alLeft
      TabOrder = 0
      Visible = False
      object LabeledEdit_NewWod2: TLabeledEdit
        AlignWithMargins = True
        Left = 221
        Top = 4
        Width = 137
        Height = 31
        Margins.Left = 55
        Margins.Right = 10
        Align = alRight
        EditLabel.Width = 40
        EditLabel.Height = 28
        EditLabel.Caption = #50868#46041
        LabelPosition = lpLeft
        LabelSpacing = 10
        TabOrder = 0
        Text = ''
        ExplicitHeight = 36
      end
      object Btn_Set: TButton
        Left = 368
        Top = 1
        Width = 53
        Height = 37
        Align = alRight
        Caption = #54869#51064
        TabOrder = 1
        OnClick = Btn_SetClick
      end
      object ComboBox_Wod1: TComboBox
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 159
        Height = 36
        Align = alClient
        TabOrder = 2
        TextHint = #48516#47448
      end
    end
    object Button1: TButton
      Left = 423
      Top = 1
      Width = 54
      Height = 39
      Align = alLeft
      Caption = #52712#49548
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 618
    Height = 33
    Align = alTop
    TabOrder = 3
    object Btn_NewWod: TButton
      Left = 153
      Top = 1
      Width = 137
      Height = 31
      Align = alLeft
      Caption = #50868#46041' '#52628#44032#54616#44592
      TabOrder = 0
      OnClick = Btn_NewWodClick
    end
    object Button3: TButton
      Left = 290
      Top = 1
      Width = 143
      Height = 31
      Align = alLeft
      Caption = #50868#46041' '#51312#54924#54616#44592
      TabOrder = 1
      OnClick = Button3Click
    end
    object SearchBox1: TSearchBox
      Left = 1
      Top = 1
      Width = 152
      Height = 31
      Align = alLeft
      TabOrder = 2
      TextHint = #50868#46041' '#52286#44592
      OnInvokeSearch = SearchBox1InvokeSearch
      ExplicitHeight = 36
    end
    object Btn_Modify: TButton
      Left = 433
      Top = 1
      Width = 144
      Height = 31
      Align = alLeft
      Caption = #50868#46041' '#49688#51221#54616#44592
      TabOrder = 3
      OnClick = Btn_ModifyClick
    end
    object Button4: TButton
      Left = 569
      Top = 1
      Width = 48
      Height = 31
      Align = alRight
      Caption = #51333#47308
      TabOrder = 4
      OnClick = Button4Click
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 33
    Width = 425
    Height = 350
    Align = alLeft
    Caption = 'Panel4'
    TabOrder = 4
    object TreeView_Wod: TTreeView
      Left = 1
      Top = 1
      Width = 389
      Height = 348
      Align = alClient
      Indent = 19
      MultiSelect = True
      ReadOnly = True
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 389
      Height = 348
      Align = alClient
      DataSource = fDm.ds_Wod
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -20
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Visible = False
      OnCellClick = DBGrid1CellClick
    end
    object Panel2: TPanel
      Left = 390
      Top = 1
      Width = 34
      Height = 348
      Align = alRight
      TabOrder = 2
      object Btn_Insert: TButton
        Left = 3
        Top = 128
        Width = 24
        Height = 25
        Caption = #9654
        TabOrder = 0
        OnClick = Btn_InsertClick
      end
      object Btn_Delete: TButton
        Left = 3
        Top = 159
        Width = 24
        Height = 25
        Caption = #9664
        TabOrder = 1
        OnClick = Btn_DeleteClick
      end
      object Btn_Up: TButton
        Left = 3
        Top = 190
        Width = 24
        Height = 25
        Caption = #55357#56636
        TabOrder = 2
        OnClick = Btn_UpClick
      end
      object Btn_Down: TButton
        Left = 3
        Top = 221
        Width = 24
        Height = 25
        Caption = #55357#56637
        TabOrder = 3
        OnClick = Btn_DownClick
      end
      object Button2: TButton
        Left = 3
        Top = 252
        Width = 24
        Height = 25
        Caption = 'X'
        TabOrder = 4
        OnClick = Button2Click
      end
    end
  end
end
