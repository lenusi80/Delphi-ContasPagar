unit UVendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, Grids, DBGrids, Buttons, DB, ADODB;

type
  TFrmVendedores = class(TForm)
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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Label17: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure TabSheet2Hide(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVendedores: TFrmVendedores;

implementation

uses UDM, URotinas;

{$R *.dfm}

procedure TFrmVendedores.BitBtn1Click(Sender: TObject);
begin
TabSheet2.TabVisible := true;
TabSheet2.SHOW;
 if DM.TB_Vendedores.State in [dsinsert] then
   ShowMessage('Este já é um Cadastro Novo')
 else
 begin
  BitBtn3.Enabled := false;
  DM.TB_Vendedores.insert;
  DBEdit1.SetFocus;
 end;
end;

procedure TFrmVendedores.BitBtn2Click(Sender: TObject);
begin
if DM.TB_Vendedores.State in [dsinsert,dsedit] then
  If DBEdit1.text <> '' then
   begin
    DM.TB_Vendedores.Post;
    ShowMessage('Gravação Efetuada Com Sucesso');
    BitBtn3.Enabled := true;
   end
   else
    begin
     MessageDLG('Gravação Não Efetuada, Faltam Dados',mtError,[mbok],0);
     DBEdit1.SetFocus;
    end;
end;

procedure TFrmVendedores.BitBtn3Click(Sender: TObject);
begin
DM.TB_Vendedores.Refresh;
if TabSheet2.TabVisible = true then
if (DM.TB_Vendedores.Bof <> true) and (DM.TB_Vendedores.Eof <> true) then
  begin
   if messagedlg('Deseja Excluir este Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    DM.TB_Vendedores.Delete;
   end
      else
 showmessage('Nenhum Registro Para Excluir!');
TabSheet1.Show;
end;

procedure TFrmVendedores.BitBtn8Click(Sender: TObject);
begin
if DM.TB_Vendedores.State in [dsinsert,dsedit] then
 begin
  DM.TB_Vendedores.Cancel;
  BitBtn3.Enabled := true;
 end
  else
   TabSheet1.Show;
end;

procedure TFrmVendedores.DBEdit1Enter(Sender: TObject);
begin
CorEntrada(sender);
end;

procedure TFrmVendedores.DBEdit1Exit(Sender: TObject);
begin
CorSaida(sender);
end;

procedure TFrmVendedores.DBGrid1DblClick(Sender: TObject);
begin
if not DM.TB_Vendedores.IsEmpty then
begin
DM.TB_Vendedores.locate('Nome',ADOQuery1.FieldByName('Nome').AsString,[locaseinsensitive]);
TabSheet2.TabVisible := true;
TabSheet2.Show;
end;
end;

procedure TFrmVendedores.Edit1Change(Sender: TObject);
begin
ADOQuery1.Close;
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add('Select * from Cad_Vendedor where nome ');
ADOQuery1.SQL.Add('like "' + Edit1.Text + '%" order by Nome');
ADOQuery1.Open;
end;

procedure TFrmVendedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DM.TB_Vendedores.Cancel;
FrmVendedores.Release;
FrmVendedores := nil;
end;

procedure TFrmVendedores.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
begin
      Key := #0;
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TFrmVendedores.TabSheet1Show(Sender: TObject);
begin
Edit1.SetFocus;
ADOQuery1.Requery([]);
end;

procedure TFrmVendedores.TabSheet2Hide(Sender: TObject);
begin
if DM.TB_Vendedores.State in [dsinsert,dsedit] then else
TabSheet2.TabVisible := false;
end;

end.
