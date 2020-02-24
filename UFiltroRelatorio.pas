unit UFiltroRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Mask, DB, BDE, ComCtrls;

type
  TFrmFiltroRelatorio = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label7: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label8: TLabel;
    DateTimePicker2: TDateTimePicker;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure DateTimePicker2CloseUp(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MaskEdit1Enter(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFiltroRelatorio: TFrmFiltroRelatorio;
  FechaForm : Boolean;

implementation

uses UPrincipal, URotinas;

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

procedure TFrmFiltroRelatorio.BitBtn1Click(Sender: TObject);
begin
if (datetostr(DateTimePicker1.date) <> '') AND (datetostr(DateTimePicker2.date) <> '') then
begin
data1 := datetostr(DateTimePicker1.date);
data2 := datetostr(DateTimePicker2.date);
    data1 := RemoveChar(data1);
    data2 := RemoveChar(data2);
fornecedor := DBLookupComboBox1.Text;
nfs := Edit1.Text;
if (fornecedor = '') and (nfs = '') then
 begin
  Oplogico1 := 'xor';
  Oplogico2 := 'or';
 end
  else
  if (fornecedor <> '') and (nfs <> '') then
   begin
    Oplogico1 := 'and';
    Oplogico2 := 'and';
   end
    else
     begin
      Oplogico1 := 'and';
      Oplogico2 := 'or';
     end;
  FechaForm := true;
end
 else
  begin
   showmessage('Esta Faltando Especificar o Período da Pesquisa !');
   FechaForm := false;
   DateTimePicker1.SetFocus;
  end;
end;

procedure TFrmFiltroRelatorio.BitBtn2Click(Sender: TObject);
begin
FechaForm := true;
CloseModal;
end;

procedure TFrmFiltroRelatorio.DateTimePicker1CloseUp(Sender: TObject);
begin
DateTimePicker2.SetFocus;
end;

procedure TFrmFiltroRelatorio.DateTimePicker2CloseUp(Sender: TObject);
begin
DBLookupComboBox1.SetFocus;
end;

procedure TFrmFiltroRelatorio.DBLookupComboBox1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = VK_DELETE  then
  DBLookupComboBox1.KeyValue := -1;
end;

procedure TFrmFiltroRelatorio.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then
  begin
  beep;{somente delphi 2.0 ou >}
  key:=#0;
  end;
end;

procedure TFrmFiltroRelatorio.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if FechaForm = false then 
Canclose:=False;
end;

procedure TFrmFiltroRelatorio.FormCreate(Sender: TObject);
begin
DateTimePicker1.date := date;
DateTimePicker2.date := date + 31;
end;

procedure TFrmFiltroRelatorio.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
begin
      Key := #0;
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TFrmFiltroRelatorio.FormShow(Sender: TObject);
begin
FrmFiltroRelatorio.Caption := CaptionForm;
DateTimePicker1.SetFocus;
end;

procedure TFrmFiltroRelatorio.MaskEdit1Enter(Sender: TObject);
begin
CorEntrada(sender);
end;

procedure TFrmFiltroRelatorio.MaskEdit1Exit(Sender: TObject);
begin
CorSaida(sender);
end;

end.


