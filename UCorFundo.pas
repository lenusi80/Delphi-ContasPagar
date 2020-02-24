unit UCorFundo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ColorGrd, registry, ExtDlgs;

type
  TFrmCorFundo = class(TForm)
    ColorGrid1: TColorGrid;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    AbreImagem: TOpenPictureDialog;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ColorGrid1Click(Sender: TObject);
    procedure ColorGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCorFundo: TFrmCorFundo;

implementation

uses UPrincipal;

var
 corFundo : string[12];
 ImgFundo : string;
 registro : Tregistry;

{$R *.dfm}

procedure TFrmCorFundo.BitBtn1Click(Sender: TObject);
begin
Registro := Tregistry.Create;
with registro do
 begin
   RootKey := HKEY_CURRENT_USER;
   OpenKey('\SOFTWARE\ContasPagar\', true);
   Writestring('CorFundo', corFundo );
   Writestring('ImgFundo', ImgFundo );
   CloseKey;
   free;
 end;
if ImgFundo = '' then
  FrmPrincipal.Image1.Picture := nil;
close;
end;

procedure TFrmCorFundo.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TFrmCorFundo.CheckBox1Click(Sender: TObject);
begin
AbreImagem.Execute;
if AbreImagem.FileName <> '' then
 begin
   ImgFundo := AbreImagem.FileName;
   FrmPrincipal.Image1.Picture.LoadFromFile(AbreImagem.FileName);
 end
end;

procedure TFrmCorFundo.ColorGrid1Click(Sender: TObject);
begin
FrmPrincipal.Image1.Picture := nil;
FrmPrincipal.Color := ColorGrid1.ForegroundColor;
corFundo := ColorToString(ColorGrid1.ForegroundColor);
end;

procedure TFrmCorFundo.ColorGrid1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
//SwapMouseButton(true);
end;

procedure TFrmCorFundo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FrmCorFundo.Release;
FrmCorFundo := nil;
end;

procedure TFrmCorFundo.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
//SwapMouseButton(false);
end;

procedure TFrmCorFundo.FormShow(Sender: TObject);
begin
ImgFundo := '';
corFundo := '';
end;

end.
