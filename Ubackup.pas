unit Ubackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ZipMstr, ComCtrls, Registry;

type
  TFrmBackup = class(TForm)
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SaveDialog1: TSaveDialog;
    Animate1: TAnimate;
    ZipMaster1: TZipMaster;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Procura;
  public
    Procedure Gerar(tipo : integer);
  end;

var
  FrmBackup: TFrmBackup;

implementation

var
 caminhoBD : string;
 log: textfile;


{$R *.dfm}

procedure TFrmBackup.FormShow(Sender: TObject);
begin
   CaminhoBD := ExtractFilePath(Application.ExeName);
end;

procedure TFrmBackup.Procura;
var
  Procurar : TSearchRec;
  Arquivos: Integer;
begin
  Arquivos := 0;
  Arquivos := Arquivos + faDirectory;
  Arquivos := Arquivos + faArchive;
  Arquivos := Arquivos + faAnyFile;

    if FindFirst(caminhoBD + '*.MDB', Arquivos, Procurar) = 0 then
    begin
      repeat
       ZipMaster1.FSpecArgs.Add(caminhoBD + Procurar.Name);
      until FindNext(Procurar) <> 0;
      FindClose(Procurar);
    end;
end;


Procedure TFrmBackup.Gerar(tipo : integer);
VAR
 a : string;
begin

//tipo 1 é para gerar backup no mesmo Computador do Sistema
//tipo 2 é para gerar backup em outro local

if tipo = 1 then
begin
  Animate1.Active := True;
  ZipMaster1.ZipFileName := ExtractFilePath(Application.ExeName) + 'backup\BkpContasPagar_'
  + FormatDateTime('ddmmyy', Date) +'.cab';
  ZipMaster1.FSpecArgs.Clear;
  Procura;
  ZipMaster1.Add;
  If ZipMaster1.SuccessCnt >= 1 then
  begin
     MessageDlg('Backup realizado com sucesso!', mtInformation, [mbOk],0);
     a := ExtractFilePath(Application.ExeName)+'backup\InfoBackup.log';
     try
      AssignFile(log, Pchar(a));
      Rewrite(log,Pchar(a));
      Append(log);
      WriteLn(log, 'Informações referente ao último Backup Gerado');
      WriteLn(log, '');
      WriteLn(log, 'Data de Criação: '+FormatDateTime('dd', Date)+'/'+FormatDateTime('mm', Date)
      +'/'+FormatDateTime('yyyy', Date) + ' as ' + TimeToStr(now) + ' Hs');
     finally
      CloseFile(log);
     end;
  end
  Else
    MessageDlg('Erro ao fazer o Backup. Tente novamente!', mtError, [mbOk],0);
  Animate1.Active:=False;
end;

if tipo = 2 then
begin
  if SaveDialog1.Execute then
  begin
   Animate1.Active := True;
   ZipMaster1.ZipFileName := ExtractFilePath(SaveDialog1.FileName) + 'BkpContasPagar_' + FormatDateTime('ddmmyy', Date) +'.cab';
   ZipMaster1.FSpecArgs.Clear;
   Procura;
   ZipMaster1.Add;
  If ZipMaster1.SuccessCnt >= 1 then
  begin
     MessageDlg('Backup realizado com sucesso!', mtInformation, [mbOk],0);
     a := ExtractFilePath(SaveDialog1.FileName) + 'InfoBackup.log';
     try
      AssignFile(log, Pchar(a));
      Rewrite(log,Pchar(a));
      Append(log);
      WriteLn(log, 'Informações referente ao último Backup Gerado');
      WriteLn(log, '');
      WriteLn(log, 'Data de Criação: '+FormatDateTime('dd', Date)+'/'+FormatDateTime('mm', Date)
      +'/'+FormatDateTime('yyyy', Date) + ' as ' + TimeToStr(now) + ' Hs');
     finally
      CloseFile(log);
     end;
  end
  Else
    MessageDlg('Erro ao fazer o Backup. Tente novamente!', mtError, [mbOk],0);
   Animate1.Active:=False;
end;
end;

end;

procedure TFrmBackup.BitBtn1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
  0 : gerar(1);
  1 : gerar(2);
  end;
end;

end.
