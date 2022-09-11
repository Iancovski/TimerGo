unit FMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList, System.Math,
  System.IniFiles, System.DateUtils, UUtils;

type
  TfrmMain = class(TForm)
    pnlReposition: TPanel;
    pnlBackground: TPanel;
    pnlPlayPause: TPanel;
    imgPlay: TImage;
    pnlMain: TPanel;
    lblTicket: TLabel;
    pnlSettings: TPanel;
    imgLog: TImage;
    imgPause: TImage;
    imgClose: TImage;
    Timer: TTimer;
    pnlTimer: TPanel;
    lblTimer: TLabel;
    imgRecording: TImage;
    procedure imgPlayClick(Sender: TObject);
    procedure imgLogClick(Sender: TObject);
    procedure pnlRepositionMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgCloseClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblTicketClick(Sender: TObject);

  private
    FPaused: Boolean;
    FTicket: String;
    FTotalTime: TTime;
    FRecordType: TRecordType;

    procedure SetPaused(const Value: Boolean);
    procedure SetTicket(const Value: String);
    procedure SetTotalTime(const Value: TTime);
    procedure SetRecordType(const Value: TRecordType);

  public
    IniFile: TIniFile;
    TimeStart: TDateTime;
    OldMinute, OldHour: Word;
    Days: Word;
    ChangingTicket: Boolean;

    property Paused: Boolean read FPaused write SetPaused;
    property Ticket: String read FTicket write SetTicket;
    property RecordType: TRecordType read FRecordType write SetRecordType;
    property TotalTime: TTime read FTotalTime write SetTotalTime;

    procedure InitializeVariables;
    procedure LoadLastPosition;
    procedure SaveLastPosition;
    procedure SaveTimeIni;

    function GetTicket(ACloseIfCancel: Boolean = False): String;
    function GetLastRecordType(ALastTicket: String): TRecordType;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses FLog, FTicket;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveLastPosition();
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not Paused then begin
    if Application.MessageBox('Há uma contagem em andamento.' + sLineBreak +
      'Deseja interrompê-la e fechar o programa?', 'Atenção', MB_YESNO + MB_ICONWARNING) = ID_YES then begin
      CanClose := True;
      Paused := True;
    end
    else
      CanClose := False;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  InitializeVariables();
  LoadLastPosition();
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  ShowWindow(Handle, SW_SHOWNORMAL);
  Application.HandleMessage;
  Application.ProcessMessages;

  Ticket := GetTicket(True);
end;

function TfrmMain.GetLastRecordType(ALastTicket: String): TRecordType;
begin
  Result := rtDevelopment;

  if Pos('#A', ALastTicket) > 0 then
    Result := rtAnalysis
  else if Pos('#D', ALastTicket) > 0 then
    Result := rtDevelopment
  else if Pos('#T', ALastTicket) > 0 then
    Result := rtTest
  else if Pos('#F', ALastTicket) > 0 then
    Result := rtFix
  else if Pos('#H', ALastTicket) > 0 then
    Result := rtHelp;
end;

function TfrmMain.GetTicket(ACloseIfCancel: Boolean = False): String;
var
  vRecordType: TRecordType;
begin
  Result := ReadIni('SETTINGS', 'LAST_TICKET');

  vRecordType := GetLastRecordType(Result);
  Result := StringReplace(Result, '#' + RecordTypeToString(vRecordType), '', [rfIgnoreCase]);

  frmTicket.edtTicket.Text := Result;
  frmTicket.RecordType := vRecordType;
  frmTicket.ShowModal;

  if (ACloseIfCancel) and (not frmTicket.Confirmed) then
    Close;

  if (frmTicket.Confirmed) then begin
    ChangingTicket := True;

    Result := frmTicket.edtTicket.Text;
    RecordType := frmTicket.RecordType;
    TotalTime := GetTotalTime(Result + '#' + RecordTypeToString(RecordType), Days);

    ChangingTicket := False;
  end;
end;

procedure TfrmMain.imgCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.imgPlayClick(Sender: TObject);
begin
  Paused := not Paused;
end;

procedure TfrmMain.imgLogClick(Sender: TObject);
begin
  frmLog.ShowModal;
end;

procedure TfrmMain.InitializeVariables;
begin
  OldMinute := 999;
  OldHour := 0;
  TimeStart := 0;
  Paused := True;

  try
    IniFile := TIniFile.Create(GetCurrentDir + '/TimerGo.ini');
  except
    on E: Exception do begin
      Application.MessageBox('Erro na gravação de arquivos.' + sLineBreak +
        'Por favor, tente executar este programa como administrador.', 'Erro', MB_ICONERROR);
      Close;
    end;
  end;
end;

procedure TfrmMain.lblTicketClick(Sender: TObject);
begin
  if not Paused then begin
    if Application.MessageBox('Há uma contagem em andamento.' + sLineBreak +
      'Deseja interrompê-la e selecionar outro Ticket?', 'Atenção', MB_YESNO + MB_ICONWARNING) = ID_YES then begin
      Paused := True;
    end
    else
      Exit;
  end;

  Ticket := GetTicket();
end;

procedure TfrmMain.LoadLastPosition;
begin
  if Assigned(IniFile) then begin
    Self.Top := StrToIntDef(ReadIni('SETTINGS', 'TOP'), 0);
    Self.Left := StrToIntDef(ReadIni('SETTINGS', 'LEFT'), 0);
  end;
end;

procedure TfrmMain.pnlRepositionMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(Self.Handle, WM_SYSCOMMAND, $F012, 0);
end;

procedure TfrmMain.SaveLastPosition;
begin
  if Assigned(IniFile) then begin
    WriteIni('SETTINGS', 'TOP', Self.Top.ToString);
    WriteIni('SETTINGS', 'LEFT', Self.Left.ToString);
  end;
end;

procedure TfrmMain.SaveTimeIni;
begin
  if (TimeStart > 0) then begin
    WriteIni('TICKETS', Ticket + '#' + RecordTypeToString(RecordType), FormatDateTime('DD/MM/YYYY', Now) + '|' +
      FormatDateTime('HH:MM:SS', TimeStart) + '-' + FormatDateTime('HH:MM:SS', Now), False);
  end;
end;

procedure TfrmMain.SetPaused(const Value: Boolean);
begin
  FPaused := Value;

  if Paused then begin
    Timer.Enabled := False;
    SaveTimeIni();
  end
  else begin
    TimeStart := Now;
    Timer.Enabled := True;
  end;

  imgPlay.Visible := Paused;
  imgPause.Visible := not Paused;
  imgRecording.Visible := not Paused;
end;

procedure TfrmMain.SetRecordType(const Value: TRecordType);
begin
  FRecordType := Value;
end;

procedure TfrmMain.SetTicket(const Value: String);
begin
  FTicket := Value;
  WriteIni('SETTINGS', 'LAST_TICKET', Ticket + '#' + RecordTypeToString(RecordType));

  lblTicket.Caption := Ticket;
end;

procedure TfrmMain.SetTotalTime(const Value: TTime);
begin
  FTotalTime := Value;

  if (MinuteOf(TotalTime) <> OldMinute) or (ChangingTicket) then begin
    OldMinute := MinuteOf(TotalTime);

    if (HourOf(TotalTime) < OldHour) and (not ChangingTicket) then
      Days := Days + 1;

    OldHour := HourOf(TotalTime);

    lblTimer.Caption := GetFormattedTime(TotalTime, Days);
  end;
end;

procedure TfrmMain.TimerTimer(Sender: TObject);
begin
  TotalTime := TotalTime + StrToTime('00:00:01');
  imgRecording.Visible := not imgRecording.Visible;
end;

end.
