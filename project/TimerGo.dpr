program TimerGo;

uses
  Vcl.Forms,
  Windows,
  FMain in '..\source\FMain.pas' {frmMain},
  FLog in '..\source\FLog.pas' {frmLog},
  FTicket in '..\source\FTicket.pas' {frmTicket},
  FClearLog in '..\source\FClearLog.pas' {frmClearLog},
  UUtils in '..\source\UUtils.pas';

{$R *.res}

begin
  CreateMutex(nil, False, 'TimerGo');

  if GetLastError <> ERROR_ALREADY_EXISTS then begin
    Application.Initialize;
    Application.Title := 'TimerGo';
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TfrmMain, frmMain);
    Application.CreateForm(TfrmTicket, frmTicket);
    Application.CreateForm(TfrmLog, frmLog);
    Application.CreateForm(TfrmClearLog, frmClearLog);
    Application.Run;
  end;
end.
