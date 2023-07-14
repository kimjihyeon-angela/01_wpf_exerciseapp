unit uCompetition_Rank;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Data.DB, Vcl.DBGrids;

type
  TfCompetition_Rank = class(TForm)
    Panel_Box: TPanel;
    Label1: TLabel;
    ComboBox_BoxName: TComboBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    ComboBox_Level: TComboBox;
    Button1: TButton;
    DBGrid_Rank: TDBGrid;
    Panel1: TPanel;
    Label_CompetitionName: TLabel;
    SearchBox_CompetitionName: TSearchBox;
    Label_CompetitionName2: TLabel;
    Panel4: TPanel;
    RadioGroup_Type: TRadioGroup;
    Button2: TButton;
    procedure SearchBox_CompetitionNameInvokeSearch(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup_TypeClick(Sender: TObject);
    procedure ComboBox_LevelChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCompetition_Rank: TfCompetition_Rank;

implementation

{$R *.dfm}

uses uDm;

procedure TfCompetition_Rank.Button1Click(Sender: TObject);
var
  vBoxName : string;
begin
  ComboBox_Level.ItemIndex := -1;
  if RadioGroup_Type.ItemIndex = 0 then
  begin
    fDm.q_Competition.Close;
    fDm.q_Competition.SQL.Clear;
    fDm.q_Competition.SQL.Add('SELECT CompetitionName, BoxName, Name, Tlevel, Record from CompetitionBoxRecordTbl');
    fDm.q_Competition.SQL.Add('WHERE CompetitionName like :CompetitionName');
    fDm.q_Competition.ParamByName('CompetitionName').AsString := '%'+SearchBox_CompetitionName.Text+'%';
    fDm.q_Competition.Open;

    ComboBox_BoxName.Items.Clear;
    fDm.q_Competition.First;
    while not fDm.q_Competition.Eof do
    begin
      vBoxName := fDm.q_Competition.FieldByName('BoxName').AsString;
      ComboBox_BoxName.Items.Add(vBoxName);
      fDm.q_Competition.Next;
    end;
  end

  else if RadioGroup_Type.ItemIndex = 1 then
  begin
    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('SELECT CompetitionName,Name, Tlevel, Record from CompetitionIndiRecordTbl');
    fDm.q.SQL.Add('WHERE CompetitionName LIKE :CompetitionName');
    fDm.q.ParamByName('CompetitionName').AsString := '%' + SearchBox_CompetitionName.Text +'%';
    fDm.q.Open;
  end;
end;

procedure TfCompetition_Rank.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfCompetition_Rank.ComboBox_LevelChange(Sender: TObject);
begin
  if RadioGroup_Type.ItemIndex = 0 then
  begin
    fDm.q_Competition.Close;
    fDm.q_Competition.SQL.Clear;
    fDm.q_Competition.SQL.Add('SELECT CompetitionName, BoxName, Name, Tlevel, Record from CompetitionBoxRecordTbl');
    fDm.q_Competition.SQL.Add('WHERE CompetitionName = :CompetitionName');
    fDm.q_Competition.SQL.Add('  AND Tlevel = :Tlevel');
    fDm.q_Competition.SQL.Add('ORDER BY Record');
    fDm.q_Competition.ParamByName('CompetitionName').AsString := Label_CompetitionName2.Caption;
    fDm.q_Competition.ParamByName('Tlevel').AsString := ComboBox_Level.Text;
    fDm.q_Competition.Open;
  end
  else if RadioGroup_Type.ItemIndex = 1 then
  begin
    fDm.q_Competition.Close;
    fDm.q_Competition.SQL.Clear;
    fDm.q_Competition.SQL.Add('SELECT CompetitionName, Name, Tlevel, Record from CompetitionIndiRecordTbl');
    fDm.q_Competition.SQL.Add('WHERE CompetitionName = :CompetitionName');
    fDm.q_Competition.SQL.Add('  AND Tlevel = :Tlevel');
    fDm.q_Competition.SQL.Add('ORDER BY Record');
    fDm.q_Competition.ParamByName('CompetitionName').AsString := Label_CompetitionName2.Caption;
    fDm.q_Competition.ParamByName('Tlevel').AsString := ComboBox_Level.Text;
    fDm.q_Competition.Open;
  end;
end;

procedure TfCompetition_Rank.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  fCompetition_Rank := nil;
end;

procedure TfCompetition_Rank.RadioGroup_TypeClick(Sender: TObject);
begin
  SearchBox_CompetitionName.Enabled := True;
end;

procedure TfCompetition_Rank.SearchBox_CompetitionNameInvokeSearch(Sender: TObject);
var
  vBoxName : string;
begin
  DBGrid_Rank.Visible := True;
  if RadioGroup_Type.ItemIndex = 0 then
  begin
    fDm.q_Competition.Close;
    fDm.q_Competition.SQL.Clear;
    fDm.q_Competition.SQL.Add('SELECT CompetitionName, BoxName, Name, Tlevel, Record from CompetitionBoxRecordTbl');
    fDm.q_Competition.SQL.Add('WHERE CompetitionName like :CompetitionName');
    fDm.q_Competition.ParamByName('CompetitionName').AsString := '%'+SearchBox_CompetitionName.Text+'%';
    fDm.q_Competition.Open;

    ComboBox_BoxName.Items.Clear;
    fDm.q_Competition.First;
    while not fDm.q_Competition.Eof do
    begin
      vBoxName := fDm.q_Competition.FieldByName('BoxName').AsString;
      ComboBox_BoxName.Items.Add(vBoxName);
      fDm.q_Competition.Next;
    end;
    Label_CompetitionName2.Caption := fDm.q_Competition.FieldByName('CompetitionName').AsString;
    SearchBox_CompetitionName.Text := fDm.q_Competition.FieldByName('CompetitionName').AsString;
  end

  else if RadioGroup_Type.ItemIndex = 1 then
  begin
    fDm.q_Competition.Close;
    fDm.q_Competition.SQL.Clear;
    fDm.q_Competition.SQL.Add('SELECT CompetitionName, Name, Tlevel, Record from CompetitionIndiRecordTbl');
    fDm.q_Competition.SQL.Add('WHERE CompetitionName LIKE :CompetitionName');
    fDm.q_Competition.ParamByName('CompetitionName').AsString := '%' + SearchBox_CompetitionName.Text +'%';
    fDm.q_Competition.Open;
    Label_CompetitionName2.Caption := fDm.q_Competition.FieldByName('CompetitionName').AsString;
    SearchBox_CompetitionName.Text := fDm.q_Competition.FieldByName('CompetitionName').AsString;
  end;
end;

end.
