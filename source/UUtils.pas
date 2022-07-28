unit UUtils;

interface

uses System.IniFiles, System.SysUtils, System.Classes;

function GetFormattedTime(ATime: TTime; ADays: Word): String;
function GetRecordDate(ARecord: String): TDate;
function GetRecordTimeEnd(ARecord: String): TTime;
function GetRecordTimeStart(ARecord: String): TTime;
function GetTotalTime(ATicket: String; var ADays: Word): TTime;
function iif(ACondition: Boolean; AResultTrue, AResultFalse: Variant): Variant;
function OnlyNumbers(AString: String): String;
function ReadIni(ASection, AIdent: String): String;
procedure WriteIni(ASection, AIdent, AValue: String; AClear: Boolean = True);

const
  IndexSeparatorDate = 11;

const
  IndexSeparatorTime = 20;

implementation

uses
  Vcl.Forms, Winapi.Windows, FMain, System.DateUtils, Vcl.Controls;

function GetFormattedTime(ATime: TTime; ADays: Word): String;
begin
  Result := (HourOf(ATime) + (ADays * 24)).ToString.PadLeft(2, '0') + ':' + //
    MinuteOf(ATime).ToString.PadLeft(2, '0');
end;

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

function GetTotalTime(ATicket: String; var ADays: Word): TTime;
var
  vRecords: TStrings;
  vOldHour: Word;
  vIndexRecords: Integer;
begin
  Result := StrToTime('00:00:00');
  ADays := 0;
  vOldHour := 0;

  vRecords := TStringList.Create;
  try
    vRecords.Delimiter := ';';
    vRecords.DelimitedText := ReadIni('Tickets', ATicket);

    for vIndexRecords := 0 to vRecords.Count - 1 do begin
      Result := Result + GetRecordTimeEnd(vRecords[vIndexRecords]) - GetRecordTimeStart(vRecords[vIndexRecords]);

      if HourOf(Result) < vOldHour then
        ADays := ADays + 1;

      vOldHour := HourOf(Result);
    end;
  finally
    vRecords.Free;
  end;
end;

function iif(ACondition: Boolean; AResultTrue, AResultFalse: Variant): Variant;
begin
  if ACondition then
    Result := AResultTrue
  else
    Result := AResultFalse;
end;

function OnlyNumbers(AString: String): String;
var
  vChar: Integer;
begin
  Result := AString;

  if Result.IsEmpty then
    Exit;

  for vChar := 1 to Result.Length + 1 do begin
    if not StrToIntDef(Result[vChar], -1) in [0..9] then
      Result := StringReplace(Result, Result[vChar], '', [rfReplaceAll, rfIgnoreCase]);
  end;
end;

function ReadIni(ASection, AIdent: String): String;
begin
  Result := frmMain.IniFile.ReadString(UpperCase(ASection), UpperCase(AIdent), '');
end;

procedure WriteIni(ASection, AIdent, AValue: String; AClear: Boolean);
var
  vValue: String;
begin
  if not AClear then begin
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
