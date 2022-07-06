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
    procedure btnDeleteAllExceptCurrentClick(Sender: TObject);
    procedure DeleteSelectedOnlyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

procedure TfrmClearLog.FormShow(Sender: TObject);
begin
  Option := 0;
end;

end.
