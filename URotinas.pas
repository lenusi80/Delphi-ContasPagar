unit URotinas;

interface

uses Forms, Windows,SysUtils, Controls, StdCtrls, Mask, Graphics,
DBCtrls, jpeg, Dialogs, Messages, Variants, Classes, ExtCtrls,
ComCtrls, Buttons, Menus;

procedure CorEntrada(Sender: TObject);
procedure CorSaida(Sender: TObject);
procedure AlinharImage(AForm : TForm; APanel: TImage; ACentro: Boolean);
procedure Alinhartrackbar(AForm: TForm; APanel: TTrackBar; ACentro: Boolean);
procedure AlinharLabel(AForm : TForm; APanel: TLabel; ACentro: Boolean);
function DataExtenso(data : TDateTime): String;
function RetornaMes(datas : TdateTime): string;
Function ConcatenaMes(mes : word): TdateTime;
function DifHora(Inicio,Fim : String; NumDias : integer):String;
function Validar(entrada, registro : string): Boolean;
function Codigo(mStr : string): string;
function ExtractName(const Filename: String): String;
function Calculapercentual(valor:real; Percent:Real):real;


implementation

uses UPrincipal;

Const
  mChave : String = 'ControleRodagem';

procedure CorEntrada(Sender: TObject);
begin
     if (Sender is TEdit) then
        begin
        (Sender as TEdit).Color := $00F4DDC1;
        (Sender as TEdit).Font.Color := clBlack;
        end
        else if (Sender is TDBComboBox) then
                begin
                (Sender as TDBComboBox).Color := $00F4DDC1;
                (Sender as TDBComboBox).Font.Color := clBlack;
                end
        else if (Sender is TMemo) then
                begin
                (Sender as TMemo).Color := $00F4DDC1;
                (Sender as TMemo).Font.Color := clBlack;
                end
        else if (Sender is TDBEdit) then
                begin
                (Sender as TDBEdit).Color := $00F4DDC1;
                (Sender as TDBEdit).Font.Color := clBlack;
                end
        else if (Sender is TDBMemo) then
                begin
                (Sender as TDBMemo).Color := $00F4DDC1;
                (Sender as TDBMemo).Font.Color := clBlack;
                end
        else if (Sender is TMaskEdit) then
                begin
                (Sender as TMaskEdit).Color := $00F4DDC1;
                (Sender as TMaskEdit).Font.Color := clBlack;
                end;
end;

procedure CorSaida(Sender: TObject);
begin
     if (Sender is TEdit) then
        begin
        (Sender as TEdit).Color := clWindow;
        (Sender as TEdit).Font.Color := clBlue;
        end
        else if (Sender is TDBComboBox) then
                begin
                (Sender as TDBComboBox).Color := clWindow;
                (Sender as TDBComboBox).Font.Color := clBlue;
                end
        else if (Sender is TMemo) then
                begin
                (Sender as TMemo).Color := clWindow;
                (Sender as TMemo).Font.Color := clBlue;
                end
        else if (Sender is TDBEdit) then
                begin
                (Sender as TDBEdit).Color := clWindow;
                (Sender as TDBEdit).Font.Color := clBlue;
                end
        else if (Sender is TDBMemo) then
                begin
                (Sender as TDbMemo).Color := clWindow;
                (Sender as TDbMemo).Font.Color := clBlue;
                end
        else if (Sender is TMaskEdit) then
                begin
                (Sender as TMaskEdit).Color := clWindow;
                (Sender as TMaskEdit).Font.Color := clBlue;
                end;
end;


procedure AlinharImage(AForm: TForm; APanel: TImage; ACentro: Boolean);
begin
  if ACentro then
  begin
    APanel.Left := (AForm.ClientWidth div 2) - (APanel.Width div 2);
    APanel.Top := (AForm.ClientHeight div 2) - (APanel.Height div 2);
  end
  else
  begin
    APanel.Left := (AForm.ClientWidth + 100);
    APanel.Top := (AForm.ClientHeight + 100);
  end;
  APanel.Update;
  AForm.Update;
end;

procedure Alinhartrackbar(AForm: TForm; APanel: TTrackBar; ACentro: Boolean);
begin
  if ACentro then
  begin
    APanel.Left := (AForm.ClientWidth div 2) - (APanel.Width div 2);
    APanel.Top := (AForm.ClientHeight div 2 + 150) - (APanel.Height div 2);
  end
  else
  begin
    APanel.Left := (AForm.ClientWidth + 100);
    APanel.Top := (AForm.ClientHeight + 100);
  end;
  APanel.Update;
  AForm.Update;
end;

procedure AlinharLabel(AForm: TForm; APanel: TLabel; ACentro: Boolean);
begin
  if ACentro then
  begin
    APanel.Left := (AForm.ClientWidth div 2) - (APanel.Width div 2);
    APanel.Top := (AForm.ClientHeight div 2) - (APanel.Height div 2);
  end
  else
  begin
    APanel.Left := (AForm.ClientWidth + 100);
    APanel.Top := (AForm.ClientHeight + 100);
  end;
  APanel.Update;
  AForm.Update;
end;

function DataExtenso(Data:TDateTime): String;
{Retorna uma data por extenso}
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-feira';
  DiaDasemana [3]:= 'Terçafeira';
  DiaDasemana [4]:= 'Quarta-feira';
  DiaDasemana [5]:= 'Quinta-feira';
  DiaDasemana [6]:= 'Sexta-feira';
  DiaDasemana [7]:= 'Sábado';
{ Meses do ano }
  Meses [1] := 'Janeiro';
  Meses [2] := 'Fevereiro';
  Meses [3] := 'Março';
  Meses [4] := 'Abril';
  Meses [5] := 'Maio';
  Meses [6] := 'Junho';
  Meses [7] := 'Julho';
  Meses [8] := 'Agosto';
  Meses [9] := 'Setembro';
  Meses [10]:= 'Outubro';
  Meses [11]:= 'Novembro';
  Meses [12]:= 'Dezembro';
  DecodeDate (Data, Ano, Mes, Dia);
  NoDia := DayOfWeek (Data);
  Result := DiaDaSemana[NoDia] + ', ' +
  IntToStr(Dia) + ' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano);
end;

Function RetornaMes(datas : TdateTime):string;
var
Year, Month, Day : Word;
begin
DecodeDate(datas, Year, Month, Day);
result :=  IntToStr(Month);
end;

Function ConcatenaMes(mes : word):TdateTime;
var
DataAtual : Tdatetime;
Year, Month, Day : Word;
begin
if (mes > 0) and (mes <= 12)  then
begin
dataatual := date;
DecodeDate(dataatual, Year, Month, Day);
result := EncodeDate(year,mes,1);
end
else
result := date;
end;


function DifHora(Inicio,Fim : String; NumDias : integer):String;
{Retorna a diferença entre duas horas}
var
  FIni,FFim,HoraResultado : TDateTime;
  Hour, Min, Sec, MSec : Word;
begin
Fini := StrTotime(Inicio);
FFim := StrToTime(Fim);

NumDias := NumDias * 24;

If (Inicio > Fim) then
  begin
  HoraResultado := (StrTotime('23:59:59') + StrToTime('00:00:01') -Fini)+FFim
  end
else
  begin
  HoraResultado := FFim-Fini;
  end;

DecodeTime(HoraResultado, Hour, Min, Sec, MSec);
hour := NumDias + Hour;
result := inttostr(Hour) + ':' + inttostr(Min) + ':' + inttostr(Sec);

end;

function Validar(entrada, registro : string): Boolean;
var
  i, TamanhoString, pos, PosLetra, TamanhoChave: Integer;
begin
  TamanhoString := Length(entrada);
  TamanhoChave := Length(mChave);
  for i := 1 to TamanhoString do
  begin
   pos := (i mod TamanhoChave);
    if pos = 0 then
     pos := TamanhoChave;
    posLetra := ord(entrada[i]) xor ord(mChave[pos]);
    if posLetra = 0 then
     posLetra := ord(entrada[i]);
    entrada[i] := chr(posLetra);
  end;
   if entrada = registro then
     result := true
   else
     result := false;
end;

function Codigo(mStr : string): string;
var
  i, TamanhoString, pos, PosLetra, TamanhoChave: Integer;
begin
  Result := mStr;
  TamanhoString := Length(mStr);
  TamanhoChave := Length(mChave);
  for i := 1 to TamanhoString do
  begin
  pos := (i mod TamanhoChave);
  if pos = 0 then
  pos := TamanhoChave;
  posLetra := ord(Result[i]) xor ord(mChave[pos]);
  if posLetra = 0 then
  posLetra := ord(Result[i]);
  Result[i] := chr(posLetra);
  end;
end;

function ExtractName(const Filename: String): String;
{Retorna o nome do Arquivo sem extensão}
var
aExt : String;
aPos : Integer;
begin
aExt := ExtractFileExt(Filename);
Result := ExtractFileName(Filename);
if aExt <> '' then
  begin
  aPos := Pos(aExt,Result);
  if aPos > 0 then
  begin
  Delete(Result,aPos,Length(aExt));
  end;
  end;
  
end;

function Calculapercentual(valor:real;Percent:Real):real;
// Retorna a porcentagem de um valor
var
 temp : real;
begin
percent := percent / 100;
try
  temp := valor;
  valor := valor * Percent;
  Valor := temp - valor;
finally
  result := valor;
end;
end;

end.
