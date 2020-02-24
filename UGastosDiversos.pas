unit UGastosDiversos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Grids, DBGrids, ComCtrls, Buttons, DB, BDE, ADODB,
  Mask;

type
  TFrmGastosDiversos = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn3: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    GroupBox8: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn4: TBitBtn;
    CheckBox1: TCheckBox;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    Soma: TADOQuery;
    SomaTotal: TBCDField;
    DSSoma: TDataSource;
    DBGrid1: TDBGrid;
    CheckBox2: TCheckBox;
    DBLookupComboBox2: TDBLookupComboBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure BitBtn4KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBLookupComboBox2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGastosDiversos: TFrmGastosDiversos;

implementation

uses URotinas, UDM;

{$R *.dfm}

procedure TFrmGastosDiversos.BitBtn1Click(Sender: TObject);
begin
 if DM.QRDespDiversas.State in [dsinsert] then
   ShowMessage('Este já é um Cadastro Novo')
 else
 begin
if not CheckBox2.Checked then
begin
DM.QRDespDiversas.Close;
DM.QRDespDiversas.SQL.Clear;
DM.QRDespDiversas.SQL.Add('select * from Cad_DespDiversas where data between (date() - 30) and (date() + 190) ');
DM.QRDespDiversas.SQL.Add('order by data desc');
DM.QRDespDiversas.Open;
Soma.Close;
Soma.SQL.Clear;
Soma.SQL.Add('select sum(valor) as Total from Cad_DespDiversas where data between (date() - 30) and (date() + 190)');
Soma.Open;
DBEdit1.Enabled := true;
DBEdit1.SetFocus;
end
 else
  begin
    DM.QRDespDiversas.Close;
    DM.QRDespDiversas.SQL.Clear;
    DM.QRDespDiversas.SQL.Add('select * from Cad_DespDiversas where data = date()');
    DM.QRDespDiversas.Open;
    Soma.Close;
    Soma.SQL.Clear;
    Soma.SQL.Add('select sum(valor) as Total from Cad_DespDiversas where data = date()');
    Soma.Open;
    DBEdit1.Enabled := false;
    DBLookupComboBox1.SetFocus;
  end;
  DM.QRDespDiversas.insert;
  DM.QRDespDiversasData.AsString := DateToStr(date);
  DM.QRDespDiversassituacao.AsBoolean := false;
 end;
end;

procedure TFrmGastosDiversos.BitBtn2Click(Sender: TObject);
begin
if DM.QRDespDiversas.State in [dsinsert,dsedit] then
  If DBEdit1.text <> '' then
   begin
    DM.QRDespDiversas.Post;
    ShowMessage('Gravação Efetuada Com Sucesso');
    DM.QRDespDiversas.Requery([]);
    Soma.Requery([]);
   end
   else
    begin
     MessageDLG('Gravação Não Efetuada, Falta Dados',mtError,[mbok],0);
     BitBtn1.SetFocus;
    end;
end;

procedure TFrmGastosDiversos.BitBtn3Click(Sender: TObject);
begin
if (DM.QRDespDiversas.Bof <> true) and (DM.QRDespDiversas.Eof <> true) then
  begin
   if messagedlg('Deseja Excluir este Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
     DM.QRDespDiversas.Delete;
     Soma.Requery([]);
    end;
  end
      else
       showmessage('Nenhum Registro Para Excluir!');
end;

procedure TFrmGastosDiversos.BitBtn4Click(Sender: TObject);
var
 checBox, dblookcombSTR : string;
begin

dblookcombSTR := DBLookupComboBox2.Text;
checbox := BoolToStr(CheckBox1.Checked, true);
DM.QRDespDiversas.Close;
DM.QRDespDiversas.SQL.Clear;
DM.QRDespDiversas.SQL.Add('select * from Cad_DespDiversas where situacao = ' + checbox + ' ');

if DBLookupComboBox2.Text <> '' then
DM.QRDespDiversas.SQL.Add('and empresa like "' + dblookcombSTR + '%"  ');

DM.QRDespDiversas.SQL.Add('and data between :datainicial and :datafinal order by data desc');
DM.QRDespDiversas.Parameters[0].Value := DateToStr(DateTimePicker1.Date);
DM.QRDespDiversas.Parameters[1].Value := DateToStr(DateTimePicker2.Date);
DM.QRDespDiversas.Open;



Soma.Close;
Soma.SQL.Clear;
Soma.SQL.Add('select sum(valor) as Total from Cad_DespDiversas where situacao = ' + checbox + ' ');

if DBLookupComboBox2.Text <> '' then
Soma.SQL.Add('and empresa like "' + dblookcombSTR + '%"  ');

Soma.SQL.Add('and data between :datainicial and :datafinal');
Soma.Parameters[0].Value := DateToStr(DateTimePicker1.Date);
Soma.Parameters[1].Value := DateToStr(DateTimePicker2.Date);
Soma.Open;

  //DBLookupComboBox2.KeyValue := -1;

end;

procedure TFrmGastosDiversos.BitBtn4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_DELETE  then
  DBLookupComboBox2.KeyValue := -1;
end;

procedure TFrmGastosDiversos.BitBtn8Click(Sender: TObject);
begin
if DM.QRDespDiversas.State in [dsinsert,dsedit] then
 begin
  DM.QRDespDiversas.Cancel;
  DM.QRDespDiversas.Requery([]);
  Soma.Requery([]);
 end
  else
if not CheckBox2.Checked then
begin
DM.QRDespDiversas.Close;
DM.QRDespDiversas.SQL.Clear;
DM.QRDespDiversas.SQL.Add('select * from Cad_DespDiversas where data between (date() - 30) and (date() + 190) ');
DM.QRDespDiversas.SQL.Add('order by data desc');
DM.QRDespDiversas.Open;
Soma.Close;
Soma.SQL.Clear;
Soma.SQL.Add('select sum(valor) as Total from Cad_DespDiversas where data between (date() - 30) and (date() + 190)');
Soma.Open;
end
 else
  begin
    DM.QRDespDiversas.Close;
    DM.QRDespDiversas.SQL.Clear;
    DM.QRDespDiversas.SQL.Add('select * from Cad_DespDiversas where data = date()');
    DM.QRDespDiversas.Open;
    Soma.Close;
    Soma.SQL.Clear;
    Soma.SQL.Add('select sum(valor) as Total from Cad_DespDiversas where data = date()');
    Soma.Open;
  end;
end;

procedure TFrmGastosDiversos.CheckBox2Click(Sender: TObject);
begin
if not CheckBox2.Checked then
begin
DM.QRDespDiversas.Close;
DM.QRDespDiversas.SQL.Clear;
DM.QRDespDiversas.SQL.Add('select * from Cad_DespDiversas where data between (date() - 30) and (date() + 190) ');
DM.QRDespDiversas.SQL.Add('order by data desc');
DM.QRDespDiversas.Open;
Soma.Close;
Soma.SQL.Clear;
Soma.SQL.Add('select sum(valor) as Total from Cad_DespDiversas where data between (date() - 30) and (date() + 190)');
Soma.Open;
DBEdit1.Enabled := true;
end
 else
  begin
    DM.QRDespDiversas.Close;
    DM.QRDespDiversas.SQL.Clear;
    DM.QRDespDiversas.SQL.Add('select * from Cad_DespDiversas where data = date()');
    DM.QRDespDiversas.Open;
    Soma.Close;
    Soma.SQL.Clear;
    Soma.SQL.Add('select sum(valor) as Total from Cad_DespDiversas where data = date()');
    Soma.Open;
    DBEdit1.Enabled := false;
  end;
end;

procedure TFrmGastosDiversos.DBEdit1Enter(Sender: TObject);
begin
CorEntrada(sender);
end;

procedure TFrmGastosDiversos.DBEdit1Exit(Sender: TObject);
begin
CorSaida(sender);
end;

procedure TFrmGastosDiversos.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8,','] ) then
  begin
  beep;{somente delphi 2.0 ou >}
  key:=#0;
  end;
end;

procedure TFrmGastosDiversos.DBLookupComboBox2KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = VK_DELETE  then
  DBLookupComboBox2.KeyValue := -1;
end;

procedure TFrmGastosDiversos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if DM.QRDespDiversas.State in [dsedit,dsinsert] then
begin
 showmessage('Por Favor, salve este cadastro antes de Sair!');
 canclose := false;
 end
else
 begin
  FrmGastosDiversos.Release;
  FrmGastosDiversos := nil;
 end;
end;

procedure TFrmGastosDiversos.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
begin
      Key := #0;
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TFrmGastosDiversos.FormShow(Sender: TObject);
begin
DateTimePicker1.Date := date;
DateTimePicker2.Date := date + 30;
end;

end.
