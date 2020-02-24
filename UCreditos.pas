unit UCreditos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Grids, DBGrids, ComCtrls, Buttons, DB, BDE, ADODB,
  Mask;

type
  TFrmCreditos = class(TForm)
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn8: TBitBtn;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    GroupBox8: TGroupBox;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label8: TLabel;
    DateTimePicker2: TDateTimePicker;
    BitBtn4: TBitBtn;
    QrFiltro: TADOQuery;
    DsQrFiltro: TDataSource;
    QrFiltroCodCredito: TAutoIncField;
    QrFiltroData: TDateTimeField;
    QrFiltroDinheiro: TBCDField;
    QrFiltroChequePre: TBCDField;
    QrFiltroCartaoVisa: TBCDField;
    QrFiltroCartaoCred: TBCDField;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DateTimePicker2CloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TabSheet2Hide(Sender: TObject);
  private
    Procedure SomarCampos;
  public
    { Public declarations }
  end;

var
  FrmCreditos: TFrmCreditos;

implementation

uses UDM, URotinas;

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
if (Texto[I] in ['0'..'9',',']) then
begin
S := S + Copy(Texto, I, 1);
end;
end;
result := S;
end;

Procedure TFrmCreditos.SomarCampos;
var
 a : real;
begin
if (DBEdit2.Text <> '') and (DBEdit3.Text <> '') and (DBEdit4.Text <> '')
and (DBEdit5.Text <> '') then
 begin
  a := StrToFloat(removechar(DBEdit2.Text)) +
  StrToFloat(removechar(DBEdit3.Text)) + StrToFloat(removechar(DBEdit4.Text)) +
  StrToFloat(removechar(DBEdit5.Text));
  Label6.Caption := 'R$ ' + formatfloat('###,###,##0.00', a);
 end;
end;

procedure TFrmCreditos.TabSheet1Show(Sender: TObject);
begin
QrFiltro.Requery([]);
DateTimePicker1.SetFocus;
end;

procedure TFrmCreditos.TabSheet2Hide(Sender: TObject);
begin
if DM.QRCreditos.State in [dsinsert,dsedit] then else
TabSheet2.TabVisible := false;
end;

procedure TFrmCreditos.TabSheet2Show(Sender: TObject);
begin
SomarCampos;
end;

procedure TFrmCreditos.BitBtn1Click(Sender: TObject);
begin
TabSheet2.TabVisible := true;
TabSheet2.SHOW;
 if DM.QRCreditos.State in [dsinsert] then
   ShowMessage('Este já é um Cadastro Novo')
 else
 begin
  BitBtn3.Enabled := false;
  DM.QRCreditos.insert;
  DM.QRCreditosData.AsString := DateToStr(date);
  DBEdit1.SetFocus;
  Label6.Caption := '';
 end;
end;

procedure TFrmCreditos.BitBtn2Click(Sender: TObject);
begin
if DM.QRCreditos.State in [dsinsert,dsedit] then
  If DBEdit1.text <> '' then
   begin
    DM.QRCreditos.Post;
    ShowMessage('Gravação Efetuada Com Sucesso');
    BitBtn3.Enabled := true;
   end
   else
    begin
     MessageDLG('Gravação Não Efetuada, Falta Dados',mtError,[mbok],0);
     DBEdit1.SetFocus;
    end;
end;

procedure TFrmCreditos.BitBtn3Click(Sender: TObject);
begin
DM.QRCreditos.Refresh;
if TabSheet2.TabVisible = true then
if (DM.QRCreditos.Bof <> true) and (DM.QRCreditos.Eof <> true) then
  begin
   if messagedlg('Deseja Excluir este Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    DM.QRCreditos.Delete;
   end
      else
 showmessage('Nenhum Registro Para Excluir!');
 TabSheet1.Show;
end;

procedure TFrmCreditos.BitBtn4Click(Sender: TObject);
begin
QrFiltro.Close;
QrFiltro.SQL.Clear;
QrFiltro.SQL.Add('select * from Cad_Creditos where data between :datainicial ');
QrFiltro.SQL.Add(' and :datafinal order by data desc');
QrFiltro.Parameters[0].Value := DateToStr(DateTimePicker1.Date);
QrFiltro.Parameters[1].Value := DateToStr(DateTimePicker2.Date);
QrFiltro.Open;
DateTimePicker1.SetFocus;
end;

procedure TFrmCreditos.BitBtn8Click(Sender: TObject);
begin
if DM.QRCreditos.State in [dsinsert,dsedit] then
 begin
  DM.QRCreditos.Cancel;
  BitBtn3.Enabled := true;
 end
   else
    TabSheet1.Show;
end;

procedure TFrmCreditos.DateTimePicker2CloseUp(Sender: TObject);
begin
BitBtn4.SetFocus;
end;

procedure TFrmCreditos.DBEdit1Enter(Sender: TObject);
begin
CorEntrada(sender);
end;

procedure TFrmCreditos.DBEdit1Exit(Sender: TObject);
begin
CorSaida(sender);
end;

procedure TFrmCreditos.DBEdit5Exit(Sender: TObject);
begin
  SomarCampos;
  CorSaida(sender);
end;


procedure TFrmCreditos.DBGrid1DblClick(Sender: TObject);
begin
if not DM.QRCreditos.IsEmpty then
begin
DM.QRCreditos.Locate('CodCredito',QrFiltro.FieldByName('CodCredito').AsInteger,[locaseinsensitive]);
TabSheet2.Show;
end;
end;

procedure TFrmCreditos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if DM.QRCreditos.State in [dsedit,dsinsert] then
begin
 showmessage('Por Favor, salve este cadastro antes de Sair!');
 canclose := false;
 end
else
 begin
  FrmCreditos.Release;
  FrmCreditos := nil;
 end;
end;

procedure TFrmCreditos.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
begin
      Key := #0;
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TFrmCreditos.FormShow(Sender: TObject);
begin
DateTimePicker1.Date := date;
DateTimePicker2.Date := date + 30;
end;

end.
