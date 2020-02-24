unit Upagamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, DBCtrls, Mask, ComCtrls,
  DB, ADODB;

type
  TFrmPagamentos = class(TForm)
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    v: TGroupBox;
    BitBtn5: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    GroupBox8: TGroupBox;
    Label11: TLabel;
    Label15: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    dsFiltro: TDataSource;
    Filtro: TADOQuery;
    FiltroCodInteno: TAutoIncField;
    FiltroNumeroNF: TIntegerField;
    FiltroNumeroParcela: TWideStringField;
    FiltroValorParcela: TBCDField;
    RadioGroup1: TRadioGroup;
    ComboBox2: TComboBox;
    Label16: TLabel;
    FiltroDataVencimento: TDateTimeField;
    FiltroQuitado: TBooleanField;
    FiltroEmpresa: TWideStringField;
    FiltroDataPagamento: TDateTimeField;
    FiltroDesconto: TIntegerField;
    FiltroFormaPagamento: TWideStringField;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    Panel1: TPanel;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ComboBox2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit8Enter(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure Panel1Enter(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet2Hide(Sender: TObject);
  private
      function MesExtenso( Mes:Word ) : string;
  public
    { Public declarations }
  end;

var
  FrmPagamentos: TFrmPagamentos;
  a : string;

implementation

uses UDM, URotinas;

{$R *.dfm}

function TFrmPagamentos.MesExtenso( Mes:Word ) : string;
const
 meses : array[0..11] of PChar = ('Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro','Outubro', 'Novembro', 'Dezembro');
begin
result := meses[mes-1];
End;

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
if (Texto[I] in ['0'..'9',',']) then
begin
S := S + Copy(Texto, I, 1);
end;
end;
result := S;
end;

procedure TFrmPagamentos.Panel1Enter(Sender: TObject);
var
 a : string;
 b : real;
begin
a := RemoveChar(DBEdit3.Text);
b := strtofloat(Edit2.Text);
b := strtofloat(a) + b;
Panel1.Caption := 'R$ ' + formatfloat('###,###,##0.00', b);
CorSaida(sender);
end;

procedure TFrmPagamentos.BitBtn10Click(Sender: TObject);
begin
close;
end;

procedure TFrmPagamentos.BitBtn5Click(Sender: TObject);
begin
if FiltroDataPagamento.AsString = ''  then
 begin
  DBEdit1.SetFocus;
  Exit;
 end;

if Panel1.Caption <> '' then
begin
if MessageDlg('Confirma esta Operação ?',mtConfirmation,[mbYes,mbCancel],0) = mrYes then
  begin
    Filtro.Edit;
    FiltroDesconto.AsInteger := strtoint(Edit2.Text);
    FiltroQuitado.AsBoolean := true;
    FiltroValorParcela.AsCurrency := StrToCurr(RemoveChar(Panel1.Caption));
    Filtro.Post;
    Filtro.Requery([]);
    ShowMessage('Operação efetuada com Sucesso');
    Edit2.Text := '0';
    Panel1.Caption := '';
    TabSheet1.Show;
    TabSheet2.TabVisible := false;
  end
   else
    begin
      Edit2.Text := '0';
      Panel1.Caption := '';
      DBEdit9.SetFocus;
    end;
end
 else
  DBEdit3.SetFocus;

end;

procedure TFrmPagamentos.BitBtn9Click(Sender: TObject);
begin
Edit2.Text := '0';
Panel1.Caption := '';
TabSheet1.Show;
TabSheet2.TabVisible := false;
end;

procedure TFrmPagamentos.ComboBox1Click(Sender: TObject);
begin
Edit1.SetFocus;
end;

procedure TFrmPagamentos.ComboBox2Click(Sender: TObject);
begin
case ComboBox2.ItemIndex  of
0 :  a := 'where month(datavencimento) = 1';
1 :  a := 'where month(datavencimento) = 2';
2 :  a := 'where month(datavencimento) = 3';
3 :  a := 'where month(datavencimento) = 4';
4 :  a := 'where month(datavencimento) = 5';
5 :  a := 'where month(datavencimento) = 6';
6 :  a := 'where month(datavencimento) = 7';
7 :  a := 'where month(datavencimento) = 8';
8 :  a := 'where month(datavencimento) = 9';
9 : a := 'where month(datavencimento) = 10';
10 : a := 'where month(datavencimento) = 11';
11 : a := 'where month(datavencimento) = 12';
end;

   Filtro.Close;
   Filtro.SQL.Clear;
   Filtro.SQL.Add('select * from BoletosCompra ' + a + ' and quitado = false order by datavencimento');
   Filtro.Open;
end;

procedure TFrmPagamentos.DateTimePicker1CloseUp(Sender: TObject);
begin
Filtro.Edit;
FiltroDataPagamento.AsString := DateToStr(DateTimePicker1.Date);
DBEdit1.SetFocus;
end;

procedure TFrmPagamentos.DBEdit8Enter(Sender: TObject);
begin
CorEntrada(sender);
end;

procedure TFrmPagamentos.DBEdit8Exit(Sender: TObject);
begin
CorSaida(sender);
end;

procedure TFrmPagamentos.DBGrid1DblClick(Sender: TObject);
begin
TabSheet2.TabVisible := true;
TabSheet2.Show;
end;

procedure TFrmPagamentos.Edit1Change(Sender: TObject);
begin
Filtro.Close;
Filtro.SQL.Clear;
Filtro.SQL.Add('Select * from BoletosCompra where ' + ComboBox1.Text + ' ');
Filtro.SQL.Add(' like "' + Edit1.Text + '%" and quitado = false order by datavencimento');
Filtro.Open;
end;

procedure TFrmPagamentos.Edit2Exit(Sender: TObject);
var
 a : string;
 b : real;
begin
a := RemoveChar(DBEdit3.Text);
b := strtofloat(Edit2.Text);
b := strtofloat(a) + b;
Panel1.Caption := 'R$ ' + formatfloat('###,###,##0.00', b);
CorSaida(sender);
end;

procedure TFrmPagamentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FrmPagamentos.Release;
FrmPagamentos := nil;
end;


procedure TFrmPagamentos.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
begin
      Key := #0;
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TFrmPagamentos.RadioGroup1Click(Sender: TObject);
begin
case RadioGroup1.ItemIndex of
0 : begin
     Label11.Visible := false;
     Label15.Visible := false;
     ComboBox1.Visible := false;
     Edit1.Visible := false;
     Label16.Visible := true;
     ComboBox2.Visible := true;
    end;
1 :  begin
     Label11.Visible := true;
     Label15.Visible := true;
     ComboBox1.Visible := true;
     Edit1.Visible := true;
     Label16.Visible := false;
     ComboBox2.Visible := false;
     Edit1.SetFocus;
    end;
end;



end;

procedure TFrmPagamentos.TabSheet2Hide(Sender: TObject);
begin
Filtro.Cancel;
TabSheet2.TabVisible := false
end;

procedure TFrmPagamentos.TabSheet2Show(Sender: TObject);
begin
DBEdit2.SetFocus;
end;

procedure TFrmPagamentos.FormShow(Sender: TObject);
var
  Data: TDateTime;
  Ano, Mes, Dia: word;
begin
  DateTimePicker1.date := date;
  Data:= Now;
  DecodeDate(Data, Ano, Mes, Dia);
  ComboBox2.Text := MesExtenso(mes);
  a := 'where month(datavencimento) = ' + IntToStr(mes);
   Filtro.Close;
   Filtro.SQL.Clear;
   Filtro.SQL.Add('select * from BoletosCompra ' + a + ' and quitado = false order by datavencimento');
   Filtro.Open;
end;

end.
