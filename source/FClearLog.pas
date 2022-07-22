unit FClearLog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmClearLog = class(TForm)
    pnlMain: TPanel;
    pnlTitle: TPanel;
    pnlOptions: TPanel;
    btnDeleteAllExceptCurrent: TSpeedButton;
    DeleteSelectedOnly: TSpeedButton;
    lblCurrentTicket: TLabel;
    lblSelectedTicket: TLabel;
    pnlSpaceUp: TPanel;
    pnlSpaceBottom: TPanel;
    procedure btnDeleteAllExceptCurrentClick(Sender: TObject);
    procedure DeleteSelectedOnlyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    Option: Integer;
  end;

var
  frmClearLog: TfrmClearLog;

implementation

{$R *.dfm}

procedure TfrmClearLog.btnDeleteAllExceptCurrentClick(Sender: TObject);
begin
  Option := 1;
  Close;
end;

procedure TfrmClearLog.DeleteSelectedOnlyClick(Sender: TObject);
begin
  Option := 2;
  Close;
end;

procedure TfrmClearLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormStyle := fsNormal;
end;

procedure TfrmClearLog.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmClearLog.FormShow(Sender: TObject);
begin
  FormStyle := fsStayOnTop;

  Option := 0;
end;

end.
