unit uCommunity_All;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfCommunity_All = class(TForm)
    Panel1: TPanel;
    Btn_AllWriting: TButton;
    Btn_Write: TButton;
    Panel_Write: TPanel;
    Panel_Video: TPanel;
    Panel_Writing: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Panel2: TPanel;
    Btn_Up: TButton;
    Btn_Down: TButton;
    Panel3: TPanel;
    Button2: TButton;
    Button3: TButton;
    procedure Btn_WriteClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Btn_AllWritingClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCommunity_All: TfCommunity_All;

implementation

{$R *.dfm}

uses uCommunity_Write, uCommunity_My;

procedure TfCommunity_All.Btn_AllWritingClick(Sender: TObject);
begin
  fCommunity_Write.Close;
  Panel_Video.Visible := True;
  Panel_Writing.Visible := True;
end;

procedure TfCommunity_All.Btn_WriteClick(Sender: TObject);
begin
    if fCommunity_Write = nil then
    begin
      fCommunity_Write := TfCommunity_Write.Create(Self);
      fCommunity_Write.Parent := Panel_Write;
      fCommunity_Write.Align := alClient;
      fCommunity_Write.WindowState := TWindowState.wsMaximized;
      fCommunity_Write.BorderStyle := bsNone;
    end;
    fCommunity_Write.Show;
    Panel_Video.Visible := False;
    Panel_Writing.Visible := False;
end;

procedure TfCommunity_All.Button1Click(Sender: TObject);
begin
  if fCommunity_My = nil then
  begin
    fCommunity_My := TfCommunity_My.Create(Self);
    fCommunity_My.ShowModal;
  end;
end;

end.
