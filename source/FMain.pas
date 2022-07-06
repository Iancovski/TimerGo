unit FMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList, System.Math,
  System.IniFiles, System.DateUtils;

type
  TfrmMain = class(TForm)
    pnlReposition: TPanel;
    pnlBackground: TPanel;
    pnlPlayPause: TPanel;
    imgPlay: TImage;
    pnlMain: TPanel;
    lblTimer: TLabel;
    lblTicket: TLabel;
    pnlSettings: TPanel;
    imgLog: TImage;
    imgPause: TImage;
    imgClose: TImage;
    Timer: TTimer;
    imgRecording: TImage;
    procedure FormCreate(Sender: TObject);
    procedure imgPlayClick(Sender: TObject);
    procedure imgLogClick(Sender: TObject);
    procedure pnlRepositionMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure imgCloseClick(Sender: TObject);
    procedure lblTicketDblClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    FPaused: Boolean;
    FTicket: String;
    FTotalTime: TTime;

    procedure SetPaused(const Value: Boolean);
    procedure SetTicket(const Value: String);
    procedure SetTotalTime(const Value: TTime);

  public
    IniFile: TIniFile;
    TimeStart: TDateTime;
    OldMinute: Word;

    property Paused: Boolean read FPaused write SetPaused;
    property Ticket: String read FTicket write SetTicket;
    property TotalTime: TTime read FTotalTime write SetTotalTime;

    procedure InitializeVariables;
    procedure LoadLastPosition;
    procedure SaveLastPosition;
    procedure SaveTimeIni;

    function GetTicket(ACloseIfCancel: Boolean = False): String;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses FLog, FTicket, UUtils;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveLastPosition();
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not Paused then
  begin
    if Application.MessageBox('Há uma contagem em andamento.' + sLineBreak +
      'Deseja interrompê-la e fechar o programa?', 'Atenção',
      MB_YESNO + MB_ICONWARNING) = ID_YES then
    begin
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
  Ticket := GetTicket(True);
end;

function TfrmMain.GetTicket(ACloseIfCancel: Boolean = False): String;
begin
  Result := ReadIni('Config', 'Ticket');

  frmTicket.edtTicket.Text := Result;
  frmTicket.ShowModal;
  if (ACloseIfCancel) and (not frmTicket.Confirmed) then
    Close;

  Result := frmTicket.edtTicket.Text;

  TotalTime := GetTotalTime(Result);
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
  Self.FormStyle := fsNormal;
  frmLog.ShowModal;
  Self.FormStyle := fsStayOnTop;
end;

procedure TfrmMain.InitializeVariables;
begin
  OldMinute := 999;
  TimeStart := 0;
  Paused := True;

  try
    IniFile := TIniFile.Create(GetCurrentDir + '/TimerGo.ini');
  except
    on E: Exception do
    begin
      Application.MessageBox('Erro na gravação de arquivos.' + sLineBreak +
        'Por favor, tente executar este programa como administrador.', 'Erro',
        MB_ICONERROR);
      Close;
    end;
  end;
end;

procedure TfrmMain.lblTicketDblClick(Sender: TObject);
begin
  if not Paused then
  begin
    if Application.MessageBox('Há uma contagem em andamento.' + sLineBreak +
      'Deseja interrompê-la e selecionar outro Ticket?', 'Atenção',
      MB_YESNO + MB_ICONWARNING) = ID_YES then
    begin
      Paused := True;
    end
    else
      Exit;
  end;

  Ticket := GetTicket();
end;

procedure TfrmMain.LoadLastPosition;
begin
  if Assigned(IniFile) then
  begin
    Self.Top := StrToIntDef(ReadIni('Config', 'Top'), 0);
    Self.Left := StrToIntDef(ReadIni('Config', 'Left'), 0);
  end;
end;

procedure TfrmMain.pnlRepositionMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(Self.Handle, WM_SYSCOMMAND, $F012, 0);
end;

procedure TfrmMain.SaveLastPosition;
begin
  if Assigned(IniFile) then
  begin
    WriteIni('Config', 'Top', Self.Top.ToString);
    WriteIni('Config', 'Left', Self.Left.ToString);
  end;
end;

procedure TfrmMain.SaveTimeIni;
begin
  if (TimeStart > 0) then
  begin
    WriteIni('Tickets', Ticket, FormatDateTime('DD/MM/YYYY', Now) + '|' +
      FormatDateTime('HH:MM:SS', TimeStart) + '-' + FormatDateTime('HH:MM:SS',
      Now), False);
  end;
end;

procedure TfrmMain.SetPaused(const Value: Boolean);
begin
  FPaused := Value;

  if Paused then
  begin
    Timer.Enabled := False;
    SaveTimeIni();
  end
  else
  begin
    TimeStart := Now;
    Timer.Enabled := True;
  end;

  imgPlay.Visible := Paused;
  imgPause.Visible := not Paused;
  imgRecording.Visible := not Paused;
end;

procedure TfrmMain.SetTicket(const Value: String);
begin
  FTicket := Value;
  WriteIni('Config', 'Ticket', Ticket);

  lblTicket.Caption := Ticket;
end;

procedure TfrmMain.SetTotalTime(const Value: TTime);
begin
  FTotalTime := Value;

  if MinuteOf(TotalTime) <> OldMinute then
  begin
    OldMinute := MinuteOf(TotalTime);

    lblTimer.Caption := HourOf(TotalTime).ToString.PadLeft(2, '0') + ':' +
      MinuteOf(TotalTime).ToString.PadLeft(2, '0');
  end;
end;

procedure TfrmMain.TimerTimer(Sender: TObject);
begin
  TotalTime := TotalTime + StrToTime('00:00:01');
  imgRecording.Visible := not imgRecording.Visible;
end;

end.
