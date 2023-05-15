unit mnMath;

interface

uses mnSystem, Types;

const
{--------------------------------
  极小值。用于比较两个浮点数。
 --------------------------------}
  mnParticle = 0.0000000001;

{--------------------------------
  比较两个浮点数，返回 A 是否等于、不等于、小于、小于等于、大于、大于等于 B。
  Tested in TestUnit.
 --------------------------------}
function mnFloatEQ(const A, B: Extended): Boolean;
function mnFloatNE(const A, B: Extended): Boolean;
function mnFloatLT(const A, B: Extended): Boolean;
function mnFloatLE(const A, B: Extended): Boolean;
function mnFloatGT(const A, B: Extended): Boolean;
function mnFloatGE(const A, B: Extended): Boolean;

{--------------------------------
  基于两个维度比较两组整数。
  在第一个维度上若能区分出大小，则取为两组的比较结果。
  否则，若在第一个维度上相等，则将第二个维度上的大小比较结果，取为两组的比较结果。
  Tested in TestUnit.
 --------------------------------}
function mnCompareValue2D(const A1, A2, B1, B2: Integer): TValueRelationship;

{--------------------------------
  对一个浮点数进行中国式的四舍五入，有别于国际通用的银行家四舍五入。
  Precision用来作10的幂，指示了四舍五入的精度。
  Tested in TestUnit.
 --------------------------------}
function mnChineseRound(const Value: Extended; const Precision: Integer = 0): Extended;

{--------------------------------
  将一个整数通过计算转化为一位数。
  计算方法为将该整数的每位数相加。如果相加后的结果仍不是一位数，则继续将结果的每位数相加。
  循环直至生成一位数。
  Tested in TestUnit.
 --------------------------------}
function mnSingleDigit(Value: Integer): Integer;

{--------------------------------
  向上对齐一个整数，保证结果是Submultiple的倍数。
  如果Value和Submultiple中有一个为0，则返回Value。
  如果Value为负数，则向下对齐（即将Value取反后向上对齐再取反）。
  如果Submultiple为负数，则取其绝对值使用。
  Tested in TestUnit.
 --------------------------------}
function mnAlignInt(Value, Submultiple: Integer): Integer; inline;

{--------------------------------
  翻转一个整数的所有字节，可以看作是在内存中切换little-endian和big-endian表示。
  Tested in TestUnit.
 --------------------------------}
function mnReverseInt16(const Value: Int16): Int16; inline;
function mnReverseInt32(const Value: Int32): Int32; inline;
function mnReverseInt64(const Value: Int64): Int64; inline;
function mnReverseUInt16(const Value: UInt16): UInt16; inline;
function mnReverseUInt32(const Value: UInt32): UInt32; inline;

{--------------------------------
  计数一个二进制数中包含几个1。
  Tested in TestUnit.
 --------------------------------}
function mnCount1InBinary(Value: UInt32): Integer;

{--------------------------------
  判断一个二进制数的指定位是否为1，或是否为0。
  位的索引从0开始，从右往左增长。
  Tested in TestUnit.
 --------------------------------}
function mnBitIs1InBinary(const Value: UInt32; const Bit: Integer): Boolean; inline;
function mnBitIs0InBinary(const Value: UInt32; const Bit: Integer): Boolean; inline;

{--------------------------------
  将一个二进制数的指定位设置为1或0。
  位的索引从0开始，从右往左增长。
  Tested in TestUnit.
 --------------------------------}
function mnSetBit1InBinary(const Value: UInt32; const Bit: Integer): UInt32; inline;
function mnSetBit0InBinary(const Value: UInt32; const Bit: Integer): UInt32; inline;
function mnSetBitInBinary(const Value: UInt32; const Bit: Integer; const BitValue: Boolean): UInt32; inline;

{--------------------------------
  在多个段里进行定位。
  Sections定义了每个段的长度，即每个段包含的元素个数。段是依次排列的。
  Ordinal是需要定位的元素的整体序号。序号是从头计数的。
  返回两个值。SectionIndex存储该元素落入的段的索引，ItemIndex存储该元素在所在段中的索引。
  所有的序号和索引都是从0开始的。
  Tested in TestUnit.
 --------------------------------}
procedure mnLocateInSections(const Ordinal: Integer; const Sections: array of Integer;
  var SectionIndex, ItemIndex: Integer); overload;
procedure mnLocateInSections(const Ordinal: Integer; const Sections: mnTIntList;
  var SectionIndex, ItemIndex: Integer); overload;

{--------------------------------
  计算N个元素中取R个的排列数和组合数，即P(N, R)和C(N, R)。
  Tested in TestUnit.
 --------------------------------}
function mnP(const N, R: Integer): Integer;
function mnC(const N, R: Integer): Integer;

{--------------------------------
  生成N个元素（0到N-1这N个数字）中取R个的全部排列和组合。
  FullProb和FullComb不需要事先SetLength，函数内部会给它们设置，生成后的长度分别是[P(N, R), R]和[C(N, R), R]。
  Tested in TestUnit.
 --------------------------------}
procedure mnProbability(const N, R: Integer; var FullProb: mnTIntArrayDim2);
procedure mnCombination(const N, R: Integer; var FullComb: mnTIntArrayDim2);

implementation

uses Math, mnArray, mnDebug, mnResStrsU;

function mnFloatEQ(const A, B: Extended): Boolean;
begin
  Result := SameValue(A, B, mnParticle);
end;

function mnFloatNE(const A, B: Extended): Boolean;
begin
  Result := not SameValue(A, B, mnParticle);
end;

function mnFloatLT(const A, B: Extended): Boolean;
begin
  Result := not SameValue(A, B, mnParticle) and (A < B);
end;

function mnFloatLE(const A, B: Extended): Boolean;
begin
  Result := SameValue(A, B, mnParticle) or (A < B);
end;

function mnFloatGT(const A, B: Extended): Boolean;
begin
  Result := not SameValue(A, B, mnParticle) and (A > B);
end;

function mnFloatGE(const A, B: Extended): Boolean;
begin
  Result := SameValue(A, B, mnParticle) or (A > B);
end;

function mnCompareValue2D(const A1, A2, B1, B2: Integer): TValueRelationship;
begin
  if A1 < B1 then
    Result := LessThanValue
  else if A1 > B1 then
    Result := GreaterThanValue
  else if A2 < B2 then
    Result := LessThanValue
  else if A2 > B2 then
    Result := GreaterThanValue
  else
    Result := EqualsValue;
end;

function mnChineseRound(const Value: Extended; const Precision: Integer = 0): Extended;
var
  Offset: Extended;
begin
  if Value < 0 then
    Result := -mnChineseRound(-Value, Precision)
  else if Precision = 0 then
  begin
    Result := Trunc(Value);
    if mnFloatGE(Value - Result, 0.5) then
      Result := Result + 1;
  end
  else
  begin
    Offset := IntPower(10, Precision);
    Result := mnChineseRound(Value / Offset) * Offset;
  end;
end;

function mnSingleDigit(Value: Integer): Integer;
begin
  Result := 0;
  while True do
  begin
    repeat
      Result := Result + Value mod 10;
      Value := Value div 10;
    until Value = 0;
    if Result >= 10 then
    begin
      Value := Result;
      Result := 0;
    end
    else Exit;
  end;
end;

function mnAlignInt(Value, Submultiple: Integer): Integer; inline;
var
  ValueIsPositive: Boolean;
begin
  if (Value = 0) or (Submultiple = 0) or (Submultiple = 1) or (Submultiple = -1) then
  begin
    Result := Value;
    Exit;
  end;
  ValueIsPositive := Value > 0;
  if Value < 0 then Value := -Value;
  if Submultiple < 0 then Submultiple := -Submultiple;
  Result := ((Value - 1) div Submultiple + 1) * Submultiple;
  if not ValueIsPositive then Result := -Result;
end;

function mnReverseInt16(const Value: Int16): Int16; inline;
begin
  Result := (Value and $FF) shl 8 + (Value and $FF00) shr 8;
end;

function mnReverseInt32(const Value: Int32): Int32; inline;
begin
  Result := (Value and $FF) shl 24 + (Value and $FF00) shl 8
          + (Value shr 8) and $FF00 + (Value shr 24) and $FF;
end;

function mnReverseInt64(const Value: Int64): Int64; inline;
begin
  Result := (Value and $FF) shl 56 + (Value and $FF00) shl 40
          + (Value and $FF0000) shl 24 + (Value and $FF000000) shl 8
          + (Value shr 8) and $FF000000 + (Value shr 24) and $FF0000
          + (Value shr 40) and $FF00 + (Value shr 56) and $FF;
end;

function mnReverseUInt16(const Value: UInt16): UInt16; inline;
begin
  Result := (Value and $FF) shl 8 + (Value and $FF00) shr 8;
end;

function mnReverseUInt32(const Value: UInt32): UInt32; inline;
begin
  Result := (Value and $FF) shl 24 + (Value and $FF00) shl 8
          + (Value shr 8) and $FF00 + (Value shr 24) and $FF;
end;

function mnCount1InBinary(Value: UInt32): Integer;
begin
  Result := 0;
  while Value <> 0 do
  begin
    Inc(Result);
    Value := Value and (Value-1);
  end;
end;

function mnBitIs1InBinary(const Value: UInt32; const Bit: Integer): Boolean; inline;
begin
  Result := (Value shr Bit) and 1 = 1;
end;

function mnBitIs0InBinary(const Value: UInt32; const Bit: Integer): Boolean; inline;
begin
  Result := (Value shr Bit) and 1 = 0;
end;

function mnSetBit1InBinary(const Value: UInt32; const Bit: Integer): UInt32; inline;
begin
  Result := Value or (1 shl Bit);
end;

function mnSetBit0InBinary(const Value: UInt32; const Bit: Integer): UInt32; inline;
begin
  Result := Value and not (1 shl Bit);
end;

function mnSetBitInBinary(const Value: UInt32; const Bit: Integer; const BitValue: Boolean): UInt32; inline;
begin
  if BitValue then
    Result := mnSetBit1InBinary(Value, Bit)
  else
    Result := mnSetBit0InBinary(Value, Bit);
end;

procedure mnLocateInSections(const Ordinal: Integer; const Sections: array of Integer;
  var SectionIndex, ItemIndex: Integer); overload;
var
  Index: Integer;
  Sum: Integer;
begin
  Index := -1;
  Sum := 0;
  repeat
    Inc(Index);
    mnCreateErrorIf(Index >= Length(Sections), SSectionsTooShort);
    Sum := Sum + Sections[Index];
  until Ordinal < Sum;

  SectionIndex := Index;
  ItemIndex := Ordinal - Sum + Sections[Index];
end;

procedure mnLocateInSections(const Ordinal: Integer; const Sections: mnTIntList;
  var SectionIndex, ItemIndex: Integer); overload;
var
  Index: Integer;
  Sum: Integer;
begin
  Index := -1;
  Sum := 0;
  repeat
    Inc(Index);
    mnCreateErrorIf(Index >= Sections.Count, SSectionsTooShort);
    Sum := Sum + Sections[Index];
  until Ordinal < Sum;

  SectionIndex := Index;
  ItemIndex := Ordinal - Sum + Sections[Index];
end;

function mnP(const N, R: Integer): Integer;
var
  i: Integer;
begin
  Result := 1;
  for i := 1 to R do
    Result := Result * (N - i + 1);
end;

function mnC(const N, R: Integer): Integer;
var
  i: Integer;
begin
  if R > N div 2 then
    Result := mnC(N, N-R)
  else
  begin
    Result := mnP(N, R);
    for i := 1 to R do
      Result := Result div i;
  end;
end;

procedure mnProbability(const N, R: Integer; var FullProb: mnTIntArrayDim2);
var
  Index1, Index2: Integer;
  CurrProb: array of Integer;

  procedure RecursiveProbability;
  var
    i, j: Integer;
    AlreadyArranged: Boolean;
  begin
    if Index2 = R then
    begin
      mnArrayCopy(CurrProb, FullProb[Index1], SizeOf(Integer), 0, 0, R);
      Inc(Index1);
    end
    else
    begin
      for i := 0 to N-1 do
      begin
        AlreadyArranged := False;
        for j := 0 to Index2-1 do
          if CurrProb[j] = i then
          begin
            AlreadyArranged := True;
            Break;
          end;
        if not AlreadyArranged then
        begin
          CurrProb[Index2] := i;
          Inc(Index2);
          RecursiveProbability;
          Dec(Index2);
        end;
      end;
    end;
  end;

begin
  SetLength(FullProb, mnP(N, R), R);
  SetLength(CurrProb, R);
  Index1 := 0;
  Index2 := 0;
  RecursiveProbability;
end;

procedure mnCombination(const N, R: Integer; var FullComb: mnTIntArrayDim2);
var
  i, j: Integer;
  Index1, Index2: Integer;
begin
  SetLength(FullComb, mnC(N, R), R);
  Index1 := 0;
  for i := 1 shl N - 1 downto 0 do
    if mnCount1InBinary(i) = R then
    begin
      Index2 := 0;
      for j := N-1 downto 0 do
        if mnBitIs1InBinary(i, j) then
        begin
          FullComb[Index1, Index2] := N-1-j;
          Inc(Index2);
        end;
      Inc(Index1);
    end;
end;

end.
