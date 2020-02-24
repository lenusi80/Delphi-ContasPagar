unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, ToolWin, ActnMan, ActnCtrls, ActnMenus, ExtCtrls,
  ActnList, XPStyleActnCtrls, ImgList, registry, Menus, XPMan, WinSkinData,
  StdCtrls, LabelFlash;

type
  TFrmPrincipal = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    ActionManager1: TActionManager;
    Fornecedores: TAction;
    Pedido: TAction;
    NF: TAction;
    Cons_Fornec_Full: TAction;
    Cons_Ped_Abertos: TAction;
    Cons_NF_cad: TAction;
    cons_Bol_Pagos: TAction;
    cons_Bol_Vencer: TAction;
    cons_Bol_Atras: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    Calculadora: TAction;
    Calendario: TAction;
    Vendedores: TAction;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    ImageList1: TImageList;
    CorFundo: TAction;
    AlteraSenha: TAction;
    GerarBackup: TAction;
    RestBackup: TAction;
    Image1: TImage;
    BancoDeDados: TAction;
    popBKP: TPopupMenu;
    GerarBackup1: TMenuItem;
    RestBackup1: TMenuItem;
    Pagamentos: TAction;
    SpeedButton3: TSpeedButton;
    Sobre: TAction;
    Movimentacao: TAction;
    Creditos: TAction;
    GastosDiversos: TAction;
    RelGastosDiversos: TAction;
    RelValoresCreditos: TAction;
    RelVendedor: TAction;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    TrackBar1: TTrackBar;
    BigRelogio: TAction;
    ImageList2: TImageList;
    PedidoNf: TAction;
    ToolButton2: TToolButton;
    XPManifest1: TXPManifest;
    Estornar: TAction;
    LabelFlash1: TLabelFlash;
    Cons_Fornec_Resume: TAction;
    Cons_GastDivResumo: TAction;
    procedure SpeedButton12Click(Sender: TObject);
    procedure CalculadoraExecute(Sender: TObject);
    procedure CalendarioExecute(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FornecedoresExecute(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure CorFundoExecute(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure AlteraSenhaExecute(Sender: TObject);
    procedure PedidoExecute(Sender: TObject);
    procedure RestBackupExecute(Sender: TObject);
    procedure GerarBackupExecute(Sender: TObject);
    procedure BancoDeDadosExecute(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure NFExecute(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure PagamentosExecute(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure cons_Bol_PagosExecute(Sender: TObject);
    procedure cons_Bol_VencerExecute(Sender: TObject);
    procedure Cons_Fornec_FullExecute(Sender: TObject);
    procedure SobreExecute(Sender: TObject);
    procedure MovimentacaoExecute(Sender: TObject);
    procedure CreditosExecute(Sender: TObject);
    procedure GastosDiversosExecute(Sender: TObject);
    procedure cons_Bol_AtrasExecute(Sender: TObject);
    procedure Cons_Ped_AbertosExecute(Sender: TObject);
    procedure RelGastosDiversosExecute(Sender: TObject);
    procedure RelValoresCreditosExecute(Sender: TObject);
    procedure Cons_NF_cadExecute(Sender: TObject);
    procedure VendedoresExecute(Sender: TObject);
    procedure RelVendedorExecute(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BigRelogioExecute(Sender: TObject);
    procedure PedidoNfExecute(Sender: TObject);
    procedure EstornarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LabelFlash1Click(Sender: TObject);
    procedure Cons_Fornec_ResumeExecute(Sender: TObject);
    procedure Cons_GastDivResumoExecute(Sender: TObject);
  private
    var
    Registro : Tregistry;
  public
    Function DiretorioSystem32 : String;
  end;

var
  FrmPrincipal: TFrmPrincipal;
  usuario, data1, data2, CaptionForm, fornecedor, nfs, Oplogico1, Oplogico2 : string;

implementation

uses UFrmCalendario, UCadFornec, URotinas, UCorFundo, UAltSenhas, UCadPedidos,
  Ubackup, UConfigBD, UNf, Upagamentos, UDMRelatorios, ABOUT, UFiltroRelatorio,
  UCreditos, UGastosDiversos, UFiltroRelatorio2, UVendedores, ULogin, UEstornos,
  UFornecResumo, UDespDivResumo;

var
  NumLock,Capslock,hora : string;

{$R *.dfm}

function ReplaceStr (Text,oldstring,newstring:string):string;
var atual, strtofind, originalstr:pchar;
NewText:string;
lenoldstring,lennewstring,m,index:integer;
begin //ReplaceStr
  NewText:=Text;
  originalstr:=pchar(Text);
  strtofind:=pchar(oldstring);
  lenoldstring:=length(oldstring);
  lennewstring:=length(newstring);
  Atual:=StrPos(OriginalStr,StrtoFind);
  index:=0;
  while Atual<>nil do
  begin //Atual<>nil
  m:=Atual - OriginalStr - index + 1;
  Delete(NewText,m,lenoldstring);
  Insert(newstring,NewText,m);
  inc(index,lenoldstring-lennewstring);
  Atual:=StrPos(Atual+lenoldstring,StrtoFind);
  end; //Atual<>nil
  Result:=NewText;
end; //ReplaceStr

function TFrmPrincipal.DiretorioSystem32: string;
var
MeuBuffer: Array [1..128] of Char;
retorno: Integer;
Begin
retorno:=GetSystemDirectory(@MeuBuffer,128);
if (retorno>128) OR (retorno=0) then
DiretorioSystem32:=''
else
DiretorioSystem32:=StrPas(@MeuBuffer);
End;

procedure TFrmPrincipal.EstornarExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmEstornos, FrmEstornos);
  FrmEstornos.ShowModal;
end;

{prc}

{Function TFrmPrincipal.DiretorioWindows : String;
Var
Buffer : Array[0..144] of Char; 
Begin 
GetWindowsDirectory(Buffer,144);
Result := IncludeTrailingBackSlash(StrPas(Buffer));
End; }

procedure AbrirFiltroRelatorios;
begin
data1 := ''; data2:= ''; fornecedor:= ''; nfs := '';
FrmFiltroRelatorio.ShowModal;
end;

procedure AbrirFiltroRelatorios2;
begin
data1 := '';
FrmFiltroRelatorio2.ShowModal;
end;

procedure TFrmPrincipal.MovimentacaoExecute(Sender: TObject);
begin
repeat
 CaptionForm := 'Balancete';
 AbrirFiltroRelatorios2;

if FrmFiltroRelatorio2.ModalResult = MrOk then
begin

DMRelatorios.QRCreditos.Close;
DMRelatorios.QRCreditos.SQL.Clear;
DMRelatorios.QRCreditos.SQL.Add('select sum(dinheiro) as TotDinheiro,  sum(chequepre) as TotCheque, ');
DMRelatorios.QRCreditos.SQL.Add('sum(CartaoVisa) as TotVisa, sum(CartaoCred) as TotCred  from Cad_Creditos');
DMRelatorios.QRCreditos.SQL.Add(' ' + data1 + '');
IF DATA2 <> '' THEN
  DMRelatorios.QRCreditos.Parameters[0].Value := data2;
DMRelatorios.QRCreditos.Open;

DMRelatorios.QRDespDiversas.Close;
DMRelatorios.QRDespDiversas.SQL.Clear;
DMRelatorios.QRDespDiversas.SQL.Add('select sum(Valor) as ValorTotal from Cad_DespDiversas ');
DMRelatorios.QRDespDiversas.SQL.Add('' + data1 + ' and situacao = true');
IF DATA2 <> '' THEN
  DMRelatorios.QRDespDiversas.Parameters[0].Value := data2;
DMRelatorios.QRDespDiversas.Open;

//Despesas a Pagar

DMRelatorios.QRDespDiversAPagar.Close;
DMRelatorios.QRDespDiversAPagar.SQL.Clear;
DMRelatorios.QRDespDiversAPagar.SQL.Add('select sum(Valor) as ValorTotal from Cad_DespDiversas ');
DMRelatorios.QRDespDiversAPagar.SQL.Add('' + data1 + ' and situacao = false');
IF DATA2 <> '' THEN
  DMRelatorios.QRDespDiversAPagar.Parameters[0].Value := data2;
DMRelatorios.QRDespDiversAPagar.Open;

//--------------------------------------------------------------

data1 := ReplaceStr(data1,'data','datapagamento'); // Troca o campo 'data' por 'datapagamento'

DMRelatorios.QRtitulos.Close;
DMRelatorios.QRtitulos.SQL.Clear;
DMRelatorios.QRtitulos.SQL.Add('select sum(valorparcela) as TotalPago from BoletosCompra ');
DMRelatorios.QRtitulos.SQL.Add('' + data1 + ' and quitado = true');
IF DATA2 <> '' THEN
  DMRelatorios.QRtitulos.Parameters[0].Value := data2;
DMRelatorios.QRtitulos.Open;

//Despesas a Pagar

data1 := ReplaceStr(data1,'datapagamento','datavencimento'); // Troca o campo 'datapagamento' por 'datavencimento'

DMRelatorios.QRTitulosAPagar.Close;
DMRelatorios.QRTitulosAPagar.SQL.Clear;
DMRelatorios.QRTitulosAPagar.SQL.Add('select sum(valorparcela) as TotalAPagar from BoletosCompra ');
DMRelatorios.QRTitulosAPagar.SQL.Add('' + data1 + ' and quitado = false');
IF DATA2 <> '' THEN
  DMRelatorios.QRTitulosAPagar.Parameters[0].Value := data2;
DMRelatorios.QRTitulosAPagar.Open;

//--------------------------------------------------------------

DMRelatorios.Balancete.LoadFromFile('' + DiretorioInstal + 'frfBalancete.frf');
DMRelatorios.Balancete.ShowReport;
end;
until (FrmFiltroRelatorio2.ModalResult = MrCancel);
end;

procedure TFrmPrincipal.GastosDiversosExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmGastosDiversos, FrmGastosDiversos);
  FrmGastosDiversos.ShowModal;
end;

procedure TFrmPrincipal.AlteraSenhaExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmAltSenhas, FrmAltSenhas);
  FrmAltSenhas.ShowModal;
end;

procedure TFrmPrincipal.CalculadoraExecute(Sender: TObject);
var
 a : string;
begin
a := DiretorioSystem32 + '\calc.exe' ;
WinExec(pchar(a), WS_MAXIMIZE);
end;

procedure TFrmPrincipal.CalendarioExecute(Sender: TObject);
begin
Application.CreateForm(TFrmCalendario, FrmCalendario);
FrmCalendario.Show;
end;

procedure TFrmPrincipal.BancoDeDadosExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmConfigBD, FrmConfigBD);
  FrmConfigBD.ShowModal;
end;

procedure TFrmPrincipal.BigRelogioExecute(Sender: TObject);
begin
Registro := Tregistry.Create;
with registro do
 begin
   RootKey := HKEY_CURRENT_USER;
   OpenKey('\SOFTWARE\ContasPagar\', true);
 if Label1.Visible = true then
  begin
   WriteBool('BigRelogio', false );
   Label1.Visible := false;
   TrackBar1.Visible := false;
  end
    else
     begin
       WriteBool('BigRelogio', true );
       Label1.Visible := true;
       TrackBar1.Visible := true;
     end;
   CloseKey;
   free;
 end;
end;

procedure TFrmPrincipal.cons_Bol_AtrasExecute(Sender: TObject);
begin
DMRelatorios.QRGeral.Close;
DMRelatorios.QRGeral.SQL.Clear;
DMRelatorios.QRGeral.SQL.Add('select * from boletoscompra where quitado = false and  ');
DMRelatorios.QRGeral.SQL.Add('datavencimento < :dataHOJE order by datavencimento');
DMRelatorios.QRGeral.Parameters[0].Value := datetostr(date);
DMRelatorios.QRGeral.Open;

DMRelatorios.Relatorios.LoadFromFile('' + DiretorioInstal + 'frfBoletosAtrasados.frf');
DMRelatorios.Relatorios.ShowReport;
end;

procedure TFrmPrincipal.cons_Bol_PagosExecute(Sender: TObject);
begin

repeat
 CaptionForm := 'Consulta de Boletos Pagos';
 AbrirFiltroRelatorios;

if FrmFiltroRelatorio.ModalResult = MrOk then
begin
DMRelatorios.QRGeral.Close;
DMRelatorios.QRGeral.SQL.Clear;
DMRelatorios.QRGeral.SQL.Add('select * from boletoscompra where (quitado = true and  ');
DMRelatorios.QRGeral.SQL.Add('datapagamento BetWeen :datainicial and :datafinal) ' + OpLogico1 + ' ');
DMRelatorios.QRGeral.SQL.Add('(numeronf like "' + NFs + '" ' + OpLogico2 + ' empresa like "' + fornecedor + '") ');
DMRelatorios.QRGeral.SQL.Add('order by datapagamento');
DMRelatorios.QRGeral.Parameters[0].Value := data1;
DMRelatorios.QRGeral.Parameters[1].Value := data2;
DMRelatorios.QRGeral.Open;

DMRelatorios.Relatorios.LoadFromFile('' + DiretorioInstal + 'frfBoletosPagos.frf');
DMRelatorios.Relatorios.ShowReport;
end;
until (FrmFiltroRelatorio.ModalResult = MrCancel);

end;

procedure TFrmPrincipal.cons_Bol_VencerExecute(Sender: TObject);
begin

repeat
 CaptionForm := 'Consulta de Boletos A Vencer';
 AbrirFiltroRelatorios;

if FrmFiltroRelatorio.ModalResult = MrOk then
begin
DMRelatorios.QRGeral.Close;
DMRelatorios.QRGeral.SQL.Clear;
DMRelatorios.QRGeral.SQL.Add('select * from boletoscompra where (quitado = false and  ');
DMRelatorios.QRGeral.SQL.Add('datavencimento BetWeen :datainicial and :datafinal) ' + OpLogico1 + ' ');
DMRelatorios.QRGeral.SQL.Add('(numeronf like "' + NFs + '" ' + OpLogico2 + ' empresa like "' + fornecedor + '") ');
DMRelatorios.QRGeral.SQL.Add('order by datavencimento');
DMRelatorios.QRGeral.Parameters[0].Value := data1;
DMRelatorios.QRGeral.Parameters[1].Value := data2;
DMRelatorios.QRGeral.Open;

DMRelatorios.Relatorios.LoadFromFile('' + DiretorioInstal + 'frfBoletosVencer.frf');
DMRelatorios.Relatorios.ShowReport;
end;
until (FrmFiltroRelatorio.ModalResult = MrCancel);

end;

procedure TFrmPrincipal.Cons_Fornec_FullExecute(Sender: TObject);
begin

DMRelatorios.QRGeral.Close;
DMRelatorios.QRGeral.SQL.Clear;
DMRelatorios.QRGeral.SQL.Add('select * from cad_Fornec order by empresa');
DMRelatorios.QRGeral.Open;

DMRelatorios.Relatorios.LoadFromFile('' + DiretorioInstal + 'frfFornecedores.frf');
DMRelatorios.Relatorios.ShowReport;
end;

procedure TFrmPrincipal.Cons_Fornec_ResumeExecute(Sender: TObject);
begin

Application.CreateForm(TfrmResumoFornecedores, frmResumoFornecedores);
frmResumoFornecedores.ShowModal;

end;

procedure TFrmPrincipal.Cons_GastDivResumoExecute(Sender: TObject);
begin
Application.CreateForm(TFrmDespDivResumo, FrmDespDivResumo);
FrmDespDivResumo.ShowModal;
end;

//Consulta de NF ---------------------------------------------------------------

procedure TFrmPrincipal.Cons_NF_cadExecute(Sender: TObject);
begin
repeat
 CaptionForm := 'Consulta de Notas Fiscais' ;
 AbrirFiltroRelatorios;

if FrmFiltroRelatorio.ModalResult = MrOk then
begin
DMRelatorios.QRNF.Close;
DMRelatorios.QRNF.SQL.Clear;
DMRelatorios.QRNF.SQL.Add('select Cad_NF.Id_NF, Cad_NF.Cod_Compra, Cad_NF.NumeroNF, ');
DMRelatorios.QRNF.SQL.Add('Cad_NF.DataEntrega, Cad_NF.Desconto, Cad_Compra.Empresa, Cad_Compra.Pedido, ');
DMRelatorios.QRNF.SQL.Add('Cad_compra.Cod_Compra from cad_compra INNER JOIN  Cad_Nf on Cad_NF.Cod_Compra = ');
DMRelatorios.QRNF.SQL.Add('Cad_compra.Cod_Compra where (Cad_NF.DataEntrega BetWeen :datainicial ');
DMRelatorios.QRNF.SQL.Add('and :datafinal) ' + OpLogico1 +' (Cad_NF.NumeroNF like "' + NFs + '" ' + OpLogico2 + '  ');
DMRelatorios.QRNF.SQL.Add('Cad_Compra.Empresa like "' + fornecedor + '")   order by Cad_Compra.Empresa');
DMRelatorios.QRNF.Parameters[0].Value := data1;
DMRelatorios.QRNF.Parameters[1].Value := data2;
DMRelatorios.QRNF.Open;

DMRelatorios.FrPedidosAbertos.LoadFromFile('' + DiretorioInstal + 'frfNfs.frf');
DMRelatorios.FrPedidosAbertos.ShowReport;
end;
until (FrmFiltroRelatorio.ModalResult = MrCancel);
end;

//------------------------------------------------------------------------------

procedure TFrmPrincipal.Cons_Ped_AbertosExecute(Sender: TObject);
begin
repeat
 CaptionForm := 'Consulta de Pedidos' ;
 AbrirFiltroRelatorios;

if FrmFiltroRelatorio.ModalResult = MrOk then
begin
DMRelatorios.QRPedido.Close;
DMRelatorios.QRPedido.SQL.Clear;
DMRelatorios.QrPedido.SQL.Add('select * from Cad_Compra where ');
DMRelatorios.QrPedido.SQL.Add('(DataPedido BetWeen :datainicial and :datafinal) ' + OpLogico1 +'  ');
DMRelatorios.QrPedido.SQL.Add('(Pedido like "' + NFs + '" ' + OpLogico2 + ' Empresa like "' + fornecedor + '")  ');
DMRelatorios.QrPedido.SQL.Add('order by DataEntrega');
DMRelatorios.QrPedido.Parameters[0].Value := data1;
DMRelatorios.QrPedido.Parameters[1].Value := data2;
DMRelatorios.QrPedido.Open;

DMRelatorios.FrPedidosAbertos.LoadFromFile('' + DiretorioInstal + 'frfPedidosAbertos.frf');
DMRelatorios.FrPedidosAbertos.ShowReport;
end;
until (FrmFiltroRelatorio.ModalResult = MrCancel);
end;

procedure TFrmPrincipal.CorFundoExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCorFundo, FrmCorFundo);
  FrmCorFundo.ShowModal;
end;

procedure TFrmPrincipal.CreditosExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCreditos, FrmCreditos);
  FrmCreditos.ShowModal;
end;

procedure TFrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
 resp : integer;
begin
 resp :=  MessageDlg( 'Deseja Fazer Backup antes de sair?',
  mtConfirmation, [mbYes, mbNo, mbAbort],1);
  if resp = 6 then // mbYes = 6
    begin
     GerarBackupExecute(GerarBackup);
     Canclose:=true;
    end;

  if resp = 7 then  // mbNo = 7
    begin
      Canclose:=true;
    end;

  if resp = 3 then  // mbAbort = 3
    begin
      Canclose:=false;
    end;

end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
Brush.Style := bsSolid;
Timer1Timer(Self);
Registro := Tregistry.Create;
with registro do
 begin
  RootKey := HKEY_CURRENT_USER;
  OpenKey('\SOFTWARE\ContasPagar\', true);

    if  ReadString('CorFundo') = '' then
         FrmPrincipal.Color := clNavy
       else
         FrmPrincipal.Color := StringToColor(ReadString('CorFundo'));
    if  ReadString('ImgFundo') <> '' then
         FrmPrincipal.Image1.Picture.LoadFromFile(ReadString('ImgFundo'))
       else
         FrmPrincipal.Image1.Picture := nil;

 if ValueExists('BigRelogio') then
 begin
 if ReadBool('BigRelogio') = false then
  begin
   FrmPrincipal.Label1.Visible := false;
   FrmPrincipal.TrackBar1.Visible := false;
  end
    else
     begin
       FrmPrincipal.Label1.Visible := true;
       FrmPrincipal.TrackBar1.Visible := true;
     end;
   if ValueExists('BigRelogioFontSize') then
    begin
     Label1.Font.Size := ReadInteger('BigRelogioFontSize');
     TrackBar1.Position := Label1.Font.Size;
    end;
 end;

  CloseKey;
  free;
  end;
// altera cor
Application.HintColor := clAqua;
// tempo antes de apresentar
Application.HintPause := 1000;
// Tempo de apresentação
Application.HintHidePause := 5000;
end;

procedure TFrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Timer1Timer(Self);
end;

procedure TFrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
Timer1Timer(Self);
end;

procedure TFrmPrincipal.FormResize(Sender: TObject);
begin
AlinharLabel(FrmPrincipal,Label1,true);
Alinhartrackbar(FrmPrincipal,TrackBar1,true);
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
DMRelatorios.QRGeral.Close;
DMRelatorios.QRGeral.SQL.Clear;
DMRelatorios.QRGeral.SQL.Add('select * from boletoscompra where quitado = false and  ');
DMRelatorios.QRGeral.SQL.Add('datavencimento < :dataHOJE order by datavencimento');
DMRelatorios.QRGeral.Parameters[0].Value := datetostr(date);
DMRelatorios.QRGeral.Open;

if not DMRelatorios.QRGeral.IsEmpty then
  LabelFlash1.Visible := true;
end;

procedure TFrmPrincipal.FornecedoresExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadForncec, FrmCadForncec);
  FrmCadForncec.ShowModal;
end;

procedure TFrmPrincipal.GerarBackupExecute(Sender: TObject);
begin
FrmBackup.ShowModal;
end;

procedure TFrmPrincipal.LabelFlash1Click(Sender: TObject);
begin
  DMRelatorios.Relatorios.LoadFromFile('' + DiretorioInstal + 'frfBoletosAtrasados.frf');
  DMRelatorios.Relatorios.ShowReport;
  LabelFlash1.Visible := false;
end;

procedure TFrmPrincipal.NFExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmNf, FrmNf);
  FrmNf.ShowModal;
end;

procedure TFrmPrincipal.PagamentosExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmPagamentos, FrmPagamentos);
  FrmPagamentos.ShowModal;
end;

procedure TFrmPrincipal.PedidoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmCadPedidos, frmCadPedidos);
  frmCadPedidos.ShowModal;
end;

procedure TFrmPrincipal.PedidoNfExecute(Sender: TObject);
begin
repeat
 CaptionForm := 'Consulta de Pedidos com Notas Fiscais' ;
 AbrirFiltroRelatorios;

if FrmFiltroRelatorio.ModalResult = MrOk then
begin
DMRelatorios.QrPedido.Close;
DMRelatorios.QrPedido.SQL.Clear;
DMRelatorios.QrPedido.SQL.Add('select * from Cad_Compra where ');
DMRelatorios.QrPedido.SQL.Add('(DataPedido BetWeen :datainicial and :datafinal) ' + OpLogico1 +'  ');
DMRelatorios.QrPedido.SQL.Add('(Pedido like "' + NFs + '" ' + OpLogico2 + ' Empresa like "' + fornecedor + '")  ');
DMRelatorios.QrPedido.SQL.Add('order by Empresa');
DMRelatorios.QrPedido.Parameters[0].Value := data1;
DMRelatorios.QrPedido.Parameters[1].Value := data2;
DMRelatorios.QrPedido.Open;

DMRelatorios.FrPedidosAbertos.LoadFromFile('' + DiretorioInstal + 'frfPedidosNfs.frf');
DMRelatorios.FrPedidosAbertos.ShowReport;
end;
until (FrmFiltroRelatorio.ModalResult = MrCancel);
end;

// Consulta Gastos Diversos ----------------------------------------------------

procedure TFrmPrincipal.RelGastosDiversosExecute(Sender: TObject);
begin
repeat
 CaptionForm := 'Consulta de Gastos Diversos';
 AbrirFiltroRelatorios2;

if FrmFiltroRelatorio2.ModalResult = MrOk then
begin
DMRelatorios.QRGeral.Close;
DMRelatorios.QRGeral.SQL.Clear;
DMRelatorios.QRGeral.SQL.Add('select * from cad_DespDiversas ' + data1 + ' order by data');
IF DATA2 <> '' THEN
  DMRelatorios.QRGeral.Parameters[0].Value := data2;
DMRelatorios.QRGeral.Open;

DMRelatorios.QRDespDiversas.Close;
DMRelatorios.QRDespDiversas.SQL.Clear;
DMRelatorios.QRDespDiversas.SQL.Add('select sum(Valor) as ValorTotal from Cad_DespDiversas ');
DMRelatorios.QRDespDiversas.SQL.Add('' + data1 + ' and situacao = true');
IF DATA2 <> '' THEN
  DMRelatorios.QRDespDiversas.Parameters[0].Value := data2;
DMRelatorios.QRDespDiversas.Open;

//Despesas a Pagar

DMRelatorios.QRDespDiversAPagar.Close;
DMRelatorios.QRDespDiversAPagar.SQL.Clear;
DMRelatorios.QRDespDiversAPagar.SQL.Add('select sum(Valor) as ValorTotal from Cad_DespDiversas ');
DMRelatorios.QRDespDiversAPagar.SQL.Add('' + data1 + ' and situacao = false');
IF DATA2 <> '' THEN
  DMRelatorios.QRDespDiversAPagar.Parameters[0].Value := data2;
DMRelatorios.QRDespDiversAPagar.Open;

DMRelatorios.CreditoDebito.LoadFromFile('' + DiretorioInstal + 'frfGastosDiversos.frf');
DMRelatorios.CreditoDebito.ShowReport;
end;
until (FrmFiltroRelatorio2.ModalResult = MrCancel);
end;

// Consulta Valores a Crédito --------------------------------------------------

procedure TFrmPrincipal.RelValoresCreditosExecute(Sender: TObject);
begin
repeat
 CaptionForm := 'Consulta de Valores a Crédito';
 AbrirFiltroRelatorios2;

if FrmFiltroRelatorio2.ModalResult = MrOk then
begin
DMRelatorios.QRGeral.Close;
DMRelatorios.QRGeral.SQL.Clear;
DMRelatorios.QRGeral.SQL.Add('select * from cad_Creditos ' + data1 + ' order by data');
IF DATA2 <> '' THEN
  DMRelatorios.QRGeral.Parameters[0].Value := data2;
DMRelatorios.QRGeral.Open;

DMRelatorios.CreditoDebito.LoadFromFile('' + DiretorioInstal + 'frfValoresCredito.frf');
DMRelatorios.CreditoDebito.ShowReport;
end;
until (FrmFiltroRelatorio2.ModalResult = MrCancel);
end;

procedure TFrmPrincipal.RelVendedorExecute(Sender: TObject);
begin

DMRelatorios.QRGeral.Close;
DMRelatorios.QRGeral.SQL.Clear;
DMRelatorios.QRGeral.SQL.Add('select * from cad_Vendedor order by Nome');
DMRelatorios.QRGeral.Open;
DMRelatorios.Relatorios.LoadFromFile('' + DiretorioInstal + 'frfVendedores.frf');
DMRelatorios.Relatorios.ShowReport;
end;

//------------------------------------------------------------------------------

procedure TFrmPrincipal.RestBackupExecute(Sender: TObject);
var
 a : string;
begin
a := ExtractFilePath(Application.ExeName) + '\Backup.exe';
WinExec(PChar(a), SHOW_OPENWINDOW);
Application.Terminate;
end;

procedure TFrmPrincipal.SobreExecute(Sender: TObject);
begin
  Application.CreateForm(TAboutBox, AboutBox);
  AboutBox.ShowModal;
end;

procedure TFrmPrincipal.SpeedButton10Click(Sender: TObject);
begin
popBKP.Popup(610,115);
end;

procedure TFrmPrincipal.SpeedButton11Click(Sender: TObject);
var
  FullProgPath : PChar;
begin
   FullProgPath := PChar(Application.ExeName);
   Application.Terminate;
   WinExec(FullProgPath, SHOW_OPENWINDOW);
end;

procedure TFrmPrincipal.SpeedButton12Click(Sender: TObject);
begin
close;
end;

procedure TFrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
FornecedoresExecute(Fornecedores);
end;

procedure TFrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
PedidoExecute(pedido);
end;

procedure TFrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
PagamentosExecute(Pagamentos);
end;

procedure TFrmPrincipal.SpeedButton4Click(Sender: TObject);
begin
VendedoresExecute(Vendedores);
end;

procedure TFrmPrincipal.SpeedButton6Click(Sender: TObject);
begin
CalendarioExecute(Calendario);
end;

procedure TFrmPrincipal.SpeedButton8Click(Sender: TObject);
begin
CalculadoraExecute(Calculadora);
end;

procedure TFrmPrincipal.SpeedButton9Click(Sender: TObject);
begin
NFExecute(nf);
end;

procedure TFrmPrincipal.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
with StatusBar1.Canvas do
begin
// Desenha as imagens de acordo com o indice de cada panel
ImageList1.Draw(StatusBar1.Canvas,Rect.Left+2,Rect.Top+1,Panel.Index);
  // Escreve o texto em cada panel
  if Panel.Index = 0 then
  TextOut(Rect.Left + 25, Rect.Top + 1,(' Empresa:  "  ' + usuario + '  "'));
  if Panel.Index = 1 then
  TextOut(Rect.Left + 20, Rect.Top + 1,numlock + capslock);
  if Panel.Index = 2 then
  TextOut(Rect.Left + 25, Rect.Top + 1,hora);
end;
end;

procedure TFrmPrincipal.Timer1Timer(Sender: TObject);
begin
// Mostra Data por extenso e Hora
hora := DataExtenso(date) + '   |   ' +  timetostr(time) + '      ';

// Indica o estado das teclas CapsLock e NumLock
if GetKeyState(VK_NUMLOCK) = 1 then
numlock := '     NumLock  '
else
numlock := '                 ';
if GetKeyState(VK_CAPITAL) = 1 then
capslock := '|  CapsLock'
else
capslock := '|                 ';

// Atualiza o Status Bar
StatusBar1.Refresh;
Label1.Caption:= FormatDateTime('HH:mm:ss', Time);
end;

procedure TFrmPrincipal.TrackBar1Change(Sender: TObject);
begin
Label1.Font.Size:= TrackBar1.Position;
Registro := Tregistry.Create;
with registro do
 begin
   RootKey := HKEY_CURRENT_USER;
   OpenKey('\SOFTWARE\ContasPagar\', true);
   WriteInteger('BigRelogioFontSize', TrackBar1.Position );
   CloseKey;
   free;
 end;
end;

procedure TFrmPrincipal.VendedoresExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmVendedores, FrmVendedores);
  FrmVendedores.ShowModal;
end;

end.
