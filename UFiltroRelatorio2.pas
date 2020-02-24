unit UFiltroRelatorio2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TFrmFiltroRelatorio2 = class(TForm)
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
   function MesExtenso( Mes:Word ) : string;
  end;

var
  FrmFiltroRelatorio2: TFrmFiltroRelatorio2;
  FechaForm : Boolean;

implementation

uses URotinas, UPrincipal;

{$R *.dfm}

function RemoveChar(Const Texto:String):String; 
//
// Remove caracteres de uma string deixando apenas numeros
//
var
I: integer;
S: string;
begin
S := '';
for I := 1 To Length(Texto) Do
begin
if (Texto[I] in ['0'..'9','/']) then
begin
S := S + Copy(Texto, I, 1);
end;
end;
result := S;
end;

function TFrmFiltroRelatorio2.MesExtenso( Mes:Word ) : string;
const
 meses : array[0..11] of PChar = ('Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro','Outubro', 'Novembro', 'Dezembro');
begin
result := meses[mes-1];
End;

procedure TFrmFiltroRelatorio2.RadioGroup1Click(Sender: TObject);
begin
case RadioGroup1.ItemIndex of
0 : begin
     Label4.Enabled := false;
     DateTimePicker1.Enabled := false;
     Label2.Enabled := false;
     ComboBox1.Enabled := false;
     Label1.Enabled := false;
     Edit1.Enabled := false;
     UpDown1.Enabled := false;
    end;
1 :  begin
     Label4.Enabled := true;
     DateTimePicker1.Enabled := true;
     Label2.Enabled := false;
     ComboBox1.Enabled := false;
     Label1.Enabled := false;
     Edit1.Enabled := false;
     UpDown1.Enabled := false;
    end;
2 :  begin
     Label4.Enabled := false;
     DateTimePicker1.Enabled := false;
     Label2.Enabled := true;
     ComboBox1.Enabled := true;
     Label1.Enabled := true;
     Edit1.Enabled := true;
     UpDown1.Enabled := true;
    end;
end;
end;

procedure TFrmFiltroRelatorio2.BitBtn1Click(Sender: TObject);
begin

DATA1 := '';
DATA2 := '';

if DateTimePicker1.Enabled then
 begin
  data1 := 'where data = :outrodia';
  data2 := RemoveChar(datetostr(DateTimePicker1.Date));
 end
  else
if ComboBox1.Enabled then
 begin
 if ComboBox1.text = 'JANEIRO' then
     DATA1 :=  'where month(data) = 1 and year(data) = ' + Edit1.Text;
 if ComboBox1.text = 'FEVEREIRO' then
     DATA1 :=  'where month(data) = 2 and year(data) = ' + Edit1.Text;
 if ComboBox1.text = 'MARÇO' then
     DATA1 :=  'where month(data) = 3 and year(data) = ' + Edit1.Text;
 if ComboBox1.text = 'ABRIL' then
     DATA1 :=  'where month(data) = 4 and year(data) = ' + Edit1.Text;
 if ComboBox1.text = 'MAIO' then
     DATA1 :=  'where month(data) = 5 and year(data) = ' + Edit1.Text;
 if ComboBox1.text = 'JUNHO' then
     DATA1 :=  'where month(data) = 6 and year(data) = ' + Edit1.Text;
 if ComboBox1.text = 'JULHO' then
     DATA1 :=  'where month(data) = 7 and year(data) = ' + Edit1.Text;
 if ComboBox1.text = 'AGOSTO' then
     DATA1 :=  'where month(data) = 8 and year(data) = ' + Edit1.Text;
 if ComboBox1.text = 'SETEMBRO' then
     DATA1 :=  'where month(data) = 9 and year(data) = ' + Edit1.Text;
 if ComboBox1.text = 'OUTUBRO' then
     DATA1 :=  'where month(data) = 10 and year(data) = ' + Edit1.Text;
 if ComboBox1.text = 'NOVEMBRO' then
     DATA1 :=  'where month(data) = 11 and year(data) = ' + Edit1.Text;
 if ComboBox1.text = 'DEZEMBRO' then
     DATA1 :=  'where month(data) = 12 and year(data) = ' + Edit1.Text;
 if ComboBox1.text = 'ANO INTEIRO' then
     DATA1 :=  'Where Year(data) = ' + Edit1.Text;
 end
  else
   data1 := 'where data = date()';

  FechaForm := true;

end;

procedure TFrmFiltroRelatorio2.BitBtn2Click(Sender: TObject);
begin
FechaForm := true;
CloseModal;
end;

procedure TFrmFiltroRelatorio2.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if FechaForm = false then 
Canclose := False;
end;

procedure TFrmFiltroRelatorio2.FormShow(Sender: TObject);
var
  Data: TDateTime;
  Ano, Mes, Dia: word;
begin
  FrmFiltroRelatorio2.Caption := CaptionForm;
  DateTimePicker1.date := date;
  Data:= Now;
  DecodeDate(Data, Ano, Mes, Dia);
  ComboBox1.Text := MesExtenso(mes);
  Edit1.Text := IntToStr(ano);
end;

end.
