unit mnDateTime;

interface

uses mnSystem, Windows;

{--------------------------------
  将不完整的日期转换为字符串。
  不完整的日期是指，年、月、日不需要全部指定，没有指定的可传入0。
  如果年、月、日都为0，则返回空串。否则，无论指定了哪些，转换成的字符串都将保持10个字符的固定长度。
  Tested in TestUnit.
 --------------------------------}
function mnIncompleteDateToStr(const Year, Month, Day: Word): string;

{--------------------------------
  根据一个数字和一个时间单位，生成Duration。
  注意：时间单位若是年和月，则生成的Duration只是近似值。
  Tested in TestUnit.
 --------------------------------}
function mnToDuration(const Quantity: Integer; const TimeUnit: mnTTimeUnit): mnTDuration;

{--------------------------------
  将一个Duration转换为字符串，可指定转换成的字符串格式，该格式使用SysUtils.Format。
  Measure指定转换的最大计量尺度。例如，若Measure为tuHour，则“1天8小时29分”将变成“32小时29分”。
  注意：Duration在年和月两个尺度上折算出的数字只是近似值，在日及日以下尺度的数字才是精确值。
  Tested in TestUnit.
 --------------------------------}
function mnDurationToStr(const Format: string; const Duration: mnTDuration; const Measure: mnTTimeUnit): string;

const
{--------------------------------
  以小时为Measure的标准mnDurationToStr格式串。
  Tested in TestUnit.
 --------------------------------}
  mnDurationFormatOnHour = '%d:%.2d''%.2d"%.3d';

const
{--------------------------------
  标准的日期、时间和日期时间字符串的格式。其中时间有时分秒全和仅时分两种。
  Tested in TestUnit.
 --------------------------------}
  mnStdDateFormat = 'yyyy-MM-dd';
  mnStdTimeFormat = 'HH:mm:ss';
  mnStdTimeFormatHM = 'HH:mm';
  mnStdDateTimeFormat = mnStdDateFormat + ' ' + mnStdTimeFormat;
  mnStdDateTimeFormatHM = mnStdDateFormat + ' ' + mnStdTimeFormatHM;

{--------------------------------
  将日期时间转换为标准格式的字符串，使用上述的标准格式。
  MayIgnoreTime表示在只有日期（即时间部分为0）的情况下，是否不转换时间部分（即没有“00:00:00”）。
  HMOnly表示转换成的字符串是否仅有时分（没有秒）。
  Tested in TestUnit.
 --------------------------------}
function mnDateTimeToStdStr(const Value: TDateTime; const MayIgnoreTime: Boolean = False; const HMOnly: Boolean = False): string;
{--------------------------------
  将日期转换为标准格式的字符串，使用上述的标准格式。
  Tested in TestUnit.
 --------------------------------}
function mnDateToStdStr(const Value: TDateTime): string;

{--------------------------------
  设置常规的日期时间格式，即ShortDateFormat和LongTimeFormat。
  另外，还将设置cx系列控件也使用这个格式。
  No test.
 --------------------------------}
procedure mnSetNormalDateTimeFormat(const DateFormat: string = mnStdDateFormat; const TimeFormat: string = mnStdTimeFormat);

{--------------------------------
  将一个FileTime转换为时间格式。
  带Local中转的，表示在转换时先转为本地时间。
  Tested in TestUnit.
 --------------------------------}
function mnFileTimeToDateTime(const FileTime: TFileTime): TDateTime;
function mnFileTimeToLocalToDateTime(const FileTime: TFileTime): TDateTime;

{--------------------------------
  返回指定时刻所在的那一小时的开始时刻、结束时刻，那一分钟的开始时刻、结束时刻，那一秒钟的开始时刻、结束时刻。
  StartOfTheYear、StartOfTheMonth、StartOfTheDay、EndOfTheYear、EndOfTheMonth、EndOfTheDay已在标准DateUtils中实现。
  Tested in TestUnit.
 --------------------------------}
function mnStartOfTheHour  (const Value: TDateTime): TDateTime;
function mnStartOfTheMinute(const Value: TDateTime): TDateTime;
function mnStartOfTheSecond(const Value: TDateTime): TDateTime;

function mnEndOfTheHour  (const Value: TDateTime): TDateTime;
function mnEndOfTheMinute(const Value: TDateTime): TDateTime;
function mnEndOfTheSecond(const Value: TDateTime): TDateTime;

{--------------------------------
  返回指定时刻的下一年、月、日、时、分、秒的开始时刻和结束时刻。
  Tested in TestUnit.
 --------------------------------}
function mnStartOfNextYear  (const Value: TDateTime): TDateTime;
function mnStartOfNextMonth (const Value: TDateTime): TDateTime;
function mnStartOfNextDay   (const Value: TDateTime): TDateTime;
function mnStartOfNextHour  (const Value: TDateTime): TDateTime;
function mnStartOfNextMinute(const Value: TDateTime): TDateTime;
function mnStartOfNextSecond(const Value: TDateTime): TDateTime;

function mnEndOfNextYear  (const Value: TDateTime): TDateTime;
function mnEndOfNextMonth (const Value: TDateTime): TDateTime;
function mnEndOfNextDay   (const Value: TDateTime): TDateTime;
function mnEndOfNextHour  (const Value: TDateTime): TDateTime;
function mnEndOfNextMinute(const Value: TDateTime): TDateTime;
function mnEndOfNextSecond(const Value: TDateTime): TDateTime;

{--------------------------------
  返回指定时刻的上一年、月、日、时、分、秒的开始时刻和结束时刻。
  Tested in TestUnit.
 --------------------------------}
function mnStartOfLastYear  (const Value: TDateTime): TDateTime;
function mnStartOfLastMonth (const Value: TDateTime): TDateTime;
function mnStartOfLastDay   (const Value: TDateTime): TDateTime;
function mnStartOfLastHour  (const Value: TDateTime): TDateTime;
function mnStartOfLastMinute(const Value: TDateTime): TDateTime;
function mnStartOfLastSecond(const Value: TDateTime): TDateTime;

function mnEndOfLastYear  (const Value: TDateTime): TDateTime;
function mnEndOfLastMonth (const Value: TDateTime): TDateTime;
function mnEndOfLastDay   (const Value: TDateTime): TDateTime;
function mnEndOfLastHour  (const Value: TDateTime): TDateTime;
function mnEndOfLastMinute(const Value: TDateTime): TDateTime;
function mnEndOfLastSecond(const Value: TDateTime): TDateTime;

{--------------------------------
  返回指定时刻所在的同一时间单位，或下一时间单位，或上一时间单位的开始时刻和结束时刻。
  Tested in TestUnit.
 --------------------------------}
function mnStartOf    (const Value: TDateTime; const Precision: mnTTimeUnit): TDateTime;
function mnEndOf      (const Value: TDateTime; const Precision: mnTTimeUnit): TDateTime;
function mnStartOfNext(const Value: TDateTime; const Precision: mnTTimeUnit): TDateTime;
function mnEndOfNext  (const Value: TDateTime; const Precision: mnTTimeUnit): TDateTime;
function mnStartOfLast(const Value: TDateTime; const Precision: mnTTimeUnit): TDateTime;
function mnEndOfLast  (const Value: TDateTime; const Precision: mnTTimeUnit): TDateTime;

{--------------------------------
  返回指定时刻所在的那一季度、上一周、上一季度的开始时刻、结束时刻。
  Tested in TestUnit.
 --------------------------------}
function mnStartOfTheQuarter (const Value: TDateTime): TDateTime;
function mnEndOfTheQuarter   (const Value: TDateTime): TDateTime;
function mnStartOfLastWeek   (const Value: TDateTime): TDateTime;
function mnEndOfLastWeek     (const Value: TDateTime): TDateTime;
function mnStartOfLastQuarter(const Value: TDateTime): TDateTime;
function mnEndOfLastQuarter  (const Value: TDateTime): TDateTime;

type
{--------------------------------
  农历日期。
 --------------------------------}
  mnTLunarDate = record
    Year: Word;
    Month: Word;
    Day: Word;
    IsLeapMonth: Boolean;
  end;

{--------------------------------
  将日期转换为农历。
  允许的日期范围为公历1901-2050年，超出范围的日期在转换时将会抛出异常。
  Tested in TestUnit.
 --------------------------------}
function mnDateToLunar(const Value: TDateTime): mnTLunarDate;
{--------------------------------
  将农历日期转换为公历日期。
  允许的日期范围为农历1901-2050年11月18，超出范围的日期在转换时将会抛出异常。
  Tested in TestUnit.
 --------------------------------}
function mnLunarToDate(const LunarDate: mnTLunarDate): TDateTime;

type
{--------------------------------
  十二星座。
 --------------------------------}
  mnTConstellation12 = (ctAries = 1, ctTaurus = 2, ctGemini = 3, ctCancer = 4, ctLeo = 5, ctVirgo = 6,
                        ctLibra = 7, ctScorpio = 8, ctSagittarius = 9, ctCapricorn = 10, ctAquarius = 11, ctPisces = 12);

{--------------------------------
  根据日期判断属于哪个星座。
  Tested in TestUnit.
 --------------------------------}
function mnDateToConstellation12(const Month, Day: Integer): mnTConstellation12;

type
{--------------------------------
  十二生肖。
 --------------------------------}
  mnTAnimal12 = (atRat = 1, atOx = 2, atTiger = 3, atRabbit = 4, atDragon = 5, atSnake = 6,
                 atHorse = 7, atRam = 8, atMonkey = 9, atRooster = 10, atDog = 11, atPig = 12);

{--------------------------------
  根据年份判断属于哪个生肖。
  注意：按照标准，传入的年份应当是农历年。
  Tested in TestUnit.
 --------------------------------}
function mnDateToAnimal12(const Year: Integer): mnTAnimal12;

implementation

uses SysUtils, mnResStrsU, DateUtils, mnDebug, cxFormats, mnMath, Types;

function mnIncompleteDateToStr(const Year, Month, Day: Word): string;
begin
  if Year = 0 then
    if Month = 0 then
      if Day = 0 then Result := ''                                             // 0, 0, 0
                 else Result := Format('       -%.2d',    [Day])               // 0, 0, #
    else
      if Day = 0 then Result := Format('     %.2d-  ',    [Month])             // 0, #, 0
                 else Result := Format('     %.2d-%.2d',  [Month, Day])        // 0, #, #
  else
    if Month = 0 then
      if Day = 0 then Result := Format('%.4d      ',      [Year])              // #, 0, 0
                 else Result := Format('%.4d-  -%.2d',    [Year, Day])         // #, 0, #
    else
      if Day = 0 then Result := Format('%.4d-%.2d   ',    [Year, Month])       // #, #, 0
                 else Result := Format('%.4d-%.2d-%.2d',  [Year, Month, Day]); // #, #, #
end;

function mnToDuration(const Quantity: Integer; const TimeUnit: mnTTimeUnit): mnTDuration;
begin
  case TimeUnit of
    tuYear:   Result := Quantity * ApproxDaysPerYear;
    tuMonth:  Result := Quantity * ApproxDaysPerMonth;
    tuDay:    Result := Quantity;
    tuHour:   Result := Quantity / 24;
    tuMinute: Result := Quantity / (24*60);
    tuSecond: Result := Quantity / (24*60*60);
  else
    mnNeverGoesHere;
    Result := 0;
  end;
end;

function mnDurationToStr(const Format: string; const Duration: mnTDuration; const Measure: mnTTimeUnit): string;
var
  LYear, LMonth, LDay, LHour, LMin, LSec, LMSec: Int64;
begin
  LYear := 0;
  LMonth := 0;
  LDay := 0;
  LHour := 0;
  LMin := 0;
  LSec := 0;
  LMSec := Round(Duration * 24 * 60 * 60 * 1000);

  if Measure <= tuSecond then
  begin
    LSec := LMSec div 1000;
    LMSec := LMSec mod 1000;
  end;
  if Measure <= tuMinute then
  begin
    LMin := LSec div 60;
    LSec := LSec mod 60;
  end;
  if Measure <= tuHour then
  begin
    LHour := LMin div 60;
    LMin := LMin mod 60;
  end;
  if Measure <= tuDay then
  begin
    LDay := LHour div 24;
    LHour := LHour mod 24;
  end;

  if Measure = tuMonth then
  begin
    LMonth := Trunc(LDay / ApproxDaysPerMonth);
    LDay := Round(LDay - LMonth * ApproxDaysPerMonth);
  end
  else if Measure = tuYear then
  begin
    LYear := Trunc(LDay / ApproxDaysPerYear);
    LMonth := Trunc((LDay - LYear * ApproxDaysPerYear) / ApproxDaysPerMonth);
    LDay := Round(LDay - LYear * ApproxDaysPerYear - LMonth * ApproxDaysPerMonth);
  end;

  case Measure of
    tuYear:   Result := SysUtils.Format(Format, [LYear, LMonth, LDay, LHour, LMin, LSec, LMSec]);
    tuMonth:  Result := SysUtils.Format(Format, [LMonth, LDay, LHour, LMin, LSec, LMSec]);
    tuDay:    Result := SysUtils.Format(Format, [LDay, LHour, LMin, LSec, LMSec]);
    tuHour:   Result := SysUtils.Format(Format, [LHour, LMin, LSec, LMSec]);
    tuMinute: Result := SysUtils.Format(Format, [LMin, LSec, LMSec]);
    tuSecond: Result := SysUtils.Format(Format, [LSec, LMSec]);
  else
    mnNeverGoesHere;
  end;
end;

function mnDateTimeToStdStr(const Value: TDateTime; const MayIgnoreTime: Boolean = False; const HMOnly: Boolean = False): string;
var
  Format: string;
begin
  if MayIgnoreTime and mnFloatIsInt(Value)then
    Format := mnStdDateFormat
  else
    Format := mnChooseStr(HMOnly, mnStdDateTimeFormatHM, mnStdDateTimeFormat);
  Result := FormatDateTime(Format, Value);
end;

function mnDateToStdStr(const Value: TDateTime): string;
begin
  Result := FormatDateTime(mnStdDateFormat, Value);
end;

procedure mnSetNormalDateTimeFormat(const DateFormat: string = mnStdDateFormat; const TimeFormat: string = mnStdTimeFormat);
begin
  ShortDateFormat := DateFormat;
  LongTimeFormat := TimeFormat;
  cxFormatController.UseDelphiDateTimeFormats := True;
end;

function mnFileTimeToDateTime(const FileTime: TFileTime): TDateTime;
var
  SystemTime: TSystemTime;
begin
  FileTimeToSystemTime(FileTime, SystemTime);
  Result := SystemTimeToDateTime(SystemTime);
end;

function mnFileTimeToLocalToDateTime(const FileTime: TFileTime): TDateTime;
var
  LocalFileTime: TFileTime;
  SystemTime: TSystemTime;
begin
  FileTimeToLocalFileTime(FileTime, LocalFileTime);
  FileTimeToSystemTime(LocalFileTime, SystemTime);
  Result := SystemTimeToDateTime(SystemTime);
end;

function mnStartOfTheHour  (const Value: TDateTime): TDateTime;
var
  LHour, LMin, LSec, LMSec: Word;
begin
  DecodeTime(Value, LHour, LMin, LSec, LMSec);
  Result := RecodeTime(Value, LHour, 0, 0, 0);
end;

function mnStartOfTheMinute(const Value: TDateTime): TDateTime;
var
  LHour, LMin, LSec, LMSec: Word;
begin
  DecodeTime(Value, LHour, LMin, LSec, LMSec);
  Result := RecodeTime(Value, LHour, LMin, 0, 0);
end;

function mnStartOfTheSecond(const Value: TDateTime): TDateTime;
begin
  Result := RecodeMilliSecond(Value, 0);
end;

function mnEndOfTheHour  (const Value: TDateTime): TDateTime;
var
  LHour, LMin, LSec, LMSec: Word;
begin
  DecodeTime(Value, LHour, LMin, LSec, LMSec);
  Result := RecodeTime(Value, LHour, 59, 59, 999);
end;

function mnEndOfTheMinute(const Value: TDateTime): TDateTime;
var
  LHour, LMin, LSec, LMSec: Word;
begin
  DecodeTime(Value, LHour, LMin, LSec, LMSec);
  Result := RecodeTime(Value, LHour, LMin, 59, 999);
end;

function mnEndOfTheSecond(const Value: TDateTime): TDateTime;
begin
  Result := RecodeMilliSecond(Value, 999);
end;

function mnStartOfNextYear  (const Value: TDateTime): TDateTime;
begin
  Result := EncodeDate(YearOf(Value)+1, 1, 1);
end;

function mnStartOfNextMonth (const Value: TDateTime): TDateTime;
var
  LYear, LMonth, LDay: Word;
begin
  DecodeDate(Value, LYear, LMonth, LDay);
  Result := EncodeDate(LYear, LMonth, DaysInAMonth(LYear, LMonth)) + 1;
end;

function mnStartOfNextDay   (const Value: TDateTime): TDateTime;
begin
  Result := Trunc(Value) + 1;
end;

function mnStartOfNextHour  (const Value: TDateTime): TDateTime;
begin
  Result := mnStartOfTheHour(IncHour(Value, 1));
end;

function mnStartOfNextMinute(const Value: TDateTime): TDateTime;
begin
  Result := mnStartOfTheMinute(IncMinute(Value, 1));
end;

function mnStartOfNextSecond(const Value: TDateTime): TDateTime;
begin
  Result := mnStartOfTheSecond(IncSecond(Value, 1));
end;

function mnEndOfNextYear  (const Value: TDateTime): TDateTime;
begin
  Result := EndOfTheYear(mnStartOfNextYear(Value));
end;

function mnEndOfNextMonth (const Value: TDateTime): TDateTime;
begin
  Result := EndOfTheMonth(mnStartOfNextMonth(Value));
end;

function mnEndOfNextDay   (const Value: TDateTime): TDateTime;
begin
  Result := EndOfTheDay(Value + 1);
end;

function mnEndOfNextHour  (const Value: TDateTime): TDateTime;
begin
  Result := mnEndOfTheHour(IncHour(Value, 1));
end;

function mnEndOfNextMinute(const Value: TDateTime): TDateTime;
begin
  Result := mnEndOfTheMinute(IncMinute(Value, 1));
end;

function mnEndOfNextSecond(const Value: TDateTime): TDateTime;
begin
  Result := mnEndOfTheSecond(IncSecond(Value, 1));
end;

function mnStartOfLastYear  (const Value: TDateTime): TDateTime;
begin
  Result := EncodeDate(YearOf(Value)-1, 1, 1);
end;

function mnStartOfLastMonth (const Value: TDateTime): TDateTime;
begin
  Result := StartOfTheMonth(StartOfTheMonth(Value)-1);
end;

function mnStartOfLastDay   (const Value: TDateTime): TDateTime;
begin
  Result := Trunc(Value) - 1;
end;

function mnStartOfLastHour  (const Value: TDateTime): TDateTime;
begin
  Result := mnStartOfTheHour(IncHour(Value, -1));
end;

function mnStartOfLastMinute(const Value: TDateTime): TDateTime;
begin
  Result := mnStartOfTheMinute(IncMinute(Value, -1));
end;

function mnStartOfLastSecond(const Value: TDateTime): TDateTime;
begin
  Result := mnStartOfTheSecond(IncSecond(Value, -1));
end;

function mnEndOfLastYear  (const Value: TDateTime): TDateTime;
begin
  Result := EndOfTheYear(mnStartOfLastYear(Value));
end;

function mnEndOfLastMonth (const Value: TDateTime): TDateTime;
begin
  Result := EndOfTheMonth(mnStartOfLastMonth(Value));
end;

function mnEndOfLastDay   (const Value: TDateTime): TDateTime;
begin
  Result := EndOfTheDay(Value - 1);
end;

function mnEndOfLastHour  (const Value: TDateTime): TDateTime;
begin
  Result := mnEndOfTheHour(IncHour(Value, -1));
end;

function mnEndOfLastMinute(const Value: TDateTime): TDateTime;
begin
  Result := mnEndOfTheMinute(IncMinute(Value, -1));
end;

function mnEndOfLastSecond(const Value: TDateTime): TDateTime;
begin
  Result := mnEndOfTheSecond(IncSecond(Value, -1));
end;

function mnStartOf    (const Value: TDateTime; const Precision: mnTTimeUnit): TDateTime;
begin
  case Precision of
    tuYear:   Result := StartOfTheYear(Value);
    tuMonth:  Result := StartOfTheMonth(Value);
    tuDay:    Result := StartOfTheDay(Value);
    tuHour:   Result := mnStartOfTheHour(Value);
    tuMinute: Result := mnStartOfTheMinute(Value);
    tuSecond: Result := mnStartOfTheSecond(Value);
  else
    mnNeverGoesHere;
    Result := Value;
  end;
end;

function mnEndOf      (const Value: TDateTime; const Precision: mnTTimeUnit): TDateTime;
begin
  case Precision of
    tuYear:   Result := EndOfTheYear(Value);
    tuMonth:  Result := EndOfTheMonth(Value);
    tuDay:    Result := EndOfTheDay(Value);
    tuHour:   Result := mnEndOfTheHour(Value);
    tuMinute: Result := mnEndOfTheMinute(Value);
    tuSecond: Result := mnEndOfTheSecond(Value);
  else
    mnNeverGoesHere;
    Result := Value;
  end;
end;

function mnStartOfNext(const Value: TDateTime; const Precision: mnTTimeUnit): TDateTime;
begin
  case Precision of
    tuYear:   Result := mnStartOfNextYear(Value);
    tuMonth:  Result := mnStartOfNextMonth(Value);
    tuDay:    Result := mnStartOfNextDay(Value);
    tuHour:   Result := mnStartOfNextHour(Value);
    tuMinute: Result := mnStartOfNextMinute(Value);
    tuSecond: Result := mnStartOfNextSecond(Value);
  else
    mnNeverGoesHere;
    Result := Value;
  end;
end;

function mnEndOfNext  (const Value: TDateTime; const Precision: mnTTimeUnit): TDateTime;
begin
  case Precision of
    tuYear:   Result := mnEndOfNextYear(Value);
    tuMonth:  Result := mnEndOfNextMonth(Value);
    tuDay:    Result := mnEndOfNextDay(Value);
    tuHour:   Result := mnEndOfNextHour(Value);
    tuMinute: Result := mnEndOfNextMinute(Value);
    tuSecond: Result := mnEndOfNextSecond(Value);
  else
    mnNeverGoesHere;
    Result := Value;
  end;
end;

function mnStartOfLast(const Value: TDateTime; const Precision: mnTTimeUnit): TDateTime;
begin
  case Precision of
    tuYear:   Result := mnStartOfLastYear(Value);
    tuMonth:  Result := mnStartOfLastMonth(Value);
    tuDay:    Result := mnStartOfLastDay(Value);
    tuHour:   Result := mnStartOfLastHour(Value);
    tuMinute: Result := mnStartOfLastMinute(Value);
    tuSecond: Result := mnStartOfLastSecond(Value);
  else
    mnNeverGoesHere;
    Result := Value;
  end;
end;

function mnEndOfLast  (const Value: TDateTime; const Precision: mnTTimeUnit): TDateTime;
begin
  case Precision of
    tuYear:   Result := mnEndOfLastYear(Value);
    tuMonth:  Result := mnEndOfLastMonth(Value);
    tuDay:    Result := mnEndOfLastDay(Value);
    tuHour:   Result := mnEndOfLastHour(Value);
    tuMinute: Result := mnEndOfLastMinute(Value);
    tuSecond: Result := mnEndOfLastSecond(Value);
  else
    mnNeverGoesHere;
    Result := Value;
  end;
end;

function mnStartOfTheQuarter (const Value: TDateTime): TDateTime;
var
  LYear, LMonth, LDay: Word;
begin
  DecodeDate(Value, LYear, LMonth, LDay);
  LMonth := (LMonth - 1) div 3 * 3 + 1;
  Result := EncodeDate(LYear, LMonth, 1);
end;

function mnEndOfTheQuarter   (const Value: TDateTime): TDateTime;
var
  LYear, LMonth, LDay: Word;
begin
  DecodeDate(Value, LYear, LMonth, LDay);
  LMonth := (LMonth - 1) div 3 * 3 + 3;
  Result := EndOfTheDay(EncodeDate(LYear, LMonth, DaysInAMonth(LYear, LMonth)));
end;

function mnStartOfLastWeek   (const Value: TDateTime): TDateTime;
begin
  Result := StartOfTheWeek(Value - 7);
end;

function mnEndOfLastWeek     (const Value: TDateTime): TDateTime;
begin
  Result := EndOfTheWeek(Value - 7);
end;

function mnStartOfLastQuarter(const Value: TDateTime): TDateTime;
var
  LYear, LMonth, LDay: Word;
begin
  DecodeDate(Value, LYear, LMonth, LDay);
  LMonth := (LMonth - 1) div 3 * 3 + 1;
  if LMonth = 1 then
  begin
    Dec(LYear);
    LMonth := 10;
  end
  else Dec(LMonth, 3);
  Result := EncodeDate(LYear, LMonth, 1);
end;

function mnEndOfLastQuarter  (const Value: TDateTime): TDateTime;
var
  LYear, LMonth, LDay: Word;
begin
  DecodeDate(Value, LYear, LMonth, LDay);
  LMonth := (LMonth - 1) div 3 * 3 + 3;
  if LMonth = 3 then
  begin
    Dec(LYear);
    LMonth := 12;
  end
  else Dec(LMonth, 3);
  Result := EndOfTheDay(EncodeDate(LYear, LMonth, DaysInAMonth(LYear, LMonth)));
end;

const
{--------------------------------
  农历数据。
  从1901年开始，到2050年，共150年。每年4字节。
  第1个字节的第1个bit：若为1，则该年1月1日位于农历12月，否则位于11月。
  第1个字节的后7个bit：该年1月1日的农历日期。
  第2个字节和第3个字节：共16个bit，分别对应从该年1月1日所在的农历月份算起的按顺序排的16个农历月。
                        bit值为1表示该农历月为大月（有30天），为0表示为小月（有29天）。
  第4个字节：该年第几个农历月是闰月。如为0，表示该年没有闰月。
 --------------------------------}
  LunarData: array [0..599] of Byte = (
    $0b, $52, $ba, $00, $16, $a9, $5d, $00, $83, $a9, $37, $05, $0e, $74, $9b, $00,
    $1a, $b6, $55, $00, $87, $b5, $55, $04, $11, $55, $aa, $00, $1c, $a6, $b5, $00,
    $8a, $a5, $75, $02, $14, $52, $ba, $00, $81, $52, $6e, $06, $0d, $e9, $37, $00,
    $18, $74, $97, $00, $86, $ea, $96, $05, $10, $6d, $55, $00, $1a, $35, $aa, $00,
    $88, $4b, $6a, $02, $13, $a5, $6d, $00, $1e, $d2, $6e, $07, $0b, $d2, $5e, $00,
    $17, $e9, $2e, $00, $84, $d9, $2d, $05, $0f, $da, $95, $00, $19, $5b, $52, $00,
    $87, $56, $d4, $04, $11, $4a, $da, $00, $1c, $a5, $5d, $00, $89, $a4, $bd, $02,
    $15, $d2, $5d, $00, $82, $b2, $5b, $06, $0d, $b5, $2b, $00, $18, $ba, $95, $00,
    $86, $b6, $a5, $05, $10, $56, $b4, $00, $1a, $4a, $da, $00, $87, $49, $ba, $03,
    $13, $a4, $bb, $00, $1e, $b2, $5b, $07, $0b, $72, $57, $00, $16, $75, $2b, $00,
    $84, $6d, $2a, $06, $0f, $ad, $55, $00, $19, $55, $aa, $00, $86, $55, $6c, $04,
    $12, $c9, $76, $00, $1c, $64, $b7, $00, $8a, $e4, $ae, $02, $15, $ea, $56, $00,
    $83, $da, $55, $07, $0d, $5b, $2a, $00, $18, $ad, $55, $00, $85, $aa, $d5, $05,
    $10, $53, $6a, $00, $1b, $a9, $6d, $00, $88, $a9, $5d, $03, $13, $d4, $ae, $00,
    $81, $d4, $ab, $08, $0c, $ba, $55, $00, $16, $5a, $aa, $00, $83, $56, $aa, $06,
    $0f, $aa, $d5, $00, $19, $52, $da, $00, $86, $52, $ba, $04, $11, $a9, $5d, $00,
    $1d, $d4, $9b, $00, $8a, $74, $9b, $03, $15, $b6, $55, $00, $82, $ad, $55, $07,
    $0d, $55, $aa, $00, $18, $a5, $b5, $00, $85, $a5, $75, $05, $0f, $52, $b6, $00,
    $1b, $69, $37, $00, $89, $e9, $37, $04, $13, $74, $97, $00, $81, $ea, $96, $08,
    $0c, $6d, $52, $00, $16, $2d, $aa, $00, $83, $4b, $6a, $06, $0e, $a5, $6d, $00,
    $1a, $d2, $6e, $00, $87, $d2, $5e, $04, $12, $e9, $2e, $00, $1d, $ec, $96, $0a,
    $0b, $da, $95, $00, $15, $5b, $52, $00, $82, $56, $d2, $06, $0c, $2a, $da, $00,
    $18, $a4, $dd, $00, $85, $a4, $bd, $05, $10, $d2, $5d, $00, $1b, $d9, $2d, $00,
    $89, $b5, $2b, $03, $14, $ba, $95, $00, $81, $b5, $95, $08, $0b, $56, $b2, $00,
    $16, $2a, $da, $00, $83, $49, $b6, $05, $0e, $64, $bb, $00, $19, $b2, $5b, $00,
    $87, $6a, $57, $04, $12, $75, $2b, $00, $1d, $b6, $95, $00, $8a, $ad, $55, $02,
    $15, $55, $aa, $00, $82, $55, $6c, $07, $0d, $c9, $76, $00, $17, $64, $b7, $00,
    $86, $e4, $ae, $05, $11, $ea, $56, $00, $1b, $6d, $2a, $00, $88, $5a, $aa, $04,
    $14, $ad, $55, $00, $81, $aa, $d5, $09, $0b, $52, $ea, $00, $16, $a9, $6d, $00,
    $84, $a9, $5d, $06, $0f, $d4, $ae, $00, $1a, $ea, $4d, $00, $87, $ba, $55, $04,
    $12, $5a, $aa, $00, $1d, $ab, $55, $00, $8a, $a6, $d5, $02, $14, $52, $da, $00,
    $82, $52, $ba, $06, $0d, $a9, $3b, $00, $18, $b4, $9b, $00, $85, $74, $9b, $05,
    $11, $b5, $4d, $00, $1c, $d6, $a9, $00, $88, $35, $aa, $03, $13, $a5, $b5, $00,
    $81, $a5, $75, $07, $0b, $52, $b6, $00, $16, $69, $37, $00, $84, $e9, $2f, $06,
    $10, $f4, $97, $00, $1a, $75, $4b, $00, $87, $6d, $52, $05, $11, $2d, $69, $00,
    $1d, $95, $b5, $00, $8a, $a5, $6d, $02, $15, $d2, $6e, $00, $82, $d2, $5e, $07,
    $0e, $e9, $2e, $00, $19, $ea, $96, $00, $86, $da, $95, $05, $10, $5b, $4a, $00,
    $1c, $ab, $69, $00, $88, $2a, $d8, $03
  );

function mnDateToLunar(const Value: TDateTime): mnTLunarDate;
var
  Year, Month, Day: Word;
  LunarDataIndex: Integer;
  B1, B2, B3, B4: Byte;
  NYMonth, NYDay: Word;
  DaysInMonths: array [0..15] of Integer;
  LeapMonth: Word;
  MonthIndex, DayIndex: Integer;
  i: Integer;
begin
  DecodeDate(Value, Year, Month, Day);
  mnCreateErrorIf((Year < 1901) or (Year > 2050), SDateToLunarOutOfRange);

  // 找出对应年份的农历数据
  LunarDataIndex := (Year - 1901) * 4;
  B1 := LunarData[LunarDataIndex];
  B2 := LunarData[LunarDataIndex+1];
  B3 := LunarData[LunarDataIndex+2];
  B4 := LunarData[LunarDataIndex+3];

  // 解析这四个字节的农历数据
  NYMonth := mnChooseInt(mnBitIs1InBinary(B1, 7), 12, 11);
  NYDay := B1 and $7F;
  for i := 1 to 8 do DaysInMonths[i-1] := mnChooseInt(mnBitIs1InBinary(B2, 8-i), 30, 29);
  for i := 1 to 8 do DaysInMonths[i+7] := mnChooseInt(mnBitIs1InBinary(B3, 8-i), 30, 29);
  DaysInMonths[0] := DaysInMonths[0] - NYDay + 1; // 第一个农历月是不满的
  LeapMonth := B4;
  mnAssert(LeapMonth <= 10);

  // 根据公历里是元旦起第几天，在农历里定位需转换的日期
  mnLocateInSections(DayOfTheYear(Value) - 1, DaysInMonths, MonthIndex, DayIndex);

  // 确定农历年
  Result.Year := Year;
  if NYMonth + MonthIndex <= 12 then Result.Year := Result.Year - 1; // 农历上，可能还是在前一年
  // 确定农历月，和是否闰月
  Result.IsLeapMonth := False;
  Result.Month := NYMonth + MonthIndex;
  if Result.Month > 12 then Result.Month := Result.Month - 12; // 折算成实际的农历月
  if LeapMonth > 0 then
    // 若当年有闰月
    if (Result.Year = Year) and (Result.Month > LeapMonth) then
    begin
      // 若当年的闰月已在之前出现
      Result.Month := Result.Month - 1;
      if Result.Month = LeapMonth then Result.IsLeapMonth := True;
    end;
  // 确定农历日
  Result.Day := DayIndex + 1;
  if MonthIndex = 0 then Result.Day := Result.Day + NYDay - 1; // 第一个农历月，因此日期不从1起计
end;

function mnLunarToDate(const LunarDate: mnTLunarDate): TDateTime;
var
  Year: Word;
  LunarDataIndex: Integer;
  B1, B2, B3, B4: Byte;
  NYMonth, NYDay: Word;
  DaysInMonths: array [0..15] of Integer;
  LeapMonth: Word;
  DayOfYear: Integer;
  i: Integer;
  LunarMonth: Word;
  EndOfYearLunarDate: mnTLunarDate;
begin
  mnCreateErrorIf((LunarDate.Year < 1901) or
                  (LunarDate.Year > 2050) or
                  (LunarDate.Year = 2050) and (LunarDate.Month > 11) or
                  (LunarDate.Year = 2050) and (LunarDate.Month = 11) and (LunarDate.Day > 18),
                  SLunarToDateOutOfRange);

  // 其公历年份可能等于农历年，也可能比农历年大1。因此，先要确定其公历年
  EndOfYearLunarDate := mnDateToLunar(EncodeDate(LunarDate.Year, 12, 31));
  if mnCompareValue2D(LunarDate.Month, LunarDate.Day, EndOfYearLunarDate.Month, EndOfYearLunarDate.Day) = GreaterThanValue then
    Year := LunarDate.Year + 1
  else
    Year := LunarDate.Year;

  // 找出对应年份的农历数据
  LunarDataIndex := (Year - 1901) * 4;
  B1 := LunarData[LunarDataIndex];
  B2 := LunarData[LunarDataIndex+1];
  B3 := LunarData[LunarDataIndex+2];
  B4 := LunarData[LunarDataIndex+3];

  // 解析这四个字节的农历数据
  NYMonth := mnChooseInt(mnBitIs1InBinary(B1, 7), 12, 11);
  NYDay := B1 and $7F;
  for i := 1 to 8 do DaysInMonths[i-1] := mnChooseInt(mnBitIs1InBinary(B2, 8-i), 30, 29);
  for i := 1 to 8 do DaysInMonths[i+7] := mnChooseInt(mnBitIs1InBinary(B3, 8-i), 30, 29);
  DaysInMonths[0] := DaysInMonths[0] - NYDay + 1; // 第一个农历月是不满的
  LeapMonth := B4;
  mnAssert(LeapMonth <= 10);

  // 将农历上LunarDate之前的天数加起来，来计算公历里是元旦起第几天
  LunarMonth := LunarDate.Month;
  if Year = LunarDate.Year then
  begin
    if LunarDate.IsLeapMonth then mnAssert(LeapMonth <> 0);
    if LunarDate.IsLeapMonth or ((LeapMonth <> 0) and (LunarDate.Month > LeapMonth)) then
      // 恰是闰月，或当年的闰月已在之前出现
      LunarMonth := LunarMonth + 1;
    // 如果公历年等于农历年，则公历年元旦位于上一个农历年内，因此月份要加上12，这样才能囊括上一个农历年的那些日子
    LunarMonth := LunarMonth + 12;
  end;
  DayOfYear := 0;
  for i := 0 to 15 do
  begin
    if LunarMonth > NYMonth + i then
      // 该农历月已完全度过，因此加上该农历月的所有日子
      Inc(DayOfYear, DaysInMonths[i])
    else if LunarMonth = NYMonth + i then
    begin
      // 正处于该农历月中
      Inc(DayOfYear, LunarDate.Day);
      if i = 0 then DayOfYear := DayOfYear - NYDay + 1; // 第一个农历月，因此日期不从1起计
      Break;
    end;
  end;

  // 根据公历年和元旦起第几天，返回对应的公历日期作为结果
  Result := EncodeDate(Year, 1, 1) + DayOfYear - 1;
end;

function mnDateToConstellation12(const Month, Day: Integer): mnTConstellation12;
begin
  case Month of
     1: if Day <= 19 then Result := ctCapricorn   else Result := ctAquarius;
     2: if Day <= 18 then Result := ctAquarius    else Result := ctPisces;
     3: if Day <= 20 then Result := ctPisces      else Result := ctAries;
     4: if Day <= 20 then Result := ctAries       else Result := ctTaurus;
     5: if Day <= 20 then Result := ctTaurus      else Result := ctGemini;
     6: if Day <= 21 then Result := ctGemini      else Result := ctCancer;
     7: if Day <= 22 then Result := ctCancer      else Result := ctLeo;
     8: if Day <= 22 then Result := ctLeo         else Result := ctVirgo;
     9: if Day <= 22 then Result := ctVirgo       else Result := ctLibra;
    10: if Day <= 22 then Result := ctLibra       else Result := ctScorpio;
    11: if Day <= 21 then Result := ctScorpio     else Result := ctSagittarius;
    12: if Day <= 21 then Result := ctSagittarius else Result := ctCapricorn;
  else
    mnCreateError(SIllegalMonth, [Month]);
    Result := ctVirgo; // never goes here
  end;
end;

function mnDateToAnimal12(const Year: Integer): mnTAnimal12;
begin
  case (Year + 8) mod 12 of
     0: Result := atRat;
     1: Result := atOx;
     2: Result := atTiger;
     3: Result := atRabbit;
     4: Result := atDragon;
     5: Result := atSnake;
     6: Result := atHorse;
     7: Result := atRam;
     8: Result := atMonkey;
     9: Result := atRooster;
    10: Result := atDog;
    11: Result := atPig;
  else
    mnNeverGoesHere;
    Result := atDog; // never goes here
  end;
end;

end.
