unit mnArray;

interface

uses mnSystem;

{--------------------------------
  �Ƚ����������Ƿ���ͬ����Ҫ���Ⱥ������ϸ���ͬ��
  �ϸ���ͬ�ĺ����ǣ��������Ԫ�����ַ�����ָ�����󣬱����ǵ�ַ��ͬ�������ܽ���ָ��ֵ��ͬ��
  ����ṹ�ĵ�һ��longint�������ô����������бȽϡ�
  ��ͬʱ����True����ͬ����False��
  Tested in TestUnit.
 --------------------------------}
function mnArrayCompare(const ArrayA, ArrayB; const ElementSize: Integer): Boolean;

{--------------------------------
  ��Դ������Ŀ�����鿽��ָ��������Ԫ�ء�
  ������Ԫ����Դ�����е�������SrcIndex��ʼ�����뵽Ŀ�������е�������DstIndex��ʼ��
  ���ָ����������������������һ����ĳ��ȣ������Զ�������ƥ�����鳤�ȡ�
  ����ʱ���봫��Ԫ�ص�size�����ֽ�����ʾ��
  SrcIndex��DstIndex��0��ʼ�����Խ�磬���׳��쳣��
  Tested in TestUnit.
 --------------------------------}
procedure mnArrayCopy(const SrcArray, DstArray; const ElementSize, SrcIndex, DstIndex: Integer; Count: Integer);

{--------------------------------
  �������ĩβ���ָ��������Ԫ�ء�
  ����ʱ���봫��Ԫ�ص�size�����ֽ�����ʾ��
  ���ص�һ������Ԫ�ص�������
  Tested in TestUnit.
 --------------------------------}
function mnArrayAppend(var AnArray; const ElementSize: Integer; const Count: Integer = 1): Integer;
{--------------------------------
  �����������λ�ò���ָ��������Ԫ�ء�����󣬵�һ������Ԫ�ص���������Index��
  ����ʱ���봫��Ԫ�ص�size�����ֽ�����ʾ��
  Index��0��ʼ�����Խ�磬���׳��쳣��
  Tested in TestUnit.
 --------------------------------}
procedure mnArrayInsert(var AnArray; const ElementSize, Index: Integer; const Count: Integer = 1);
{--------------------------------
  ��������ɾ��ָ��������Ԫ�أ���Щ��ɾԪ�ص�������Index��ʼ��
  ���ָ������������������������ĳ��ȣ������Զ�������ƥ�����鳤�ȡ�
  ����ʱ���봫��Ԫ�ص�size�����ֽ�����ʾ��
  Index��0��ʼ�����Խ�磬���׳��쳣��
  ע�⣺ʹ�ô˺���ɾ���ַ�����ָ����������Ԫ��֮ǰ�������Ƚ�Ԫ���ÿգ���մ���nil������ᷢ���ڴ�й©��
  Tested in TestUnit.
 --------------------------------}
procedure mnArrayDelete(var AnArray; const ElementSize, Index: Integer; Count: Integer = 1);

{--------------------------------
  ���ϴ��һ��������Ĳ���Ԫ�أ���ϴ�Ĳ���Ԫ�ص�������BeginIndex��EndIndex��
  ����ʱ���봫��Ԫ�ص�size�����ֽ�����ʾ��
  Tested in TestUnit.
 --------------------------------}
procedure mnArrayShuffle(var AnArray; const ElementSize, BeginIndex, EndIndex: Integer);

{--------------------------------
  �ж��������Ƿ����ָ��Ԫ�ء�
  Tested in TestUnit.
 --------------------------------}
function mnInStrs  (const Value: string;    const Arr: array of string):    Boolean;
function mnInInts  (const Value: Integer;   const Arr: array of Integer):   Boolean;
function mnInFloats(const Value: Extended;  const Arr: array of Extended):  Boolean;
function mnInDTs   (const Value: TDateTime; const Arr: array of TDateTime): Boolean;
function mnInCurrs (const Value: Currency;  const Arr: array of Currency):  Boolean;

{--------------------------------
  �����������ָ��Ԫ�أ�����������������Ҳ���������-1��
  Tested in TestUnit.
 --------------------------------}
function mnIndexOfStrs  (const Value: string;    const Arr: array of string):    Integer;
function mnIndexOfInts  (const Value: Integer;   const Arr: array of Integer):   Integer;
function mnIndexOfFloats(const Value: Extended;  const Arr: array of Extended):  Integer;
function mnIndexOfDTs   (const Value: TDateTime; const Arr: array of TDateTime): Integer;
function mnIndexOfCurrs (const Value: Currency;  const Arr: array of Currency):  Integer;

{--------------------------------
  �õ�һ��Variant Array��ָ��ά���ϵĳ��ȡ�
  Tested in TestUnit.
 --------------------------------}
function mnVALength(const VA: Variant; const Dim: Integer): Integer;

{--------------------------------
  �ж�һ����άVariant Array�Ƿ��ܹ�����ָ����Χ��
  Tested in TestUnit.
 --------------------------------}
function mnVAContainRangeDim2(const VA: Variant; const Index1Begin, Index1End, Index2Begin, Index2End: Integer): Boolean;

{--------------------------------
  ���һ��Variant Array�Ƿ���һά���ά��������ǣ����׳��쳣��
  Tested in TestUnit.
 --------------------------------}
procedure mnCheckVADim1(const VA: Variant);
procedure mnCheckVADim2(const VA: Variant);
{--------------------------------
  ���һ��Variant Array�Ƿ��ܹ�����ָ����Χ��������ǣ����׳��쳣��
  Tested in TestUnit.
 --------------------------------}
procedure mnCheckVAContainRangeDim2(const VA: Variant; const Index1Begin, Index1End, Index2Begin, Index2End: Integer);

{--------------------------------
  ��һ��һάVariant Arrayת��ΪVariant���ַ�������������������ʱ�����ҵ�һά���顣
  ����������ȷ���ÿռ䣬�ҳ��Ȳ�С��Variant Array�ĳ��ȡ�
  Tested in TestUnit.
 --------------------------------}
procedure mnVAToArray(const VA: Variant; var Arr: array of Variant);   overload;
procedure mnVAToArray(const VA: Variant; var Arr: array of string);    overload;
procedure mnVAToArray(const VA: Variant; var Arr: array of Integer);   overload;
procedure mnVAToArray(const VA: Variant; var Arr: array of Extended);  overload;
procedure mnVAToArray(const VA: Variant; var Arr: array of TDateTime); overload;
procedure mnVAToArray(const VA: Variant; var Arr: array of Currency);  overload;

{--------------------------------
  ��һ��Variant���ַ�������������������ʱ�����ҵ�һά����ת��ΪһάVariant Array��
  ת���ɵ�Variant Array��һά�ģ��±�Ϊ1���ϱ�Ϊ����ĳ��ȡ�
  Tested in TestUnit.
 --------------------------------}
function mnArrayToVA(const Arr: array of Variant):   Variant; overload;
function mnArrayToVA(const Arr: array of string):    Variant; overload;
function mnArrayToVA(const Arr: array of Integer):   Variant; overload;
function mnArrayToVA(const Arr: array of Extended):  Variant; overload;
function mnArrayToVA(const Arr: array of TDateTime): Variant; overload;
function mnArrayToVA(const Arr: array of Currency):  Variant; overload;

{--------------------------------
  ��һ����άVariant Arrayת��ΪVariant���ַ����������Ķ�ά���顣
  ����A�ı�ʾ����������ȷ���ÿռ䣬�ҳ��Ȳ�С��Variant Array�ĳ��ȡ�
  ��A�ı�ʾ���鲻��Ҫ���ȷ���ռ䣬�����ڲ�����������á����ú�����ÿ��ά�ȵ��±�Ϊ0���ϱ�ΪVariant Array�����ά���ϵĳ��ȼ�1��
  Tested in TestUnit.
 --------------------------------}
procedure mnVAToArrayDim2  (const VA: Variant; var Arr: mnTVarArrayDim2); overload;
procedure mnVAToArrayDim2  (const VA: Variant; var Arr: mnTStrArrayDim2); overload;
procedure mnVAToArrayDim2  (const VA: Variant; var Arr: mnTIntArrayDim2); overload;
procedure mnVAToArrayDim2_A(const VA: Variant; var Arr: mnTVarArrayDim2); overload;
procedure mnVAToArrayDim2_A(const VA: Variant; var Arr: mnTStrArrayDim2); overload;
procedure mnVAToArrayDim2_A(const VA: Variant; var Arr: mnTIntArrayDim2); overload;

{--------------------------------
  ��һ��Variant���ַ����������Ķ�ά����ת��Ϊ��άVariant Array��
  ת���ɵ�Variant Array�Ƕ�ά�ģ�ÿ��ά�ȵ��±�Ϊ1���ϱ�Ϊ���������ά���ϵĳ��ȡ�
  Tested in TestUnit.
 --------------------------------}
function mnArrayToVADim2(const Arr: mnTVarArrayDim2): Variant; overload;
function mnArrayToVADim2(const Arr: mnTStrArrayDim2): Variant; overload;
function mnArrayToVADim2(const Arr: mnTIntArrayDim2): Variant; overload;

{--------------------------------
  ��һ����άVariant Arrayת��ΪVariant���ַ����������Ķ�ά���飬��mnVAToArrayDim2ϵ�к������ơ�
  ��ͬ���ǣ���Part�ĺ���ֻת��ԴVariant Array��һ���֣��ⲿ��������Index1Begin, Index1End, Index2Begin, Index2End���塣
  Index1Begin, Index1End, Index2Begin, Index2End��ѭVariant Array�Ķ�������±��1��ʼ��
  Tested in TestUnit.
 --------------------------------}
procedure mnPartVAToArrayDim2  (const VA: Variant; var Arr: mnTVarArrayDim2; const Index1Begin, Index1End, Index2Begin, Index2End: Integer); overload;
procedure mnPartVAToArrayDim2  (const VA: Variant; var Arr: mnTStrArrayDim2; const Index1Begin, Index1End, Index2Begin, Index2End: Integer); overload;
procedure mnPartVAToArrayDim2  (const VA: Variant; var Arr: mnTIntArrayDim2; const Index1Begin, Index1End, Index2Begin, Index2End: Integer); overload;
procedure mnPartVAToArrayDim2_A(const VA: Variant; var Arr: mnTVarArrayDim2; const Index1Begin, Index1End, Index2Begin, Index2End: Integer); overload;
procedure mnPartVAToArrayDim2_A(const VA: Variant; var Arr: mnTStrArrayDim2; const Index1Begin, Index1End, Index2Begin, Index2End: Integer); overload;
procedure mnPartVAToArrayDim2_A(const VA: Variant; var Arr: mnTIntArrayDim2; const Index1Begin, Index1End, Index2Begin, Index2End: Integer); overload;

{--------------------------------
  ��һ��Variant���ַ����������Ķ�ά����ת��Ϊ��άVariant Array����mnArrayToVADim2ϵ�к������ơ�
  ��ͬ���ǣ���Part�ĺ���ֻת����Ŀ��Variant Array��һ���֣��ⲿ��������Index1Begin, Index2BeginΪ���Ͻǣ�
  ��С����Դ����Ĵ�С��Ŀ����������򲻱䡣
  Index1Begin, Index2Begin��ѭVariant Array�Ķ�������±��1��ʼ��
  Ŀ��Variant Array�������ȷ���ÿռ䣬�Ұ�������������
  Tested in TestUnit.
 --------------------------------}
procedure mnPartArrayToVADim2(const Arr: mnTVarArrayDim2; var VA: Variant; const Index1Begin, Index2Begin: Integer); overload;
procedure mnPartArrayToVADim2(const Arr: mnTStrArrayDim2; var VA: Variant; const Index1Begin, Index2Begin: Integer); overload;
procedure mnPartArrayToVADim2(const Arr: mnTIntArrayDim2; var VA: Variant; const Index1Begin, Index2Begin: Integer); overload;

{--------------------------------
  ��һ����άVariant Array��ĳIndex1�µ�һ����ת��ΪVariant���ַ�������������������ʱ�����ҵ�һά���顣
  ����������ȷ���ÿռ䣬�ҳ��Ȳ�С����ת�����ֵĳ��ȡ�
  Index1, Index2Begin, Index2End��ѭVariant Array�Ķ�������±��1��ʼ��
  Tested in TestUnit.
 --------------------------------}
procedure mnBase1VAToArrayDim2(const VA: Variant; var Arr: array of Variant;   const Index1, Index2Begin, Index2End: Integer); overload;
procedure mnBase1VAToArrayDim2(const VA: Variant; var Arr: array of string;    const Index1, Index2Begin, Index2End: Integer); overload;
procedure mnBase1VAToArrayDim2(const VA: Variant; var Arr: array of Integer;   const Index1, Index2Begin, Index2End: Integer); overload;
procedure mnBase1VAToArrayDim2(const VA: Variant; var Arr: array of Extended;  const Index1, Index2Begin, Index2End: Integer); overload;
procedure mnBase1VAToArrayDim2(const VA: Variant; var Arr: array of TDateTime; const Index1, Index2Begin, Index2End: Integer); overload;
procedure mnBase1VAToArrayDim2(const VA: Variant; var Arr: array of Currency;  const Index1, Index2Begin, Index2End: Integer); overload;
{--------------------------------
  ��һ����άVariant Array��ĳIndex2�µ�һ����ת��ΪVariant���ַ�������������������ʱ�����ҵ�һά���顣
  ����������ȷ���ÿռ䣬�ҳ��Ȳ�С����ת�����ֵĳ��ȡ�
  Index1Begin, Index1End, Index2��ѭVariant Array�Ķ�������±��1��ʼ��
  Tested in TestUnit.
 --------------------------------}
procedure mnBase2VAToArrayDim2(const VA: Variant; var Arr: array of Variant;   const Index1Begin, Index1End, Index2: Integer); overload;
procedure mnBase2VAToArrayDim2(const VA: Variant; var Arr: array of string;    const Index1Begin, Index1End, Index2: Integer); overload;
procedure mnBase2VAToArrayDim2(const VA: Variant; var Arr: array of Integer;   const Index1Begin, Index1End, Index2: Integer); overload;
procedure mnBase2VAToArrayDim2(const VA: Variant; var Arr: array of Extended;  const Index1Begin, Index1End, Index2: Integer); overload;
procedure mnBase2VAToArrayDim2(const VA: Variant; var Arr: array of TDateTime; const Index1Begin, Index1End, Index2: Integer); overload;
procedure mnBase2VAToArrayDim2(const VA: Variant; var Arr: array of Currency;  const Index1Begin, Index1End, Index2: Integer); overload;

{--------------------------------
  ��һ��Variant���ַ�������������������ʱ�����ҵ�һά����ת������άVariant Array��ĳIndex1�µ�һ���֡�
  Ŀ��Variant Array�������ȷ���ÿռ䣬�Ұ���������[Index1, Index2, Index1, Index2+Դ����ĳ���-1]����
  Index1, Index2��ѭVariant Array�Ķ�������±��1��ʼ��
  Tested in TestUnit.
 --------------------------------}
procedure mnBase1ArrayToVADim2(const Arr: array of Variant;   var VA: Variant; const Index1, Index2: Integer); overload;
procedure mnBase1ArrayToVADim2(const Arr: array of string;    var VA: Variant; const Index1, Index2: Integer); overload;
procedure mnBase1ArrayToVADim2(const Arr: array of Integer;   var VA: Variant; const Index1, Index2: Integer); overload;
procedure mnBase1ArrayToVADim2(const Arr: array of Extended;  var VA: Variant; const Index1, Index2: Integer); overload;
procedure mnBase1ArrayToVADim2(const Arr: array of TDateTime; var VA: Variant; const Index1, Index2: Integer); overload;
procedure mnBase1ArrayToVADim2(const Arr: array of Currency;  var VA: Variant; const Index1, Index2: Integer); overload;
{--------------------------------
  ��һ��Variant���ַ�������������������ʱ�����ҵ�һά����ת������άVariant Array��ĳIndex2�µ�һ���֡�
  Ŀ��Variant Array�������ȷ���ÿռ䣬�Ұ���������[Index1, Index2, Index1+Դ����ĳ���-1, Index2]����
  Index1, Index2��ѭVariant Array�Ķ�������±��1��ʼ��
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
