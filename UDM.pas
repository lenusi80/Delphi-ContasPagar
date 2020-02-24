unit UDM;

interface

uses
  SysUtils, Classes, DB, bde, ADODB, Dialogs, ExtCtrls, Windows,
  Messages, Variants, registry, forms, Controls, DBTables, DBClient, Provider,
  Graphics;

type
  TDM = class(TDataModule)
    QrPedido: TADOQuery;
    DS_Fornecedores: TDataSource;
    DsQrUsers: TDataSource;
    QrUsers: TADOQuery;
    QrUserssenha: TWideStringField;
    DSQrPedido: TDataSource;
    DlgLocalizaBD: TOpenDialog;
    QrPedidoEmpresa: TWideStringField;
    QrPedidoCod_Compra: TAutoIncField;
    QrPedidoDataPedido: TDateTimeField;
    QrPedidoDataEntrega: TDateTimeField;
    QrPedidoPzoPagamento: TWideStringField;
    QrPedidoObs: TWideMemoField;
    QrPedidoCorPedido: TWideStringField;
    QRItensCompra: TADOQuery;
    DSQRItensCompra: TDataSource;
    QRItensCompraCodDetalhecompra: TAutoIncField;
    QRItensCompraCod_Compra: TIntegerField;
    QRItensCompraReferencia: TWideStringField;
    QRItensCompraDescricao: TWideStringField;
    QRItensCompraPrecoUnitario: TBCDField;
    QRItensCompraTotal: TBCDField;
    QrPedidoPedido: TIntegerField;
    QRItensCompraTotalItens: TIntegerField;
    QRCreditos: TADOQuery;
    QRDespDiversas: TADOQuery;
    DsQRCreditos: TDataSource;
    DsQRDespDiversas: TDataSource;
    QRCreditosData: TDateTimeField;
    QRCreditosDinheiro: TBCDField;
    QRCreditosChequePre: TBCDField;
    QRCreditosCartaoVisa: TBCDField;
    QRCreditosCartaoCred: TBCDField;
    QRCreditosCodCredito: TAutoIncField;
    DS_Vendedores: TDataSource;
    TB_Vendedores: TADOTable;
    TB_VendedoresCodVendedor: TAutoIncField;
    TB_VendedoresNome: TWideStringField;
    TB_VendedoresTel: TWideStringField;
    TB_VendedoresTel2: TWideStringField;
    TB_VendedoresTel3: TWideStringField;
    TB_VendedoresEmail: TWideStringField;
    LigaBD: TADOConnection;
    QRItensCompraId_NF: TIntegerField;
    QRFornecedores: TADOQuery;
    QRFornecedoresCod_Empresa: TAutoIncField;
    QRFornecedoresEmpresa: TWideStringField;
    QRFornecedoresCNPJ: TWideStringField;
    QRFornecedoresInscEstadual: TWideStringField;
    QRFornecedoresVendedor: TWideStringField;
    QRFornecedoresTelefone: TWideStringField;
    QRFornecedoresFax: TWideStringField;
    QRFornecedoresRua: TWideStringField;
    QRFornecedoresBairro: TWideStringField;
    QRFornecedoresCidade: TWideStringField;
    QRFornecedoresEstado: TWideStringField;
    QRFornecedoresEmail: TWideStringField;
    QRFornecedoresSite: TWideStringField;
    QRFornecedoresObs: TWideMemoField;
    QRFornecedoresDesativado: TBooleanField;
    QrPedidoPedidoFechado: TBooleanField;
    QRDespDiversasCodDebito: TAutoIncField;
    QRDespDiversasData: TDateTimeField;
    QRDespDiversasEmpresa: TWideStringField;
    QRDespDiversasTipoPagamento: TWideStringField;
    QRDespDiversasNumero: TWideStringField;
    QRDespDiversasValor: TBCDField;
    QRDespDiversassituacao: TBooleanField;
    procedure DataModuleCreate(Sender: TObject);
    procedure QRDespDiversasBeforeEdit(DataSet: TDataSet);
    procedure QRDespDiversasAfterPost(DataSet: TDataSet);
    procedure QRDespDiversasBeforeInsert(DataSet: TDataSet);
    procedure QRDespDiversasAfterCancel(DataSet: TDataSet);
  private
    { Private declarations }
  public

  end;

var
  DM: TDM;

implementation

uses UCadPedidos, ULogin, UCreditos, UGastosDiversos;

{$R *.dfm}

procedure Abrirtabelas;
var
i: integer;
begin
with dm do
 begin
  for i:= 0 to ComponentCount -1 do
    if(Components[i] is TAdoTable) then
     TAdoTable(Components[i]).open
    else
    if(Components[i] is TAdoQuery) then
     TAdoQuery(Components[i]).Open
 end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
 CaminhoBD : string;
begin
   fechar := false;
   CaminhoBD := DiretorioInstal + NomeBD;
   LigaBD.Connected := false;
   LigaBD.ConnectionString := '';
   LigaBD.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + caminhoBD +
   ';Persist Security Info=False;Jet OLEDB:Database Password=lelesisi';
   Try
     LigaBD.Connected := true;
   except
    begin
     showmessage('Banco de Dados Inválido! Este problema pode ser resolvido escolhendo o "BD" correto na tela de login');
     exit;
    end;
   end;

if LigaBD.Connected  then
 begin
   Try
    Abrirtabelas;
   except
    begin
     showmessage('Banco de Dados Inválido! Este problema pode ser resolvido escolhendo o "BD" correto na tela de login');
     exit;
    end;
   End;

// valida usuário --------------------------------------------------------------
  QrUsers.Close;
  QrUsers.SQL.Clear;
  QrUsers.SQL.Add('select * from CadSenha');
  QrUsers.SQL.Add(' where senha = "' + senha + '"');
  QrUsers.Open;
  if QrUsers.IsEmpty then
    begin
     Application.MessageBox('Senha Incorreta !'#13+'','',MB_ICONERROR+MB_OK);
    end
    else
      begin
       Ok := true;
       fechar := true;
      end;
 end; // if LigaBD.Connected  then
 
end;  // geral

procedure TDM.QRDespDiversasAfterCancel(DataSet: TDataSet);
begin
with FrmGastosDiversos do
 begin
  GroupBox8.Enabled := true;
  BitBtn1.Enabled := true;
  BitBtn3.Enabled := true;
  BitBtn2.Caption := 'Salvar';
  BitBtn2.Enabled := false;
 end;
end;

procedure TDM.QRDespDiversasAfterPost(DataSet: TDataSet);
begin
with FrmGastosDiversos do
 begin
  GroupBox8.Enabled := true;
  BitBtn1.Enabled := true;
  BitBtn3.Enabled := true;
  BitBtn2.Caption := 'Salvar';
  BitBtn2.Enabled := false;
 end;
end;

procedure TDM.QRDespDiversasBeforeEdit(DataSet: TDataSet);
begin
with FrmGastosDiversos do
 begin
  GroupBox8.Enabled := false;
  BitBtn1.Enabled := false;
  BitBtn3.Enabled := false;
  BitBtn2.Enabled := true;
  BitBtn2.Caption := 'Alterar';  
 end;
end;

procedure TDM.QRDespDiversasBeforeInsert(DataSet: TDataSet);
begin
with FrmGastosDiversos do
 begin
  GroupBox8.Enabled := false;
  BitBtn1.Enabled := false;
  BitBtn3.Enabled := false;
  BitBtn2.Enabled := true;
  BitBtn2.Caption := 'Salvar';
 end;
end;

end.
