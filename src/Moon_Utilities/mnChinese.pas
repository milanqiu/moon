unit mnChinese;

interface

uses mnSystem, mnDateTime;

{--------------------------------
  将一位数转换成中文。例如，“0”转为“零”，“6”转为“六”。
  Capital表示是否大写，大写中文如“壹贰叁”。
  Zero表示“0”转为什么，缺省是“零”，但有时有别的需求，比如转成“〇”。
  如果Digit不在0-9内，将抛出异常。
  Tested in TestUnit.
 --------------------------------}
function mnChineseDigit(const Digit: Integer; const Capital: Boolean = False; const Zero: string = '零'): string;

{--------------------------------
  将一个数字逐位转换成中文。例如，“5403”转为“五四零三”。
  Capital表示是否大写，大写中文如“壹贰叁”。
  Zero表示“0”转为什么，缺省是“零”，但有时有别的需求，比如转成“〇”。
  Tested in TestUnit.
 --------------------------------}
function mnChineseNumber(const Value: Integer; const Capital: Boolean = False; const Zero: string = '零'): string;
{--------------------------------
  将一个整数转换成中文。例如，“5403”转为“五千四百零三”。
  Capital表示是否大写，大写中文如“壹贰叁”。
  Zero表示“0”转为什么，缺省是“零”，但有时有别的需求，比如转成“〇”。
  Tested in TestUnit.
 --------------------------------}
function mnChineseInt(const Value: Integer; const Capital: Boolean = False; const Zero: string = '零'): string;

{--------------------------------
  将一个日期转换成中文。例如，“1982-10-29”转为“一九八二年十月二十九日”。
  也就是说，年使用数字逐位方式转换，月和日使用整数方式转换。
  Capital表示是否大写，大写中文如“壹贰叁”。
  Zero表示“0”转为什么，缺省是“零”，但有时有别的需求，比如转成“〇”。
  Tested in TestUnit.
 --------------------------------}
function mnChineseDate(const Value: TDateTime; const Capital: Boolean = False; const Zero: string = '零'): string;

{--------------------------------
  将一个浮点数转换成以万表示的中文。例如，“87654320”转为“8765.43万”。
  DecimalDigits表示转换成字符串时，保留的小数位数。如果是-1，说明不做任何舍入操作。
  Tested in TestUnit.
 --------------------------------}
function mnFloatToWanStr  (const Value: Extended; const DecimalDigits: Integer = -1): string;
{--------------------------------
  将一个浮点数转换成以亿表示的中文。例如，“876543200000”转为“8765.43亿”。
  DecimalDigits表示转换成字符串时，保留的小数位数。如果是-1，说明不做任何舍入操作。
  Tested in TestUnit.
 --------------------------------}
function mnFloatToYiStr   (const Value: Extended; const DecimalDigits: Integer = -1): string;
{--------------------------------
  将一个浮点数根据其大小，转换为以万表示或以亿表示的中文。大于1亿或小于负1亿，以亿表示，否则以万表示。
  DecimalDigits表示转换成字符串时，保留的小数位数。如果是-1，说明不做任何舍入操作。
  Tested in TestUnit.
 --------------------------------}
function mnFloatToWanYiStr(const Value: Extended; const DecimalDigits: Integer = -1): string;

{--------------------------------
  将以万表示或以亿表示的中文，转换为浮点数。
  Tested in TestUnit.
 --------------------------------}
function mnWanYiStrToFloat(const S: string): Extended;

{--------------------------------
  将一个时间单位转换为中文表示。
  ForDuration表示该中文表示是否用于指示一段持续时间。
  若ForDuration为True，六个时间单位将分别转换为“年”、“个月”、“天”、“小时”、“分钟”、“秒”。
  否则，转换为标准表示“年”、“月”、“日”、“时”、“分”、“秒”。
  Tested in TestUnit.
 --------------------------------}
function mnTimeUnitToChinese(const TimeUnit: mnTTimeUnit; const ForDuration: Boolean = False): string;

{--------------------------------
  将一个农历日期转换为中文表示。
  Capital表示是否大写，大写中文如“壹贰叁”。
  Zero表示“0”转为什么，缺省是“零”，但有时有别的需求，比如转成“〇”。

  允许不完整的农历日期。
  不完整的农历日期是指，年、月、日不需要全部指定，没有指定的可传入0。
  如果年、月、日都为0，则返回空串。

  Tested in TestUnit.
 --------------------------------}
function mnLunarDateToChinese(const LunarDate: mnTLunarDate; const Capital: Boolean = False; const Zero: string = '零'): string;

{--------------------------------
  将一个星座转换为中文表示。
  Tested in TestUnit.
 --------------------------------}
function mnConstellation12ToChinese(const Constellation12: mnTConstellation12): string;

{--------------------------------
  将一个生肖转换为中文表示。
  Tested in TestUnit.
 --------------------------------}
function mnAnimal12ToChinese(const Animal12: mnTAnimal12): string;

implementation

uses mnResStrsU, SysUtils, StrUtils, Math, mnString, mnDebug;

function mnChineseDigit(const Digit: Integer; const Capital: Boolean = False; const Zero: string = '零'): string;
begin
  if Capital then
  begin
    case Digit of
      0: Result := Zero;
      1: Result := '壹';
      2: Result := '贰';
      3: Result := '叁';
      4: Result := '肆';
      5: Result := '伍';
      6: Result := '陆';
      7: Result := '柒';
      8: Result := '捌';
      9: Result := '玖';
    else
      mnCreateError(SDigitNotIn0To9, [Digit]);
    end;
  end
  else
  begin
    case Digit of
      0: Result := Zero;
      1: Result := '一';
      2: Result := '二';
      3: Result := '三';
      4: Result := '四';
      5: Result := '五';
      6: Result := '六';
      7: Result := '七';
      8: Result := '八';
      9: Result := '九';
    else
      mnCreateError(SDigitNotIn0To9, [Digit]);
    end;
  end;
end;

function mnChineseNumber(const Value: Integer; const Capital: Boolean = False; const Zero: string = '零'): string;
var
  VarValue: Integer;
  Negative: Boolean;
begin
  Result := '';
  VarValue := Value;
  Negative := VarValue < 0;
  if Negative then VarValue := -VarValue;

  while VarValue > 0 do
  begin
    Result := mnChineseDigit(VarValue mod 10, Capital, Zero) + Result;
    VarValue := VarValue div 10;
  end;
  if Result = '' then Result := Zero;

  if Negative then Result := '负' + Result;
end;

function mnChineseInt(const Value: Integer; const Capital: Boolean = False; const Zero: string = '零'): string;
var
  VarValue: Integer;
  Negative: Boolean;
  ZeroLen: Integer;
begin
  Result := '';
  VarValue := Value;
  Negative := VarValue < 0;
  if Negative then VarValue := -VarValue;
  ZeroLen := Length(Zero);

  if VarValue >= 100000000 then
  begin
    Result := Result + mnChineseInt(VarValue div 100000000, Capital, Zero) + mnChooseStr(Capital, '億', '亿');
    VarValue := VarValue mod 100000000;
  end;
  if VarValue >= 10000 then
  begin
    Result := Result + mnChineseInt(VarValue div 10000, Capital, Zero) + mnChooseStr(Capital, '萬', '万');
    VarValue := VarValue mod 10000;
  end
  else if Result <> '' then Result := Result + Zero;
  if VarValue >= 1000 then
  begin
    Result := Result + mnChineseDigit(VarValue div 1000, Capital, Zero) + mnChooseStr(Capital, '仟', '千');
    VarValue := VarValue mod 1000;
  end
  else if (Result <> '') and not mnEndsStr(Zero, Result) then Result := Result + Zero;
  if VarValue >= 100 then
  begin
    Result := Result + mnChineseDigit(VarValue div 100, Capital, Zero) + mnChooseStr(Capital, '佰', '百');
    VarValue := VarValue mod 100;
  end
  else if (Result <> '') and not mnEndsStr(Zero, Result) then Result := Result + Zero;
  if VarValue >= 10 then
  begin
    Result := Result + mnChineseDigit(VarValue div 10, Capital, Zero) + mnChooseStr(Capital, '拾', '十');
    VarValue := VarValue mod 10;
  end
  else if (Result <> '') and not mnEndsStr(Zero, Result) then Result := Result + Zero;
  if VarValue > 0 then
    Result := Result + mnChineseDigit(VarValue, Capital, Zero)
  else if Result = '' then
    Result := Zero;

  // if no leading characters, “一十” can be reduced to “十”
  if (LeftBStr(Result, 4) = '一十') or (LeftBStr(Result, 4) = '壹拾') then Result := Copy(Result, 3);
  // if there is leading characters, last “零” is ignored
  if (Length(Result) <> ZeroLen) and mnEndsStr(Zero, Result) then Result := mnTruncBRight(Result, ZeroLen);

  if Negative then Result := '负' + Result;
end;

function mnChineseDate(const Value: TDateTime; const Capital: Boolean = False; const Zero: string = '零'): string;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Value, Year, Month, Day);
  Result := Format('%s年%s月%s日', [mnChineseNumber(Year, Capital, Zero),
                                    mnChineseInt(Month, Capital, Zero),
                                    mnChineseInt(Day, Capital, Zero)]);
end;

function mnFloatToWanStr  (const Value: Extended; const DecimalDigits: Integer = -1): string;
begin
  Result := mnFloatToStr(Value/10000, DecimalDigits) + '万';
end;

function mnFloatToYiStr   (const Value: Extended; const DecimalDigits: Integer = -1): string;
begin
  Result := mnFloatToStr(Value/100000000, DecimalDigits) + '亿';
end;

function mnFloatToWanYiStr(const Value: Extended; const DecimalDigits: Integer = -1): string;
begin
  if (Value >= 100000000) or (Value <= -100000000) then
    Result := mnFloatToYiStr(Value, DecimalDigits)
  else
    Result := mnFloatToWanStr(Value, DecimalDigits);
end;

function mnWanYiStrToFloat(const S: string): Extended;
var
  varS: string;
  BasicUnit: string;
begin
  varS := mnDiscardDelimiter(', ', S);
  BasicUnit := RightBStr(varS, 2);
  if BasicUnit = '万' then
  begin
    varS := mnTruncBRight(varS, 2);
    Result := SimpleRoundTo(StrToFloat(varS) * 10000, -10);
  end
  else if BasicUnit = '亿' then
  begin
    varS := mnTruncBRight(varS, 2);
    Result := SimpleRoundTo(StrToFloat(varS) * 100000000, -6);
  end
  else
  begin
    mnCreateError(SWrongWanYiStrFormat, [S]);
    Result := 0;
  end;
end;

function mnTimeUnitToChinese(const TimeUnit: mnTTimeUnit; const ForDuration: Boolean = False): string;
begin
  case TimeUnit of
    tuYear:   Result := mnChooseStr(ForDuration, '年',   '年');
    tuMonth:  Result := mnChooseStr(ForDuration, '个月', '月');
    tuDay:    Result := mnChooseStr(ForDuration, '天',   '日');
    tuHour:   Result := mnChooseStr(ForDuration, '小时', '时');
    tuMinute: Result := mnChooseStr(ForDuration, '分钟', '分');
    tuSecond: Result := mnChooseStr(ForDuration, '秒',   '秒');
  else
    mnCreateError(SIllegalTimeUnit);
  end;
end;

function mnLunarDateToChinese(const LunarDate: mnTLunarDate; const Capital: Boolean = False; const Zero: string = '零'): string;
begin
  if LunarDate.Year = 0 then
    Result := ''
  else
    Result := mnChineseNumber(LunarDate.Year, Capital, Zero) + '年';

  if LunarDate.Month = 0 then
    Result := Result + mnChooseStr(LunarDate.Day = 0, '', '某月')
  else
  begin
    if LunarDate.IsLeapMonth then Result := Result + '闰';
    if (LunarDate.Month = 1) and not LunarDate.IsLeapMonth then
      Result := Result + '正月'
    else
      Result := Result + mnChineseInt(LunarDate.Month, Capital, Zero) + '月';
  end;

  if LunarDate.Day = 0 then
    Result := Result + ''
  else
  begin
    if mnBetweenII(LunarDate.Day, 21, 29) then
    begin
      Result := Result + '廿';
      Result := Result + mnChineseInt(LunarDate.Day mod 10, Capital, Zero);
    end
    else
    begin
      if LunarDate.Day <= 10 then Result := Result + '初';
      Result := Result + mnChineseInt(LunarDate.Day, Capital, Zero);
    end;
  end;
end;

function mnConstellation12ToChinese(const Constellation12: mnTConstellation12): string;
begin
  case Constellation12 of
    ctAries:       Result := '白羊';
    ctTaurus:      Result := '金牛';
    ctGemini:      Result := '双子';
    ctCancer:      Result := '巨蟹';
    ctLeo:         Result := '狮子';
    ctVirgo:       Result := '处女';
    ctLibra:       Result := '天秤';
    ctScorpio:     Result := '天蝎';
    ctSagittarius: Result := '射手';
    ctCapricorn:   Result := '摩羯';
    ctAquarius:    Result := '水瓶';
    ctPisces:      Result := '双鱼';
  else
    mnNeverGoesHere;
  end;
end;

function mnAnimal12ToChinese(const Animal12: mnTAnimal12): string;
begin
  case Animal12 of
    atRat:     Result := '鼠';
    atOx:      Result := '牛';
    atTiger:   Result := '虎';
    atRabbit:  Result := '兔';
    atDragon:  Result := '龙';
    atSnake:   Result := '蛇';
    atHorse:   Result := '马';
    atRam:     Result := '羊';
    atMonkey:  Result := '猴';
    atRooster: Result := '鸡';
    atDog:     Result := '狗';
    atPig:     Result := '猪';
  else
    mnNeverGoesHere;
  end;
end;

end.
