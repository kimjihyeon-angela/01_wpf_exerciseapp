unit uManager_Wod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Grids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.WinXPickers,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBGrids, Vcl.WinXCtrls;

type
  TfManager_Wod = class(TForm)
    Panel_Wod: TPanel;
    Btn_Re: TButton;
    Panel1: TPanel;
    Panel_NewWod2: TPanel;
    LabeledEdit_NewWod2: TLabeledEdit;
    Btn_Set: TButton;
    ComboBox_Wod1: TComboBox;
    Button1: TButton;
    Panel3: TPanel;
    Btn_NewWod: TButton;
    Panel4: TPanel;
    TreeView_Wod: TTreeView;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Btn_Insert: TButton;
    Btn_Delete: TButton;
    Btn_Up: TButton;
    Btn_Down: TButton;
    Button2: TButton;
    DBGrid2: TDBGrid;
    Button3: TButton;
    SearchBox1: TSearchBox;
    Btn_Modify: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Btn_ReClick(Sender: TObject);
    procedure Btn_NewWodClick(Sender: TObject);
    procedure Btn_SetClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Btn_InsertClick(Sender: TObject);
    procedure Btn_DeleteClick(Sender: TObject);
    procedure Btn_UpClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Btn_DownClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SearchBox1InvokeSearch(Sender: TObject);
    procedure Btn_ModifyClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fManager_Wod: TfManager_Wod;

implementation

{$R *.dfm}

uses  uDm, uManager_WodSelected2, uManager_Wod2, uMain;

procedure TfManager_Wod.Btn_NewWodClick(Sender: TObject);
var
  vWod1 : string;
begin
  Panel_NewWod2.Visible := True;
  Panel1.Visible := True;
  ComboBox_Wod1.Items.Clear;
  fDm.q_Wod.Close;
  fDm.q_Wod.SQL.Clear;
  fDm.q_Wod.SQL.Add('SELECT Wod1,count(*) FROM Wod_SummaryTbl');
  fDm.q_Wod.SQL.Add('GROUP BY WOD1');
  fDm.q_Wod.Open;

  fDm.q_Wod.First;
  while not fDm.q_Wod.Eof do
  begin
    vWod1 := fDm.q_Wod.FieldByName('WOD1').AsString;
    ComboBox_Wod1.Items.Add(vWod1);
    fDm.q_Wod.Next;
  end;
  fDm.q_Wod.Close;
end;

procedure TfManager_Wod.Btn_ReClick(Sender: TObject);
var
  t : TTreeNode;
  vWod1, vWod2, OldvWod1 : string;
begin
  fDm.q_Wod.Close;
  fDm.q_Wod.SQL.Clear;
  fDm.q_Wod.SQL.Add('SELECT * FROM Wod_SummaryTbl');
  fDm.q_Wod.SQL.Add('ORDER BY WOD1');
  fDm.q_Wod.Open;

  TreeView_Wod.Items.Clear;
  while not fDm.q_Wod.Eof do
  begin
    vWod1 := fDm.q_Wod.FieldByName('WOD1').AsString;
    vWod2 := fDm.q_Wod.FieldByName('WOD2').AsString;
    if vWod1 <> OldvWod1 then
    begin
      TreeView_Wod.Selected
      := TreeView_Wod.Items.Add(TreeView_Wod.Selected, vWod1);
      TreeView_Wod.Selected.SelectedIndex := 1;
      OldvWod1 := vWod1;
    end;
    t := TreeView_Wod.Items.AddChildObject(TreeView_Wod.Selected, vWod2 , nil);
    fDm.q_Wod.Next;
  end;
  fDm.q_Wod.Close;


end;

procedure TfManager_Wod.Btn_SetClick(Sender: TObject);
begin
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('INSERT INTO Wod_SummaryTbl');
  fDm.q.SQL.Add('(Wod1, Wod2)');
  fDm.q.SQL.Add('VALUES ( :Wod1, :Wod2)');
  fDm.q.ParamByName('Wod1').AsString := ComboBox_Wod1.Text;
  fDm.q.ParamByName('wod2').AsString := UpperCase(LabeledEdit_NewWod2.Text);
  fDm.q.ExecSQL;
  ShowMessage('운동이 추가되었습니다.');
  Panel_NewWod2.Visible := False;
  fManager_Wod.Btn_Re.Click;
  ComboBox_Wod1.ItemIndex := -1;
  LabeledEdit_NewWod2.Text := '';
end;

procedure TfManager_Wod.Button1Click(Sender: TObject);
begin
  Panel1.Visible := False;
end;

procedure TfManager_Wod.Button2Click(Sender: TObject);
begin
  DBGrid1.Visible := False;
  DBGrid2.Visible := False;
end;

procedure TfManager_Wod.Button3Click(Sender: TObject);
begin
  fDm.q_Wod.Close;
  fDm.q_Wod.SQL.Clear;
  fDm.q_Wod.SQL.Add('SELECT DISTINCT Tdate, Wod2 FROM WodTbl');
  fDm.q_Wod.SQL.Add('ORDER BY Tdate');
  fDm.q_Wod.Open;
  fManager_Wod.DBGrid1.Visible := True;
end;

procedure TfManager_Wod.Button4Click(Sender: TObject);
begin
  Close;
//  Form2.ListBox_WodSelected.Clear;
//  Form2.LabeledEdit_Weight.Clear;
//  Form2.LabeledEdit_Count.Clear;
//  Form2.LabeledEdit_TimeCap.Clear;
//  Form2.LabeledEdit_Round.Clear;
//  Form2.LabeledEdit_VideoLink.Clear;
//  Form2.CheckListBox_WeightCount.ItemIndex := -1;
end;

procedure TfManager_Wod.DBGrid1CellClick(Column: TColumn);
begin
  Panel_Wod.Visible := True;
  DBGrid2.Visible := True;
  fdm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT Wod_Detail, Tlevel, Gender, Weight, Count FROM WodTbl');
  fDm.q.SQL.Add('WHERE Wod2  = :Wod2');
  fDm.q.ParamByName('Wod2').AsString := DBGrid1.SelectedField.Text;
  fDm.q.Open;

end;

procedure TfManager_Wod.Btn_DownClick(Sender: TObject);
var
  i: Integer;
  vCount : Integer;
begin
  vCount := 0;
  for i := 0 to Form2.ListBox_WodSelected.Items.Count-1 do
  begin
    if Form2.ListBox_WodSelected.Selected[i] then
    begin
      vCount := i;
    end;
  end;
  Form2.ListBox_WodSelected.Items.Move(vCount,vCount+1);

end;

procedure TfManager_Wod.Btn_InsertClick(Sender: TObject);
var
  i : Integer;
  vWod : string;
begin
  Panel_Wod.Visible := True;
  if Form2 = nil then
  begin
    Form2 := TForm2.Create(Self);
    Form2.Parent := Panel_Wod;
    Form2.Align := alClient;
    Form2.WindowState := TWindowState.wsMaximized;
    Form2.BorderStyle := bsNone;
  end;
  Form2.Show;

  for i := 0 to TreeView_Wod.SelectionCount-1 do
  begin
    vWod := TreeView_Wod.Selections[i].Text;
    Form2.ListBox_WodSelected.Items.Add(vWod)
  end;
end;

procedure TfManager_Wod.Btn_ModifyClick(Sender: TObject);
var
  vBoxName : string;
begin
  vBoxName := Copy(fMain.Caption, Pos('박스', fMain.Caption)+3, Pos('관리자', fMain.Caption)-4);
  Panel_Wod.Visible := True;
  if Form2 = nil then
  begin
    Form2 := TForm2.Create(Self);
    Form2.Parent := Panel_Wod;
    Form2.Align := alClient;
    Form2.WindowState := TWindowState.wsMaximized;
    Form2.BorderStyle := bsNone;
  end;
  Form2.Show;
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT * FROM WodTbl');
  fDm.q.SQL.Add('WHERE Wod2 = :Wod2');
  fDm.q.SQL.Add('AND   BoxName = :BoxName');
  fDm.q.ParamByName('Wod2').AsString := DBGrid1.SelectedField.Text;
  fDm.q.ParamByName('BoxName').AsString := vBoxName;
  fDm.q.Open;

  Form2.ListBox_WodSelected.Items.Text := fDm.q.FieldByName('Wod2').AsString;
  Form2.ComboBox_Level.Text := fDm.q.FieldByName('Tlevel').AsString;
  Form2.ComboBox_Gender.Text := fDm.q.FieldByName('Gender').AsString;
  Form2.LabeledEdit_Weight.Text := fDm.q.FieldByName('Weight').AsString;
  Form2.LabeledEdit_Count.Text := fDm.q.FieldByName('Count').AsString;

  DBGrid1.Visible := False;

end;

procedure TfManager_Wod.Btn_DeleteClick(Sender: TObject);
begin
  Form2.ListBox_WodSelected.DeleteSelected;
end;

procedure TfManager_Wod.Btn_UpClick(Sender: TObject);
var
  i: Integer;
  vCount : Integer;
begin
  vCount := 0;
  for i := 0 to Form2.ListBox_WodSelected.Items.Count-1 do
  begin
    if Form2.ListBox_WodSelected.Selected[i] then
    begin
      vCount := i;
    end;
  end;
  Form2.ListBox_WodSelected.Items.Move(vCount,vCount-1);
end;

procedure TfManager_Wod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fManager_Wod := nil;
end;

procedure TfManager_Wod.FormCreate(Sender: TObject);
var
  t : TTreeNode;
  vWod1, vWod2, OldvWod1 : string;
begin
  fDm.q_Wod.Close;
  fDm.q_Wod.SQL.Clear;
  fDm.q_Wod.SQL.Add('SELECT * FROM Wod_SummaryTbl');
  fDm.q_Wod.SQL.Add('ORDER BY WOD1');
  fDm.q_Wod.Open;

  TreeView_Wod.Items.Clear;
  while not fDm.q_Wod.Eof do
  begin
    vWod1 := fDm.q_Wod.FieldByName('WOD1').AsString;
    vWod2 := fDm.q_Wod.FieldByName('WOD2').AsString;
    if vWod1 <> OldvWod1 then
    begin
      TreeView_Wod.Selected
      := TreeView_Wod.Items.Add(TreeView_Wod.Selected, vWod1);
      TreeView_Wod.Selected.SelectedIndex := 1;
      OldvWod1 := vWod1;
    end;
    t := TreeView_Wod.Items.AddChildObject(TreeView_Wod.Selected, vWod2 , nil);
    fDm.q_Wod.Next;
  end;
  fDm.q_Wod.Close;

end;

procedure TfManager_Wod.SearchBox1InvokeSearch(Sender: TObject);
var
  i: Integer;
  vWod : string;
begin
  vWod := UpperCase(SearchBox1.Text);

  for i := 0 to TreeView_Wod.Items.Count-1 do
  begin
    if vWod = TreeView_Wod.Items.Item[i].Text then
    begin
      TreeView_Wod.Selected := TreeView_Wod.Items.Item[i];
    end;
  end;
  SearchBox1.Text := '';

end;

end.
