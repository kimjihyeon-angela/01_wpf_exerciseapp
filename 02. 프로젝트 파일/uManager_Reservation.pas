unit uManager_Reservation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls,
  Vcl.WinXPickers, Vcl.ComCtrls, Data.DB, Vcl.DBGrids;

type
  TfManager_Reservation = class(TForm)
    Panel1: TPanel;
    Panel_ReservTime: TPanel;
    ComboBox_Time: TComboBox;
    Label2: TLabel;
    TimePicker1: TTimePicker;
    Btn_SetReservation: TButton;
    Btn_CheckReservation: TButton;
    DatePicker1: TDatePicker;
    Edit_Person: TEdit;
    DBGrid1: TDBGrid;
    Button3: TButton;
    procedure Btn_CheckReservationClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_SetReservationClick(Sender: TObject);
    procedure ComboBox_TimeChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DatePicker1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fManager_Reservation: TfManager_Reservation;

implementation

{$R *.dfm}

uses uDm, uMain;

procedure TfManager_Reservation.Btn_CheckReservationClick(Sender: TObject);
var
  vBoxName : string;
  vTime : string;
begin
  vBoxName := Copy(fMain.Caption, Pos('박스', fMain.Caption)+3, Pos('관리자', fMain.Caption)-4);
  Panel_ReservTime.Visible := True;
  DBGrid1.Visible := True;
  fdm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT * FROM V_Box_Reservation');
  fDm.q.SQL.Add('WHERE Tdate = :Tdate');
  fDm.q.SQL.Add('AND   BoxName = :BoxName');
  fDm.q.ParamByName('Tdate').AsDate := DatePicker1.Date;
  fDm.q.ParamByName('BoxName').AsString := vBoxName;
  fDm.q.Open;


  fDm.q_Reservation.Close;
  fDm.q_Reservation.SQL.Clear;
  fDm.q_Reservation.SQL.Add('SELECT * FROM ManagerReservationTbl');
  fDm.q_Reservation.SQL.Add('WHERE Tdate = :Tdate');
  fDm.q_Reservation.ParamByName('Tdate').AsDate := DatePicker1.Date;
  fDm.q_Reservation.Open;

  fDm.q_Reservation.First;
  ComboBox_Time.Clear;
  while not fDm.q_Reservation.Eof do
  begin
    vTime := TimeToStr(fDm.q_Reservation.FieldByName('Ttime').AsDateTime);
    ComboBox_Time.Items.Add(vTime);
    fDm.q_Reservation.Next;
  end;

end;

procedure TfManager_Reservation.Btn_SetReservationClick(Sender: TObject);
begin
  fDm.q_Reservation.Close;
  fDm.q_Reservation.SQL.Clear;
  fDm.q_Reservation.SQL.Add('INSERT INTO ManagerReservationTbl');
  fDm.q_Reservation.SQL.Add('(Tdate, ReserveCount, Ttime)');
  fDm.q_Reservation.SQL.Add('VALUES ( :Tdate, :ReserveCount, :Ttime)');
  fDm.q_Reservation.ParamByName('Tdate').AsDate := DatePicker1.Date;
  fDm.q_Reservation.ParamByName('ReserveCount').AsInteger := StrToInt(Edit_Person.Text);
  fDm.q_Reservation.ParamByName('Ttime').AsTime := TimePicker1.Time;
  fDm.q_Reservation.ExecSQL;
  ShowMessage('설정이 완료되었습니다.');

end;

procedure TfManager_Reservation.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TfManager_Reservation.ComboBox_TimeChange(Sender: TObject);
var
  vBoxName : string;
begin
  vBoxName := Copy(fMain.Caption, Pos('박스', fMain.Caption)+3, Pos('관리자', fMain.Caption)-4);
  fdm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT * FROM V_Box_Reservation');
  fDm.q.SQL.Add('WHERE Ttime = :Ttime');
  fDm.q.SQL.Add('AND   Tdate = :Tdate');
  fDm.q.SQL.Add('AND   BoxName = :BoxName');
  fDm.q.ParamByName('Ttime').AsTime := StrToTime(ComboBox_Time.Text);
  fDm.q.ParamByName('Tdate').AsDate := DatePicker1.Date;
  fDm.q.ParamByName('BoxName').AsString := vBoxName;
  fDm.q.Open;
end;

procedure TfManager_Reservation.DatePicker1Change(Sender: TObject);
begin
  Btn_CheckReservation.Click;
end;

procedure TfManager_Reservation.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  fManager_Reservation := nil;
end;

procedure TfManager_Reservation.FormCreate(Sender: TObject);
begin
  DatePicker1.Date := Date;
  TimePicker1.Time := StrToTime('9:00');



end;

end.
