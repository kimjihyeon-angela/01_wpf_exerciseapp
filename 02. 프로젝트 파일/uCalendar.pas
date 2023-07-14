unit uCalendar;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.DateUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Data.DB, Vcl.DBGrids;

type
  TfCalendar = class(TForm)
    Panel1: TPanel;
    Btn_Today: TButton;
    Btn_Up: TButton;
    Btn_Down: TButton;
    Label_YearMonth: TLabel;
    Button1: TButton;
    Panel2: TPanel;
    Sg_Calendar: TStringGrid;
    Panel_Wod: TPanel;
    Panel_Reservation: TPanel;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Sg_CalendarDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Btn_TodayClick(Sender: TObject);
    procedure Btn_UpClick(Sender: TObject);
    procedure Btn_DownClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Sg_CalendarSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DrawCalendar(d : TDateTime);

  end;

var
  fCalendar: TfCalendar;
  a : array [1..6] of array [0..6] of TDateTime;
  vDate : TDateTime;

implementation

{$R *.dfm}

uses uReservation, uDm, uMain, uReservation_Check;

{ TfCallendar }

procedure TfCalendar.Btn_DownClick(Sender: TObject);
begin
  vDate := IncMonth(vDate,1);
  drawCalendar(vDate);
end;

procedure TfCalendar.Btn_TodayClick(Sender: TObject);
begin
  vDate := Date;
  drawCalendar(vDate);
  Sg_Calendar.Visible := True;
  Panel_Wod.Visible := False;
  Panel_Reservation.Visible := False;
end;

procedure TfCalendar.Btn_UpClick(Sender: TObject);
begin
  vDate := IncMonth(vDate,-1);
  drawCalendar(vDate);
end;

procedure TfCalendar.Button1Click(Sender: TObject);
begin
  Panel_Reservation.Visible := True;
  if fReservation = nil then
  begin
    fReservation := TfReservation.Create(Self);
    fReservation.Parent := Panel_Reservation;
    fReservation.Align := alClient;
    fReservation.WindowState := TWindowState.wsMaximized;
    fReservation.BorderStyle := bsNone;
  end;
  fReservation.Show;
end;

procedure TfCalendar.Button2Click(Sender: TObject);
begin
//  ShowMessage('준비중입니다.');
  if fReservation_Check = nil then
  begin
    fReservation_Check:=TfReservation_Check.Create(Self);
    fReservation_Check.showModal;
  end;
end;

procedure TfCalendar.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TfCalendar.DrawCalendar(d: TDateTime);
var
  i, j : integer;
  vBoxName : string;
begin
  vBoxName := Copy(fMain.Caption, Pos('박스', fMain.Caption)+3, Pos('관리자', fMain.Caption)-4);
  Label_YearMonth.Caption := FormatDateTime('yyyy-MM-dd', d);
  d := EncodeDate(YearOf(d), MonthOf(d), 1);
  d := d - (DayOfWeek(d)-1);

  for i := 1 to 6 do
  begin
    for j := 0 to 6 do
    begin
      a[i,j] := d;
      fDm.q.Close;
      fDm.q.SQL.Clear;
      fDm.q.SQL.Add('SELECT * FROM WodTbl');
      fDm.q.SQL.Add('WHERE Tdate = :Tdate');
      fDm.q.SQL.Add('AND   BoxName = :BoxName');
      fDm.q.ParamByName('Tdate').AsDate := d;
      fDm.q.ParamByName('BoxName').AsString := vBoxName;
      fDm.q.Open;
      Sg_Calendar.Cells[j,i]
       := DayOf(d).ToString + '|' + fDm.q.FieldByName('Wod2').AsString;
      d := d + 1;
    end;
  end;
end;

procedure TfCalendar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fCalendar := nil;
end;

procedure TfCalendar.FormCreate(Sender: TObject);
begin
  Sg_Calendar.Cells[0,0] := '일요일';
  Sg_Calendar.Cells[1,0] := '월요일';
  Sg_Calendar.Cells[2,0] := '화요일';
  Sg_Calendar.Cells[3,0] := '수요일';
  Sg_Calendar.Cells[4,0] := '목요일';
  Sg_Calendar.Cells[5,0] := '금요일';
  Sg_Calendar.Cells[6,0] := '토요일';
  vDate := Date;
  drawCalendar(vDate);
end;

procedure TfCalendar.Sg_CalendarDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s : string;
begin
  if ARow = 0 then Exit;
  if ACol = 0 then Sg_Calendar.Canvas.Font.Color := clRed;
  if ACol = 6 then Sg_Calendar.Canvas.Font.Color := clBlue;
  if MonthOf(a[ARow,ACol]) <> MonthOf(vdate) then
  begin
    Sg_Calendar.Canvas.Font.Color := clSilver;
  end;
  s := Sg_Calendar.Cells[ACol,ARow];
  Sg_Calendar.Canvas.TextRect
  (Rect, Rect.Left +2, Rect.Top +2, Copy(s,1,Pos('|',s)-1));
  Sg_Calendar.Canvas.Font.Size := Sg_Calendar.Canvas.Font.Size-5;
  Sg_Calendar.Canvas.TextOut(Rect.Left, Rect.Top + 50, Copy(s,Pos('|',s)+1,Length(s)));
end;

procedure TfCalendar.Sg_CalendarSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  s : string;
begin
  Panel_Wod.Visible := True;
  s := Sg_Calendar.Cells[ACol,ARow];
  Delete(s, 1, Pos('|',s));
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT Wod_Detail, Gender, Tlevel, Weight, Count FROM WodTbl');
  fDm.q.SQL.Add('WHERE Wod2 = :Wod2');
  fDm.q.ParamByName('Wod2').AsString := s;
  fDm.q.Open;
end;

end.
