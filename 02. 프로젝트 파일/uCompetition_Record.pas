unit uCompetition_Record;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.ExtCtrls, Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfCompetition_Record = class(TForm)
    Panel1: TPanel;
    Label_CompetitionName: TLabel;
    SearchBox_CompetitionName: TSearchBox;
    Panel_Box: TPanel;
    ComboBox_BoxName: TComboBox;
    Panel2: TPanel;
    ComboBox_Name: TComboBox;
    Panel3: TPanel;
    Panel4: TPanel;
    Btn_Save: TButton;
    Panel5: TPanel;
    RadioGroup1: TRadioGroup;
    DBGrid1: TDBGrid;
    Btn_Check: TButton;
    Panel6: TPanel;
    LabeledEdit_Mobile: TLabeledEdit;
    LabeledEdit_Gender: TLabeledEdit;
    LabeledEdit_BirthYear: TLabeledEdit;
    LabeledEdit_Name: TLabeledEdit;
    LabeledEdit_CompetitionName: TLabeledEdit;
    LabeledEdit_Record: TLabeledEdit;
    Panel_Modify: TPanel;
    Btn_Modify: TButton;
    Btn_Cancel: TButton;
    Panel7: TPanel;
    RadioGroup_Type: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    procedure SearchBox_CompetitionNameInvokeSearch(Sender: TObject);
    procedure ComboBox_BoxNameChange(Sender: TObject);
    procedure ComboBox_NameChange(Sender: TObject);
    procedure LabeledEdit_NameChange(Sender: TObject);
    procedure Btn_SaveClick(Sender: TObject);
    procedure Btn_ModifyClick(Sender: TObject);
    procedure Btn_CheckClick(Sender: TObject);
    procedure RadioGroup_TypeClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCompetition_Record: TfCompetition_Record;

implementation

{$R *.dfm}

uses uDm;

procedure TfCompetition_Record.Btn_CheckClick(Sender: TObject);
begin
  DBGrid1.Visible := True;
  RadioGroup1.Visible := False;
  if RadioGroup_Type.ItemIndex = 0 then
  begin
    fDm.q_Competition.Close;
    fDm.q_Competition.SQL.Clear;
    fDm.q_Competition.SQL.Add('select * FROM CompetitionBoxRecordTbl');
    fDm.q_Competition.SQL.Add('WHERE CompetitionName = :CompetitionName');
    fDm.q_Competition.ParamByName('CompetitionName').AsString := LabeledEdit_CompetitionName.Text;
    fDm.q_Competition.Open;
  end
  else if RadioGroup1.ItemIndex = 1 then
  begin
    fDm.q_Competition.Close;
    fDm.q_Competition.SQL.Clear;
    fDm.q_Competition.SQL.Add('SELECT * FROM CompetitionIndiRecordTbl');
    fDm.q_Competition.SQL.Add('WHERE CompetitionName = :CompetitionName');
    fDm.q_Competition.ParamByName('CompetitionName').AsString := LabeledEdit_CompetitionName.Text;
    fDm.q_Competition.Open;
  end;
end;

procedure TfCompetition_Record.Btn_ModifyClick(Sender: TObject);
begin
  if RadioGroup_Type.ItemIndex = 0 then
  begin
    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('UPDATE CompetitionBoxRecordTbl');
    fDm.q.SQL.Add('SET	Tlevel = :Tlevel');
    fDm.q.SQL.Add('   , Record = :Record');
    fDm.q.SQL.Add('WHERE NAME = :NAME');
    fDm.q.ParamByName('Name').AsString := LabeledEdit_Name.Text;
    fDm.q.ParamByName('Record').AsString := LabeledEdit_Record.Text;
    case RadioGroup1.ItemIndex of
    0 : fDm.q.ParamByName('Tlevel').AsString := 'Rxd';
    1 : fDm.q.ParamByName('Tlevel').AsString := 'Scale A';
    2 : fDm.q.ParamByName('Tlevel').AsString := 'Scale B';
    3 : fDm.q.ParamByName('Tlevel').AsString := 'Scale C';
    4 : fDm.q.ParamByName('Tlevel').AsString := 'All';
    end;
    fDm.q.ExecSQL;
    ShowMessage('수정되었습니다.');
  end
  else if RadioGroup_Type.ItemIndex = 1 then
  begin
    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('UPDATE CompetitionIndiRecordTbl');
    fDm.q.SQL.Add('SET	Tlevel = :Tlevel');
    fDm.q.SQL.Add('   , Record = :Record');
    fDm.q.SQL.Add('WHERE NAME = :NAME');
    fDm.q.ParamByName('Name').AsString := LabeledEdit_Name.Text;
    fDm.q.ParamByName('Record').AsString := LabeledEdit_Record.Text;
    case RadioGroup1.ItemIndex of
    0 : fDm.q.ParamByName('Tlevel').AsString := 'Rxd';
    1 : fDm.q.ParamByName('Tlevel').AsString := 'Scale A';
    2 : fDm.q.ParamByName('Tlevel').AsString := 'Scale B';
    3 : fDm.q.ParamByName('Tlevel').AsString := 'Scale C';
    4 : fDm.q.ParamByName('Tlevel').AsString := 'All';
    end;
    fDm.q.ExecSQL;
    ShowMessage('수정되었습니다.');
  end;
end;

procedure TfCompetition_Record.Btn_SaveClick(Sender: TObject);
begin
  if RadioGroup_Type.ItemIndex = 0 then
  begin
    if RadioGroup1.ItemIndex < 0 then
    begin
      ShowMessage('난이도를 선택하세요.');
      Exit;
    end
    else if LabeledEdit_Record.Text = '' then
    begin
      ShowMessage('기록을 입력하세요.');
      LabeledEdit_Record.SetFocus;
      Exit;
    end
    else
    begin
      fDm.q.Close;
      fDm.q.SQL.Clear;
      fDm.q.SQL.Add('INSERT INTO CompetitionBoxRecordTbl');
      fDm.q.SQL.Add('(CompetitionName, BoxName, Name, BirthYear, Gender, Mobile, Tlevel, Record)');
      fDm.q.SQL.Add('VALUES (:CompetitionName, :BoxName, :Name, :BirthYear, :Gender, :Mobile, :Tlevel, :Record)');
      fDm.q.ParamByName('CompetitionName').AsString := LabeledEdit_CompetitionName.Text;
      fDm.q.ParamByName('BoxName').AsString := ComboBox_BoxName.Text;
      fDm.q.ParamByName('Name').AsString := LabeledEdit_Name.Text;
      fDm.q.ParamByName('BirthYear').AsDate := StrToDate(LabeledEdit_BirthYear.Text);
      fDm.q.ParamByName('Mobile').AsString := LabeledEdit_Mobile.Text;
      case RadioGroup1.ItemIndex of
      0 : fDm.q.ParamByName('Tlevel').AsString := 'Rxd';
      1 : fDm.q.ParamByName('Tlevel').AsString := 'Scale A';
      2 : fDm.q.ParamByName('Tlevel').AsString := 'Scale B';
      3 : fDm.q.ParamByName('Tlevel').AsString := 'Scale C';
      end;
      fDm.q.ParamByName('Record').AsString := LabeledEdit_Record.Text;
      if LabeledEdit_Gender.Text = '남자' then
      begin
        fDm.q.ParamByName('Gender').AsInteger := 0;
      end
      else
      begin
        fDm.q.ParamByName('Gender').AsInteger := 1;
      end;
      fDm.q.ExecSQL;
      ShowMessage('저장되었습니다.');
    end;
  end
  else if RadioGroup_Type.ItemIndex = 1 then
  begin
    if RadioGroup1.ItemIndex < 0 then
    begin
      ShowMessage('난이도를 선택하세요.');
      Exit;
    end
    else if LabeledEdit_Record.Text = '' then
    begin
      ShowMessage('기록을 입력하세요.');
      LabeledEdit_Record.SetFocus;
      Exit;
    end
    else
    begin
      fDm.q.Close;
      fDm.q.SQL.Clear;
      fDm.q.SQL.Add('INSERT INTO CompetitionIndiRecordTbl');
      fDm.q.SQL.Add('(CompetitionName, Name, BirthYear, Gender, Mobile, Tlevel, Record)');
      fDm.q.SQL.Add('VALUES (:CompetitionName, :Name, :BirthYear, :Gender, :Mobile, :Tlevel, :Record)');
      fDm.q.ParamByName('CompetitionName').AsString := LabeledEdit_CompetitionName.Text;
      fDm.q.ParamByName('Name').AsString := LabeledEdit_Name.Text;
      fDm.q.ParamByName('BirthYear').AsDate := StrToDate(LabeledEdit_BirthYear.Text);
      fDm.q.ParamByName('Mobile').AsString := LabeledEdit_Mobile.Text;
      case RadioGroup1.ItemIndex of
      0 : fDm.q.ParamByName('Tlevel').AsString := 'Rxd';
      1 : fDm.q.ParamByName('Tlevel').AsString := 'Scale A';
      2 : fDm.q.ParamByName('Tlevel').AsString := 'Scale B';
      3 : fDm.q.ParamByName('Tlevel').AsString := 'Scale C';
      end;
      fDm.q.ParamByName('Record').AsString := LabeledEdit_Record.Text;
      if LabeledEdit_Gender.Text = '남자' then
      begin
        fDm.q.ParamByName('Gender').AsInteger := 0;
      end
      else
      begin
        fDm.q.ParamByName('Gender').AsInteger := 1;
      end;
      fDm.q.ExecSQL;
      ShowMessage('저장되었습니다.');
    end;
  end;
end;

procedure TfCompetition_Record.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfCompetition_Record.Button2Click(Sender: TObject);
begin
  DBGrid1.Visible := False;
  RadioGroup1.Visible := True;
end;

procedure TfCompetition_Record.ComboBox_BoxNameChange(Sender: TObject);
var
  vName : string;
begin
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT Name From V_Box_Mem');
  fDm.q.SQL.Add('WHERE BoxName = :BoxName');
  fDm.q.ParamByName('BoxName').AsString := ComboBox_BoxName.Text;
  fDm.q.Open;

  ComboBox_Name.Clear;
  fDm.q.First;
  while not fDm.q.Eof do
  begin
    vName := fDm.q.FieldByName('Name').AsString;
    ComboBox_Name.Items.Add(vName);
    fDm.q.Next;
  end;
end;

procedure TfCompetition_Record.ComboBox_NameChange(Sender: TObject);
begin
  if RadioGroup_Type.ItemIndex = 0 then
  begin
    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('select * from V_Box_Mem');
    fDm.q.SQL.Add('where Name = :Name');
    fDm.q.ParamByName('Name').AsString := ComboBox_Name.Text;
    fDm.q.Open;
    LabeledEdit_Name.Text := ComboBox_Name.Text;
    LabeledEdit_Record.Clear;
  end
  else if RadioGroup_Type.ItemIndex = 1 then
  begin
    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('SELECT * FROM CompetitionIndiMakeTbl');
    fDm.q.SQL.Add('WHERE Name = :Name');
    fDm.q.ParamByName('Name').AsString := ComboBox_Name.Text;
    fDm.q.Open;
    LabeledEdit_Name.Text := ComboBox_Name.Text;
    LabeledEdit_Record.Clear;
  end;
end;

procedure TfCompetition_Record.DBGrid1CellClick(Column: TColumn);
begin
  Panel_Modify.Visible := True;
  DBGrid1.Visible := False;
  RadioGroup1.Visible := True;
  LabeledEdit_BirthYear.Text := DateToStr(fDm.q.FieldByName('BirthYear').AsDateTime);
  if DBGrid1.Fields[3].Text = '0' then
  begin
    LabeledEdit_Gender.Text := '남자';
  end
  else
  begin
    LabeledEdit_Gender.Text := '여자';
  end;
  LabeledEdit_CompetitionName.Text := DBGrid1.Fields[0].Text;
  LabeledEdit_Name.Text := DBGrid1.Fields[2].Text;

end;

procedure TfCompetition_Record.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  fCompetition_Record := nil;
end;

procedure TfCompetition_Record.LabeledEdit_NameChange(Sender: TObject);
begin
  if RadioGroup_Type.ItemIndex = 0 then
  begin
    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('SELECT * FROM V_Box_Mem');
    fDm.q.SQL.Add('WHERE Name =:Name');
    fDm.q.ParamByName('Name').AsString := LabeledEdit_Name.Text;
    fDm.q.Open;

    if fDm.q.IsEmpty then
    begin
      LabeledEdit_BirthYear.Text := '';
      LabeledEdit_Gender.Text := '';
      LabeledEdit_Mobile.Text := '';
      exit;
    end;

    LabeledEdit_BirthYear.Text := DateToStr(fDm.q.FieldByName('BirthYear').AsDateTime);
    case fDm.q.FieldByName('Gender').AsInteger of
    0 : LabeledEdit_Gender.Text := '남자';
    1 : LabeledEdit_Gender.Text := '여자';
    end;
    LabeledEdit_Mobile.Text := fDm.q.FieldByName('Mobile').AsString;
  end
  else if RadioGroup_Type.ItemIndex = 1 then
  begin
    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('SELECT * FROM CompetitionIndiMakeTbl');
    fDm.q.SQL.Add('WHERE Name =:Name');
    fDm.q.ParamByName('Name').AsString := LabeledEdit_Name.Text;
    fDm.q.Open;

    if fDm.q.IsEmpty then
    begin
      LabeledEdit_BirthYear.Text := '';
      LabeledEdit_Gender.Text := '';
      LabeledEdit_Mobile.Text := '';
      exit;
    end;

    LabeledEdit_BirthYear.Text := DateToStr(fDm.q.FieldByName('BirthYear').AsDateTime);
    case fDm.q.FieldByName('Gender').AsInteger of
    0 : LabeledEdit_Gender.Text := '남자';
    1 : LabeledEdit_Gender.Text := '여자';
    end;
    LabeledEdit_Mobile.Text := fDm.q.FieldByName('Mobile').AsString;
  end;
end;

procedure TfCompetition_Record.RadioGroup_TypeClick(Sender: TObject);
begin
  SearchBox_CompetitionName.Enabled := True;
end;

procedure TfCompetition_Record.SearchBox_CompetitionNameInvokeSearch(
  Sender: TObject);
var
  vBoxName, vName :  string;
begin
  if RadioGroup_Type.ItemIndex = 0 then
  begin
    fDm.q_Competition.Close;
    fDm.q_Competition.SQL.Clear;
    fDm.q_Competition.SQL.Add('SELECT BoxName, CompetitionName FROM CompetitionMakeTbl');
    fDm.q_Competition.SQL.Add('WHERE CompetitionName like :CompetitionName');
    fDm.q_Competition.ParamByName('CompetitionName').AsString := '%'+ SearchBox_CompetitionName.Text+ '%';
    fDm.q_Competition.Open;

    ComboBox_Name.Items.Clear;
    ComboBox_BoxName.Items.Clear;
    fDm.q_Competition.First;
    while not fDm.q_Competition.Eof do
    begin
      vBoxName := fDm.q_Competition.FieldByName('BoxName').AsString;
      ComboBox_BoxName.Items.Add(vBoxName);
      fDm.q_Competition.Next;
    end;
    LabeledEdit_CompetitionName.Text := fDm.q_Competition.FieldByName('CompetitionName').AsString;
    Panel4.Visible := True;
  end

  else if RadioGroup_Type.ItemIndex = 1 then
  begin
    fDm.q_Competition.Close;
    fDm.q_Competition.SQL.Clear;
    fDm.q_Competition.SQL.Add('SELECT Name, CompetitionName From CompetitionIndiMakeTbl');
    fDm.q_Competition.SQL.Add('WHERE CompetitionName LIKE :CompetitionName');
    fDm.q_Competition.ParamByName('CompetitionName').AsString := '%' + SearchBox_CompetitionName.Text +'%';
    fDm.q_Competition.Open;

    ComboBox_BoxName.Items.Clear;
    ComboBox_Name.Items.Clear;
    fDm.q_Competition.First;
    while not fDm.q_Competition.Eof do
    begin
      vName := fDm.q_Competition.FieldByName('Name').AsString;
      ComboBox_Name.Items.Add(vName);
      fDm.q_Competition.Next;
    end;
    LabeledEdit_CompetitionName.Text := fDm.q_Competition.FieldByName('CompetitionName').AsString;
  end;

end;

end.
