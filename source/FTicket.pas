unit FTicket;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, PRadioButton, Vcl.Imaging.pngimage,
  System.ImageList, Vcl.ImgList, PLabel, Vcl.AppEvnts, UUtils;

type
  TfrmTicket = class(TForm)
    pnlMain: TPanel;
    pnlTitle: TPanel;
    pnlTicket: TPanel;
    edtTicket: TEdit;
    pnlOptions: TPanel;
    gbType: TGroupBox;
    rbAnalysis: TPRadioButton;
    rbDevelopment: TPRadioButton;
    rbTest: TPRadioButton;
    rbFix: TPRadioButton;
    rbHelp: TPRadioButton;
    pnlType: TPanel;
    imgConfirm: TImage;
    imgCancel: TImage;
    lblCancel: TPLabel;
    lblConfirm: TPLabel;
    pnlShortcuts: TPanel;
    ApplicationEvents: TApplicationEvents;
    procedure FormShow(Sender: TObject);
    procedure edtTicketKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtTicketChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtTicketKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtTicketKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure imgCancelClick(Sender: TObject);
    procedure lblCancelClick(Sender: TObject);
    procedure lblConfirmClick(Sender: TObject);
    procedure imgConfirmClick(Sender: TObject);
  private
    CtrlA, CtrlC, CtrlV: Boolean;
    procedure SetRecordType(const Value: TRecordType);
    function GetRecordType: TRecordType;
  public
    Confirmed: Boolean;
    procedure Confirm;
    procedure Cancel;
    procedure SelectNextType;

    property RecordType: TRecordType read GetRecordType write SetRecordType;
  end;

var
  frmTicket: TfrmTicket;

implementation

{$R *.dfm}

procedure TfrmTicket.ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
begin
  if (Msg.message = WM_KEYDOWN) and (Msg.wParam = VK_TAB) then begin
    SelectNextType();
    Handled := True;
  end;
end;

procedure TfrmTicket.Cancel;
begin
  Confirmed := False;
  Close;
end;

procedure TfrmTicket.Confirm;
begin
  if edtTicket.Text = '' then begin
    Application.MessageBox('Por favor, informe um ticket para registrar o tempo.', 'Atenção', MB_ICONWARNING);
    edtTicket.SetFocus;
    Abort;
  end;

  Confirmed := True;
  Close;
end;

procedure TfrmTicket.edtTicketChange(Sender: TObject);
begin
  edtTicket.Text := OnlyNumbers(edtTicket.Text);
end;

procedure TfrmTicket.edtTicketKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CtrlA := (Shift = [ssCtrl]) and (Key = 65);
  CtrlC := (Shift = [ssCtrl]) and (Key = 67);
  CtrlV := (Shift = [ssCtrl]) and (Key = 86);
end;

procedure TfrmTicket.edtTicketKeyPress(Sender: TObject; var Key: Char);
begin
  if not((StrToIntDef(Key, -1) in [0 .. 9]) or (Key = #8) or (CtrlA or CtrlC or CtrlV)) then begin
    Key := #0;
  end;
end;

procedure TfrmTicket.edtTicketKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CtrlA := False;
  CtrlC := False;
  CtrlV := False;
end;

procedure TfrmTicket.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormStyle := fsNormal;
end;

procedure TfrmTicket.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Confirm()
  else if Key = VK_ESCAPE then
    Cancel();
end;

procedure TfrmTicket.FormShow(Sender: TObject);
begin
  FormStyle := fsStayOnTop;

  Confirmed := False;

  edtTicket.SetFocus;
  edtTicket.SelectAll;
end;

function TfrmTicket.GetRecordType: TRecordType;
begin
  if rbAnalysis.Checked then
    Result := rtAnalysis
  else if rbDevelopment.Checked then
    Result := rtDevelopment
  else if rbTest.Checked then
    Result := rtTest
  else if rbFix.Checked then
    Result := rtFix
  else if rbHelp.Checked then
    Result := rtHelp;
end;

procedure TfrmTicket.imgCancelClick(Sender: TObject);
begin
  Cancel();
end;

procedure TfrmTicket.imgConfirmClick(Sender: TObject);
begin
  Confirm();
end;

procedure TfrmTicket.lblCancelClick(Sender: TObject);
begin
  Cancel();
end;

procedure TfrmTicket.lblConfirmClick(Sender: TObject);
begin
  Confirm();
end;

procedure TfrmTicket.SelectNextType;
begin
  case RecordType of
    rtAnalysis: RecordType := rtDevelopment;
    rtDevelopment: RecordType := rtTest;
    rtTest: RecordType := rtFix;
    rtFix: RecordType := rtHelp;
    rtHelp: RecordType := rtAnalysis;
  end;
end;

procedure TfrmTicket.SetRecordType(const Value: TRecordType);
begin
  case Value of
    rtAnalysis: rbAnalysis.Checked := True;
    rtDevelopment: rbDevelopment.Checked := True;
    rtTest: rbTest.Checked := True;
    rtFix: rbFix.Checked := True;
    rtHelp: rbHelp.Checked := True;
  end;
end;

end.
