unit uStopWatch_Amrap;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Diagnostics,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls;

type
  TfStopWatch_Amrap = class(TForm)
    Panel1: TPanel;
    Panel_AmrapTimer: TPanel;
    Panel2: TPanel;
    Timer_10to0: TTimer;
    Label_Min: TLabel;
    Label_Sec: TLabel;
    Label_MSec: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    LabeledEdit_Time: TLabeledEdit;
    RadioGroup_UpDown: TRadioGroup;
    Panel4: TPanel;
    Btn_Set: TButton;
    Btn_Reset: TButton;
    Label_CountDown: TLabel;
    Timer_Up: TTimer;
    Timer_Down: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_ResetClick(Sender: TObject);
    procedure Btn_SetClick(Sender: TObject);
    procedure Timer_10to0Timer(Sender: TObject);
    procedure Timer_UpTimer(Sender: TObject);
    procedure Timer_DownTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fStopWatch_Amrap: TfStopWatch_Amrap;

implementation

{$R *.dfm}

procedure TfStopWatch_Amrap.Btn_SetClick(Sender: TObject);
begin
  if LabeledEdit_Time.Text = '' then
  begin
    ShowMessage('Time Cap을 입력하세요.');
    LabeledEdit_Time.SetFocus;
    Exit;
  end
  else if RadioGroup_UpDown.ItemIndex = -1 then
  begin
    ShowMessage('UP OR DOWN을 선택해주세요.');
    RadioGroup_UpDown.SetFocus;
  end
  else
  begin
    if Btn_Set.Caption = 'START' then
    begin
      Timer_10to0.Enabled := True;
      Btn_Set.Caption := 'STOP';
    end
    else
    begin
      Btn_Set.Caption := 'START';
      Timer_10to0.Enabled := False;
      Timer_Up.Enabled := False;
      Timer_Down.Enabled := False;
    end;
  end;

end;

procedure TfStopWatch_Amrap.Btn_ResetClick(Sender: TObject);
begin
  Timer_10to0.Enabled := False;
  Timer_Up.Enabled := False;
  Timer_Down.Enabled := False;
  Label_CountDown.Caption := '11';
  Label_CountDown.Visible := False;
  Label_Min.Caption := '00';
  Label_Sec.Caption := '00';
  Label_MSec.Caption := '00';
  Label_Min.Visible := False;
  Label_Sec.Visible := False;
  Label_MSec.Visible := False;
  Label1.Visible := False;
  Label2.Visible := False;
  RadioGroup_UpDown.ItemIndex := -1;
  LabeledEdit_Time.Clear;
  Btn_Set.Caption := 'START';
  Panel_AmrapTimer.Color := clWindow;
end;

procedure TfStopWatch_Amrap.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  fStopWatch_Amrap := nil;
end;

procedure TfStopWatch_Amrap.Timer_10to0Timer(Sender: TObject);
begin
  Label_CountDown.Visible := True;
  Label_CountDown.Align := alClient;
  Label_CountDown.Font.Size := 180;
  Label_CountDown.Caption := IntToStr(StrToInt(Label_CountDown.Caption)-1);
  if StrToInt(Label_CountDown.Caption) < 6 then
  begin
    Label_CountDown.Font.Color := clRed;
  end;

  if Label_CountDown.Caption = '0' then
  begin
    Label_CountDown.Visible := False;
    Label_Min.Visible := True;
    Label_Sec.Visible := True;
    Label_MSec.Visible := True;
    Label1.Visible := True;
    Label2.Visible := True;
    Timer_10to0.Enabled := False;
    if RadioGroup_UpDown.ItemIndex = 0 then
    begin
      Timer_Up.Enabled := True;
    end
    else if RadioGroup_UpDown.ItemIndex = 1 then
    begin
      Label_Min.Caption := LabeledEdit_Time.Text;
      Timer_Down.Enabled := True;
    end;
  end;
end;

procedure TfStopWatch_Amrap.Timer_DownTimer(Sender: TObject);
begin
  Label_Min.Caption := IntToStr(StrToInt(LabeledEdit_Time.Text)-1);
  Label_MSec.Caption := IntToStr(StrToInt(Label_MSec.Caption)-1);
  if Label_MSec.Caption < '0' then
  begin
    Label_MSec.Caption := '99';
    Label_Sec.Caption := IntToStr(StrToInt(Label_Sec.Caption)-1);
    if Label_Sec.Caption < '0' then
    begin
      Label_Sec.Caption := '59';
      Label_Min.Caption := IntToStr(StrToInt(Label_Min.Caption)-1);
    end;
  end;
  if (Label_Min.Caption = '0') and (Label_Sec.Caption = '0') and(Label_MSec.Caption = '0')then
  begin
    Timer_Down.Enabled := False;
    Panel_AmrapTimer.Color := clRed;
    Btn_Reset.Click;
  end;
end;

procedure TfStopWatch_Amrap.Timer_UpTimer(Sender: TObject);
begin
  Label_MSec.Caption := IntToStr(StrToInt(Label_MSec.Caption)+1);
  if Label_MSec.Caption = '99' then
  begin
    Label_Sec.Caption := IntToStr(StrToInt(Label_Sec.Caption)+1);
    Label_MSec.Caption := '00';
  end;
  if Label_Sec.Caption = '60' then
  begin
    Label_Min.Caption := IntToStr(StrToInt(Label_Min.Caption)+1);
    Label_Sec.Caption := '00';
  end;
  if Label_Min.Caption = LabeledEdit_Time.Text then
  begin
    Timer_Up.Enabled := False;
    Panel_AmrapTimer.Color := clRed;
    Btn_Reset.Click;
  end;

end;

end.
