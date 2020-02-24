unit UEstornos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, DBCtrls, Mask, ComCtrls,
  DB, ADODB;

type
  TFrmEstornos = class(TForm)
    dsFiltro: TDataSource;
    Filtro: TADOQuery;
    FiltroCodInteno: TAutoIncField;
    FiltroNumeroNF: TIntegerField;
    FiltroNumeroParcela: TWideStringField;
    FiltroValorParcela: TBCDField;
    FiltroDataVencimento: TDateTimeField;
    FiltroQuitado: TBooleanField;
    FiltroEmpresa: TWideStringField;
    FiltroDataPagamento: TDateTimeField;
    FiltroDesconto: TIntegerField;
    FiltroFormaPagamento: TWideStringField;
    GroupBox8: TGroupBox;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    v: TGroupBox;
    BitBtn5: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Label2: TLabel;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Change(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure DBEdit8Enter(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  FrmEstornos: TFrmEstornos;
  a : string;

implementation

uses UDM, URotinas, Upagamentos;

{$R *.dfm}

procedure TFrmEstornos.BitBtn10Click(Sender: TObject);
begin
close;
end;

procedure TFrmEstornos.BitBtn5Click(Sender: TObject);
begin
if Filtro.IsEmpty then
 exit;
 if MessageDlg('Deseja estornar este título pago?',mtConfirmation,[mbYes,mbCancel], 0) = mrYes then
  begin
  Filtro.Edit;
  FiltroDataPagamento.AsString := '';
  FiltroDesconto.AsInteger := 0;
  FiltroQuitado.AsBoolean := false;
  Filtro.Post;
  Filtro.Requery([]);
  end;
end;

procedure TFrmEstornos.BitBtn9Click(Sender: TObject);
begin
 Filtro.Close;
 Filtro.SQL.Clear;
 Filtro.SQL.Add('select * from boletoscompra where quitado = true and ');
 Filtro.SQL.Add('month(datavencimento) = month(now) order by datavencimento');
 Filtro.Open;
  DBLookupComboBox1.KeyValue := -1;
  Edit1.Clear;
  DBLookupComboBox1.SetFocus;
end;

procedure TFrmEstornos.ComboBox1Click(Sender: TObject);
begin
Edit1.SetFocus;
end;

procedure TFrmEstornos.DBEdit8Enter(Sender: TObject);
begin
CorEntrada(sender);
end;

procedure TFrmEstornos.DBEdit8Exit(Sender: TObject);
begin
CorSaida(sender);
end;

procedure TFrmEstornos.DBLookupComboBox1Click(Sender: TObject);
begin
Edit1.SetFocus;
end;

procedure TFrmEstornos.DBLookupComboBox1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_DELETE  then
  DBLookupComboBox1.KeyValue := -1;
end;

procedure TFrmEstornos.Edit1Change(Sender: TObject);
begin
if (Edit1.Text = '') and (DBLookupComboBox1.Text = '') then
 begin
  Filtro.Close;
  Filtro.SQL.Clear;
  Filtro.SQL.Add('select * from boletoscompra where quitado = true and ');
  Filtro.SQL.Add('month(datavencimento) = month(now) order by datavencimento');
  Filtro.Open;
  exit;
 end;

if (Edit1.Text <> '') and (DBLookupComboBox1.Text = '') then
 begin
  Filtro.Close;
  Filtro.SQL.Clear;
  Filtro.SQL.Add('Select * from BoletosCompra where quitado = true and ');
  Filtro.SQL.Add('numeronf like "' + Edit1.Text + '%" order by datavencimento');
  Filtro.Open;
  exit;
 end;

 if (Edit1.Text = '') and (DBLookupComboBox1.Text <> '') then
 begin
  Filtro.Close;
  Filtro.SQL.Clear;
  Filtro.SQL.Add('Select * from BoletosCompra where quitado = true and ');
  Filtro.SQL.Add('empresa like "' + DBLookupComboBox1.Text + '%" order by datavencimento');
  Filtro.Open;
 end
  else
   begin
   Filtro.Close;
   Filtro.SQL.Clear;
   Filtro.SQL.Add('Select * from BoletosCompra where quitado = true and empresa = "' + DBLookupComboBox1.Text + '" ');
   Filtro.SQL.Add('and numeronf like "' + Edit1.Text + '%" order by datavencimento');
   Filtro.Open;
   end;
end;

procedure TFrmEstornos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FrmEstornos.Release;
FrmEstornos := nil;
end;


procedure TFrmEstornos.FormShow(Sender: TObject);
begin
DBLookupComboBox1.SetFocus;
end;

end.
