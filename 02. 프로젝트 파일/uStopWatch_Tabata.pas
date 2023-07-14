unit uStopWatch_Tabata;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TfStopWatch_Tabata = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    LabeledEdit_Round: TLabeledEdit;
    LabeledEdit_Work: TLabeledEdit;
    LabeledEdit_Rest: TLabeledEdit;
    Btn_Set: TButton;
    Panel3: TPanel;
    Panel4: TPanel;
    Label_WorkRound: TLabel;
    Label_RestRound: TLabel;
    Panel_WorkRound: TPanel;
    Label_WorkCountcheck: TLabel;
    Label5: TLabel;
    Label_WorkTotalRound: TLabel;
    Label7: TLabel;
    Panel_RestRound: TPanel;
    Label_RestCountCheck: TLabel;
    Label2: TLabel;
    Label_RestTotalRound: TLabel;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_SetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fStopWatch_Tabata: TfStopWatch_Tabata;

implementation

{$R *.dfm}

procedure TfStopWatch_Tabata.Btn_SetClick(Sender: TObject);
var
  n : Integer;
begin
  if LabeledEdit_Round.Text = '' then
  begin
    ShowMessage('라운드 수를 입력하세요.');
    Exit;
  end
  else
  begin
    n := StrToInt(LabeledEdit_Round.Text);
    Panel_WorkRound.Visible := True;
    Label_WorkTotalRound.Visible := True;
    Panel_RestRound.Visible := True;
    Label_RestTotalRound.Visible := True;
    Label_WorkTotalRound.Caption := n.ToString;
    Label_RestTotalRound.Caption := n.ToString;
  end;


end;

procedure TfStopWatch_Tabata.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  fStopWatch_Tabata := nil;
end;

end.
