program TimerGo;

uses
  Vcl.Forms,
  FMain in '..\source\FMain.pas' {frmMain},
  FLog in '..\source\FLog.pas' {frmLog},
  FTicket in '..\source\FTicket.pas' {frmTicket},
  UUtils in '..\source\UUtils.pas',
  FClearLog in '..\source\FClearLog.pas' {frmClearLog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmLog, frmLog);
  Application.CreateForm(TfrmTicket, frmTicket);
  Application.CreateForm(TfrmClearLog, frmClearLog);
  Application.Run;
end.
