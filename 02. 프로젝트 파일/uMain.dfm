object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'fMain'
  ClientHeight = 453
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 605
    Height = 453
    Align = alClient
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 169
    Top = 116
    object Record_My: TMenuItem
      Caption = #44592#47197
      object N2: TMenuItem
        Caption = #45236' '#44592#47197' '#51077#47141#54616#44592
        OnClick = N2Click
      end
      object Record_Table: TMenuItem
        Caption = #44592#47197' '#54364' '#48372#44592
        OnClick = Record_TableClick
      end
      object Record_Graph: TMenuItem
        Caption = #44592#47197' '#44536#47000#54532' '#48372#44592
        OnClick = Record_GraphClick
      end
    end
    object N5: TMenuItem
      Caption = #50868#46041#45236#50669
      object Callendar: TMenuItem
        Caption = #45804#47141#48372#44592
        OnClick = CallendarClick
      end
    end
    object N6: TMenuItem
      Caption = #45824#54924#48169
      object Competition_Make: TMenuItem
        Caption = #45824#54924' '#47564#46308#44592
        OnClick = Competition_MakeClick
      end
      object N4: TMenuItem
        Caption = #45824#54924' '#44592#47197' '#51077#47141#54616#44592
        OnClick = N4Click
      end
      object Competition_Record: TMenuItem
        Caption = #45824#54924' '#44592#47197' '#48372#44592
        OnClick = Competition_RecordClick
      end
    end
    object N9: TMenuItem
      Caption = #50868#46041#49444#47749
      object Wod: TMenuItem
        Caption = #50724#45720#51032' '#50868#46041
        OnClick = WodClick
      end
      object MyWeight: TMenuItem
        Caption = #45236' '#47924#44172' '#48372#44592
        OnClick = MyWeightClick
      end
    end
    object N12: TMenuItem
      Caption = #53440#51060#47672
      object StopWatch_EMOM: TMenuItem
        Caption = 'EMOM'
        OnClick = StopWatch_EMOMClick
      end
      object StopWatch_ForTime: TMenuItem
        Caption = 'For Time'
        OnClick = StopWatch_ForTimeClick
      end
      object StopWatch_Tabata: TMenuItem
        Caption = 'Tabata'
        OnClick = StopWatch_TabataClick
      end
      object StopWatch_Amrap: TMenuItem
        Caption = 'Amrap'
        OnClick = StopWatch_AmrapClick
      end
    end
    object Notice: TMenuItem
      Caption = #44277#51648#49324#54637
      object Community_All: TMenuItem
        Caption = #44277#51648#49324#54637#48372#44592
        OnClick = Community_AllClick
      end
    end
    object MainMenu_Manager: TMenuItem
      Caption = #44288#47532#51088#47784#46300
      object Manager_Wod: TMenuItem
        Caption = #50868#46041#44288#47532
        OnClick = Manager_WodClick
      end
      object Manager_Reservation: TMenuItem
        Caption = #50696#50557#44288#47532
        OnClick = Manager_ReservationClick
      end
      object Manager_Record: TMenuItem
        Caption = #44592#47197#44288#47532
        OnClick = Manager_RecordClick
      end
      object N3: TMenuItem
        Caption = #44277#51648#49324#54637#44288#47532
        OnClick = N3Click
      end
    end
    object N1: TMenuItem
      Caption = #45236' '#51221#48372
      object N7: TMenuItem
        Caption = #45236' '#51221#48372' '#48372#44592
        OnClick = N7Click
      end
    end
  end
end
