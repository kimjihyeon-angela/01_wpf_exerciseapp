unit uManager_WodSelected;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.WinXPickers, Vcl.CheckLst, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TfManager_WodSelected = class(TForm)
    ComboBox_Level: TComboBox;
    ComboBox_Gender: TComboBox;
    ComboBox_StopWatch: TComboBox;
    Panel1: TPanel;
    Btn_WodSelect: TButton;
    Btn_Video: TButton;
    DatePicker1: TDatePicker;
    Panel2: TPanel;
    Label_SelectWod: TLabel;
    CheckListBox_WeightCount: TCheckListBox;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    LabeledEdit_VideoLink: TLabeledEdit;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    LabeledEdit_Weight: TLabeledEdit;
    LabeledEdit_Count: TLabeledEdit;
    LabeledEdit_TimeCap: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fManager_WodSelected: TfManager_WodSelected;

implementation

{$R *.dfm}


end.
