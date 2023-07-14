unit uManager_WodSelected2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXPickers, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.CheckLst;

type
  TForm2 = class(TForm)
    ListBox_WodSelected: TListBox;
    Panel1: TPanel;
    ComboBox_Level: TComboBox;
    ComboBox_Gender: TComboBox;
    CheckListBox_WeightCount: TCheckListBox;
    Panel3: TPanel;
    LabeledEdit_Weight: TLabeledEdit;
    LabeledEdit_Count: TLabeledEdit;
    Panel2: TPanel;
    Btn_Modify: TButton;
    ComboBox_StopWatch: TComboBox;
    LabeledEdit_TimeCap: TLabeledEdit;
    LabeledEdit_Round: TLabeledEdit;
    Btn_Link: TButton;
    LabeledEdit_VideoLink: TLabeledEdit;
    Panel4: TPanel;
    Btn_Save: TButton;
    Btn_Check: TButton;
    Panel5: TPanel;
    DatePicker1: TDatePicker;
    CheckBox1: TCheckBox;
    procedure CheckListBox_WeightCountClick(Sender: TObject);
    procedure Btn_ModifyClick(Sender: TObject);
    procedure Btn_SaveClick(Sender: TObject);
    procedure Btn_CheckClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_LinkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  vBoxName : string;

implementation

{$R *.dfm}

uses uManager_Wod, uDm, uMain;

procedure TForm2.Btn_ModifyClick(Sender: TObject);
begin
  vBoxName := Copy(fMain.Caption, Pos('박스', fMain.Caption)+3, Pos('관리자', fMain.Caption)-4);
  fDm.q_Wod.Close;
  fDm.q_Wod.SQL.Clear;
  fDm.q.SQL.Add('UPDATE WodTbl');
  fDm.q.SQL.Add('SET Wod2 = :Wod2, Wod_Detail = :Wod_Detail, Round = :Round,');
  fDm.q.SQL.Add('Tlevel = :Tlevel, Gender = :Gender, Weight = :Weight, Count = :Count,');
  fDm.q.SQL.Add('Timer = :Timer, TimeCap = :TimeCap, Record = :Record');
  fDm.q.SQL.Add('WHERE Tdate = :Tdate');
  fDm.q.SQL.Add('AND   BoxName = :BoxName');
  fDm.q.ParamByName('Tdate').AsDate := DatePicker1.Date;
  fDm.q.ParamByName('BoxName').AsString := vBoxName;
  fDm.q.ParamByName('Wod2').AsString := ListBox_WodSelected.Items.Text;
  fDm.q.ParamByName('Wod_Detail').AsString := ListBox_WodSelected.Items[ListBox_WodSelected.ItemIndex];
  fDm.q.ParamByName('Round').AsString := LabeledEdit_Round.Text;
  fDm.q.ParamByName('Tlevel').AsString := ComboBox_Level.Text;
  fDm.q.ParamByName('Gender').AsString := ComboBox_Gender.Text;
  fDm.q.ParamByName('Weight').AsString := LabeledEdit_Weight.Text;
  fDm.q.ParamByName('Count').AsString := LabeledEdit_Count.Text;
  fDm.q.ParamByName('Timer').AsString := ComboBox_StopWatch.Text;
  fDm.q.ParamByName('TimeCap').AsString := LabeledEdit_TimeCap.Text;
//  fDm.q.ParamByName('VideoLink').AsString := LabeledEdit_VideoLink.Text;
  if CheckBox1.Checked then
  begin
    fDm.q.ParamByName('Record').AsInteger := 1;
  end
  else
  begin
    fDm.q.ParamByName('Record').AsInteger := 0;
  end;
  fDm.q.ExecSQL;
end;

procedure TForm2.Btn_SaveClick(Sender: TObject);
begin
  ShowMessage('저장되었습니다.');
  Close;
end;

procedure TForm2.Btn_LinkClick(Sender: TObject);
begin
  LabeledEdit_VideoLink.Visible := True;
end;

procedure TForm2.Btn_CheckClick(Sender: TObject);
begin
  vBoxName := Copy(fMain.Caption, Pos('박스', fMain.Caption)+3, Pos('관리자', fMain.Caption)-4);
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('INSERT INTO WodTbl');
  fDm.q.SQL.Add('(Tdate, BoxName, Wod2, Wod_Detail, Round, Tlevel, Gender, Weight, Count, Timer, TimeCap, VideoLink, Record)');
  fDm.q.SQL.Add('VALUES (:Tdate, :BoxName, :Wod2, :Wod_Detail, :Round, :Tlevel, :Gender, :Weight, :Count, :Timer, :TimeCap, :VideoLink, :Record)');
  fDm.q.ParamByName('Tdate').AsDate := DatePicker1.Date;
  fDm.q.ParamByName('BoxName').AsString := vBoxName;
  fDm.q.ParamByName('Wod2').AsString := ListBox_WodSelected.Items.Text;
  fDm.q.ParamByName('Wod_Detail').AsString := ListBox_WodSelected.Items[ListBox_WodSelected.ItemIndex];
  fDm.q.ParamByName('Round').AsString := LabeledEdit_Round.Text;
  fDm.q.ParamByName('Tlevel').AsString := ComboBox_Level.Text;
  fDm.q.ParamByName('Gender').AsString := ComboBox_Gender.Text;
  fDm.q.ParamByName('Weight').AsString := LabeledEdit_Weight.Text;
  fDm.q.ParamByName('Count').AsString := LabeledEdit_Count.Text;
  fDm.q.ParamByName('Timer').AsString := ComboBox_StopWatch.Text;
  fDm.q.ParamByName('TimeCap').AsString := LabeledEdit_TimeCap.Text;
//  fDm.q.ParamByName('VideoLink').AsString := LabeledEdit_VideoLink.Text;
  if CheckBox1.Checked then
  begin
    fDm.q.ParamByName('Record').AsInteger := 1;
  end
  else
  begin
    fDm.q.ParamByName('Record').AsInteger := 0;
  end;
  fDm.q.ExecSQL;
  LabeledEdit_Weight.Clear;
  LabeledEdit_Count.Clear;
end;

procedure TForm2.CheckListBox_WeightCountClick(Sender: TObject);
var
  i: Integer;
  vCount : Integer;
begin
  CheckListBox_WeightCount.MultiSelect := True;
  vCount := 0;
  for i := 0 to CheckListBox_WeightCount.Items.Count -1 do
  begin
    if CheckListBox_WeightCount.Checked[i] then
    begin
      vCount := vCount + 1;
    end;
  end;

  if vCount = 2 then
  begin
    Panel3.Visible := True;
    Panel1.Visible := False;
    LabeledEdit_Weight.Visible := True;
    LabeledEdit_Count.Visible := True;
    Panel1.Visible := True;
  end
  else
  begin
    if CheckListBox_WeightCount.Checked[0] then
     begin
      Panel3.Visible := True;
      Panel1.Visible := False;
      LabeledEdit_Weight.Visible := True;
      LabeledEdit_Count.Visible := False;
      Panel1.Visible := True;
    end
    else if CheckListBox_WeightCount.Checked[1] then
    begin
      Panel3.Visible := True;
      Panel1.Visible := False;
      LabeledEdit_Weight.Visible := False;
      LabeledEdit_Count.Visible := True;
      Panel1.Visible := True;
    end;
  end;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  DatePicker1.Date := Date;
end;

end.
