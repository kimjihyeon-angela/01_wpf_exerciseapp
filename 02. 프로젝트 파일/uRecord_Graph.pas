unit uRecord_Graph;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart, Vcl.ExtCtrls, Data.DB,
  VCLTee.Series, VCLTee.DBChart;

type
  TfRecord_Graph = class(TForm)
    Panel1: TPanel;
    ComboBox_WodName: TComboBox;
    ComboBox_Period: TComboBox;
    DBChart1: TDBChart;
    Series1: TLineSeries;
    Series2: TBarSeries;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox_WodNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRecord_Graph: TfRecord_Graph;

implementation

{$R *.dfm}

uses uDm, uMain;

procedure TfRecord_Graph.ComboBox_WodNameChange(Sender: TObject);
var
  vName : string;
begin
  DBChart1.Visible := True;
  if fMain.Caption = '°ü¸®ÀÚ' then
  begin
    fDm.q_Record.Close;
    fDm.q_Record.SQL.Clear;
    fDm.q_Record.SQL.Add('SELECT * FROM V_Record');
    fDm.q_Record.SQL.Add('WHERE Wod2 = :Wod2');
    fDm.q_Record.ParamByName('Wod2').AsString := ComboBox_WodName.Text;
    fDm.q_Record.Open;
  end
  else
  begin
    vName := Copy(fMain.Caption, Pos(':', fMain.Caption)+2, Length(fMain.Caption));
    fDm.q_Record.Close;
    fDm.q_Record.SQL.Clear;
    fDm.q_Record.SQL.Add('SELECT * FROM V_Record');
    fDm.q_Record.SQL.Add('WHERE Name = :Name');
    fDm.q_Record.SQL.Add('AND Wod2 = :Wod2');
    fDm.q_Record.ParamByName('Name').AsString := vName;
    fDm.q_Record.ParamByName('Wod2').AsString := ComboBox_WodName.Text;
    fDm.q_Record.Open;
  end;
end;

procedure TfRecord_Graph.FormCreate(Sender: TObject);
var
  vWod2 : string;
begin
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT  Wod2, COUNT(*) FROM WodTbl');
  fDm.q.SQL.Add('WHERE Record = 1');
  fDm.q.SQL.Add('GROUP BY Wod2');
  fDm.q.Open;

  fDm.q.First;
  ComboBox_WodName.Clear;
  while not fDm.q.Eof do
  begin
    vWod2 := fDm.q.FieldByName('Wod2').AsString;
    ComboBox_WodName.Items.Add(vWod2);
    fDm.q.Next;
  end;
end;

end.
