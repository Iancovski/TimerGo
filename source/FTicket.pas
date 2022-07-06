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
    lblConfirm: TLabel;
    lblCancel: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
  public
    Confirmed: Boolean;
  end;

var
  frmTicket: TfrmTicket;

implementation

{$R *.dfm}

procedure TfrmTicket.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if edtTicket.Text = '' then
    begin
      Application.MessageBox
        ('Por favor, informe um ticket para registrar o tempo.', 'Atenção',
        MB_ICONWARNING);
      edtTicket.SetFocus;
      Abort;
    end;

    Confirmed := True;
    Close;
  end
  else if Key = VK_ESCAPE then
  begin
    Confirmed := False;
    Close;
  end;
end;

procedure TfrmTicket.FormShow(Sender: TObject);
begin
  Confirmed := False;
end;

end.
