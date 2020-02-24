unit UCadPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, Buttons, DB, BDE, DBCtrls, Mask,
  ADODB, ExtCtrls;

type
  TfrmCadPedidos = class(TForm)
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn8: TBitBtn;
    ColorDialog1: TColorDialog;
    Shape3: TShape;
    DsSomatorias: TDataSource;
    Somatorias: TADOQuery;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    DBMemo1: TDBMemo;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    v: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    T: TLabel;
    Label12: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    BitBtn5: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Panel1: TPanel;
    TabSheet4: TTabSheet;
    DBGrid1: TDBGrid;
    GroupBox8: TGroupBox;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    SomatoriasTotalGeral: TBCDField;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    DsPedido: TDataSource;
    Pedido: TADOQuery;
    Label11: TLabel;
    Label15: TLabel;
    PedidoCod_Compra: TAutoIncField;
    PedidoEmpresa: TWideStringField;
    PedidoPedido: TIntegerField;
    PedidoDataPedido: TDateTimeField;
    PedidoDataEntrega: TDateTimeField;
    PedidoPzoPagamento: TWideStringField;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    SomatoriasTotalitens: TFloatField;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DBGrid2: TDBGrid;
    RadioGroup1: TRadioGroup;
    PedidoPedidoFechado: TBooleanField;
    PedidosParcial: TADOQuery;
    PedidosParcialCod_Compra: TAutoIncField;
    DsPedidosParcial: TDataSource;
    TotItensSemNf: TADOQuery;
    DSTotItensSemNf: TDataSource;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    TotItensSemNfTotalitens: TFloatField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Panel1DblClick(Sender: TObject);
    procedure DBGrid2Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdit5Enter(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DateTimePicker2CloseUp(Sender: TObject);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure RadioGroup1Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure TabSheet3Hide(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    var
       Estadopedido : string; // var para filtro "pedido aberto" e " pedido fechado"
       Procedure FechaPedido;
  public
    { Public declarations }
  end;

var
  frmCadPedidos: TfrmCadPedidos;

implementation

uses UDM, URotinas;

{$R *.dfm}


Procedure TfrmCadPedidos.FechaPedido;
begin
  if TotItensSemNfTotalItens.asinteger = 0 then
   begin
    Pedido.Edit;
    PedidoPedidoFechado.AsBoolean := true;
    Pedido.post;
   end
    else
       begin
        Pedido.Edit;
        PedidoPedidoFechado.AsBoolean := false;
        Pedido.Post;
       end;
end;


procedure TfrmCadPedidos.BitBtn10Click(Sender: TObject);
begin
if DM.QRItensCompra.IsEmpty = false then
  begin
   if messagedlg('Deseja Excluir Todos os Itens deste Pedido?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
   begin
    DM.QRItensCompra.Close;
    DM.QRItensCompra.SQL.Clear;
    DM.QRItensCompra.SQL.Add('delete * from itenscompra where cod_compra = :cod_compra');
    DM.QRItensCompra.ExecSQL;
    DM.QRItensCompra.SQL.Clear;
    DM.QRItensCompra.SQL.Add('select * from itenscompra where cod_compra = :cod_compra');
    DM.QRItensCompra.Open;
    Somatorias.Requery([]);
    TotItensSemNf.Requery([]);
    FechaPedido;
   end;
  end;
end;

procedure TfrmCadPedidos.BitBtn1Click(Sender: TObject);
begin
TabSheet3.TabVisible := true;
TabSheet3.SHOW;
//Panel1.Color := StringToColor('clbtnface');
 if DM.QrPedido.State in [dsinsert] then
   ShowMessage('Este já é um Cadastro Novo')
 else
 begin
  BitBtn3.Enabled := false;
  DM.QrPedido.Insert;
  DM.QrPedidoDataPedido.AsDateTime := date;
  DM.QrPedidoPedido.AsInteger := 0;
  Panel1DblClick(sender);
   Edit2.Clear;
   Edit3.Clear;
   Edit4.Clear;
   Edit5.Clear;
 end;
end;

procedure TfrmCadPedidos.BitBtn2Click(Sender: TObject);
begin
if DM.QrPedido.State in [dsinsert,dsedit] then
  If (DBEdit3.text <> '') and (DBLookupComboBox1.text <> '') and (DBEdit5.text <> '') then
   begin
    DM.QrPedido.Post;
    ShowMessage('Gravação Efetuada Com Sucesso');
    BitBtn3.Enabled := true;
    Edit2.Clear;
    Edit3.Clear;
    Edit4.Clear;
    Edit5.Clear;
   end
   else
    begin
     MessageDLG('Gravação Não Efetuada, Falta Dados',mtError,[mbok],0);
     DBEdit3.SetFocus;
    end;
end;

procedure TfrmCadPedidos.BitBtn3Click(Sender: TObject);
begin
if TabSheet3.Visible then
if DM.QrPedidoPedidoFechado.AsBoolean then
   showmessage('                  Existem Notas Fiscais vinculadas a este pedido!' + #13 +
   '      Para poder excluí-lo, é preciso primeiro apagar estas Notas.')
   else
if (DM.QrPedido.Bof <> true) and (DM.QrPedido.Eof <> true) then
  begin
     TabSheet3.Show;
  if messagedlg('Deseja Excluir este Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
   begin
    DM.QRItensCompra.Close;
    DM.QRItensCompra.SQL.Clear;
    DM.QRItensCompra.SQL.Add('delete * from itenscompra where cod_compra = :cod_compra');
    DM.QRItensCompra.ExecSQL;
    DM.QRItensCompra.SQL.Clear;
    DM.QRItensCompra.SQL.Add('select * from itenscompra where cod_compra = :cod_compra');
    DM.QRItensCompra.Open;
    DM.QrPedido.Delete;
    Edit2.Clear;
    Edit3.Clear;
    Edit4.Clear;
    Edit5.Clear;
   end;
   end
      else
        showmessage('Nenhum Registro Para Excluir!');
TabSheet4.Show;
end;

procedure TfrmCadPedidos.BitBtn4Click(Sender: TObject);
begin
  close;
end;


procedure TfrmCadPedidos.BitBtn5Click(Sender: TObject);
begin
  if dm.QrPedido.State in [dsinsert] then
  begin
   dm.QrPedido.Post;
   dm.QrPedido.Edit;
  end; 
if (Edit2.Text <> '') and (Edit3.Text <> '') and
(Edit4.Text <> '') and (Edit5.Text <> '') then
begin
   DM.QRItensCompra.Append;
   DM.QRItensCompraReferencia.AsString :=  Edit2.Text;
   DM.QRItensCompraDescricao.AsString :=  Edit3.Text;
   DM.QRItensCompraTotalitens.AsInteger := StrToInt(Edit4.Text);
   DM.QRItensCompraPrecoUnitario.AsCurrency := StrToCurr(Edit5.Text);
   DM.QRItensCompraTotal.AsCurrency := StrToCurr(Edit4.Text) * StrToCurr(Edit5.Text);
   DM.QRItensCompraId_NF.AsInteger := 0;
   DM.QRItensCompra.Post;
   Somatorias.Requery([]);
   TotItensSemNf.Requery([]);
   FechaPedido;
   if BitBtn5.Caption = 'Alterar' then
    begin
     BitBtn5.Caption := 'Adicionar';
     Edit3.Text := '';
    end;
   Edit2.Clear;
   Edit4.Clear;
   Edit5.Clear;
   Edit2.SetFocus;
  end
else
 begin
 showmessage('Esta faltando dados!');
 Edit2.SetFocus;
 end;
end;

procedure TfrmCadPedidos.BitBtn8Click(Sender: TObject);
begin
if DM.QrPedido.State in [dsedit,dsinsert] then
 begin
  DM.QrPedido.Cancel;
  BitBtn3.Enabled := true;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Panel1.Color := StringToColor(DM.QrPedidoCorPedido.AsString);
 end
  else
   TabSheet4.Show;
end;

procedure TfrmCadPedidos.BitBtn9Click(Sender: TObject);
begin
if DM.QRItensCompra.IsEmpty = false then
 begin
 if DM.QRItensCompraId_NF.AsInteger = 0 then
   begin
    DM.QRItensCompra.Delete;
    Somatorias.Requery([]);
    TotItensSemNf.Requery([]);
    FechaPedido;
   end
    else
     ShowMessage('Este item não pode ser excluído. Primeiro exclua-o da nota fiscal.');
 end;
end;

procedure TfrmCadPedidos.ComboBox1Click(Sender: TObject);
begin
Edit1.SetFocus;
end;

procedure TfrmCadPedidos.DateTimePicker1CloseUp(Sender: TObject);
begin
if DM.QrPedido.State in [dsedit] then
 begin
  DM.QrPedidoDataEntrega.AsString := DateToStr(dateTimePicker1.Date);
  DBEdit6.SetFocus;
 end
  else
   begin
    DM.QrPedido.edit;
    DM.QrPedidoDataEntrega.AsString := DateToStr(dateTimePicker1.Date);
    DBEdit6.SetFocus;
   end;
end;

procedure TfrmCadPedidos.DateTimePicker2CloseUp(Sender: TObject);
begin
if DM.QrPedido.State in [dsedit] then
 begin
  DM.QrPedidoDataPedido.AsString := DateToStr(dateTimePicker2.Date);
  DBEdit5.SetFocus;
 end
   else
    begin
     DM.QrPedido.Edit;
     DM.QrPedidoDataPedido.AsString := DateToStr(dateTimePicker2.Date);
     DBEdit5.SetFocus;
    end;
end;

procedure TfrmCadPedidos.DBEdit5Enter(Sender: TObject);
begin
CorEntrada(sender);
end;

procedure TfrmCadPedidos.DBEdit5Exit(Sender: TObject);
begin
CorSaida(sender);
end;

procedure TfrmCadPedidos.DBGrid1DblClick(Sender: TObject);
begin
if not DM.QrPedido.IsEmpty then
begin
DM.QrPedido.Locate('cod_compra',pedido.FieldByName('Cod_compra').AsInteger,[locaseinsensitive]);
TabSheet3.TabVisible := true;
TabSheet3.Show;
end;
end;

procedure TfrmCadPedidos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//if PedidoPedidoParcial.Value = true then // condição
//DBGrid1.Canvas.Brush.Color:= clBlue;
if PedidosParcial.Locate('cod_compra',Pedido.FieldByName('Cod_compra').AsInteger,[locaseinsensitive]) = true then
begin
Dbgrid1.Canvas.Font.Color := clred; // coloque aqui a cor desejada
DBGrid1.Canvas.Font.Style := [fsBold];
end;
Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
end;

procedure TfrmCadPedidos.DBGrid2DblClick(Sender: TObject);
begin
if not DM.QRItensCompra.IsEmpty then
 if MessageDlg('Deseja realmente alterar este item',mtConfirmation, [mbYes,mbCancel], 0) = mrYes then
  begin
   Edit2.Text := DM.QRItensCompraReferencia.AsString;
   Edit3.Text := DM.QRItensCompraDescricao.AsString;
   Edit4.Text := inttostr(DM.QRItensCompraTotalItens.AsInteger);
   Edit5.Text := CurrToStr(DM.QRItensCompraPrecoUnitario.AsCurrency);
   DM.QRItensCompra.Delete;
   BitBtn5.Caption := 'Alterar';
   Somatorias.Requery([]);
   Edit2.SetFocus;
  end;
end;

procedure TfrmCadPedidos.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  var
   vnull : integer;
begin
 vnull := DM.QRItensCompraId_NF.AsInteger;
if vnull <> 0 then
begin
Dbgrid2.Canvas.Font.Color := clred; // coloque aqui a cor desejada
DBGrid2.Canvas.Font.Style := [fsBold];
end;
Dbgrid2.DefaultDrawDataCell(Rect, dbgrid2.columns[datacol].field, State);
end;

procedure TfrmCadPedidos.DBGrid2Exit(Sender: TObject);
begin
frmCadPedidos.KeyPreview := true;
end;

procedure TfrmCadPedidos.Edit1Change(Sender: TObject);
begin
Pedido.Close;
Pedido.SQL.Clear;
Pedido.SQL.Add('Select * from Cad_Compra where ' + Estadopedido +' and ' + ComboBox1.Text + ' ');
Pedido.SQL.Add(' like "' + Edit1.Text + '%" and  dataentrega between (date() - 180) and (date() + 190)  order by empresa');
Pedido.Open;
end;

procedure TfrmCadPedidos.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then
  begin
  beep;{somente delphi 2.0 ou >}
  key:=#0;
  end;
end;

procedure TfrmCadPedidos.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8,','] ) then
  begin
  beep;{somente delphi 2.0 ou >}
  key:=#0;
  end;
end;

procedure TfrmCadPedidos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if DM.QrPedido.State in [dsedit,dsinsert] then
begin
 showmessage('Por Favor, salve este cadastro antes de Sair!');
 canclose := false;
end
 else
 if (Edit2.Text <> '') and (Edit4.Text <> '') and (Edit5.Text <> '')  then
  begin
   showmessage('Por Favor, complete a alteração do item antes de sair!');
   Edit2.SetFocus;
   canclose := false;
  end
else
 begin
  frmCadPedidos.Release;
  frmCadPedidos := nil;
 end;
end;

procedure TfrmCadPedidos.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
begin
      Key := #0;
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TfrmCadPedidos.FormShow(Sender: TObject);
begin
DateTimePicker1.date := date;
DateTimePicker2.date := date;
DM.QrPedido.Requery([]);
end;

procedure TfrmCadPedidos.Panel1DblClick(Sender: TObject);
begin
ColorDialog1.Execute;
 Panel1.Color := ColorDialog1.Color;
  if DM.QrPedido.State in [dsedit, dsinsert] then
       DM.QrPedidoCorPedido.AsString := ColorToString(ColorDialog1.Color)
  else
   begin
   DM.QrPedido.Edit;
   DM.QrPedidoCorPedido.AsString := ColorToString(ColorDialog1.Color);
   end;
DBEdit5.SetFocus;
end;

procedure TfrmCadPedidos.RadioGroup1Click(Sender: TObject);
begin
case RadioGroup1.ItemIndex of
0 : Estadopedido := 'pedidofechado = false';
1 : EstadoPedido := 'pedidofechado = true';
end;
Pedido.Close;
Pedido.SQL.Clear;
Pedido.SQL.Add('Select * from Cad_Compra where ' + Estadopedido +' and ' + ComboBox1.Text + ' ');
Pedido.SQL.Add(' like "' + Edit1.Text + '%" and  dataentrega between (date() - 180) and (date() + 190) order by empresa');
Pedido.Open;
Edit1.SetFocus;
end;


procedure TfrmCadPedidos.TabSheet3Hide(Sender: TObject);
begin
if DM.QrPedido.State in [dsinsert, dsedit] then  else
  TabSheet3.TabVisible := false;
end;

procedure TfrmCadPedidos.TabSheet3Show(Sender: TObject);
begin
if not DM.QrPedido.IsEmpty then
Panel1.Color := StringToColor(DM.QrPedidoCorPedido.AsString);
end;

procedure TfrmCadPedidos.TabSheet4Show(Sender: TObject);
begin
    Estadopedido := 'pedidofechado = false';
    Pedido.Requery([]);
    PedidosParcial.Requery([]);
end;

end.
