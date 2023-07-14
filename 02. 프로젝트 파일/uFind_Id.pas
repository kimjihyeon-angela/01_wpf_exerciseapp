unit uFind_Id;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXPickers,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TfFind_Id = class(TForm)
    Panel1: TPanel;
    Btn_Find_Id: TButton;
    Btn_Cancel: TButton;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    Panel3: TPanel;
    LabeledEdit_BoxNum: TLabeledEdit;
    LabeledEdit_Id: TLabeledEdit;
    LabeledEdit_BoxManager: TLabeledEdit;
    LabeledEdit_Name: TLabeledEdit;
    LabeledEdit_BoxName: TLabeledEdit;
    Panel_BirthYear: TPanel;
    Label1: TLabel;
    DatePicker1: TDatePicker;
    Panel_Gender: TPanel;
    Label2: TLabel;
    ComboBox_Gender: TComboBox;
    procedure Btn_CancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Btn_Find_IdClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFind_Id: TfFind_Id;

implementation

{$R *.dfm}

uses uDm;

procedure TfFind_Id.Btn_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfFind_Id.Btn_Find_IdClick(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
  begin
    fDm.q_FindId.Close;
    fDm.q_FindId.SQL.Clear;
    fDm.q_FindId.SQL.Add('SELECT * FROM V_Find_Id');
    fDm.q_FindId.SQL.Add('WHERE BoxName = :BoxName');
    fDm.q_FindId.SQL.Add('AND   BoxMaster = :BoxMaster');
    fDm.q_FindId.ParamByName('BoxName').AsString := LabeledEdit_BoxName.Text;
    fDm.q_FindId.ParamByName('BoxMaster').AsString := LabeledEdit_BoxManager.Text;
    fDm.q_FindId.Open;

    if fDm.q_FindId.FieldByName('BoxName').AsString <> LabeledEdit_BoxName.Text then
    begin
      ShowMessage('박스 이름을 확인해주세요.');
      LabeledEdit_BoxName.Clear;
      LabeledEdit_BoxName.SetFocus;
      Exit;
    end
    else if fDm.q_FindId.FieldByName('BoxMaster').AsString <> LabeledEdit_BoxManager.Text then
    begin
      ShowMessage('박스 책임자를 확인해주세요.');
      LabeledEdit_BoxManager.Clear;
      LabeledEdit_BoxManager.SetFocus;
      Exit;
    end
    else
    begin
      LabeledEdit_BoxNum.Text := fDm.q_FindId.FieldByName('BoxNum').AsString;
      LabeledEdit_Id.Text := fDm.q_FindId.FieldByName('BoxId').AsString;
      ShowMessage('박스번호 : ' + fDm.q_FindId.FieldByName('BoxNum').AsString + #13
                  + '아이디 : ' + fDm.q_FindId.FieldByName('BoxId').AsString);
    end;
  end
  else if RadioGroup1.ItemIndex = 1 then
  begin
    fDm.q_FindId.Close;
    fDm.q_FindId.SQL.Clear;
    fDm.q_FindId.SQL.Add('SELECT * FROM V_Find_Id');
    fDm.q_FindId.SQL.Add('WHERE Name = :Name');
    fDm.q_FindId.SQL.Add('AND   BirthYear = :BirthYear');
    fDm.q_FindId.SQL.Add('AND   Gender = :Gender');
    fDm.q_FindId.ParamByName('Name').AsString := LabeledEdit_Name.Text;
    fDm.q_FindId.ParamByName('BirthYear').AsDate := DatePicker1.Date;
    fDm.q_FindId.ParamByName('Gender').AsInteger := ComboBox_Gender.ItemIndex;
    fDm.q_FindId.Open;
    if fDm.q_FindId.FieldByName('Name').AsString <> LabeledEdit_Name.Text then
    begin
      ShowMessage('이름을 확인해주세요.');
      LabeledEdit_Name.Clear;
      LabeledEdit_Name.SetFocus;
      Exit;
    end
    else if fDm.q_FindId.FieldByName('BirthYear').AsDateTime <> DatePicker1.Date then
    begin
      ShowMessage('생년월일을 확인해주세요.');
      DatePicker1.Date := Date;
      Exit;
    end
    else if fDm.q_FindId.FieldByName('Gender').AsInteger <> ComboBox_Gender.ItemIndex then
    begin
      ShowMessage('성별을 확인해주세요.');
      RadioGroup1.ItemIndex := -1;
      Exit;
    end
    else
    begin
      LabeledEdit_BoxNum.Text := fDm.q_FindId.FieldByName('BoxNum').AsString;
      LabeledEdit_Id.Text := fDm.q_FindId.FieldByName('Id').AsString;
      ShowMessage('박스번호 : ' + fDm.q_FindId.FieldByName('BoxNum').AsString + #13
                  + '아이디 : ' + fDm.q_FindId.FieldByName('Id').AsString);
    end;
  end;

end;

procedure TfFind_Id.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  fFind_Id := nil;
end;

procedure TfFind_Id.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
  begin
    LabeledEdit_BoxManager.Visible := True;
    LabeledEdit_BoxName.Visible := True;
    LabeledEdit_Name.Visible := False;
    Panel_BirthYear.Visible := False;
    Panel_Gender.Visible := False;
  end
  else if RadioGroup1.ItemIndex = 1 then
  begin
    LabeledEdit_Name.Visible := True;
    Panel_BirthYear.Visible := True;
    Panel_Gender.Visible := True;
    LabeledEdit_BoxManager.Visible := False;
    LabeledEdit_BoxName.Visible := False;
  end;

end;

end.
