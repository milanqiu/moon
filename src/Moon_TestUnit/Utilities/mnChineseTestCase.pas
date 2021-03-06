unit mnChineseTestCase;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit
  being tested.

}

interface

uses
  TestFramework;

type
  TmnChineseTestCase = class(TTestCase)
  strict private
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure testChineseDigit;
    procedure testChineseNumber;
    procedure testChineseInt;
    procedure testChineseDate;
    procedure testFloatToWanStr;
    procedure testFloatToYiStr;
    procedure testFloatToWanYiStr;
    procedure testWanYiStrToFloat;
    procedure testTimeUnitToChinese;
    procedure testLunarDateToChinese;
    procedure testConstellation12ToChinese;
    procedure testAnimal12ToChinese;
  end;

implementation

uses mnChinese, mnResStrsU, SysUtils, mnDebug, mnDateTime, mnSystem, mnMath;

{ TmnChineseTestCase }

procedure TmnChineseTestCase.SetUp;
begin
end;

procedure TmnChineseTestCase.TearDown;
begin
end;

procedure TmnChineseTestCase.testChineseDigit;
begin
  CheckEquals(mnChineseDigit(0), '零');
  CheckEquals(mnChineseDigit(1), '一');
  CheckEquals(mnChineseDigit(9), '九');
  CheckEquals(mnChineseDigit(0, True), '零');
  CheckEquals(mnChineseDigit(1, True), '壹');
  CheckEquals(mnChineseDigit(9, True), '玖');

  CheckEquals(mnChineseDigit(0, False, '0'), '0');

  try
    mnChineseDigit(10);
    mnNeverGoesHere;
  except
    on E: Exception do CheckEquals(E.Message, Format(SDigitNotIn0To9, [10]));
  end;
end;

procedure TmnChineseTestCase.testChineseNumber;
begin
  CheckEquals(mnChineseNumber(0), '零');
  CheckEquals(mnChineseNumber(6), '六');

  CheckEquals(mnChineseNumber(10), '一零');
  CheckEquals(mnChineseNumber(16), '一六');
  CheckEquals(mnChineseNumber(36), '三六');

  CheckEquals(mnChineseNumber(100), '一零零');
  CheckEquals(mnChineseNumber(136), '一三六');

  CheckEquals(mnChineseNumber(10136), '一零一三六');

  CheckEquals(mnChineseNumber(1234567890), '一二三四五六七八九零');
  CheckEquals(mnChineseNumber(-1234567890), '负一二三四五六七八九零');
  CheckEquals(mnChineseNumber(1234567890, True), '壹贰叁肆伍陆柒捌玖零');
  CheckEquals(mnChineseNumber(-1234567890, True), '负壹贰叁肆伍陆柒捌玖零');

  CheckEquals(mnChineseNumber(0, False, '0'), '0');
  CheckEquals(mnChineseNumber(10, False, '0'), '一0');
  CheckEquals(mnChineseNumber(100, False, '0'), '一00');
  CheckEquals(mnChineseNumber(10136, False, '0'), '一0一三六');
  CheckEquals(mnChineseNumber(1234567890, False, '0'), '一二三四五六七八九0');
  CheckEquals(mnChineseNumber(-1234567890, False, '0'), '负一二三四五六七八九0');
end;

procedure TmnChineseTestCase.testChineseInt;
begin
  CheckEquals(mnChineseInt(0), '零');
  CheckEquals(mnChineseInt(6), '六');

  CheckEquals(mnChineseInt(10), '十');
  CheckEquals(mnChineseInt(16), '十六');
  CheckEquals(mnChineseInt(36), '三十六');

  CheckEquals(mnChineseInt(100), '一百');
  CheckEquals(mnChineseInt(106), '一百零六');
  CheckEquals(mnChineseInt(110), '一百一十');
  CheckEquals(mnChineseInt(116), '一百一十六');
  CheckEquals(mnChineseInt(136), '一百三十六');

  CheckEquals(mnChineseInt(1000), '一千');
  CheckEquals(mnChineseInt(1006), '一千零六');
  CheckEquals(mnChineseInt(1010), '一千零一十');
  CheckEquals(mnChineseInt(1016), '一千零一十六');
  CheckEquals(mnChineseInt(1036), '一千零三十六');
  CheckEquals(mnChineseInt(1100), '一千一百');
  CheckEquals(mnChineseInt(1106), '一千一百零六');
  CheckEquals(mnChineseInt(1110), '一千一百一十');
  CheckEquals(mnChineseInt(1116), '一千一百一十六');
  CheckEquals(mnChineseInt(1136), '一千一百三十六');

  CheckEquals(mnChineseInt(10000), '一万');
  CheckEquals(mnChineseInt(10006), '一万零六');
  CheckEquals(mnChineseInt(10010), '一万零一十');
  CheckEquals(mnChineseInt(10016), '一万零一十六');
  CheckEquals(mnChineseInt(10036), '一万零三十六');
  CheckEquals(mnChineseInt(10100), '一万零一百');
  CheckEquals(mnChineseInt(10106), '一万零一百零六');
  CheckEquals(mnChineseInt(10110), '一万零一百一十');
  CheckEquals(mnChineseInt(10116), '一万零一百一十六');
  CheckEquals(mnChineseInt(10136), '一万零一百三十六');
  CheckEquals(mnChineseInt(11000), '一万一千');
  CheckEquals(mnChineseInt(11006), '一万一千零六');
  CheckEquals(mnChineseInt(11010), '一万一千零一十');
  CheckEquals(mnChineseInt(11016), '一万一千零一十六');
  CheckEquals(mnChineseInt(11036), '一万一千零三十六');
  CheckEquals(mnChineseInt(11100), '一万一千一百');
  CheckEquals(mnChineseInt(11106), '一万一千一百零六');
  CheckEquals(mnChineseInt(11110), '一万一千一百一十');
  CheckEquals(mnChineseInt(11116), '一万一千一百一十六');
  CheckEquals(mnChineseInt(11136), '一万一千一百三十六');

  CheckEquals(mnChineseInt(60001), '六万零一');
  CheckEquals(mnChineseInt(100010), '十万零一十');
  CheckEquals(mnChineseInt(160016), '十六万零一十六');
  CheckEquals(mnChineseInt(360036), '三十六万零三十六');
  CheckEquals(mnChineseInt(1000100), '一百万零一百');
  CheckEquals(mnChineseInt(1060106), '一百零六万零一百零六');
  CheckEquals(mnChineseInt(1100110), '一百一十万零一百一十');
  CheckEquals(mnChineseInt(1160116), '一百一十六万零一百一十六');
  CheckEquals(mnChineseInt(1360136), '一百三十六万零一百三十六');
  CheckEquals(mnChineseInt(10001000), '一千万一千');
  CheckEquals(mnChineseInt(10061006), '一千零六万一千零六');
  CheckEquals(mnChineseInt(10101010), '一千零一十万一千零一十');
  CheckEquals(mnChineseInt(10161016), '一千零一十六万一千零一十六');
  CheckEquals(mnChineseInt(10361036), '一千零三十六万一千零三十六');
  CheckEquals(mnChineseInt(11001100), '一千一百万一千一百');
  CheckEquals(mnChineseInt(11061106), '一千一百零六万一千一百零六');
  CheckEquals(mnChineseInt(11101110), '一千一百一十万一千一百一十');
  CheckEquals(mnChineseInt(11161116), '一千一百一十六万一千一百一十六');
  CheckEquals(mnChineseInt(11361136), '一千一百三十六万一千一百三十六');

  CheckEquals(mnChineseInt(1234567890), '十二亿三千四百五十六万七千八百九十');
  CheckEquals(mnChineseInt(-1234567890), '负十二亿三千四百五十六万七千八百九十');
  CheckEquals(mnChineseInt(1234567890, True), '拾贰億叁仟肆佰伍拾陆萬柒仟捌佰玖拾');
  CheckEquals(mnChineseInt(-1234567890, True), '负拾贰億叁仟肆佰伍拾陆萬柒仟捌佰玖拾');

  CheckEquals(mnChineseInt(0, False, '0'), '0');
  CheckEquals(mnChineseInt(10, False, '0'), '十');
  CheckEquals(mnChineseInt(100, False, '0'), '一百');
  CheckEquals(mnChineseInt(106, False, '0'), '一百0六');
  CheckEquals(mnChineseInt(110, False, '0'), '一百一十');
  CheckEquals(mnChineseInt(1000, False, '0'), '一千');
  CheckEquals(mnChineseInt(1006, False, '0'), '一千0六');
  CheckEquals(mnChineseInt(1106, False, '0'), '一千一百0六');
  CheckEquals(mnChineseInt(1110, False, '0'), '一千一百一十');
  CheckEquals(mnChineseInt(10006, False, '0'), '一万0六');
  CheckEquals(mnChineseInt(160016, False, '0'), '十六万0一十六');
  CheckEquals(mnChineseInt(10061006, False, '0'), '一千0六万一千0六');
  CheckEquals(mnChineseInt(1234567890, False, '0'), '十二亿三千四百五十六万七千八百九十');
end;

procedure TmnChineseTestCase.testChineseDate;
begin
  CheckEquals(mnChineseDate(EncodeDate(1982, 8, 29)), '一九八二年八月二十九日');
  CheckEquals(mnChineseDate(EncodeDate(2000, 12, 3)), '二零零零年十二月三日');
  CheckEquals(mnChineseDate(EncodeDate(1982, 8, 29), True), '壹玖捌贰年捌月贰拾玖日');
  CheckEquals(mnChineseDate(EncodeDate(2000, 12, 3), True), '贰零零零年拾贰月叁日');

  CheckEquals(mnChineseDate(EncodeDate(2000, 12, 3), False, '0'), '二000年十二月三日');
  CheckEquals(mnChineseDate(EncodeDate(2000, 12, 3), True, '0'), '贰000年拾贰月叁日');
end;

procedure TmnChineseTestCase.testFloatToWanStr;
begin
  CheckEquals(mnFloatToWanStr(87650000), '8765万');
  CheckEquals(mnFloatToWanStr(87654320), '8765.432万');
  CheckEquals(mnFloatToWanStr(87654320, 0), '8765万');
  CheckEquals(mnFloatToWanStr(87654320, 2), '8765.43万');
  CheckEquals(mnFloatToWanStr(4320.1), '0.43201万');
  CheckEquals(mnFloatToWanStr(4320.1, 2), '0.43万');
  CheckEquals(mnFloatToWanStr(-87650000), '-8765万');
  CheckEquals(mnFloatToWanStr(-87654320), '-8765.432万');
  CheckEquals(mnFloatToWanStr(-87654320, 0), '-8765万');
  CheckEquals(mnFloatToWanStr(-87654320, 2), '-8765.43万');
  CheckEquals(mnFloatToWanStr(-4320.1), '-0.43201万');
  CheckEquals(mnFloatToWanStr(-4320.1, 2), '-0.43万');
end;

procedure TmnChineseTestCase.testFloatToYiStr;
begin
  CheckEquals(mnFloatToYiStr(876500000000), '8765亿');
  CheckEquals(mnFloatToYiStr(876543200000), '8765.432亿');
  CheckEquals(mnFloatToYiStr(876543200000, 0), '8765亿');
  CheckEquals(mnFloatToYiStr(876543200000, 2), '8765.43亿');
  CheckEquals(mnFloatToYiStr(43200000.1), '0.432000001亿');
  CheckEquals(mnFloatToYiStr(43200000.1, 2), '0.43亿');
  CheckEquals(mnFloatToYiStr(-876500000000), '-8765亿');
  CheckEquals(mnFloatToYiStr(-876543200000), '-8765.432亿');
  CheckEquals(mnFloatToYiStr(-876543200000, 0), '-8765亿');
  CheckEquals(mnFloatToYiStr(-876543200000, 2), '-8765.43亿');
  CheckEquals(mnFloatToYiStr(-43200000.1), '-0.432000001亿');
  CheckEquals(mnFloatToYiStr(-43200000.1, 2), '-0.43亿');
end;

procedure TmnChineseTestCase.testFloatToWanYiStr;
begin
  CheckEquals(mnFloatToWanYiStr(87650000), '8765万');
  CheckEquals(mnFloatToWanYiStr(87654320), '8765.432万');
  CheckEquals(mnFloatToWanYiStr(87654320, 0), '8765万');
  CheckEquals(mnFloatToWanYiStr(87654320, 2), '8765.43万');
  CheckEquals(mnFloatToWanYiStr(4320.1), '0.43201万');
  CheckEquals(mnFloatToWanYiStr(4320.1, 2), '0.43万');
  CheckEquals(mnFloatToWanYiStr(-87650000), '-8765万');
  CheckEquals(mnFloatToWanYiStr(-87654320), '-8765.432万');
  CheckEquals(mnFloatToWanYiStr(-87654320, 0), '-8765万');
  CheckEquals(mnFloatToWanYiStr(-87654320, 2), '-8765.43万');
  CheckEquals(mnFloatToWanYiStr(-4320.1), '-0.43201万');
  CheckEquals(mnFloatToWanYiStr(-4320.1, 2), '-0.43万');
  CheckEquals(mnFloatToWanYiStr(876500000000), '8765亿');
  CheckEquals(mnFloatToWanYiStr(876543200000), '8765.432亿');
  CheckEquals(mnFloatToWanYiStr(876543200000, 0), '8765亿');
  CheckEquals(mnFloatToWanYiStr(876543200000, 2), '8765.43亿');
  CheckEquals(mnFloatToWanYiStr(43200000.1), '4320.00001万');
  CheckEquals(mnFloatToWanYiStr(43200000.1, 2), '4320.00万');
  CheckEquals(mnFloatToWanYiStr(-876500000000), '-8765亿');
  CheckEquals(mnFloatToWanYiStr(-876543200000), '-8765.432亿');
  CheckEquals(mnFloatToWanYiStr(-876543200000, 0), '-8765亿');
  CheckEquals(mnFloatToWanYiStr(-876543200000, 2), '-8765.43亿');
  CheckEquals(mnFloatToWanYiStr(-43200000.1), '-4320.00001万');
  CheckEquals(mnFloatToWanYiStr(-43200000.1, 2), '-4320.00万');
end;

procedure TmnChineseTestCase.testWanYiStrToFloat;
begin
  CheckEquals(mnWanYiStrToFloat('8765万'), 87650000);
  CheckEquals(mnWanYiStrToFloat('8,765.432万'), 87654320);
  CheckEquals(mnWanYiStrToFloat('0.432 万'), 4320);
  CheckEquals(mnWanYiStrToFloat('8765亿'), 876500000000);
  CheckEquals(mnWanYiStrToFloat('8,765.432亿'), 876543200000);
  CheckEquals(mnWanYiStrToFloat('0.432 亿'), 43200000);
  CheckEquals(mnWanYiStrToFloat('-8765万'), -87650000);
  CheckEquals(mnWanYiStrToFloat('-8,765.432万'), -87654320);
  CheckEquals(mnWanYiStrToFloat('-0.432 万'), -4320);
  CheckEquals(mnWanYiStrToFloat('-8765亿'), -876500000000);
  CheckEquals(mnWanYiStrToFloat('-8,765.432亿'), -876543200000);
  CheckEquals(mnWanYiStrToFloat('-0.432 亿'), -43200000);

  try
    mnWanYiStrToFloat('100兆');
    mnNeverGoesHere;
  except
    on E: Exception do CheckEquals(E.Message, Format(SWrongWanYiStrFormat, ['100兆']));
  end;
end;

procedure TmnChineseTestCase.testTimeUnitToChinese;
begin
  CheckEquals(mnTimeUnitToChinese(tuYear),   '年');
  CheckEquals(mnTimeUnitToChinese(tuMonth),  '月');
  CheckEquals(mnTimeUnitToChinese(tuDay),    '日');
  CheckEquals(mnTimeUnitToChinese(tuHour),   '时');
  CheckEquals(mnTimeUnitToChinese(tuMinute), '分');
  CheckEquals(mnTimeUnitToChinese(tuSecond), '秒');

  CheckEquals(mnTimeUnitToChinese(tuYear,   True), '年');
  CheckEquals(mnTimeUnitToChinese(tuMonth,  True), '个月');
  CheckEquals(mnTimeUnitToChinese(tuDay,    True), '天');
  CheckEquals(mnTimeUnitToChinese(tuHour,   True), '小时');
  CheckEquals(mnTimeUnitToChinese(tuMinute, True), '分钟');
  CheckEquals(mnTimeUnitToChinese(tuSecond, True), '秒');
end;

procedure TmnChineseTestCase.testLunarDateToChinese;
var
  LunarDate: mnTLunarDate;
begin
  LunarDate.Year := 1982;
  LunarDate.Month := 7;
  LunarDate.Day := 11;
  LunarDate.IsLeapMonth := False;
  CheckEquals(mnLunarDateToChinese(LunarDate), '一九八二年七月十一');

  LunarDate.Year := 2004;
  LunarDate.Month := 12;
  LunarDate.Day := 3;
  LunarDate.IsLeapMonth := True;
  CheckEquals(mnLunarDateToChinese(LunarDate), '二零零四年闰十二月初三');

  LunarDate.Year := 1903;
  LunarDate.Month := 1;
  LunarDate.Day := 27;
  LunarDate.IsLeapMonth := False;
  CheckEquals(mnLunarDateToChinese(LunarDate), '一九零三年正月廿七');

  // Incomplete

  LunarDate.Year := 0;
  LunarDate.Month := 0;
  LunarDate.Day := 0;
  CheckEquals(mnLunarDateToChinese(LunarDate), '');

  LunarDate.Year := 0;
  LunarDate.Month := 0;
  LunarDate.Day := 11;
  CheckEquals(mnLunarDateToChinese(LunarDate), '某月十一');

  LunarDate.Year := 0;
  LunarDate.Month := 7;
  LunarDate.Day := 0;
  CheckEquals(mnLunarDateToChinese(LunarDate), '七月');

  LunarDate.Year := 0;
  LunarDate.Month := 7;
  LunarDate.Day := 11;
  CheckEquals(mnLunarDateToChinese(LunarDate), '七月十一');

  LunarDate.Year := 1982;
  LunarDate.Month := 0;
  LunarDate.Day := 0;
  CheckEquals(mnLunarDateToChinese(LunarDate), '一九八二年');

  LunarDate.Year := 1982;
  LunarDate.Month := 0;
  LunarDate.Day := 11;
  CheckEquals(mnLunarDateToChinese(LunarDate), '一九八二年某月十一');

  LunarDate.Year := 1982;
  LunarDate.Month := 7;
  LunarDate.Day := 0;
  CheckEquals(mnLunarDateToChinese(LunarDate), '一九八二年七月');

  LunarDate.Year := 1982;
  LunarDate.Month := 7;
  LunarDate.Day := 11;
  CheckEquals(mnLunarDateToChinese(LunarDate), '一九八二年七月十一');
end;

procedure TmnChineseTestCase.testConstellation12ToChinese;
begin
  CheckEquals(mnConstellation12ToChinese(ctAries), '白羊');
  CheckEquals(mnConstellation12ToChinese(ctPisces), '双鱼');
end;

procedure TmnChineseTestCase.testAnimal12ToChinese;
begin
  CheckEquals(mnAnimal12ToChinese(atRat), '鼠');
  CheckEquals(mnAnimal12ToChinese(atDog), '狗');
  CheckEquals(mnAnimal12ToChinese(atPig), '猪');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TmnChineseTestCase.Suite);
end.


