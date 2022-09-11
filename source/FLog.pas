unit FLog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.IniFiles, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons;

type
  TfrmLog = class(TForm)
    pnlTickets: TPanel;
    pnlRecords: TPanel;
    pnlTicketsTitle: TPanel;
    fmtTickets: TFDMemTable;
    fmtRecords: TFDMemTable;
    dsTickets: TDataSource;
    dsRecords: TDataSource;
    pnlClearLog: TPanel;
    pnlTicketsGrid: TPanel;
    dbgTickets: TDBGrid;
    btnClearLog: TSpeedButton;
    pnlRecordsTotal: TPanel;
    lblTotalTime: TLabel;
    lblTotalTimeFix: TLabel;
    dbeTotalTime: TDBEdit;
    dbeTotalTimeFix: TDBEdit;
    pnlRecordsGrid: TPanel;
    dbgRecords: TDBGrid;
    pnlRecordsTitle: TPanel;
    pnlRecordsSubtitle: TPanel;
    pnlTicketsSubtitle: TPanel;
    pnlSubtitleHelp: TPanel;
    pnlSubtitleFix: TPanel;
    pnlSubtitleTest: TPanel;
    pnlSubtitleDevelopment: TPanel;
    pnlSubtitleAnalysis: TPanel;
    lblSubtitle: TLabel;
    fmtRecordsTICKET: TStringField;
    fmtRecordsDATE: TDateField;
    fmtRecordsTIME_START: TTimeField;
    fmtRecordsTIME_END: TTimeField;
    fmtRecordsTOTAL_TIME: TTimeField;
    fmtRecordsTYPE: TStringField;
    pnlSubtitleTicket: TPanel;
    fmtTicketsTICKET: TStringField;
    fmtTicketsTOTAL_TIME: TTimeField;
    fmtTicketsDAYS: TIntegerField;
    fmtTicketsTOTAL_TIME_FIX: TTimeField;
    fmtTicketsDAYS_FIX: TIntegerField;
    fmtTicketsCURRENT: TBooleanField;
    procedure FormShow(Sender: TObject);
    procedure dbgRecordsDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgTicketsDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure btnClearLogClick(Sender: TObject);
    procedure fmtTicketsTOTAL_TIMEGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fmtTicketsTOTAL_TIME_FIXGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Loading: Boolean;

    procedure LoadRecords;
    procedure ColorGridLines(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ClearLog(AOption: Integer);
  public
  end;

var
  frmLog: TfrmLog;

implementation

{$R *.dfm}

uses UUtils, FClearLog, FMain;

procedure TfrmLog.dbgRecordsDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  ColorGridLines(Sender, Rect, DataCol, Column, State);
  ShowScrollBar(dbgRecords.Handle, SB_HORZ, False);
end;

procedure TfrmLog.dbgTicketsDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  ColorGridLines(Sender, Rect, DataCol, Column, State);
  ShowScrollBar(dbgTickets.Handle, SB_HORZ, False);
end;

procedure TfrmLog.fmtTicketsTOTAL_TIMEGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := GetFormattedTime(fmtTicketsTOTAL_TIME.AsDateTime, fmtTicketsDAYS.AsInteger);
end;

procedure TfrmLog.fmtTicketsTOTAL_TIME_FIXGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := GetFormattedTime(fmtTicketsTOTAL_TIME_FIX.AsDateTime, fmtTicketsDAYS_FIX.AsInteger);
end;

procedure TfrmLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormStyle := fsNormal;
end;

procedure TfrmLog.FormCreate(Sender: TObject);
begin
  dbeTotalTime.ControlState := [csFocusing];
  dbeTotalTimeFix.ControlState := [csFocusing];
end;

procedure TfrmLog.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmLog.FormShow(Sender: TObject);
begin
  FormStyle := fsStayOnTop;

  LoadRecords();
  if fmtTickets.Locate('TICKET', frmMain.Ticket, []) then begin
    fmtTickets.Edit;
    fmtTicketsCURRENT.AsBoolean := True;
    fmtTickets.Post;
  end;
end;

procedure TfrmLog.LoadRecords;
var
  vTickets, vRecords: TStrings;
  vTicket: String;
  vIndexTicket, vIndexRecord: Integer;
  vDays: Word;
  vRecordType: TRecordType;
begin
  Loading := True;

  fmtTickets.EmptyDataSet;
  fmtRecords.EmptyDataSet;

  vTickets := TStringList.Create;
  vRecords := TStringList.Create;
  try
    frmMain.IniFile.ReadSection('TICKETS', vTickets);
    vRecords.Delimiter := ';';

    for vIndexTicket := 0 to vTickets.Count - 1 do begin
      vRecords.DelimitedText := ReadIni('TICKETS', vTickets[vIndexTicket]);

      if vRecords.Count = 0 then
        Continue;

      vTicket := vTickets[vIndexTicket];
      vRecordType := StringToRecordType(Copy(vTicket, vTicket.Length, 1));
      Delete(vTicket, vTicket.Length - 1, 2);

      if fmtTickets.Locate('TICKET', vTicket, [loCaseInsensitive]) then
        fmtTickets.Edit
      else
        fmtTickets.Append;

      fmtTicketsTICKET.AsString := vTicket;
      fmtTicketsTOTAL_TIME.AsDateTime := fmtTicketsTOTAL_TIME.AsDateTime +
        GetTotalTime(vTickets[vIndexTicket], vDays);
      fmtTicketsDAYS.AsInteger := fmtTicketsDAYS.AsInteger + vDays;
      if vRecordType = rtFix then begin
        fmtTicketsTOTAL_TIME_FIX.AsDateTime := fmtTicketsTOTAL_TIME_FIX.AsDateTime +
          GetTotalTime(vTickets[vIndexTicket], vDays);
        fmtTicketsDAYS_FIX.AsInteger := vDays;
      end;
      fmtTickets.Post;

      for vIndexRecord := 0 to vRecords.Count - 1 do begin
        fmtRecords.Append;
        fmtRecordsTICKET.AsString := vTicket;
        fmtRecordsDATE.AsDateTime := GetRecordDate(vRecords[vIndexRecord]);
        fmtRecordsTIME_START.AsDateTime := GetRecordTimeStart(vRecords[vIndexRecord]);
        fmtRecordsTIME_END.AsDateTime := GetRecordTimeEnd(vRecords[vIndexRecord]);
        fmtRecordsTOTAL_TIME.AsDateTime := fmtRecordsTIME_END.AsDateTime - fmtRecordsTIME_START.AsDateTime;
        fmtRecordsTYPE.AsString := RecordTypeToString(vRecordType);
        fmtRecords.Post;
      end;
    end;
  finally
    vTickets.Free;
    vRecords.Free;

    Loading := False;
  end;
end;

procedure TfrmLog.btnClearLogClick(Sender: TObject);
begin
  frmClearLog.lblCurrentTicket.Caption := '(' + frmMain.Ticket + ')';
  frmClearLog.lblSelectedTicket.Caption := '(' + fmtTicketsTICKET.AsString + ')';
  frmClearLog.ShowModal;

  if frmClearLog.Option <> 0 then begin
    ClearLog(frmClearLog.Option);
    FormShow(Sender);
  end;
end;

procedure TfrmLog.ClearLog(AOption: Integer);
var
  vTickets: TStrings;
  vIndexTicket: Integer;
begin
  if AOption = 1 then begin
    vTickets := TStringList.Create;
    try
      frmMain.IniFile.ReadSection('TICKETS', vTickets);

      for vIndexTicket := 0 to vTickets.Count - 1 do begin
        if vTickets[vIndexTicket] <> frmMain.Ticket then
          frmMain.IniFile.DeleteKey('TICKETS', vTickets[vIndexTicket]);
      end;
    finally
      vTickets.Free;
    end;
  end
  else if AOption = 2 then begin
    if fmtTicketsTICKET.AsString = frmMain.Ticket then begin
      Application.MessageBox('Não é possível deletar o ticket em andamento.', 'Erro', MB_ICONERROR);
      Exit;
    end;

    frmMain.IniFile.DeleteKey('TICKETS', fmtTicketsTICKET.AsString);
  end;

  Application.MessageBox('Registros deletados com sucesso.', 'Informação', MB_ICONINFORMATION);
end;

procedure TfrmLog.ColorGridLines(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (gdSelected in State) or (gdFocused in State) then begin
    TDBGrid(Sender).Canvas.Brush.Color := $007D7D7D;
    TDBGrid(Sender).Canvas.Font.Color := clWhite;

    if (Sender = dbgTickets) then begin
      if fmtTicketsCURRENT.AsBoolean then
        TDBGrid(Sender).Canvas.Brush.Color := $00FA9600;
    end
    else if (Sender = dbgRecords) then begin
      if fmtRecordsTYPE.AsString = 'A' then
        TDBGrid(Sender).Canvas.Brush.Color := $00C16895
      else if fmtRecordsTYPE.AsString = 'T' then
        TDBGrid(Sender).Canvas.Brush.Color := $0064B5DB
      else if fmtRecordsTYPE.AsString = 'F' then
        TDBGrid(Sender).Canvas.Brush.Color := $006464DB
      else if fmtRecordsTYPE.AsString = 'H' then
        TDBGrid(Sender).Canvas.Brush.Color := $00DB9464;
    end;
  end;

  if not(gdSelected in State) then begin
    TDBGrid(Sender).Canvas.Brush.Color := clWhite;
    TDBGrid(Sender).Canvas.Font.Color := clBlack;

    if (Sender = dbgTickets) then begin
      if fmtTicketsCURRENT.AsBoolean then
        TDBGrid(Sender).Canvas.Brush.Color := $00FFF3DF;
    end
    else if (Sender = dbgRecords) then begin
      if fmtRecordsTYPE.AsString = 'A' then
        TDBGrid(Sender).Canvas.Brush.Color := $00F7DFEB
      else if fmtRecordsTYPE.AsString = 'T' then
        TDBGrid(Sender).Canvas.Brush.Color := $00DCF0FA
      else if fmtRecordsTYPE.AsString = 'F' then
        TDBGrid(Sender).Canvas.Brush.Color := $00DCDCFA
      else if fmtRecordsTYPE.AsString = 'H' then
        TDBGrid(Sender).Canvas.Brush.Color := $00FAE8DC;
    end;
  end;

  TDBGrid(Sender).Canvas.FillRect(Rect);
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
