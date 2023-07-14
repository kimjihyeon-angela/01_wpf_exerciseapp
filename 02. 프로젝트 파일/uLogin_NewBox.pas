unit uLogin_NewBox;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TfLogin_NewBox = class(TForm)
    LabeledEdit_BoxName: TLabeledEdit;
    LabeledEdit_BoxMaster: TLabeledEdit;
    LabeledEdit_BoxMobile: TLabeledEdit;
    Btn_NewBox: TButton;
    Btn_Cancel: TButton;
    LabeledEdit_BoxNum: TLabeledEdit;
    LabeledEdit_BoxId: TLabeledEdit;
    Btn_Check: TButton;
    LabeledEdit_BoxPw: TLabeledEdit;
    LabeledEdit_CheckPw: TLabeledEdit;
    Btn_NewCode: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Btn_NewCodeClick(Sender: TObject);
    procedure Btn_CheckClick(Sender: TObject);
    procedure Btn_NewBoxClick(Sender: TObject);
    procedure Btn_CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLogin_NewBox: TfLogin_NewBox;

implementation

{$R *.dfm}

uses uDm;

procedure TfLogin_NewBox.Btn_NewBoxClick(Sender: TObject);
begin
  if LabeledEdit_BoxNum.Text = '' then
  begin
    ShowMessage('�ڽ���ȣ �ο��ϱ� ��ư�� ���� �����ּ���.');
  end
  else if LabeledEdit_BoxId.Text = '' then
  begin
    ShowMessage('���̵� �Է��ϼ���.');
    LabeledEdit_BoxId.SetFocus;
  end
  else if LabeledEdit_BoxPw.Text = '' then
  begin
    ShowMessage('��й�ȣ�� �Է��ϼ���.');
    LabeledEdit_BoxPw.SetFocus;
  end
  else if LabeledEdit_CheckPw.Text = '' then
  begin
    ShowMessage('��й�ȣȮ���� �Է��ϼ���.');
    LabeledEdit_CheckPw.SetFocus;
  end
  else if LabeledEdit_BoxPw.Text <> LabeledEdit_CheckPw.Text then
  begin
    ShowMessage('��й�ȣ�� Ȯ�����ּ���.');
    LabeledEdit_CheckPw.SetFocus;
  end
  else if LabeledEdit_BoxName.Text = '' then
  begin
    ShowMessage('�ڽ� �̸��� �Է��ϼ���.');
    LabeledEdit_BoxName.SetFocus;
  end
  else if LabeledEdit_BoxMaster.Text = '' then
  begin
    ShowMessage('�ڽ� å���ڸ� �Է��ϼ���.');
    LabeledEdit_BoxMaster.SetFocus;
  end
  else if LabeledEdit_BoxMobile.Text = '' then
  begin
    ShowMessage('�ڽ� ��ǥ��ȣ�� �Է��ϼ���.');
    LabeledEdit_BoxMobile.SetFocus;
  end
  else
  begin
    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add(' EXEC usp_Project @option = :Option');
    fDm.q.SQL.Add(' ,@BoxNum = :BoxNum ,@BoxId = :BoxId ,@BoxMaster = :BoxMaster');
    fDm.q.SQL.Add(' ,@BoxMobile = :BoxMobile ,@BoxName = :BoxName, @BoxPw = :BoxPw');
    fDm.q.ParamByName('Option').AsString := 'D';
    fDm.q.ParamByName('BoxNum').AsString := LabeledEdit_BoxNum.Text;
    fDm.q.ParamByName('BoxId').AsString := LabeledEdit_BoxId.Text;
    fDm.q.ParamByName('BoxMaster').AsString := LabeledEdit_BoxMaster.Text;
    fDm.q.ParamByName('BoxMobile').AsString := LabeledEdit_BoxMobile.Text;
    fDm.q.ParamByName('BoxName').AsString := LabeledEdit_BoxName.Text;
    fDm.q.ParamByName('BoxPw').AsString := LabeledEdit_BoxPw.Text;
    fDm.q.ExecSQL;
    ShowMessage('������ �Ϸ�Ǿ����ϴ�.');
    Close;
  end;

end;

procedure TfLogin_NewBox.Btn_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfLogin_NewBox.Btn_CheckClick(Sender: TObject);
var
  vBoxId : string;
begin
  vBoxId := LabeledEdit_BoxId.Text;
  if LabeledEdit_BoxNum.Text = '' then
  begin
    ShowMessage('�ڽ���ȣ �ο��ϱ� ��ư�� ���� �����ּ���.');
  end
  else if vBoxId = '' then
  begin
    ShowMessage('���̵� �Է��ϼ���.');
  end
  else
  begin
    fDm.q_Login.Close;
    fDm.q_Login.SQL.Clear;
    fDm.q_Login.SQL.Add('SELECT * FROM BoxManagementTbl');
    fDm.q_Login.SQL.Add('WHERE BoxId = :BoxId');
    fDm.q_Login.ParamByName('BoxId').AsString := vBoxId;
    fDm.q_Login.Open;

    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('SELECT * FROM PersonManagementTbl');
    fDm.q.SQL.Add('WHERE Id = :Id');
    fDm.q.ParamByName('Id').AsString := vBoxId;
    fDm.q.Open;

    if (vBoxId = fDm.q_Login.FieldByName('BoxId').AsString) or (vBoxId = fDm.q.FieldByName('Id').AsString) then
    begin
      ShowMessage('�ߺ��� ���̵��Դϴ�. �ٸ� ���̵� �Է����ּ���.');
      LabeledEdit_BoxId.Clear;
      LabeledEdit_BoxId.SetFocus;
    end
    else
    begin
      ShowMessage('��밡���� ���̵��Դϴ�.');
    end;
  end;

end;

procedure TfLogin_NewBox.Btn_NewCodeClick(Sender: TObject);
begin
  fDm.q_NewCode.Close;
  fDm.q_NewCode.SQL.Clear;
  fDm.q_NewCode.SQL.Add('EXEC usp_Project @Option = :Option');
  fDm.q_NewCode.ParamByName('Option').AsString := 'B';
  fDm.q_NewCode.Open;
  LabeledEdit_BoxNum.Text := fDm.q_NewCode.FieldByName('NEWCODE').AsString;
end;

procedure TfLogin_NewBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fLogin_NewBox := nil;
end;

procedure TfLogin_NewBox.FormCreate(Sender: TObject);
begin
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('EXEC usp_Project @Option = :Option');
  fDm.q.ParamByName('Option').AsString := 'A';
  fDm.q.Open;
end;

end.
