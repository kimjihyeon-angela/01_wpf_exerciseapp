object fDm: TfDm
  Height = 1080
  Width = 1440
  PixelsPerInch = 144
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=projectDB'
      'User_Name=jhkim'
      'Password=1111'
      'Server=192.168.0.79'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 168
    Top = 96
  end
  object q_Wod: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT Tdate, Wod2, Round, TimeCap FROM WodTbl')
    Left = 168
    Top = 200
  end
  object ds_Wod: TDataSource
    DataSet = q_Wod
    Left = 264
    Top = 200
  end
  object q_Notice: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM NoticeTbl')
    Left = 168
    Top = 304
  end
  object ds_Notice: TDataSource
    DataSet = q_Notice
    Left = 264
    Top = 304
  end
  object q_Competition: TFDQuery
    Active = True
    OnCalcFields = q_CompetitionCalcFields
    Connection = FDConnection1
    SQL.Strings = (
      'select * from CompetitionMakeTbl')
    Left = 168
    Top = 408
  end
  object ds_Competition: TDataSource
    DataSet = q_Competition
    Left = 264
    Top = 408
  end
  object q_Reservation: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select a.Name, b.Tdate, b.Ttime from ReservationTbl as A'
      'inner join ManagerReservationTbl as B'
      #9'on a.Tdate = b.Tdate')
    Left = 400
    Top = 304
  end
  object ds_Reservation: TDataSource
    DataSet = q_Reservation
    Left = 488
    Top = 304
  end
  object q_BoxName: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select BoxName From BoxManagementTbl')
    Left = 400
    Top = 408
  end
  object ds_BoxName: TDataSource
    DataSet = q_BoxName
    Left = 496
    Top = 408
  end
  object ds_q: TDataSource
    DataSet = q
    Left = 480
    Top = 200
  end
  object q: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from WodTbl')
    Left = 400
    Top = 200
  end
  object ds_Record: TDataSource
    DataSet = q_Record
    Left = 480
    Top = 104
  end
  object q_Record: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from V_Record')
    Left = 400
    Top = 104
  end
  object q_Wod_Rxd: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT Wod_Detail, Round, Gender, Weight, Count, Record FROM Wod' +
        'Tbl'
      'WHERE Tlevel = '#39'Rxd'#39
      'ORDER BY Tdate')
    Left = 632
    Top = 112
  end
  object ds_Wod_Rxd: TDataSource
    DataSet = q_Wod_Rxd
    Left = 712
    Top = 112
  end
  object q_Wod_Scale: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT Wod_Detail, Round, Tlevel, Gender, Weight, Count, Record ' +
        'FROM WodTbl'
      'WHERE Tlevel like '#39'Scale %'#39
      'ORDER BY Tdate')
    Left = 640
    Top = 208
  end
  object ds_Wod_Scale: TDataSource
    DataSet = q_Wod_Scale
    Left = 720
    Top = 208
  end
  object q_NewCode: TFDQuery
    Connection = FDConnection1
    Left = 632
    Top = 304
  end
  object ds_NewCode: TDataSource
    DataSet = q_NewCode
    Left = 736
    Top = 304
  end
  object q_Login: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM V_Login')
    Left = 632
    Top = 400
  end
  object ds_Login: TDataSource
    DataSet = q_Login
    Left = 736
    Top = 400
  end
  object q_FindId: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM V_Find_Id')
    Left = 160
    Top = 504
  end
  object ds_FindId: TDataSource
    DataSet = q_FindId
    Left = 264
    Top = 504
  end
end
