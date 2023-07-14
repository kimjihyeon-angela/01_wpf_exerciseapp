object fRecord_Graph: TfRecord_Graph
  Left = 0
  Top = 0
  Caption = #44592#47197' '#44536#47000#54532' '#48372#44592
  ClientHeight = 424
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 28
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 618
    Height = 57
    Align = alTop
    TabOrder = 0
    object ComboBox_WodName: TComboBox
      AlignWithMargins = True
      Left = 4
      Top = 9
      Width = 459
      Height = 36
      Margins.Top = 8
      Align = alClient
      Style = csDropDownList
      TabOrder = 0
      TextHint = #50868#46041#47749
      OnChange = ComboBox_WodNameChange
    end
    object ComboBox_Period: TComboBox
      AlignWithMargins = True
      Left = 469
      Top = 9
      Width = 145
      Height = 36
      Margins.Top = 8
      Align = alRight
      Style = csDropDownList
      TabOrder = 1
      TextHint = #44592#44036
      Items.Strings = (
        '3'#44060#50900
        '6'#44060#50900
        '12'#44060#50900
        #51204#52404)
    end
  end
  object DBChart1: TDBChart
    Left = 0
    Top = 57
    Width = 618
    Height = 367
    Title.Text.Strings = (
      #49457#51109' '#44536#47000#54532)
    View3D = False
    Align = alClient
    TabOrder = 1
    Visible = False
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 18
    object Series1: TLineSeries
      HoverElement = [heCurrent]
      DataSource = fDm.q_Record
      XLabelsSource = 'Record'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'Tdate'
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series2: TBarSeries
      HoverElement = []
      Active = False
      DataSource = fDm.q_Record
      XLabelsSource = 'Record'
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'Tdate'
    end
  end
end
