unit uStopWatch_EMOM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfStopWatch_EMOM = class(TForm)
    Panel1: TPanel;
    Btn_Set: TButton;
    Label_Round: TLabel;
    Label_Time: TLabel;
    Panel2: TPanel;
    Label_CheckRound: TLabel;
    Label5: TLabel;
    Label_TotalRound: TLabel;
    Label7: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    Edit_EveryMin: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit_ForMin: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_SetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fStopWatch_EMOM: TfStopWatch_EMOM;

implementation

{$R *.dfm}

procedure TfStopWatch_EMOM.Btn_SetClick(Sender: TObject);
var
  s : string;
  En : Integer;
  i : Integer;
begin
  s := Edit_ForMin.Text;
  En := S.ToInteger;
  Label_CheckRound.Visible := True;
  Label_TotalRound.Visible := True;
  Label_Round.Visible := True;
  Label_TotalRound.Caption := IntToStr(En);
  for i := 1 to En do
  begin
    Label_CheckRound.Caption := i.ToString;
    Label_Round.Caption := i.ToString;
  end;
end;

procedure TfStopWatch_EMOM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fStopWatch_EMOM := nil;
end;

end.
