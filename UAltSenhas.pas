unit UAltSenhas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, registry, Buttons;

type
  TFrmAltSenhas = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAltSenhas: TFrmAltSenhas;
  registro : Tregistry;

implementation

uses URotinas, UDM, UPrincipal;

{$R *.dfm}

procedure TFrmAltSenhas.BitBtn1Click(Sender: TObject);
var
 senha : string;
begin
 senha := Codigo(DM.QrUserssenha.AsString);
 if Edit2.Text = senha  then
  begin
   senha := Codigo(Edit4.Text);
   With dm do
    begin
     QrUsers.Edit;
     QrUserssenha.AsString := senha;
     QrUsers.Post;
    end;
      Registro := Tregistry.Create;
       with registro do
        begin
          RootKey := HKEY_CURRENT_USER;
          OpenKey('\SOFTWARE\ContasPagar\', true);
          Writestring('Usuario', Edit1.Text );
          CloseKey;
          free;
        end;
      close;
      ShowMessage('Senha Alterada com Sucesso');
  end
  else
   begin
      showmessage('Senha Atual Incorreta');
      Edit2.Clear;
      Edit2.SetFocus;
   end;

end;

procedure TFrmAltSenhas.Edit1Enter(Sender: TObject);
begin
CorEntrada(sender);
end;

procedure TFrmAltSenhas.Edit1Exit(Sender: TObject);
begin
CorSaida(sender);
end;

procedure TFrmAltSenhas.Edit2Exit(Sender: TObject);
begin
CorSaida(sender);
end;

procedure TFrmAltSenhas.Edit4Exit(Sender: TObject);
begin
CorSaida(sender);
if Edit3.Text <> Edit4.Text then
 begin
   ShowMessage('Repetição de Senha não Confere com Nova Senha, Favor Redigitar');
   Edit3.Clear;
   Edit4.Clear;
   Edit3.SetFocus
 end;
end;

procedure TFrmAltSenhas.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
begin
      Key := #0;
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TFrmAltSenhas.FormShow(Sender: TObject);
begin
Edit1.Text :=  usuario
end;

end.
