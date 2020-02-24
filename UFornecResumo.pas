unit UFornecResumo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls;

type
  TfrmResumoFornecedores = class(TForm)
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
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
    ADOQuery1temp: TWideStringField;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmResumoFornecedores: TfrmResumoFornecedores;

implementation

uses UDM, UDMRelatorios, UPrincipal, ULogin;

{$R *.dfm}

procedure TfrmResumoFornecedores.Button1Click(Sender: TObject);
begin
ADOQuery1.Close;
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add('Update cad_Fornec Set temp=""');
ADOQuery1.ExecSQL;

ADOQuery1.Close;
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add('select * from cad_Fornec order by empresa');
ADOQuery1.Open;

DBGrid1.Update;
end;

procedure TfrmResumoFornecedores.Button2Click(Sender: TObject);
begin
ADOQuery1.Close;
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add('Update cad_Fornec Set temp="X"');
ADOQuery1.ExecSQL;

ADOQuery1.Close;
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add('select * from cad_Fornec order by empresa');
ADOQuery1.Open;

DBGrid1.Update;
end;

procedure TfrmResumoFornecedores.Button3Click(Sender: TObject);
begin
DMRelatorios.QRGeral.Close;
DMRelatorios.QRGeral.SQL.Clear;
DMRelatorios.QRGeral.SQL.Add('select * from cad_Fornec where temp ="X" order by empresa');
DMRelatorios.QRGeral.Open;

DMRelatorios.Relatorios.LoadFromFile('' + DiretorioInstal + 'frfFornecedoresResume.frf');
DMRelatorios.Relatorios.ShowReport;
end;

procedure TfrmResumoFornecedores.DBGrid1CellClick(Column: TColumn);
begin
ADOQuery1.Edit;
if ADOQuery1temp.AsString = 'X' then
ADOQuery1temp.AsString := ''
else ADOQuery1temp.AsString := 'X';
ADOQuery1.Post;
end;

procedure TfrmResumoFornecedores.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
Check: Integer;
R: TRect;
begin
//Desenha um checkbox no dbgrid
if Column.FieldName = 'temp' then begin
DBGrid1.Canvas.FillRect(Rect);
//Check := 0;
if ADOQuery1temp.AsString = 'X' then
Check := DFCS_CHECKED
else Check := 0;
R:=Rect;
InflateRect(R,-2,-2); {Diminue o tamanho do CheckBox}
DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
end;
end;

procedure TfrmResumoFornecedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frmResumoFornecedores.Release;
frmResumoFornecedores := nil;
end;

end.
