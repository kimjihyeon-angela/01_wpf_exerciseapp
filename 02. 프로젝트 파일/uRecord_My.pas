unit uRecord_My;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.WinXPickers, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.WinXCalendars;

type
  TfRecord_My = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel_ScaleWod: TPanel;
    Panel_RxdWod: TPanel;
    Label_Rxd: TLabel;
    Label_Scale: TLabel;
    RadioGroup1: TRadioGroup;
    Label4: TLabel;
    LabeledEdit_Record: TLabeledEdit;
    Btn_Check: TButton;
    Panel5: TPanel;
    DatePicker1: TDatePicker;
    Label1: TLabel;
    Label2: TLabel;
    Panel6: TPanel;
    LabeledEdit_Name: TLabeledEdit;
    LabeledEdit_Mobile: TLabeledEdit;
    LabeledEdit_BirthYear: TLabeledEdit;
    LabeledEdit_Gender: TLabeledEdit;
    Label_All: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure DatePicker1Change(Sender: TObject);
    procedure Btn_CheckClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRecord_My: TfRecord_My;

implementation

{$R *.dfm}

uses uRecord_Table, uMain, uDm;

procedure TfRecord_My.Btn_CheckClick(Sender: TObject);
begin
  fDm.q_Record.Close;
  fDm.q_Record.SQL.Clear;
  fDm.q_Record.SQL.Add('INSERT INTO RecordTbl');
  fDm.q_Record.SQL.Add('(Name, Wod2, Tlevel, Record, Tdate)');
  fDm.q_Record.SQL.Add('VALUES (:Name, :Wod2, :Tlevel, :Record, :Tdate)');
  fDm.q_Record.ParamByName('Name').AsString := LabeledEdit_Name.Text;
  fDm.q_Record.ParamByName('Wod2').AsString := Label2.Caption;
  fDm.q_Record.ParamByName('Record').AsString := LabeledEdit_Record.Text;
  fDm.q_Record.ParamByName('Tdate').AsDate := DatePicker1.Date;

  case RadioGroup1.ItemIndex of
  0 : fDm.q_Record.ParamByName('Tlevel').AsString := 'Rxd';
  1 : fDm.q_Record.ParamByName('Tlevel').AsString := 'Scale A';
  2 : fDm.q_Record.ParamByName('Tlevel').AsString := 'Scale B';
  3 : fDm.q_Record.ParamByName('Tlevel').AsString := 'Scale C';
  4 : fDm.q_Record.ParamByName('Tlevel').AsString := 'ALL';
  end;

  if RadioGroup1.ItemIndex = -1 then
  begin
    ShowMessage('난이도를 설정해주세요.');
    RadioGroup1.SetFocus;
    Exit;
  end;
  if LabeledEdit_Record.Text = '' then
  begin
    ShowMessage('기록을 입력하세요.');
    LabeledEdit_Record.SetFocus;
  end;

  fDm.q_Record.ExecSQL;
  ShowMessage('입력되었습니다.');
  LabeledEdit_Record.Clear;
  RadioGroup1.ItemIndex := -1;
end;

procedure TfRecord_My.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfRecord_My.DatePicker1Change(Sender: TObject);
begin
  fDm.q_Wod_Rxd.Close;
  fDm.q_Wod_Rxd.SQL.Clear;
  fDm.q_Wod_Rxd.SQL.Add('SELECT Wod2, Wod_Detail, Round, Gender, Weight, Count, Record FROM WodTbl');
  fDm.q_Wod_Rxd.SQL.Add('WHERE Tdate = :Tdate');
  fDm.q_Wod_Rxd.SQL.Add('AND   Tlevel = ''Rxd''');
  fDm.q_Wod_Rxd.SQL.Add('ORDER BY Gender');
  fDm.q_Wod_Rxd.ParamByName('Tdate').AsDate := DatePicker1.Date;
  fDm.q_Wod_Rxd.Open;

  if fDm.q_Wod_Rxd.FieldByName('Record').AsInteger = 0 then
  begin
    LabeledEdit_Record.Enabled := False;
  end
  else
  begin
    LabeledEdit_Record.Enabled := True;
  end;

  Label2.Caption := fDm.q_Wod_Rxd.FieldByName('Wod2').AsString;

  fDm.q_Wod_Scale.Close;
  fDm.q_Wod_Scale.SQL.Clear;
  fDm.q_Wod_Scale.SQL.Add('SELECT Wod2, Wod_Detail, Round, Gender, Weight, Count, Record FROM WodTbl');
  fDm.q_Wod_Scale.SQL.Add('WHERE Tdate = :Tdate');
  fDm.q_Wod_Scale.SQL.Add('AND   Tlevel <> ''Rxd''');
  fDm.q_Wod_Scale.SQL.Add('ORDER BY Gender');
  fDm.q_Wod_Scale.ParamByName('Tdate').AsDate := DatePicker1.Date;
  fDm.q_Wod_Scale.Open;

  if fDm.q_Wod_Scale.FieldByName('Record').AsInteger = 0 then
  begin
    LabeledEdit_Record.Enabled := False;
  end
  else
  begin
    LabeledEdit_Record.Enabled := True;
  end;

  Label2.Caption := fDm.q_Wod_Scale.FieldByName('Wod2').AsString;
//  for i := 0 to StringGrid1.RowCount-1 do
//  begin
//    StringGrid1.Rows[i].Clear;
//  end;
//  for i := 0 to StringGrid2.RowCount-1 do
//  begin
//    StringGrid1.Rows[i].Clear;
//  end;
//  while not fDm.Q.Eof do
//  begin
//    if fDm.q.FieldByName('Tlevel').AsString = 'ALL' then
//    begin
//      Panel_ScaleWod.Visible := True;
//      StringGrid2.Cells[0,vRowCount] := fDm.Q.Fields[4].AsString;
//      StringGrid2.Cells[1,vRowCount] := fDm.Q.Fields[2].AsString;
//      StringGrid2.Cells[2,vRowCount] := fDm.Q.Fields[5].AsString;
//      StringGrid2.Cells[3,vRowCount] := fDm.Q.Fields[6].AsString;
//      StringGrid2.Cells[4,vRowCount] := fDm.Q.Fields[7].AsString;
////      Panel_RxdWod.Visible := False;
////      Label_All.Visible := True;
////      StringGrid1.Visible := False;
////      Label_Rxd.Visible := False;
////      Label_Scale.Visible := False;
////      Label_All.Visible := True;
//    end
//    else if fDm.q.FieldByName('Tlevel').AsString = 'Rxd' then
//    begin
//      Panel_RxdWod.Visible := True;
//      StringGrid1.Cells[0,vRowCount] := fDm.Q.Fields[2].AsString;
//      StringGrid1.Cells[1,vRowCount] := fDm.Q.Fields[5].AsString;
//      StringGrid1.Cells[2,vRowCount] := fDm.Q.Fields[6].AsString;
//      StringGrid1.Cells[3,vRowCount] := fDm.Q.Fields[7].AsString;
//    end
//    else
//    begin
//      Panel_ScaleWod.Visible := True;
//      StringGrid2.Cells[0,vRowCount] := fDm.Q.Fields[4].AsString;
//      StringGrid2.Cells[1,vRowCount] := fDm.Q.Fields[2].AsString;
//      StringGrid2.Cells[2,vRowCount] := fDm.Q.Fields[5].AsString;
//      StringGrid2.Cells[3,vRowCount] := fDm.Q.Fields[6].AsString;
//      StringGrid2.Cells[4,vRowCount] := fDm.Q.Fields[7].AsString;
//    end;
//    Inc(vRowCount);
//    StringGrid1.RowCount := StringGrid1.RowCount +1;
//    StringGrid2.RowCount := StringGrid2.RowCount +1;
//    fDm.Q.Next;
//  end;
end;

procedure TfRecord_My.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fRecord_My := nil;
end;

procedure TfRecord_My.FormCreate(Sender: TObject);
var
  vName : string;
begin
  DatePicker1.Date := Date;
//  StringGrid2.Cells[0,0] := '난이도';
//  StringGrid2.Cells[1,0] := '운동';
//  StringGrid2.Cells[2,0] := '성별';
//  StringGrid2.Cells[3,0] := '무게';
//  StringGrid2.Cells[4,0] := '개수';
//  StringGrid2.ColWidths[1] := 300;
//  StringGrid1.Cells[0,0] := '운동';
//  StringGrid1.Cells[1,0] := '성별';
//  StringGrid1.Cells[2,0] := '무게';
//  StringGrid1.Cells[3,0] := '개수';
//  StringGrid1.ColWidths[0] := 280;

  vName := Copy(fMain.Caption, Pos(':', fMain.Caption)+2, Length(fMain.Caption));
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT * FROM PersonManagementTbl');
  fDm.q.SQL.Add('WHERE Name = :Name');
  fDm.q.ParamByName('Name').AsString := vName;
  fDm.q.Open;

  LabeledEdit_Name.Text := fDm.q.FieldByName('Name').AsString;
  LabeledEdit_Mobile.Text := fDm.q.FieldByName('Mobile').AsString;
  LabeledEdit_BirthYear.Text := DateToStr(fDm.q.FieldByName('BirthYear').AsDateTime);
  case fDm.q.FieldByName('Gender').AsInteger of
  0 : LabeledEdit_Gender.Text := '남자';
  1 : LabeledEdit_Gender.Text := '여자';
  end;
end;

end.
