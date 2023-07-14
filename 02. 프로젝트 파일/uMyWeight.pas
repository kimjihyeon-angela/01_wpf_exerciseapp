unit uMyWeight;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Math,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.Grids;

type
  TfMyWeight = class(TForm)
    Panel1: TPanel;
    LabeledEdit_Get1RM: TLabeledEdit;
    Btn_Calculator: TButton;
    Btn_GetWeight: TButton;
    RadioGroup_Gender: TRadioGroup;
    Panel2: TPanel;
    Panel3: TPanel;
    Sg_MyWeight: TStringGrid;
    Sg_UsingPlate: TStringGrid;
    Button1: TButton;
    procedure Btn_CalculatorClick(Sender: TObject);
    procedure Btn_GetWeightClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Sg_MyWeightSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMyWeight: TfMyWeight;

implementation

{$R *.dfm}

uses uCalculator;


procedure TfMyWeight.Btn_CalculatorClick(Sender: TObject);
begin
  if fCalculator = nil then
  begin
    fCalculator:=TfCalculator.Create(Self);
    fCalculator.showModal;
  end;
end;

procedure TfMyWeight.Btn_GetWeightClick(Sender: TObject);
var
  n : Integer;
  i : Integer;
  n1 : Double;
  vTotal : Double;
begin
  if RadioGroup_Gender.ItemIndex < 0 then
  begin
    ShowMessage('성별을 선택해주세요.');
    Exit;
  end;
  n := StrToInt(LabeledEdit_Get1RM.Text);
  vTotal := 0;
  n1 := n * 0.1;
  for i := 0 to Sg_MyWeight.RowCount-1 do
  begin
    vTotal := vTotal + n1;
    Sg_MyWeight.Cells[1,i] := vTotal.ToString;
  end;
end;

procedure TfMyWeight.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfMyWeight.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fMyWeight := nil;
end;

procedure TfMyWeight.FormCreate(Sender: TObject);
begin
  Sg_MyWeight.Cells[0,0] := '10%';
  Sg_MyWeight.Cells[0,1] := '20%';
  Sg_MyWeight.Cells[0,2] := '30%';
  Sg_MyWeight.Cells[0,3] := '40%';
  Sg_MyWeight.Cells[0,4] := '50%';
  Sg_MyWeight.Cells[0,5] := '60%';
  Sg_MyWeight.Cells[0,6] := '70%';
  Sg_MyWeight.Cells[0,7] := '80%';
  Sg_MyWeight.Cells[0,8] := '90%';
  Sg_MyWeight.Cells[0,9] := '100%';
  Sg_MyWeight.Cells[0,10] := '110%';
  Sg_MyWeight.Cells[0,11] := '120%';
  Sg_MyWeight.Cells[0,12] := '130%';
  Sg_MyWeight.Cells[0,13] := '140%';
  Sg_MyWeight.Cells[0,14] := '150%';
end;

procedure TfMyWeight.Sg_MyWeightSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  n : Integer;
  vTotal : Integer;
begin

  Panel3.Visible := True;
  Sg_UsingPlate.Cells[0,0] := '45 Lbs';
  Sg_UsingPlate.Cells[0,1] := '35 Lbs';
  Sg_UsingPlate.Cells[0,2] := '25 Lbs';
  Sg_UsingPlate.Cells[0,3] := '15 Lbs';
  Sg_UsingPlate.Cells[0,4] := '10 Lbs';
  Sg_UsingPlate.Cells[0,5] := '5 Lbs';
  Sg_UsingPlate.Cells[0,6] := '2.5 Lbs';

  n := Round(Sg_MyWeight.Cells[ACol,ARow].ToDouble);
  // 성별이 남자인 경우
  // (1rm - 45) / 2
  if RadioGroup_Gender.ItemIndex = 0 then
  begin
    vTotal := Trunc((n-45) / 2);
    Sg_UsingPlate.Cells[1,0] := (vTotal div 45).ToString;
    vTotal := vTotal mod 45;
    Sg_UsingPlate.Cells[1,1] := (vTotal div 35).ToString;
    vTotal := vTotal mod 35;
    Sg_UsingPlate.Cells[1,2] := (vTotal div 25).ToString;
    vTotal := vTotal mod 25;
    Sg_UsingPlate.Cells[1,3] := (vTotal div 15).ToString;
    vTotal := vTotal mod 15;
    Sg_UsingPlate.Cells[1,4] := (vTotal div 10).ToString;
    vTotal := vTotal mod 10;
    Sg_UsingPlate.Cells[1,5] := (vTotal div 5).ToString;
    vTotal := vTotal mod 5;
    Sg_UsingPlate.Cells[1,6] := (ceil(vTotal / 2.5)).ToString;
  end;

  // 성별이 여자인 경우
  // (1rm - 35) / 2
  if RadioGroup_Gender.ItemIndex = 1 then
  begin
    vTotal := Trunc((n-35) / 2);
    Sg_UsingPlate.Cells[1,0] := (vTotal div 45).ToString;
    vTotal := vTotal mod 45;
    Sg_UsingPlate.Cells[1,1] := (vTotal div 35).ToString;
    vTotal := vTotal mod 35;
    Sg_UsingPlate.Cells[1,2] := (vTotal div 25).ToString;
    vTotal := vTotal mod 25;
    Sg_UsingPlate.Cells[1,3] := (vTotal div 15).ToString;
    vTotal := vTotal mod 15;
    Sg_UsingPlate.Cells[1,4] := (vTotal div 10).ToString;
    vTotal := vTotal mod 10;
    Sg_UsingPlate.Cells[1,5] := (vTotal div 5).ToString;
    vTotal := vTotal mod 5;
    Sg_UsingPlate.Cells[1,6] := (ceil(vTotal / 2.5)).ToString;
  end;

end;

end.
