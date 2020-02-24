unit UDespDivResumo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, DBCtrls, Grids, DBGrids, StdCtrls, Buttons, ComCtrls;

type
  TFrmDespDivResumo = class(TForm)
    GroupBox8: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn4: TBitBtn;
    CheckBox1: TCheckBox;
    DBGrid1: TDBGrid;
    DBLookupComboBox2: TDBLookupComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    QRFiltro: TADOQuery;
    DSFiltro: TDataSource;
    QRFiltroCodDebito: TAutoIncField;
    QRFiltroData: TDateTimeField;
    QRFiltroEmpresa: TWideStringField;
    QRFiltroTipoPagamento: TWideStringField;
    QRFiltroNumero: TWideStringField;
    QRFiltroValor: TBCDField;
    QRFiltrosituacao: TBooleanField;
    QRFiltrotemp: TWideStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDespDivResumo: TFrmDespDivResumo;

implementation

uses UDM, UDMRelatorios, ULogin;

{$R *.dfm}

procedure TFrmDespDivResumo.BitBtn4Click(Sender: TObject);
var
 checBox, dblookcombSTR : string;
begin

dblookcombSTR := DBLookupComboBox2.Text;
checbox := BoolToStr(CheckBox1.Checked, true);
QRFiltro.Close;
QRFiltro.SQL.Clear;
QRFiltro.SQL.Add('select * from Cad_DespDiversas where situacao = ' + checbox + ' ');

if DBLookupComboBox2.Text <> '' then
QRFiltro.SQL.Add('and empresa like "' + dblookcombSTR + '%"  ');

QRFiltro.SQL.Add('and data between :datainicial and :datafinal order by data desc');
QRFiltro.Parameters[0].Value := DateToStr(DateTimePicker1.Date);
QRFiltro.Parameters[1].Value := DateToStr(DateTimePicker2.Date);
QRFiltro.Open;

  //DBLookupComboBox2.KeyValue := -1;

end;

procedure TFrmDespDivResumo.Button1Click(Sender: TObject);
var
 checBox, dblookcombSTR : string;
begin

dblookcombSTR := DBLookupComboBox2.Text;
checbox := BoolToStr(CheckBox1.Checked, true);

QRFiltro.Close;
QRFiltro.SQL.Clear;
QRFiltro.SQL.Add('Update Cad_DespDiversas Set temp="" where situacao = ' + checbox + ' ');
  if DBLookupComboBox2.Text <> '' then
     QRFiltro.SQL.Add('and empresa like "' + dblookcombSTR + '%"  ');
QRFiltro.SQL.Add('and data between :datainicial and :datafinal');
QRFiltro.Parameters[0].Value := DateToStr(DateTimePicker1.Date);
QRFiltro.Parameters[1].Value := DateToStr(DateTimePicker2.Date);
QRFiltro.ExecSQL;


QRFiltro.Close;
QRFiltro.SQL.Clear;
QRFiltro.SQL.Add('select * from Cad_DespDiversas where situacao = ' + checbox + ' ');
   if DBLookupComboBox2.Text <> '' then
      QRFiltro.SQL.Add('and empresa like "' + dblookcombSTR + '%"  ');
QRFiltro.SQL.Add('and data between :datainicial and :datafinal order by data desc');
QRFiltro.Parameters[0].Value := DateToStr(DateTimePicker1.Date);
QRFiltro.Parameters[1].Value := DateToStr(DateTimePicker2.Date);
QRFiltro.Open;

DBGrid1.Update;
end;

procedure TFrmDespDivResumo.Button2Click(Sender: TObject);
var
 checBox, dblookcombSTR : string;
begin
dblookcombSTR := DBLookupComboBox2.Text;
checbox := BoolToStr(CheckBox1.Checked, true);

QRFiltro.Close;
QRFiltro.SQL.Clear;
QRFiltro.SQL.Add('Update Cad_DespDiversas Set temp="X" where situacao = ' + checbox + ' ');
   if DBLookupComboBox2.Text <> '' then
     QRFiltro.SQL.Add('and empresa like "' + dblookcombSTR + '%"  ');
QRFiltro.SQL.Add('and data between :datainicial and :datafinal');
QRFiltro.Parameters[0].Value := DateToStr(DateTimePicker1.Date);
QRFiltro.Parameters[1].Value := DateToStr(DateTimePicker2.Date);
QRFiltro.ExecSQL;


QRFiltro.Close;
QRFiltro.SQL.Clear;
QRFiltro.SQL.Add('select * from Cad_DespDiversas where situacao = ' + checbox + ' ');
   if DBLookupComboBox2.Text <> '' then
      QRFiltro.SQL.Add('and empresa like "' + dblookcombSTR + '%"  ');
QRFiltro.SQL.Add('and data between :datainicial and :datafinal order by data desc');
QRFiltro.Parameters[0].Value := DateToStr(DateTimePicker1.Date);
QRFiltro.Parameters[1].Value := DateToStr(DateTimePicker2.Date);
QRFiltro.Open;

DBGrid1.Update;
end;

procedure TFrmDespDivResumo.Button3Click(Sender: TObject);
begin
DMRelatorios.QRGeral.Close;
DMRelatorios.QRGeral.SQL.Clear;
DMRelatorios.QRGeral.SQL.Add('select * from Cad_DespDiversas where temp ="X" order by data desc');
DMRelatorios.QRGeral.Open;

DMRelatorios.CreditoDebito.LoadFromFile('' + DiretorioInstal + 'frfGastosDiversosResumo.frf');
DMRelatorios.CreditoDebito.ShowReport;
end;

procedure TFrmDespDivResumo.DBGrid1CellClick(Column: TColumn);
begin
QRFiltro.Edit;
if QRFiltrotemp.AsString = 'X' then
QRFiltrotemp.AsString := ''
else QRFiltrotemp.AsString := 'X';
QRFiltro.Post;
end;

procedure TFrmDespDivResumo.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
Check: Integer;
R: TRect;
begin
//Desenha um checkbox no dbgrid
if Column.FieldName = 'temp' then begin
DBGrid1.Canvas.FillRect(Rect);
//Check := 0;
if QRFiltrotemp.AsString = 'X' then
Check := DFCS_CHECKED
else Check := 0;
R:=Rect;
InflateRect(R,-2,-2); {Diminue o tamanho do CheckBox}
DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
end;
end;

procedure TFrmDespDivResumo.DBLookupComboBox2KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = VK_DELETE  then
  DBLookupComboBox2.KeyValue := -1;
end;

procedure TFrmDespDivResumo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmDespDivResumo.Release;
  FrmDespDivResumo := nil;
end;

procedure TFrmDespDivResumo.FormShow(Sender: TObject);
begin
DateTimePicker1.Date := date;
DateTimePicker2.Date := date + 30;

QRFiltro.Close;
QRFiltro.SQL.Clear;
QRFiltro.SQL.Add('Update Cad_DespDiversas Set temp=""');
QRFiltro.ExecSQL;

QRFiltro.Close;
QRFiltro.SQL.Clear;
QRFiltro.SQL.Add('select * from Cad_DespDiversas where data between (date() - 30) and (date() + 190) order by data desc');
QRFiltro.open;

end;

end.
