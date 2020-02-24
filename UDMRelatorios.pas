unit UDMRelatorios;

interface

uses
  SysUtils, Classes, DB, ADODB, FR_Class, FR_DSet, FR_DBSet, FR_Chart, Graphics;

type
  TDMRelatorios = class(TDataModule)
    Relatorios: TfrReport;
    QRGeral: TADOQuery;
    frDBGeral: TfrDBDataSet;
    FrPedidosAbertos: TfrReport;
    Itens: TfrUserDataset;
    BoletosNF: TfrUserDataset;
    NF: TfrUserDataset;
    QrNF: TADOQuery;
    QrItens: TADOQuery;
    QrBoletos: TADOQuery;
    DsQrNF: TDataSource;
    DsQrItens: TDataSource;
    DsQrBoletos: TDataSource;
    ItensNF: TfrUserDataset;
    UDPedido: TfrUserDataset;
    QRCreditos: TADOQuery;
    QRtitulos: TADOQuery;
    QRDespDiversas: TADOQuery;
    QRCreditosTotDinheiro: TBCDField;
    QRCreditosTotCheque: TBCDField;
    QRCreditosTotVisa: TBCDField;
    QRCreditosTotCred: TBCDField;
    QrItensCodDetalhecompra: TAutoIncField;
    QrItensCod_Compra: TIntegerField;
    QrItensId_NF: TIntegerField;
    QrItensReferencia: TWideStringField;
    QrItensDescricao: TWideStringField;
    QrItensTotalItens: TIntegerField;
    QrItensPrecoUnitario: TBCDField;
    QrItensTotal: TBCDField;
    QrBoletosCodInteno: TAutoIncField;
    QrBoletosId_NF: TIntegerField;
    QrBoletosEmpresa: TWideStringField;
    QrBoletosNumeroNF: TIntegerField;
    QrBoletosNumeroParcela: TWideStringField;
    QrBoletosDataVencimento: TDateTimeField;
    QrBoletosDataPagamento: TDateTimeField;
    QrBoletosValorParcela: TBCDField;
    QrBoletosDesconto: TIntegerField;
    QrBoletosQuitado: TBooleanField;
    QrBoletosFormaPagamento: TWideStringField;
    QrNFId_NF: TAutoIncField;
    QrNFCad_NfCod_Compra: TIntegerField;
    QrNFNumeroNF: TIntegerField;
    QrNFDataEntrega: TDateTimeField;
    QrNFDesconto: TIntegerField;
    QrNFEmpresa: TWideStringField;
    QrNFPedido: TIntegerField;
    QrNFcad_compraCod_Compra: TAutoIncField;
    QrPedido: TADOQuery;
    UDNfPedidos: TfrUserDataset;
    QrNfPedidos: TADOQuery;
    QrPedidoCod_Compra: TAutoIncField;
    QrPedidoEmpresa: TWideStringField;
    QrPedidoPedido: TIntegerField;
    QrPedidoDataPedido: TDateTimeField;
    QrPedidoDataEntrega: TDateTimeField;
    QrPedidoPzoPagamento: TWideStringField;
    QrPedidoPedidoFechado: TBooleanField;
    QrPedidoObs: TWideMemoField;
    QrPedidoCorPedido: TWideStringField;
    DsQrPedido: TDataSource;
    DsQrNfPedidos: TDataSource;
    QrNfPedidosId_NF: TAutoIncField;
    QrNfPedidosCod_Compra: TIntegerField;
    QrNfPedidosNumeroNF: TIntegerField;
    QrNfPedidosDataEntrega: TDateTimeField;
    QrNfPedidosDesconto: TIntegerField;
    ItensPedido: TADOQuery;
    DsItensPedido: TDataSource;
    ItensPedidoCodDetalhecompra: TAutoIncField;
    ItensPedidoCod_Compra: TIntegerField;
    ItensPedidoId_NF: TIntegerField;
    ItensPedidoReferencia: TWideStringField;
    ItensPedidoDescricao: TWideStringField;
    ItensPedidoTotalItens: TIntegerField;
    ItensPedidoPrecoUnitario: TBCDField;
    ItensPedidoTotal: TBCDField;
    QRDespDiversasValorTotal: TBCDField;
    QRtitulosTotalPago: TBCDField;
    balancete: TfrReport;
    CreditoDebito: TfrReport;
    QRTitulosAPagar: TADOQuery;
    QRTitulosAPagarTotalAPagar: TBCDField;
    QRDespDiversAPagar: TADOQuery;
    QRDespDiversAPagarValorTotal: TBCDField;
    QrItensPedido: TADOQuery;
    DsQrItensPedido: TDataSource;
    QrItensPedidoTotalItensPedido: TFloatField;
    frUserDataset1: TfrUserDataset;
    procedure RelatoriosGetValue(const ParName: string; var ParValue: Variant);
    procedure pedidoFirst(Sender: TObject);
    procedure pedidoNext(Sender: TObject);
    procedure pedidoCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure ItensFirst(Sender: TObject);
    procedure ItensNext(Sender: TObject);
    procedure ItensCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FrPedidosAbertosGetValue(const ParName: string;
      var ParValue: Variant);
    procedure BoletosNFCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure BoletosNFFirst(Sender: TObject);
    procedure BoletosNFNext(Sender: TObject);
    procedure ItensNFCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure ItensNFFirst(Sender: TObject);
    procedure ItensNFNext(Sender: TObject);
    procedure NFCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure NFFirst(Sender: TObject);
    procedure NFNext(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure UDPedidoCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure UDPedidoFirst(Sender: TObject);
    procedure UDPedidoNext(Sender: TObject);
    procedure UDNfPedidosCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure UDNfPedidosFirst(Sender: TObject);
    procedure UDNfPedidosNext(Sender: TObject);
    procedure balanceteGetValue(const ParName: string; var ParValue: Variant);
    procedure balanceteProgress(n: Integer);
    procedure CreditoDebitoGetValue(const ParName: string;
      var ParValue: Variant);
  private

  public

  end;

var
  DMRelatorios: TDMRelatorios;
  totalgeral, TotalCredito, TotalDebito, TotalDebitoFuturo : real;
  TotalItem : integer;

implementation

uses UDM, UPrincipal, UFiltroRelatorio2, ComCtrls;

{$R *.dfm}

procedure TDMRelatorios.balanceteGetValue(const ParName: string;
  var ParValue: Variant);
begin
    if AnsiUpperCase(ParName) = 'TOTALDEBITO' then
    ParValue := totaldebito;
    if AnsiUpperCase(ParName) = 'TOTALCREDITO' then
    ParValue := totalcredito;
    if AnsiUpperCase(ParName) = 'USER' then
    ParValue := usuario;
    if AnsiUpperCase(ParName) = 'TOTALDEBITOFUTURO' then
    ParValue := TotalDebitoFuturo;
    with FrmFiltroRelatorio2 do
     begin
      if ComboBox1.Enabled  then
       begin
        if AnsiUpperCase(ParName) = 'MES' then
        ParValue := ComboBox1.Text + ' de ' + Edit1.Text;
       end
        else
         if DateTimePicker1.Enabled  then
          begin
           if AnsiUpperCase(ParName) = 'MES' then
           ParValue := datetostr(DateTimePicker1.Date);
          end
           else
            begin
             if AnsiUpperCase(ParName) = 'MES' then
             ParValue := date;
            end;
     end;
end;

procedure TDMRelatorios.balanceteProgress(n: Integer);
begin
TotalCredito := QRCreditosTotDinheiro.Value + QRCreditosTotCheque.Value +
QRCreditosTotVisa.Value + QRCreditosTotCred.Value;

TotalDebito := QRDespDiversasValorTotal.Value + QRtitulosTotalPago.Value;

TotalDebitoFuturo := QRDespDiversAPagarValorTotal.Value  + QRTitulosAPagarTotalAPagar.Value;
end;

procedure TDMRelatorios.BoletosNFCheckEOF(Sender: TObject; var Eof: Boolean);
begin
Eof := Eof or QRBoletos.Eof;
end;

procedure TDMRelatorios.BoletosNFFirst(Sender: TObject);
begin
QRBoletos.First;
end;

procedure TDMRelatorios.BoletosNFNext(Sender: TObject);
begin
QRBoletos.Next;
end;

procedure TDMRelatorios.DataModuleCreate(Sender: TObject);
var
i: integer;
begin
  for i:= 0 to ComponentCount -1 do
    if(Components[i] is TAdoTable) then
     TAdoTable(Components[i]).open
    else
    if(Components[i] is TAdoQuery) then
     TAdoQuery(Components[i]).Open
end;

procedure TDMRelatorios.FrPedidosAbertosGetValue(const ParName: string;
  var ParValue: Variant);
begin
    if AnsiUpperCase(ParName) = 'TOTALGERAL' then
    ParValue := totalgeral;
    if AnsiUpperCase(ParName) = 'TOTALITEM' then
    ParValue := totalItem;
    if AnsiUpperCase(ParName) = 'USER' then
    ParValue := usuario;
    if AnsiUpperCase(ParName) = 'PERIODO' then
    ParValue := 'Período: De ' + data1 + ' a ' + data2;
end;

procedure TDMRelatorios.ItensNFCheckEOF(Sender: TObject; var Eof: Boolean);
begin
Eof := Eof or QrItens.Eof;
end;

procedure TDMRelatorios.ItensNFFirst(Sender: TObject);
begin
QrItens.First;
end;

procedure TDMRelatorios.ItensNFNext(Sender: TObject);
begin
TotalItem := TotalItem + QrItensTotalItens.AsInteger;
totalgeral := totalgeral + QrItensTotal.AsFloat;
QrItens.Next;
end;

procedure TDMRelatorios.ItensCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
Eof := Eof or ItensPedido.Eof;
end;

procedure TDMRelatorios.ItensFirst(Sender: TObject);
begin
ItensPedido.First;
end;

procedure TDMRelatorios.ItensNext(Sender: TObject);
begin
TotalItem := TotalItem + ItensPedidoTotalItens.AsInteger;
totalgeral := totalgeral + ItensPedidoTotal.AsFloat;
ItensPedido.Next;
end;

procedure TDMRelatorios.NFCheckEOF(Sender: TObject; var Eof: Boolean);
begin
Eof := Eof or QRNf.Eof;
end;

procedure TDMRelatorios.NFFirst(Sender: TObject);
begin
TotalItem := 0;
totalgeral := 0;
QRNf.First;
end;

procedure TDMRelatorios.NFNext(Sender: TObject);
begin
QRNf.Next;
end;

procedure TDMRelatorios.pedidoCheckEOF(Sender: TObject; var Eof: Boolean);
begin
Eof := Eof or DM.QrPedido.Eof;
end;

procedure TDMRelatorios.pedidoFirst(Sender: TObject);
begin
totalgeral := 0;
DM.QrPedido.First;
end;

procedure TDMRelatorios.pedidoNext(Sender: TObject);
begin
DM.QrPedido.Next;
end;

procedure TDMRelatorios.RelatoriosGetValue(const ParName: string;
  var ParValue: Variant);
begin
    if AnsiUpperCase(ParName) = 'PERIODO' then
    ParValue := 'Período: De ' + data1 + ' a ' + data2;
    if AnsiUpperCase(ParName) = 'USER' then
    ParValue := usuario;
end;

procedure TDMRelatorios.UDNfPedidosCheckEOF(Sender: TObject; var Eof: Boolean);
begin
Eof := Eof or QrNFPedidos.Eof;
end;

procedure TDMRelatorios.UDNfPedidosFirst(Sender: TObject);
begin
QrNFPedidos.First;
end;

procedure TDMRelatorios.UDNfPedidosNext(Sender: TObject);
begin
QrNFPedidos.Next;
end;

procedure TDMRelatorios.UDPedidoCheckEOF(Sender: TObject; var Eof: Boolean);
begin
Eof := Eof or QrPedido.Eof;
end;

procedure TDMRelatorios.UDPedidoFirst(Sender: TObject);
begin
TotalItem := 0;
Totalgeral := 0;
QrPedido.First;
end;

procedure TDMRelatorios.UDPedidoNext(Sender: TObject);
begin
QrPedido.Next;
end;

procedure TDMRelatorios.CreditoDebitoGetValue(const ParName: string;
  var ParValue: Variant);
begin
    if AnsiUpperCase(ParName) = 'USER' then
    ParValue := usuario;
    if AnsiUpperCase(ParName) = 'DESPDIVPAGA' then
    ParValue := QRDespDiversasValorTotal.Value;
    if AnsiUpperCase(ParName) = 'DESPDIVDEV' then
    ParValue := QRDespDiversAPagarValorTotal.Value;

    with FrmFiltroRelatorio2 do
     begin
      if ComboBox1.Enabled  then
       begin
        if AnsiUpperCase(ParName) = 'MES' then
        ParValue := ComboBox1.Text + ' de ' + Edit1.Text;
       end
        else
         if DateTimePicker1.Enabled  then
          begin
           if AnsiUpperCase(ParName) = 'MES' then
           ParValue := datetostr(DateTimePicker1.Date);
          end
           else
            begin
             if AnsiUpperCase(ParName) = 'MES' then
             ParValue := date;
            end;
     end;
end;

end.
