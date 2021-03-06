unit FTicket;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmTicket = class(TForm)
    pnlMain: TPanel;
    pnlTitle: TPanel;
    pnlTicket: TPanel;
    edtTicket: TEdit;
    pnlShortcuts: TPanel;
    lblFix: TLabel;
    chkFix: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure edtTicketKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtTicketChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    Confirmed: Boolean;
  end;

var
  frmTicket: TfrmTicket;

implementation

{$R *.dfm}

procedure TfrmTicket.edtTicketChange(Sender: TObject);
begin
  chkFix.Checked := False;
end;

procedure TfrmTicket.edtTicketKeyPress(Sender: TObject; var Key: Char);
begin
  if not((StrToIntDef(Key, -1) in [0 .. 9]) or (Key = #8)) then begin
    Key := #0;
  end;
end;

procedure TfrmTicket.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormStyle := fsNormal;
end;

procedure TfrmTicket.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
    if edtTicket.Text = '' then begin
      Application.MessageBox('Por favor, informe um ticket para registrar o tempo.', 'Aten??o', MB_ICONWARNING);
      edtTicket.SetFocus;
      Abort;
    end;

    Confirmed := True;
    Close;
  end
  else if Key = VK_ESCAPE then begin
    Confirmed := False;
    Close;
  end
  else if Key = 70 { F } then begin
    chkFix.Checked := not chkFix.Checked;
  end;
end;

procedure TfrmTicket.FormShow(Sender: TObject);
begin
  FormStyle := fsStayOnTop;

  Confirmed := False;
end;

end.
