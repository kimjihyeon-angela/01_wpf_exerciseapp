unit uDm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfDm = class(TDataModule)
    FDConnection1: TFDConnection;
    q_Wod: TFDQuery;
    ds_Wod: TDataSource;
    q_Notice: TFDQuery;
    ds_Notice: TDataSource;
    q_Competition: TFDQuery;
    ds_Competition: TDataSource;
    q_Reservation: TFDQuery;
    ds_Reservation: TDataSource;
    q_BoxName: TFDQuery;
    ds_BoxName: TDataSource;
    ds_q: TDataSource;
    q: TFDQuery;
    ds_Record: TDataSource;
    q_Record: TFDQuery;
    q_Wod_Rxd: TFDQuery;
    ds_Wod_Rxd: TDataSource;
    q_Wod_Scale: TFDQuery;
    ds_Wod_Scale: TDataSource;
    q_NewCode: TFDQuery;
    ds_NewCode: TDataSource;
    q_Login: TFDQuery;
    ds_Login: TDataSource;
    q_FindId: TFDQuery;
    ds_FindId: TDataSource;
    procedure q_CompetitionCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDm: TfDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TfDm.q_CompetitionCalcFields(DataSet: TDataSet);
begin
  case DataSet.FieldByName('CompetitionType').AsInteger of
  0 : DataSet.FieldByName('CompetitionTypeS').AsString := '박스';
  1 : DataSet.FieldByName('CompetitionTypeS').AsString := '개인';
  end;
end;

end.
