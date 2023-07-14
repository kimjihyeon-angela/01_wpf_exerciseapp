unit uStopWatch_ForTime;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.WinXCalendars;

type
  TfStopWatch_ForTime = class(TForm)
    Panel1: TPanel;
    Panel_FrotimeTimer: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    LabeledEdit_Time: TLabeledEdit;
    RadioGroup_UpDown: TRadioGroup;
    Panel4: TPanel;
    Btn_Set: TButton;
    Btn_Reset: TButton;
    Timer_CountDown: TTimer;
    Timer_Up: TTimer;
    Timer_Down: TTimer;
    Label_CountDown: TLabel;
    Label_Min: TLabel;
    Label_Sec: TLabel;
    Label_MSec: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_ResetClick(Sender: TObject);
    procedure Timer_CountDownTimer(Sender: TObject);
    procedure Timer_UpTimer(Sender: TObject);
    procedure Timer_DownTimer(Sender: TObject);
    procedure Btn_SetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fStopWatch_ForTime: TfStopWatch_ForTime;

implementation

{$R *.dfm}

procedure TfStopWatch_ForTime.Btn_SetClick(Sender: TObject);
begin
  if LabeledEdit_Time.Text = ''  then
  begin
    ShowMessage('시간을 입력해주세요.');
  end
  else if RadioGroup_UpDown.ItemIndex = -1 then
  begin
    ShowMessage('UP OR DOWN 을 선택해주세요.');
    RadioGroup_UpDown.SetFocus;
  end
  else
  begin
    if Btn_Set.Caption = 'START' then
    begin
      Timer_CountDown.Enabled := True;
      Btn_Set.Caption := 'STOP';
    end
    else
    begin
      Btn_Set.Caption := 'START';
      Timer_CountDown.Enabled := False;
      Timer_Up.Enabled := False;
      Timer_Down.Enabled := False;
    end;
  end;
end;

procedure TfStopWatch_ForTime.Btn_ResetClick(Sender: TObject);
begin
  Timer_CountDown.Enabled := False;
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
end;

procedure TfStopWatch_ForTime.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  fStopWatch_ForTime := nil;
end;

procedure TfStopWatch_ForTime.Timer_CountDownTimer(Sender: TObject);
begin
  Label_CountDown.Visible := True;
  Label_CountDown.Align := alClient;
  Label_CountDown.Font.Size := 180;
  Label_CountDown.Caption := IntToStr(StrToInt(Label_CountDown.Caption)-1);

  if Label_CountDown.Caption = '0' then
  begin
    Label_CountDown.Visible := False;
    Label_Min.Visible := True;
    Label_Sec.Visible := True;
    Label_MSec.Visible := True;
    Label1.Visible := True;
    Label2.Visible := True;
    Timer_CountDown.Enabled := False;

    if StrToInt(Label_CountDown.Caption) < 6 then
    begin
      Label_CountDown.Font.Color := clRed;
    end;

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

procedure TfStopWatch_ForTime.Timer_DownTimer(Sender: TObject);
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
//    Btn_Set.Caption := 'START';
    Btn_Reset.Click;
  end;
end;

procedure TfStopWatch_ForTime.Timer_UpTimer(Sender: TObject);
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
//    Btn_Set.Caption := 'START';
    Btn_Reset.Click;
  end;
end;

end.
