unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TfLogin = class(TForm)
    Image2: TImage;
    Image3: TImage;
    Label2: TLabel;
    Edit_Id: TEdit;
    Edit_Pw: TEdit;
    Btn_Login: TButton;
    Btn_LoginCancel: TButton;
    Label1: TLabel;
    Btn_NewBox: TButton;
    Btn_NewPerson: TButton;
    Button1: TButton;
    Label_CheckLogin: TLabel;
    Button2: TButton;
    procedure Btn_NewBoxClick(Sender: TObject);
    procedure Btn_NewPersonClick(Sender: TObject);
    procedure Btn_LoginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLogin: TfLogin;

implementation

{$R *.dfm}

uses uLogin_NewBox, uLogin_NewPerson, uMain, uDm, uCommunity_My, uFind_Id,
  uFind_Pw;

procedure TfLogin.Btn_LoginClick(Sender: TObject);
begin
  if (Edit_Id.Text ='') or (Edit_Pw.Text = '') then
  begin
    ShowMessage('잘못된 로그인 정보입니다.' + #13 + '다시입력해주세요.');
    Edit_Id.SetFocus;
    Exit;
  end;

  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT * FROM V_Login');
  fDm.q.SQL.Add('WHERE BoxId = :BoxId');
  fDm.q.SQL.Add('OR    Id = :Id');
  fDm.q.ParamByName('BoxId').AsString := Edit_Id.Text;
  fDm.q.ParamByName('Id').AsString := Edit_Id.Text;
  fDm.q.Open;

  if fDm.q.IsEmpty then
  begin
    ShowMessage('사용자를 찾을 수 없습니다.' + #13 + '다시 입력해주세요.');
    Edit_Id.SetFocus;
    Exit;
  end;

  if Edit_Id.Text = fDm.q.FieldByName('BoxId').AsString then
  begin
    if fDm.q.FieldByName('BoxPw').AsString <> Edit_Pw.Text then
    begin
      ShowMessage('암호가 일치하지 않습니다.' + #13 + '다시 입력해주세요.');
      Edit_Pw.SetFocus;
      Label_CheckLogin.Caption := 'X';
      Exit;
    end
    else
    begin
      ModalResult := mrOk;
      fMain.Record_My.Visible := False;
      fMain.Notice.Visible := False;
      Label_CheckLogin.Caption := 'O';
    end;
    fMain.Caption := '박스 ' + fDm.q.FieldByName('BoxName').AsString + ' 관리자';

  end;

  if Edit_Id.Text = fDm.q.FieldByName('Id').AsString then
  begin
    if fDm.q.FieldByName('Pw').AsString <> Edit_Pw.Text then
    begin
      ShowMessage('암호가 일치하지 않습니다.' + #13 + '다시 입력해주세요.');
      Edit_Pw.SetFocus;
      Label_CheckLogin.Caption := 'X';
      Exit;
    end
    else
    begin
      ModalResult := mrOk;
      fMain.MainMenu_Manager.Visible := False;
      Label_CheckLogin.Caption := 'O'
    end;
    fMain.Caption := fDm.q.FieldByName('BoxName').AsString +' 박스회원' + ' : ' + fDm.q.FieldByName('Name').AsString;

  end;

end;

procedure TfLogin.Btn_NewBoxClick(Sender: TObject);
begin
  if fLogin_NewBox = nil then
  begin
    fLogin_NewBox:=TfLogin_NewBox.Create(Self);
    fLogin_NewBox.showModal;
  end;
end;

procedure TfLogin.Btn_NewPersonClick(Sender: TObject);
begin
  if fLogin_NewPerson = nil then
  begin
    fLogin_NewPerson:=TfLogin_NewPerson.Create(Self);
    fLogin_NewPerson.showModal;
  end;
end;

procedure TfLogin.Button1Click(Sender: TObject);
begin
  if fFind_Id = nil then
  begin
    fFind_Id:=TfFind_Id.Create(Self);
    fFind_Id.showModal;
  end;
end;

procedure TfLogin.Button2Click(Sender: TObject);
begin
//  ShowMessage('준비중입니다.');
  if fFind_Pw = nil then
  begin
    fFind_Pw := TfFind_Pw.Create(Self);
    fFind_Pw.showModal;
  end;
end;

procedure TfLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fLogin := nil;
  Action := caFree;

  if Label_CheckLogin.Caption = 'O' then
  begin
    if fCommunity_My = nil then
    begin
      fCommunity_My:=TfCommunity_My.Create(Self);
      fCommunity_My.showModal;
    end;
  end
  else
  begin
    Close;
  end;

end;

end.
