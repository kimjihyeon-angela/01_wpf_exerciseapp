unit uCompetition_Make;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtDlgs, Vcl.WinXPickers;

type
  TfCompetition_Make = class(TForm)
    RadioGroup_CompetitionMember: TRadioGroup;
    Panel_Box: TPanel;
    Panel_Member: TPanel;
    Panel_ShowMember: TPanel;
    DBGrid1: TDBGrid;
    OpenDialog_RuleBook: TOpenDialog;
    Label1: TLabel;
    ComboBox_BoxName: TComboBox;
    Btn_AddBox: TButton;
    Btn_Set: TButton;
    Btn_AddRuleBook: TButton;
    Btn_Set_Indi: TButton;
    DatePicker1: TDatePicker;
    LabeledEdit_MemName: TLabeledEdit;
    LabeledEdit_Mobile: TLabeledEdit;
    RadioGroup_Gender: TRadioGroup;
    Panel1: TPanel;
    LabeledEdit_CompetitionName: TLabeledEdit;
    Button1: TButton;
    procedure RadioGroup_CompetitionMemberClick(Sender: TObject);
    procedure Btn_AddMembersClick(Sender: TObject);
    procedure Btn_AddBoxClick(Sender: TObject);
    procedure Btn_AddRuleBookClick(Sender: TObject);
    procedure Btn_SetClick(Sender: TObject);
    procedure Btn_Set_IndiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_AddSetClick(Sender: TObject);
    procedure Btn_AddMemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCompetition_Make: TfCompetition_Make;

implementation

{$R *.dfm}

uses uDm, uLogin_NewBox;

procedure TfCompetition_Make.Btn_AddMembersClick(Sender: TObject);
begin
  LabeledEdit_MemName.Clear;
  LabeledEdit_Mobile.Clear;
end;

procedure TfCompetition_Make.Btn_AddMemClick(Sender: TObject);
begin
  Panel_Member.Visible := True;
end;

procedure TfCompetition_Make.Btn_AddRuleBookClick(Sender: TObject);
begin
  OpenDialog_RuleBook.Execute;
end;

procedure TfCompetition_Make.Btn_AddSetClick(Sender: TObject);
begin
  fDm.q.Close;
  fDm.q.SQL.Clear;
  if RadioGroup_CompetitionMember.ItemIndex = 1 then
  begin
    fDm.q.SQL.Add('INSERT INTO CompetitionIndiMakeTbl');
    fDm.q.SQL.Add('(CompetitionName, Name, Mobile, BirthYear, Gender)');
    fDm.q.SQL.Add('VALUES ( :CompetitionName, :Name, :Mobile, :BirthYear, :Gender)');
    fDm.q.ParamByName('CompetitionName').AsString := LabeledEdit_CompetitionName.Text;
    fDm.q.ParamByName('Name').AsString := LabeledEdit_MemName.Text;
    fDm.q.ParamByName('Mobile').AsInteger := StrToInt(LabeledEdit_Mobile.Text);
    fDm.q.ParamByName('BirthYear').AsDate := DatePicker1.Date;
    fDm.q.ParamByName('Gender').AsInteger := RadioGroup_Gender.ItemIndex;
  end;

  fDm.q.ExecSQL;
  if RadioGroup_CompetitionMember.ItemIndex = 0 then
  begin
    fDm.q_Competition.Close;
    fDm.q_Competition.SQL.Clear;
    fDm.q_Competition.SQL.Add('SELECT * FROM CompetitionMakeTbl');
    fDm.q_Competition.Open;
  end
  else
  begin
    fDm.q_Competition.Close;
    fDm.q_Competition.SQL.Clear;
    fDm.q_Competition.SQL.Add('SELECT * FROM CompetitionIndiMakeTbl');
    fDm.q_Competition.Open;
  end;

end;

procedure TfCompetition_Make.Btn_Set_IndiClick(Sender: TObject);
begin
  fDm.q.Close;
  fDm.q.SQL.Clear;
  if RadioGroup_CompetitionMember.ItemIndex = 1 then
  begin
    fDm.q.SQL.Add('INSERT INTO CompetitionIndiMakeTbl');
    fDm.q.SQL.Add('(CompetitionName, CompetitionType, Name, Mobile, BirthYear, Gender)');
    fDm.q.SQL.Add('VALUES ( :CompetitionName, :CompetitionType, :Name, :Mobile, :BirthYear, :Gender)');
    fDm.q.ParamByName('CompetitionType').AsInteger := RadioGroup_CompetitionMember.ItemIndex;
    fDm.q.ParamByName('CompetitionName').AsString := LabeledEdit_CompetitionName.Text;
    fDm.q.ParamByName('Name').AsString := LabeledEdit_MemName.Text;
    fDm.q.ParamByName('Mobile').AsInteger := StrToInt(LabeledEdit_Mobile.Text);
    fDm.q.ParamByName('BirthYear').AsDate := DatePicker1.Date;
    fDm.q.ParamByName('Gender').AsInteger := RadioGroup_Gender.ItemIndex;
  end;

  fDm.q.ExecSQL;

  DBGrid1.Visible := True;
  fDm.q_Competition.Close;
  fDm.q_Competition.SQL.Clear;
  fDm.q_Competition.SQL.Add('SELECT * FROM CompetitionIndiMakeTbl');
  fDm.q_Competition.Open;
  LabeledEdit_MemName.Clear;
  LabeledEdit_Mobile.Clear;
  DatePicker1.Date := Date;
  RadioGroup_Gender.ItemIndex := -1;
end;

procedure TfCompetition_Make.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfCompetition_Make.Btn_AddBoxClick(Sender: TObject);
var
  vBoxName : string;
begin
  if fLogin_NewBox = nil then
  begin
    fLogin_NewBox:=TfLogin_NewBox.Create(Self);
    fLogin_NewBox.showModal;
  end;

  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT * FROM BoxManagementTbl');
  fDm.q.Open;

  ComboBox_BoxName.Items.Clear;
  fDm.q.First;
  while not fDm.q.Eof do begin
    vBoxName := fDm.q.FieldByName('BoxName').AsString;
    ComboBox_BoxName.Items.Append(vBoxName);
    fDm.q.Next;
  end;
end;

procedure TfCompetition_Make.Btn_SetClick(Sender: TObject);
begin
  fDm.q.Close;
  fDm.q.SQL.Clear;
  if RadioGroup_CompetitionMember.ItemIndex = 0 then
  begin
    fDm.q.SQL.Add('INSERT INTO CompetitionMakeTbl');
    fDm.q.SQL.Add('(CompetitionName, CompetitionType, BoxName)');
    fDm.q.SQL.Add('VALUES ( :CompetitionName, :CompetitionType, :BoxName)');
    fDm.q.ParamByName('CompetitionType').AsInteger := RadioGroup_CompetitionMember.ItemIndex;
    fDm.q.ParamByName('BoxName').AsString := ComboBox_BoxName.Text;
  end
  else if RadioGroup_CompetitionMember.ItemIndex = 1 then
  begin
    fDm.q.SQL.Add('INSERT INTO CompetitionIndiMakeTbl');
    fDm.q.SQL.Add('(CompetitionName, CompetitionType, Name, Mobile, BirthYear, Gender)');
    fDm.q.SQL.Add('VALUES ( :CompetitionName, :CompetitionType, :Name, :Mobile, :BirthYear, :Gender)');
    fDm.q.ParamByName('CompetitionType').AsInteger := RadioGroup_CompetitionMember.ItemIndex;;
    fDm.q.ParamByName('Name').AsString := LabeledEdit_MemName.Text;
    fDm.q.ParamByName('Mobile').AsInteger := StrToInt(LabeledEdit_Mobile.Text);
    fDm.q.ParamByName('BirthYear').AsDate := DatePicker1.Date;
    fDm.q.ParamByName('Gender').AsInteger := RadioGroup_Gender.ItemIndex;
  end;

  fDm.q.ParamByName('CompetitionName').AsString := LabeledEdit_CompetitionName.Text;
  fDm.q.ExecSQL;

  DBGrid1.Visible := True;
  fDm.q_Competition.Close;
  fDm.q_Competition.SQL.Clear;
  fDm.q_Competition.SQL.Add('SELECT * FROM CompetitionMakeTbl');
  fDm.q_Competition.SQL.Add('WHERE CompetitionName = :CompetitionName');
  fDm.q_Competition.ParamByName('CompetitionName').AsString := LabeledEdit_CompetitionName.Text;
  fDm.q_Competition.Open;
end;

procedure TfCompetition_Make.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  fCompetition_Make := nil;
end;

procedure TfCompetition_Make.FormCreate(Sender: TObject);
var
  vBoxName : string;
begin
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT * FROM BoxManagementTbl');
  fDm.q.Open;

  ComboBox_BoxName.Items.Clear;
  fDm.q.First;
  while not fDm.q.Eof do begin
    vBoxName := fDm.q.FieldByName('BoxName').AsString;
    ComboBox_BoxName.Items.Append(vBoxName);
    fDm.q.Next;
  end;

  DatePicker1.Date := Date;
end;

procedure TfCompetition_Make.RadioGroup_CompetitionMemberClick(Sender: TObject);
begin
  if RadioGroup_CompetitionMember.ItemIndex = 0 then
  begin
    Panel_Member.Visible := False;
    Panel_Box.Visible := True;
    Panel_ShowMember.Visible := True;
  end;
  if RadioGroup_CompetitionMember.ItemIndex = 1 then
  begin
    Panel_Box.Visible := False;
    Panel_Member.Visible := True;
    Panel_ShowMember.Visible := True;
  end;
end;

end.
