unit uLogin_My_Person;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.WinXPickers;

type
  TfLogin_My_Person = class(TForm)
    LabeledEdit_Pw: TLabeledEdit;
    LabeledEdit_CheckPw: TLabeledEdit;
    LabeledEdit_Name: TLabeledEdit;
    Panel3: TPanel;
    Label1: TLabel;
    DatePicker1: TDatePicker;
    Panel4: TPanel;
    Label2: TLabel;
    ComboBox_Gender: TComboBox;
    LabeledEdit_Id: TLabeledEdit;
    LabeledEdit_BoxNum: TLabeledEdit;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLogin_My_Person: TfLogin_My_Person;

implementation

{$R *.dfm}

uses uMain, uDm;

procedure TfLogin_My_Person.Button1Click(Sender: TObject);
begin
  if LabeledEdit_Pw.Text <> LabeledEdit_CheckPw.Text then
  begin
    ShowMessage('비밀번호를 확인하세요.');
    Exit;
  end
  else
  begin
    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('UPDATE PersonManagementTbl');
    fDm.q.SQL.Add('SET Name =:Name, Pw = :Pw, BirthYear = :BirthYear, Gender =:Gender');
    fDm.q.SQL.Add('WHERE BoxNum = :BoxNum');
    fDm.q.SQL.Add('AND   Id = :Id');
    fDm.q.ParamByName('Id').AsString := LabeledEdit_Id.Text;
    fDm.q.ParamByName('Name').AsString := LabeledEdit_Name.Text;
    fDm.q.ParamByName('Pw').AsString := LabeledEdit_Pw.Text;
    fDm.q.ParamByName('BoxNum').AsString := LabeledEdit_BoxNum.Text;
    fDm.q.ParamByName('BirthYear').AsDate := DatePicker1.Date;
    fDm.q.ParamByName('Gender').AsInteger := ComboBox_Gender.ItemIndex;
    fDm.q.ExecSQL;
    if LabeledEdit_Pw.Text = '' then
    begin
      ShowMessage('비밀번호를 입력하세요.');
      LabeledEdit_Pw.SetFocus;
      Exit;
    end;
    if ComboBox_Gender.ItemIndex < 0 then
    begin
      ShowMessage('성별을 선택하세요.');
      ComboBox_Gender.SetFocus;
      Exit;
    end;
    ShowMessage('수정되었습니다.');
    Close;
  end;
end;

procedure TfLogin_My_Person.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  fLogin_My_Person := nil;
end;

procedure TfLogin_My_Person.FormCreate(Sender: TObject);
var
  vName : string;
begin
  vName := Copy(fMain.Caption, Pos(':', fMain.Caption)+2, Length(fMain.Caption));
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT * FROM PersonManagementTbl');
  FDM.q.SQL.Add('WHERE Name = :Name');
  fDm.q.ParamByName('Name').AsString := vName;
  fDm.q.Open;

  LabeledEdit_BoxNum.Text := fDm.q.FieldByName('BoxNum').AsString;
  LabeledEdit_Name.Text := fDm.q.FieldByName('Name').AsString;
  LabeledEdit_Id.Text := fDm.q.FieldByName('Id').AsString;
  DatePicker1.Date := fDm.q.FieldByName('BirthYear').AsDateTime;
  case fDm.q.FieldByName('Gender').AsInteger of
  0 : ComboBox_Gender.Text := '남자';
  1 : ComboBox_Gender.Text := '여자';
  end;
end;

end.
