program ContasPagar;

uses
  Forms,
  windows,
  dialogs,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UDM in 'UDM.pas' {DM: TDataModule},
  UFrmCalendario in 'UFrmCalendario.pas' {FrmCalendario},
  UCadFornec in 'UCadFornec.pas' {FrmCadForncec},
  URotinas in 'URotinas.pas',
  UCorFundo in 'UCorFundo.pas' {FrmCorFundo},
  ULogin in 'ULogin.pas' {FrmLogin},
  UAltSenhas in 'UAltSenhas.pas' {FrmAltSenhas},
  UCadPedidos in 'UCadPedidos.pas' {frmCadPedidos},
  Ubackup in 'Ubackup.pas' {FrmBackup},
  UConfigBD in 'UConfigBD.pas' {FrmConfigBD},
  UNf in 'UNf.pas' {FrmNf},
  Upagamentos in 'Upagamentos.pas' {FrmPagamentos},
  UDMRelatorios in 'UDMRelatorios.pas' {DMRelatorios: TDataModule},
  ABOUT in 'ABOUT.pas' {AboutBox},
  UFiltroRelatorio in 'UFiltroRelatorio.pas' {FrmFiltroRelatorio},
  UCreditos in 'UCreditos.pas' {FrmCreditos},
  UGastosDiversos in 'UGastosDiversos.pas' {FrmGastosDiversos},
  UFiltroRelatorio2 in 'UFiltroRelatorio2.pas' {FrmFiltroRelatorio2},
  UVendedores in 'UVendedores.pas' {FrmVendedores},
  UEstornos in 'UEstornos.pas' {FrmEstornos},
  UFornecResumo in 'UFornecResumo.pas' {frmResumoFornecedores},
  UDespDivResumo in 'UDespDivResumo.pas' {FrmDespDivResumo};

{$R *.res}


var
  Hwnd: Thandle;

begin
  Application.Initialize;
  Application.Title := 'Contas a Pagar';
  frmLogin := TFrmLogin.create(application);
  repeat
  FrmLogin.ShowModal;
  if fechar <> true then
    Application.CreateForm(TDM, DM);
  until fechar = true;
  if Ok = true then // se o Login estiver Correto continua a inialização do programa
   begin
    Hwnd := FindWindow ('TFrmPrincipal', 'Contas a Pagar');
    if Hwnd = 0 then
    begin
      Application.CreateForm(TFrmPrincipal, FrmPrincipal);
      Application.CreateForm(TFrmBackup, FrmBackup);
      Application.CreateForm(TDMRelatorios, DMRelatorios);
      Application.CreateForm(TFrmFiltroRelatorio, FrmFiltroRelatorio);
      Application.CreateForm(TFrmFiltroRelatorio2, FrmFiltroRelatorio2);
      Application.Run;
    end
    else
     begin
     MessageDlg ('Este programa já esta aberto',mtinformation,[mbok], 0);
     SetForegroundWindow (Hwnd);
     end;
  end;
end.


