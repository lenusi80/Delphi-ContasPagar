unit UFrmCalendario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Math, Grids, Calendar;

type
  TFrmCalendario = class(TForm)
    Cal: TCalendar;
    BtnAnoPrev: TSpeedButton;
    BtnAnoProx: TSpeedButton;
    BtnMesPrev: TSpeedButton;
    BtnMesProx: TSpeedButton;
    BtnDiaPrev: TSpeedButton;
    BtnDiaProx: TSpeedButton;
    LblAno: TLabel;
    LblMes: TLabel;
    LblDiaSemana: TLabel;
    PnlData: TPanel;
    Splitter1: TSplitter;
    procedure BtnAnoPrevClick(Sender: TObject);
    procedure BtnAnoProxClick(Sender: TObject);
    procedure BtnMesPrevClick(Sender: TObject);
    procedure BtnMesProxClick(Sender: TObject);
    procedure CalChange(Sender: TObject);
    procedure BtnDiaPrevClick(Sender: TObject);
    procedure BtnDiaProxClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  public
    { Public declarations }
    procedure AtualizaDataHora;
  end;

var
  FrmCalendario: TFrmCalendario;

implementation

{$R *.DFM}


procedure TFrmCalendario.AtualizaDataHora;
begin
  LblMes.Caption := UpperCase(LongMonthNames[Cal.Month]);
  LblAno.Caption := IntToStr(Cal.Year);
  LblDiaSemana.Caption := UpperCase(LongDayNames[DayOfWeek(Cal.CalendarDate)]);
  PnlData.Caption := FormatDateTime('d "de" mmmm "de" yyyy', Cal.CalendarDate);
end;

procedure TFrmCalendario.BtnAnoPrevClick(Sender: TObject);
begin
  Cal.PrevYear;
end;

procedure TFrmCalendario.BtnAnoProxClick(Sender: TObject);
begin
  Cal.NextYear;
end;

procedure TFrmCalendario.BtnMesPrevClick(Sender: TObject);
begin
  Cal.PrevMonth;
end;

procedure TFrmCalendario.BtnMesProxClick(Sender: TObject);
begin
  Cal.NextMonth;
end;

procedure TFrmCalendario.CalChange(Sender: TObject);
begin
  AtualizaDataHora;
end;

procedure TFrmCalendario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FrmCalendario.Release;
FrmCalendario := nil;
end;

procedure TFrmCalendario.FormShow(Sender: TObject);
begin
AtualizaDataHora;
end;

procedure TFrmCalendario.BtnDiaPrevClick(Sender: TObject);
begin
  with Cal do
    CalendarDate := CalendarDate - 1;
end;

procedure TFrmCalendario.BtnDiaProxClick(Sender: TObject);
begin
  with Cal do
    CalendarDate := CalendarDate + 1;
end;

end.
