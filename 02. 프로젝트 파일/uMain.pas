unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls;

type
  TfMain = class(TForm)
    MainMenu1: TMainMenu;
    Record_My: TMenuItem;
    N2: TMenuItem;
    Record_Table: TMenuItem;
    Record_Graph: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Competition_Make: TMenuItem;
    Competition_Record: TMenuItem;
    N9: TMenuItem;
    Wod: TMenuItem;
    MyWeight: TMenuItem;
    N12: TMenuItem;
    StopWatch_EMOM: TMenuItem;
    StopWatch_ForTime: TMenuItem;
    StopWatch_Tabata: TMenuItem;
    Notice: TMenuItem;
    Community_All: TMenuItem;
    Callendar: TMenuItem;
    Panel1: TPanel;
    StopWatch_Amrap: TMenuItem;
    MainMenu_Manager: TMenuItem;
    Manager_Wod: TMenuItem;
    Manager_Reservation: TMenuItem;
    Manager_Record: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N1: TMenuItem;
    N7: TMenuItem;
    procedure N2Click(Sender: TObject);
    procedure Record_TableClick(Sender: TObject);
    procedure Record_GraphClick(Sender: TObject);
    procedure CallendarClick(Sender: TObject);
    procedure Competition_MakeClick(Sender: TObject);
    procedure Competition_RecordClick(Sender: TObject);
    procedure WodClick(Sender: TObject);
    procedure MyWeightClick(Sender: TObject);
    procedure StopWatch_EMOMClick(Sender: TObject);
    procedure StopWatch_ForTimeClick(Sender: TObject);
    procedure StopWatch_TabataClick(Sender: TObject);
    procedure Community_AllClick(Sender: TObject);
    procedure StopWatch_AmrapClick(Sender: TObject);
    procedure Manager_WodClick(Sender: TObject);
    procedure Manager_ReservationClick(Sender: TObject);
    procedure Manager_RecordClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

uses uCalendar, uCommunity_All, uCommunity_My, uCommunity_Write,
  uCompetition_Make, uCompetition_Record, uManager_NotRecord,
  uManager_Reservation, uManager_Wod, uMyWeight, uRecord_Graph, uRecord_My,
  uRecord_Table, uReservation, uReservation_Check, uStopWatch_Tabata,
  uStopWatch_EMOM, uStopWatch_ForTime, uWod, uStopWatch_Amrap, uManager_Notice,
  uManager_Wod2, uCompetition_Rank, uDm, uLogin_My, uLogin_My_Person;

procedure TfMain.StopWatch_AmrapClick(Sender: TObject);
begin
  if fStopWatch_Amrap = nil then
  begin
    fStopWatch_Amrap:=TfStopWatch_Amrap.Create(Self);
    fStopWatch_Amrap.showModal;
  end;
end;

procedure TfMain.CallendarClick(Sender: TObject);
begin
  if fCalendar = nil then
    begin
      fCalendar := TfCalendar.Create(Self);
      fCalendar.Parent := Panel1;
      fCalendar.Align := alClient;
      fCalendar.WindowState := TWindowState.wsMaximized;
      fCalendar.BorderStyle := bsNone;
    end;
    fCalendar.Show;
end;

procedure TfMain.Community_AllClick(Sender: TObject);
begin
  if fCommunity_My = nil then
    begin
      fCommunity_My := TfCommunity_My.Create(Self);
      fCommunity_My.Parent := Panel1;
      fCommunity_My.Align := alClient;
      fCommunity_My.WindowState := TWindowState.wsMaximized;
      fCommunity_My.BorderStyle := bsNone;
    end;
    fCommunity_My.Show;
end;

procedure TfMain.Competition_MakeClick(Sender: TObject);
begin
  if fCompetition_Make = nil then
    begin
      fCompetition_Make := TfCompetition_Make.Create(Self);
      fCompetition_Make.Parent := Panel1;
      fCompetition_Make.Align := alClient;
      fCompetition_Make.WindowState := TWindowState.wsMaximized;
      fCompetition_Make.BorderStyle := bsNone;
    end;
    fCompetition_Make.Show;
end;

procedure TfMain.Competition_RecordClick(Sender: TObject);
begin
  if fCompetition_Rank = nil then
    begin
      fCompetition_Rank := TfCompetition_Rank.Create(Self);
      fCompetition_Rank.Parent := Panel1;
      fCompetition_Rank.Align := alClient;
      fCompetition_Rank.WindowState := TWindowState.wsMaximized;
      fCompetition_Rank.BorderStyle := bsNone;
    end;
    fCompetition_Rank.Show;
end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fMain := nil;
end;

procedure TfMain.MyWeightClick(Sender: TObject);
begin
  if fMyWeight = nil then
    begin
      fMyWeight := TfMyWeight.Create(Self);
      fMyWeight.Parent := Panel1;
      fMyWeight.Align := alClient;
      fMyWeight.WindowState := TWindowState.wsMaximized;
      fMyWeight.BorderStyle := bsNone;
    end;
    fMyWeight.Show;
end;

procedure TfMain.N2Click(Sender: TObject);
begin
  if fRecord_My = nil then
    begin
      fRecord_My := TfRecord_My.Create(Self);
      fRecord_My.Parent := Panel1;
      fRecord_My.Align := alClient;
      fRecord_My.WindowState := TWindowState.wsMaximized;
      fRecord_My.BorderStyle := bsNone;
    end;
    fRecord_My.Show;
end;

procedure TfMain.N3Click(Sender: TObject);
begin
  if fManager_Notice = nil then
  begin
    fManager_Notice := TfManager_Notice.Create(Self);
    fManager_Notice.Parent := Panel1;
    fManager_Notice.Align := alClient;
    fManager_Notice.WindowState := TWindowState.wsMaximized;
    fManager_Notice.BorderStyle := bsNone;
  end;
  fManager_Notice.Show;
end;

procedure TfMain.N4Click(Sender: TObject);
begin
  if fCompetition_Record = nil then
    begin
      fCompetition_Record := TfCompetition_Record.Create(Self);
      fCompetition_Record.Parent := Panel1;
      fCompetition_Record.Align := alClient;
      fCompetition_Record.WindowState := TWindowState.wsMaximized;
      fCompetition_Record.BorderStyle := bsNone;
    end;
    fCompetition_Record.Show;
end;

procedure TfMain.N7Click(Sender: TObject);
begin
  if Pos('박스', fMain.Caption) = 1 then
  begin
    if fLogin_MyBox = nil then
    begin
      fLogin_MyBox:=TfLogin_MyBox.Create(Self);
      fLogin_MyBox.showModal;
    end;
  end
  else
  begin
    if fLogin_My_Person = nil then
    begin
      fLogin_My_Person:=TfLogin_My_Person.Create(Self);
      fLogin_My_Person.showModal;
    end;
  end;

end;

procedure TfMain.Manager_RecordClick(Sender: TObject);
begin
  if fManager_NotRecord = nil then
    begin
      fManager_NotRecord := TfManager_NotRecord.Create(Self);
      fManager_NotRecord.Parent := Panel1;
      fManager_NotRecord.Align := alClient;
      fManager_NotRecord.WindowState := TWindowState.wsMaximized;
      fManager_NotRecord.BorderStyle := bsNone;
    end;
    fManager_NotRecord.Show;
end;

procedure TfMain.Manager_ReservationClick(Sender: TObject);
begin
  if fManager_Reservation = nil then
    begin
      fManager_Reservation := TfManager_Reservation.Create(Self);
      fManager_Reservation.Parent := Panel1;
      fManager_Reservation.Align := alClient;
      fManager_Reservation.WindowState := TWindowState.wsMaximized;
      fManager_Reservation.BorderStyle := bsNone;
    end;
    fManager_Reservation.Show;
end;

procedure TfMain.Manager_WodClick(Sender: TObject);
begin
  if fManager_Wod = nil then
    begin
      fManager_Wod := TfManager_Wod.Create(Self);
      fManager_Wod.Parent := Panel1;
      fManager_Wod.Align := alClient;
      fManager_Wod.WindowState := TWindowState.wsMaximized;
      fManager_Wod.BorderStyle := bsNone;
    end;
    fManager_Wod.Show;
end;

procedure TfMain.Record_GraphClick(Sender: TObject);
begin
  ShowMessage('준비중입니다.');
//  if fRecord_Graph = nil then
//    begin
//      fRecord_Graph := TfRecord_Graph.Create(Self);
//      fRecord_Graph.Parent := Panel1;
//      fRecord_Graph.Align := alClient;
//      fRecord_Graph.WindowState := TWindowState.wsMaximized;
//      fRecord_Graph.BorderStyle := bsNone;
//    end;
//    fRecord_Graph.Show;
end;

procedure TfMain.Record_TableClick(Sender: TObject);
begin
  if fRecord_Table = nil then
    begin
      fRecord_Table := TfRecord_Table.Create(Self);
      fRecord_Table.Parent := Panel1;
      fRecord_Table.Align := alClient;
      fRecord_Table.WindowState := TWindowState.wsMaximized;
      fRecord_Table.BorderStyle := bsNone;
    end;
    fRecord_Table.Show;
end;

procedure TfMain.StopWatch_TabataClick(Sender: TObject);
begin
  ShowMessage('준비중입니다.');
//  if fStopWatch_Tabata = nil then
//  begin
//    fStopWatch_Tabata:=TfStopWatch_Tabata.Create(Self);
//    fStopWatch_Tabata.showModal;
//  end;
end;

procedure TfMain.StopWatch_EMOMClick(Sender: TObject);
begin
  ShowMessage('준비중입니다.');
//  if fStopWatch_EMOM = nil then
//  begin
//    fStopWatch_EMOM:=TfStopWatch_EMOM.Create(Self);
//    fStopWatch_EMOM.showModal;
//  end;
end;

procedure TfMain.StopWatch_ForTimeClick(Sender: TObject);
begin
  if fStopWatch_ForTime = nil then
  begin
    fStopWatch_ForTime:=TfStopWatch_ForTime.Create(Self);
    fStopWatch_ForTime.showModal;
  end;
end;

procedure TfMain.WodClick(Sender: TObject);
begin
  if fWod = nil then
    begin
      fWod := TfWod.Create(Self);
      fWod.Parent := Panel1;
      fWod.Align := alClient;
      fWod.WindowState := TWindowState.wsMaximized;
      fWod.BorderStyle := bsNone;
    end;
    fWod.Show;
end;

end.
