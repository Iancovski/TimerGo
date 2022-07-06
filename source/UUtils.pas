unit UUtils;

interface

uses System.IniFiles, System.SysUtils, System.Classes;

function GetRecordDate(ARecord: String): TDate;
function GetRecordTimeEnd(ARecord: String): TTime;
function GetRecordTimeStart(ARecord: String): TTime;
function GetTotalTime(ATicket: String): TTime;
function ReadIni(ASection, AIdent: String): String;
procedure WriteIni(ASection, AIdent, AValue: String; AClear: Boolean = True);

const
  IndexSeparatorDate = 11;

const
  IndexSeparatorTime = 20;

implementation

uses
  Vcl.Forms, Winapi.Windows, FMain;

function GetRecordDate(ARecord: String): TDate;
begin
  Result := StrToDate(Copy(ARecord, 0, IndexSeparatorDate - 1));
end;

function GetRecordTimeEnd(ARecord: String): TTime;
begin
  Result := StrToTime(Copy(ARecord, IndexSeparatorTime + 1, 8));
end;

function GetRecordTimeStart(ARecord: String): TTime;
begin
  Result := StrToTime(Copy(ARecord, IndexSeparatorDate + 1, 8));
end;

function GetTotalTime(ATicket: String): TTime;
var
  vRecords: TStrings;
  vIndexRecords: Integer;
begin
  Result := StrToTime('00:00:00');

  vRecords := TStringList.Create;
  try
    vRecords.Delimiter := ';';
    vRecords.DelimitedText := ReadIni('Tickets', ATicket);

    for vIndexRecords := 0 to vRecords.Count - 1 do
    begin
      Result := Result + GetRecordTimeEnd(vRecords[vIndexRecords]) -
        GetRecordTimeStart(vRecords[vIndexRecords]);
    end;
  finally
    vRecords.Free;
  end;
end;

function ReadIni(ASection, AIdent: String): String;
begin
  Result := frmMain.IniFile.ReadString(UpperCase(ASection),
    UpperCase(AIdent), '');
end;

procedure WriteIni(ASection, AIdent, AValue: String; AClear: Boolean);
var
  vValue: String;
begin
  if not AClear then
  begin
    vValue := ReadIni(ASection, AIdent);
    if vValue <> '' then
      vValue := vValue + ';' + AValue
    else
      vValue := AValue;
  end
  else
    vValue := AValue;

  frmMain.IniFile.WriteString(UpperCase(ASection), UpperCase(AIdent), vValue);
end;

end.
