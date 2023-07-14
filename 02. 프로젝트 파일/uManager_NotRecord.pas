unit uManager_NotRecord;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.WinXPickers, Data.DB, Vcl.DBGrids, frxClass, frxDBSet;

type
  TfManager_NotRecord = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel_Save: TPanel;
    Btn_Select: TButton;
    Label1: TLabel;
    LabeledEdit_Name: TLabeledEdit;
    LabeledEdit_BirthYear: TLabeledEdit;
    LabeledEdit_Gender: TLabeledEdit;
    LabeledEdit_Record: TLabeledEdit;
    Panel4: TPanel;
    Btn_Save: TButton;
    Btn_Cancel: TButton;
    DBGrid1: TDBGrid;
    DatePicker1: TDatePicker;
    LabeledEdit_Wod2: TLabeledEdit;
    ComboBox_Level: TComboBox;
    Button3: TButton;
    Button1: TButton;
    procedure Btn_CancelClick(Sender: TObject);
    procedure Btn_SelectClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Btn_SaveClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fManager_NotRecord: TfManager_NotRecord;

implementation

{$R *.dfm}

uses uDm;

procedure TfManager_NotRecord.Btn_CancelClick(Sender: TObject);
begin
  Panel_Save.Visible := False;
  Btn_Select.Click;
end;

procedure TfManager_NotRecord.Btn_SaveClick(Sender: TObject);
begin
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('INSERT INTO RecordTbl (Name, Wod2, Tlevel, Record, Tdate)');
  fDm.q.SQL.Add('VALUES (:Name, :Wod2, :Tlevel, :Record, :Tdate)');
  fDm.q.ParamByName('Name').AsString := LabeledEdit_Name.Text;
  fDm.q.ParamByName('Wod2').AsString := LabeledEdit_Wod2.Text;
  fDm.q.ParamByName('Record').AsString := LabeledEdit_Record.Text;
  fDm.q.ParamByName('Tdate').AsDate := DatePicker1.Date;
  case ComboBox_Level.ItemIndex of
  0 : fDm.q.ParamByName('Tlevel').AsString := 'Rxd';
  1 : fDm.q.ParamByName('Tlevel').AsString := 'Scale A';
  2 : fDm.q.ParamByName('Tlevel').AsString := 'Scale B';
  3 : fDm.q.ParamByName('Tlevel').AsString := 'Scale C';
  4 : fDm.q.ParamByName('Tlevel').AsString := 'All';
  end;
  fDm.q.ExecSQL;
  ShowMessage('저장되었습니다.');
  Btn_Select.Click;
end;

procedure TfManager_NotRecord.Btn_SelectClick(Sender: TObject);
begin
  fDm.q_Record.Close;
  fDm.q_Record.SQL.Clear;
  fDm.q_Record.SQL.Add('SELECT * FROM V_Record');
  fDm.q_Record.Open;
  Panel2.Visible := True;
  LabeledEdit_Wod2.Text := fDm.q_Record.FieldByName('Wod2').AsString;
  DatePicker1.Date := fDm.q_Record.FieldByName('Tdate').AsDateTime;
end;

procedure TfManager_NotRecord.Button1Click(Sender: TObject);
begin
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('UPDATE RecordTbl');
  fDm.q.SQL.Add('SET Tlevel = :Tlevel, Record = :Record ');
  fDm.q.SQL.Add('WHERE Name = :Name');
  case ComboBox_Level.ItemIndex of
  0 : fDm.q.ParamByName('Tlevel').AsString := 'Rxd';
  1 : fDm.q.ParamByName('Tlevel').AsString := 'Scale A';
  2 : fDm.q.ParamByName('Tlevel').AsString := 'Scale B';
  3 : fDm.q.ParamByName('Tlevel').AsString := 'Scale C';
  4 : fDm.q.ParamByName('Tlevel').AsString := 'All';
  end;
  fDm.q.ParamByName('Record').AsString := LabeledEdit_Record.Text;
  fDm.q.ParamByName('Name').AsString := DBGrid1.Fields[0].Text;
  fDm.q.ExecSQL;
  ShowMessage('수정되었습니다.');
  Btn_Select.Click;
end;

procedure TfManager_NotRecord.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TfManager_NotRecord.DBGrid1CellClick(Column: TColumn);
var
  vName : string;
begin
  Panel_Save.Visible := True;

//  vName := DBGrid1.SelectedField.Text;
  vName := DBGrid1.Fields[0].Text;

  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT * FROM V_Record');
  fDm.q.SQL.Add('WHERE Name = :Name');
  fDm.q.ParamByName('Name').AsString := vName;
  fDm.q.Open;


  LabeledEdit_Name.Text := fDm.q.FieldByName('Name').AsString;
  LabeledEdit_BirthYear.Text := DateToStr(fDm.q.FieldByName('BirthYear').AsDateTime);
  case fDm.q.FieldByName('Gender').AsInteger of
  0 : LabeledEdit_Gender.Text := '남자';
  1 : LabeledEdit_Gender.Text := '여자';
  end;
//  LabeledEdit_Level.Text := fDm.q.FieldByName('TLevel').AsString;

  if fDm.q.FieldByName('Tlevel').AsString = 'Rxd' then
  begin
    ComboBox_Level.ItemIndex := 0;
  end
  else if fDm.q.FieldByName('Tlevel').AsString = 'Scale A' then
  begin
    ComboBox_Level.ItemIndex := 1;
  end
  else if fDm.q.FieldByName('Tlevel').AsString = 'Scale B' then
  begin
    ComboBox_Level.ItemIndex := 2;
  end
  else if fDm.q.FieldByName('Tlevel').AsString = 'Scale C' then
  begin
    ComboBox_Level.ItemIndex := 3;
  end
  else if fDm.q.FieldByName('Tlevel').AsString = 'All' then
  begin
    ComboBox_Level.ItemIndex := 4;
  end;

  LabeledEdit_Record.Text := fDm.q.FieldByName('Record').AsString;
  LabeledEdit_Wod2.Text := fDm.q.FieldByName('Wod2').AsString;
  DatePicker1.Date := fDm.q.FieldByName('Tdate').AsDateTime;

end;

procedure TfManager_NotRecord.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  fManager_NotRecord := nil;
end;

procedure TfManager_NotRecord.FormCreate(Sender: TObject);
begin
  DatePicker1.Date := Date;
end;

end.
