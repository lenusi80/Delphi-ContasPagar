unit UCadFornec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DBCtrls, ComCtrls, DB, BDE, StdCtrls,
  Buttons, Mask, ADODB;

type
  TFrmCadForncec = class(TForm)
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn8: TBitBtn;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    GroupBox6: TGroupBox;
    DBMemo1: TDBMemo;
    GroupBox7: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    Label16: TLabel;
    GroupBox8: TGroupBox;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    ADOQuery1Cod_Empresa: TAutoIncField;
    ADOQuery1Empresa: TWideStringField;
    ADOQuery1CNPJ: TWideStringField;
    ADOQuery1InscEstadual: TWideStringField;
    ADOQuery1Vendedor: TWideStringField;
    ADOQuery1Telefone: TWideStringField;
    ADOQuery1Fax: TWideStringField;
    ADOQuery1Rua: TWideStringField;
    ADOQuery1Bairro: TWideStringField;
    ADOQuery1Cidade: TWideStringField;
    ADOQuery1Estado: TWideStringField;
    ADOQuery1Email: TWideStringField;
    ADOQuery1Site: TWideStringField;
    ADOQuery1Obs: TWideMemoField;
    ADOQuery1Desativado: TBooleanField;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label6: TLabel;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn5: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ADOQuery1CaracteristicaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure TabSheet3Hide(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadForncec: TFrmCadForncec;

implementation

uses UDM, URotinas, UVendedores;

{$R *.dfm}

procedure TFrmCadForncec.ADOQuery1CaracteristicaGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
Text := Sender.AsString;
end;

procedure TFrmCadForncec.BitBtn1Click(Sender: TObject);
begin
TabSheet3.TabVisible := true;
TabSheet3.SHOW;
 if DM.QRFornecedores.State in [dsinsert] then
   ShowMessage('Este já é um Cadastro Novo')
 else
  DM.QRFornecedores.insert;
    DBEdit2.SetFocus;
    BitBtn3.Enabled := false;
    DM.QRFornecedoresDesativado.Value := false;
end;

procedure TFrmCadForncec.BitBtn2Click(Sender: TObject);
begin
if DM.QRFornecedores.State in [dsinsert,dsedit] then
  If DBEdit2.text <> '' then
   begin
    DM.QRFornecedores.Post;
    ShowMessage('Gravação Efetuada Com Sucesso');
    BitBtn3.Enabled := true;
   end
   else
    begin
     MessageDLG('Gravação Não Efetuada, Falta Dados',mtError,[mbok],0);
     DBEdit2.SetFocus;
    end;
end;

procedure TFrmCadForncec.BitBtn3Click(Sender: TObject);
begin
if TabSheet3.TabVisible = true then
if (DM.QRFornecedores.Bof <> true) and (DM.QRFornecedores.Eof <> true) then
  begin
   if messagedlg('Deseja Excluir este Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    DM.QRFornecedores.Delete;
   end
      else
 showmessage('Nenhum Registro Para Excluir!');
 TabSheet4.Show;
end;

procedure TFrmCadForncec.BitBtn4Click(Sender: TObject);
begin
DM.QRFornecedores.Cancel;
close;
end;

procedure TFrmCadForncec.BitBtn5Click(Sender: TObject);
begin
  Application.CreateForm(TFrmVendedores, FrmVendedores);
  FrmVendedores.ShowModal;
end;

procedure TFrmCadForncec.BitBtn8Click(Sender: TObject);
begin
if DM.QRFornecedores.State in [dsedit,dsinsert] then
begin
DM.QRFornecedores.Cancel;
BitBtn3.Enabled := true;
end
 else
  TabSheet4.Show;
end;

procedure TFrmCadForncec.ComboBox1Click(Sender: TObject);
begin
Edit1.SetFocus;
end;

procedure TFrmCadForncec.DBEdit2Change(Sender: TObject);
begin
if Length(DBEdit2.Text)= 59 then {10 digitos}
 ShowMessage('Limite do tamanho de nome alcançado!');
end;

procedure TFrmCadForncec.DBEdit2Enter(Sender: TObject);
begin
CorEntrada(sender);
end;

procedure TFrmCadForncec.DBEdit2Exit(Sender: TObject);
begin
CorSaida(sender);
end;

procedure TFrmCadForncec.DBGrid1DblClick(Sender: TObject);
begin
if not DM.QRFornecedores.IsEmpty then
begin
DM.QRFornecedores.locate('Empresa',ADOQuery1.FieldByName('empresa').AsString,[locaseinsensitive]);
TabSheet3.TabVisible := true;
TabSheet3.Show;
end;
end;

procedure TFrmCadForncec.Edit1Change(Sender: TObject);
begin
ADOQuery1.Close;
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add('Select * from Cad_Fornec where ' + ComboBox1.Text + ' ');
ADOQuery1.SQL.Add('like "' + Edit1.Text + '%" order by ' + ComboBox1.Text + '');
ADOQuery1.Open;
end;

procedure TFrmCadForncec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DM.QRFornecedores.Cancel;
FrmCadForncec.Release;
FrmCadForncec := nil;
end;

procedure TFrmCadForncec.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
begin
      Key := #0;
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TFrmCadForncec.FormShow(Sender: TObject);
begin
ADOQuery1.Active := true;
TabSheet4.Show;
Edit1.SetFocus;
end;

procedure TFrmCadForncec.TabSheet3Hide(Sender: TObject);
begin
if DM.QRFornecedores.State in [dsinsert, dsedit] then  else
TabSheet3.TabVisible := false;
end;

procedure TFrmCadForncec.TabSheet3Show(Sender: TObject);
begin
BitBtn8.SetFocus;
end;

procedure TFrmCadForncec.TabSheet4Show(Sender: TObject);
begin
Edit1.SetFocus;
if ADOQuery1.Active then
ADOQuery1.Requery([]);
end;

end.
