unit uCalculator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage;

type
  TfCalculator = class(TForm)
    Panel1: TPanel;
    Label_Fomula: TLabel;
    Label_Result: TLabel;
    Panel2: TPanel;
    ImageList1: TImageList;
    Panel3: TPanel;
    Btn_Percent: TButton;
    Btn_Clear: TButton;
    Btn_BackSpace: TButton;
    Btn_Division: TButton;
    Panel4: TPanel;
    Btn_7: TButton;
    Btn_8: TButton;
    Btn_9: TButton;
    Btn_Multiplication: TButton;
    Panel5: TPanel;
    Btn_5: TButton;
    Btn_6: TButton;
    Btn_Minus: TButton;
    Panel6: TPanel;
    Btn_1: TButton;
    Btn_2: TButton;
    Btn_3: TButton;
    Btn_Plus: TButton;
    Panel7: TPanel;
    Image1: TImage;
    Btn_0: TButton;
    Btn_Point: TButton;
    Btn_GetResult: TButton;
    Btn_4: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_0Click(Sender: TObject);
    procedure Btn_1Click(Sender: TObject);
    procedure Btn_2Click(Sender: TObject);
    procedure Btn_3Click(Sender: TObject);
    procedure Btn_4Click(Sender: TObject);
    procedure Btn_5Click(Sender: TObject);
    procedure Btn_6Click(Sender: TObject);
    procedure Btn_7Click(Sender: TObject);
    procedure Btn_8Click(Sender: TObject);
    procedure Btn_9Click(Sender: TObject);
    procedure Btn_PointClick(Sender: TObject);
    procedure Btn_PlusClick(Sender: TObject);
    procedure Btn_MinusClick(Sender: TObject);
    procedure Btn_MultiplicationClick(Sender: TObject);
    procedure Btn_DivisionClick(Sender: TObject);
    procedure Btn_GetResultClick(Sender: TObject);
    procedure Btn_PercentClick(Sender: TObject);
    procedure Btn_BackSpaceClick(Sender: TObject);
    procedure Btn_ClearClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CreateNum(ANumber : string);
    procedure CreateFormula(AOperator : string);
    procedure Calculate;
    function DividebyZeroCheck: Boolean;
  end;

var
  fCalculator: TfCalculator;
  vNum: String = '0';             // 입력되는 숫자(피연산자)
  vNumEditFlag: Boolean;          // 숫자를 입력하는 상태는 True, 연산자를 클릭한 후에는 False
  vFormula: String = '';          // 수식
  vCalcResult: Double = 0.0;      // 수식 계산 결과
  vReservedFormula: String = '';  // 진법 변환시 활용
  vDoubleEqual: Boolean = False;  // '='을 다시 클릭했을때 True

implementation

{$R *.dfm}

procedure TfCalculator.Btn_0Click(Sender: TObject);
begin
  if vNumEditFlag = False then
  begin
    vNumEditFlag := True;
    vNum := '0';
  end;
  CreateNum('0');
end;

procedure TfCalculator.Btn_1Click(Sender: TObject);
begin
  if vNumEditFlag = False then
  begin
    vNumEditFlag := True;
    vNum := '0';
  end;
  CreateNum('1');
end;

procedure TfCalculator.Btn_2Click(Sender: TObject);
begin
  if vNumEditFlag = False then
  begin
    vNumEditFlag := True;
    vNum := '0';
  end;
  CreateNum('2');
end;

procedure TfCalculator.Btn_3Click(Sender: TObject);
begin
  if vNumEditFlag = False then
  begin
    vNumEditFlag := True;
    vNum := '0';
  end;
  CreateNum('3');
end;

procedure TfCalculator.Btn_4Click(Sender: TObject);
begin
  if vNumEditFlag = False then
  begin
    vNumEditFlag := True;
    vNum := '0';
  end;
  CreateNum('4');
end;

procedure TfCalculator.Btn_5Click(Sender: TObject);
begin
  if vNumEditFlag = False then
  begin
    vNumEditFlag := True;
    vNum := '0';
  end;
  CreateNum('5');
end;

procedure TfCalculator.Btn_6Click(Sender: TObject);
begin
  if vNumEditFlag = False then
  begin
    vNumEditFlag := True;
    vNum := '0';
  end;
  CreateNum('6');
end;

procedure TfCalculator.Btn_7Click(Sender: TObject);
begin
  if vNumEditFlag = False then
  begin
    vNumEditFlag := True;
    vNum := '0';
  end;
  CreateNum('7');
end;

procedure TfCalculator.Btn_8Click(Sender: TObject);
begin
  if vNumEditFlag = False then
  begin
    vNumEditFlag := True;
    vNum := '0';
  end;
  CreateNum('8');
end;

procedure TfCalculator.Btn_9Click(Sender: TObject);
begin
  if vNumEditFlag = False then
  begin
    vNumEditFlag := True;
    vNum := '0';
  end;
  CreateNum('9');
end;

procedure TfCalculator.Btn_BackSpaceClick(Sender: TObject);
begin
  if (vFormula <> '') and (vFormula[vFormula.Length-1] = '=') then
  begin
    Label_Fomula.Caption := '';
    vFormula := '';
    vNum := Label_Result.Caption;
    Exit;
  end;
  vNum := vNum.Substring(0, vNum.Length-1);
  if vNum = '' then
  begin
    vNum := '0';
  end;
  Label_Result.Caption := vNum;
end;

procedure TfCalculator.Btn_ClearClick(Sender: TObject);
begin
  Label_Fomula.Caption := '';
  Label_Result.Caption := '0';
  vNum := '0';
  vFormula := '';
end;

procedure TfCalculator.Btn_DivisionClick(Sender: TObject);
begin
  if vFormula = '' then
  begin
    vCalcResult := StrToFloat(vNum);
    CreateFormula('÷');
    Exit;
  end
  else
  begin
    CreateFormula('÷');
    if DividebyZeroCheck then
      Exit;
  end;
end;

procedure TfCalculator.Btn_GetResultClick(Sender: TObject);
var
  vStartIndex: Integer;
  vEndIndex: Integer;
  vSubFormula, vSubOp: String;
begin
  if vFormula = '' then
  begin
    vCalcResult := StrToFloat(vNum);
    Exit;
  end
  else if vFormula[vFormula.Length-1] = '=' then  // '='를 클릭하고 다시 '='를 클릭
  begin
    vDoubleEqual := True;
    vStartIndex := vFormula.LastIndexOf(' ', vFormula.Length-4)-2;
    vEndIndex := vFormula.LastIndexOf(' ', vFormula.Length-2);
    vSubFormula := vFormula.Substring(vStartIndex, vEndIndex - vStartIndex);
    vSubOp := vSubFormula.Substring(0, 3);
    vFormula := FloatToStr(vCalcResult) + vSubOp;
    vNum := vSubFormula.Substring(3);
    CreateFormula('=');
  end
  else
  begin
    CreateFormula('=');
    if DividebyZeroCheck then
    begin
      Exit;
    end;
  end;

end;

procedure TfCalculator.Btn_MinusClick(Sender: TObject);
begin
  if vFormula = '' then
  begin
    vCalcResult := StrToFloat(vNum);
    CreateFormula('-');
    Exit;
  end
  else
  begin
    CreateFormula('-');
    if DividebyZeroCheck then
    begin
      Exit;
    end;
  end;
end;

procedure TfCalculator.Btn_MultiplicationClick(Sender: TObject);
begin
  if vFormula = '' then
  begin
    vCalcResult := StrToFloat(vNum);
    CreateFormula('X');
    Exit;
  end
  else
  begin
    CreateFormula('X');
    if DividebyZeroCheck then
    begin
      Exit;
    end;
  end;
end;

procedure TfCalculator.Btn_PercentClick(Sender: TObject);
begin
  if vFormula = '' then
    Exit
  else
  begin
    if (vFormula[vFormula.Length-1] = '+') or (vFormula[vFormula.Length-1] = '-') then
    begin
      vNum := FloatToStr(vCalcResult*(StrToFloat(vNum)/100));
      Label_Result.Caption := vNum;
    end
    else
    begin
      vNum := FloatToStr(StrToFloat(vNum)/100);
      Label_Result.Caption := vNum;
    end;
  end;
end;

procedure TfCalculator.Btn_PlusClick(Sender: TObject);
begin
  if vFormula = '' then
  begin
    vCalcResult := StrToFloat(vNum);
    CreateFormula('+');
    Exit;
  end
  else
  begin
    CreateFormula('+');
    if DividebyZeroCheck then
    begin
      Exit;
    end;
  end;
end;

procedure TfCalculator.Btn_PointClick(Sender: TObject);
begin
  if vNum.IndexOf('.') < 0 then
  begin
    vNum := vNum + '.';
  end;
  Label_Result.Caption := vNum;
end;

procedure TfCalculator.Calculate;
begin
  if vFormula[vFormula.Length-1] = '+' then
  begin
    vCalcResult := vCalcResult + StrToFloat(vNum);
    Label_Result.Caption := FloatToStr(vCalcResult);
  end
  else if vFormula[vFormula.Length-1] = '-' then
  begin
    vCalcResult := vCalcResult - StrToFloat(vNum);
    Label_Result.Caption := FloatToStr(vCalcResult);
  end
  else if vFormula[vFormula.Length-1] = 'X' then
  begin
    vCalcResult := vCalcResult * StrToFloat(vNum);
    Label_Result.Caption := FloatToStr(vCalcResult);
  end
  else if vFormula[vFormula.Length-1] = '÷' then
  begin
    vCalcResult := vCalcResult / StrToFloat(vNum);
    Label_Result.Caption := FloatToStr(vCalcResult);
  end
end;

procedure TfCalculator.CreateFormula(AOperator: string);
begin
  if vDoubleEqual = True then
  begin
    Calculate();
    vFormula := vFormula + vNum + ' ' + AOperator + ' ';
    Label_Fomula.Caption := vFormula;
    vNumEditFlag := False;
    vDoubleEqual := False;
    Exit;
  end;
  if (vFormula <> '') and (vFormula[vFormula.Length-1] <> AOperator)
  and (vNumEditFlag = False) then
  begin
    vFormula := vFormula.Substring(0, vFormula.Length-2) + AOperator + ' ';
    Label_Fomula.Caption := vFormula;
    Exit;
  end;
  if (vFormula <> '') and (vFormula[vFormula.Length-1] = AOperator)
  and (vNumEditFlag = False) then
  begin
    Exit;
  end;
  if vFormula = '' then
  begin
    vFormula := vFormula + vNum + ' ' + AOperator + ' ';
    Label_Fomula.Caption := vFormula;
    vNumEditFlag := False;
    Exit;
  end;
  Calculate();
  vFormula := vFormula + vNum + ' ' + AOperator + ' ';
  Label_Fomula.Caption := vFormula;
  vNumEditFlag := False;
end;

procedure TfCalculator.CreateNum(ANumber: string);
begin
  vNumEditFlag := True;
  if (vFormula <> '') and (vFormula[vFormula.Length-1] = '=') then
  begin
    Label_Fomula.Caption := '';
    vFormula := '';
  end;
  if vNum = '0' then
    vNum := '';
  vNum := vNum + ANumber;
  Label_Result.Caption := vNum;
end;

function TfCalculator.DividebyZeroCheck: Boolean;
begin
  if (StrToFloat(vNum) = 0.0) and (vFormula[vFormula.Length-1] = '÷') then
  begin
    Label_Result.Caption := '0으로 나눌 수 없습니다.';
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

procedure TfCalculator.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fCalculator := nil;
end;


procedure TfCalculator.Image1Click(Sender: TObject);
begin
//  Label_Fomula.Caption := '';
//  Label_Result.Caption := '0';
//  vNum := '0';
//  vFormula := '';
end;

end.
