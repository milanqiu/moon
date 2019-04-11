unit mnArray;

interface

uses mnSystem;

{--------------------------------
  比较两个数组是否相同。需要长度和内容严格相同。
  严格相同的含义是，如果数组元素是字符串、指针或对象，必须是地址相同，而不能仅是指向值相同。
  数组结构的第一个longint，即引用次数，不进行比较。
  相同时返回True，不同返回False。
  Tested in TestUnit.
 --------------------------------}
function mnArrayCompare(const ArrayA, ArrayB; const ElementSize: Integer): Boolean;

{--------------------------------
  从源数组往目标数组拷贝指定数量的元素。
  被拷贝元素在源数组中的索引从SrcIndex开始，拷入到目标数组中的索引从DstIndex开始。
  如果指定的数量过长，超出了任一数组的长度，将会自动缩减来匹配数组长度。
  调用时必须传入元素的size，以字节数表示。
  SrcIndex和DstIndex从0开始。如果越界，会抛出异常。
  Tested in TestUnit.
 --------------------------------}
procedure mnArrayCopy(const SrcArray, DstArray; const ElementSize, SrcIndex, DstIndex: Integer; Count: Integer);

{--------------------------------
  在数组的末尾添加指定数量的元素。
  调用时必须传入元素的size，以字节数表示。
  返回第一个新入元素的索引。
  Tested in TestUnit.
 --------------------------------}
function mnArrayAppend(var AnArray; const ElementSize: Integer; const Count: Integer = 1): Integer;
{--------------------------------
  在数组的任意位置插入指定数量的元素。插入后，第一个新入元素的索引等于Index。
  调用时必须传入元素的size，以字节数表示。
  Index从0开始。如果越界，会抛出异常。
  Tested in TestUnit.
 --------------------------------}
procedure mnArrayInsert(var AnArray; const ElementSize, Index: Integer; const Count: Integer = 1);
{--------------------------------
  从数组中删除指定数量的元素，这些被删元素的索引从Index开始。
  如果指定的数量过长，超出了数组的长度，将会自动缩减来匹配数组长度。
  调用时必须传入元素的size，以字节数表示。
  Index从0开始。如果越界，会抛出异常。
  注意：使用此函数删除字符串、指针或对象类型元素之前，必须先将元素置空，如空串或nil，否则会发生内存泄漏。
  Tested in TestUnit.
 --------------------------------}
procedure mnArrayDelete(var AnArray; const ElementSize, Index: Integer; Count: Integer = 1);

{--------------------------------
  随机洗牌一个数组里的部分元素，被洗的部分元素的索引从BeginIndex到EndIndex。
  调用时必须传入元素的size，以字节数表示。
  Tested in TestUnit.
 --------------------------------}
procedure mnArrayShuffle(var AnArray; const ElementSize, BeginIndex, EndIndex: Integer);

{--------------------------------
  判断数组里是否包含指定元素。
  Tested in TestUnit.
 --------------------------------}
function mnInStrs  (const Value: string;    const Arr: array of string):    Boolean;
function mnInInts  (const Value: Integer;   const Arr: array of Integer):   Boolean;
function mnInFloats(const Value: Extended;  const Arr: array of Extended):  Boolean;
function mnInDTs   (const Value: TDateTime; const Arr: array of TDateTime): Boolean;
function mnInCurrs (const Value: Currency;  const Arr: array of Currency):  Boolean;

{--------------------------------
  在数组里查找指定元素，返回其索引。如果找不到，返回-1。
  Tested in TestUnit.
 --------------------------------}
function mnIndexOfStrs  (const Value: string;    const Arr: array of string):    Integer;
function mnIndexOfInts  (const Value: Integer;   const Arr: array of Integer):   Integer;
function mnIndexOfFloats(const Value: Extended;  const Arr: array of Extended):  Integer;
function mnIndexOfDTs   (const Value: TDateTime; const Arr: array of TDateTime): Integer;
function mnIndexOfCurrs (const Value: Currency;  const Arr: array of Currency):  Integer;

{--------------------------------
  得到一个Variant Array在指定维度上的长度。
  Tested in TestUnit.
 --------------------------------}
function mnVALength(const VA: Variant; const Dim: Integer): Integer;

{--------------------------------
  判断一个二维Variant Array是否能够包含指定范围。
  Tested in TestUnit.
 --------------------------------}
function mnVAContainRangeDim2(const VA: Variant; const Index1Begin, Index1End, Index2Begin, Index2End: Integer): Boolean;

{--------------------------------
  检查一个Variant Array是否是一维或二维，如果不是，则抛出异常。
  Tested in TestUnit.
 --------------------------------}
procedure mnCheckVADim1(const VA: Variant);
procedure mnCheckVADim2(const VA: Variant);
{--------------------------------
  检查一个Variant Array是否能够包含指定范围，如果不是，则抛出异常。
  Tested in TestUnit.
 --------------------------------}
procedure mnCheckVAContainRangeDim2(const VA: Variant; const Index1Begin, Index1End, Index2Begin, Index2End: Integer);

{--------------------------------
  将一个一维Variant Array转换为Variant、字符串、整数、浮点数、时间或货币的一维数组。
  数组必须事先分配好空间，且长度不小于Variant Array的长度。
  Tested in TestUnit.
 --------------------------------}
procedure mnVAToArray(const VA: Variant; var Arr: array of Variant);   overload;
procedure mnVAToArray(const VA: Variant; var Arr: array of string);    overload;
procedure mnVAToArray(const VA: Variant; var Arr: array of Integer);   overload;
procedure mnVAToArray(const VA: Variant; var Arr: array of Extended);  overload;
procedure mnVAToArray(const VA: Variant; var Arr: array of TDateTime); overload;
procedure mnVAToArray(const VA: Variant; var Arr: array of Currency);  overload;

{--------------------------------
  将一个Variant、字符串、整数、浮点数、时间或货币的一维数组转换为一维Variant Array。
  转换成的Variant Array是一维的，下标为1，上标为数组的长度。
  Tested in TestUnit.
 --------------------------------}
function mnArrayToVA(const Arr: array of Variant):   Variant; overload;
function mnArrayToVA(const Arr: array of string):    Variant; overload;
function mnArrayToVA(const Arr: array of Integer):   Variant; overload;
function mnArrayToVA(const Arr: array of Extended):  Variant; overload;
function mnArrayToVA(const Arr: array of TDateTime): Variant; overload;
function mnArrayToVA(const Arr: array of Currency):  Variant; overload;

{--------------------------------
  将一个二维Variant Array转换为Variant、字符串或整数的二维数组。
  不带A的表示数组必须事先分配好空间，且长度不小于Variant Array的长度。
  带A的表示数组不需要事先分配空间，函数内部会给它们设置。设置后数组每个维度的下标为0，上标为Variant Array在这个维度上的长度减1。
  Tested in TestUnit.
 --------------------------------}
procedure mnVAToArrayDim2  (const VA: Variant; var Arr: mnTVarArrayDim2); overload;
procedure mnVAToArrayDim2  (const VA: Variant; var Arr: mnTStrArrayDim2); overload;
procedure mnVAToArrayDim2  (const VA: Variant; var Arr: mnTIntArrayDim2); overload;
procedure mnVAToArrayDim2_A(const VA: Variant; var Arr: mnTVarArrayDim2); overload;
procedure mnVAToArrayDim2_A(const VA: Variant; var Arr: mnTStrArrayDim2); overload;
procedure mnVAToArrayDim2_A(const VA: Variant; var Arr: mnTIntArrayDim2); overload;

{--------------------------------
  将一个Variant、字符串或整数的二维数组转换为二维Variant Array。
  转换成的Variant Array是二维的，每个维度的下标为1，上标为数组在这个维度上的长度。
  Tested in TestUnit.
 --------------------------------}
function mnArrayToVADim2(const Arr: mnTVarArrayDim2): Variant; overload;
function mnArrayToVADim2(const Arr: mnTStrArrayDim2): Variant; overload;
function mnArrayToVADim2(const Arr: mnTIntArrayDim2): Variant; overload;

{--------------------------------
  将一个二维Variant Array转换为Variant、字符串或整数的二维数组，和mnVAToArrayDim2系列函数类似。
  不同的是，带Part的函数只转换源Variant Array的一部分，这部分区域由Index1Begin, Index1End, Index2Begin, Index2End定义。
  Index1Begin, Index1End, Index2Begin, Index2End遵循Variant Array的定义规则，下标从1开始。
  Tested in TestUnit.
 --------------------------------}
procedure mnPartVAToArrayDim2  (const VA: Variant; var Arr: mnTVarArrayDim2; const Index1Begin, Index1End, Index2Begin, Index2End: Integer); overload;
procedure mnPartVAToArrayDim2  (const VA: Variant; var Arr: mnTStrArrayDim2; const Index1Begin, Index1End, Index2Begin, Index2End: Integer); overload;
procedure mnPartVAToArrayDim2  (const VA: Variant; var Arr: mnTIntArrayDim2; const Index1Begin, Index1End, Index2Begin, Index2End: Integer); overload;
procedure mnPartVAToArrayDim2_A(const VA: Variant; var Arr: mnTVarArrayDim2; const Index1Begin, Index1End, Index2Begin, Index2End: Integer); overload;
procedure mnPartVAToArrayDim2_A(const VA: Variant; var Arr: mnTStrArrayDim2; const Index1Begin, Index1End, Index2Begin, Index2End: Integer); overload;
procedure mnPartVAToArrayDim2_A(const VA: Variant; var Arr: mnTIntArrayDim2; const Index1Begin, Index1End, Index2Begin, Index2End: Integer); overload;

{--------------------------------
  将一个Variant、字符串或整数的二维数组转换为二维Variant Array，和mnArrayToVADim2系列函数类似。
  不同的是，带Part的函数只转换到目标Variant Array的一部分，这部分区域以Index1Begin, Index2Begin为左上角，
  大小等于源数组的大小。目标的其它区域不变。
  Index1Begin, Index2Begin遵循Variant Array的定义规则，下标从1开始。
  目标Variant Array必须事先分配好空间，且包含完整的区域。
  Tested in TestUnit.
 --------------------------------}
procedure mnPartArrayToVADim2(const Arr: mnTVarArrayDim2; var VA: Variant; const Index1Begin, Index2Begin: Integer); overload;
procedure mnPartArrayToVADim2(const Arr: mnTStrArrayDim2; var VA: Variant; const Index1Begin, Index2Begin: Integer); overload;
procedure mnPartArrayToVADim2(const Arr: mnTIntArrayDim2; var VA: Variant; const Index1Begin, Index2Begin: Integer); overload;

{--------------------------------
  将一个二维Variant Array的某Index1下的一部分转换为Variant、字符串、整数、浮点数、时间或货币的一维数组。
  数组必须事先分配好空间，且长度不小于需转换部分的长度。
  Index1, Index2Begin, Index2End遵循Variant Array的定义规则，下标从1开始。
  Tested in TestUnit.
 --------------------------------}
procedure mnBase1VAToArrayDim2(const VA: Variant; var Arr: array of Variant;   const Index1, Index2Begin, Index2End: Integer); overload;
procedure mnBase1VAToArrayDim2(const VA: Variant; var Arr: array of string;    const Index1, Index2Begin, Index2End: Integer); overload;
procedure mnBase1VAToArrayDim2(const VA: Variant; var Arr: array of Integer;   const Index1, Index2Begin, Index2End: Integer); overload;
procedure mnBase1VAToArrayDim2(const VA: Variant; var Arr: array of Extended;  const Index1, Index2Begin, Index2End: Integer); overload;
procedure mnBase1VAToArrayDim2(const VA: Variant; var Arr: array of TDateTime; const Index1, Index2Begin, Index2End: Integer); overload;
procedure mnBase1VAToArrayDim2(const VA: Variant; var Arr: array of Currency;  const Index1, Index2Begin, Index2End: Integer); overload;
{--------------------------------
  将一个二维Variant Array的某Index2下的一部分转换为Variant、字符串、整数、浮点数、时间或货币的一维数组。
  数组必须事先分配好空间，且长度不小于需转换部分的长度。
  Index1Begin, Index1End, Index2遵循Variant Array的定义规则，下标从1开始。
  Tested in TestUnit.
 --------------------------------}
procedure mnBase2VAToArrayDim2(const VA: Variant; var Arr: array of Variant;   const Index1Begin, Index1End, Index2: Integer); overload;
procedure mnBase2VAToArrayDim2(const VA: Variant; var Arr: array of string;    const Index1Begin, Index1End, Index2: Integer); overload;
procedure mnBase2VAToArrayDim2(const VA: Variant; var Arr: array of Integer;   const Index1Begin, Index1End, Index2: Integer); overload;
procedure mnBase2VAToArrayDim2(const VA: Variant; var Arr: array of Extended;  const Index1Begin, Index1End, Index2: Integer); overload;
procedure mnBase2VAToArrayDim2(const VA: Variant; var Arr: array of TDateTime; const Index1Begin, Index1End, Index2: Integer); overload;
procedure mnBase2VAToArrayDim2(const VA: Variant; var Arr: array of Currency;  const Index1Begin, Index1End, Index2: Integer); overload;

{--------------------------------
  将一个Variant、字符串、整数、浮点数、时间或货币的一维数组转换到二维Variant Array的某Index1下的一部分。
  目标Variant Array必须事先分配好空间，且包含完整的[Index1, Index2, Index1, Index2+源数组的长度-1]区域。
  Index1, Index2遵循Variant Array的定义规则，下标从1开始。
  Tested in TestUnit.
 --------------------------------}
procedure mnBase1ArrayToVADim2(const Arr: array of Variant;   var VA: Variant; const Index1, Index2: Integer); overload;
procedure mnBase1ArrayToVADim2(const Arr: array of string;    var VA: Variant; const Index1, Index2: Integer); overload;
procedure mnBase1ArrayToVADim2(const Arr: array of Integer;   var VA: Variant; const Index1, Index2: Integer); overload;
procedure mnBase1ArrayToVADim2(const Arr: array of Extended;  var VA: Variant; const Index1, Index2: Integer); overload;
procedure mnBase1ArrayToVADim2(const Arr: array of TDateTime; var VA: Variant; const Index1, Index2: Integer); overload;
procedure mnBase1ArrayToVADim2(const Arr: array of Currency;  var VA: Variant; const Index1, Index2: Integer); overload;
{--------------------------------
  将一个Variant、字符串、整数、浮点数、时间或货币的一维数组转换到二维Variant Array的某Index2下的一部分。
  目标Variant Array必须事先分配好空间，且包含完整的[Index1, Index2, Index1+源数组的长度-1, Index2]区域。
  Index1, Index2遵循Variant Array的定义规则，下标从1开始。
  Tested in TestUnit.
 --------------------------------}
procedure mnBase2ArrayToVADim2(const Arr: array of Variant;   var VA: Variant; const Index1, Index2: Integer); overload;
procedure mnBase2ArrayToVADim2(const Arr: array of string;    var VA: Variant; const Index1, Index2: Integer); overload;
procedure mnBase2ArrayToVADim2(const Arr: array of Integer;   var VA: Variant; const Index1, Index2: Integer); overload;
procedure mnBase2ArrayToVADim2(const Arr: array of Extended;  var VA: Variant; const Index1, Index2: Integer); overload;
procedure mnBase2ArrayToVADim2(const Arr: array of TDateTime; var VA: Variant; const Index1, Index2: Integer); overload;
procedure mnBase2ArrayToVADim2(const Arr: array of Currency;  var VA: Variant; const Index1, Index2: Integer); overload;

implementation

uses SysUtils, mnResStrsU, Windows, mnMath, Variants;

function mnArrayCompare(const ArrayA, ArrayB; const ElementSize: Integer): Boolean;
var
  PA, PB: PLongint;
  Len: Integer;
begin
  PA := PLongint(ArrayA);
  PB := PLongint(ArrayB);

  Dec(PA);
  Dec(PB);
  Result := PA^ = PB^;
  if not Result then Exit;
  Len := PA^;

  Result := CompareMem(PChar(PA), PChar(PB), Len * ElementSize + SizeOf(Longint));
end;

procedure mnArrayCopy(const SrcArray, DstArray; const ElementSize, SrcIndex, DstIndex: Integer; Count: Integer);
var
  SrcP, DstP: PLongint;
  SrcLen, DstLen: Integer;
begin
  SrcP := PLongint(SrcArray);
  DstP := PLongint(DstArray);

  Dec(SrcP);
  SrcLen := SrcP^;
  if (SrcIndex < 0) or (SrcIndex >= SrcLen) then mnCreateError(SArrayCopySrcIndexError, [SrcIndex, SrcLen]);
  Dec(DstP);
  DstLen := DstP^;
  if (DstIndex < 0) or (DstIndex >= DstLen) then mnCreateError(SArrayCopyDstIndexError, [DstIndex, DstLen]);

  if Count > SrcLen - SrcIndex then Count := SrcLen - SrcIndex;
  if Count > DstLen - DstIndex then Count := DstLen - DstIndex;

  CopyMemory(PChar(DstP) + DstIndex * ElementSize + SizeOf(Longint),
             PChar(SrcP) + SrcIndex * ElementSize + SizeOf(Longint),
             Count * ElementSize);
end;

function mnArrayAppend(var AnArray; const ElementSize: Integer; const Count: Integer = 1): Integer;
var
  P: PLongint;
  i: Integer;
begin
  P := PLongint(AnArray);

  Dec(P);
  Result := P^;
  Dec(P);
  ReallocMem(P, (Result+Count) * ElementSize + 2 * SizeOf(Longint));
  Inc(P);
  P^ := Result + Count;
  Inc(P);

  for i := Result to Result+Count-1 do
    Move(mnPNull, PChar(Integer(P) + i * ElementSize)^, ElementSize);

  PLongint(AnArray) := P;
end;

procedure mnArrayInsert(var AnArray; const ElementSize, Index: Integer; const Count: Integer = 1);
var
  P: PLongint;
  Len: Integer;
  i: Integer;
begin
  P := PLongint(AnArray);

  Dec(P);
  Len := P^;
  if (Index < 0) or (Index > Len) then mnCreateError(SArrayInsertIndexError, [Index, Len]);
  Dec(P);
  ReallocMem(P, (Len+Count) * ElementSize + 2 * SizeOf(Longint));
  Inc(P);
  P^ := Len + Count;
  Inc(P);

  MoveMemory(PChar(P) + (Index+Count) * ElementSize,
             PChar(P) + Index * ElementSize,
             (Len-Index) * ElementSize);

  for i := Index to Index+Count-1 do
    Move(mnPNull, PChar(Integer(P) + i * ElementSize)^, ElementSize);

  PLongint(AnArray) := P;
end;

procedure mnArrayDelete(var AnArray; const ElementSize, Index: Integer; Count: Integer = 1);
var
  P: PLongint;
  Len: Integer;
begin
  P := PLongint(AnArray);

  Dec(P);
  Len := P^;
  if (Index < 0) or (Index >= Len) then mnCreateError(SArrayDeleteIndexError, [Index, Len]);
  Inc(P);
  if Count > Len - Index then Count := Len - Index;

  MoveMemory(PChar(P) + Index * ElementSize,
             PChar(P) + (Index+Count) * ElementSize,
             (Len-Index-Count) * ElementSize);

  Dec(P);
  Dec(P);
  ReallocMem(P, (Len-Count) * ElementSize + 2 * SizeOf(Longint));
  Inc(P);
  P^ := Len - Count;
  Inc(P);

  PLongint(AnArray) := P;
end;

procedure mnArrayShuffle(var AnArray; const ElementSize, BeginIndex, EndIndex: Integer);
var
  i: Integer;
  R1, R2: Integer;
  P: Pointer;
begin
  Randomize;
  P := AllocMem(ElementSize);
  try
    for i := 1 to (EndIndex-BeginIndex+1)*10 do
    begin
      R1 := Random(EndIndex-BeginIndex+1) + BeginIndex;
      R2 := Random(EndIndex-BeginIndex+1) + BeginIndex;

      if R1 <> R2 then
      begin
        CopyMemory(P, PChar(AnArray) + R1 * ElementSize, ElementSize);
        CopyMemory(PChar(AnArray) + R1 * ElementSize, PChar(AnArray) + R2 * ElementSize, ElementSize);
        CopyMemory(PChar(AnArray) + R2 * ElementSize, P, ElementSize);
      end;
    end;
  finally
    FreeMem(P);
  end;
end;

function mnInStrs  (const Value: string;    const Arr: array of string):    Boolean;
var
  Element: string;
begin
  for Element in Arr do
    if Element = Value then
    begin
      Result := True;
      Exit;
    end;
  Result := False;
end;

function mnInInts  (const Value: Integer;   const Arr: array of Integer):   Boolean;
var
  Element: Integer;
begin
  for Element in Arr do
    if Element = Value then
    begin
      Result := True;
      Exit;
    end;
  Result := False;
end;

function mnInFloats(const Value: Extended;  const Arr: array of Extended):  Boolean;
var
  Element: Extended;
begin
  for Element in Arr do
    if mnFloatEQ(Element, Value) then
    begin
      Result := True;
      Exit;
    end;
  Result := False;
end;

function mnInDTs   (const Value: TDateTime; const Arr: array of TDateTime): Boolean;
var
  Element: TDateTime;
begin
  for Element in Arr do
    if mnFloatEQ(Element, Value) then
    begin
      Result := True;
      Exit;
    end;
  Result := False;
end;

function mnInCurrs (const Value: Currency;  const Arr: array of Currency):  Boolean;
var
  Element: Currency;
begin
  for Element in Arr do
    if mnFloatEQ(Element, Value) then
    begin
      Result := True;
      Exit;
    end;
  Result := False;
end;

function mnIndexOfStrs  (const Value: string;    const Arr: array of string):    Integer;
var
  i: Integer;
begin
  for i := Low(Arr) to High(Arr) do
    if Arr[i] = Value then
    begin
      Result := i;
      Exit;
    end;
  Result := -1;
end;

function mnIndexOfInts  (const Value: Integer;   const Arr: array of Integer):   Integer;
var
  i: Integer;
begin
  for i := Low(Arr) to High(Arr) do
    if Arr[i] = Value then
    begin
      Result := i;
      Exit;
    end;
  Result := -1;
end;

function mnIndexOfFloats(const Value: Extended;  const Arr: array of Extended):  Integer;
var
  i: Integer;
begin
  for i := Low(Arr) to High(Arr) do
    if mnFloatEQ(Arr[i], Value) then
    begin
      Result := i;
      Exit;
    end;
  Result := -1;
end;

function mnIndexOfDTs   (const Value: TDateTime; const Arr: array of TDateTime): Integer;
var
  i: Integer;
begin
  for i := Low(Arr) to High(Arr) do
    if mnFloatEQ(Arr[i], Value) then
    begin
      Result := i;
      Exit;
    end;
  Result := -1;
end;

function mnIndexOfCurrs (const Value: Currency;  const Arr: array of Currency):  Integer;
var
  i: Integer;
begin
  for i := Low(Arr) to High(Arr) do
    if mnFloatEQ(Arr[i], Value) then
    begin
      Result := i;
      Exit;
    end;
  Result := -1;
end;

function mnVALength(const VA: Variant; const Dim: Integer): Integer;
begin
  Result := VarArrayHighBound(VA, Dim) - VarArrayLowBound(VA, Dim) + 1;
end;

function mnVAContainRangeDim2(const VA: Variant; const Index1Begin, Index1End, Index2Begin, Index2End: Integer): Boolean;
begin
  Result := (VarArrayLowBound(VA, 1) <= Index1Begin) and (VarArrayHighBound(VA, 1) >= Index1End) and
            (VarArrayLowBound(VA, 2) <= Index2Begin) and (VarArrayHighBound(VA, 2) >= Index2End);
end;

procedure mnCheckVADim1(const VA: Variant);
begin
  mnCreateErrorIf(VarArrayDimCount(VA) <> 1, SVANotDim1);
end;

procedure mnCheckVADim2(const VA: Variant);
begin
  mnCreateErrorIf(VarArrayDimCount(VA) <> 2, SVANotDim2);
end;

procedure mnCheckVAContainRangeDim2(const VA: Variant; const Index1Begin, Index1End, Index2Begin, Index2End: Integer);
begin
  mnCreateErrorIf(not mnVAContainRangeDim2(VA, Index1Begin, Index1End, Index2Begin, Index2End), SVANotContainRangeDim2,
    [VarArrayLowBound(VA, 1), VarArrayHighBound(VA, 1), VarArrayLowBound(VA, 2), VarArrayHighBound(VA, 2),
     Index1Begin, Index1End, Index2Begin, Index2End]);
end;

procedure mnVAToArray(const VA: Variant; var Arr: array of Variant);   overload;
var
  i: Integer;
  LowBound, HighBound: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim1(VA);
  mnCreateErrorIf(mnVALength(VA, 1) > Length(Arr), SArrayTooShort, [Length(Arr), mnVALength(VA, 1)]);
{$ENDIF}
  try
    VarArrayLock(VA);
    LowBound := VarArrayLowBound(VA, 1);
    HighBound := VarArrayHighBound(VA, 1);
    for i := LowBound to HighBound do
      Arr[i-LowBound] := VarArrayGet(VA, [i]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnVAToArray(const VA: Variant; var Arr: array of string);    overload;
var
  i: Integer;
  LowBound, HighBound: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim1(VA);
  mnCreateErrorIf(mnVALength(VA, 1) > Length(Arr), SArrayTooShort, [Length(Arr), mnVALength(VA, 1)]);
{$ENDIF}
  try
    VarArrayLock(VA);
    LowBound := VarArrayLowBound(VA, 1);
    HighBound := VarArrayHighBound(VA, 1);
    for i := LowBound to HighBound do
      Arr[i-LowBound] := VarArrayGet(VA, [i]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnVAToArray(const VA: Variant; var Arr: array of Integer);   overload;
var
  i: Integer;
  LowBound, HighBound: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim1(VA);
  mnCreateErrorIf(mnVALength(VA, 1) > Length(Arr), SArrayTooShort, [Length(Arr), mnVALength(VA, 1)]);
{$ENDIF}
  try
    VarArrayLock(VA);
    LowBound := VarArrayLowBound(VA, 1);
    HighBound := VarArrayHighBound(VA, 1);
    for i := LowBound to HighBound do
      Arr[i-LowBound] := VarArrayGet(VA, [i]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnVAToArray(const VA: Variant; var Arr: array of Extended);  overload;
var
  i: Integer;
  LowBound, HighBound: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim1(VA);
  mnCreateErrorIf(mnVALength(VA, 1) > Length(Arr), SArrayTooShort, [Length(Arr), mnVALength(VA, 1)]);
{$ENDIF}
  try
    VarArrayLock(VA);
    LowBound := VarArrayLowBound(VA, 1);
    HighBound := VarArrayHighBound(VA, 1);
    for i := LowBound to HighBound do
      Arr[i-LowBound] := VarArrayGet(VA, [i]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnVAToArray(const VA: Variant; var Arr: array of TDateTime); overload;
var
  i: Integer;
  LowBound, HighBound: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim1(VA);
  mnCreateErrorIf(mnVALength(VA, 1) > Length(Arr), SArrayTooShort, [Length(Arr), mnVALength(VA, 1)]);
{$ENDIF}
  try
    VarArrayLock(VA);
    LowBound := VarArrayLowBound(VA, 1);
    HighBound := VarArrayHighBound(VA, 1);
    for i := LowBound to HighBound do
      Arr[i-LowBound] := VarArrayGet(VA, [i]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnVAToArray(const VA: Variant; var Arr: array of Currency);  overload;
var
  i: Integer;
  LowBound, HighBound: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim1(VA);
  mnCreateErrorIf(mnVALength(VA, 1) > Length(Arr), SArrayTooShort, [Length(Arr), mnVALength(VA, 1)]);
{$ENDIF}
  try
    VarArrayLock(VA);
    LowBound := VarArrayLowBound(VA, 1);
    HighBound := VarArrayHighBound(VA, 1);
    for i := LowBound to HighBound do
      Arr[i-LowBound] := VarArrayGet(VA, [i]);
  finally
    VarArrayUnlock(VA);
  end;
end;

function mnArrayToVA(const Arr: array of Variant):   Variant; overload;
var
  i: Integer;
begin
  if Length(Arr) = 0 then
  begin
    Result := Unassigned;
    Exit;
  end;

  Result := VarArrayCreate([1, Length(Arr)], varVariant);
  try
    VarArrayLock(Result);
    for i := 0 to Length(Arr)-1 do
      VarArrayPut(Result, Arr[i], [i+1]);
  finally
    VarArrayUnlock(Result);
  end;
end;

function mnArrayToVA(const Arr: array of string):    Variant; overload;
var
  i: Integer;
begin
  if Length(Arr) = 0 then
  begin
    Result := Unassigned;
    Exit;
  end;

  Result := VarArrayCreate([1, Length(Arr)], varVariant);
  try
    VarArrayLock(Result);
    for i := 0 to Length(Arr)-1 do
      VarArrayPut(Result, Arr[i], [i+1]);
  finally
    VarArrayUnlock(Result);
  end;
end;

function mnArrayToVA(const Arr: array of Integer):   Variant; overload;
var
  i: Integer;
begin
  if Length(Arr) = 0 then
  begin
    Result := Unassigned;
    Exit;
  end;

  Result := VarArrayCreate([1, Length(Arr)], varVariant);
  try
    VarArrayLock(Result);
    for i := 0 to Length(Arr)-1 do
      VarArrayPut(Result, Arr[i], [i+1]);
  finally
    VarArrayUnlock(Result);
  end;
end;

function mnArrayToVA(const Arr: array of Extended):  Variant; overload;
var
  i: Integer;
begin
  if Length(Arr) = 0 then
  begin
    Result := Unassigned;
    Exit;
  end;

  Result := VarArrayCreate([1, Length(Arr)], varVariant);
  try
    VarArrayLock(Result);
    for i := 0 to Length(Arr)-1 do
      VarArrayPut(Result, Arr[i], [i+1]);
  finally
    VarArrayUnlock(Result);
  end;
end;

function mnArrayToVA(const Arr: array of TDateTime): Variant; overload;
var
  i: Integer;
begin
  if Length(Arr) = 0 then
  begin
    Result := Unassigned;
    Exit;
  end;

  Result := VarArrayCreate([1, Length(Arr)], varVariant);
  try
    VarArrayLock(Result);
    for i := 0 to Length(Arr)-1 do
      VarArrayPut(Result, Arr[i], [i+1]);
  finally
    VarArrayUnlock(Result);
  end;
end;

function mnArrayToVA(const Arr: array of Currency):  Variant; overload;
var
  i: Integer;
begin
  if Length(Arr) = 0 then
  begin
    Result := Unassigned;
    Exit;
  end;

  Result := VarArrayCreate([1, Length(Arr)], varVariant);
  try
    VarArrayLock(Result);
    for i := 0 to Length(Arr)-1 do
      VarArrayPut(Result, Arr[i], [i+1]);
  finally
    VarArrayUnlock(Result);
  end;
end;

procedure mnVAToArrayDim2  (const VA: Variant; var Arr: mnTVarArrayDim2); overload;
var
  i, j: Integer;
  LowBound1, HighBound1: Integer;
  LowBound2, HighBound2: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCreateErrorIf(mnVALength(VA, 1) > Length(Arr),    SArrayTooShort, [Length(Arr),    mnVALength(VA, 1)]);
  mnCreateErrorIf(mnVALength(VA, 2) > Length(Arr[0]), SArrayTooShort, [Length(Arr[0]), mnVALength(VA, 2)]);
{$ENDIF}
  try
    VarArrayLock(VA);
    LowBound1 := VarArrayLowBound(VA, 1);
    HighBound1 := VarArrayHighBound(VA, 1);
    LowBound2 := VarArrayLowBound(VA, 2);
    HighBound2 := VarArrayHighBound(VA, 2);
    for i := LowBound1 to HighBound1 do
      for j := LowBound2 to HighBound2 do
        Arr[i-LowBound1, j-LowBound2] := VarArrayGet(VA, [i, j]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnVAToArrayDim2  (const VA: Variant; var Arr: mnTStrArrayDim2); overload;
var
  i, j: Integer;
  LowBound1, HighBound1: Integer;
  LowBound2, HighBound2: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCreateErrorIf(mnVALength(VA, 1) > Length(Arr),    SArrayTooShort, [Length(Arr),    mnVALength(VA, 1)]);
  mnCreateErrorIf(mnVALength(VA, 2) > Length(Arr[0]), SArrayTooShort, [Length(Arr[0]), mnVALength(VA, 2)]);
{$ENDIF}
  try
    VarArrayLock(VA);
    LowBound1 := VarArrayLowBound(VA, 1);
    HighBound1 := VarArrayHighBound(VA, 1);
    LowBound2 := VarArrayLowBound(VA, 2);
    HighBound2 := VarArrayHighBound(VA, 2);
    for i := LowBound1 to HighBound1 do
      for j := LowBound2 to HighBound2 do
        Arr[i-LowBound1, j-LowBound2] := VarArrayGet(VA, [i, j]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnVAToArrayDim2  (const VA: Variant; var Arr: mnTIntArrayDim2); overload;
var
  i, j: Integer;
  LowBound1, HighBound1: Integer;
  LowBound2, HighBound2: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCreateErrorIf(mnVALength(VA, 1) > Length(Arr),    SArrayTooShort, [Length(Arr),    mnVALength(VA, 1)]);
  mnCreateErrorIf(mnVALength(VA, 2) > Length(Arr[0]), SArrayTooShort, [Length(Arr[0]), mnVALength(VA, 2)]);
{$ENDIF}
  try
    VarArrayLock(VA);
    LowBound1 := VarArrayLowBound(VA, 1);
    HighBound1 := VarArrayHighBound(VA, 1);
    LowBound2 := VarArrayLowBound(VA, 2);
    HighBound2 := VarArrayHighBound(VA, 2);
    for i := LowBound1 to HighBound1 do
      for j := LowBound2 to HighBound2 do
        Arr[i-LowBound1, j-LowBound2] := VarArrayGet(VA, [i, j]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnVAToArrayDim2_A(const VA: Variant; var Arr: mnTVarArrayDim2); overload;
var
  i, j: Integer;
  LowBound1, HighBound1: Integer;
  LowBound2, HighBound2: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
{$ENDIF}
  try
    VarArrayLock(VA);
    LowBound1 := VarArrayLowBound(VA, 1);
    HighBound1 := VarArrayHighBound(VA, 1);
    LowBound2 := VarArrayLowBound(VA, 2);
    HighBound2 := VarArrayHighBound(VA, 2);
    SetLength(Arr, HighBound1-LowBound1+1, HighBound2-LowBound2+1);
    for i := LowBound1 to HighBound1 do
      for j := LowBound2 to HighBound2 do
        Arr[i-LowBound1, j-LowBound2] := VarArrayGet(VA, [i, j]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnVAToArrayDim2_A(const VA: Variant; var Arr: mnTStrArrayDim2); overload;
var
  i, j: Integer;
  LowBound1, HighBound1: Integer;
  LowBound2, HighBound2: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
{$ENDIF}
  try
    VarArrayLock(VA);
    LowBound1 := VarArrayLowBound(VA, 1);
    HighBound1 := VarArrayHighBound(VA, 1);
    LowBound2 := VarArrayLowBound(VA, 2);
    HighBound2 := VarArrayHighBound(VA, 2);
    SetLength(Arr, HighBound1-LowBound1+1, HighBound2-LowBound2+1);
    for i := LowBound1 to HighBound1 do
      for j := LowBound2 to HighBound2 do
        Arr[i-LowBound1, j-LowBound2] := VarArrayGet(VA, [i, j]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnVAToArrayDim2_A(const VA: Variant; var Arr: mnTIntArrayDim2); overload;
var
  i, j: Integer;
  LowBound1, HighBound1: Integer;
  LowBound2, HighBound2: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
{$ENDIF}
  try
    VarArrayLock(VA);
    LowBound1 := VarArrayLowBound(VA, 1);
    HighBound1 := VarArrayHighBound(VA, 1);
    LowBound2 := VarArrayLowBound(VA, 2);
    HighBound2 := VarArrayHighBound(VA, 2);
    SetLength(Arr, HighBound1-LowBound1+1, HighBound2-LowBound2+1);
    for i := LowBound1 to HighBound1 do
      for j := LowBound2 to HighBound2 do
        Arr[i-LowBound1, j-LowBound2] := VarArrayGet(VA, [i, j]);
  finally
    VarArrayUnlock(VA);
  end;
end;

function mnArrayToVADim2(const Arr: mnTVarArrayDim2): Variant; overload;
var
  i, j: Integer;
begin
  if (Length(Arr) = 0) or (Length(Arr[0]) = 0) then
  begin
    Result := Unassigned;
    Exit;
  end;

  Result := VarArrayCreate([1, Length(Arr), 1, Length(Arr[0])], varVariant);
  try
    VarArrayLock(Result);
    for i := 0 to Length(Arr)-1 do
      for j := 0 to Length(Arr[i])-1 do
        VarArrayPut(Result, Arr[i][j], [i+1, j+1]);
  finally
    VarArrayUnlock(Result);
  end;
end;

function mnArrayToVADim2(const Arr: mnTStrArrayDim2): Variant; overload;
var
  i, j: Integer;
begin
  if (Length(Arr) = 0) or (Length(Arr[0]) = 0) then
  begin
    Result := Unassigned;
    Exit;
  end;

  Result := VarArrayCreate([1, Length(Arr), 1, Length(Arr[0])], varVariant);
  try
    VarArrayLock(Result);
    for i := 0 to Length(Arr)-1 do
      for j := 0 to Length(Arr[i])-1 do
        VarArrayPut(Result, Arr[i][j], [i+1, j+1]);
  finally
    VarArrayUnlock(Result);
  end;
end;

function mnArrayToVADim2(const Arr: mnTIntArrayDim2): Variant; overload;
var
  i, j: Integer;
begin
  if (Length(Arr) = 0) or (Length(Arr[0]) = 0) then
  begin
    Result := Unassigned;
    Exit;
  end;

  Result := VarArrayCreate([1, Length(Arr), 1, Length(Arr[0])], varVariant);
  try
    VarArrayLock(Result);
    for i := 0 to Length(Arr)-1 do
      for j := 0 to Length(Arr[i])-1 do
        VarArrayPut(Result, Arr[i][j], [i+1, j+1]);
  finally
    VarArrayUnlock(Result);
  end;
end;

procedure mnPartVAToArrayDim2  (const VA: Variant; var Arr: mnTVarArrayDim2; const Index1Begin, Index1End, Index2Begin, Index2End: Integer); overload;
var
  i, j: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1Begin, Index1End, Index2Begin, Index2End);
  mnCreateErrorIf(Index1End-Index1Begin+1 > Length(Arr),    SArrayTooShort, [Length(Arr),    Index1End-Index1Begin+1]);
  mnCreateErrorIf(Index2End-Index2Begin+1 > Length(Arr[0]), SArrayTooShort, [Length(Arr[0]), Index2End-Index2Begin+1]);
{$ENDIF}
  try
    VarArrayLock(VA);
    for i := Index1Begin to Index1End do
      for j := Index2Begin to Index2End do
        Arr[i-Index1Begin, j-Index2Begin] := VarArrayGet(VA, [i, j]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnPartVAToArrayDim2  (const VA: Variant; var Arr: mnTStrArrayDim2; const Index1Begin, Index1End, Index2Begin, Index2End: Integer); overload;
var
  i, j: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1Begin, Index1End, Index2Begin, Index2End);
  mnCreateErrorIf(Index1End-Index1Begin+1 > Length(Arr),    SArrayTooShort, [Length(Arr),    Index1End-Index1Begin+1]);
  mnCreateErrorIf(Index2End-Index2Begin+1 > Length(Arr[0]), SArrayTooShort, [Length(Arr[0]), Index2End-Index2Begin+1]);
{$ENDIF}
  try
    VarArrayLock(VA);
    for i := Index1Begin to Index1End do
      for j := Index2Begin to Index2End do
        Arr[i-Index1Begin, j-Index2Begin] := VarArrayGet(VA, [i, j]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnPartVAToArrayDim2  (const VA: Variant; var Arr: mnTIntArrayDim2; const Index1Begin, Index1End, Index2Begin, Index2End: Integer); overload;
var
  i, j: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1Begin, Index1End, Index2Begin, Index2End);
  mnCreateErrorIf(Index1End-Index1Begin+1 > Length(Arr),    SArrayTooShort, [Length(Arr),    Index1End-Index1Begin+1]);
  mnCreateErrorIf(Index2End-Index2Begin+1 > Length(Arr[0]), SArrayTooShort, [Length(Arr[0]), Index2End-Index2Begin+1]);
{$ENDIF}
  try
    VarArrayLock(VA);
    for i := Index1Begin to Index1End do
      for j := Index2Begin to Index2End do
        Arr[i-Index1Begin, j-Index2Begin] := VarArrayGet(VA, [i, j]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnPartVAToArrayDim2_A(const VA: Variant; var Arr: mnTVarArrayDim2; const Index1Begin, Index1End, Index2Begin, Index2End: Integer); overload;
var
  i, j: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1Begin, Index1End, Index2Begin, Index2End);
{$ENDIF}
  try
    VarArrayLock(VA);
    SetLength(Arr, Index1End-Index1Begin+1, Index2End-Index2Begin+1);
    for i := Index1Begin to Index1End do
      for j := Index2Begin to Index2End do
        Arr[i-Index1Begin, j-Index2Begin] := VarArrayGet(VA, [i, j]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnPartVAToArrayDim2_A(const VA: Variant; var Arr: mnTStrArrayDim2; const Index1Begin, Index1End, Index2Begin, Index2End: Integer); overload;
var
  i, j: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1Begin, Index1End, Index2Begin, Index2End);
{$ENDIF}
  try
    VarArrayLock(VA);
    SetLength(Arr, Index1End-Index1Begin+1, Index2End-Index2Begin+1);
    for i := Index1Begin to Index1End do
      for j := Index2Begin to Index2End do
        Arr[i-Index1Begin, j-Index2Begin] := VarArrayGet(VA, [i, j]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnPartVAToArrayDim2_A(const VA: Variant; var Arr: mnTIntArrayDim2; const Index1Begin, Index1End, Index2Begin, Index2End: Integer); overload;
var
  i, j: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1Begin, Index1End, Index2Begin, Index2End);
{$ENDIF}
  try
    VarArrayLock(VA);
    SetLength(Arr, Index1End-Index1Begin+1, Index2End-Index2Begin+1);
    for i := Index1Begin to Index1End do
      for j := Index2Begin to Index2End do
        Arr[i-Index1Begin, j-Index2Begin] := VarArrayGet(VA, [i, j]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnPartArrayToVADim2(const Arr: mnTVarArrayDim2; var VA: Variant; const Index1Begin, Index2Begin: Integer); overload;
var
  i, j: Integer;
  Index1End, Index2End: Integer;
begin
  Index1End := Index1Begin + Length(Arr) - 1;
  if Index1End < Index1Begin then Exit;
  Index2End := Index2Begin + Length(Arr[0]) - 1;
  if Index2End < Index2Begin then Exit;
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1Begin, Index1End, Index2Begin, Index2End);
{$ENDIF}
  try
    VarArrayLock(VA);
    for i := Index1Begin to Index1End do
      for j := Index2Begin to Index2End do
        VarArrayPut(VA, Arr[i-Index1Begin][j-Index2Begin], [i, j]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnPartArrayToVADim2(const Arr: mnTStrArrayDim2; var VA: Variant; const Index1Begin, Index2Begin: Integer); overload;
var
  i, j: Integer;
  Index1End, Index2End: Integer;
begin
  Index1End := Index1Begin + Length(Arr) - 1;
  if Index1End < Index1Begin then Exit;
  Index2End := Index2Begin + Length(Arr[0]) - 1;
  if Index2End < Index2Begin then Exit;
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1Begin, Index1End, Index2Begin, Index2End);
{$ENDIF}
  try
    VarArrayLock(VA);
    for i := Index1Begin to Index1End do
      for j := Index2Begin to Index2End do
        VarArrayPut(VA, Arr[i-Index1Begin][j-Index2Begin], [i, j]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnPartArrayToVADim2(const Arr: mnTIntArrayDim2; var VA: Variant; const Index1Begin, Index2Begin: Integer); overload;
var
  i, j: Integer;
  Index1End, Index2End: Integer;
begin
  Index1End := Index1Begin + Length(Arr) - 1;
  if Index1End < Index1Begin then Exit;
  Index2End := Index2Begin + Length(Arr[0]) - 1;
  if Index2End < Index2Begin then Exit;
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1Begin, Index1End, Index2Begin, Index2End);
{$ENDIF}
  try
    VarArrayLock(VA);
    for i := Index1Begin to Index1End do
      for j := Index2Begin to Index2End do
        VarArrayPut(VA, Arr[i-Index1Begin][j-Index2Begin], [i, j]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase1VAToArrayDim2(const VA: Variant; var Arr: array of Variant;   const Index1, Index2Begin, Index2End: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1, Index1, Index2Begin, Index2End);
  mnCreateErrorIf(Index2End-Index2Begin+1 > Length(Arr), SArrayTooShort, [Length(Arr), Index2End-Index2Begin+1]);
{$ENDIF}
  try
    VarArrayLock(VA);
    for i := Index2Begin to Index2End do
      Arr[i-Index2Begin] := VarArrayGet(VA, [Index1, i]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase1VAToArrayDim2(const VA: Variant; var Arr: array of string;    const Index1, Index2Begin, Index2End: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1, Index1, Index2Begin, Index2End);
  mnCreateErrorIf(Index2End-Index2Begin+1 > Length(Arr), SArrayTooShort, [Length(Arr), Index2End-Index2Begin+1]);
{$ENDIF}
  try
    VarArrayLock(VA);
    for i := Index2Begin to Index2End do
      Arr[i-Index2Begin] := VarArrayGet(VA, [Index1, i]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase1VAToArrayDim2(const VA: Variant; var Arr: array of Integer;   const Index1, Index2Begin, Index2End: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1, Index1, Index2Begin, Index2End);
  mnCreateErrorIf(Index2End-Index2Begin+1 > Length(Arr), SArrayTooShort, [Length(Arr), Index2End-Index2Begin+1]);
{$ENDIF}
  try
    VarArrayLock(VA);
    for i := Index2Begin to Index2End do
      Arr[i-Index2Begin] := VarArrayGet(VA, [Index1, i]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase1VAToArrayDim2(const VA: Variant; var Arr: array of Extended;  const Index1, Index2Begin, Index2End: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1, Index1, Index2Begin, Index2End);
  mnCreateErrorIf(Index2End-Index2Begin+1 > Length(Arr), SArrayTooShort, [Length(Arr), Index2End-Index2Begin+1]);
{$ENDIF}
  try
    VarArrayLock(VA);
    for i := Index2Begin to Index2End do
      Arr[i-Index2Begin] := VarArrayGet(VA, [Index1, i]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase1VAToArrayDim2(const VA: Variant; var Arr: array of TDateTime; const Index1, Index2Begin, Index2End: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1, Index1, Index2Begin, Index2End);
  mnCreateErrorIf(Index2End-Index2Begin+1 > Length(Arr), SArrayTooShort, [Length(Arr), Index2End-Index2Begin+1]);
{$ENDIF}
  try
    VarArrayLock(VA);
    for i := Index2Begin to Index2End do
      Arr[i-Index2Begin] := VarArrayGet(VA, [Index1, i]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase1VAToArrayDim2(const VA: Variant; var Arr: array of Currency;  const Index1, Index2Begin, Index2End: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1, Index1, Index2Begin, Index2End);
  mnCreateErrorIf(Index2End-Index2Begin+1 > Length(Arr), SArrayTooShort, [Length(Arr), Index2End-Index2Begin+1]);
{$ENDIF}
  try
    VarArrayLock(VA);
    for i := Index2Begin to Index2End do
      Arr[i-Index2Begin] := VarArrayGet(VA, [Index1, i]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase2VAToArrayDim2(const VA: Variant; var Arr: array of Variant;   const Index1Begin, Index1End, Index2: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1Begin, Index1End, Index2, Index2);
  mnCreateErrorIf(Index1End-Index1Begin+1 > Length(Arr), SArrayTooShort, [Length(Arr), Index1End-Index1Begin+1]);
{$ENDIF}
  try
    VarArrayLock(VA);
    for i := Index1Begin to Index1End do
      Arr[i-Index1Begin] := VarArrayGet(VA, [i, Index2]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase2VAToArrayDim2(const VA: Variant; var Arr: array of string;    const Index1Begin, Index1End, Index2: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1Begin, Index1End, Index2, Index2);
  mnCreateErrorIf(Index1End-Index1Begin+1 > Length(Arr), SArrayTooShort, [Length(Arr), Index1End-Index1Begin+1]);
{$ENDIF}
  try
    VarArrayLock(VA);
    for i := Index1Begin to Index1End do
      Arr[i-Index1Begin] := VarArrayGet(VA, [i, Index2]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase2VAToArrayDim2(const VA: Variant; var Arr: array of Integer;   const Index1Begin, Index1End, Index2: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1Begin, Index1End, Index2, Index2);
  mnCreateErrorIf(Index1End-Index1Begin+1 > Length(Arr), SArrayTooShort, [Length(Arr), Index1End-Index1Begin+1]);
{$ENDIF}
  try
    VarArrayLock(VA);
    for i := Index1Begin to Index1End do
      Arr[i-Index1Begin] := VarArrayGet(VA, [i, Index2]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase2VAToArrayDim2(const VA: Variant; var Arr: array of Extended;  const Index1Begin, Index1End, Index2: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1Begin, Index1End, Index2, Index2);
  mnCreateErrorIf(Index1End-Index1Begin+1 > Length(Arr), SArrayTooShort, [Length(Arr), Index1End-Index1Begin+1]);
{$ENDIF}
  try
    VarArrayLock(VA);
    for i := Index1Begin to Index1End do
      Arr[i-Index1Begin] := VarArrayGet(VA, [i, Index2]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase2VAToArrayDim2(const VA: Variant; var Arr: array of TDateTime; const Index1Begin, Index1End, Index2: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1Begin, Index1End, Index2, Index2);
  mnCreateErrorIf(Index1End-Index1Begin+1 > Length(Arr), SArrayTooShort, [Length(Arr), Index1End-Index1Begin+1]);
{$ENDIF}
  try
    VarArrayLock(VA);
    for i := Index1Begin to Index1End do
      Arr[i-Index1Begin] := VarArrayGet(VA, [i, Index2]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase2VAToArrayDim2(const VA: Variant; var Arr: array of Currency;  const Index1Begin, Index1End, Index2: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1Begin, Index1End, Index2, Index2);
  mnCreateErrorIf(Index1End-Index1Begin+1 > Length(Arr), SArrayTooShort, [Length(Arr), Index1End-Index1Begin+1]);
{$ENDIF}
  try
    VarArrayLock(VA);
    for i := Index1Begin to Index1End do
      Arr[i-Index1Begin] := VarArrayGet(VA, [i, Index2]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase1ArrayToVADim2(const Arr: array of Variant;   var VA: Variant; const Index1, Index2: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1, Index1, Index2, Index2+Length(Arr)-1);
{$ENDIF}
  if Length(Arr) = 0 then Exit;
  try
    VarArrayLock(VA);
    for i := 0 to Length(Arr)-1 do
      VarArrayPut(VA, Arr[i], [Index1, Index2+i]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase1ArrayToVADim2(const Arr: array of string;    var VA: Variant; const Index1, Index2: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1, Index1, Index2, Index2+Length(Arr)-1);
{$ENDIF}
  if Length(Arr) = 0 then Exit;
  try
    VarArrayLock(VA);
    for i := 0 to Length(Arr)-1 do
      VarArrayPut(VA, Arr[i], [Index1, Index2+i]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase1ArrayToVADim2(const Arr: array of Integer;   var VA: Variant; const Index1, Index2: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1, Index1, Index2, Index2+Length(Arr)-1);
{$ENDIF}
  if Length(Arr) = 0 then Exit;
  try
    VarArrayLock(VA);
    for i := 0 to Length(Arr)-1 do
      VarArrayPut(VA, Arr[i], [Index1, Index2+i]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase1ArrayToVADim2(const Arr: array of Extended;  var VA: Variant; const Index1, Index2: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1, Index1, Index2, Index2+Length(Arr)-1);
{$ENDIF}
  if Length(Arr) = 0 then Exit;
  try
    VarArrayLock(VA);
    for i := 0 to Length(Arr)-1 do
      VarArrayPut(VA, Arr[i], [Index1, Index2+i]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase1ArrayToVADim2(const Arr: array of TDateTime; var VA: Variant; const Index1, Index2: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1, Index1, Index2, Index2+Length(Arr)-1);
{$ENDIF}
  if Length(Arr) = 0 then Exit;
  try
    VarArrayLock(VA);
    for i := 0 to Length(Arr)-1 do
      VarArrayPut(VA, Arr[i], [Index1, Index2+i]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase1ArrayToVADim2(const Arr: array of Currency;  var VA: Variant; const Index1, Index2: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1, Index1, Index2, Index2+Length(Arr)-1);
{$ENDIF}
  if Length(Arr) = 0 then Exit;
  try
    VarArrayLock(VA);
    for i := 0 to Length(Arr)-1 do
      VarArrayPut(VA, Arr[i], [Index1, Index2+i]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase2ArrayToVADim2(const Arr: array of Variant;   var VA: Variant; const Index1, Index2: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1, Index1+Length(Arr)-1, Index2, Index2);
{$ENDIF}
  if Length(Arr) = 0 then Exit;
  try
    VarArrayLock(VA);
    for i := 0 to Length(Arr)-1 do
      VarArrayPut(VA, Arr[i], [Index1+i, Index2]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase2ArrayToVADim2(const Arr: array of string;    var VA: Variant; const Index1, Index2: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1, Index1+Length(Arr)-1, Index2, Index2);
{$ENDIF}
  if Length(Arr) = 0 then Exit;
  try
    VarArrayLock(VA);
    for i := 0 to Length(Arr)-1 do
      VarArrayPut(VA, Arr[i], [Index1+i, Index2]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase2ArrayToVADim2(const Arr: array of Integer;   var VA: Variant; const Index1, Index2: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1, Index1+Length(Arr)-1, Index2, Index2);
{$ENDIF}
  if Length(Arr) = 0 then Exit;
  try
    VarArrayLock(VA);
    for i := 0 to Length(Arr)-1 do
      VarArrayPut(VA, Arr[i], [Index1+i, Index2]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase2ArrayToVADim2(const Arr: array of Extended;  var VA: Variant; const Index1, Index2: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1, Index1+Length(Arr)-1, Index2, Index2);
{$ENDIF}
  if Length(Arr) = 0 then Exit;
  try
    VarArrayLock(VA);
    for i := 0 to Length(Arr)-1 do
      VarArrayPut(VA, Arr[i], [Index1+i, Index2]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase2ArrayToVADim2(const Arr: array of TDateTime; var VA: Variant; const Index1, Index2: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1, Index1+Length(Arr)-1, Index2, Index2);
{$ENDIF}
  if Length(Arr) = 0 then Exit;
  try
    VarArrayLock(VA);
    for i := 0 to Length(Arr)-1 do
      VarArrayPut(VA, Arr[i], [Index1+i, Index2]);
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnBase2ArrayToVADim2(const Arr: array of Currency;  var VA: Variant; const Index1, Index2: Integer); overload;
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim2(VA);
  mnCheckVAContainRangeDim2(VA, Index1, Index1+Length(Arr)-1, Index2, Index2);
{$ENDIF}
  if Length(Arr) = 0 then Exit;
  try
    VarArrayLock(VA);
    for i := 0 to Length(Arr)-1 do
      VarArrayPut(VA, Arr[i], [Index1+i, Index2]);
  finally
    VarArrayUnlock(VA);
  end;
end;

end.
