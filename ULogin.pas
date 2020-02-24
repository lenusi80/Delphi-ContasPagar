unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons, ZipMstr;

type
  TFrmLogin = class(TForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    ZipMaster1: TZipMaster;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
  private
      Procedure LocalizarBD;
    { Private declarations }
  public

  end;

var
  FrmLogin: TFrmLogin;
  OK, fechar : boolean;
  NomeBD, DiretorioInstal, senha : string;
  BDs : TStrings;

implementation

uses URotinas, UPrincipal, UDM;

{$R *.dfm}

Procedure TFrmLogin.LocalizarBD;
var
 a : string;
  FullProgPath : PChar;
begin
  if messagedlg('Esta faltando o Banco de Dados, Deseja Restaurar de um Backup?'
  ,mtConfirmation,[mbYes,mbCancel],0) = mrYes then
    begin
      a := DiretorioInstal + '\Backup.exe';
      WinExec(PChar(a), SHOW_OPENWINDOW);
      Application.Terminate;
    end
      else
       begin
        if messagedlg('Então deseja criar um Novo?' ,mtConfirmation,[mbYes,mbCancel],0) = mrYes then
        begin
          ZipMaster1.FSpecArgs.Clear;
          ZipMaster1.FSpecArgsExcl.Clear;
          ZipMaster1.ZipFileName := DiretorioInstal + 'default.dat';
          ZipMaster1.FSpecArgsExcl.Add(DiretorioInstal + 'default.dat');
          ZipMaster1.ExtrBaseDir := DiretorioInstal;
          ZipMaster1.Extract;
     if FileExists(DiretorioInstal +  'bdtemp00.mdb') then
       RenameFile(DiretorioInstal +  'bdtemp00.mdb', DiretorioInstal + 'Sem_Nome.mdb');
     showmessage('Agora o Sistema Será Reiniciado Para Validar a Nova Configuração');
     FullProgPath := PChar(Application.ExeName);
     WinExec(FullProgPath, SHOW_OPENWINDOW);
     Application.Terminate;
        end
         else
           Application.Terminate;
       end;
end;

procedure TFrmLogin.BitBtn1Click(Sender: TObject);
begin
if ComboBox1.Text <> '' then
begin
  senha := Codigo(Edit2.Text);
  usuario := ComboBox1.Text;
  NomeBD :=  ComboBox1.Text + '.mdb';
  fechar := false;
  Ok := false;
  close;
end
 else
 begin
  fechar := true;
  OK := false;
  LocalizarBD;
  close;
 end;
end;

procedure TFrmLogin.BitBtn2Click(Sender: TObject);
begin
fechar := true;
OK := false;
close;
end;

procedure TFrmLogin.ComboBox1Click(Sender: TObject);
begin
Edit2.SetFocus;
end;

procedure TFrmLogin.Edit1Enter(Sender: TObject);
begin
CorEntrada(sender);
end;

procedure TFrmLogin.Edit1Exit(Sender: TObject);
begin
CorSaida(sender);
end;

procedure TFrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
begin
      Key := #0;
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
var
  Procurar : TSearchRec;
  Arquivos: Integer;
begin
DiretorioInstal := ExtractFilePath(Application.ExeName);

ComboBox1.Items.Clear;

  Arquivos := 0;
  //Arquivos := Arquivos + faDirectory;
  Arquivos := Arquivos + faArchive;
  Arquivos := Arquivos + faAnyFile;

  BDs := TStringList.Create;

    if FindFirst(DiretorioInstal + '*.MDB', Arquivos, Procurar) = 0 then
    begin
      repeat
       BDs.Add(ExtractName(Procurar.Name));
      until FindNext(Procurar) <> 0;
      FindClose(Procurar);
    end;

combobox1.items.AddStrings(bds);
ComboBox1.ItemIndex := 0;

Panel1.Caption := DataExtenso(date);
Edit2.SetFocus;
end;   

end.
