unit uLogin_My;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TfLogin_MyBox = class(TForm)
    LabeledEdit_BoxName: TLabeledEdit;
    LabeledEdit_BoxMaster: TLabeledEdit;
    LabeledEdit_BoxMobile: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    LabeledEdit_BoxNum: TLabeledEdit;
    LabeledEdit_BoxId: TLabeledEdit;
    LabeledEdit_BoxPw: TLabeledEdit;
    LabeledEdit_CheckPw: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLogin_MyBox: TfLogin_MyBox;

implementation

{$R *.dfm}

uses uDm, uMain;

procedure TfLogin_MyBox.Button1Click(Sender: TObject);
begin
  if LabeledEdit_BoxPw.Text <> LabeledEdit_CheckPw.Text then
  begin
    ShowMessage('비밀번호를 확인하세요.');
    Exit;
  end
  else
  begin
    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('UPDATE BoxManagementTbl');
    fDm.q.SQL.Add('SET BoxName =:BoxName, BoxMaster = :BoxMaster, BoxMobile =:BoxMobile, BoxPw = :BoxPw');
    fDm.q.SQL.Add('WHERE BoxNum = :BoxNum');
    fDm.q.ParamByName('BoxName').AsString := LabeledEdit_BoxName.Text;
    fDm.q.ParamByName('BoxMaster').AsString := LabeledEdit_BoxMaster.Text;
    fDm.q.ParamByName('BoxMobile').AsString := LabeledEdit_BoxMobile.Text;
    fDm.q.ParamByName('BoxPw').AsString := LabeledEdit_BoxPw.Text;
    fDm.q.ParamByName('BoxNum').AsString := LabeledEdit_BoxNum.Text;
    fDm.q.ExecSQL;
    if LabeledEdit_BoxPw.Text = '' then
    begin
      ShowMessage('비밀번호를 입력하세요.');
      LabeledEdit_BoxPw.SetFocus;
      Exit;
    end;
    ShowMessage('수정되었습니다.');
    Close;
  end;
end;

procedure TfLogin_MyBox.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfLogin_MyBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fLogin_MyBox := nil;
end;

procedure TfLogin_MyBox.FormCreate(Sender: TObject);
var
  vBoxName : string;
begin
  vBoxName := Copy(fMain.Caption, Pos('박스', fMain.Caption)+3, Pos('관리자', fMain.Caption)-4);
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT * FROM BoxManagementTbl');
  FDM.q.SQL.Add('WHERE BoxName = :BoxName');
  fDm.q.ParamByName('BoxName').AsString := vBoxName;
  fDm.q.Open;

  LabeledEdit_BoxNum.Text := fDm.q.FieldByName('BoxNum').AsString;
  LabeledEdit_BoxMaster.Text := fDm.q.FieldByName('BoxMaster').AsString;
  LabeledEdit_BoxName.Text := fDm.q.FieldByName('BoxName').AsString;
  LabeledEdit_BoxMobile.Text := fDm.q.FieldByName('BoxMobile').AsString;
  LabeledEdit_BoxId.Text := fDm.q.FieldByName('BoxId').AsString;
end;

end.
