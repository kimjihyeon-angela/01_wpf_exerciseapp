unit uWod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TfWod = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fWod: TfWod;

implementation

{$R *.dfm}

procedure TfWod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fWod := nil;
end;

end.
