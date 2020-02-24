unit UNf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, Buttons,
  DB, ADODB, ImgList;

type
  TFrmNf = class(TForm)
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    v: TGroupBox;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    GroupBox8: TGroupBox;
    Label11: TLabel;
    Label15: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    TabSheet3: TTabSheet;
    Pedido: TADOQuery;
    DSPedido: TDataSource;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    DBGrid3: TDBGrid;
    Label9: TLabel;
    Label10: TLabel;
    BitBtn4: TBitBtn;
    Label16: TLabel;
    Label18: TLabel;
    UpDown1: TUpDown;
    Edit5: TEdit;
    Edit2: TEdit;
    DsSomatoriaNF: TDataSource;
    SomatoriaNF: TADOQuery;
    SomatoriaNFTotalitens: TFloatField;
    SomatoriaNFTotalGeral: TBCDField;
    ComboBox2: TComboBox;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    RadioGroup1: TRadioGroup;
    PedidoCod_Compra: TAutoIncField;
    PedidoEmpresa: TWideStringField;
    PedidoPedido: TIntegerField;
    PedidoDataPedido: TDateTimeField;
    PedidoDataEntrega: TDateTimeField;
    PedidoPzoPagamento: TWideStringField;
    PedidoPedidoFechado: TBooleanField;
    PedidoObs: TWideMemoField;
    PedidoCorPedido: TWideStringField;
    BoletosCompra: TADOQuery;
    BoletosCompraCodInteno: TAutoIncField;
    BoletosCompraEmpresa: TWideStringField;
    BoletosCompraNumeroNF: TIntegerField;
    BoletosCompraNumeroParcela: TWideStringField;
    BoletosCompraDataVencimento: TDateTimeField;
    BoletosCompraDataPagamento: TDateTimeField;
    BoletosCompraValorParcela: TBCDField;
    BoletosCompraDesconto: TIntegerField;
    BoletosCompraQuitado: TBooleanField;
    BoletosCompraFormaPagamento: TWideStringField;
    DSBoletosCompra: TDataSource;
    ItensNF: TADOQuery;
    ItensNFCodDetalhecompra: TAutoIncField;
    ItensNFCod_Compra: TIntegerField;
    ItensNFReferencia: TWideStringField;
    ItensNFTotalItens: TIntegerField;
    ItensNFDescricao: TWideStringField;
    ItensNFPrecoUnitario: TBCDField;
    ItensNFTotal: TBCDField;
    DSItensNF: TDataSource;
    GroupBox5: TGroupBox;
    Label19: TLabel;
    Label17: TLabel;
    DBEdit11: TDBEdit;
    DateTimePicker1: TDateTimePicker;
    BitBtn8: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit2: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit5: TDBEdit;
    Panel1: TPanel;
    Label12: TLabel;
    GroupBox3: TGroupBox;
    DBGrid5: TDBGrid;
    NF: TADOQuery;
    ItensPedido: TADOQuery;
    DsNF: TDataSource;
    DsItensPedido: TDataSource;
    GroupBox6: TGroupBox;
    DBGrid4: TDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn11: TBitBtn;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    Label14: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    Label20: TLabel;
    NFId_NF: TAutoIncField;
    NFCod_Compra: TIntegerField;
    NFNumeroNF: TIntegerField;
    NFDataEntrega: TDateTimeField;
    NFDesconto: TIntegerField;
    Panel2: TPanel;
    GroupBox7: TGroupBox;
    Edit6: TEdit;
    Edit7: TEdit;
    MaskEdit1: TMaskEdit;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Panel3: TPanel;
    BitBtn14: TBitBtn;
    Label24: TLabel;
    ItensPedidoCodDetalhecompra: TAutoIncField;
    ItensPedidoCod_Compra: TIntegerField;
    ItensPedidoId_NF: TIntegerField;
    ItensPedidoReferencia: TWideStringField;
    ItensPedidoDescricao: TWideStringField;
    ItensPedidoTotalItens: TIntegerField;
    ItensPedidoPrecoUnitario: TBCDField;
    ItensPedidoTotal: TBCDField;
    ItensNFId_NF: TIntegerField;
    SomatoriaPedido: TADOQuery;
    FloatField1: TFloatField;
    BCDField1: TBCDField;
    DsSomatoriaPedido: TDataSource;
    Label25: TLabel;
    DBEdit12: TDBEdit;
    Label26: TLabel;
    Label27: TLabel;
    DBEdit13: TDBEdit;
    Label28: TLabel;
    BoletosCompraId_NF: TIntegerField;
    BitBtn15: TBitBtn;
    SomatoriaTitulos: TADOQuery;
    DsSomatoriaTitulos: TDataSource;
    SomatoriaTitulosTotalParcelas: TIntegerField;
    SomatoriaTitulosTotalGeral: TBCDField;
    Label29: TLabel;
    DBEdit10: TDBEdit;
    Label30: TLabel;
    DBEdit14: TDBEdit;
    BitBtn16: TBitBtn;
    Label31: TLabel;
    BitBtn17: TBitBtn;
    PedidosParcial: TADOQuery;
    DsPedidosParcial: TDataSource;
    PedidosParcialCod_Compra: TAutoIncField;
    Shape1: TShape;
    DBGrid2: TDBGrid;
    BitBtn18: TBitBtn;
    DBGrid6: TDBGrid;
    Label32: TLabel;
    Label33: TLabel;
    DSNfSemBoletos: TDataSource;
    NfsComBoletos: TADOQuery;
    NfsComBoletosId_NF: TAutoIncField;
    NfsComBoletosCod_Compra: TIntegerField;
    NfsComBoletosNumeroNF: TIntegerField;
    NfsComBoletosDataEntrega: TDateTimeField;
    NfsComBoletosDesconto: TIntegerField;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure TabSheet1Exit(Sender: TObject);
    procedure DBEdit3Enter(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure ComboBox2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure DateTimePicker2CloseUp(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure DsNFDataChange(Sender: TObject; Field: TField);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure DBGrid6DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
     var
      EstadoPedido : string;
  function RemoveChar(Const Texto:String):String;
  Procedure FechaPedido;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNf: TFrmNf;

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

Procedure TFrmNf.FechaPedido;
var
 CodNF : integer;
begin
  if ItensPedido.IsEmpty then
   begin
    CodNF := NFId_NF.AsInteger;
    Pedido.Edit;
    PedidoPedidoFechado.AsBoolean := true;
    Pedido.post;
    NF.Locate('ID_NF',CodNF,[loCaseInsensitive]);
   end
    else
       begin
        CodNF := NFId_NF.AsInteger;
        Pedido.Edit;
        PedidoPedidoFechado.AsBoolean := false;
        Pedido.Post;
        NF.Locate('ID_NF',CodNF,[loCaseInsensitive]);
       end;
end;


procedure TFrmNf.BitBtn10Click(Sender: TObject);
begin
if  ItensNF.IsEmpty then else
begin
ItensNF.Edit;
ItensNFId_NF.AsInteger := 0;
ItensNF.Post;
ItensNF.Requery([]);
ItensPedido.Requery([]);
SomatoriaNF.Requery([]);
NF.Refresh;
FechaPedido;
end;
end;

procedure TFrmNf.BitBtn11Click(Sender: TObject);
begin
if ItensPedido.IsEmpty then
ShowMessage('Pedido com todos os seus itens já adicionados!')
else
begin
Panel2.Visible := true;
Edit7.text := '0';
Edit6.SetFocus;
end;
end;

procedure TFrmNf.BitBtn12Click(Sender: TObject);
begin
if (Edit6.Text <> '') and (Edit7.Text <> '') and
(MaskEdit1.EditText <> '__/__/__') then
begin
   Pedido.Edit;
   NF.Append;
   NFNumeroNF.AsInteger :=  StrToInt(Edit6.Text);
   NFDataEntrega.AsString :=  MaskEdit1.Text;
   NFDesconto.AsFloat := StrToFloat(Edit7.Text);
   NF.Post;
   Pedido.Post;
   NF.Last;
   Edit6.Clear;
   Edit7.Clear;
   MaskEdit1.Clear;
   Panel2.Visible := false;
   if messagedlg('Deseja adicionar Itens nesta Nota Fiscal agora?',mtConfirmation,[mbYes,mbNo],0) = mryes then
    begin
     Panel3.Visible := true;
     GroupBox3.Enabled := false;
     GroupBox1.Enabled := false;
    end;
  end
else
 begin
 showmessage('Esta faltando dados!');
 Edit6.SetFocus;
 end;
end;

procedure TFrmNf.BitBtn13Click(Sender: TObject);
begin
panel2.Visible := false;
end;

procedure TFrmNf.BitBtn14Click(Sender: TObject);
begin
Panel3.Visible := false;
 v.Enabled := true;
 GroupBox3.Enabled := true;
 GroupBox1.Enabled := true;
end;

procedure TFrmNf.BitBtn15Click(Sender: TObject);
var
 codnf : string;
begin
ItensPedido.Requery([]);
codnf := NFId_NF.AsString;

if ItensPedido.IsEmpty then else
  begin
    ItensPedido.Close;
    ItensPedido.SQL.Clear;
    ItensPedido.SQL.Add('Update itenscompra set Id_Nf = ' + codnf + ' where Id_Nf = 0 ');
    ItensPedido.SQL.Add('and cod_compra = :Cod_compra');
    ItensPedido.ExecSQL;

    ItensPedido.Close;
    ItensPedido.SQL.Clear;
    ItensPedido.SQL.Add('select * from ItensCompra where id_nf = 0 and cod_compra = :Cod_compra');
    ItensPedido.open;

    ItensNF.Requery([]);
    ItensPedido.Requery([]);
    SomatoriaNF.Requery([]);
    NF.Refresh;
    FechaPedido;
  end;
end;

procedure TFrmNf.BitBtn16Click(Sender: TObject);
  var
   codpedido : integer;
begin
if ItensPedido.IsEmpty then else
begin
codpedido := ItensPedidoCodDetalhecompra.AsInteger;
ItensPedido.Edit;
ItensPedidoId_NF.AsInteger := NFId_NF.AsInteger;
ItensPedido.Post;
ItensNF.Requery([]);
ItensPedido.Requery([]);
SomatoriaNF.Requery([]);
NF.Refresh;
FechaPedido;
ItensNF.Locate('CodDetalhecompra',codpedido,[loCaseInsensitive]);
end;
end;

procedure TFrmNf.BitBtn17Click(Sender: TObject);
begin
if  ItensNF.IsEmpty then else
begin
ItensNF.Edit;
ItensNFId_NF.AsInteger := 0;
ItensNF.Post;
ItensNF.Requery([]);
ItensPedido.Requery([]);
SomatoriaNF.Requery([]);
NF.Refresh;
FechaPedido;
end;
end;

procedure TFrmNf.BitBtn18Click(Sender: TObject);
begin
if BoletosCompraQuitado.AsBoolean = True then
 if MessageDlg('Deseja estornar este título pago?',mtConfirmation,[mbYes,mbCancel], 0) = mrYes then
  begin
  BoletosCompra.Edit;
  BoletosCompraDataPagamento.AsString := '';
  BoletosCompraDesconto.AsInteger := 0;
  BoletosCompraQuitado.AsBoolean := false;
  BoletosCompra.Post;
  BoletosCompra.Requery([]);
  end;
end;

procedure TFrmNf.BitBtn19Click(Sender: TObject);
begin
if BitBtn19.Caption = 'Adicionar' then
 begin
  if messagedlg('Deseja adicionar títulos?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
   begin
   ComboBox2.Enabled := true;
   DateTimePicker1.Enabled := true;
   Edit2.Enabled := true;
   Edit2.Clear;
   Label28.Caption := '0';
   Edit5.Enabled := true;
   BitBtn4.Enabled := false;
   BitBtn6.Enabled := false;
   BitBtn18.Enabled := false;
   BitBtn19.Caption := 'Cancelar';
   BitBtn20.Enabled := false;
   BitBtn21.Visible := true;
   TabSheet2.Enabled := false;
   BitBtn5.Enabled := false;
   ComboBox2.SetFocus;
   end;
 end
 else
 begin
   ComboBox2.ItemIndex := -1;
   ComboBox2.Enabled := false;
   DateTimePicker1.Enabled := false;
   SomatoriaTitulos.Requery([]);
   Edit2.Clear;
   Edit2.Enabled := false;
   Edit5.Text := '1';
   Edit5.Enabled := false;
   BitBtn4.Enabled := false;
   BitBtn6.Enabled := true;
   BitBtn18.Enabled := true;
   BitBtn19.Caption := 'Adicionar';
   BitBtn20.Enabled := true;
   BitBtn21.Visible := false;
   TabSheet2.Enabled := true;
   BitBtn5.Enabled := true;
 end;

end;

procedure TFrmNf.BitBtn1Click(Sender: TObject);
begin
if NF.IsEmpty then
 begin
  ShowMessage('Pedido sem Nota Fiscal.');
  exit;
 end;

if ItensNF.IsEmpty then
 begin
  ShowMessage('Está faltando adicionar item na Nota Fiscal.');
  exit;
 end;

   TabSheet3.TabVisible := true;
   TabSheet3.Show;
   if BoletosCompra.IsEmpty then
    begin
     ComboBox2.Enabled := true;
     DateTimePicker1.Enabled := true;
     Edit2.Enabled := true;
     Edit5.Enabled := true;
     BitBtn4.Enabled := true;
     BitBtn6.Enabled := false;
     BitBtn18.Enabled := false;
     BitBtn19.Visible := false;
     BitBtn20.Visible := false;
     BitBtn21.Visible := false;
    end
  else
    begin
     ComboBox2.Enabled := false;
     DateTimePicker1.Enabled := false;
     Edit2.Enabled := false;
     Edit5.Enabled := false;
     BitBtn4.Enabled := false;
     BitBtn6.Enabled := true;
     BitBtn18.Enabled := true;
     BitBtn19.Visible := true;
     BitBtn20.Visible := true;
     BitBtn21.Visible := false;
    end;
end;

procedure TFrmNf.BitBtn20Click(Sender: TObject);
var
 tot, i : integer;
begin

if BoletosCompra.Bof <> true then
  begin
   if messagedlg('Deseja excluir este título?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
   begin

 if BoletosCompraQuitado.AsBoolean = true then
  if messagedlg('Deseja Excluir este Título já Quitado?',mtConfirmation,[mbYes,mbNo],0)= mrno then
     exit;

    BoletosCompra.Delete;

   if BoletosCompra.IsEmpty = false then
    begin
    BoletosCompra.Requery([]);
    tot := BoletosCompra.RecordCount;
    i := 1;
     while BoletosCompra.Eof <> true do
       begin
         BoletosCompra.edit;
         BoletosCompraNumeroParcela.AsString :=   inttostr( i ) + '/' + inttostr(tot);
         BoletosCompra.post;
         BoletosCompra.Next;
         Inc(i,1);
       end;
    end;

     if BoletosCompra.Bof = true then
      begin
          ComboBox2.ItemIndex := -1;
          ComboBox2.Enabled := true;
          DateTimePicker1.Enabled := true;
          Edit2.Clear;
          Edit2.Enabled := true;
          Edit5.Text := '1';
          Edit5.Enabled := true;
          BitBtn4.Enabled := true;
          BitBtn6.Enabled := false;
          BitBtn18.Enabled := false;
          BitBtn19.Visible := false;
          BitBtn20.Visible := false;
          BitBtn21.Visible := false;
          ComboBox2.SetFocus;
     end;
   end;
   SomatoriaTitulos.Requery([]);
  end
 else
   showmessage('Nenhum título para excluir');
end;

procedure TFrmNf.BitBtn21Click(Sender: TObject);
var
 i, j, tot : integer;
 temp : string;
 data : TDateTime;
begin
  if (ComboBox2.Text <> '') and (datetostr(DateTimePicker1.date) <> '') and
  (Edit2.Text <> '') then
   begin
    temp := datetostr(DateTimePicker1.Date);
    data := strtodate(temp);
    tot := BoletosCompra.RecordCount;
    tot := tot + strtoint(Edit5.Text);
    j := 1;
    BoletosCompra.First;
     while BoletosCompra.Eof <> true do
       begin
         BoletosCompra.edit;
         BoletosCompraNumeroParcela.AsString :=   inttostr( j ) + '/' + inttostr(tot);
         BoletosCompra.post;
         BoletosCompra.Next;
         Inc(j,1);
       end;

      for I := 0 to strtoint(Edit5.Text) - 1 do
       begin
        BoletosCompra.Append;
        BoletosCompraNumeroNF.AsInteger := NFNumeroNF.AsInteger;
        BoletosCompraFormaPagamento.AsString := ComboBox2.Text;
        BoletosCompraNumeroParcela.AsString :=   inttostr( i + j ) + '/' + inttostr(tot);
        BoletosCompraValorParcela.AsCurrency := StrToCurr(Edit2.Text);
        BoletosCompraDataVencimento.AsDateTime := IncMonth(Data, i);
        BoletosCompraEmpresa.AsString := PedidoEmpresa.AsString;
        BoletosCompra.Post;
       end;
   ComboBox2.ItemIndex := -1;
   ComboBox2.Enabled := false;
   DateTimePicker1.Enabled := false;
   SomatoriaTitulos.Requery([]);
   Edit2.Clear;
   Edit2.Enabled := false;
   Edit5.Text := '1';
   Edit5.Enabled := false;
   BitBtn4.Enabled := false;
   BitBtn5.Enabled := true;
   BitBtn6.Enabled := true;
   BitBtn18.Enabled := true;
   BitBtn19.Enabled := true;
   BitBtn20.Enabled := true;
   BitBtn21.Visible := false;
   BitBtn19.Caption := 'Adicionar';
   TabSheet2.Enabled := true;
   SomatoriaTitulos.Requery([]);
  end
    else
   begin
    ShowMessage('Está faltando dados!');
    ComboBox2.SetFocus;
   end;
end;

procedure TFrmNf.BitBtn2Click(Sender: TObject);
begin
Pedido.Cancel;
close;
end;

procedure TFrmNf.BitBtn3Click(Sender: TObject);
begin
TabSheet3.TabVisible := false;
TabSheet2.TabVisible := false;
TabSheet1.TabVisible := true;
TabSheet1.Show;
end;

procedure TFrmNf.BitBtn4Click(Sender: TObject);
var
 i : integer;
 temp : string;
 data : TDateTime;
begin
if BoletosCompra.IsEmpty then
 begin
  if (ComboBox2.Text <> '') and (datetostr(DateTimePicker1.date) <> '') and
  (Edit2.Text <> '') then
   begin
    temp := datetostr(DateTimePicker1.Date);
    data := strtodate(temp);
      for I := 0 to strtoint(Edit5.Text) -1 do
       begin
        BoletosCompra.Append;
        BoletosCompraNumeroNF.AsInteger := NFNumeroNF.AsInteger;
        BoletosCompraFormaPagamento.AsString := ComboBox2.Text;
        BoletosCompraNumeroParcela.AsString :=   inttostr( i + 1 ) + '/' + Edit5.Text;
        BoletosCompraValorParcela.AsCurrency := StrToCurr(Edit2.Text);
        BoletosCompraDataVencimento.AsDateTime := IncMonth(Data, i);
        BoletosCompraEmpresa.AsString := PedidoEmpresa.AsString;
        BoletosCompra.Post;
       end;
   ComboBox2.ItemIndex := -1;
   ComboBox2.Enabled := false;
   DateTimePicker1.Enabled := false;
   SomatoriaTitulos.Requery([]);
   Edit2.Clear;
   Edit2.Enabled := false;
   Edit5.Text := '1';
   Edit5.Enabled := false;
   BitBtn4.Enabled := false;
   BitBtn6.Enabled := true;
   BitBtn18.Enabled := true;
   BitBtn19.Visible := true;
   BitBtn20.Visible := true;
   BitBtn21.Visible := false;
 end
  else
   begin
    ShowMessage('Está faltando dados!');
    ComboBox2.SetFocus;
   end;
 end
  else
    showmessage('Já existem títulos cadastrados nesta Nota Fistal');
end;

procedure TFrmNf.BitBtn5Click(Sender: TObject);
begin
TabSheet2.Show;
end;

procedure TFrmNf.BitBtn6Click(Sender: TObject);
var
 resp : integer;
begin
  if messagedlg('Deseja Cancelar Todos os Títulos desta Nota Fiscal?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
     if BoletosCompra.Locate('Quitado','true',[locaseinsensitive]) = true then
      begin
       resp := messagedlg('Deseja Excluir os Títulos já Quitados Também?',mtConfirmation,[mbYes,mbNo,mbCancel],0);

        if resp = 6 then // mbYes = 6
         begin

          BoletosCompra.Close;
          BoletosCompra.SQL.Clear;
          BoletosCompra.SQL.Add('delete * from BoletosCompra where Id_NF = :Id_NF');
          BoletosCompra.ExecSQL;
          BoletosCompra.SQL.Clear;
          BoletosCompra.SQL.Add('select * from BoletosCompra where Id_NF = :Id_NF');
          BoletosCompra.Open;


          ComboBox2.ItemIndex := -1;
          ComboBox2.Enabled := true;
          DateTimePicker1.Enabled := true;
          Edit2.Clear;
          Edit2.Enabled := true;
          Edit5.Text := '1';
          Edit5.Enabled := true;
          BitBtn4.Enabled := true;
          BitBtn6.Enabled := false;
          BitBtn18.Enabled := false;
          BitBtn19.Visible := false;
          BitBtn20.Visible := false;
          BitBtn21.Visible := false;
          ComboBox2.SetFocus;
         end;

  //-----------------------------------------------------------------------------

        if resp = 7 then  // mbNo = 7
         begin

          BoletosCompra.Close;
          BoletosCompra.SQL.Clear;
          BoletosCompra.SQL.Add('delete * from BoletosCompra where Id_NF = :Id_NF and quitado = false');
          BoletosCompra.ExecSQL;
          BoletosCompra.SQL.Clear;
          BoletosCompra.SQL.Add('select * from BoletosCompra where Id_NF = :Id_NF');
          BoletosCompra.Open;


          ComboBox2.ItemIndex := -1;
          ComboBox2.Enabled := true;
          DateTimePicker1.Enabled := true;
          Edit2.Clear;
          Edit2.Enabled := true;
          Edit5.Text := '1';
          Edit5.Enabled := true;
          BitBtn4.Enabled := true;
          BitBtn6.Enabled := false;
          BitBtn18.Enabled := false;
          BitBtn19.Visible := true;
          BitBtn20.Visible := true;
          BitBtn21.Visible := false;
          ComboBox2.SetFocus;
        end;

  //-----------------------------------------------------------------------------

        if resp = 2 then  // mbcancel = 2
         exit;

  //-----------------------------------------------------------------------------

      end {if BoletosCompra.Locate('quitado','Sim',[locaseinsensitive]) = false then}
       else
         begin


          BoletosCompra.Close;
          BoletosCompra.SQL.Clear;
          BoletosCompra.SQL.Add('delete * from BoletosCompra where Id_NF = :Id_NF');
          BoletosCompra.ExecSQL;
          BoletosCompra.SQL.Clear;
          BoletosCompra.SQL.Add('select * from BoletosCompra where Id_NF = :Id_NF');
          BoletosCompra.Open;


          ComboBox2.ItemIndex := -1;
          ComboBox2.Enabled := true;
          DateTimePicker1.Enabled := true;
          Edit2.Clear;
          Edit2.Enabled := true;
          Edit5.Text := '1';
          Edit5.Enabled := true;
          BitBtn4.Enabled := true;
          BitBtn6.Enabled := false;
          BitBtn18.Enabled := false;
          BitBtn19.Visible := false;
          BitBtn20.Visible := false;
          BitBtn21.Visible := false;
          ComboBox2.SetFocus;
         end;
end;

procedure TFrmNf.BitBtn7Click(Sender: TObject);
var
 resp : integer;
begin

if NF.IsEmpty then
 Exit;

if messagedlg('Deseja excluir está NF do sistema e todos os seu Títulos também?',mtConfirmation,[mbYes,mbCancel],0) = mrYes then
 if messagedlg('Tem certeza do que está fazendo? ',mtWarning,[mbYes,mbNo],0) = mrYes then
  begin

    if BoletosCompra.Locate('Quitado','true',[locaseinsensitive]) = true then
      begin
       resp := messagedlg('Deseja Excluir os Títulos já Quitados Também?',mtConfirmation,[mbYes,mbNo,mbCancel],0);
       case resp of
       6 : begin
            BoletosCompra.Close;
            BoletosCompra.SQL.Clear;
            BoletosCompra.SQL.Add('delete * from BoletosCompra where Id_NF = :Id_NF');
            BoletosCompra.ExecSQL;
           end;
       7 : begin
            BoletosCompra.Close;
            BoletosCompra.SQL.Clear;
            BoletosCompra.SQL.Add('delete * from BoletosCompra where Id_NF = :Id_NF and quitado = false');
            BoletosCompra.ExecSQL;
           end;
       2 : exit;
       end;
      end
      else
        begin
            BoletosCompra.Close;
            BoletosCompra.SQL.Clear;
            BoletosCompra.SQL.Add('delete * from BoletosCompra where Id_NF = :Id_NF');
            BoletosCompra.ExecSQL;
        end;

    ItensNF.Close;
    ItensNF.SQL.Clear;
    ItensNF.SQL.Add('Update itenscompra set Id_Nf = 0 where Id_NF = :Id_NF');
    ItensNF.ExecSQL;
    NF.Delete;
    ShowMessage('Exclusão efetuada com sucesso!');

    BoletosCompra.Close;
    BoletosCompra.SQL.Clear;
    BoletosCompra.SQL.Add('select * from boletoscompra  where Id_NF = :Id_NF');
    BoletosCompra.open;
    ItensNF.Close;
    ItensNF.SQL.Clear;
    ItensNF.SQL.Add('select * from ItensCompra where Id_NF = :Id_NF');
    ItensNF.open;

    TabSheet3.TabVisible := false;

    BoletosCompra.Requery([]);
    NF.Requery([]);
    ItensNF.Requery([]);
    ItensPedido.Requery([]);

    if NF.IsEmpty then
     begin
      Pedido.edit;
      PedidoPedidoFechado.AsBoolean := false;
      Pedido.Post;
     end;
  end;
end;

procedure TFrmNf.BitBtn8Click(Sender: TObject);
begin
close;
end;

procedure TFrmNf.BitBtn9Click(Sender: TObject);
begin
if ItensPedido.IsEmpty then
 begin
   ShowMessage('Todos os itens já foram adicionados.');
   Exit;
 end;
 
if NF.IsEmpty then
  showmessage('Pedido sem Nota Fiscal Cadastrada!')
 else
 begin
  Panel3.Visible := true;
  v.Enabled := false;
  Label31.Caption := IntToStr(NFNumeroNF.AsInteger);
  GroupBox3.Enabled := false;
  GroupBox1.Enabled := false;
 end;
end;

procedure TFrmNf.ComboBox1Change(Sender: TObject);
begin
Edit1.SetFocus;
end;

procedure TFrmNf.ComboBox2Click(Sender: TObject);
begin
  case ComboBox2.ItemIndex of
  0 : begin
        Edit5.Visible := true;
        UpDown1.Visible := true;
        Label18.Caption := 'Vencimento 1º Boleto';
        Label16.Caption := 'Qtd Boletos';
        Label10.Caption := 'Valor da Boleto';
      end;
  1 : begin
        Edit5.Visible := true;
        UpDown1.Visible := true;
        Label18.Caption := 'Vencimento 1º cheque';
        Label16.Caption := 'Qtd Cheques';
        Label10.Caption := 'Valor do Cheque';
      end;
  2 : begin
        Edit5.Visible := false;
        UpDown1.Visible := false;
        Label18.Caption := 'Data Vencimento';
        Label16.Caption := '';
        Label10.Caption := 'Valor Total';
      end;
  end;
end;

procedure TFrmNf.DateTimePicker1CloseUp(Sender: TObject);
begin
if edit5.Visible then
  edit5.SetFocus
 else
  Edit2.SetFocus;
end;

procedure TFrmNf.DateTimePicker2CloseUp(Sender: TObject);
begin
DBEdit6.Text := DateToStr(DateTimePicker1.Date);
DBEdit2.SetFocus;
end;

procedure TFrmNf.DBEdit3Enter(Sender: TObject);
begin
CorEntrada(sender);
end;

procedure TFrmNf.DBEdit3Exit(Sender: TObject);
begin
CorSaida(sender);
end;

procedure TFrmNf.DBGrid1DblClick(Sender: TObject);
begin
if not Pedido.IsEmpty then
  begin
   TabSheet2.TabVisible := true;
   TabSheet2.Show;
  end;
end;

procedure TFrmNf.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if PedidosParcial.Locate('cod_compra',Pedido.FieldByName('Cod_compra').AsInteger,[locaseinsensitive]) = true then
begin
Dbgrid1.Canvas.Font.Color := clred; // coloque aqui a cor desejada
DBGrid1.Canvas.Font.Style := [fsBold];
end;
Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
end;

procedure TFrmNf.DBGrid2DblClick(Sender: TObject);
Var
 codpedido : integer;
begin
codpedido := ItensPedidoCodDetalhecompra.AsInteger;
if ItensPedido.IsEmpty then else
begin
ItensPedido.Edit;
ItensPedidoId_NF.AsInteger := NFId_NF.AsInteger;
ItensPedido.Post;
ItensNF.Requery([]);
ItensPedido.Requery([]);
SomatoriaNF.Requery([]);
NF.Refresh;
FechaPedido;
ItensNF.Locate('CodDetalhecompra',codpedido,[loCaseInsensitive]);
end;
end;

procedure TFrmNf.DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if BoletosCompraQuitado.AsBoolean = true then // condição
begin
//DBGrid1.Canvas.Brush.Color:= clBlue;
Dbgrid3.Canvas.Font.Color := clGreen; // coloque aqui a cor desejada
//DBGrid3.Canvas.Font.Style := [fsBold];
Dbgrid3.DefaultDrawDataCell(Rect, dbgrid3.columns[datacol].field, State);
end;
end;

procedure TFrmNf.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case key of
13 : BoletosCompra.Post;
end;
end;

procedure TFrmNf.DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if NfsComBoletos.Locate('Id_NF',NF.FieldByName('Id_NF').AsInteger,[locaseinsensitive]) = false then
begin
Dbgrid5.Canvas.Font.Color := clred; // coloque aqui a cor desejada
DBGrid5.Canvas.Font.Style := [fsBold];
end;
Dbgrid5.DefaultDrawDataCell(Rect, dbgrid5.columns[datacol].field, State);
end;

procedure TFrmNf.DBGrid6DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if NfsComBoletos.Locate('Id_NF',NF.FieldByName('Id_NF').AsInteger,[locaseinsensitive]) = false then
begin
Dbgrid6.Canvas.Font.Color := clred; // coloque aqui a cor desejada
DBGrid6.Canvas.Font.Style := [fsBold];
end;
Dbgrid6.DefaultDrawDataCell(Rect, dbgrid6.columns[datacol].field, State);
end;

procedure TFrmNf.DsNFDataChange(Sender: TObject; Field: TField);
var
 b : Real;
begin
if DBEdit6.Text <> '' then
begin
 b := Calculapercentual(strtofloat(RemoveChar(DBEdit6.Text)),NFDesconto.AsInteger);
 Label25.Caption := 'R$ ' + formatfloat('###,###,##0.00', b);
 Label28.Caption := 'R$ ' + formatfloat('###,###,##0.00', b);
end
 else
  Label25.Caption := '';
end;

procedure TFrmNf.Edit1Change(Sender: TObject);
begin
Pedido.Close;
Pedido.SQL.Clear;
Pedido.SQL.Add('Select * from Cad_Compra where pedidofechado = ' + EstadoPedido + ' and ' + ComboBox1.Text + ' ');
Pedido.SQL.Add('like "' + Edit1.Text + '%" and dataentrega between (date() - 180) and (date() + 190)  ');
Pedido.SQL.Add('order by empresa');
Pedido.Open;
end;

function TFrmNf.RemoveChar(Const Texto:String):String; 
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

procedure TFrmNf.Edit2Enter(Sender: TObject);
var
 a : String;
 z : Real;
begin
a := RemoveChar(Label28.Caption);
z := StrToFloat(a);
z := z / StrToint(Edit5.Text);
z := Trunc(z * 100) / 100;
Edit2.Text := floattostr(z);
CorEntrada(sender);
end;

procedure TFrmNf.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8,','] ) then
  begin
  beep;{somente delphi 2.0 ou >}
  key:=#0;
  end;
end;

procedure TFrmNf.Edit5Change(Sender: TObject);
var
 a : String;
 z : Real;
begin
a := RemoveChar(Label28.Caption);
z := StrToFloat(a);
z := z / StrToint(Edit5.Text);
z := Trunc(z * 100) / 100;
Edit2.Text := floattostr(z);
end;

procedure TFrmNf.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then
  begin
  beep;{somente delphi 2.0 ou >}
  key:=#0;
  end;
end;

procedure TFrmNf.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8,','] ) then
  begin
  beep;{somente delphi 2.0 ou >}
  key:=#0;
  end;
end;

procedure TFrmNf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Pedido.Cancel;
  FrmNf.Release;
  FrmNf := nil;
end;

procedure TFrmNf.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
begin
      Key := #0;
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TFrmNf.FormShow(Sender: TObject);
begin
EstadoPedido := 'false';
end;

procedure TFrmNf.RadioGroup1Click(Sender: TObject);
begin
case RadioGroup1.ItemIndex of
0 : begin
     Pedido.Close;
     Pedido.SQL.Clear;
     Pedido.SQL.Add('Select * from Cad_Compra where pedidofechado = false and dataentrega between (date() - 180) and (date() + 190) ');
     Pedido.SQL.Add('order by empresa');
     Pedido.Open;
     Edit1.SetFocus;
     EstadoPedido := 'false';
    end;
1 : begin
     Pedido.Close;
     Pedido.SQL.Clear;
     Pedido.SQL.Add('Select * from Cad_Compra where pedidofechado = true and dataentrega between (date() - 180) and (date() + 190) ');
     Pedido.SQL.Add('order by empresa');
     Pedido.Open;
     Edit1.SetFocus;
     EstadoPedido := 'true';
    end;
end;
end;

procedure TFrmNf.TabSheet1Exit(Sender: TObject);
begin
TabSheet1.TabVisible := false;
end;

procedure TFrmNf.TabSheet1Show(Sender: TObject);
begin
    Pedido.Requery([]);
    PedidosParcial.Requery([]);
end;

procedure TFrmNf.TabSheet2Show(Sender: TObject);
begin
NfsComBoletos.Requery([]);
Panel1.Color := StringToColor(PedidoCorPedido.AsString);
end;

procedure TFrmNf.TabSheet3Show(Sender: TObject);
begin
  if ComboBox2.Enabled then
   ComboBox2.SetFocus;

DateTimePicker1.date := date;
end;

end.
