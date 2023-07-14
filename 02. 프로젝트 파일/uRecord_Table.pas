unit uRecord_Table;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.WinXPickers, Data.DB, Vcl.DBGrids;

type
  TfRecord_Table = class(TForm)
    Panel1: TPanel;
    ComboBox_Gender: TComboBox;
    ComboBox_Level: TComboBox;
    DatePicker1: TDatePicker;
    Btn_All: TButton;
    DBGrid1: TDBGrid;
    Button1: TButton;
    procedure Btn_AllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DatePicker1Change(Sender: TObject);
    procedure ComboBox_GenderChange(Sender: TObject);
    procedure ComboBox_LevelChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRecord_Table: TfRecord_Table;

implementation

{$R *.dfm}

uses uDm;

procedure TfRecord_Table.Btn_AllClick(Sender: TObject);
begin
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT * FROM V_Record');
  fDm.q.SQL.Add('WHERE Tdate = :Tdate');
  fDm.q.ParamByName('Tdate').AsDate := DatePicker1.Date;
  fDm.q.Open;
  ComboBox_Gender.ItemIndex := -1;
  ComboBox_Level.ItemIndex := -1;
end;

procedure TfRecord_Table.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfRecord_Table.ComboBox_GenderChange(Sender: TObject);
begin
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT * FROM V_Record');
  fDm.q.SQL.Add('WHERE Tdate = :Tdate');
  fDm.q.SQL.Add('AND   Gender = :Gender');
  fDm.q.ParamByName('Tdate').AsDate := DatePicker1.Date;
  fDm.q.ParamByName('Gender').AsInteger := ComboBox_Gender.ItemIndex;
  fDm.q.Open;
end;

procedure TfRecord_Table.ComboBox_LevelChange(Sender: TObject);
begin
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT * FROM V_Record');
  fDm.q.SQL.Add('WHERE Tdate = :Tdate');
  fDm.q.SQL.Add('AND   Tlevel = :Tlevel');
  fDm.q.ParamByName('Tdate').AsDate := DatePicker1.Date;
  case ComboBox_Level.ItemIndex of
  0 : fDm.q.ParamByName('Tlevel').AsString := 'Rxd';
  1 : fDm.q.ParamByName('Tlevel').AsString := 'Scale A';
  2 : fDm.q.ParamByName('Tlevel').AsString := 'Scale B';
  3 : fDm.q.ParamByName('Tlevel').AsString := 'Scale C';
  4 : fDm.q.ParamByName('Tlevel').AsString := 'All';
  end;
  fDm.q.Open;
end;

procedure TfRecord_Table.DatePicker1Change(Sender: TObject);
begin
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT * FROM V_Record');
  fDm.q.SQL.Add('WHERE Tdate = :Tdate');
  fDm.q.ParamByName('Tdate').AsDate := DatePicker1.Date;
  fDm.q.Open;
end;

procedure TfRecord_Table.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fRecord_Table := nil;
end;

procedure TfRecord_Table.FormCreate(Sender: TObject);
begin
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT * FROM RecordTbl');
  fDm.q.SQL.Add('WHERE Tdate = :Tdate');
  fDm.q.ParamByName('Tdate').AsDate := DatePicker1.Date;
  fDm.q.Open;

  DatePicker1.Date := Date;
end;

end.
