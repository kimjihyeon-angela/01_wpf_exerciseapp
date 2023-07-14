unit uLogin_NewPerson;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.WinXPickers;

type
  TfLogin_NewPerson = class(TForm)
    LabeledEdit_Pw: TLabeledEdit;
    LabeledEdit_CheckPw: TLabeledEdit;
    Btn_NewPerson: TButton;
    Btn_Cancel: TButton;
    LabeledEdit_Name: TLabeledEdit;
    Panel1: TPanel;
    LabeledEdit_BoxNum: TLabeledEdit;
    Btn_CheckBox: TButton;
    Panel2: TPanel;
    LabeledEdit_Id: TLabeledEdit;
    Btn_Check: TButton;
    Panel3: TPanel;
    Label1: TLabel;
    DatePicker1: TDatePicker;
    Panel4: TPanel;
    Label2: TLabel;
    ComboBox_Gender: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_CheckBoxClick(Sender: TObject);
    procedure Btn_CheckClick(Sender: TObject);
    procedure Btn_NewPersonClick(Sender: TObject);
    procedure Btn_CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLogin_NewPerson: TfLogin_NewPerson;

implementation

{$R *.dfm}

uses uDm;

procedure TfLogin_NewPerson.Btn_NewPersonClick(Sender: TObject);
begin
  if LabeledEdit_BoxNum.Text = '' then
  begin
    ShowMessage('박스 번호를 입력해주세요.');
    LabeledEdit_BoxNum.SetFocus;
  end
  else if LabeledEdit_Id.Text = '' then
  begin
    ShowMessage('아이디를 입력해주세요.');
    LabeledEdit_Id.SetFocus;
  end
  else if LabeledEdit_Name.Text = '' then
  begin
    ShowMessage('이름을 입력해주세요.');
    LabeledEdit_Name.SetFocus;
  end
  else if LabeledEdit_Pw.Text = '' then
  begin
    ShowMessage('비밀번호를 입력해주세요.');
    LabeledEdit_Pw.SetFocus;
  end
  else if LabeledEdit_Pw.Text <> LabeledEdit_CheckPw.Text then
  begin
    ShowMessage('비밀번호를 확인해주세요.');
    LabeledEdit_CheckPw.SetFocus;
  end
  else if DatePicker1.Date > Date then
  begin
    ShowMessage('생년월일을 다시 선택해주세요.');
    DatePicker1.SetFocus;
  end
  else if ComboBox_Gender.ItemIndex < 0 then
  begin
    ShowMessage('성별을 선택해주세요.');
    ComboBox_Gender.SetFocus;
  end
  else
  begin
    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('INSERT INTO PersonManagementTbl (BoxNum, Id, Pw, Name, BirthYear, Gender)');
    fDm.q.SQL.Add('VALUES (:BoxNum, :Id, :Pw, :Name, :BirthYear, :Gender)');
    fDm.q.ParamByName('BoxNum').AsString := LabeledEdit_BoxNum.Text;
    fDm.q.ParamByName('Id').AsString := LabeledEdit_Id.Text;
    fdm.q.ParamByName('Pw').AsString := LabeledEdit_Pw.Text;
    fDm.q.ParamByName('Name').AsString := LabeledEdit_Name.Text;
    fDm.q.ParamByName('BirthYear').AsDate := DatePicker1.Date;
    fDm.q.ParamByName('Gender').AsInteger := ComboBox_Gender.ItemIndex;
    fDm.q.ExecSQL;
    ShowMessage('가입이 완료되었습니다.');
    Close;
  end;

end;

procedure TfLogin_NewPerson.Btn_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfLogin_NewPerson.Btn_CheckClick(Sender: TObject);
var
  vId : string;
begin
  vId := LabeledEdit_Id.Text;
  if LabeledEdit_BoxNum.Text = '' then
  begin
    ShowMessage('박스번호를 입력하세요.');
  end
//  else if LabeledEdit_BoxNum.Text <> fDm.q.FieldByName('BoxNum').AsString then
//  begin
//    ShowMessage('박스번호 확인하기 버튼을 먼저 눌러주세요.');
//  end
  else if vId = '' then
  begin
    ShowMessage('아이디를 입력하세요.');
  end
  else
  begin
    fDm.q_Login.Close;
    fDm.q_Login.SQL.Clear;
    fDm.q_Login.SQL.Add('SELECT * FROM PersonManagementTbl');
    fDm.q_Login.SQL.Add('WHERE Id = :Id');
    fDm.q_Login.ParamByName('Id').AsString := vId;
    fDm.q_Login.Open;

    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('SELECT * FROM BoxManagementTbl');
    fDm.q.SQL.Add('WHERE BoxId = :BoxId');
    fDm.q.ParamByName('BoxId').AsString := vId;
    fDm.q.Open;

    if (vId = fDm.q_Login.FieldByName('Id').AsString) or (vId = fDm.q.FieldByName('BoxId').AsString) then
    begin
      ShowMessage('중복된 아이디입니다. 다른 아이디를 입력해주세요.');
      LabeledEdit_Id.Clear;
      LabeledEdit_Id.SetFocus;
    end
    else
    begin
      ShowMessage('사용가능한 아이디입니다.');
    end;
  end;
end;

procedure TfLogin_NewPerson.Btn_CheckBoxClick(Sender: TObject);
var
  vBoxNum : string;
begin
  vBoxNum := UpperCase(LabeledEdit_BoxNum.Text);
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT * FROM BoxManagementTbl');
  fDm.q.SQL.Add('WHERE BoxNum = :BoxNum');
  fDm.q.ParamByName('BoxNum').AsString := vBoxNum;
  fDm.q.Open;

  if vBoxNum = fDm.q.FieldByName('BoxNum').AsString then
  begin
    ShowMessage('박스 이름 : ' + fDm.q.FieldByName('BoxName').AsString + #13 + '확인 되었습니다.');
    Exit;
  end
  else
  begin
    ShowMessage('박스 번호를 확인해주세요.');
    LabeledEdit_BoxNum.Clear;
    LabeledEdit_BoxNum.SetFocus;
  end;
end;

procedure TfLogin_NewPerson.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  fLogin_NewPerson := nil;
end;

end.
