unit uFind_Pw;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TfFind_Pw = class(TForm)
    LabeledEdit_BoxNum: TLabeledEdit;
    LabeledEdit_Id: TLabeledEdit;
    LabeledEdit_Name: TLabeledEdit;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    Panel_Reset: TPanel;
    LabeledEdit_Pw: TLabeledEdit;
    LabeledEdit_CheckPw: TLabeledEdit;
    Panel1: TPanel;
    Button_Modify: TButton;
    Button_Cancel: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button_CancelClick(Sender: TObject);
    procedure Button_ModifyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFind_Pw: TfFind_Pw;

implementation

{$R *.dfm}

uses uDm;

procedure TfFind_Pw.Button1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
  begin
    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('SELECT * FROM V_Login');
    fDm.q.SQL.Add('WHERE BoxNum = :BoxNum');
    fDm.q.SQL.Add('AND   BoxName = :BoxName');
    fDm.q.SQL.Add('AND   BoxId = :BoxId');
    fDm.q.ParamByName('BoxNum').AsString := UpperCase(LabeledEdit_BoxNum.Text);
    fDm.q.ParamByName('BoxName').AsString := LabeledEdit_Name.Text;
    fDm.q.ParamByName('BoxId').AsString := LabeledEdit_Id.Text;
    fDm.q.Open;

    if UpperCase(LabeledEdit_BoxNum.Text) = fDm.q.FieldByName('BoxNum').AsString then
    begin
      if fDm.q.FieldByName('BoxName').AsString <> LabeledEdit_Name.Text then
      begin
        ShowMessage('박스이름이 일치하지 않습니다.' + #13 + '다시 입력해주세요.');
        LabeledEdit_Name.SetFocus;
        LabeledEdit_Name.Clear;
        Exit;
      end

      else if fDm.q.FieldByName('BoxId').AsString <> LabeledEdit_Id.Text then
      begin
        ShowMessage('아이디가 일치하지 않습니다.' + #13 + '다시 입력해주세요.');
        LabeledEdit_Id.SetFocus;
        LabeledEdit_Id.Clear;
        Exit;
      end

      else
      begin
        ShowMessage('확인되었습니다.');
        Panel_Reset.Visible := True;
        LabeledEdit_BoxNum.Enabled := False;
        LabeledEdit_Id.Enabled := False;
        LabeledEdit_Name.Enabled := False;
      end;
    end;
  end

  else if RadioGroup1.ItemIndex = 1 then
  begin
    fDm.q.Close;
    fDm.q.SQL.Clear;
    fDm.q.SQL.Add('SELECT BoxNum, Id, Name FROM V_Login');
    fDm.q.SQL.Add('WHERE BoxNum = :BoxNum');
    fDm.q.SQL.Add('AND   Name = :Name');
    fDm.q.SQL.Add('AND   Id = :Id');
    fDm.q.ParamByName('BoxNum').AsString := UpperCase(LabeledEdit_BoxNum.Text);
    fDm.q.ParamByName('Name').AsString := LabeledEdit_Name.Text;
    fDm.q.ParamByName('Id').AsString := LabeledEdit_Id.Text;
    fDm.q.Open;

    if UpperCase(LabeledEdit_BoxNum.Text) = fDm.q.FieldByName('BoxNum').AsString then
    begin
      if LabeledEdit_Name.Text <> Trim(fDm.q.FieldByName('Name').AsString) then
      begin
        ShowMessage('회원이름이 일치하지 않습니다.' + #13 + '다시 입력해주세요.');
        LabeledEdit_Name.SetFocus;
        Exit;
      end
      else if LabeledEdit_Id.Text <> Trim(fDm.q.FieldByName('Id').AsString) then
      begin
        ShowMessage('회원아이디가 일치하지 않습니다.' + #13 + '다시 입력해주세요.');
        LabeledEdit_Id.SetFocus;
        Exit;
      end
      else
      begin
        ShowMessage('확인되었습니다.');
        Panel_Reset.Visible := True;
        LabeledEdit_BoxNum.Enabled := False;
        LabeledEdit_Id.Enabled := False;
        LabeledEdit_Name.Enabled := False;
      end;
    end;
  end

  else
  begin
    ShowMessage('박스인지 개인인지 선택해주세요.');
    RadioGroup1.SetFocus;
  end;
end;

procedure TfFind_Pw.Button_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfFind_Pw.Button_ModifyClick(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
  begin
    if LabeledEdit_Pw.Text <> LabeledEdit_CheckPw.Text then
    begin
      ShowMessage('비밀번호를 확인하세요.');
      LabeledEdit_CheckPw.Clear;
      LabeledEdit_CheckPw.SetFocus;
    end
    else
    begin
      fDm.q_FindId.Close;
      fDm.q_FindId.SQL.Clear;
      fDm.q_FindId.SQL.Add('UPDATE BoxManagementTbl BoxPw = :BoxPw');
      fDm.q_FindId.SQL.Add('WHERE BoxNum = :BoxNum');
      fDm.q_FindId.SQL.Add('AND   BoxId = :BoxId');
      fDm.q_FindId.SQL.Add('AND   BoxName = :BoxName');
      fDm.q_FindId.ParamByName('BoxNum').AsString := LabeledEdit_BoxNum.Text;
      fDm.q_FindId.ParamByName('BoxId').AsString := LabeledEdit_Id.Text;
      fDm.q_FindId.ParamByName('BoxName').AsString := LabeledEdit_Name.Text;
      fDm.q_FindId.ParamByName('BoxPw').AsString := LabeledEdit_Pw.Text;
      fDm.q_FindId.ExecSQL;
    end;
  end
  else if RadioGroup1.ItemIndex = 1 then
  begin
    if LabeledEdit_Pw.Text <> LabeledEdit_CheckPw.Text then
    begin
      ShowMessage('비밀번호를 확인하세요.');
      LabeledEdit_CheckPw.Clear;
      LabeledEdit_CheckPw.SetFocus;
    end
    else
    begin
      fDm.q_FindId.Close;
      fDm.q_FindId.SQL.Clear;
      fDm.q_FindId.SQL.Add('UPDATE PersonManagementTbl SET Pw = :Pw');
      fDm.q_FindId.SQL.Add('WHERE BoxNum = :BoxNum');
      fDm.q_FindId.SQL.Add('AND   Id = :Id');
      fDm.q_FindId.SQL.Add('AND   Name = :Name');
      fDm.q_FindId.ParamByName('BoxNum').AsString := LabeledEdit_BoxNum.Text;
      fDm.q_FindId.ParamByName('Id').AsString := LabeledEdit_Id.Text;
      fDm.q_FindId.ParamByName('Name').AsString := LabeledEdit_Name.Text;
      fDm.q_FindId.ParamByName('Pw').AsString := LabeledEdit_Pw.Text;
      fDm.q_FindId.ExecSQL;
      ShowMessage('수정되었습니다.');
      Close;
    end;
  end;
end;

procedure TfFind_Pw.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fFind_Pw := nil;
end;

end.
