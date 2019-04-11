unit mnChinese;

interface

uses mnSystem, mnDateTime;

{--------------------------------
  ��һλ��ת�������ġ����磬��0��תΪ���㡱����6��תΪ��������
  Capital��ʾ�Ƿ��д����д�����硰Ҽ��������
  Zero��ʾ��0��תΪʲô��ȱʡ�ǡ��㡱������ʱ�б�����󣬱���ת�ɡ�������
  ���Digit����0-9�ڣ����׳��쳣��
  Tested in TestUnit.
 --------------------------------}
function mnChineseDigit(const Digit: Integer; const Capital: Boolean = False; const Zero: string = '��'): string;

{--------------------------------
  ��һ��������λת�������ġ����磬��5403��תΪ��������������
  Capital��ʾ�Ƿ��д����д�����硰Ҽ��������
  Zero��ʾ��0��תΪʲô��ȱʡ�ǡ��㡱������ʱ�б�����󣬱���ת�ɡ�������
  Tested in TestUnit.
 --------------------------------}
function mnChineseNumber(const Value: Integer; const Capital: Boolean = False; const Zero: string = '��'): string;
{--------------------------------
  ��һ������ת�������ġ����磬��5403��תΪ����ǧ�İ���������
  Capital��ʾ�Ƿ��д����д�����硰Ҽ��������
  Zero��ʾ��0��תΪʲô��ȱʡ�ǡ��㡱������ʱ�б�����󣬱���ת�ɡ�������
  Tested in TestUnit.
 --------------------------------}
function mnChineseInt(const Value: Integer; const Capital: Boolean = False; const Zero: string = '��'): string;

{--------------------------------
  ��һ������ת�������ġ����磬��1982-10-29��תΪ��һ�Ű˶���ʮ�¶�ʮ���ա���
  Ҳ����˵����ʹ��������λ��ʽת�����º���ʹ��������ʽת����
  Capital��ʾ�Ƿ��д����д�����硰Ҽ��������
  Zero��ʾ��0��תΪʲô��ȱʡ�ǡ��㡱������ʱ�б�����󣬱���ת�ɡ�������
  Tested in TestUnit.
 --------------------------------}
function mnChineseDate(const Value: TDateTime; const Capital: Boolean = False; const Zero: string = '��'): string;

{--------------------------------
  ��һ��������ת���������ʾ�����ġ����磬��87654320��תΪ��8765.43�򡱡�
  DecimalDigits��ʾת�����ַ���ʱ��������С��λ���������-1��˵�������κ����������
  Tested in TestUnit.
 --------------------------------}
function mnFloatToWanStr  (const Value: Extended; const DecimalDigits: Integer = -1): string;
{--------------------------------
  ��һ��������ת�������ڱ�ʾ�����ġ����磬��876543200000��תΪ��8765.43�ڡ���
  DecimalDigits��ʾת�����ַ���ʱ��������С��λ���������-1��˵�������κ����������
  Tested in TestUnit.
 --------------------------------}
function mnFloatToYiStr   (const Value: Extended; const DecimalDigits: Integer = -1): string;
{--------------------------------
  ��һ���������������С��ת��Ϊ�����ʾ�����ڱ�ʾ�����ġ�����1�ڻ�С�ڸ�1�ڣ����ڱ�ʾ�����������ʾ��
  DecimalDigits��ʾת�����ַ���ʱ��������С��λ���������-1��˵�������κ����������
  Tested in TestUnit.
 --------------------------------}
function mnFloatToWanYiStr(const Value: Extended; const DecimalDigits: Integer = -1): string;

{--------------------------------
  �������ʾ�����ڱ�ʾ�����ģ�ת��Ϊ��������
  Tested in TestUnit.
 --------------------------------}
function mnWanYiStrToFloat(const S: string): Extended;

{--------------------------------
  ��һ��ʱ�䵥λת��Ϊ���ı�ʾ��
  ForDuration��ʾ�����ı�ʾ�Ƿ�����ָʾһ�γ���ʱ�䡣
  ��ForDurationΪTrue������ʱ�䵥λ���ֱ�ת��Ϊ���ꡱ�������¡������족����Сʱ���������ӡ������롱��
  ����ת��Ϊ��׼��ʾ���ꡱ�����¡������ա�����ʱ�������֡������롱��
  Tested in TestUnit.
 --------------------------------}
function mnTimeUnitToChinese(const TimeUnit: mnTTimeUnit; const ForDuration: Boolean = False): string;

{--------------------------------
  ��һ��ũ������ת��Ϊ���ı�ʾ��
  Capital��ʾ�Ƿ��д����д�����硰Ҽ��������
  Zero��ʾ��0��תΪʲô��ȱʡ�ǡ��㡱������ʱ�б�����󣬱���ת�ɡ�������

  ����������ũ�����ڡ�
  ��������ũ��������ָ���ꡢ�¡��ղ���Ҫȫ��ָ����û��ָ���Ŀɴ���0��
  ����ꡢ�¡��ն�Ϊ0���򷵻ؿմ���

  Tested in TestUnit.
 --------------------------------}
function mnLunarDateToChinese(const LunarDate: mnTLunarDate; const Capital: Boolean = False; const Zero: string = '��'): string;

{--------------------------------
  ��һ������ת��Ϊ���ı�ʾ��
  Tested in TestUnit.
 --------------------------------}
function mnConstellation12ToChinese(const Constellation12: mnTConstellation12): string;

{--------------------------------
  ��һ����Фת��Ϊ���ı�ʾ��
  Tested in TestUnit.
 --------------------------------}
function mnAnimal12ToChinese(const Animal12: mnTAnimal12): string;

implementation

uses mnResStrsU, SysUtils, StrUtils, Math, mnString, mnDebug;

function mnChineseDigit(const Digit: Integer; const Capital: Boolean = False; const Zero: string = '��'): string;
begin
  if Capital then
  begin
    case Digit of
      0: Result := Zero;
      1: Result := 'Ҽ';
      2: Result := '��';
      3: Result := '��';
      4: Result := '��';
      5: Result := '��';
      6: Result := '½';
      7: Result := '��';
      8: Result := '��';
      9: Result := '��';
    else
      mnCreateError(SDigitNotIn0To9, [Digit]);
    end;
  end
  else
  begin
    case Digit of
      0: Result := Zero;
      1: Result := 'һ';
      2: Result := '��';
      3: Result := '��';
      4: Result := '��';
      5: Result := '��';
      6: Result := '��';
      7: Result := '��';
      8: Result := '��';
      9: Result := '��';
    else
      mnCreateError(SDigitNotIn0To9, [Digit]);
    end;
  end;
end;

function mnChineseNumber(const Value: Integer; const Capital: Boolean = False; const Zero: string = '��'): string;
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

  if Negative then Result := '��' + Result;
end;

function mnChineseInt(const Value: Integer; const Capital: Boolean = False; const Zero: string = '��'): string;
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
    Result := Result + mnChineseInt(VarValue div 100000000, Capital, Zero) + mnChooseStr(Capital, '�|', '��');
    VarValue := VarValue mod 100000000;
  end;
  if VarValue >= 10000 then
  begin
    Result := Result + mnChineseInt(VarValue div 10000, Capital, Zero) + mnChooseStr(Capital, '�f', '��');
    VarValue := VarValue mod 10000;
  end
  else if Result <> '' then Result := Result + Zero;
  if VarValue >= 1000 then
  begin
    Result := Result + mnChineseDigit(VarValue div 1000, Capital, Zero) + mnChooseStr(Capital, 'Ǫ', 'ǧ');
    VarValue := VarValue mod 1000;
  end
  else if (Result <> '') and not mnEndsStr(Zero, Result) then Result := Result + Zero;
  if VarValue >= 100 then
  begin
    Result := Result + mnChineseDigit(VarValue div 100, Capital, Zero) + mnChooseStr(Capital, '��', '��');
    VarValue := VarValue mod 100;
  end
  else if (Result <> '') and not mnEndsStr(Zero, Result) then Result := Result + Zero;
  if VarValue >= 10 then
  begin
    Result := Result + mnChineseDigit(VarValue div 10, Capital, Zero) + mnChooseStr(Capital, 'ʰ', 'ʮ');
    VarValue := VarValue mod 10;
  end
  else if (Result <> '') and not mnEndsStr(Zero, Result) then Result := Result + Zero;
  if VarValue > 0 then
    Result := Result + mnChineseDigit(VarValue, Capital, Zero)
  else if Result = '' then
    Result := Zero;

  // if no leading characters, ��һʮ�� can be reduced to ��ʮ��
  if (LeftBStr(Result, 4) = 'һʮ') or (LeftBStr(Result, 4) = 'Ҽʰ') then Result := Copy(Result, 3);
  // if there is leading characters, last ���㡱 is ignored
  if (Length(Result) <> ZeroLen) and mnEndsStr(Zero, Result) then Result := mnTruncBRight(Result, ZeroLen);

  if Negative then Result := '��' + Result;
end;

function mnChineseDate(const Value: TDateTime; const Capital: Boolean = False; const Zero: string = '��'): string;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Value, Year, Month, Day);
  Result := Format('%s��%s��%s��', [mnChineseNumber(Year, Capital, Zero),
                                    mnChineseInt(Month, Capital, Zero),
                                    mnChineseInt(Day, Capital, Zero)]);
end;

function mnFloatToWanStr  (const Value: Extended; const DecimalDigits: Integer = -1): string;
begin
  Result := mnFloatToStr(Value/10000, DecimalDigits) + '��';
end;

function mnFloatToYiStr   (const Value: Extended; const DecimalDigits: Integer = -1): string;
begin
  Result := mnFloatToStr(Value/100000000, DecimalDigits) + '��';
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
  if BasicUnit = '��' then
  begin
    varS := mnTruncBRight(varS, 2);
    Result := SimpleRoundTo(StrToFloat(varS) * 10000, -10);
  end
  else if BasicUnit = '��' then
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
    tuYear:   Result := mnChooseStr(ForDuration, '��',   '��');
    tuMonth:  Result := mnChooseStr(ForDuration, '����', '��');
    tuDay:    Result := mnChooseStr(ForDuration, '��',   '��');
    tuHour:   Result := mnChooseStr(ForDuration, 'Сʱ', 'ʱ');
    tuMinute: Result := mnChooseStr(ForDuration, '����', '��');
    tuSecond: Result := mnChooseStr(ForDuration, '��',   '��');
  else
    mnCreateError(SIllegalTimeUnit);
  end;
end;

function mnLunarDateToChinese(const LunarDate: mnTLunarDate; const Capital: Boolean = False; const Zero: string = '��'): string;
begin
  if LunarDate.Year = 0 then
    Result := ''
  else
    Result := mnChineseNumber(LunarDate.Year, Capital, Zero) + '��';

  if LunarDate.Month = 0 then
    Result := Result + mnChooseStr(LunarDate.Day = 0, '', 'ĳ��')
  else
  begin
    if LunarDate.IsLeapMonth then Result := Result + '��';
    if (LunarDate.Month = 1) and not LunarDate.IsLeapMonth then
      Result := Result + '����'
    else
      Result := Result + mnChineseInt(LunarDate.Month, Capital, Zero) + '��';
  end;

  if LunarDate.Day = 0 then
    Result := Result + ''
  else
  begin
    if mnBetweenII(LunarDate.Day, 21, 29) then
    begin
      Result := Result + 'إ';
      Result := Result + mnChineseInt(LunarDate.Day mod 10, Capital, Zero);
    end
    else
    begin
      if LunarDate.Day <= 10 then Result := Result + '��';
      Result := Result + mnChineseInt(LunarDate.Day, Capital, Zero);
    end;
  end;
end;

function mnConstellation12ToChinese(const Constellation12: mnTConstellation12): string;
begin
  case Constellation12 of
    ctAries:       Result := '����';
    ctTaurus:      Result := '��ţ';
    ctGemini:      Result := '˫��';
    ctCancer:      Result := '��з';
    ctLeo:         Result := 'ʨ��';
    ctVirgo:       Result := '��Ů';
    ctLibra:       Result := '���';
    ctScorpio:     Result := '��Ы';
    ctSagittarius: Result := '����';
    ctCapricorn:   Result := 'Ħ��';
    ctAquarius:    Result := 'ˮƿ';
    ctPisces:      Result := '˫��';
  else
    mnNeverGoesHere;
  end;
end;

function mnAnimal12ToChinese(const Animal12: mnTAnimal12): string;
begin
  case Animal12 of
    atRat:     Result := '��';
    atOx:      Result := 'ţ';
    atTiger:   Result := '��';
    atRabbit:  Result := '��';
    atDragon:  Result := '��';
    atSnake:   Result := '��';
    atHorse:   Result := '��';
    atRam:     Result := '��';
    atMonkey:  Result := '��';
    atRooster: Result := '��';
    atDog:     Result := '��';
    atPig:     Result := '��';
  else
    mnNeverGoesHere;
  end;
end;

end.
