unit UConfigBD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Registry, ZipMstr;

type
  TFrmConfigBD = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    ZipMaster1: TZipMaster;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  FrmConfigBD: TFrmConfigBD;
  botao : integer;

implementation

uses UPrincipal, ULogin, UDM;

{$R *.dfm}

procedure TFrmConfigBD.BitBtn1Click(Sender: TObject);
begin
botao := 1;
Edit1.Enabled := true;
Edit1.SetFocus;
BitBtn4.Enabled := false;
BitBtn2.Enabled := true;
end;

procedure TFrmConfigBD.BitBtn2Click(Sender: TObject);
var
 temp : string;
 FullProgPath : PChar;
begin
  if Edit1.Text <> '' then
  begin
   if ListBox1.Items.IndexOf(Edit1.Text) < 0 then
    else
     begin
       ShowMessage('Nome já Existente! Escolha outro por favor.');
       Edit1.SetFocus;
       exit;
     end;

// 1 = Botão Alterar -----------------------------------------------------------
// 2 = Botão Novo --------------------------------------------------------------

   if botao = 1 then
    begin
     DM.LigaBD.Connected := false;

  if FileExists(DiretorioInstal +  NomeBD) then
   begin
    temp := Edit1.Text + '.mdb';
    RenameFile(DiretorioInstal +  NomeBD, DiretorioInstal + temp);
   end;
     showmessage('Agora o Sistema Será Reiniciado Para Validar a Nova Configuração');
     FullProgPath := PChar(Application.ExeName);
     WinExec(FullProgPath, SHOW_OPENWINDOW);
     Application.Terminate;
    end;

   if botao = 2 then
    begin
      DM.LigaBD.Connected := false;
     ZipMaster1.FSpecArgs.Clear;
     ZipMaster1.FSpecArgsExcl.Clear;
     ZipMaster1.ZipFileName := DiretorioInstal + 'default.dat';
     ZipMaster1.FSpecArgsExcl.Add(DiretorioInstal + 'default.dat');
     ZipMaster1.ExtrBaseDir := DiretorioInstal;
     ZipMaster1.Extract;
    If ZipMaster1.SuccessCnt >= 1 then
     MessageDlg('Criação Realizada com sucesso!', mtInformation, [mbOk],0)
    Else
     MessageDlg('Erro ao Criar BD. Tente novamente!', mtError, [mbOk],0);
  if FileExists(DiretorioInstal +  'bdtemp00.mdb') then
   begin
    temp := Edit1.Text + '.mdb';
    RenameFile(DiretorioInstal +  'bdtemp00.mdb', DiretorioInstal + temp);
   end;

     showmessage('Agora o Sistema Será Reiniciado Para Validar a Nova Configuração');
     FullProgPath := PChar(Application.ExeName);
     WinExec(FullProgPath, SHOW_OPENWINDOW);
     Application.Terminate;
    end;

  end
   else
    begin
      ShowMessage('Esta faltando especificar o Nome do Banco de Dados!');
      Edit1.SetFocus;
    end;
end;

procedure TFrmConfigBD.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure TFrmConfigBD.BitBtn4Click(Sender: TObject);
begin
Label1.Visible := false;
Label3.Visible := false;
botao := 2;
Label2.Caption := 'Nome do Novo Banco de Dados';
BitBtn2.Enabled := true;
Edit1.Enabled := true;
Edit1.SetFocus;
end;

procedure TFrmConfigBD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FrmConfigBD.Release;
FrmConfigBD := nil;
end;

procedure TFrmConfigBD.FormShow(Sender: TObject);
begin
Label3.Caption := usuario;
ListBox1.Items.AddStrings(Bds);
end;

end.
