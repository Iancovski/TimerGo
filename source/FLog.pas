unit FLog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.IniFiles,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons;

type
  TfrmLog = class(TForm)
    pnlTickets: TPanel;
    pnlRecords: TPanel;
    pnlTicketsTitle: TPanel;
    pnlRecordsTitle: TPanel;
    fmtTickets: TFDMemTable;
    fmtRecords: TFDMemTable;
    dsTickets: TDataSource;
    dsRecords: TDataSource;
    pnlClearLog: TPanel;
    pnlRecordsTotal: TPanel;
    dbeTotalTime: TDBEdit;
    lblTotalTime: TLabel;
    fmtTicketsTICKET: TStringField;
    fmtTicketsTOTAL_TIME: TTimeField;
    fmtRecordsTICKET: TStringField;
    fmtRecordsDATE: TDateField;
    fmtRecordsTIME_START: TTimeField;
    fmtRecordsTIME_END: TTimeField;
    fmtRecordsTOTAL_TIME: TTimeField;
    pnlTicketsGrid: TPanel;
    dbgTickets: TDBGrid;
    pnlRecordsGrid: TPanel;
    dbgRecords: TDBGrid;
    btnClearLog: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure dbgRecordsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgTicketsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure fmtTicketsAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btnClearLogClick(Sender: TObject);
  private
    procedure LoadRecords;
    procedure ColorGridLines(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ClearLog(AOption: Integer);
  public
  end;

var
  frmLog: TfrmLog;

implementation

{$R *.dfm}

uses UUtils, FClearLog, FMain;

procedure TfrmLog.dbgRecordsDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ColorGridLines(Sender, Rect, DataCol, Column, State);
end;

procedure TfrmLog.dbgTicketsDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ColorGridLines(Sender, Rect, DataCol, Column, State);
end;

procedure TfrmLog.fmtTicketsAfterScroll(DataSet: TDataSet);
begin
  if fmtRecords.RecordCount > 1 then
    dbgRecords.Columns[dbgRecords.FieldCount - 1].Width := 150
  else
    dbgRecords.Columns[dbgRecords.FieldCount - 1].Width := 167;
end;

procedure TfrmLog.FormCreate(Sender: TObject);
begin
  dbeTotalTime.ControlState := [csFocusing];
end;

procedure TfrmLog.FormShow(Sender: TObject);
begin
  LoadRecords();

  if fmtTickets.RecordCount > 1 then
    dbgTickets.Columns[dbgTickets.FieldCount - 1].Width := 150
  else
    dbgTickets.Columns[dbgTickets.FieldCount - 1].Width := 167;

  dbgTickets.SetFocus;
end;

procedure TfrmLog.LoadRecords;
var
  vTickets, vRecords: TStrings;
  vIndexTicket, vIndexRecord: Integer;
begin
  fmtTickets.EmptyDataSet;
  fmtRecords.EmptyDataSet;

  vTickets := TStringList.Create;
  vRecords := TStringList.Create;
  try
    frmMain.IniFile.ReadSection('TICKETS', vTickets);
    vRecords.Delimiter := ';';

    for vIndexTicket := 0 to vTickets.Count - 1 do
    begin
      vRecords.DelimitedText := ReadIni('Tickets', vTickets[vIndexTicket]);

      if vRecords.Count = 0 then
        Continue;

      fmtTickets.Append;
      fmtTicketsTICKET.AsString := vTickets[vIndexTicket];
      fmtTicketsTOTAL_TIME.AsDateTime :=
        GetTotalTime(fmtTicketsTICKET.AsString);
      fmtTickets.Post;

      for vIndexRecord := 0 to vRecords.Count - 1 do
      begin
        fmtRecords.Append;
        fmtRecordsTICKET.AsString := vTickets[vIndexTicket];
        fmtRecordsDATE.AsDateTime := GetRecordDate(vRecords[vIndexRecord]);
        fmtRecordsTIME_START.AsDateTime :=
          GetRecordTimeStart(vRecords[vIndexRecord]);
        fmtRecordsTIME_END.AsDateTime :=
          GetRecordTimeEnd(vRecords[vIndexRecord]);
        fmtRecordsTOTAL_TIME.AsDateTime := fmtRecordsTIME_END.AsDateTime -
          fmtRecordsTIME_START.AsDateTime;
        fmtRecords.Post;
      end;
    end;

    fmtTickets.Locate('TICKET', frmMain.Ticket, []);
  finally
    vTickets.Free;
    vRecords.Free;
  end;
end;

procedure TfrmLog.btnClearLogClick(Sender: TObject);
begin
  frmClearLog.lblCurrentTicket.Caption := '(' + frmMain.Ticket + ')';
  frmClearLog.lblSelectedTicket.Caption := '(' +
    fmtTicketsTICKET.AsString + ')';
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
  if AOption = 1 then
  begin
    vTickets := TStringList.Create;
    try
      frmMain.IniFile.ReadSection('TICKETS', vTickets);

      for vIndexTicket := 0 to vTickets.Count - 1 do
      begin
        if vTickets[vIndexTicket] <> frmMain.Ticket then
          frmMain.IniFile.DeleteKey('TICKETS', vTickets[vIndexTicket]);
      end;
    finally
      vTickets.Free;
    end;
  end
  else if AOption = 2 then
  begin
    if fmtTicketsTICKET.AsString = frmMain.Ticket then
    begin
      Application.MessageBox('Não é possível deletar o ticket em andamento.',
        'Erro', MB_ICONERROR);
      Exit;
    end;

    frmMain.IniFile.DeleteKey('TICKETS', fmtTicketsTICKET.AsString);
  end;

  Application.MessageBox('Registros deletados com sucesso.', 'Informação',
    MB_ICONINFORMATION);
end;

procedure TfrmLog.ColorGridLines(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (gdSelected in State) or (gdFocused in State) then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := $00F5951D;
    TDBGrid(Sender).Canvas.Font.Color := clWhite;
  end;

  if not(gdSelected in State) then
  begin
    if Odd(TDBGrid(Sender).DataSource.DataSet.RecNo) then
      TDBGrid(Sender).Canvas.Brush.Color := clWhite
    else
      TDBGrid(Sender).Canvas.Brush.Color := $00F8F8F8;
  end;

  TDBGrid(Sender).Canvas.FillRect(Rect);
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
