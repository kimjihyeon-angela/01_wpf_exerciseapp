program 운동기록및성장일지;

uses
  Vcl.Forms,
  Vcl.Controls,
  uRecord_My in 'uRecord_My.pas' {fRecord_My},
  uRecord_Table in 'uRecord_Table.pas' {fRecord_Table},
  uRecord_Graph in 'uRecord_Graph.pas' {fRecord_Graph},
  uCalendar in 'uCalendar.pas' {fCalendar},
  uReservation in 'uReservation.pas' {fReservation},
  uReservation_Check in 'uReservation_Check.pas' {fReservation_Check},
  uCompetition_Make in 'uCompetition_Make.pas' {fCompetition_Make},
  uCompetition_Rank in 'uCompetition_Rank.pas' {fCompetition_Rank},
  uWod in 'uWod.pas' {fWod},
  uMyWeight in 'uMyWeight.pas' {fMyWeight},
  uStopWatch_EMOM in 'uStopWatch_EMOM.pas' {fStopWatch_EMOM},
  uStopWatch_ForTime in 'uStopWatch_ForTime.pas' {fStopWatch_ForTime},
  uStopWatch_Tabata in 'uStopWatch_Tabata.pas' {fStopWatch_Tabata},
  uCommunity_All in 'uCommunity_All.pas' {fCommunity_All},
  uCommunity_Write in 'uCommunity_Write.pas' {fCommunity_Write},
  uCommunity_My in 'uCommunity_My.pas' {fCommunity_My},
  uManager_Reservation in 'uManager_Reservation.pas' {fManager_Reservation},
  uManager_NotRecord in 'uManager_NotRecord.pas' {fManager_NotRecord},
  uMain in 'uMain.pas' {fMain},
  uCalculator in 'uCalculator.pas' {fCalculator},
  uStopWatch_Amrap in 'uStopWatch_Amrap.pas' {fStopWatch_Amrap},
  uManager_Notice in 'uManager_Notice.pas' {fManager_Notice},
  uManager_Wod in 'uManager_Wod.pas' {fManager_Wod},
  uManager_WodSelected in 'uManager_WodSelected.pas' {fManager_WodSelected},
  uDm in 'uDm.pas' {fDm: TDataModule},
  uCompetition_Record in 'uCompetition_Record.pas' {fCompetition_Record},
  uLogin in 'uLogin.pas' {fLogin},
  uLogin_NewBox in 'uLogin_NewBox.pas' {fLogin_NewBox},
  uLogin_NewPerson in 'uLogin_NewPerson.pas' {fLogin_NewPerson},
  uManager_WodSelected2 in 'uManager_WodSelected2.pas' {Form2},
  uLogin_My in 'uLogin_My.pas' {fLogin_MyBox},
  uLogin_My_Person in 'uLogin_My_Person.pas' {fLogin_My_Person},
  uFind_Id in 'uFind_Id.pas' {fFind_Id},
  uFind_Pw in 'uFind_Pw.pas' {fFind_Pw};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfDm, fDm);
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfLogin, fLogin);
  if fLogin.ShowModal = mrOk then Application.Run;
end.
