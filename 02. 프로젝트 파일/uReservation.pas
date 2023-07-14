unit uReservation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Data.DB, Vcl.DBGrids;

type
  TfReservation = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Panel5: TPanel;
    Button5: TButton;
    Panel4: TPanel;
    Button4: TButton;
    Panel3: TPanel;
    Button3: TButton;
    Panel2: TPanel;
    Button2: TButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    StringGrid4: TStringGrid;
    StringGrid5: TStringGrid;
    Panel6: TPanel;
    Button6: TButton;
    StringGrid6: TStringGrid;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fReservation: TfReservation;
  vName : string;

implementation

{$R *.dfm}

uses uReservation_Check, uDm, uCalendar, uMain;

procedure TfReservation.Button1Click(Sender: TObject);
begin
  vName := Copy(fMain.Caption, Pos(':', fMain.Caption)+2, Length(fMain.Caption));


  // 관리자인 경우 Pos('관리자', fMain.Caption) > 0
  // 관리자가 아닌 경우 Pos('관리자', fMain.Caption) = 0
  // 원래 if fMain.Caption <> '관리자' then

  if Pos('관리자', fMain.Caption) = 0  then
  begin
    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('UPDATE ManagerReservationTbl');
    fDm.q.SQL.Add('SET ReserveCount = :ReserveCount');
    fDm.q.SQL.Add('WHERE Tdate = :Tdate');
    fDm.q.SQL.Add('AND   Ttime = :Ttime');
    fDm.q.ParamByName('ReserveCount').AsInteger := StrToInt(Label1.Caption) -1;
    fDm.q.ParamByName('Tdate').AsDate := StrToDate(fCalendar.Label_YearMonth.Caption);
    fDm.q.ParamByName('Ttime').AsTime := StrToDateTime(StringGrid1.Cells[1,0]);
    fDm.q.ExecSQL;

    fDm.q_Reservation.Close;
    fDm.q_Reservation.SQL.Clear;
    fDm.q_Reservation.SQL.Add('INSERT INTO ReservationTbl (Tdate, Ttime, Name)');
    fDm.q_Reservation.SQL.Add('VALUES (:Tdate, :Ttime, :Name)');
    fDm.q_Reservation.ParamByName('Tdate').AsDate := StrToDate(fCalendar.Label_YearMonth.Caption);
    fDm.q_Reservation.ParamByName('Ttime').AsTime := StrToDateTime(StringGrid1.Cells[1,0]);
    fDm.q_Reservation.ParamByName('Name').AsString := vName;
    fDm.q_Reservation.ExecSQL;

    ShowMessage('예약이 완료되었습니다.');
    fReservation_Check.Caption := StringGrid1.Cells[1,0];
  end

  else
  begin
    fMain.Manager_Reservation.Click;
  end;



//  if fReservation_Check = nil then
//  begin
//    fReservation_Check:=TfReservation_Check.Create(Self);
//    fReservation_Check.showModal;
//  end;
  FormCreate(Self);
end;

procedure TfReservation.Button5Click(Sender: TObject);
begin
  vName := Copy(fMain.Caption, Pos(':', fMain.Caption)+2, Length(fMain.Caption));

  if Pos('관리자', fMain.Caption) = 0  then
  begin
    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('UPDATE ManagerReservationTbl');
    fDm.q.SQL.Add('SET ReserveCount = :ReserveCount');
    fDm.q.SQL.Add('WHERE Tdate = :Tdate');
    fDm.q.SQL.Add('AND   Ttime = :Ttime');
    fDm.q.ParamByName('ReserveCount').AsInteger := StrToInt(Label1.Caption) -1;
    fDm.q.ParamByName('Tdate').AsDate := StrToDate(fCalendar.Label_YearMonth.Caption);
    fDm.q.ParamByName('Ttime').AsTime := StrToDateTime(StringGrid2.Cells[1,0]);
    fDm.q.ExecSQL;

    fDm.q_Reservation.Close;
    fDm.q_Reservation.SQL.Clear;
    fDm.q_Reservation.SQL.Add('INSERT INTO ReservationTbl (Tdate, Ttime, Name)');
    fDm.q_Reservation.SQL.Add('VALUES (:Tdate, :Ttime, :Name)');
    fDm.q_Reservation.ParamByName('Tdate').AsDate := StrToDate(fCalendar.Label_YearMonth.Caption);
    fDm.q_Reservation.ParamByName('Ttime').AsTime := StrToDateTime(StringGrid2.Cells[1,0]);
    fDm.q_Reservation.ParamByName('Name').AsString := vName;
    fDm.q_Reservation.ExecSQL;

    ShowMessage('예약이 완료되었습니다.');
    fReservation_Check.Caption := StringGrid5.Cells[1,0];

    if fReservation_Check = nil then
    begin
      fReservation_Check:=TfReservation_Check.Create(Self);
      fReservation_Check.showModal;
    end;
  end

  else
  begin
    fMain.Manager_Reservation.Click;
  end;



  FormCreate(Self);
end;

procedure TfReservation.Button4Click(Sender: TObject);
begin
  vName := Copy(fMain.Caption, Pos(':', fMain.Caption)+2, Length(fMain.Caption));


  if Pos('관리자', fMain.Caption) = 0  then
  begin
    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('UPDATE ManagerReservationTbl');
    fDm.q.SQL.Add('SET ReserveCount = :ReserveCount');
    fDm.q.SQL.Add('WHERE Tdate = :Tdate');
    fDm.q.SQL.Add('AND   Ttime = :Ttime');
    fDm.q.ParamByName('ReserveCount').AsInteger := StrToInt(Label1.Caption) -1;
    fDm.q.ParamByName('Tdate').AsDate := StrToDate(fCalendar.Label_YearMonth.Caption);
    fDm.q.ParamByName('Ttime').AsTime := StrToDateTime(StringGrid2.Cells[1,0]);
    fDm.q.ExecSQL;

    fDm.q_Reservation.Close;
    fDm.q_Reservation.SQL.Clear;
    fDm.q_Reservation.SQL.Add('INSERT INTO ReservationTbl (Tdate, Ttime, Name)');
    fDm.q_Reservation.SQL.Add('VALUES (:Tdate, :Ttime, :Name)');
    fDm.q_Reservation.ParamByName('Tdate').AsDate := StrToDate(fCalendar.Label_YearMonth.Caption);
    fDm.q_Reservation.ParamByName('Ttime').AsTime := StrToDateTime(StringGrid2.Cells[1,0]);
    fDm.q_Reservation.ParamByName('Name').AsString := vName;
    fDm.q_Reservation.ExecSQL;

    ShowMessage('예약이 완료되었습니다.');
    fReservation_Check.Caption := StringGrid4.Cells[1,0];

    if fReservation_Check = nil then
    begin
      fReservation_Check:=TfReservation_Check.Create(Self);
      fReservation_Check.showModal;
    end;
  end

  else
  begin
    fMain.Manager_Reservation.Click;
  end;


  FormCreate(Self);
end;

procedure TfReservation.Button3Click(Sender: TObject);
begin
  vName := Copy(fMain.Caption, Pos(':', fMain.Caption)+2, Length(fMain.Caption));

  if Pos('관리자', fMain.Caption) = 0  then
  begin
    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('UPDATE ManagerReservationTbl');
    fDm.q.SQL.Add('SET ReserveCount = :ReserveCount');
    fDm.q.SQL.Add('WHERE Tdate = :Tdate');
    fDm.q.SQL.Add('AND   Ttime = :Ttime');
    fDm.q.ParamByName('ReserveCount').AsInteger := StrToInt(Label1.Caption) -1;
    fDm.q.ParamByName('Tdate').AsDate := StrToDate(fCalendar.Label_YearMonth.Caption);
    fDm.q.ParamByName('Ttime').AsTime := StrToDateTime(StringGrid2.Cells[1,0]);
    fDm.q.ExecSQL;

    fDm.q_Reservation.Close;
    fDm.q_Reservation.SQL.Clear;
    fDm.q_Reservation.SQL.Add('INSERT INTO ReservationTbl (Tdate, Ttime, Name)');
    fDm.q_Reservation.SQL.Add('VALUES (:Tdate, :Ttime, :Name)');
    fDm.q_Reservation.ParamByName('Tdate').AsDate := StrToDate(fCalendar.Label_YearMonth.Caption);
    fDm.q_Reservation.ParamByName('Ttime').AsTime := StrToDateTime(StringGrid2.Cells[1,0]);
    fDm.q_Reservation.ParamByName('Name').AsString := vName;
    fDm.q_Reservation.ExecSQL;

    ShowMessage('예약이 완료되었습니다.');
    fReservation_Check.Caption := StringGrid3.Cells[1,0];

    if fReservation_Check = nil then
    begin
      fReservation_Check:=TfReservation_Check.Create(Self);
      fReservation_Check.showModal;
    end;
  end

  else
  begin
    fMain.Manager_Reservation.Click;
  end;


  FormCreate(Self);
end;

procedure TfReservation.Button2Click(Sender: TObject);
begin
  vName := Copy(fMain.Caption, Pos(':', fMain.Caption)+2, Length(fMain.Caption));

  if Pos('관리자', fMain.Caption) = 0  then
  begin
    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('UPDATE ManagerReservationTbl');
    fDm.q.SQL.Add('SET ReserveCount = :ReserveCount');
    fDm.q.SQL.Add('WHERE Tdate = :Tdate');
    fDm.q.SQL.Add('AND   Ttime = :Ttime');
    fDm.q.ParamByName('ReserveCount').AsInteger := StrToInt(Label1.Caption) -1;
    fDm.q.ParamByName('Tdate').AsDate := StrToDate(fCalendar.Label_YearMonth.Caption);
    fDm.q.ParamByName('Ttime').AsTime := StrToDateTime(StringGrid2.Cells[1,0]);
    fDm.q.ExecSQL;

    fDm.q_Reservation.Close;
    fDm.q_Reservation.SQL.Clear;
    fDm.q_Reservation.SQL.Add('INSERT INTO ReservationTbl (Tdate, Ttime, Name)');
    fDm.q_Reservation.SQL.Add('VALUES (:Tdate, :Ttime, :Name)');
    fDm.q_Reservation.ParamByName('Tdate').AsDate := StrToDate(fCalendar.Label_YearMonth.Caption);
    fDm.q_Reservation.ParamByName('Ttime').AsTime := StrToDateTime(StringGrid2.Cells[1,0]);
    fDm.q_Reservation.ParamByName('Name').AsString := vName;
    fDm.q_Reservation.ExecSQL;

    ShowMessage('예약이 완료되었습니다.');
    fReservation_Check.Caption := StringGrid2.Cells[1,0];

    if fReservation_Check = nil then
    begin
      fReservation_Check:=TfReservation_Check.Create(Self);
      fReservation_Check.showModal;
    end;
  end

  else
  begin
    fMain.Manager_Reservation.Click;
  end;


  FormCreate(Self);
end;


procedure TfReservation.Button6Click(Sender: TObject);
begin
  vName := Copy(fMain.Caption, Pos(':', fMain.Caption)+2, Length(fMain.Caption));
  fReservation_Check.Caption := StringGrid2.Cells[1,0];

  if Pos('관리자', fMain.Caption) = 0  then
  begin
    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('UPDATE ManagerReservationTbl');
    fDm.q.SQL.Add('SET ReserveCount = :ReserveCount');
    fDm.q.SQL.Add('WHERE Tdate = :Tdate');
    fDm.q.SQL.Add('AND   Ttime = :Ttime');
    fDm.q.ParamByName('ReserveCount').AsInteger := StrToInt(Label1.Caption) -1;
    fDm.q.ParamByName('Tdate').AsDate := StrToDate(fCalendar.Label_YearMonth.Caption);
    fDm.q.ParamByName('Ttime').AsTime := StrToDateTime(StringGrid2.Cells[1,0]);
    fDm.q.ExecSQL;

    fDm.q_Reservation.Close;
    fDm.q_Reservation.SQL.Clear;
    fDm.q_Reservation.SQL.Add('INSERT INTO ReservationTbl (Tdate, Ttime, Name)');
    fDm.q_Reservation.SQL.Add('VALUES (:Tdate, :Ttime, :Name)');
    fDm.q_Reservation.ParamByName('Tdate').AsDate := StrToDate(fCalendar.Label_YearMonth.Caption);
    fDm.q_Reservation.ParamByName('Ttime').AsTime := StrToDateTime(StringGrid2.Cells[1,0]);
    fDm.q_Reservation.ParamByName('Name').AsString := vName;
    fDm.q_Reservation.ExecSQL;

    ShowMessage('예약이 완료되었습니다.');

    if fReservation_Check = nil then
    begin
      fReservation_Check:=TfReservation_Check.Create(Self);
      fReservation_Check.showModal;
    end;
  end

  else
  begin
    fMain.Manager_Reservation.Click;
  end;


  FormCreate(Self);
end;

procedure TfReservation.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fReservation := nil;
end;

procedure TfReservation.FormCreate(Sender: TObject);
begin
  fCalendar.Label_YearMonth.Caption := DateToStr(Date);
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT * FROM ManagerReservationTbl');
  fDm.q.SQL.Add('WHERE Tdate = :Tdate');
  fDm.q.SQL.Add('ORDER BY Tdate');
  fDm.q.ParamByName('Tdate').AsDate := StrToDate(fCalendar.Label_YearMonth.Caption);
  fDm.q.Open;

  if fDm.q.RecordCount = 1 then
  begin
    Panel1.Visible := True;
  end
  else if fDm.q.RecordCount = 2 then
  begin
    Panel1.Visible := True;
    Panel2.Visible := True;
  end
  else if fDm.q.RecordCount = 3 then
  begin
    Panel1.Visible := True;
    Panel2.Visible := True;
    Panel3.Visible := True;
  end
  else if fDm.q.RecordCount = 4 then
  begin
    Panel1.Visible := True;
    Panel2.Visible := True;
    Panel3.Visible := True;
    Panel4.Visible := True;
  end
  else if fDm.q.RecordCount = 5 then
  begin
    Panel1.Visible := True;
    Panel2.Visible := True;
    Panel3.Visible := True;
    Panel4.Visible := True;
    Panel5.Visible := True;
  end
  else if fDm.q.RecordCount = 6 then
  begin
    Panel1.Visible := True;
    Panel2.Visible := True;
    Panel3.Visible := True;
    Panel4.Visible := True;
    Panel5.Visible := True;
    Panel6.Visible := True;
  end;




  StringGrid1.Cells[0,0] := '시간';
  StringGrid1.Cells[0,1] := '잔여';
  StringGrid2.Cells[0,0] := '시간';
  StringGrid2.Cells[0,1] := '잔여';
  StringGrid3.Cells[0,0] := '시간';
  StringGrid3.Cells[0,1] := '잔여';
  StringGrid4.Cells[0,0] := '시간';
  StringGrid4.Cells[0,1] := '잔여';
  StringGrid5.Cells[0,0] := '시간';
  StringGrid5.Cells[0,1] := '잔여';
  StringGrid6.Cells[0,0] := '시간';
  StringGrid6.Cells[0,1] := '잔여';

  fDm.q_Reservation.Close;
  fDm.q_Reservation.SQL.Clear;
  fDm.q_Reservation.SQL.Add('SELECT * FROM ManagerReservationTbl');
  fDm.q_Reservation.SQL.Add('WHERE Tdate = :Tdate');
//  fDm.q_Reservation.ParamByName('Tdate').AsDate := Date;

//  fDm.q_Reservation.ParamByName('Tdate').AsDate
//  := StrToDate(Copy(fCalendar.Label_YearMonth.Caption,1,4) + '-'
//             + Copy(fCalendar.Label_YearMonth.Caption,7,2) + '-'
//             + Copy(fCalendar.Label_YearMonth.Caption,11,2));

  fDm.q_Reservation.ParamByName('Tdate').AsDate := StrToDate(fCalendar.Label_YearMonth.Caption);
  fDm.q_Reservation.Open;

  fDm.q_Reservation.First;
  while not fDm.q_Reservation.Eof do
  begin
    StringGrid1.Cells[1,0] := fDm.q_Reservation.Fields[2].AsString;
    StringGrid1.Cells[1,1] := fDm.q_Reservation.Fields[1].AsString;
    Label1.Caption := fDm.q_Reservation.Fields[1].AsString;
    fDm.q_Reservation.Next;
    StringGrid2.Cells[1,0] := fDm.q_Reservation.Fields[2].AsString;
    StringGrid2.Cells[1,1] := fDm.q_Reservation.Fields[1].AsString;
    fDm.q_Reservation.Next;
    StringGrid3.Cells[1,0] := fDm.q_Reservation.Fields[2].AsString;
    StringGrid3.Cells[1,1] := fDm.q_Reservation.Fields[1].AsString;
    fDm.q_Reservation.Next;
    StringGrid4.Cells[1,0] := fDm.q_Reservation.Fields[2].AsString;
    StringGrid4.Cells[1,1] := fDm.q_Reservation.Fields[1].AsString;
    fDm.q_Reservation.Next;
    StringGrid5.Cells[1,0] := fDm.q_Reservation.Fields[2].AsString;
    StringGrid5.Cells[1,1] := fDm.q_Reservation.Fields[1].AsString;
    fDm.q_Reservation.Next;
    StringGrid6.Cells[1,0] := fDm.q_Reservation.Fields[2].AsString;
    StringGrid6.Cells[1,1] := fDm.q_Reservation.Fields[1].AsString;
    fDm.q_Reservation.Next;
  end;

  if StrToTime(StringGrid1.Cells[1,0]) < Time then
  begin
    Panel1.Visible := False;
    if  StringGrid1.Cells[2,1] = '0' then
    begin
      Button1.Visible := False;
    end;
  end;


  if StringGrid2.Cells[2,1] = '0' then
  begin
    Button2.Visible := False;
  end;

  if StringGrid3.Cells[2,1] = '0' then
  begin
    Button3.Visible := False;
  end;

  if StringGrid4.Cells[2,1] = '0' then
  begin
    Button4.Visible := False;
  end;

  if StringGrid5.Cells[2,1] = '0' then
  begin
    Button5.Visible := False;
  end;

  if StringGrid6.Cells[2,1] = '0' then
  begin
    Button5.Visible := False;
  end;

end;

end.
