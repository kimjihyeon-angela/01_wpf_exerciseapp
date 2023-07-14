unit uCommunity_My;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBCtrls, Data.DB, Vcl.DBGrids;

type
  TfCommunity_My = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Panel2: TPanel;
    Panel_LastNotice: TPanel;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    Label2: TLabel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Label1: TLabel;
    Button3: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCommunity_My: TfCommunity_My;

implementation

{$R *.dfm}

uses uManager_Notice, uDm, uMain;

procedure TfCommunity_My.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfCommunity_My.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TfCommunity_My.DBGrid1CellClick(Column: TColumn);
begin
  Label2.Caption := DBGrid1.SelectedField.Text;
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT * FROM NoticeTbl');
  fDm.q.SQL.Add('WHERE NoticeTitle = :NoticeTitle');
  fDm.q.ParamByName('NoticeTitle').AsString := Label2.Caption;
  fDm.q.Open;

  Memo1.Text := fDm.q.FieldByName('NoticeContent').AsString;
end;

procedure TfCommunity_My.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fCommunity_My := nil;
end;

procedure TfCommunity_My.FormCreate(Sender: TObject);
var
  vBoxName : string;
begin
  Memo1.Clear;
  fDm.q_Notice.Close;
  fDm.q_Notice.SQL.Clear;
  fDm.q_Notice.SQL.Add('SELECT NoticeTitle FROM V_Box_Notice');
  fDm.q_Notice.SQL.Add('WHERE BoxName = :BoxName');
  fDm.q_Notice.SQL.Add('ORDER BY Tdate');
  if Pos('박스', fMain.Caption) = 1 then
  begin
    vBoxName := Copy(fMain.Caption, Pos('박스', fMain.Caption)+3, Pos('관리자', fMain.Caption)-4);
    fDm.q_Notice.ParamByName('BoxName').AsString := vBoxName;
  end
  else
  begin
    vBoxName := Copy(fMain.Caption, 1, Pos(' 박스', fMain.Caption));
    fDm.q_Notice.ParamByName('BoxName').AsString := vBoxName;
  end;
  fDm.q_Notice.Open;

end;

end.
