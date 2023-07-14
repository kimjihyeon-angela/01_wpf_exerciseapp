unit uReservation_Check;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TfReservation_Check = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label_Time: TLabel;
    Label3: TLabel;
    Label_Wod: TLabel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel3: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fReservation_Check: TfReservation_Check;

implementation

{$R *.dfm}

uses uReservation, uDm, uMain;

procedure TfReservation_Check.Button1Click(Sender: TObject);
begin
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('UPDATE ManagerReservationTbl');
  fDm.q.SQL.Add('SET ReserveCount = :ReserveCount');
  fDm.q.SQL.Add('WHERE Tdate = :Tdate');
//  fDm.q.SQL.Add('AND   Ttime = :Ttime');
  fDm.q.ParamByName('ReserveCount').AsInteger := StrToInt(Label1.Caption) +1;
  fDm.q.ParamByName('Tdate').AsDate := Date;
//  fDm.q.ParamByName('Ttime').AsDateTime := StrToDateTime(fReservation.StringGrid1.Cells[1,0]);
  fDm.q.ExecSQL;
  Close;
end;

procedure TfReservation_Check.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  fReservation_Check := nil;
end;

procedure TfReservation_Check.FormCreate(Sender: TObject);
var
  vName : string;
begin
  vName := Copy(fMain.Caption, Pos(':', fMain.Caption)+2, Length(fMain.Caption));
  fDm.q.Close;
  fDm.q.SQL.Clear;
  fDm.q.SQL.Add('SELECT * FROM V_Wod_Reservation');
  fDm.q.SQL.Add('WHERE Tdate = :Tdate');
  fDm.q.SQL.Add('AND   Name = :Name');
  fDm.q.ParamByName('Tdate').AsDate := Date;
  fDm.q.ParamByName('Name').AsString := vName;
  fDm.q.Open;

  Label_Time.Caption := TimeToStr(fDm.q.FieldByName('Ttime').AsDateTime);
  Label_Wod.Caption := fDm.q.FieldByName('Wod2').AsString;

end;

end.
