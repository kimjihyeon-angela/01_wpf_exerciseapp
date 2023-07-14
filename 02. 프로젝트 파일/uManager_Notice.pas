unit uManager_Notice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfManager_Notice = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Label1: TLabel;
    Memo_Content: TMemo;
    LabeledEdit_Title: TLabeledEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fManager_Notice: TfManager_Notice;

implementation

{$R *.dfm}

uses uDm, uCommunity_My, uMain;


procedure TfManager_Notice.Button1Click(Sender: TObject);
var
  vBoxName :  string;
begin
  vBoxName := Copy(fMain.Caption, 4, Pos('관리자', fMain.Caption)-4);
  fDm.q_Notice.Close;
  fDm.q_Notice.SQL.Clear;
  fDm.q_Notice.SQL.Add('INSERT INTO NoticeTbl (BoxName,NoticeTitle, NoticeContent, Tdate)');
  fDm.q_Notice.SQL.Add('VALUES (:BoxName, :NoticeTitle, :NoticeContent, :Tdate)');
  fDm.q_Notice.ParamByName('BoxName').AsString := vBoxName;
  fDm.q_Notice.ParamByName('NoticeTitle').AsString := LabeledEdit_Title.Text;
  fDm.q_Notice.ParamByName('NoticeContent').AsString := Memo_Content.Text;
  fDm.q_Notice.ParamByName('Tdate').AsDate := Date;
  fDm.q_Notice.ExecSQL;
  ShowMessage('공지사항이 등록되었습니다.');
  LabeledEdit_Title.Clear;
  Memo_Content.Clear;
end;

procedure TfManager_Notice.Button2Click(Sender: TObject);
begin
  if fCommunity_My = nil then
  begin
    fCommunity_My:=TfCommunity_My.Create(Self);
    fCommunity_My.showModal;
  end;
end;

procedure TfManager_Notice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fManager_Notice := nil;
end;

end.
