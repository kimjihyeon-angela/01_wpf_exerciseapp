unit uCommunity_Write;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfCommunity_Write = class(TForm)
    Panel1: TPanel;
    Btn_Cancel: TButton;
    Btn_Save: TButton;
    Btn_AddVideo: TButton;
    Memo_Writing: TMemo;
    OpenDialog1: TOpenDialog;
    procedure Btn_CancelClick(Sender: TObject);
    procedure Btn_AddVideoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCommunity_Write: TfCommunity_Write;

implementation

{$R *.dfm}

uses uCommunity_All;

procedure TfCommunity_Write.Btn_AddVideoClick(Sender: TObject);
begin
  OpenDialog1.Execute;
end;

procedure TfCommunity_Write.Btn_CancelClick(Sender: TObject);
begin
  fCommunity_All.Btn_AllWriting.Click;
end;

end.
