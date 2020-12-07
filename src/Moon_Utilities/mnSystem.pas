unit mnSystem;

interface

uses SysUtils, Classes, ComCtrls, Windows, cxMemo, Contnrs;

const
{--------------------------------
  ���ڵ��еĺ�����Ҫ����һ��nil�ı��ʱ��
 --------------------------------}
  mnPNull: Pointer = nil;
{--------------------------------
  ����ip��
 --------------------------------}
  mnLocalhostIP = '127.0.0.1';
{--------------------------------
  Windows�µĻ��з���
 --------------------------------}
  mnNewline = #13#10;
{--------------------------------
  �Ʊ����
 --------------------------------}
  mnTab = #9;

const
{--------------------------------
  ��׼�����ӷ��ͷָ�������Ҫ�����ַ��������ϵ�к����С�
 --------------------------------}
  mnStdConnector1 = '```';
  mnStdConnector2 = '|||';
  mnStdSeparator1 = mnStdConnector1;
  mnStdSeparator2 = mnStdConnector2;

type
{--------------------------------
  ͨ�����ӷ�����һ���������Ӷ��ɵĵ����ַ�����
 --------------------------------}
  mnTCombinedStr = string;

type
{--------------------------------
  һά�ַ��������Byte���飬������Ϊ�����������ݡ�
 --------------------------------}
  mnTStrArray = array of String;
  mnTByteArray = array of Byte;
{--------------------------------
  ��άVariant���顢�ַ���������������飬������Ϊ�����������ݡ�
 --------------------------------}
  mnTVarArrayDim2 = array of array of Variant;
  mnTStrArrayDim2 = array of array of string;
  mnTIntArrayDim2 = array of array of Integer;

var
{--------------------------------
  Ӧ�ó�������·����Ҳ���Ǳ�ִ�е�exe��·����
  Tested in TestUnit.
 --------------------------------}
  mnAppPath: string;
{--------------------------------
  ����Ӧ�ó�������·���������µ���Ŀ¼�����ļ������·���õ������·����
  Tested in TestUnit.
 --------------------------------}
function mnAppPathSub(const SubName: string): string; overload;
function mnAppPathSub(const SubNameFormat: string; const Args: array of const): string; overload;

type
{--------------------------------
  ��ĿԼ����·�������л�������ѭ��Լ���������á��Ĺ���
  Tested in TestUnit.
 --------------------------------}
  mnTProjectConvention = class
  public
    class function GetProjectGroupPath: string;
    class function GetProjectGroupPathSub(const SubName: string): string;
    class function GetFilesPath: string;
    class function GetFilesPathSub(const SubName: string): string;
    class function GetTestTempPath: string;
    class function GetTestTempPathSub(const SubName: string): string;
    class function GetTestOutPath: string;
    class function GetTestOutPathSub(const SubName: string): string;
  end;

{--------------------------------
  �ж�һ���ַ��Ƿ��Ǵ�д��ĸ��Сд��ĸ����ĸ�����֡��Ϸ���ʮ�������ַ����������֡���дA-F��Сдa-f������ĸ���֡�
  Tested in TestUnit.
 --------------------------------}
function mnIsUpperCase    (const Ch: Char): Boolean; inline;
function mnIsLowerCase    (const Ch: Char): Boolean; inline;
function mnIsLetter       (const Ch: Char): Boolean; inline;
function mnIsDigit        (const Ch: Char): Boolean; inline;
function mnIsHex          (const Ch: Char): Boolean; inline;
function mnIsLetterOrDigit(const Ch: Char): Boolean; inline;
{--------------------------------
  �ж�һ���ַ����Ƿ��ǺϷ��ı���������������������ʱ�䡢���ҡ�
  Tested in TestUnit.
 --------------------------------}
function mnIsIdentifier(const S: string): Boolean;
function mnIsInteger   (const S: string): Boolean;
function mnIsFloat     (const S: string): Boolean;
function mnIsDateTime  (const S: string): Boolean;
function mnIsCurrency  (const S: string): Boolean;

{--------------------------------
  �׳�ָ����Ϣ�����͵�Exception��
  Tested in TestUnit.
 --------------------------------}
procedure mnCreateError(const Msg: string); overload;
procedure mnCreateError(const Msg: string; const Args: array of const); overload;
procedure mnCreateError(CustomException: ExceptClass; const Msg: string); overload;
procedure mnCreateError(CustomException: ExceptClass; const Msg: string; const Args: array of const); overload;

{--------------------------------
  ����������������£��׳�ָ����Ϣ�����͵�Exception��
  Tested in TestUnit.
 --------------------------------}
procedure mnCreateErrorIf(const Condition: Boolean; const Msg: string); overload; inline;
procedure mnCreateErrorIf(const Condition: Boolean; const Msg: string; const Args: array of const); overload;
procedure mnCreateErrorIf(const Condition: Boolean; CustomException: ExceptClass; const Msg: string); overload; inline;
procedure mnCreateErrorIf(const Condition: Boolean; CustomException: ExceptClass; const Msg: string; const Args: array of const); overload;

type
{--------------------------------
  ��ϵ����������ڡ������ڡ�С�ڡ�С�ڵ��ڡ����ڡ����ڵ��ڡ�
 --------------------------------}
  mnTRelationalOp = (roEQ, roNE, roLT, roLE, roGT, roGE);

{--------------------------------
  ��һ����ϵ�����ת��Ϊ�ַ���������roEQת��'='�� roGEת��'>='��
  Tested in TestUnit.
 --------------------------------}
function mnRelationalOpToStr(const RelationalOp: mnTRelationalOp): string;
{--------------------------------
  ��תһ����ϵ���������ζ�Ÿ�������һ���߼�����NOT������roEQת��roNE��roGEת��roLT��
  Tested in TestUnit.
 --------------------------------}
function mnReverseRelation(const RelationalOp: mnTRelationalOp): mnTRelationalOp;

{--------------------------------
  �������ַ�������������������ʱ�䡢���ҡ��������й�ϵ���㲢���ؽ����
  Tested in TestUnit.
 --------------------------------}
function mnRelationalStr  (const A, B: string;    const RelationalOp: mnTRelationalOp): Boolean;
function mnRelationalInt  (const A, B: Integer;   const RelationalOp: mnTRelationalOp): Boolean;
function mnRelationalFloat(const A, B: Extended;  const RelationalOp: mnTRelationalOp): Boolean;
function mnRelationalDT   (const A, B: TDateTime; const RelationalOp: mnTRelationalOp): Boolean;
function mnRelationalCurr (const A, B: Currency;  const RelationalOp: mnTRelationalOp): Boolean;
function mnRelationalBool (const A, B: Boolean;   const RelationalOp: mnTRelationalOp): Boolean;

{--------------------------------
  �ж�һ���ַ������������������Ƿ���ĳ�������ڣ����Ƿ����Lower����С��Upper��
  ���������'[]'��'[)'��'(]'��'()'���֣��ֱ���'II'��'IE'��'EI'��'EE'��ʾ��'I'����Include��'E'����Exclude��
  Tested in TestUnit.
 --------------------------------}
function mnBetweenII(const Value, Lower, Upper: string):   Boolean; overload; inline;
function mnBetweenII(const Value, Lower, Upper: Integer):  Boolean; overload; inline;
function mnBetweenII(const Value, Lower, Upper: Extended): Boolean; overload; inline;

function mnBetweenIE(const Value, Lower, Upper: string):   Boolean; overload; inline;
function mnBetweenIE(const Value, Lower, Upper: Integer):  Boolean; overload; inline;
function mnBetweenIE(const Value, Lower, Upper: Extended): Boolean; overload; inline;

function mnBetweenEI(const Value, Lower, Upper: string):   Boolean; overload; inline;
function mnBetweenEI(const Value, Lower, Upper: Integer):  Boolean; overload; inline;
function mnBetweenEI(const Value, Lower, Upper: Extended): Boolean; overload; inline;

function mnBetweenEE(const Value, Lower, Upper: string):   Boolean; overload; inline;
function mnBetweenEE(const Value, Lower, Upper: Integer):  Boolean; overload; inline;
function mnBetweenEE(const Value, Lower, Upper: Extended): Boolean; overload; inline;

{--------------------------------
  ����ָ�������Ӽ���ֵ��ѡ��һ��Variant���ַ�������������������ʱ�䡢���ҡ�������
  ������ѡ��ʽ������
   - ��ConditionΪTrueʱ������ValueTrue�����򷵻�ValueFalse��
   - ��A����Bʱ������ValueGT������ʱ����ValueEQ��С��ʱ����ValueLT��
  Tested in TestUnit.
 --------------------------------}
function mnChooseVar(const Condition: Boolean; const ValueTrue, ValueFalse: Variant): Variant; overload; inline;
function mnChooseVar(const A, B: string;       const ValueGT, ValueEQ, ValueLT: Variant): Variant; overload; inline;
function mnChooseVar(const A, B: Integer;      const ValueGT, ValueEQ, ValueLT: Variant): Variant; overload; inline;
function mnChooseVar(const A, B: Extended;     const ValueGT, ValueEQ, ValueLT: Variant): Variant; overload; inline;

function mnChooseStr(const Condition: Boolean; const ValueTrue, ValueFalse: string): string; overload; inline;
function mnChooseStr(const A, B: string;       const ValueGT, ValueEQ, ValueLT: string): string; overload; inline;
function mnChooseStr(const A, B: Integer;      const ValueGT, ValueEQ, ValueLT: string): string; overload; inline;
function mnChooseStr(const A, B: Extended;     const ValueGT, ValueEQ, ValueLT: string): string; overload; inline;

function mnChooseInt(const Condition: Boolean; const ValueTrue, ValueFalse: Integer): Integer; overload; inline;
function mnChooseInt(const A, B: string;       const ValueGT, ValueEQ, ValueLT: Integer): Integer; overload; inline;
function mnChooseInt(const A, B: Integer;      const ValueGT, ValueEQ, ValueLT: Integer): Integer; overload; inline;
function mnChooseInt(const A, B: Extended;     const ValueGT, ValueEQ, ValueLT: Integer): Integer; overload; inline;

function mnChooseFloat(const Condition: Boolean; const ValueTrue, ValueFalse: Extended): Extended; overload; inline;
function mnChooseFloat(const A, B: string;       const ValueGT, ValueEQ, ValueLT: Extended): Extended; overload; inline;
function mnChooseFloat(const A, B: Integer;      const ValueGT, ValueEQ, ValueLT: Extended): Extended; overload; inline;
function mnChooseFloat(const A, B: Extended;     const ValueGT, ValueEQ, ValueLT: Extended): Extended; overload; inline;

function mnChooseDT(const Condition: Boolean; const ValueTrue, ValueFalse: TDateTime): TDateTime; overload; inline;
function mnChooseDT(const A, B: string;       const ValueGT, ValueEQ, ValueLT: TDateTime): TDateTime; overload; inline;
function mnChooseDT(const A, B: Integer;      const ValueGT, ValueEQ, ValueLT: TDateTime): TDateTime; overload; inline;
function mnChooseDT(const A, B: Extended;     const ValueGT, ValueEQ, ValueLT: TDateTime): TDateTime; overload; inline;

function mnChooseCurr(const Condition: Boolean; const ValueTrue, ValueFalse: Currency): Currency; overload; inline;
function mnChooseCurr(const A, B: string;       const ValueGT, ValueEQ, ValueLT: Currency): Currency; overload; inline;
function mnChooseCurr(const A, B: Integer;      const ValueGT, ValueEQ, ValueLT: Currency): Currency; overload; inline;
function mnChooseCurr(const A, B: Extended;     const ValueGT, ValueEQ, ValueLT: Currency): Currency; overload; inline;

function mnChooseBool(const Condition: Boolean; const ValueTrue, ValueFalse: Boolean): Boolean; overload; inline;
function mnChooseBool(const A, B: string;       const ValueGT, ValueEQ, ValueLT: Boolean): Boolean; overload; inline;
function mnChooseBool(const A, B: Integer;      const ValueGT, ValueEQ, ValueLT: Boolean): Boolean; overload; inline;
function mnChooseBool(const A, B: Extended;     const ValueGT, ValueEQ, ValueLT: Boolean): Boolean; overload; inline;

{--------------------------------
  ������ָ������ʱ���ı�һ���ַ�������������������ʱ�䡢���ҡ�
  ��OriginalValue��MatchValueʹ�ù�ϵ������Ƚϣ��������Ƚ����������ظı�����ֵNewValue�����򷵻�ԭֵOriginalValue��
  Tested in TestUnit.
 --------------------------------}
function mnChangeStr  (const OriginalValue: string;    const RelationalOp: mnTRelationalOp; const MatchValue, NewValue: string):    string;    inline;
function mnChangeInt  (const OriginalValue: Integer;   const RelationalOp: mnTRelationalOp; const MatchValue, NewValue: Integer):   Integer;   inline;
function mnChangeFloat(const OriginalValue: Extended;  const RelationalOp: mnTRelationalOp; const MatchValue, NewValue: Extended):  Extended;  inline;
function mnChangeDT   (const OriginalValue: TDateTime; const RelationalOp: mnTRelationalOp; const MatchValue, NewValue: TDateTime): TDateTime; inline;
function mnChangeCurr (const OriginalValue: Currency;  const RelationalOp: mnTRelationalOp; const MatchValue, NewValue: Currency):  Currency;  inline;

{--------------------------------
  �ж�һ���������Ƿ�ǡ�������������Ƿ�û��С�����֡�
  Tested in TestUnit.
 --------------------------------}
function mnFloatIsInt(const Value: Extended): Boolean; inline;

{--------------------------------
  ��һ���ַ���ת��ΪOleVariant��
  ת���ɵ�OleVariant��һ��һάByte���飬��0��ʼ������ΪԴ�ַ����ĳ��ȣ�ÿ��Ԫ�ض�ӦԴ�ַ������ַ���
  Tested in TestUnit.
 --------------------------------}
function mnStrToOleVar(const S: string): OleVariant;

{--------------------------------
  �Ƚ�����Variant�Ƿ���ȣ����ϸ�Ϳ������ַ�ʽ��
  �ϸ�ʽ������ֵ�����Ͷ���ȣ������ɷ�ʽֻҪ�����ǵ��ַ�����ʾ��ȡ�
  ���֮�£������õȺ��ж�ֻ�Ƚ�ֵ�����Ƚ����͡��������ڱȽϲ�ͬ���͵�Variantʱ����ʱ�����쳣��
  Tested in TestUnit.
 --------------------------------}
function mnCompareVarStrict(const VarA, VarB: Variant): Boolean;
function mnCompareVarLoose(const VarA, VarB: Variant): Boolean;

{--------------------------------
  ��һ��Variantת��Ϊ�ַ�������������������ʱ�䡢���ҡ����ԭVariantΪNull��Unassigned������ָ����ȱʡ�����
  Tested in TestUnit.
 --------------------------------}
function mnVarToStr  (const V: Variant; const NullValue: string = ''): string;
function mnVarToInt  (const V: Variant; const NullValue: Integer = 0): Integer;
function mnVarToFloat(const V: Variant; const NullValue: Extended = 0): Extended;
function mnVarToDT   (const V: Variant; const NullValue: TDateTime = 0): TDateTime;
function mnVarToCurr (const V: Variant; const NullValue: Currency = 0): Currency;
{--------------------------------
  ��һ���ַ�������������������ʱ�䡢����ת��ΪVariant��
  �����תֵ����NullValue������Null��
  Tested in TestUnit.
 --------------------------------}
function mnStrToVar  (const Value: string;    const NullValue: string = ''): Variant;
function mnIntToVar  (const Value: Integer;   const NullValue: Integer = 0): Variant;
function mnFloatToVar(const Value: Extended;  const NullValue: Extended = 0): Variant;
function mnDTToVar   (const Value: TDateTime; const NullValue: TDateTime = 0): Variant;
function mnCurrToVar (const Value: Currency;  const NullValue: Currency = 0): Variant;

{--------------------------------
  ��һ���ַ���ת��Ϊ��������������ʱ�䡢���ҡ�
  �ͱ�׼ת����ͬ���ǣ������ת�����ַ���Ϊ�մ�����ʱת��ΪBlankValue��
  Tested in TestUnit.
 --------------------------------}
function mnABStrToInt  (const S: string; const BlankValue: Integer = 0): Integer;
function mnABStrToFloat(const S: string; const BlankValue: Extended = 0): Extended;
function mnABStrToDT   (const S: string; const BlankValue: TDateTime = 0): TDateTime;
function mnABStrToCurr (const S: string; const BlankValue: Currency = 0): Currency;
{--------------------------------
  ��һ����������������ʱ�䡢����ת��Ϊ�ַ�����
  �ͱ�׼ת����ͬ���ǣ������жϴ�תֵ�Ƿ����BlankValue��������ڣ����ؿմ���
  Tested in TestUnit.
 --------------------------------}
function mnABIntToStr  (const Value: Integer;   const BlankValue: Integer = 0): string;
function mnABFloatToStr(const Value: Extended;  const BlankValue: Extended = 0): string;
function mnABDTToStr   (const Value: TDateTime; const BlankValue: TDateTime = 0): string;
function mnABCurrToStr (const Value: Currency;  const BlankValue: Currency = 0): string;

{--------------------------------
  ��һ��������ת��Ϊ�ַ�����
  DecimalDigits��ʾת�����ַ���ʱ��������С��λ���������-1��˵�������κ����������
  PositiveSign��ʾ����ֵ�Ǹ�ʱ���Ƿ���ʾ���š�
  Tested in TestUnit.
 --------------------------------}
function mnFloatToStr(const Value: Extended; const DecimalDigits: Integer = -1; const PositiveSign: Boolean = False): string;
function mnCurrToStr (const Value: Currency; const DecimalDigits: Integer = -1; const PositiveSign: Boolean = False): string;

{--------------------------------
  ��һ��������������������ת��ΪThousand Separator�ַ�����
  DecimalDigits��ʾת�����ַ���ʱ��������С��λ���������-1��˵�������κ����������
  PositiveSign��ʾ����ֵ�Ǹ�ʱ���Ƿ���ʾ���š�
  Tested in TestUnit.
 --------------------------------}
function mnIntToTSStr  (const Value: Integer;                                     const PositiveSign: Boolean = False): string;
function mnFloatToTSStr(const Value: Extended; const DecimalDigits: Integer = -1; const PositiveSign: Boolean = False): string;
function mnCurrToTSStr (const Value: Currency; const DecimalDigits: Integer = -1; const PositiveSign: Boolean = False): string;
{--------------------------------
  ��һ��Thousand Separator�ַ���ת��Ϊ�����������������ҡ�
  Tested in TestUnit.
 --------------------------------}
function mnTSStrToInt  (const S: string): Integer;
function mnTSStrToFloat(const S: string): Extended;
function mnTSStrToCurr (const S: string): Currency;

{--------------------------------
  ��һ��������������ת��Ϊ�ٷֱȱ�ʾ���ַ�����
  DecimalDigits��ʾת�����ַ���ʱ��������С��λ���������-1��˵�������κ����������
  PositiveSign��ʾ����ֵ�Ǹ�ʱ���Ƿ���ʾ���š�
  Tested in TestUnit.
 --------------------------------}
function mnFloatToPercentStr(const Value: Extended; const DecimalDigits: Integer = -1; const PositiveSign: Boolean = False): string;
function mnCurrToPercentStr (const Value: Currency; const DecimalDigits: Integer = -1; const PositiveSign: Boolean = False): string;
{--------------------------------
  ��һ���ٷֱȱ�ʾ���ַ���ת��Ϊ�����������ҡ�
  Tested in TestUnit.
 --------------------------------}
function mnPercentStrToFloat(const S: string): Extended;
function mnPercentStrToCurr (const S: string): Currency;

{--------------------------------
  ��һ���ַ�����߾����ܶ���ַ�ת��Ϊ�������������������ڱ���Ĵʷ������е�LL�ķ���
  ��֧�ָ�����
  ���û���κ��ַ�����ת�������׳��쳣��
  Tested in TestUnit.
 --------------------------------}
function mnLLStrToInt(const S: string): Integer;
function mnLLStrToFloat(const S: string): Extended;

{--------------------------------
  �������Ͳ���ֵ֮��ת����0��ӦFalse��1��ӦTrue�������κ�����Ҳ��ת��True��
  Tested in TestUnit.
 --------------------------------}
function mnBoolToInt(const Value: Boolean): Integer; inline;
function mnIntToBool(const Value: Integer): Boolean; inline;

{--------------------------------
  ��һ����������ת��Ϊ�ַ�����0ת��Ϊ'False'��1ת��Ϊ'True'��
  ʵ�����ǵ���SysUtils.BoolToStr��������UseBoolStrsȱʡΪTrue��
  Tested in TestUnit.
 --------------------------------}
function mnBoolToStr(const Value: Boolean): string;

{--------------------------------
  ��0-9���������ַ�֮��ת����0-9�ֱ��Ӧ'0'-'9'��
  ��0-9���������ֽ�֮��ת����0-9�ֱ��ӦOrd('0')-Ord('9')��
  Tested in TestUnit.
 --------------------------------}
function mnDigitIntToChar(const Value: Integer): Char; inline;
function mnCharToDigitInt(const Ch: Char): Integer; inline;
function mnDigitIntToByte(const Value: Integer): Byte; inline;
function mnByteToDigitInt(const B: Byte): Integer; inline;

{--------------------------------
  ��0-15���������ַ�֮��ת����0-9�ֱ��Ӧ'0'-'9'��10-15�ֱ��Ӧ'a'-'f'��'A'-'F'��
  ��0-15���������ֽ�֮��ת����0-9�ֱ��ӦOrd('0')-Ord('9')��10-15�ֱ��ӦOrd('a')-Ord('f')��Ord('A')-Ord('F')��
  Tested in TestUnit.
 --------------------------------}
function mnHexIntToChar(const Value: Integer; const Capital: Boolean = True): Char; inline;
function mnCharToHexInt(const Ch: Char): Integer; inline;
function mnHexIntToByte(const Value: Integer; const Capital: Boolean = True): Byte; inline;
function mnByteToHexInt(const B: Byte): Integer; inline;

{--------------------------------
  ��0-35���������ַ�֮��ת����0-9�ֱ��Ӧ'0'-'9'��10-35�ֱ��Ӧ'a'-'z'��'A'-'Z'��
  ��0-35���������ֽ�֮��ת����0-9�ֱ��ӦOrd('0')-Ord('9')��10-35�ֱ��ӦOrd('a')-Ord('z')��Ord('A')-Ord('Z')��
  Tested in TestUnit.
 --------------------------------}
function mnDigletIntToChar(const Value: Integer; const Capital: Boolean = True): Char; inline;
function mnCharToDigletInt(const Ch: Char): Integer; inline;
function mnDigletIntToByte(const Value: Integer; const Capital: Boolean = True): Byte; inline;
function mnByteToDigletInt(const B: Byte): Integer; inline;

{--------------------------------
  ���ַ�ת��Ϊ��д��Сд��
  Tested in TestUnit.
 --------------------------------}
function mnUpperCase(const Ch: Char): Char; inline;
function mnLowerCase(const Ch: Char): Char; inline;

type
{--------------------------------
  ���ַ��������ƺ�Լ����
  ���ƺ�Լ���ķ�ʽ�У�
    ���⣨����Լ����������Ϊ�գ�����������Բ���Ϊ�գ���������Ϊ�ո񣩣�
    �����������������Ǹ�������������ʱ�䣬�����ǻ��ң�
    ����Ϊ��������������0��С��0��С�ڵ���0������0�����ڵ���0
 --------------------------------}
  mnTStrConstraint = (scAny, scNotEmpty, scNotEmptyAbs,
                      scIsInt, scIsFloat, scIsDT, scIsCurr,
                      scNE0, scLT0, scLE0, scGT0, scGE0);

{--------------------------------
  ����ַ����Ƿ�����ָ�����ƺ�Լ����
  Tested in TestUnit.
 --------------------------------}
function mnCheckStrConstraint(const S: string; const StrConstraint: mnTStrConstraint): Boolean;

{--------------------------------
  �½�һ��ָ�벢����ʼ��ָ��ֵ��ָ��ָ��ı�������ΪVariant���ַ�������������������ʱ�䡢���ҡ�����ֵ��
  �ú�����������ڴ�ռ䡣
  Tested in TestUnit.
 --------------------------------}
function mnNewVarPointer  (const Value: Variant):   Pointer; inline;
function mnNewStrPointer  (const Value: string):    Pointer; inline;
function mnNewIntPointer  (const Value: Integer):   Pointer; inline;
function mnNewFloatPointer(const Value: Extended):  Pointer; inline;
function mnNewDTPointer   (const Value: TDateTime): Pointer; inline;
function mnNewCurrPointer (const Value: Currency):  Pointer; inline;
function mnNewBoolPointer (const Value: Boolean):   Pointer; inline;

{--------------------------------
  ��ȡһ��ָ���ָ��ֵ��ָ��ָ��ı�������ΪVariant���ַ�������������������ʱ�䡢���ҡ�����ֵ��
  Tested in TestUnit.
 --------------------------------}
function mnReadVarPointer  (const P: Pointer): Variant;   inline;
function mnReadStrPointer  (const P: Pointer): string;    inline;
function mnReadIntPointer  (const P: Pointer): Integer;   inline;
function mnReadFloatPointer(const P: Pointer): Extended;  inline;
function mnReadDTPointer   (const P: Pointer): TDateTime; inline;
function mnReadCurrPointer (const P: Pointer): Currency;  inline;
function mnReadBoolPointer (const P: Pointer): Boolean;   inline;

{--------------------------------
  д��һ��ָ���ָ��ֵ��ָ��ָ��ı�������ΪVariant���ַ�������������������ʱ�䡢���ҡ�����ֵ��
  Tested in TestUnit.
 --------------------------------}
procedure mnWriteVarPointer  (const P: Pointer; const Value: Variant);   inline;
procedure mnWriteStrPointer  (const P: Pointer; const Value: string);    inline;
procedure mnWriteIntPointer  (const P: Pointer; const Value: Integer);   inline;
procedure mnWriteFloatPointer(const P: Pointer; const Value: Extended);  inline;
procedure mnWriteDTPointer   (const P: Pointer; const Value: TDateTime); inline;
procedure mnWriteCurrPointer (const P: Pointer; const Value: Currency);  inline;
procedure mnWriteBoolPointer (const P: Pointer; const Value: Boolean);   inline;

type
{--------------------------------
  ָ�����ͣ���ʾָ����Ǽ����ͱ�����Variant���ַ�����
  ��Ҫ�����ͷ�ָ��ʱ��ָ������ͱ�����ָ���ֱ���ͷţ�ָ��Variant���ַ�����ָ������Ƚ��д���
 --------------------------------}
  mnTPointerType = (ptSimple, ptVariant, ptString);

{--------------------------------
  �ͷź����ָ�롣
  Tested in TestUnit.
 --------------------------------}
procedure mnFreePointer(P: Pointer; const PointerType: mnTPointerType = ptSimple);
procedure mnFreeAndNilPointer(var P: Pointer; const PointerType: mnTPointerType = ptSimple); inline;

{--------------------------------
  �ͷ�һ��TStrings��TTreeNodesʵ�������и�������
  Tested in TestUnit.
 --------------------------------}
procedure mnFreeObjects(Strs: TStrings; const PointerType: mnTPointerType = ptSimple); overload;
procedure mnFreeObjects(TreeNodes: TTreeNodes; const PointerType: mnTPointerType = ptSimple); overload;
{--------------------------------
  ���һ��TStrings��TTreeNodesʵ������ζ�����ͷ����и���������������ݡ�
  Tested in TestUnit.
 --------------------------------}
procedure mnClearStrings(Strs: TStrings; const PointerType: mnTPointerType = ptSimple); inline;
procedure mnClearTreeNodes(TreeNodes: TTreeNodes; const PointerType: mnTPointerType = ptSimple); inline;

{--------------------------------
  ��һ��TTreeNodesת��ΪTStrings��TStrings��ԭ�е�Ԫ�ز��ᱻ��ա�
  �����¼���㣬���ݼ���������Ӧ������Prefix��
  Tested in TestUnit.
 --------------------------------}
procedure mnTreeNodesToStrings(TreeNodes: TTreeNodes; Strs: TStrings; const Prefix: string = ' ');
{--------------------------------
  ����һ��TTreeNode�����������ȵ�����Text���м���LevelMark���ӡ�
  Tested in TestUnit.
 --------------------------------}
function mnTreeNodeFullText(TreeNode: TTreeNode; const LevelMark: string = '->'): string;

{--------------------------------
  ��һ���ַ�������ת��ΪTStrings��TStrings��ԭ�е�Ԫ�ز��ᱻ��ա�
  Tested in TestUnit.
 --------------------------------}
procedure mnArrayToStrings(const Arr: array of string; Strs: TStrings);

{--------------------------------
  ����һ����������
  mnInitCounter��ʼ����������ֵ��
  mnAddCounter����������ֵ����Step��
  mnGetCounter�õ���������ֵ��
  Tested in TestUnit.
 --------------------------------}
procedure mnInitCounter(const InitPos: Integer = 0);
procedure mnAddCounter(const Step: Integer = 1);
function mnGetCounter: Integer;

{--------------------------------
  ����һ�����������ڲ�ά����һ��ָ�룬��Խ���Ͻ�ʱ�ص��½磬Խ���½�ʱ�ص��Ͻ硣
  mnInitCircle��ʼ�������½硢�Ͻ��ָ�����ʼλ�á�
  mnGoCircle��ָ����ǰ��Step�����༴��λ������Step��Step��������������������������
  ����ǲ���������������ʽ����ȱʡStepΪ1��
  ������ζ�ָ��λ�õĸı��Ƿ������Խ�硣�������Ƿ�Խ�磬mnGoCircleִ����Ϻ�ָ��λ�ö����ص����ڡ�
  mnGetCirclePos�õ�ָ��ĵ�ǰλ�á�
  Tested in TestUnit.
 --------------------------------}
procedure mnInitCircle(const LowerLimit, UpperLimit, InitPos: Integer);
function mnGoCircle: Boolean; overload;
function mnGoCircle(const Step: Integer): Boolean; overload;
function mnGetCirclePos: Integer;

{--------------------------------
  ����Circleϵ�к�����һ����ʹ�ð档
  ���뻷���½硢�Ͻ硢ָ�����ʼλ�úͲ���������������Ӧ������ָ��ĵ�ǰλ�á�
  Tested in TestUnit.
 --------------------------------}
function mnCircle(const LowerLimit, UpperLimit, InitPos, Step: Integer): Integer;

{--------------------------------
  �õ�ǰ�̹߳���ָ����������ʱ�䡣
  ��VCL�б�׼Sleep������ͬ���ǣ����̹߳�����ڼ䣬��Ȼ�ܹ���Ӧ��Ϣ��
  Tested in TestApp.
 --------------------------------}
procedure mnSleep(const Milliseconds: Cardinal);

{--------------------------------
  ����һ���µ�GUID����ʽΪxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx������402B70CF-C83B-4D9F-8821-2BC8DD530835��
  Tested in TestUnit.
 --------------------------------}
function mnNewGUID: string;

{--------------------------------
  �����ݷ���������һ������ʵ���Ƿ�ӵ�г�Ա�����������Ǻ�������̣����������������published�ġ�
  Tested in TestUnit.
 --------------------------------}
function mnHasMethodByName(Obj: TObject; const MethodName: string): Boolean;
{--------------------------------
  �����ݷ�����ִ��һ������ʵ���ĳ�Ա�����������Ǻ�������̣����������������published�ġ�
  ����ֵ�����Ǽ����͡�ָ����࣬�����Ǽ�¼���ַ�����Variant�����磬������PChar������ַ�����
  Tested in TestUnit.
 --------------------------------}
function mnExecMethodByName(Obj: TObject; const MethodName: string; Params: array of const): DWORD;

{--------------------------------
  ���ֲ�ͬ�������¼����͡�
 --------------------------------}
type
  mnTNoParamEvent = procedure of object;
  mnTIntParamEvent = procedure(IntParam: Integer) of object;
  mnTStrParamEvent = procedure(StrParam: string) of object;
  mnTIntStrParamEvent = procedure(IntParam: Integer; StrParam: string) of object;

{--------------------------------
  ����ʽ��Asc�Ǵ�С����Desc�ǴӴ�С��
 --------------------------------}
type
  mnTOrderStyle = (osAsc, osDesc);

{--------------------------------
  �ض�����ִ�С���������͡�����ֱ���ԺͿ���ֲ�ԡ�
  ��������֮�⣬����Int64����VCL�ж��塣
 --------------------------------}
type
  Int8   = Shortint;
  Int16  = Smallint;
  Int32  = Longint;
  UInt8  = Byte;
  UInt16 = Word;
  UInt32 = Longword;

type
  mnTPointerList = class;

{--------------------------------
  ������ǩ����mnTStreamTurbo��ʹ�á�������ǩ�ı�ź�λ�á�
  ������һ����¼���ͺ�һ����¼ָ�롣
 --------------------------------}
  mnTStreamBookmark = record
    Ordinal: Integer;
    Pos: Int64;
  end;
  mnPStreamBookmark = ^mnTStreamBookmark;

{--------------------------------
  �����ĸ߼�֧�֡�һϵ�еĸ߼�Ӧ�ã��ó���Ա�ܹ������㡢����ݡ����򵥵�ʹ������
  ���캯�����봫��һ������������������������TStream������ʵ���޹ء�

  �����Ա�У�
  Χ����ָ���λ�úʹ�Сϵ�У�������ָ�룺
  Tell�����ص�ǰλ�á�
  Seek��ָ��ĳ��λ�ã��ɻ���������ʼ����ǰλ�û�ĩβ��λ�ƣ�λ�ƿ�Ϊ���򸺡�������λ�á�
  Skip�����������ֽڣ���ͬ�ڻ��ڵ�ǰλ����λ�ơ�������λ�á�
  Reset�����õ�������ʼλ�á�
  GetSize���õ��������Ĵ�С��
  GetLeavingSize���õ��Ե�ǰλ���������ʣ���С��
  IsEnd���Ƿ���ָ������ĩβ��

  ��ǩϵ�У�������ض�д����֧�ֶ����ǩ��
  PutBookmark������ǰλ�������ǩ������һ����š�
  GotoBookmark��ǰ��ĳ����ǩ�����ظ���ǩ�Ƿ������á�
  GetBookmark���õ�ĳ��ǩλ�á��������ǩδ���ã�����-1��

  ��д��ϵ�У�
  WriteXXX��д������������ͣ�ͬʱ�ƶ���ָ�롣
  ReadXXX�����������������ͣ�ͬʱ�ƶ���ָ�롣
  ���У�����Buffer�ͻ����������ͣ�������ֱ�Ӵ�ȡ��
  ����ShortString/SmallString/String/WideString���ַ�����ǰ���1/2/4/4���ֽ����ַ������ȣ�����ַ������ݡ�
  ����Text/WideText�ı���д��ʱ��ֱ��д�������ַ�������ʱ��������ļ�ĩβ�������ַ���
  �ڶ�д��������ʱ�������LittleEndian��ֵ����������little-endian��big-endian��д��ȱʡΪlittle-endian��

  Tested in TestUnit.
 --------------------------------}
  mnTStreamTurbo = class
  private
    Stream: TStream;
    Bookmarks: mnTPointerList;
  private
    FLittleEndian: Boolean;
  public
    property LittleEndian: Boolean read FLittleEndian write FLittleEndian default True;
  public
    constructor Create(AStream: TStream);
    destructor Destroy; override;

    function Tell: Int64;
    function Seek(const Offset: Int64; const SeekOrigin: TSeekOrigin = soBeginning): Int64;
    function Skip(const Offset: Int64): Int64;
    procedure Reset;

    function GetSize: Int64;
    function GetLeavingSize: Int64;
    function IsEnd: Boolean;

    procedure PutBookmark(const Ordinal: Integer);
    function GotoBookmark(const Ordinal: Integer): Boolean;
    function GetBookmark(const Ordinal: Integer): Int64;

    procedure WriteBuffer(const Buffer; const Count: Integer);
    procedure WriteInt8(Value: Int8);
    procedure WriteInt16(Value: Int16);
    procedure WriteInt32(Value: Int32);
    procedure WriteInt64(Value: Int64);
    procedure WriteUInt8(Value: UInt8);
    procedure WriteUInt16(Value: UInt16);
    procedure WriteUInt32(Value: UInt32);
    procedure WriteSingle(const Value: Single);
    procedure WriteDouble(const Value: Double);
    procedure WriteExtended(const Value: Extended);
    procedure WriteCurrency(const Value: Currency);
    procedure WriteDateTime(const Value: TDateTime);
    procedure WriteBoolean(const Value: Boolean);
    procedure WriteShortString(const S: string);
    procedure WriteSmallString(const S: string);
    procedure WriteString(const S: string);
    procedure WriteText(const S: string);
    procedure WriteWideString(const WS: WideString);
    procedure WriteWideText(const WS: WideString);

    procedure ReadBuffer(var Buffer; const Count: Integer);
    function ReadInt8: Int8;
    function ReadInt16: Int16;
    function ReadInt32: Int32;
    function ReadInt64: Int64;
    function ReadUInt8: UInt8;
    function ReadUInt16: UInt16;
    function ReadUInt32: UInt32;
    function ReadSingle: Single;
    function ReadDouble: Double;
    function ReadExtended: Extended;
    function ReadCurrency: Currency;
    function ReadDateTime: TDateTime;
    function ReadBoolean: Boolean;
    function ReadShortString: string;
    function ReadSmallString: string;
    function ReadString: string;
    function ReadText: string;
    function ReadWideString: WideString;
    function ReadWideText: WideString;
  end;

{--------------------------------
  ָ���б���ɾ��ָ��Ԫ��ʱ�������mnFreePointer�ͷ�ָ�룬�ͷ�ʱ�Ĵ���ʽ�����PointerType��
  Tested in TestUnit.
 --------------------------------}
  mnTPointerList = class(TList)
  protected
    FPointerType: mnTPointerType;
    procedure Notify(Ptr: Pointer; Action: TListNotification); override;
  public
    property PointerType: mnTPointerType read FPointerType write FPointerType;
    constructor Create; virtual;
  end;

{--------------------------------
  �����б������б����б���ĸ��ࡣ�����ࡣ
  ��������һ���ض����б��б�Ԫ����ָ��ͬһ���͵ı�����ָ�롣
  Duplicates���б��������µ�Ԫ��ʱ������Ѵ�����ֵͬ��Ԫ�أ�����δ���
    dupIgnore�����ԣ�������ӣ�   dupAccept�����ܣ��Ծ���ӣ�   dupError�������׳��쳣��
  SaveToXXX, LoadFromXXX������StreamTurbo��������������ļ�����������������б�
 --------------------------------}
  mnTTypeList = class(mnTPointerList)
  protected
    FDuplicates: TDuplicates;
  public
    property Duplicates: TDuplicates read FDuplicates write FDuplicates;
  public
    constructor Create; override;

    procedure SaveToStreamTurbo(StreamTurbo: mnTStreamTurbo); virtual; abstract;
    procedure SaveToStream(Stream: TStream);
    procedure SaveToStreamFile(const FileName: string);
    procedure LoadFromStreamTurbo(StreamTurbo: mnTStreamTurbo); virtual; abstract;
    procedure LoadFromStream(Stream: TStream);
    procedure LoadFromStreamFile(const FileName: string);
  end;

{--------------------------------
  ���ֱ����б���6�֣��ֱ�֧��Variant����������������ʱ�䡢���ҡ����������ַ����б��б�׼��TStringList�ɼ̳У�
  ��Щ�����б��������ʵ�ֻ���һ�£�ֻ�б������͵Ĳ�����Delphi֧��Templete�Ͳ���Ҫ��ô�鷳��ʵ���ˡ�
  �����漰������ĳ�Ա������ֻ����ֵ���͵ı����б���ʵ�֡���ֵ�����������������������ҡ�
  ÿ�ֱ����б���һ��Enumerator�࣬����֧��for..in��䡣

  �����Ա�У�
  Items�������б�Ԫ�ء�
  Min��Max��Sum��Avg��Product��������Сֵ�����ֵ���ܺͣ�ƽ��ֵ���ܻ������к�����ֻ֧����ֵ���͡�

  IndexOf������һ��Ԫ�ز�����������������Ҳ���������-1��
  First�����ص�һ��Ԫ�ص�ֵ��
  Last���������һ��Ԫ�ص�ֵ��
  Add�����б�ĩβ���һ��Ԫ�أ�������Ԫ�ص�������
  Insert�����б��в���һ��Ԫ�أ�ָ���˲�����Ԫ�ص�λ�á�
  Extract���������������б�����ȡ��һ��Ԫ�أ����ظ�Ԫ�ص�ֵ���б���ɾ����Ԫ�ء�
  Remove�����б���ɾ��һ��Ԫ�أ����ظ�Ԫ�ص�����������Ҳ���Ԫ�أ�����-1��
  RemoveAll�����б���ɾ�����е���ָ��ֵ��Ԫ�أ�����ɾ����Ԫ�ظ�����

  SortNormal�����б���д�С�����Ӵ�С������
  IsUnique���ж��б����Ƿ����ظ�Ԫ�ء�
  MakeUnique��ȥ���б��е��ظ�Ԫ�ء������ظ��ģ�ֻ������һ�����ֵ�Ԫ�ء�

  Equals���ж��Ƿ����һ���б���ȫ��ͬ�������Ⱥ�ÿ��Ԫ�ص�ֵ��Ҫ��ͬ��
  Compare������һ���б���бȽϡ���д�롰A��Bû�С��͡�B��Aû�С��������б�
  Link�����б�ĩβ�����һ���б�
  LinkStrs����һ��TStrings�б������Ԫ��ת��Ϊ���б��Ԫ�����ͣ�����ӵ��б�ĩβ�����Կմ���������������ת������
  Assign������һ���б���м��ϲ�������ֵ��������ʽ��
    laCopy����ȫ������һ���б�12345, 346 = 346
    laAnd�����б�Ľ�����12345, 346 = 34
    laOr�����б�Ĳ�����12345, 346 = 123456
    laXor�����б��в���������Ԫ�ؼ���12345, 346 = 1256
    laSrcUnique��A��Bû�С�12345, 346 = 125
    laDestUnique��B��Aû�С�12345, 346 = 6
    �����������б����ǿ����ļ��ϲ���ʱ�����ԭʼ�б������ظ�Ԫ�أ�����������߼�������һ������Ҫ�Ľ����

  SaveToStreamTurbo, LoadFromStreamTurbo��ʵ�ָ���ĳ���������������������б�

  SaveToFile, LoadFromFile�������ı��ļ�����������������б��б���ÿ��Ԫ�ض�Ӧ�ı��ļ��е�һ�С�
  SaveToArray, LoadFromArray���������飬��������������б�ע���ڱ��浽����ʱ�����������ĳ��ȱ��벻С���б�Ԫ�ظ�����
  SaveToVA, LoadFromVA������һάVariant Array����������������б�

  Combine�����б����ӳ��ַ�������ָ���ַ����и��б�Ԫ�ص����ӷ�������Ԫ��ǰ��βԪ�غ��Ƿ������ӷ���
  Split, AnsiSplit���������ַ����ָ��һ���ַ�����ת��Ϊ���б��Ԫ�����ͺ���ӵ��б��У����Կմ���������������ת�������б���ԭ�е�Ԫ�ز��ᱻ��ա�
    ���طָ����ַ����������༴������Ԫ��������
  GetEnumerator���õ�Enumerator���ʵ������֧��for..in��䡣

  SaveByBit, LoadByBit���������б�ӵ�иó�Ա������һ���޷���32λ������ÿ��λ����������벼���б�
    λ��������0��ʼ��������������������ָ��ֻ���������Ĳ���λ��

  Tested in TestUnit.
 --------------------------------}

  mnTVarList = class;

  mnTVarListEnumerator = class
  private
    Index: Integer;
    List: mnTVarList;
  public
    constructor Create(AList: mnTVarList);
    function GetCurrent: Variant;
    function MoveNext: Boolean;
    property Current: Variant read GetCurrent;
  end;

  mnTVarList = class(mnTTypeList)
  protected
    function GetItem(Index: Integer): Variant;
    procedure SetItem(Index: Integer; const Value: Variant);
    function GetMin: Variant;
    function GetMax: Variant;
  public
    property Items[Index: Integer]: Variant read GetItem write SetItem; default;
    property Min: Variant read GetMin;
    property Max: Variant read GetMax;
  public
    constructor Create; override;

    function IndexOf(const Item: Variant): Integer;
    function First: Variant;
    function Last: Variant;
    function Add(const Item: Variant): Integer;
    procedure Insert(const Index: Integer; const Item: Variant);
    function Extract(const Index: Integer): Variant;
    function Remove(const Item: Variant): Integer;
    function RemoveAll(const Item: Variant): Integer;

    procedure SortNormal(const OrderStyle: mnTOrderStyle);
    function IsUnique: Boolean;
    procedure MakeUnique;

    function Equals(AnotherList: mnTVarList): Boolean;
    procedure Compare(AnotherList: mnTVarList; OutSolo, OutAnotherSolo: mnTVarList);
    procedure Link(AnotherList: mnTVarList);
    procedure LinkStrs(Strs: TStrings);
    procedure Assign(AnotherList: mnTVarList; AOperator: TListAssignOp = laCopy);

    procedure SaveToStreamTurbo(StreamTurbo: mnTStreamTurbo); override;
    procedure LoadFromStreamTurbo(StreamTurbo: mnTStreamTurbo); override;

    procedure SaveToFile(const FileName: string);
    procedure LoadFromFile(const FileName: string);
    procedure SaveToArray(var Arr: array of Variant);
    procedure LoadFromArray(const Arr: array of Variant);
    function SaveToVA: Variant;
    procedure LoadFromVA(const VA: Variant);

    function Combine(const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string;
    function Split(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
    function AnsiSplit(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
    function GetEnumerator: mnTVarListEnumerator;
  end;

  mnTIntList = class;

  mnTIntListEnumerator = class
  private
    Index: Integer;
    List: mnTIntList;
  public
    constructor Create(AList: mnTIntList);
    function GetCurrent: Integer;
    function MoveNext: Boolean;
    property Current: Integer read GetCurrent;
  end;

  mnTIntList = class(mnTTypeList)
  protected
    function GetItem(Index: Integer): Integer;
    procedure SetItem(Index: Integer; const Value: Integer);
    function GetMin: Integer;
    function GetMax: Integer;
    function GetSum: Integer;
    function GetAvg: Extended;
    function GetProduct: Integer;
  public
    property Items[Index: Integer]: Integer read GetItem write SetItem; default;
    property Min: Integer read GetMin;
    property Max: Integer read GetMax;
    property Sum: Integer read GetSum;
    property Avg: Extended read GetAvg;
    property Product: Integer read GetProduct;
  public
    constructor Create; override;

    function IndexOf(const Item: Integer): Integer;
    function First: Integer;
    function Last: Integer;
    function Add(const Item: Integer): Integer;
    procedure Insert(const Index: Integer; const Item: Integer);
    function Extract(const Index: Integer): Integer;
    function Remove(const Item: Integer): Integer;
    function RemoveAll(const Item: Integer): Integer;

    procedure SortNormal(const OrderStyle: mnTOrderStyle);
    function IsUnique: Boolean;
    procedure MakeUnique;

    function Equals(AnotherList: mnTIntList): Boolean;
    procedure Compare(AnotherList: mnTIntList; OutSolo, OutAnotherSolo: mnTIntList);
    procedure Link(AnotherList: mnTIntList);
    procedure LinkStrs(Strs: TStrings);
    procedure Assign(AnotherList: mnTIntList; AOperator: TListAssignOp = laCopy);

    procedure SaveToStreamTurbo(StreamTurbo: mnTStreamTurbo); override;
    procedure LoadFromStreamTurbo(StreamTurbo: mnTStreamTurbo); override;

    procedure SaveToFile(const FileName: string);
    procedure LoadFromFile(const FileName: string);
    procedure SaveToArray(var Arr: array of Integer);
    procedure LoadFromArray(const Arr: array of Integer);
    function SaveToVA: Variant;
    procedure LoadFromVA(const VA: Variant);

    function Combine(const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string;
    function Split(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
    function AnsiSplit(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
    function GetEnumerator: mnTIntListEnumerator;
  end;

  mnTFloatList = class;

  mnTFloatListEnumerator = class
  private
    Index: Integer;
    List: mnTFloatList;
  public
    constructor Create(AList: mnTFloatList);
    function GetCurrent: Extended;
    function MoveNext: Boolean;
    property Current: Extended read GetCurrent;
  end;

  mnTFloatList = class(mnTTypeList)
  protected
    function GetItem(Index: Integer): Extended;
    procedure SetItem(Index: Integer; const Value: Extended);
    function GetMin: Extended;
    function GetMax: Extended;
    function GetSum: Extended;
    function GetAvg: Extended;
    function GetProduct: Extended;
  public
    property Items[Index: Integer]: Extended read GetItem write SetItem; default;
    property Min: Extended read GetMin;
    property Max: Extended read GetMax;
    property Sum: Extended read GetSum;
    property Avg: Extended read GetAvg;
    property Product: Extended read GetProduct;
  public
    constructor Create; override;

    function IndexOf(const Item: Extended): Integer;
    function First: Extended;
    function Last: Extended;
    function Add(const Item: Extended): Integer;
    procedure Insert(const Index: Integer; const Item: Extended);
    function Extract(const Index: Integer): Extended;
    function Remove(const Item: Extended): Integer;
    function RemoveAll(const Item: Extended): Integer;

    procedure SortNormal(const OrderStyle: mnTOrderStyle);
    function IsUnique: Boolean;
    procedure MakeUnique;

    function Equals(AnotherList: mnTFloatList): Boolean;
    procedure Compare(AnotherList: mnTFloatList; OutSolo, OutAnotherSolo: mnTFloatList);
    procedure Link(AnotherList: mnTFloatList);
    procedure LinkStrs(Strs: TStrings);
    procedure Assign(AnotherList: mnTFloatList; AOperator: TListAssignOp = laCopy);

    procedure SaveToStreamTurbo(StreamTurbo: mnTStreamTurbo); override;
    procedure LoadFromStreamTurbo(StreamTurbo: mnTStreamTurbo); override;

    procedure SaveToFile(const FileName: string);
    procedure LoadFromFile(const FileName: string);
    procedure SaveToArray(var Arr: array of Extended);
    procedure LoadFromArray(const Arr: array of Extended);
    function SaveToVA: Variant;
    procedure LoadFromVA(const VA: Variant);

    function Combine(const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string;
    function Split(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
    function AnsiSplit(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
    function GetEnumerator: mnTFloatListEnumerator;
  end;

  mnTDTList = class;

  mnTDTListEnumerator = class
  private
    Index: Integer;
    List: mnTDTList;
  public
    constructor Create(AList: mnTDTList);
    function GetCurrent: TDateTime;
    function MoveNext: Boolean;
    property Current: TDateTime read GetCurrent;
  end;

  mnTDTList = class(mnTTypeList)
  protected
    function GetItem(Index: Integer): TDateTime;
    procedure SetItem(Index: Integer; const Value: TDateTime);
    function GetMin: TDateTime;
    function GetMax: TDateTime;
  public
    property Items[Index: Integer]: TDateTime read GetItem write SetItem; default;
    property Min: TDateTime read GetMin;
    property Max: TDateTime read GetMax;
  public
    constructor Create; override;

    function IndexOf(const Item: TDateTime): Integer;
    function First: TDateTime;
    function Last: TDateTime;
    function Add(const Item: TDateTime): Integer;
    procedure Insert(const Index: Integer; const Item: TDateTime);
    function Extract(const Index: Integer): TDateTime;
    function Remove(const Item: TDateTime): Integer;
    function RemoveAll(const Item: TDateTime): Integer;

    procedure SortNormal(const OrderStyle: mnTOrderStyle);
    function IsUnique: Boolean;
    procedure MakeUnique;

    function Equals(AnotherList: mnTDTList): Boolean;
    procedure Compare(AnotherList: mnTDTList; OutSolo, OutAnotherSolo: mnTDTList);
    procedure Link(AnotherList: mnTDTList);
    procedure LinkStrs(Strs: TStrings);
    procedure Assign(AnotherList: mnTDTList; AOperator: TListAssignOp = laCopy);

    procedure SaveToStreamTurbo(StreamTurbo: mnTStreamTurbo); override;
    procedure LoadFromStreamTurbo(StreamTurbo: mnTStreamTurbo); override;

    procedure SaveToFile(const FileName: string);
    procedure LoadFromFile(const FileName: string);
    procedure SaveToArray(var Arr: array of TDateTime);
    procedure LoadFromArray(const Arr: array of TDateTime);
    function SaveToVA: Variant;
    procedure LoadFromVA(const VA: Variant);

    function Combine(const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string;
    function Split(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
    function AnsiSplit(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
    function GetEnumerator: mnTDTListEnumerator;
  end;

  mnTCurrList = class;

  mnTCurrListEnumerator = class
  private
    Index: Integer;
    List: mnTCurrList;
  public
    constructor Create(AList: mnTCurrList);
    function GetCurrent: Currency;
    function MoveNext: Boolean;
    property Current: Currency read GetCurrent;
  end;

  mnTCurrList = class(mnTTypeList)
  protected
    function GetItem(Index: Integer): Currency;
    procedure SetItem(Index: Integer; const Value: Currency);
    function GetMin: Currency;
    function GetMax: Currency;
    function GetSum: Currency;
    function GetAvg: Currency;
    function GetProduct: Currency;
  public
    property Items[Index: Integer]: Currency read GetItem write SetItem; default;
    property Min: Currency read GetMin;
    property Max: Currency read GetMax;
    property Sum: Currency read GetSum;
    property Avg: Currency read GetAvg;
    property Product: Currency read GetProduct;
  public
    constructor Create; override;

    function IndexOf(const Item: Currency): Integer;
    function First: Currency;
    function Last: Currency;
    function Add(const Item: Currency): Integer;
    procedure Insert(const Index: Integer; const Item: Currency);
    function Extract(const Index: Integer): Currency;
    function Remove(const Item: Currency): Integer;
    function RemoveAll(const Item: Currency): Integer;

    procedure SortNormal(const OrderStyle: mnTOrderStyle);
    function IsUnique: Boolean;
    procedure MakeUnique;

    function Equals(AnotherList: mnTCurrList): Boolean;
    procedure Compare(AnotherList: mnTCurrList; OutSolo, OutAnotherSolo: mnTCurrList);
    procedure Link(AnotherList: mnTCurrList);
    procedure LinkStrs(Strs: TStrings);
    procedure Assign(AnotherList: mnTCurrList; AOperator: TListAssignOp = laCopy);

    procedure SaveToStreamTurbo(StreamTurbo: mnTStreamTurbo); override;
    procedure LoadFromStreamTurbo(StreamTurbo: mnTStreamTurbo); override;

    procedure SaveToFile(const FileName: string);
    procedure LoadFromFile(const FileName: string);
    procedure SaveToArray(var Arr: array of Currency);
    procedure LoadFromArray(const Arr: array of Currency);
    function SaveToVA: Variant;
    procedure LoadFromVA(const VA: Variant);

    function Combine(const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string;
    function Split(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
    function AnsiSplit(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
    function GetEnumerator: mnTCurrListEnumerator;
  end;

  mnTBoolList = class;

  mnTBoolListEnumerator = class
  private
    Index: Integer;
    List: mnTBoolList;
  public
    constructor Create(AList: mnTBoolList);
    function GetCurrent: Boolean;
    function MoveNext: Boolean;
    property Current: Boolean read GetCurrent;
  end;

  mnTBoolList = class(mnTTypeList)
  protected
    function GetItem(Index: Integer): Boolean;
    procedure SetItem(Index: Integer; const Value: Boolean);
    function GetMin: Boolean;
    function GetMax: Boolean;
  public
    property Items[Index: Integer]: Boolean read GetItem write SetItem; default;
    property Min: Boolean read GetMin;
    property Max: Boolean read GetMax;
  public
    constructor Create; override;

    function IndexOf(const Item: Boolean): Integer;
    function First: Boolean;
    function Last: Boolean;
    function Add(const Item: Boolean): Integer;
    procedure Insert(const Index: Integer; const Item: Boolean);
    function Extract(const Index: Integer): Boolean;
    function Remove(const Item: Boolean): Integer;
    function RemoveAll(const Item: Boolean): Integer;

    procedure SortNormal(const OrderStyle: mnTOrderStyle);
    function IsUnique: Boolean;
    procedure MakeUnique;

    function Equals(AnotherList: mnTBoolList): Boolean;
    procedure Compare(AnotherList: mnTBoolList; OutSolo, OutAnotherSolo: mnTBoolList);
    procedure Link(AnotherList: mnTBoolList);
    procedure LinkStrs(Strs: TStrings);
    procedure Assign(AnotherList: mnTBoolList; AOperator: TListAssignOp = laCopy);

    procedure SaveToStreamTurbo(StreamTurbo: mnTStreamTurbo); override;
    procedure LoadFromStreamTurbo(StreamTurbo: mnTStreamTurbo); override;

    procedure SaveToFile(const FileName: string);
    procedure LoadFromFile(const FileName: string);
    procedure SaveToArray(var Arr: array of Boolean);
    procedure LoadFromArray(const Arr: array of Boolean);
    function SaveToVA: Variant;
    procedure LoadFromVA(const VA: Variant);

    function Combine(const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string;
    function Split(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
    function AnsiSplit(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
    function GetEnumerator: mnTBoolListEnumerator;

    function SaveByBit(const BitCount: Integer = 32): UInt32;
    procedure LoadByBit(const Value: UInt32; const BitCount: Integer = 32);
  end;

type
{--------------------------------
  �ַ����б���TStringList�����࣬���������ʵ�õĹ��ܺ�����
  ���ֳ�Ա������NamePartOnly����������ΪTrue��ָ���Ǵ����TStringsΪname-value pairs����Աֻ������name���֡�

  �����Ա�У�
  Min, Max, MinLength, MaxLength��������Сֵ�����ֵ���ַ�������С���ȡ��ַ�������󳤶ȡ�

  AppendF�����һ���������ı�׼Format�ַ�����

  First�����ص�һ��Ԫ�ص�ֵ��
  Last���������һ��Ԫ�ص�ֵ��
  Extract���������������б�����ȡ��һ��Ԫ�أ����ظ�Ԫ�ص�ֵ���б���ɾ����Ԫ�ء�
  Remove�����б���ɾ��һ��Ԫ�أ����ظ�Ԫ�ص�����������Ҳ���Ԫ�أ�����-1��
  RemoveAll�����б���ɾ�����е���ָ��ֵ��Ԫ�أ�����ɾ����Ԫ�ظ�����

  Concat����һ���ַ������ӵ��б��ָ��Ԫ�غ�
  ConcatToLast����һ���ַ������ӵ��б�����һ��Ԫ�غ�����б�Ϊ�գ����ַ�����Ϊ��һ��Ԫ�ء�
  CountItem��ͳ�Ƶ���ָ��ֵ��Ԫ�ظ�����

  SortNormal�����б���д�С�����Ӵ�С������
  SortInNumberStyle�����б������ַ�ʽ���д�С�����Ӵ�С�����򣬼�ת��LLStrΪ������������
  IsUnique���ж��б����Ƿ����ظ�Ԫ�ء�
  MakeUnique��ȥ���б��е��ظ�Ԫ�ء������ظ��ģ�ֻ������һ�����ֵ�Ԫ�ء�

  Compare������һ���б���бȽϡ���д�롰A��Bû�С��͡�B��Aû�С��������б�
  AssignByOp������һ���б���м��ϲ�������ֵ��������ʽ��
    laCopy����ȫ������һ���б�12345, 346 = 346
    laAnd�����б�Ľ�����12345, 346 = 34
    laOr�����б�Ĳ�����12345, 346 = 123456
    laXor�����б��в���������Ԫ�ؼ���12345, 346 = 1256
    laSrcUnique��A��Bû�С�12345, 346 = 125
    laDestUnique��B��Aû�С�12345, 346 = 6
    �����������б����ǿ����ļ��ϲ���ʱ�����ԭʼ�б������ظ�Ԫ�أ�����������߼�������һ������Ҫ�Ľ����

  SaveToXXX, LoadFromXXX������StreamTurbo��������������ļ�����������������б�

  SaveToArray, LoadFromArray���������飬��������������б�ע���ڱ��浽����ʱ�����������ĳ��ȱ��벻С���б�Ԫ�ظ�����
  SaveToVA, LoadFromVA������һάVariant Array����������������б�

  AppendToFile���������б��ӵ�ָ���ļ���ĩβ��

  Combine�����б����ӳ��ַ�������ָ���ַ����и��б�Ԫ�ص����ӷ�������Ԫ��ǰ��βԪ�غ��Ƿ������ӷ���
  CombinePart�����б��е�һ�������ӳ��ַ�������ָ����Ҫ���ӵĲ��ֵ�������
  Split, AnsiSplit���������ַ����ָ��һ���ַ�����ת��Ϊ���б��Ԫ�����ͺ���ӵ��б��У�������������ת�������б���ԭ�е�Ԫ�ز��ᱻ��ա�
    ���طָ����ַ����������༴������Ԫ��������
    ע�⣺���ԭʼ�ַ���Ϊ�մ�����ȥHasBorder��Ӱ��󣩣���ָ��Ҳ��õ�һ���մ��������ǵõ�����ַ�����

  Tested in TestUnit.
 --------------------------------}
  mnTStrList = class(TStringList)
  protected
    function GetMin: string;
    function GetMax: string;
    function GetMinLength: Integer;
    function GetMaxLength: Integer;
  public
    property Min: string read GetMin;
    property Max: string read GetMax;
    property MinLength: Integer read GetMinLength;
    property MaxLength: Integer read GetMaxLength;
  public
    procedure AppendF(const S: string); overload;
    procedure AppendF(const S: string; const Args: array of const); overload;
    function First: string;
    function Last: string;
    function Extract(const Index: Integer): string;
    function Remove(const Item: string): Integer;
    function RemoveAll(const Item: string): Integer;

    procedure Concat(const Index: Integer; const S: string);
    procedure ConcatToLast(const S: string);
    function CountItem(const Item: string): Integer;

    procedure SortNormal(const OrderStyle: mnTOrderStyle; const NamePartOnly: Boolean = False);
    procedure SortInNumberStyle(const OrderStyle: mnTOrderStyle; const NamePartOnly: Boolean = False);
    function IsUnique(const NamePartOnly: Boolean = False): Boolean;
    procedure MakeUnique(const NamePartOnly: Boolean = False);

    procedure Compare(AnotherList: TStrings; OutSolo, OutAnotherSolo: TStrings);
    procedure AssignByOp(AnotherList: TStrings; AOperator: TListAssignOp = laCopy);

    procedure SaveToUTF8File(const FileName: string; const HasBOM: Boolean = True);
    procedure LoadFromUTF8File(const FileName: string; const HasBOM: Boolean = True);

    procedure SaveToStreamTurbo(StreamTurbo: mnTStreamTurbo);
    procedure SaveToStreamBin(Stream: TStream);
    procedure SaveToStreamFile(const FileName: string);
    procedure LoadFromStreamTurbo(StreamTurbo: mnTStreamTurbo);
    procedure LoadFromStreamBin(Stream: TStream);
    procedure LoadFromStreamFile(const FileName: string);

    procedure SaveToArray(var Arr: array of string);
    procedure LoadFromArray(const Arr: array of string);
    function SaveToVA: Variant;
    procedure LoadFromVA(const VA: Variant);

    procedure AppendToFile(const FileName: string);

    function Combine(const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string;
    function CombinePart(const PartIndexs: array of Integer; const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string;
    function Split(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
    function AnsiSplit(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
  end;

type
{--------------------------------
  �����б���TObjectList�����࣬���������ʵ�õĹ��ܺ�����

  �����Ա�У�
  Engrave����¼�б��е�ǰ��Ԫ��������
  Drop��ɾ�������ϴμ�¼������������Ԫ�ء�
        ע�⣺���뱣֤��Engrave��Drop�ڼ�ֻ������Ԫ�أ��������ɴ���

  Tested in TestUnit.
 --------------------------------}
  mnTObjList = class(TObjectList)
  protected
    EngravedCount: Integer;
  public
    procedure Engrave;
    procedure Drop;
  end;

type
{--------------------------------
  ���ڴ洢����ֶ�����ר���������ͣ�ÿ���ֶ���֮���÷ֺŸ�����
 --------------------------------}
  mnTFieldNames = string;

{--------------------------------
  ������ֶ�����ϳ�һ��mnTFieldNames��
  Tested in TestUnit.
 --------------------------------}
function mnCombineFieldNames(const FieldNames: array of string): mnTFieldNames; overload;
function mnCombineFieldNames(FieldNames: TStrings): mnTFieldNames; overload;
{--------------------------------
  ��һ��mnTFieldNames�ָ�ɶ���ֶ�����������OutSplitedFieldNames�С�OutSplitedFieldNamesԭ�е����ݲ��ᱻ��ա�
  �����ֶ�������
  Tested in TestUnit.
 --------------------------------}
function mnSplitFieldNames(const FieldNames: mnTFieldNames; OutSplitedFieldNames: TStrings): Integer;
{--------------------------------
  ����һ��mnTFieldNames�а������ֶ�������
  Tested in TestUnit.
 --------------------------------}
function mnCountFieldNames(const FieldNames: mnTFieldNames): Integer;

type
{--------------------------------
  ָʾһ�γ���ʱ�䣬����TDateTimeָʾ��һ��ʱ��㡣
  ��ʱ������Ϊ��λ��
 --------------------------------}
  mnTDuration = TDateTime;

{--------------------------------
  ʱ��ĵ�λ��
 --------------------------------}
  mnTTimeUnit = (tuYear = 1, tuMonth = 2, tuDay = 3, tuHour = 4, tuMinute = 5, tuSecond = 6);

{--------------------------------
  ��һ��ʱ�䵥λת��Ϊ�ַ�����
  Tested in TestUnit.
 --------------------------------}
function mnTimeUnitToStr(const TimeUnit: mnTTimeUnit): string;

{--------------------------------
  ����һ��Rect�Ŀ�Ⱥ͸߶ȡ�
  Tested in TestUnit.
 --------------------------------}
function mnRectWidth(const Rect: TRect): Integer; inline;
function mnRectHeight(const Rect: TRect): Integer; inline;
{--------------------------------
  �ж�����Rect�Ƿ�����ͬ�Ĵ�С������Ⱥ͸߶ȶ���ͬ��
  Tested in TestUnit.
 --------------------------------}
function mnEqualRectSize(const RectA, RectB: TRect): Boolean; inline;
{--------------------------------
  ��һ��Rect�ƶ���ָ���㣬��߲��䡣
  Tested in TestUnit.
 --------------------------------}
function mnMoveRect(const Rect: TRect; const Left: Integer = 0; const Top: Integer = 0): TRect;

{--------------------------------
  ���ݶ��뷽ʽ�������ꡣ���Ե���һ��������꣬һ��������꣬��һ�����ε����ꡣ
  ����������������뷽��ƽ��ָ�����룬������ԭ�����ϡ�
  �Ծ���Ϊ����������ľ��ο�Ⱥ͸߶Ȳ��䣬��λ�øı䡣
  ���ˮƽ���뷽ʽΪ����룬��ֱ���뷽ʽΪ�϶��룬��������λ����ԭλ����ͬ��
  ���ˮƽ���뷽ʽΪ�Ҷ��룬��ֱ���뷽ʽΪ�¶��룬�����������½ǵ���ԭ���ε����Ͻǡ�
  ���ˮƽ���뷽ʽΪ�ж��룬��ֱ���뷽ʽΪ�ж��룬�����������ĵ����ԭ���ε����Ͻǡ�
  �������ơ�

  ����������ʹ��Canvas��ͼʱ���á�Canvas��TextOut��Draw�Ⱥ�����ֻ֧��ָ������Ϊ���Ͻǻ��ơ�
  �����Ҫ�����Ķ��뷽ʽ������ָ������Ϊ���½ǻ������ĵ㣬����Ե����������������µ����Ͻ����꣬����Canvas���ơ�

  Tested in TestUnit.
 --------------------------------}
function mnAdjustX(const X, Width: Integer; const HAlign: TAlignment = taLeftJustify): Integer;
function mnAdjustY(const Y, Height: Integer; const VAlign: TVerticalAlignment = taAlignTop): Integer;
function mnAdjustPoint(const APoint: TPoint; const Width, Height: Integer;
  const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop): TPoint;
function mnAdjustRect(const ARect: TRect;
  const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop): TRect;

type
{--------------------------------
  ��������ϵ�ڵı�񣬼��㵥Ԫ�����ꡣ��ʹ��Canvas���Ʊ��ͱ������ʱ���á�
  ���ǳ��������ÿ�еĿ�Ⱥ�ÿ�еĸ߶ȿ��Ը�����ͬ��

  Left, Top���������Ͻǵ�X�����Y���ꡣ
  ColumnCount, RowCount������������������
  ColumnWidths, RowHeights�����ÿ�еĿ�Ⱥ�ÿ�еĸ߶ȡ�
  HAlign, VAlign�����㵥Ԫ���X�����Y����ʱ��ʹ�õĶ��뷽ʽ��

  AddColumns�����������У�ָ���п����������ĵ�һ�е�������
  AddRows�����������У�ָ���иߡ����������ĵ�һ�е�������
  InsertColumns����ָ��λ�ò��������У�ָ���п�
  InsertRows����ָ��λ�ò��������У�ָ���иߡ�
  DeleteColumns��ɾ����ָ��λ�ÿ�ʼ�������С�����������㣬��ɾ�����ĩβΪֹ��
  DeleteRows��ɾ����ָ��λ�ÿ�ʼ�������С�����������㣬��ɾ�����ĩβΪֹ��

  GetX������ָ���е�X���ꡣ��ָ�����뷽ʽ�������Ҷ���ֱ��Ǹ��е��������ߵ�X���ꡣ
  GetY������ָ���е�Y���ꡣ��ָ�����뷽ʽ�����е׶���ֱ��Ǹ��еĶ��е��ߵ�Y���ꡣ

  Tested in TestUnit.
 --------------------------------}
  mnTCoordinatesTable = class
  private
    FLeft: Integer;
    FTop: Integer;
    FColumnCount: Integer;
    FRowCount: Integer;
    FColumnWidths: mnTIntList;
    FRowHeights: mnTIntList;
    FHAlign: TAlignment;
    FVAlign: TVerticalAlignment;
  public
    property Left: Integer read FLeft write FLeft;
    property Top: Integer read FTop write FTop;
    property ColumnCount: Integer read FColumnCount;
    property RowCount: Integer read FRowCount;
    property ColumnWidths: mnTIntList read FColumnWidths;
    property RowHeights: mnTIntList read FRowHeights;
    property HAlign: TAlignment read FHAlign write FHAlign;
    property VAlign: TVerticalAlignment read FVAlign write FVAlign;
  public
    constructor Create; overload;
    constructor Create(const ALeft, ATop: Integer); overload;
    destructor Destroy; override;

    function AddColumns(const Width: Integer; const Count: Integer = 1): Integer;
    function AddRows(const Height: Integer; const Count: Integer = 1): Integer;
    procedure InsertColumns(const Index: Integer; const Width: Integer; const Count: Integer = 1);
    procedure InsertRows(const Index: Integer; const Height: Integer; const Count: Integer = 1);
    procedure DeleteColumns(const Index: Integer; Count: Integer = 1);
    procedure DeleteRows(const Index: Integer; Count: Integer = 1);

    function GetX(const ColumnIndex: Integer): Integer; overload;
    function GetX(const ColumnIndex: Integer; const AHAlign: TAlignment): Integer; overload;
    function GetY(const RowIndex: Integer): Integer; overload;
    function GetY(const RowIndex: Integer; const AVAlign: TVerticalAlignment): Integer; overload;
  end;

type
{--------------------------------
  �����ݵ����ɺ������־��

  Content����־���ݡ�

  Append������һ����־��

  AssignToStrs������־��ֵ��һ��TStrings������ָ�������������ֻ��ֵ��־�ĺ���һ���֡�
  SaveToFile������־���浽�ļ���

  BindToStrs������־�󶨵�һ��TStrings��
  BindToFile������־�󶨵�һ���ļ���
  BindToMemo������־�󶨵�һ��cxMemo��
  Sync����������־ͬ�������а󶨵Ķ���
  MaxStrsLines��ͬ����TStringsʱ��ͬ�������������
  MaxMemoLines��ͬ����cxMemoʱ��ͬ�������������

  Tested in TestUnit.
 --------------------------------}
  mnTLog = class
  private
    FContent: mnTStrList;
    FMaxStrsLines: Integer;
    FMaxMemoLines: Integer;
  public
    property Content: mnTStrList read FContent;
    property MaxStrsLines: Integer read FMaxStrsLines write FMaxStrsLines;
    property MaxMemoLines: Integer read FMaxMemoLines write FMaxMemoLines;
  private
    BindedStrs: TStrings;
    BindedFileName: string;
    BindedMemo: TcxMemo;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Append(const Text: string); overload;
    procedure Append(const Text: string; const Args: array of const); overload;

    procedure AssignToStrs(const Strs: TStrings; const MaxLines: Integer = 0);
    procedure SaveToFile(const FileName: string);

    procedure BindToStrs(const Strs: TStrings);
    procedure BindToFile(const FileName: string);
    procedure BindToMemo(const Memo: TcxMemo);
    procedure Sync;
  end;

type
  mnTExternalCommandExecution = class;

{--------------------------------
  �ⲿ�����ļ���������ִ���ⲿ����ʱʹ�á�
  Tested in TestUnit.
 --------------------------------}
  mnTExternalCommandFile = class
  private
    FCommandFileName: string;
  public
    // �ⲿ�����ļ����ļ���
    property CommandFileName: string read FCommandFileName;
  private
    FUseJavaToRunJar: Boolean;
  public
    // ִ���ⲿ����ʱ���Ƿ�ʹ��Java�����ⲿ�����ļ���ΪJar��ִ��
    property UseJavaToRunJar: Boolean read FUseJavaToRunJar write FUseJavaToRunJar default False;
  public
    // InDefaultPath��ʾ�ⲿ�����ļ��Ƿ�λ��ȱʡ·����
    // ȱʡ·��ָӦ�ó�������·����ExternalCommandFile��Ŀ¼��
    constructor Create(ACommandFileName: string; const InDefaultPath: Boolean = True);
    // �����ⲿ�����ļ����½���һ���ⲿ�����ִ�н���
    function NewExecution(const CommandName: string; const ArgsStr: string = ''): mnTExternalCommandExecution;
  end;

{--------------------------------
  �ⲿ�����ִ�н�����ɹ���ɣ������쳣�����ֿ�Ԥ�⡢�ɲ�����쳣����ִ����ֹ�����ֲ���Ԥ�⡢δ������쳣����ִ�ж��ᣨִ��ʱ�����δ���أ���
 --------------------------------}
  mnTExternalCommandExecutionResult = (erFinished, erException, erHalted, erFreezed);

{--------------------------------
  �ⲿ�����ִ�н��̡�
  Tested in TestUnit.
 --------------------------------}
  mnTExternalCommandExecution = class
  private
    FCommandFile: mnTExternalCommandFile;
    FCommandName: string;
    FArgsStr: string;
    FAnnouncementDir: string;
    FAnnouncementFileName: string;
    FCompletedArgs: string;
  public
    // �ⲿ�����ļ�
    property CommandFile: mnTExternalCommandFile read FCommandFile;
    // �ⲿ������
    property CommandName: string read FCommandName;
    // �ⲿ�������
    property ArgsStr: string read FArgsStr;
    // �ⲿ����ִ�н��������Ŀ¼
    property AnnouncementDir: string read FAnnouncementDir;
    // �ⲿ����ִ�н���������ļ���
    property AnnouncementFileName: string read FAnnouncementFileName;
    // �ⲿ����ʵ��ִ��ʱ����������
    property CompletedArgs: string read FCompletedArgs;
  private
    FTimeout: Integer;
    FKeepAnnouncementDir: Boolean;
  public
    // �ⲿ����ִ��ʱ�ĳ�ʱʱ�䣬��λΪ��
    property Timeout: Integer read FTimeout write FTimeout default 0;
    // �ⲿ����ִ������Ƿ���ִ�н��������Ŀ¼
    property KeepAnnouncementDir: Boolean read FKeepAnnouncementDir write FKeepAnnouncementDir default False;
  private
    FMsg: string;
  public
    // �ⲿ����ִ��������ɵ���Ϣ
    property Msg: string read FMsg;
  private
    constructor Create(const ACommandFile: mnTExternalCommandFile; const ACommandName: string; const AnArgsStr: string);
    function WaitAndParse: mnTExternalCommandExecutionResult;
  public
    // ɾ���ⲿ����ִ�н��������Ŀ¼
    procedure DeleteAnnouncementDir;
    // ִ���ⲿ�������ִ�н�����������ɵ���Ϣд��Msg��
    function Execute: mnTExternalCommandExecutionResult;
  end;

type
{--------------------------------
  Delphi���������ͣ�һ�������Զ�����Delphi����ʱ��
 --------------------------------}
  mnTDelphiType = (dtString, dtBoolean, dtCurrency, dtDateTime, dtSingle, dtDouble,
                   dtShortint, dtSmallint, dtInteger, dtByte, dtWord, dtLongword, dtInt64,
                   dtOthers);

{--------------------------------
  ����Delphi���������ͣ��Ƴ�һЩ������ԣ�һ�������Զ�����Delphi����ʱ��
  Tested in TestUnit.
 --------------------------------}
  mnTDelphiTypeConvertors = class
  public
    // �ı���ʾ
    class function ToText         (const DelphiType: mnTDelphiType): string;
    // ��mn���е��ı���ʾ
    class function ToMNText       (const DelphiType: mnTDelphiType): string;
    // TField��AsXXX������
    class function ToAsFunc       (const DelphiType: mnTDelphiType): string;
    // ת��Ϊ�ַ�����XXXToStr������
    class function ToToStrFunc    (const DelphiType: mnTDelphiType): string;
    // ���ַ���ת����StrToXXX������
    class function ToStrToFunc    (const DelphiType: mnTDelphiType): string;
    // ��ʾ��ֵ�Ĵ����ı�
    class function ToNullValue    (const DelphiType: mnTDelphiType): string;
    // ��Format��������Ϊ����ʱ��ʹ�õ����ͱ�ʶ����%d��%s
    class function ToFormatType   (const DelphiType: mnTDelphiType): string;
    // ��SQL����Format��������Ϊ����ʱ��ʹ�õ����ͱ�ʶ����ToFormatType��ȣ���ʱ��Ҫ������
    class function ToSQLFormatType(const DelphiType: mnTDelphiType): string;
    // ��Format��������Ϊ����ʱ����ԭʼ�������еĴ��������ڲ���ʹ��%s�������Ҫ��DateTimeToStr����ת��
    class function ToFormatArg    (const DelphiType: mnTDelphiType): string;
  end;

var
{--------------------------------
  Ԥ��׼���õģ���ʵ������һ��mnTStrList����������ʱ��ҪmnTStrListʱ�����Ժܷ���ص��á�
  Tested in TestUnit.
 --------------------------------}
  ppStrs: mnTStrList;

implementation

uses mnResStrsU, Variants, mnString, StrUtils, mnMath, RTLConsts, mnArray, Forms, mnWindows, mnFile, mnTPL, DateUtils;

function mnAppPathSub(const SubName: string): string; overload;
begin
  Result := mnAppPath + SubName;
end;

function mnAppPathSub(const SubNameFormat: string; const Args: array of const): string; overload;
begin
  Result := Format(mnAppPath + SubNameFormat, Args);
end;

{ mnTProjectConvention }

class function mnTProjectConvention.GetProjectGroupPath: string;
begin
  Result := mnExtractParentPath(mnAppPath);
end;

class function mnTProjectConvention.GetProjectGroupPathSub(const SubName: string): string;
begin
  Result := GetProjectGroupPath + SubName;
end;

class function mnTProjectConvention.GetFilesPath: string;
begin
  Result := GetProjectGroupPath + 'files\';
end;

class function mnTProjectConvention.GetFilesPathSub(const SubName: string): string;
begin
  Result := GetFilesPath + SubName;
end;

class function mnTProjectConvention.GetTestTempPath: string;
begin
  Result := GetFilesPath + 'test_temp\';
end;

class function mnTProjectConvention.GetTestTempPathSub(const SubName: string): string;
begin
  Result := GetTestTempPath + SubName;
end;

class function mnTProjectConvention.GetTestOutPath: string;
begin
  Result := GetFilesPath + 'test_out\';
end;

class function mnTProjectConvention.GetTestOutPathSub(const SubName: string): string;
begin
  Result := GetTestOutPath + SubName;
end;

function mnIsUpperCase    (const Ch: Char): Boolean; inline;
begin
  Result := (Ch >= 'A') and (Ch <= 'Z');
end;

function mnIsLowerCase    (const Ch: Char): Boolean; inline;
begin
  Result := (Ch >= 'a') and (Ch <= 'z');
end;

function mnIsLetter       (const Ch: Char): Boolean; inline;
begin
  Result := mnIsUpperCase(Ch) or mnIsLowerCase(Ch);
end;

function mnIsDigit        (const Ch: Char): Boolean; inline;
begin
  Result := (Ch >= '0') and (Ch <= '9');
end;

function mnIsHex          (const Ch: Char): Boolean; inline;
begin
  Result := mnIsDigit(Ch) or ((Ch >= 'A') and (Ch <= 'F')) or ((Ch >= 'a') and (Ch <= 'f'));
end;

function mnIsLetterOrDigit(const Ch: Char): Boolean; inline;
begin
  Result := mnIsDigit(Ch) or mnIsLetter(Ch);
end;

function mnIsIdentifier(const S: string): Boolean;
var
  i: Integer;
begin
  Result := (S <> '');
  if not Result then Exit;
  Result := mnIsLetter(S[1]) or (S[1] = '_');
  if not Result then Exit;
  for i := 2 to Length(S) do
  begin
    Result := mnIsLetter(S[i]) or mnIsDigit(S[i]) or (S[i] = '_');
    if not Result then Exit;
  end;
end;

function mnIsInteger   (const S: string): Boolean;
begin
  try
    StrToInt(S);
    Result := True;
  except
    Result := False;
  end;
end;

function mnIsFloat     (const S: string): Boolean;
begin
  try
    StrToFloat(S);
    Result := True;
  except
    Result := False;
  end;
end;

function mnIsDateTime  (const S: string): Boolean;
begin
  try
    StrToDateTime(S);
    Result := True;
  except
    Result := False;
  end;
end;

function mnIsCurrency  (const S: string): Boolean;
begin
  try
    StrToCurr(S);
    Result := True;
  except
    Result := False;
  end;
end;

procedure mnCreateError(const Msg: string); overload;
begin
  raise Exception.Create(Msg);
end;

procedure mnCreateError(const Msg: string; const Args: array of const); overload;
begin
  mnCreateError(Format(Msg, Args));
end;

procedure mnCreateError(CustomException: ExceptClass; const Msg: string); overload;
begin
  raise CustomException.Create(Msg);
end;

procedure mnCreateError(CustomException: ExceptClass; const Msg: string; const Args: array of const); overload;
begin
  mnCreateError(CustomException, Format(Msg, Args));
end;

procedure mnCreateErrorIf(const Condition: Boolean; const Msg: string); overload; inline;
begin
  if Condition then mnCreateError(Msg);
end;

procedure mnCreateErrorIf(const Condition: Boolean; const Msg: string; const Args: array of const); overload;
begin
  if Condition then mnCreateError(Msg, Args);
end;

procedure mnCreateErrorIf(const Condition: Boolean; CustomException: ExceptClass; const Msg: string); overload; inline;
begin
  if Condition then mnCreateError(CustomException, Msg);
end;

procedure mnCreateErrorIf(const Condition: Boolean; CustomException: ExceptClass; const Msg: string; const Args: array of const); overload;
begin
  if Condition then mnCreateError(CustomException, Msg, Args);
end;

function mnRelationalOpToStr(const RelationalOp: mnTRelationalOp): string;
begin
  case RelationalOp of
    roEQ: Result := '=';
    roNE: Result := '<>';
    roLT: Result := '<';
    roLE: Result := '<=';
    roGT: Result := '>';
    roGE: Result := '>=';
  else
    mnCreateError(SIllegalRelationOp);
  end;
end;

function mnReverseRelation(const RelationalOp: mnTRelationalOp): mnTRelationalOp;
begin
  case RelationalOp of
    roEQ: Result := roNE;
    roNE: Result := roEQ;
    roLT: Result := roGE;
    roLE: Result := roGT;
    roGT: Result := roLE;
    roGE: Result := roLT;
  else
    mnCreateError(SIllegalRelationOp);
    Result := roEQ;
  end;
end;

function mnRelationalStr  (const A, B: string;    const RelationalOp: mnTRelationalOp): Boolean;
begin
  case RelationalOp of
    roEQ: Result := A = B;
    roNE: Result := A <> B;
    roLT: Result := A < B;
    roLE: Result := A <= B;
    roGT: Result := A > B;
    roGE: Result := A >= B;
  else
    mnCreateError(SIllegalRelationOp);
    Result := False;
  end;
end;

function mnRelationalInt  (const A, B: Integer;   const RelationalOp: mnTRelationalOp): Boolean;
begin
  case RelationalOp of
    roEQ: Result := A = B;
    roNE: Result := A <> B;
    roLT: Result := A < B;
    roLE: Result := A <= B;
    roGT: Result := A > B;
    roGE: Result := A >= B;
  else
    mnCreateError(SIllegalRelationOp);
    Result := False;
  end;
end;

function mnRelationalFloat(const A, B: Extended;  const RelationalOp: mnTRelationalOp): Boolean;
begin
  case RelationalOp of
    roEQ: Result := A = B;
    roNE: Result := A <> B;
    roLT: Result := A < B;
    roLE: Result := A <= B;
    roGT: Result := A > B;
    roGE: Result := A >= B;
  else
    mnCreateError(SIllegalRelationOp);
    Result := False;
  end;
end;

function mnRelationalDT   (const A, B: TDateTime; const RelationalOp: mnTRelationalOp): Boolean;
begin
  case RelationalOp of
    roEQ: Result := A = B;
    roNE: Result := A <> B;
    roLT: Result := A < B;
    roLE: Result := A <= B;
    roGT: Result := A > B;
    roGE: Result := A >= B;
  else
    mnCreateError(SIllegalRelationOp);
    Result := False;
  end;
end;

function mnRelationalCurr (const A, B: Currency;  const RelationalOp: mnTRelationalOp): Boolean;
begin
  case RelationalOp of
    roEQ: Result := A = B;
    roNE: Result := A <> B;
    roLT: Result := A < B;
    roLE: Result := A <= B;
    roGT: Result := A > B;
    roGE: Result := A >= B;
  else
    mnCreateError(SIllegalRelationOp);
    Result := False;
  end;
end;

function mnRelationalBool (const A, B: Boolean;   const RelationalOp: mnTRelationalOp): Boolean;
begin
  case RelationalOp of
    roEQ: Result := A = B;
    roNE: Result := A <> B;
    roLT: Result := A < B;
    roLE: Result := A <= B;
    roGT: Result := A > B;
    roGE: Result := A >= B;
  else
    mnCreateError(SIllegalRelationOp);
    Result := False;
  end;
end;

function mnBetweenII(const Value, Lower, Upper: string):   Boolean; overload; inline;
begin
  Result := (Value >= Lower) and (Value <= Upper);
end;

function mnBetweenII(const Value, Lower, Upper: Integer):  Boolean; overload; inline;
begin
  Result := (Value >= Lower) and (Value <= Upper);
end;

function mnBetweenII(const Value, Lower, Upper: Extended): Boolean; overload; inline;
begin
  Result := (Value >= Lower) and (Value <= Upper);
end;

function mnBetweenIE(const Value, Lower, Upper: string):   Boolean; overload; inline;
begin
  Result := (Value >= Lower) and (Value < Upper);
end;

function mnBetweenIE(const Value, Lower, Upper: Integer):  Boolean; overload; inline;
begin
  Result := (Value >= Lower) and (Value < Upper);
end;

function mnBetweenIE(const Value, Lower, Upper: Extended): Boolean; overload; inline;
begin
  Result := (Value >= Lower) and (Value < Upper);
end;

function mnBetweenEI(const Value, Lower, Upper: string):   Boolean; overload; inline;
begin
  Result := (Value > Lower) and (Value <= Upper);
end;

function mnBetweenEI(const Value, Lower, Upper: Integer):  Boolean; overload; inline;
begin
  Result := (Value > Lower) and (Value <= Upper);
end;

function mnBetweenEI(const Value, Lower, Upper: Extended): Boolean; overload; inline;
begin
  Result := (Value > Lower) and (Value <= Upper);
end;

function mnBetweenEE(const Value, Lower, Upper: string):   Boolean; overload; inline;
begin
  Result := (Value > Lower) and (Value < Upper);
end;

function mnBetweenEE(const Value, Lower, Upper: Integer):  Boolean; overload; inline;
begin
  Result := (Value > Lower) and (Value < Upper);
end;

function mnBetweenEE(const Value, Lower, Upper: Extended): Boolean; overload; inline;
begin
  Result := (Value > Lower) and (Value < Upper);
end;

function mnChooseVar(const Condition: Boolean; const ValueTrue, ValueFalse: Variant): Variant; overload; inline;
begin
  if Condition then
    Result := ValueTrue
  else
    Result := ValueFalse;
end;

function mnChooseVar(const A, B: string;       const ValueGT, ValueEQ, ValueLT: Variant): Variant; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseVar(const A, B: Integer;      const ValueGT, ValueEQ, ValueLT: Variant): Variant; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseVar(const A, B: Extended;     const ValueGT, ValueEQ, ValueLT: Variant): Variant; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseStr(const Condition: Boolean; const ValueTrue, ValueFalse: string): string; overload; inline;
begin
  if Condition then
    Result := ValueTrue
  else
    Result := ValueFalse;
end;

function mnChooseStr(const A, B: string;       const ValueGT, ValueEQ, ValueLT: string): string; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseStr(const A, B: Integer;      const ValueGT, ValueEQ, ValueLT: string): string; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseStr(const A, B: Extended;     const ValueGT, ValueEQ, ValueLT: string): string; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseInt(const Condition: Boolean; const ValueTrue, ValueFalse: Integer): Integer; overload; inline;
begin
  if Condition then
    Result := ValueTrue
  else
    Result := ValueFalse;
end;

function mnChooseInt(const A, B: string;       const ValueGT, ValueEQ, ValueLT: Integer): Integer; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseInt(const A, B: Integer;      const ValueGT, ValueEQ, ValueLT: Integer): Integer; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseInt(const A, B: Extended;     const ValueGT, ValueEQ, ValueLT: Integer): Integer; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseFloat(const Condition: Boolean; const ValueTrue, ValueFalse: Extended): Extended; overload; inline;
begin
  if Condition then
    Result := ValueTrue
  else
    Result := ValueFalse;
end;

function mnChooseFloat(const A, B: string;       const ValueGT, ValueEQ, ValueLT: Extended): Extended; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseFloat(const A, B: Integer;      const ValueGT, ValueEQ, ValueLT: Extended): Extended; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseFloat(const A, B: Extended;     const ValueGT, ValueEQ, ValueLT: Extended): Extended; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseDT(const Condition: Boolean; const ValueTrue, ValueFalse: TDateTime): TDateTime; overload; inline;
begin
  if Condition then
    Result := ValueTrue
  else
    Result := ValueFalse;
end;

function mnChooseDT(const A, B: string;       const ValueGT, ValueEQ, ValueLT: TDateTime): TDateTime; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseDT(const A, B: Integer;      const ValueGT, ValueEQ, ValueLT: TDateTime): TDateTime; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseDT(const A, B: Extended;     const ValueGT, ValueEQ, ValueLT: TDateTime): TDateTime; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseCurr(const Condition: Boolean; const ValueTrue, ValueFalse: Currency): Currency; overload; inline;
begin
  if Condition then
    Result := ValueTrue
  else
    Result := ValueFalse;
end;

function mnChooseCurr(const A, B: string;       const ValueGT, ValueEQ, ValueLT: Currency): Currency; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseCurr(const A, B: Integer;      const ValueGT, ValueEQ, ValueLT: Currency): Currency; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseCurr(const A, B: Extended;     const ValueGT, ValueEQ, ValueLT: Currency): Currency; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseBool(const Condition: Boolean; const ValueTrue, ValueFalse: Boolean): Boolean; overload; inline;
begin
  if Condition then
    Result := ValueTrue
  else
    Result := ValueFalse;
end;

function mnChooseBool(const A, B: string;       const ValueGT, ValueEQ, ValueLT: Boolean): Boolean; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseBool(const A, B: Integer;      const ValueGT, ValueEQ, ValueLT: Boolean): Boolean; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChooseBool(const A, B: Extended;     const ValueGT, ValueEQ, ValueLT: Boolean): Boolean; overload; inline;
begin
  if A > B then
    Result := ValueGT
  else if A < B then
    Result := ValueLT
  else
    Result := ValueEQ;
end;

function mnChangeStr  (const OriginalValue: string;    const RelationalOp: mnTRelationalOp; const MatchValue, NewValue: string):    string;    inline;
begin
  if mnRelationalStr(OriginalValue, MatchValue, RelationalOp) then
    Result := NewValue
  else
    Result := OriginalValue;
end;

function mnChangeInt  (const OriginalValue: Integer;   const RelationalOp: mnTRelationalOp; const MatchValue, NewValue: Integer):   Integer;   inline;
begin
  if mnRelationalInt(OriginalValue, MatchValue, RelationalOp) then
    Result := NewValue
  else
    Result := OriginalValue;
end;

function mnChangeFloat(const OriginalValue: Extended;  const RelationalOp: mnTRelationalOp; const MatchValue, NewValue: Extended):  Extended;  inline;
begin
  if mnRelationalFloat(OriginalValue, MatchValue, RelationalOp) then
    Result := NewValue
  else
    Result := OriginalValue;
end;

function mnChangeDT   (const OriginalValue: TDateTime; const RelationalOp: mnTRelationalOp; const MatchValue, NewValue: TDateTime): TDateTime; inline;
begin
  if mnRelationalDT(OriginalValue, MatchValue, RelationalOp) then
    Result := NewValue
  else
    Result := OriginalValue;
end;

function mnChangeCurr (const OriginalValue: Currency;  const RelationalOp: mnTRelationalOp; const MatchValue, NewValue: Currency):  Currency;  inline;
begin
  if mnRelationalCurr(OriginalValue, MatchValue, RelationalOp) then
    Result := NewValue
  else
    Result := OriginalValue;
end;

function mnFloatIsInt(const Value: Extended): Boolean; inline;
begin
  Result := Value - Trunc(Value) = 0;
end;

function mnStrToOleVar(const S: string): OleVariant;
var
  Len: Integer;
  i: Integer;
begin
  Len := Length(S);
  Result := VarArrayCreate([0, Len-1], varByte);
  for i := 0 to Len-1 do
    Result[i] := Ord(S[i+1]);
end;

function mnCompareVarStrict(const VarA, VarB: Variant): Boolean;
begin
  Result := (VarType(VarA) = VarType(VarB)) and (VarA = VarB);
end;

function mnCompareVarLoose(const VarA, VarB: Variant): Boolean;
begin
  Result := VarToStr(VarA) = VarToStr(VarB);
end;

function mnVarToStr  (const V: Variant; const NullValue: string = ''): string;
begin
  if VarIsNull(V) or VarIsEmpty(V) then
    Result := NullValue
  else
    Result := V;
end;

function mnVarToInt  (const V: Variant; const NullValue: Integer = 0): Integer;
begin
  if VarIsNull(V) or VarIsEmpty(V) then
    Result := NullValue
  else
    Result := StrToInt(V);
end;

function mnVarToFloat(const V: Variant; const NullValue: Extended = 0): Extended;
begin
  if VarIsNull(V) or VarIsEmpty(V) then
    Result := NullValue
  else
    Result := StrToFloat(V);
end;

function mnVarToDT   (const V: Variant; const NullValue: TDateTime = 0): TDateTime;
begin
  if VarIsNull(V) or VarIsEmpty(V) then
    Result := NullValue
  else
    Result := StrToDateTime(V);
end;

function mnVarToCurr (const V: Variant; const NullValue: Currency = 0): Currency;
begin
  if VarIsNull(V) or VarIsEmpty(V) then
    Result := NullValue
  else
    Result := StrToCurr(V);
end;

function mnStrToVar  (const Value: string;    const NullValue: string = ''): Variant;
begin
  if Value = NullValue then
    Result := Null
  else
    Result := Value;
end;

function mnIntToVar  (const Value: Integer;   const NullValue: Integer = 0): Variant;
begin
  if Value = NullValue then
    Result := Null
  else
    Result := Value;
end;

function mnFloatToVar(const Value: Extended;  const NullValue: Extended = 0): Variant;
begin
  if Value = NullValue then
    Result := Null
  else
    Result := Value;
end;

function mnDTToVar   (const Value: TDateTime; const NullValue: TDateTime = 0): Variant;
begin
  if Value = NullValue then
    Result := Null
  else
    Result := Value;
end;

function mnCurrToVar (const Value: Currency;  const NullValue: Currency = 0): Variant;
begin
  if Value = NullValue then
    Result := Null
  else
    Result := Value;
end;

function mnABStrToInt  (const S: string; const BlankValue: Integer = 0): Integer;
begin
  if S = '' then
    Result := BlankValue
  else
    Result := StrToInt(S);
end;

function mnABStrToFloat(const S: string; const BlankValue: Extended = 0): Extended;
begin
  if S = '' then
    Result := BlankValue
  else
    Result := StrToFloat(S);
end;

function mnABStrToDT   (const S: string; const BlankValue: TDateTime = 0): TDateTime;
begin
  if S = '' then
    Result := BlankValue
  else
    Result := StrToDateTime(S);
end;

function mnABStrToCurr (const S: string; const BlankValue: Currency = 0): Currency;
begin
  if S = '' then
    Result := BlankValue
  else
    Result := StrToCurr(S);
end;

function mnABIntToStr  (const Value: Integer;   const BlankValue: Integer = 0): string;
begin
  if Value = BlankValue then
    Result := ''
  else
    Result := IntToStr(Value);
end;

function mnABFloatToStr(const Value: Extended;  const BlankValue: Extended = 0): string;
begin
  if Value = BlankValue then
    Result := ''
  else
    Result := FloatToStr(Value);
end;

function mnABDTToStr   (const Value: TDateTime; const BlankValue: TDateTime = 0): string;
begin
  if Value = BlankValue then
    Result := ''
  else
    Result := DateTimeToStr(Value);
end;

function mnABCurrToStr (const Value: Currency;  const BlankValue: Currency = 0): string;
begin
  if Value = BlankValue then
    Result := ''
  else
    Result := CurrToStr(Value);
end;

function mnFloatToStr(const Value: Extended; const DecimalDigits: Integer = -1; const PositiveSign: Boolean = False): string;
begin
  if DecimalDigits = -1 then
    Result := FloatToStr(Value)
  else
    Result := FormatFloat('0.' + StringOfChar('0', DecimalDigits), Value);
  if PositiveSign and (Value >= 0) then
    Result := '+' + Result;
end;

function mnCurrToStr (const Value: Currency; const DecimalDigits: Integer = -1; const PositiveSign: Boolean = False): string;
begin
  if DecimalDigits = -1 then
    Result := CurrToStr(Value)
  else
    Result := FormatCurr('0.' + StringOfChar('0', DecimalDigits), Value);
  if PositiveSign and (Value >= 0) then
    Result := '+' + Result;
end;

function mnIntToTSStr  (const Value: Integer;                                     const PositiveSign: Boolean = False): string;
begin
  Result := FormatFloat('#,##0', Value);
  if PositiveSign and (Value >= 0) then
    Result := '+' + Result;
end;

function mnFloatToTSStr(const Value: Extended; const DecimalDigits: Integer = -1; const PositiveSign: Boolean = False): string;
begin
  if DecimalDigits = -1 then
    Result := FormatFloat('#,##0.' + StringOfChar('#', 12), Value)
  else
    Result := FormatFloat('#,##0.' + StringOfChar('0', DecimalDigits), Value);
  if PositiveSign and (Value >= 0) then
    Result := '+' + Result;
end;

function mnCurrToTSStr (const Value: Currency; const DecimalDigits: Integer = -1; const PositiveSign: Boolean = False): string;
begin
  if DecimalDigits = -1 then
    Result := FormatCurr('#,##0.' + StringOfChar('#', 12), Value)
  else
    Result := FormatCurr('#,##0.' + StringOfChar('0', DecimalDigits), Value);
  if PositiveSign and (Value >= 0) then
    Result := '+' + Result;
end;

function mnTSStrToInt  (const S: string): Integer;
begin
  Result := StrToInt(mnDiscardDelimiter(',', S));
end;

function mnTSStrToFloat(const S: string): Extended;
begin
  Result := StrToFloat(mnDiscardDelimiter(',', S));
end;

function mnTSStrToCurr (const S: string): Currency;
begin
  Result := StrToCurr(mnDiscardDelimiter(',', S));
end;

function mnFloatToPercentStr(const Value: Extended; const DecimalDigits: Integer = -1; const PositiveSign: Boolean = False): string;
begin
  Result := mnFloatToStr(Value*100, DecimalDigits) + '%';
  if PositiveSign and (Value >= 0) then
    Result := '+' + Result;
end;

function mnCurrToPercentStr (const Value: Currency; const DecimalDigits: Integer = -1; const PositiveSign: Boolean = False): string;
begin
  Result := mnCurrToStr(Value*100, DecimalDigits) + '%';
  if PositiveSign and (Value >= 0) then
    Result := '+' + Result;
end;

function mnPercentStrToFloat(const S: string): Extended;
var
  varS: string;
begin
  varS := mnDiscardDelimiter(', ', S);
  mnCreateErrorIf(not AnsiEndsStr('%', varS), SWrongPercentStrTail, [S]);
  varS := mnTruncBRight(varS, 1);
  Result := StrToFloat(varS) / 100;
end;

function mnPercentStrToCurr (const S: string): Currency;
var
  varS: string;
begin
  varS := mnDiscardDelimiter(', ', S);
  mnCreateErrorIf(not AnsiEndsStr('%', varS), SWrongPercentStrTail, [S]);
  varS := mnTruncBRight(varS, 1);
  Result := StrToCurr(varS) / 100;
end;

function mnLLStrToInt(const S: string): Integer;
var
  Index: Integer;
begin
  Index := 0;
  while mnIsDigit(S[Index+1]) do
    Inc(Index);
  mnCreateErrorIf(Index = 0, SIllegalLLStrForInt, [S]);
  Result := StrToInt(LeftBStr(S, Index));
end;

function mnLLStrToFloat(const S: string): Extended;
var
  Index: Integer;
  HasDot: Boolean;
begin
  Index := 0;
  HasDot := False;
  while mnIsDigit(S[Index+1]) or (not HasDot and (S[Index+1] = '.')) do
  begin
    if S[Index+1] = '.' then HasDot := True;
    Inc(Index);
  end;
  mnCreateErrorIf(Index = 0, SIllegalLLStrForFloat, [S]);
  Result := StrToFloat(LeftBStr(S, Index));
end;

function mnBoolToInt(const Value: Boolean): Integer; inline;
begin
  Result := mnChooseInt(Value, 1, 0);
end;

function mnIntToBool(const Value: Integer): Boolean; inline;
begin
  Result := Value <> 0;
end;

function mnBoolToStr(const Value: Boolean): string;
begin
  Result := BoolToStr(Value, True);
end;

function mnDigitIntToChar(const Value: Integer): Char; inline;
begin
  Result := Chr(Ord('0') + Value);
end;

function mnCharToDigitInt(const Ch: Char): Integer; inline;
begin
  Result := Ord(Ch) - Ord('0');
end;

function mnDigitIntToByte(const Value: Integer): Byte; inline;
begin
  Result := Ord('0') + Value;
end;

function mnByteToDigitInt(const B: Byte): Integer; inline;
begin
  Result := B - Ord('0');
end;

function mnHexIntToChar(const Value: Integer; const Capital: Boolean = True): Char; inline;
begin
  if Value < 10 then
    Result := mnDigitIntToChar(Value)
  else if Capital then
    Result := Chr(Ord('A') - 10 + Value)
  else
    Result := Chr(Ord('a') - 10 + Value);
end;

function mnCharToHexInt(const Ch: Char): Integer; inline;
begin
  if (Ch >= '0') and (Ch <= '9') then
    Result := mnCharToDigitInt(Ch)
  else if (Ch >= 'A') and (Ch <= 'F') then
    Result := Ord(Ch) - Ord('A') + 10
  else if (Ch >= 'a') and (Ch <= 'f') then
    Result := Ord(Ch) - Ord('a') + 10
  else
    Result := 0;
end;

function mnHexIntToByte(const Value: Integer; const Capital: Boolean = True): Byte; inline;
begin
  if Value < 10 then
    Result := mnDigitIntToByte(Value)
  else if Capital then
    Result := Ord('A') - 10 + Value
  else
    Result := Ord('a') - 10 + Value;
end;

function mnByteToHexInt(const B: Byte): Integer; inline;
begin
  if (B >= Ord('0')) and (B <= Ord('9')) then
    Result := mnByteToDigitInt(B)
  else if (B >= Ord('A')) and (B <= Ord('F')) then
    Result := B - Ord('A') + 10
  else if (B >= Ord('a')) and (B <= Ord('f')) then
    Result := B - Ord('a') + 10
  else
    Result := 0;
end;

function mnDigletIntToChar(const Value: Integer; const Capital: Boolean = True): Char; inline;
begin
  if Value < 10 then
    Result := mnDigitIntToChar(Value)
  else if Capital then
    Result := Chr(Ord('A') - 10 + Value)
  else
    Result := Chr(Ord('a') - 10 + Value);
end;

function mnCharToDigletInt(const Ch: Char): Integer; inline;
begin
  if (Ch >= '0') and (Ch <= '9') then
    Result := mnCharToDigitInt(Ch)
  else if (Ch >= 'A') and (Ch <= 'Z') then
    Result := Ord(Ch) - Ord('A') + 10
  else if (Ch >= 'a') and (Ch <= 'z') then
    Result := Ord(Ch) - Ord('a') + 10
  else
    Result := 0;
end;

function mnDigletIntToByte(const Value: Integer; const Capital: Boolean = True): Byte; inline;
begin
  if Value < 10 then
    Result := mnDigitIntToByte(Value)
  else if Capital then
    Result := Ord('A') - 10 + Value
  else
    Result := Ord('a') - 10 + Value;
end;

function mnByteToDigletInt(const B: Byte): Integer; inline;
begin
  if (B >= Ord('0')) and (B <= Ord('9')) then
    Result := mnByteToDigitInt(B)
  else if (B >= Ord('A')) and (B <= Ord('Z')) then
    Result := B - Ord('A') + 10
  else if (B >= Ord('a')) and (B <= Ord('z')) then
    Result := B - Ord('a') + 10
  else
    Result := 0;
end;

function mnUpperCase(const Ch: Char): Char; inline;
begin
  if mnIsLowerCase(Ch) then
    Result := Chr(Ord(Ch) + Ord('A') - Ord('a'))
  else
    Result := Ch;
end;

function mnLowerCase(const Ch: Char): Char; inline;
begin
  if mnIsUpperCase(Ch) then
    Result := Chr(Ord(Ch) + Ord('a') - Ord('A'))
  else
    Result := Ch;
end;

function mnCheckStrConstraint(const S: string; const StrConstraint: mnTStrConstraint): Boolean;
begin
  case StrConstraint of
    scAny:           Result := True;
    scNotEmpty:      Result := S <> '';
    scNotEmptyAbs:   Result := (S <> '') and (mnDiscardChar(' ', S) <> '');
    scIsInt:         Result := mnIsInteger(S);
    scIsFloat:       Result := mnIsFloat(S);
    scIsDT:          Result := mnIsDateTime(S);
    scIsCurr:        Result := mnIsCurrency(S);
    scNE0:           Result := mnIsFloat(S) and (StrToFloat(S) <> 0);
    scLT0:           Result := mnIsFloat(S) and (StrToFloat(S) < 0);
    scLE0:           Result := mnIsFloat(S) and (StrToFloat(S) <= 0);
    scGT0:           Result := mnIsFloat(S) and (StrToFloat(S) > 0);
    scGE0:           Result := mnIsFloat(S) and (StrToFloat(S) >= 0);
  else
    mnCreateError(SIllegalStrConstraint);
    Result := False;
  end;
end;

function mnNewVarPointer  (const Value: Variant):   Pointer; inline;
var
  PVar: PVariant;
begin
  New(PVar);
  PVar^ := Value;
  Result := PVar;
end;

function mnNewStrPointer  (const Value: string):    Pointer; inline;
var
  PStr: PString;
begin
  New(PStr);
  PStr^ := Value;
  Result := PStr;
end;

function mnNewIntPointer  (const Value: Integer):   Pointer; inline;
var
  PInt: PInteger;
begin
  New(PInt);
  PInt^ := Value;
  Result := PInt;
end;

function mnNewFloatPointer(const Value: Extended):  Pointer; inline;
var
  PFloat: PExtended;
begin
  New(PFloat);
  PFloat^ := Value;
  Result := PFloat;
end;

function mnNewDTPointer   (const Value: TDateTime): Pointer; inline;
var
  PDT: PDateTime;
begin
  New(PDT);
  PDT^ := Value;
  Result := PDT;
end;

function mnNewCurrPointer (const Value: Currency):  Pointer; inline;
var
  PCurr: PCurrency;
begin
  New(PCurr);
  PCurr^ := Value;
  Result := PCurr;
end;

function mnNewBoolPointer (const Value: Boolean):   Pointer; inline;
var
  PBool: PBoolean;
begin
  New(PBool);
  PBool^ := Value;
  Result := PBool;
end;

function mnReadVarPointer  (const P: Pointer): Variant;   inline;
begin
  Result := PVariant(P)^;
end;

function mnReadStrPointer  (const P: Pointer): string;    inline;
begin
  Result := PString(P)^;
end;

function mnReadIntPointer  (const P: Pointer): Integer;   inline;
begin
  Result := PInteger(P)^;
end;

function mnReadFloatPointer(const P: Pointer): Extended;  inline;
begin
  Result := PExtended(P)^;
end;

function mnReadDTPointer   (const P: Pointer): TDateTime; inline;
begin
  Result := PDateTime(P)^;
end;

function mnReadCurrPointer (const P: Pointer): Currency;  inline;
begin
  Result := PCurrency(P)^;
end;

function mnReadBoolPointer (const P: Pointer): Boolean;   inline;
begin
  Result := PBoolean(P)^;
end;

procedure mnWriteVarPointer  (const P: Pointer; const Value: Variant);   inline;
begin
  PVariant(P)^ := Value;
end;

procedure mnWriteStrPointer  (const P: Pointer; const Value: string);    inline;
begin
  PString(P)^ := Value;
end;

procedure mnWriteIntPointer  (const P: Pointer; const Value: Integer);   inline;
begin
  PInteger(P)^ := Value;
end;

procedure mnWriteFloatPointer(const P: Pointer; const Value: Extended);  inline;
begin
  PExtended(P)^ := Value;
end;

procedure mnWriteDTPointer   (const P: Pointer; const Value: TDateTime); inline;
begin
  PDateTime(P)^ := Value;
end;

procedure mnWriteCurrPointer (const P: Pointer; const Value: Currency);  inline;
begin
  PCurrency(P)^ := Value;
end;

procedure mnWriteBoolPointer (const P: Pointer; const Value: Boolean);   inline;
begin
  PBoolean(P)^ := Value;
end;

procedure mnFreePointer(P: Pointer; const PointerType: mnTPointerType = ptSimple);
begin
  if Assigned(P) then
  begin
    if PointerType = ptVariant then PVariant(P)^ := Unassigned
    else if PointerType = ptString then PString(P)^ := '';
    Dispose(P);
  end;
end;

procedure mnFreeAndNilPointer(var P: Pointer; const PointerType: mnTPointerType = ptSimple); inline;
begin
  mnFreePointer(P, PointerType);
  P := nil;
end;

procedure mnFreeObjects(Strs: TStrings; const PointerType: mnTPointerType = ptSimple); overload;
var
  i: Integer;
begin
  for i := 0 to Strs.Count-1 do
  begin
    mnFreePointer(Strs.Objects[i], PointerType);
    Strs.Objects[i] := nil;
  end;
end;

procedure mnFreeObjects(TreeNodes: TTreeNodes; const PointerType: mnTPointerType = ptSimple); overload;
var
  i: Integer;
begin
  for i := 0 to TreeNodes.Count-1 do
  begin
    mnFreePointer(TreeNodes[i].Data, PointerType);
    TreeNodes[i].Data := nil;
  end;
end;

procedure mnClearStrings(Strs: TStrings; const PointerType: mnTPointerType = ptSimple); inline;
begin
  mnFreeObjects(Strs, PointerType);
  Strs.Clear;
end;

procedure mnClearTreeNodes(TreeNodes: TTreeNodes; const PointerType: mnTPointerType = ptSimple); inline;
begin
  mnFreeObjects(TreeNodes, PointerType);
  TreeNodes.Clear;
end;

procedure mnTreeNodesToStrings(TreeNodes: TTreeNodes; Strs: TStrings; const Prefix: string = ' ');
var
  i: Integer;
begin
  Strs.Capacity := Strs.Count + TreeNodes.Count;
  for i := 0 to TreeNodes.Count-1 do
  begin
    Strs.AddObject(DupeString(Prefix, TreeNodes[i].Level) + TreeNodes[i].Text, TreeNodes[i].Data);
  end;
end;

function mnTreeNodeFullText(TreeNode: TTreeNode; const LevelMark: string = '->'): string;
begin
  Result := '';
  while TreeNode <> nil do
  begin
    if Result <> '' then Result := LevelMark + Result;
    Result := TreeNode.Text + Result;
    TreeNode := TreeNode.Parent;
  end;
end;

procedure mnArrayToStrings(const Arr: array of string; Strs: TStrings);
var
  Element: string;
begin
  Strs.Capacity := Strs.Count + Length(Arr);
  for Element in Arr do
    Strs.Add(Element);
end;

var
  CounterPos: Integer;

procedure mnInitCounter(const InitPos: Integer = 0);
begin
  CounterPos := InitPos;
end;

procedure mnAddCounter(const Step: Integer = 1);
begin
  Inc(CounterPos, Step);
end;

function mnGetCounter: Integer;
begin
  Result := CounterPos;
end;

var
  CircleLowerLimit: Integer;
  CircleUpperLimit: Integer;
  CirclePos: Integer;

procedure mnInitCircle(const LowerLimit, UpperLimit, InitPos: Integer);
begin
  CircleLowerLimit := LowerLimit;
  CircleUpperLimit := UpperLimit;
  CirclePos := InitPos;
end;

function mnGoCircle: Boolean; overload;
begin
  Inc(CirclePos);
  Result := CirclePos > CircleUpperLimit;
  if Result then CirclePos := CircleLowerLimit;
end;

function mnGoCircle(const Step: Integer): Boolean; overload;
begin
  Inc(CirclePos, Step);
  Result := (CirclePos > CircleUpperLimit) or (CirclePos < CircleLowerLimit);
  while CirclePos > CircleUpperLimit do Dec(CirclePos, CircleUpperLimit - CircleLowerLimit + 1);
  while CirclePos < CircleLowerLimit do Inc(CirclePos, CircleUpperLimit - CircleLowerLimit + 1);
end;

function mnGetCirclePos: Integer;
begin
  Result := CirclePos;
end;

function mnCircle(const LowerLimit, UpperLimit, InitPos, Step: Integer): Integer;
begin
  Result := InitPos + Step;
  while Result > UpperLimit do Dec(Result, UpperLimit - LowerLimit + 1);
  while Result < LowerLimit do Inc(Result, UpperLimit - LowerLimit + 1);
end;

procedure mnSleep(const Milliseconds: Cardinal);
var
  TickStart: DWORD;
begin
  TickStart := GetTickCount;
  while GetTickCount - TickStart <= Milliseconds do Application.ProcessMessages;
end;

function mnNewGUID: string;
var
  GUID: TGUID;
begin
  CreateGUID(GUID);
  Result := Copy(GUIDToString(GUID), 2, 36);
end;

function mnHasMethodByName(Obj: TObject; const MethodName: string): Boolean;
begin
  Result := Assigned(Obj.MethodAddress(MethodName));
end;

function mnExecMethodByName(Obj: TObject; const MethodName: string; Params: array of const): DWORD;
const
  RecSize = SizeOf(TVarRec);
var
  PMethod: Pointer;
  ParamCount: DWORD;
begin
  PMethod := Obj.MethodAddress(MethodName);
  mnCreateErrorIf(not Assigned(PMethod), SMethodNotFound, [MethodName, Obj.ClassName]);

  ParamCount := High(Params) + 1;

  asm
    PUSH    ESI

    MOV     ESI, Params
    CMP     ParamCount, 1
    JB      @NoParam
    JE      @OneParam
    CMP     ParamCount, 2
    JE      @TwoParams

  @ManyParams:
    CLD
    MOV     ECX, ParamCount
    SUB     ECX, 2
    MOV     EDX, RecSize
    ADD     EDX, RecSize
  @PushParamsLoop:
    MOV     EAX, [ESI][EDX]
    PUSH    EAX
    ADD     EDX, RecSize
    LOOP    @PushParamsLoop

  @TwoParams:
    MOV     ECX, [ESI] + RecSize

  @OneParam:
    MOV     EDX, [ESI]

  @NoParam:
    MOV     EAX, Obj
    CALL    PMethod
    MOV     Result, EAX

    POP     ESI
  end;
end;

{ mnTStreamTurbo }

constructor mnTStreamTurbo.Create(AStream: TStream);
begin
  Stream := AStream;
  Bookmarks := mnTPointerList.Create;
  FLittleEndian := True;
end;

destructor mnTStreamTurbo.Destroy;
begin
  Bookmarks.Free;
  inherited;
end;

function mnTStreamTurbo.Tell: Int64;
begin
  Result := Stream.Position;
end;

function mnTStreamTurbo.Seek(const Offset: Int64; const SeekOrigin: TSeekOrigin = soBeginning): Int64;
begin
  Result := Stream.Seek(Offset, SeekOrigin);
end;

function mnTStreamTurbo.Skip(const Offset: Int64): Int64;
begin
  Result := Stream.Seek(Offset, soCurrent);
end;

procedure mnTStreamTurbo.Reset;
begin
  Stream.Seek(0, soBeginning);
end;

function mnTStreamTurbo.GetSize: Int64;
begin
  Result := Stream.Size;
end;

function mnTStreamTurbo.GetLeavingSize: Int64;
begin
  Result := Stream.Size - Stream.Position;
end;

function mnTStreamTurbo.IsEnd: Boolean;
begin
  Result := Stream.Size = Stream.Position;
end;

procedure mnTStreamTurbo.PutBookmark(const Ordinal: Integer);
var
  i: Integer;
  Bookmark: mnPStreamBookmark;
begin
  for i := 0 to Bookmarks.Count-1 do
  begin
    Bookmark := Bookmarks[i];
    if Bookmark.Ordinal = Ordinal then
    begin
      Bookmark.Pos := Tell;
      Exit;
    end;
  end;
  New(Bookmark);
  Bookmark.Ordinal := Ordinal;
  Bookmark.Pos := Tell;
  Bookmarks.Add(Bookmark);
end;

function mnTStreamTurbo.GotoBookmark(const Ordinal: Integer): Boolean;
var
  i: Integer;
  Bookmark: mnPStreamBookmark;
begin
  for i := 0 to Bookmarks.Count-1 do
  begin
    Bookmark := Bookmarks[i];
    if Bookmark.Ordinal = Ordinal then
    begin
      Seek(Bookmark.Pos);
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;

function mnTStreamTurbo.GetBookmark(const Ordinal: Integer): Int64;
var
  i: Integer;
  Bookmark: mnPStreamBookmark;
begin
  for i := 0 to Bookmarks.Count-1 do
  begin
    Bookmark := Bookmarks[i];
    if Bookmark.Ordinal = Ordinal then
    begin
      Result := Bookmark.Pos;
      Exit;
    end;
  end;
  Result := -1;
end;

procedure mnTStreamTurbo.WriteBuffer(const Buffer; const Count: Integer);
begin
  Stream.WriteBuffer(Buffer, Count);
end;

procedure mnTStreamTurbo.WriteInt8(Value: Int8);
begin
  Stream.WriteBuffer(Value, SizeOf(Int8));
end;

procedure mnTStreamTurbo.WriteInt16(Value: Int16);
begin
  if not FLittleEndian then Value := mnReverseInt16(Value);
  Stream.WriteBuffer(Value, SizeOf(Int16));
end;

procedure mnTStreamTurbo.WriteInt32(Value: Int32);
begin
  if not FLittleEndian then Value := mnReverseInt32(Value);
  Stream.WriteBuffer(Value, SizeOf(Int32));
end;

procedure mnTStreamTurbo.WriteInt64(Value: Int64);
begin
  if not FLittleEndian then Value := mnReverseInt64(Value);
  Stream.WriteBuffer(Value, SizeOf(Int64));
end;

procedure mnTStreamTurbo.WriteUInt8(Value: UInt8);
begin
  Stream.WriteBuffer(Value, SizeOf(UInt8));
end;

procedure mnTStreamTurbo.WriteUInt16(Value: UInt16);
begin
  if not FLittleEndian then Value := mnReverseUInt16(Value);
  Stream.WriteBuffer(Value, SizeOf(UInt16));
end;

procedure mnTStreamTurbo.WriteUInt32(Value: UInt32);
begin
  if not FLittleEndian then Value := mnReverseUInt32(Value);
  Stream.WriteBuffer(Value, SizeOf(UInt32));
end;

procedure mnTStreamTurbo.WriteSingle(const Value: Single);
begin
  Stream.WriteBuffer(Value, SizeOf(Single));
end;

procedure mnTStreamTurbo.WriteDouble(const Value: Double);
begin
  Stream.WriteBuffer(Value, SizeOf(Double));
end;

procedure mnTStreamTurbo.WriteExtended(const Value: Extended);
begin
  Stream.WriteBuffer(Value, SizeOf(Extended));
end;

procedure mnTStreamTurbo.WriteCurrency(const Value: Currency);
begin
  Stream.WriteBuffer(Value, SizeOf(Currency));
end;

procedure mnTStreamTurbo.WriteDateTime(const Value: TDateTime);
begin
  Stream.WriteBuffer(Value, SizeOf(TDateTime));
end;

procedure mnTStreamTurbo.WriteBoolean(const Value: Boolean);
begin
  Stream.WriteBuffer(Value, SizeOf(Boolean));
end;

procedure mnTStreamTurbo.WriteShortString(const S: string);
begin
  WriteUInt8(Length(S));
  Stream.WriteBuffer(PChar(S)^, Length(S));
end;

procedure mnTStreamTurbo.WriteSmallString(const S: string);
begin
  WriteUInt16(Length(S));
  Stream.WriteBuffer(PChar(S)^, Length(S));
end;

procedure mnTStreamTurbo.WriteString(const S: string);
begin
  WriteUInt32(Length(S));
  Stream.WriteBuffer(PChar(S)^, Length(S));
end;

procedure mnTStreamTurbo.WriteText(const S: string);
begin
  Stream.WriteBuffer(PChar(S)^, Length(S));
end;

procedure mnTStreamTurbo.WriteWideString(const WS: WideString);
begin
  WriteUInt32(Length(WS) * SizeOf(WideChar));
  Stream.WriteBuffer(PWideChar(WS)^, Length(WS) * SizeOf(WideChar));
end;

procedure mnTStreamTurbo.WriteWideText(const WS: WideString);
begin
  Stream.WriteBuffer(PWideChar(WS)^, Length(WS) * SizeOf(WideChar));
end;

procedure mnTStreamTurbo.ReadBuffer(var Buffer; const Count: Integer);
begin
  Stream.ReadBuffer(Buffer, Count);
end;

function mnTStreamTurbo.ReadInt8: Int8;
begin
  Stream.ReadBuffer(Result, SizeOf(Int8));
end;

function mnTStreamTurbo.ReadInt16: Int16;
begin
  Stream.ReadBuffer(Result, SizeOf(Int16));
  if not FLittleEndian then Result := mnReverseInt16(Result);
end;

function mnTStreamTurbo.ReadInt32: Int32;
begin
  Stream.ReadBuffer(Result, SizeOf(Int32));
  if not FLittleEndian then Result := mnReverseInt32(Result);
end;

function mnTStreamTurbo.ReadInt64: Int64;
begin
  Stream.ReadBuffer(Result, SizeOf(Int64));
  if not FLittleEndian then Result := mnReverseInt64(Result);
end;

function mnTStreamTurbo.ReadUInt8: UInt8;
begin
  Stream.ReadBuffer(Result, SizeOf(UInt8));
end;

function mnTStreamTurbo.ReadUInt16: UInt16;
begin
  Stream.ReadBuffer(Result, SizeOf(UInt16));
  if not FLittleEndian then Result := mnReverseUInt16(Result);
end;

function mnTStreamTurbo.ReadUInt32: UInt32;
begin
  Stream.ReadBuffer(Result, SizeOf(UInt32));
  if not FLittleEndian then Result := mnReverseUInt32(Result);
end;

function mnTStreamTurbo.ReadSingle: Single;
begin
  Stream.ReadBuffer(Result, SizeOf(Single));
end;

function mnTStreamTurbo.ReadDouble: Double;
begin
  Stream.ReadBuffer(Result, SizeOf(Double));
end;

function mnTStreamTurbo.ReadExtended: Extended;
begin
  Stream.ReadBuffer(Result, SizeOf(Extended));
end;

function mnTStreamTurbo.ReadCurrency: Currency;
begin
  Stream.ReadBuffer(Result, SizeOf(Currency));
end;

function mnTStreamTurbo.ReadDateTime: TDateTime;
begin
  Stream.ReadBuffer(Result, SizeOf(TDateTime));
end;

function mnTStreamTurbo.ReadBoolean: Boolean;
begin
  Stream.ReadBuffer(Result, SizeOf(Boolean));
end;

function mnTStreamTurbo.ReadShortString: string;
var
  Len: UInt8;
begin
  Len := ReadUInt8;
  SetLength(Result, Len);
  Stream.ReadBuffer(PChar(Result)^, Len);
end;

function mnTStreamTurbo.ReadSmallString: string;
var
  Len: UInt16;
begin
  Len := ReadUInt16;
  SetLength(Result, Len);
  Stream.ReadBuffer(PChar(Result)^, Len);
end;

function mnTStreamTurbo.ReadString: string;
var
  Len: UInt32;
begin
  Len := ReadUInt32;
  SetLength(Result, Len);
  Stream.ReadBuffer(PChar(Result)^, Len);
end;

function mnTStreamTurbo.ReadText: string;
var
  Len: Int64;
begin
  Len := GetLeavingSize;
  SetLength(Result, Len);
  Stream.ReadBuffer(PChar(Result)^, Len);
end;

function mnTStreamTurbo.ReadWideString: WideString;
var
  Len: UInt32;
begin
  Len := ReadUInt32;
  SetLength(Result, Len div SizeOf(WideChar));
  Stream.ReadBuffer(PWideChar(Result)^, Len);
end;

function mnTStreamTurbo.ReadWideText: WideString;
var
  Len: Int64;
begin
  Len := GetLeavingSize;
  SetLength(Result, Len div SizeOf(WideChar));
  Stream.ReadBuffer(PWideChar(Result)^, Len);
end;

{ mnTPointerList }

procedure mnTPointerList.Notify(Ptr: Pointer; Action: TListNotification);
begin
  if Action = lnDeleted then mnFreePointer(Ptr, PointerType);
  inherited Notify(Ptr, Action);
end;

constructor mnTPointerList.Create;
begin
  FPointerType := ptSimple;
end;

{ mnTTypeList }

constructor mnTTypeList.Create;
begin
  inherited Create;
  FDuplicates := dupAccept;
end;

procedure mnTTypeList.SaveToStream(Stream: TStream);
var
  StreamTurbo: mnTStreamTurbo;
begin
  StreamTurbo := mnTStreamTurbo.Create(Stream);
  try
    SaveToStreamTurbo(StreamTurbo);
  finally
    StreamTurbo.Free;
  end;
end;

procedure mnTTypeList.SaveToStreamFile(const FileName: string);
var
  Stream: TStream;
  StreamTurbo: mnTStreamTurbo;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  StreamTurbo := mnTStreamTurbo.Create(Stream);
  try
    SaveToStreamTurbo(StreamTurbo);
  finally
    StreamTurbo.Free;
    Stream.Free;
  end;
end;

procedure mnTTypeList.LoadFromStream(Stream: TStream);
var
  StreamTurbo: mnTStreamTurbo;
begin
  StreamTurbo := mnTStreamTurbo.Create(Stream);
  try
    LoadFromStreamTurbo(StreamTurbo);
  finally
    StreamTurbo.Free;
  end;
end;

procedure mnTTypeList.LoadFromStreamFile(const FileName: string);
var
  Stream: TStream;
  StreamTurbo: mnTStreamTurbo;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  StreamTurbo := mnTStreamTurbo.Create(Stream);
  try
    LoadFromStreamTurbo(StreamTurbo);
  finally
    StreamTurbo.Free;
    Stream.Free;
  end;
end;

{ mnTVarListEnumerator }

constructor mnTVarListEnumerator.Create(AList: mnTVarList);
begin
  inherited Create;
  Index := -1;
  List := AList;
end;

function mnTVarListEnumerator.GetCurrent: Variant;
begin
  Result := List[Index];
end;

function mnTVarListEnumerator.MoveNext: Boolean;
begin
  Result := Index < List.Count - 1;
  if Result then Inc(Index);
end;

{ mnTVarList }

function mnTVarList.GetItem(Index: Integer): Variant;
begin
  Result := mnReadVarPointer(Get(Index));
end;

procedure mnTVarList.SetItem(Index: Integer; const Value: Variant);
begin
  mnWriteVarPointer(Get(Index), Value);
end;

function mnTVarList.GetMin: Variant;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := GetItem(0);
  for i := 1 to Count-1 do
    if VarToStr(Result) > VarToStr(GetItem(i)) then Result := GetItem(i);
end;

function mnTVarList.GetMax: Variant;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := GetItem(0);
  for i := 1 to Count-1 do
    if VarToStr(Result) < VarToStr(GetItem(i)) then Result := GetItem(i);
end;

constructor mnTVarList.Create;
begin
  inherited Create;
  FPointerType := ptVariant; // override the default PointerType of mnTPointerList
end;

function mnTVarList.IndexOf(const Item: Variant): Integer;
begin
  for Result := 0 to Count-1 do
    if mnCompareVarStrict(GetItem(Result), Item) then Exit;
  Result := -1;
end;

function mnTVarList.First: Variant;
begin
  Result := mnReadVarPointer(inherited First);
end;

function mnTVarList.Last: Variant;
begin
  Result := mnReadVarPointer(inherited Last);
end;

function mnTVarList.Add(const Item: Variant): Integer;
begin
  Result := -1;
  if FDuplicates <> dupAccept then
  begin
    if IndexOf(Item) <> -1 then
      if FDuplicates = dupIgnore then Exit
      else if FDuplicates = dupError then mnCreateError(EListError, STryToAddDuplicateItem, [VarToStr(Item)]);
  end;

  Result := inherited Add(mnNewVarPointer(Item));
end;

procedure mnTVarList.Insert(const Index: Integer; const Item: Variant);
begin
  if FDuplicates <> dupAccept then
  begin
    if IndexOf(Item) <> -1 then
      if FDuplicates = dupIgnore then Exit
      else if FDuplicates = dupError then mnCreateError(EListError, STryToAddDuplicateItem, [VarToStr(Item)]);
  end;

  inherited Insert(Index, mnNewVarPointer(Item));
end;

function mnTVarList.Extract(const Index: Integer): Variant;
begin
  if not mnBetweenIE(Index, 0, Count) then
    Error(@SListIndexError, Index);

  Result := GetItem(Index);
  Delete(Index);
end;

function mnTVarList.Remove(const Item: Variant): Integer;
begin
  Result := IndexOf(Item);
  if Result >= 0 then Delete(Result);
end;

function mnTVarList.RemoveAll(const Item: Variant): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := Count-1 downto 0 do
    if mnCompareVarStrict(GetItem(i), Item) then
    begin
      Delete(i);
      Inc(Result);
    end;
end;

function VarListCompareAsc(Item1, Item2: Pointer): Integer;
begin
  if VarToStr(mnReadVarPointer(Item1)) < VarToStr(mnReadVarPointer(Item2)) then
    Result := -1
  else if VarToStr(mnReadVarPointer(Item1)) > VarToStr(mnReadVarPointer(Item2)) then
    Result := 1
  else
    Result := 0;
end;

function VarListCompareDesc(Item1, Item2: Pointer): Integer;
begin
  if VarToStr(mnReadVarPointer(Item1)) < VarToStr(mnReadVarPointer(Item2)) then
    Result := 1
  else if VarToStr(mnReadVarPointer(Item1)) > VarToStr(mnReadVarPointer(Item2)) then
    Result := -1
  else
    Result := 0;
end;

procedure mnTVarList.SortNormal(const OrderStyle: mnTOrderStyle);
begin
  if OrderStyle = osAsc then
    inherited Sort(VarListCompareAsc)
  else
    inherited Sort(VarListCompareDesc);
end;

function mnTVarList.IsUnique: Boolean;
var
  i, j: Integer;
begin
  for i := Count-1 downto 0 do
    for j := 0 to i-1 do
      if mnCompareVarStrict(GetItem(i), GetItem(j)) then
      begin
        Result := False;
        Exit;
      end;
  Result := True;
end;

procedure mnTVarList.MakeUnique;
var
  i, j: Integer;
begin
  for i := Count-1 downto 0 do
    for j := 0 to i-1 do
      if mnCompareVarStrict(GetItem(i), GetItem(j)) then
      begin
        Delete(i);
        Break;
      end;
end;

function mnTVarList.Equals(AnotherList: mnTVarList): Boolean;
var
  i: Integer;
begin
  Result := Count = AnotherList.Count;
  if not Result then Exit;

  for i := 0 to Count-1 do
    if not mnCompareVarStrict(GetItem(i), AnotherList.GetItem(i)) then
    begin
      Result := False;
      Exit;
    end;
end;

procedure mnTVarList.Compare(AnotherList: mnTVarList; OutSolo, OutAnotherSolo: mnTVarList);
var
  i: Integer;
begin
  OutSolo.Capacity := OutSolo.Count + Count;
  OutAnotherSolo.Capacity := OutAnotherSolo.Count + AnotherList.Count;
  for i := 0 to Count-1 do
    if AnotherList.IndexOf(GetItem(i)) = -1 then OutSolo.Add(GetItem(i));
  for i := 0 to AnotherList.Count-1 do
    if IndexOf(AnotherList.GetItem(i)) = -1 then OutAnotherSolo.Add(AnotherList.GetItem(i));
end;

procedure mnTVarList.Link(AnotherList: mnTVarList);
var
  AnotherItem: Variant;
begin
  Capacity := Count + AnotherList.Count;
  for AnotherItem in AnotherList do
    Add(AnotherItem);
end;

procedure mnTVarList.LinkStrs(Strs: TStrings);
var
  str: string;
begin
  for str in Strs do
    Add(str);
end;

procedure mnTVarList.Assign(AnotherList: mnTVarList; AOperator: TListAssignOp = laCopy);
var
  i: Integer;
  AnotherItem: Variant;
  TempList: mnTVarList;
begin
  case AOperator of
    laCopy:
    begin
      Clear;
      Link(AnotherList);
    end;

    laAnd:
    begin
      for i := Count-1 downto 0 do
        if AnotherList.IndexOf(GetItem(i)) = -1 then
          Delete(i);
    end;

    laOr:
    begin
      Capacity := Count + AnotherList.Count;
      for AnotherItem in AnotherList do
        if IndexOf(AnotherItem) = -1 then
          Add(AnotherItem);
    end;

    laXor:
    begin
      TempList := mnTVarList.Create;
      try
        TempList.Capacity := Count + AnotherList.Count;
        for i := 0 to Count-1 do
          if AnotherList.IndexOf(GetItem(i)) = -1 then TempList.Add(GetItem(i));
        for i := 0 to AnotherList.Count-1 do
          if IndexOf(AnotherList.GetItem(i)) = -1 then TempList.Add(AnotherList.GetItem(i));
        Assign(TempList);
      finally
        TempList.Free;
      end;
    end;

    laSrcUnique:
    begin
      for i := Count-1 downto 0 do
        if AnotherList.IndexOf(GetItem(i)) <> -1 then Delete(i);
    end;

    laDestUnique:
    begin
      TempList := mnTVarList.Create;
      try
        TempList.Capacity := AnotherList.Count;
        for AnotherItem in AnotherList do
        if IndexOf(AnotherItem) = -1 then
          TempList.Add(AnotherItem);
        Assign(TempList);
      finally
        TempList.Free;
      end;
    end;
  end;
end;

procedure mnTVarList.SaveToStreamTurbo(StreamTurbo: mnTStreamTurbo);
var
  i: Integer;
begin
  StreamTurbo.WriteUInt32(Count);
  for i := 0 to Count-1 do
  begin
    StreamTurbo.WriteUInt16(VarType(GetItem(i)));
    StreamTurbo.WriteString(VarToStr(GetItem(i)));
  end;
end;

procedure mnTVarList.LoadFromStreamTurbo(StreamTurbo: mnTStreamTurbo);
var
  i: Integer;
  StoredCount: Integer;
  StoredVarType: Word;
begin
  Clear;
  StoredCount := StreamTurbo.ReadUInt32;
  Capacity := StoredCount;
  for i := 0 to StoredCount-1 do
  begin
    StoredVarType := StreamTurbo.ReadUInt16;
    Add(StreamTurbo.ReadString);
    SetItem(i, VarAsType(GetItem(i), StoredVarType));
  end;
end;

procedure mnTVarList.SaveToFile(const FileName: string);
var
  strs: TStringList;
  i: Integer;
begin
  strs := TStringList.Create;
  try
    for i := 0 to Count-1 do
      strs.Append(VarToStr(GetItem(i)));
    strs.SaveToFile(FileName);
  finally
    strs.Free;
  end;
end;

procedure mnTVarList.LoadFromFile(const FileName: string);
var
  strs: TStringList;
  str: string;
begin
  strs := TStringList.Create;
  try
    strs.LoadFromFile(FileName);
    Clear;
    for str in strs do
      Add(str);
  finally
    strs.Free;
  end;
end;

procedure mnTVarList.SaveToArray(var Arr: array of Variant);
var
  i: Integer;
begin
  mnCreateErrorIf(Length(Arr) < Count, SArrayTooShortForList);
  for i := Low(Arr) to High(Arr) do
    Arr[i] := GetItem(i-Low(Arr));
end;

procedure mnTVarList.LoadFromArray(const Arr: array of Variant);
var
  i: Integer;
begin
  Clear;
  Capacity := Length(Arr);
  for i := Low(Arr) to High(Arr) do
    Add(Arr[i]);
end;

function mnTVarList.SaveToVA: Variant;
var
  i: Integer;
begin
  Result := VarArrayCreate([1, Count], varVariant);
  try
    VarArrayLock(Result);
    for i := 0 to Count-1 do
      VarArrayPut(Result, GetItem(i), [i+1]);
  finally
    VarArrayUnlock(Result);
  end;
end;

procedure mnTVarList.LoadFromVA(const VA: Variant);
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim1(VA);
{$ENDIF}
  try
    VarArrayLock(VA);
    Clear;
    Capacity := mnVALength(VA, 1);
    for i := VarArrayLowBound(VA, 1) to VarArrayHighBound(VA, 1) do
      Add(VarArrayGet(VA, [i]));
  finally
    VarArrayUnlock(VA);
  end;
end;

function mnTVarList.Combine(const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Count-1 do
  begin
    if i <> 0 then Result := Result + Connector;
    Result := Result + VarToStr(GetItem(i));
  end;
  if HasBorder then Result := Connector + Result + Connector;
end;

function mnTVarList.Split(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
var
  strs: mnTStrList;
begin
  strs := mnTStrList.Create;
  try
    Result := mnSplit(S, strs, Separator, HasBorder);
    LinkStrs(strs);
  finally
    strs.Free;
  end;
end;

function mnTVarList.AnsiSplit(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
var
  strs: mnTStrList;
begin
  strs := mnTStrList.Create;
  try
    Result := mnAnsiSplit(S, strs, Separator, HasBorder);
    LinkStrs(strs);
  finally
    strs.Free;
  end;
end;

function mnTVarList.GetEnumerator: mnTVarListEnumerator;
begin
  Result := mnTVarListEnumerator.Create(Self);
end;

{ mnTIntListEnumerator }

constructor mnTIntListEnumerator.Create(AList: mnTIntList);
begin
  inherited Create;
  Index := -1;
  List := AList;
end;

function mnTIntListEnumerator.GetCurrent: Integer;
begin
  Result := List[Index];
end;

function mnTIntListEnumerator.MoveNext: Boolean;
begin
  Result := Index < List.Count - 1;
  if Result then Inc(Index);
end;

{ mnTIntList }

function mnTIntList.GetItem(Index: Integer): Integer;
begin
  Result := mnReadIntPointer(Get(Index));
end;

procedure mnTIntList.SetItem(Index: Integer; const Value: Integer);
begin
  mnWriteIntPointer(Get(Index), Value);
end;

function mnTIntList.GetMin: Integer;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := GetItem(0);
  for i := 1 to Count-1 do
    if Result > GetItem(i) then Result := GetItem(i);
end;

function mnTIntList.GetMax: Integer;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := GetItem(0);
  for i := 1 to Count-1 do
    if Result < GetItem(i) then Result := GetItem(i);
end;

function mnTIntList.GetSum: Integer;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := 0;
  for i := 0 to Count-1 do
    Result := Result + GetItem(i);
end;

function mnTIntList.GetAvg: Extended;
begin
  Result := GetSum / Count;
end;

function mnTIntList.GetProduct: Integer;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := 1;
  for i := 0 to Count-1 do
    Result := Result * GetItem(i);
end;

constructor mnTIntList.Create;
begin
  inherited Create;
end;

function mnTIntList.IndexOf(const Item: Integer): Integer;
begin
  for Result := 0 to Count-1 do
    if GetItem(Result) = Item then Exit;
  Result := -1;
end;

function mnTIntList.First: Integer;
begin
  Result := mnReadIntPointer(inherited First);
end;

function mnTIntList.Last: Integer;
begin
  Result := mnReadIntPointer(inherited Last);
end;

function mnTIntList.Add(const Item: Integer): Integer;
begin
  Result := -1;
  if FDuplicates <> dupAccept then
  begin
    if IndexOf(Item) <> -1 then
      if FDuplicates = dupIgnore then Exit
      else if FDuplicates = dupError then mnCreateError(EListError, STryToAddDuplicateItem, [IntToStr(Item)]);
  end;

  Result := inherited Add(mnNewIntPointer(Item));
end;

procedure mnTIntList.Insert(const Index: Integer; const Item: Integer);
begin
  if FDuplicates <> dupAccept then
  begin
    if IndexOf(Item) <> -1 then
      if FDuplicates = dupIgnore then Exit
      else if FDuplicates = dupError then mnCreateError(EListError, STryToAddDuplicateItem, [IntToStr(Item)]);
  end;

  inherited Insert(Index, mnNewIntPointer(Item));
end;

function mnTIntList.Extract(const Index: Integer): Integer;
begin
  if not mnBetweenIE(Index, 0, Count) then
    Error(@SListIndexError, Index);

  Result := GetItem(Index);
  Delete(Index);
end;

function mnTIntList.Remove(const Item: Integer): Integer;
begin
  Result := IndexOf(Item);
  if Result >= 0 then Delete(Result);
end;

function mnTIntList.RemoveAll(const Item: Integer): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := Count-1 downto 0 do
    if GetItem(i) = Item then
    begin
      Delete(i);
      Inc(Result);
    end;
end;

function IntListCompareAsc(Item1, Item2: Pointer): Integer;
begin
  if mnReadIntPointer(Item1) < mnReadIntPointer(Item2) then
    Result := -1
  else if mnReadIntPointer(Item1) > mnReadIntPointer(Item2) then
    Result := 1
  else
    Result := 0;
end;

function IntListCompareDesc(Item1, Item2: Pointer): Integer;
begin
  if mnReadIntPointer(Item1) < mnReadIntPointer(Item2) then
    Result := 1
  else if mnReadIntPointer(Item1) > mnReadIntPointer(Item2) then
    Result := -1
  else
    Result := 0;
end;

procedure mnTIntList.SortNormal(const OrderStyle: mnTOrderStyle);
begin
  if OrderStyle = osAsc then
    inherited Sort(IntListCompareAsc)
  else
    inherited Sort(IntListCompareDesc);
end;

function mnTIntList.IsUnique: Boolean;
var
  i, j: Integer;
begin
  for i := Count-1 downto 0 do
    for j := 0 to i-1 do
      if GetItem(i) = GetItem(j) then
      begin
        Result := False;
        Exit;
      end;
  Result := True;
end;

procedure mnTIntList.MakeUnique;
var
  i, j: Integer;
begin
  for i := Count-1 downto 0 do
    for j := 0 to i-1 do
      if GetItem(i) = GetItem(j) then
      begin
        Delete(i);
        Break;
      end;
end;

function mnTIntList.Equals(AnotherList: mnTIntList): Boolean;
var
  i: Integer;
begin
  Result := Count = AnotherList.Count;
  if not Result then Exit;

  for i := 0 to Count-1 do
    if GetItem(i) <> AnotherList.GetItem(i) then
    begin
      Result := False;
      Exit;
    end;
end;

procedure mnTIntList.Compare(AnotherList: mnTIntList; OutSolo, OutAnotherSolo: mnTIntList);
var
  i: Integer;
begin
  OutSolo.Capacity := OutSolo.Count + Count;
  OutAnotherSolo.Capacity := OutAnotherSolo.Count + AnotherList.Count;
  for i := 0 to Count-1 do
    if AnotherList.IndexOf(GetItem(i)) = -1 then OutSolo.Add(GetItem(i));
  for i := 0 to AnotherList.Count-1 do
    if IndexOf(AnotherList.GetItem(i)) = -1 then OutAnotherSolo.Add(AnotherList.GetItem(i));
end;

procedure mnTIntList.Link(AnotherList: mnTIntList);
var
  AnotherItem: Integer;
begin
  Capacity := Count + AnotherList.Count;
  for AnotherItem in AnotherList do
    Add(AnotherItem);
end;

procedure mnTIntList.LinkStrs(Strs: TStrings);
var
  str: string;
begin
  for str in Strs do
    if str <> '' then
      Add(StrToInt(str));
end;

procedure mnTIntList.Assign(AnotherList: mnTIntList; AOperator: TListAssignOp = laCopy);
var
  i: Integer;
  AnotherItem: Integer;
  TempList: mnTIntList;
begin
  case AOperator of
    laCopy:
    begin
      Clear;
      Link(AnotherList);
    end;

    laAnd:
    begin
      for i := Count-1 downto 0 do
        if AnotherList.IndexOf(GetItem(i)) = -1 then
          Delete(i);
    end;

    laOr:
    begin
      Capacity := Count + AnotherList.Count;
      for AnotherItem in AnotherList do
        if IndexOf(AnotherItem) = -1 then
          Add(AnotherItem);
    end;

    laXor:
    begin
      TempList := mnTIntList.Create;
      try
        TempList.Capacity := Count + AnotherList.Count;
        for i := 0 to Count-1 do
          if AnotherList.IndexOf(GetItem(i)) = -1 then TempList.Add(GetItem(i));
        for i := 0 to AnotherList.Count-1 do
          if IndexOf(AnotherList.GetItem(i)) = -1 then TempList.Add(AnotherList.GetItem(i));
        Assign(TempList);
      finally
        TempList.Free;
      end;
    end;

    laSrcUnique:
    begin
      for i := Count-1 downto 0 do
        if AnotherList.IndexOf(GetItem(i)) <> -1 then Delete(i);
    end;

    laDestUnique:
    begin
      TempList := mnTIntList.Create;
      try
        TempList.Capacity := AnotherList.Count;
        for AnotherItem in AnotherList do
        if IndexOf(AnotherItem) = -1 then
          TempList.Add(AnotherItem);
        Assign(TempList);
      finally
        TempList.Free;
      end;
    end;
  end;
end;

procedure mnTIntList.SaveToStreamTurbo(StreamTurbo: mnTStreamTurbo);
var
  i: Integer;
begin
  StreamTurbo.WriteUInt32(Count);
  for i := 0 to Count-1 do
    StreamTurbo.WriteInt32(GetItem(i));
end;

procedure mnTIntList.LoadFromStreamTurbo(StreamTurbo: mnTStreamTurbo);
var
  i: Integer;
  StoredCount: Integer;
begin
  Clear;
  StoredCount := StreamTurbo.ReadUInt32;
  Capacity := StoredCount;
  for i := 0 to StoredCount-1 do
    Add(StreamTurbo.ReadInt32);
end;

procedure mnTIntList.SaveToFile(const FileName: string);
var
  strs: TStringList;
  i: Integer;
begin
  strs := TStringList.Create;
  try
    for i := 0 to Count-1 do
      strs.Append(IntToStr(GetItem(i)));
    strs.SaveToFile(FileName);
  finally
    strs.Free;
  end;
end;

procedure mnTIntList.LoadFromFile(const FileName: string);
var
  strs: TStringList;
  str: string;
begin
  strs := TStringList.Create;
  try
    strs.LoadFromFile(FileName);
    Clear;
    for str in strs do
      Add(StrToInt(str));
  finally
    strs.Free;
  end;
end;

procedure mnTIntList.SaveToArray(var Arr: array of Integer);
var
  i: Integer;
begin
  mnCreateErrorIf(Length(Arr) < Count, SArrayTooShortForList);
  for i := Low(Arr) to High(Arr) do
    Arr[i] := GetItem(i-Low(Arr));
end;

procedure mnTIntList.LoadFromArray(const Arr: array of Integer);
var
  i: Integer;
begin
  Clear;
  Capacity := Length(Arr);
  for i := Low(Arr) to High(Arr) do
    Add(Arr[i]);
end;

function mnTIntList.SaveToVA: Variant;
var
  i: Integer;
begin
  Result := VarArrayCreate([1, Count], varVariant);
  try
    VarArrayLock(Result);
    for i := 0 to Count-1 do
      VarArrayPut(Result, GetItem(i), [i+1]);
  finally
    VarArrayUnlock(Result);
  end;
end;

procedure mnTIntList.LoadFromVA(const VA: Variant);
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim1(VA);
{$ENDIF}
  try
    VarArrayLock(VA);
    Clear;
    Capacity := mnVALength(VA, 1);
    for i := VarArrayLowBound(VA, 1) to VarArrayHighBound(VA, 1) do
      Add(VarArrayGet(VA, [i]));
  finally
    VarArrayUnlock(VA);
  end;
end;

function mnTIntList.Combine(const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Count-1 do
  begin
    if i <> 0 then Result := Result + Connector;
    Result := Result + IntToStr(GetItem(i));
  end;
  if HasBorder then Result := Connector + Result + Connector;
end;

function mnTIntList.Split(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
var
  strs: mnTStrList;
begin
  strs := mnTStrList.Create;
  try
    Result := mnSplit(S, strs, Separator, HasBorder);
    LinkStrs(strs);
  finally
    strs.Free;
  end;
end;

function mnTIntList.AnsiSplit(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
var
  strs: mnTStrList;
begin
  strs := mnTStrList.Create;
  try
    Result := mnAnsiSplit(S, strs, Separator, HasBorder);
    LinkStrs(strs);
  finally
    strs.Free;
  end;
end;

function mnTIntList.GetEnumerator: mnTIntListEnumerator;
begin
  Result := mnTIntListEnumerator.Create(Self);
end;

{ mnTFloatListEnumerator }

constructor mnTFloatListEnumerator.Create(AList: mnTFloatList);
begin
  inherited Create;
  Index := -1;
  List := AList;
end;

function mnTFloatListEnumerator.GetCurrent: Extended;
begin
  Result := List[Index];
end;

function mnTFloatListEnumerator.MoveNext: Boolean;
begin
  Result := Index < List.Count - 1;
  if Result then Inc(Index);
end;

{ mnTFloatList }

function mnTFloatList.GetItem(Index: Integer): Extended;
begin
  Result := mnReadFloatPointer(Get(Index));
end;

procedure mnTFloatList.SetItem(Index: Integer; const Value: Extended);
begin
  mnWriteFloatPointer(Get(Index), Value);
end;

function mnTFloatList.GetMin: Extended;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := GetItem(0);
  for i := 1 to Count-1 do
    if Result > GetItem(i) then Result := GetItem(i);
end;

function mnTFloatList.GetMax: Extended;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := GetItem(0);
  for i := 1 to Count-1 do
    if Result < GetItem(i) then Result := GetItem(i);
end;

function mnTFloatList.GetSum: Extended;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := 0;
  for i := 0 to Count-1 do
    Result := Result + GetItem(i);
end;

function mnTFloatList.GetAvg: Extended;
begin
  Result := GetSum / Count;
end;

function mnTFloatList.GetProduct: Extended;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := 1;
  for i := 0 to Count-1 do
    Result := Result * GetItem(i);
end;

constructor mnTFloatList.Create;
begin
  inherited Create;
end;

function mnTFloatList.IndexOf(const Item: Extended): Integer;
begin
  for Result := 0 to Count-1 do
    if GetItem(Result) = Item then Exit;
  Result := -1;
end;

function mnTFloatList.First: Extended;
begin
  Result := mnReadFloatPointer(inherited First);
end;

function mnTFloatList.Last: Extended;
begin
  Result := mnReadFloatPointer(inherited Last);
end;

function mnTFloatList.Add(const Item: Extended): Integer;
begin
  Result := -1;
  if FDuplicates <> dupAccept then
  begin
    if IndexOf(Item) <> -1 then
      if FDuplicates = dupIgnore then Exit
      else if FDuplicates = dupError then mnCreateError(EListError, STryToAddDuplicateItem, [FloatToStr(Item)]);
  end;

  Result := inherited Add(mnNewFloatPointer(Item));
end;

procedure mnTFloatList.Insert(const Index: Integer; const Item: Extended);
begin
  if FDuplicates <> dupAccept then
  begin
    if IndexOf(Item) <> -1 then
      if FDuplicates = dupIgnore then Exit
      else if FDuplicates = dupError then mnCreateError(EListError, STryToAddDuplicateItem, [FloatToStr(Item)]);
  end;

  inherited Insert(Index, mnNewFloatPointer(Item));
end;

function mnTFloatList.Extract(const Index: Integer): Extended;
begin
  if not mnBetweenIE(Index, 0, Count) then
    Error(@SListIndexError, Index);

  Result := GetItem(Index);
  Delete(Index);
end;

function mnTFloatList.Remove(const Item: Extended): Integer;
begin
  Result := IndexOf(Item);
  if Result >= 0 then Delete(Result);
end;

function mnTFloatList.RemoveAll(const Item: Extended): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := Count-1 downto 0 do
    if GetItem(i) = Item then
    begin
      Delete(i);
      Inc(Result);
    end;
end;

function FloatListCompareAsc(Item1, Item2: Pointer): Integer;
begin
  if mnReadFloatPointer(Item1) < mnReadFloatPointer(Item2) then
    Result := -1
  else if mnReadFloatPointer(Item1) > mnReadFloatPointer(Item2) then
    Result := 1
  else
    Result := 0;
end;

function FloatListCompareDesc(Item1, Item2: Pointer): Integer;
begin
  if mnReadFloatPointer(Item1) < mnReadFloatPointer(Item2) then
    Result := 1
  else if mnReadFloatPointer(Item1) > mnReadFloatPointer(Item2) then
    Result := -1
  else
    Result := 0;
end;

procedure mnTFloatList.SortNormal(const OrderStyle: mnTOrderStyle);
begin
  if OrderStyle = osAsc then
    inherited Sort(FloatListCompareAsc)
  else
    inherited Sort(FloatListCompareDesc);
end;

function mnTFloatList.IsUnique: Boolean;
var
  i, j: Integer;
begin
  for i := Count-1 downto 0 do
    for j := 0 to i-1 do
      if GetItem(i) = GetItem(j) then
      begin
        Result := False;
        Exit;
      end;
  Result := True;
end;

procedure mnTFloatList.MakeUnique;
var
  i, j: Integer;
begin
  for i := Count-1 downto 0 do
    for j := 0 to i-1 do
      if GetItem(i) = GetItem(j) then
      begin
        Delete(i);
        Break;
      end;
end;

function mnTFloatList.Equals(AnotherList: mnTFloatList): Boolean;
var
  i: Integer;
begin
  Result := Count = AnotherList.Count;
  if not Result then Exit;

  for i := 0 to Count-1 do
    if GetItem(i) <> AnotherList.GetItem(i) then
    begin
      Result := False;
      Exit;
    end;
end;

procedure mnTFloatList.Compare(AnotherList: mnTFloatList; OutSolo, OutAnotherSolo: mnTFloatList);
var
  i: Integer;
begin
  OutSolo.Capacity := OutSolo.Count + Count;
  OutAnotherSolo.Capacity := OutAnotherSolo.Count + AnotherList.Count;
  for i := 0 to Count-1 do
    if AnotherList.IndexOf(GetItem(i)) = -1 then OutSolo.Add(GetItem(i));
  for i := 0 to AnotherList.Count-1 do
    if IndexOf(AnotherList.GetItem(i)) = -1 then OutAnotherSolo.Add(AnotherList.GetItem(i));
end;

procedure mnTFloatList.Link(AnotherList: mnTFloatList);
var
  AnotherItem: Extended;
begin
  Capacity := Count + AnotherList.Count;
  for AnotherItem in AnotherList do
    Add(AnotherItem);
end;

procedure mnTFloatList.LinkStrs(Strs: TStrings);
var
  str: string;
begin
  for str in Strs do
    if str <> '' then
      Add(StrToFloat(str));
end;

procedure mnTFloatList.Assign(AnotherList: mnTFloatList; AOperator: TListAssignOp = laCopy);
var
  i: Integer;
  AnotherItem: Extended;
  TempList: mnTFloatList;
begin
  case AOperator of
    laCopy:
    begin
      Clear;
      Link(AnotherList);
    end;

    laAnd:
    begin
      for i := Count-1 downto 0 do
        if AnotherList.IndexOf(GetItem(i)) = -1 then
          Delete(i);
    end;

    laOr:
    begin
      Capacity := Count + AnotherList.Count;
      for AnotherItem in AnotherList do
        if IndexOf(AnotherItem) = -1 then
          Add(AnotherItem);
    end;

    laXor:
    begin
      TempList := mnTFloatList.Create;
      try
        TempList.Capacity := Count + AnotherList.Count;
        for i := 0 to Count-1 do
          if AnotherList.IndexOf(GetItem(i)) = -1 then TempList.Add(GetItem(i));
        for i := 0 to AnotherList.Count-1 do
          if IndexOf(AnotherList.GetItem(i)) = -1 then TempList.Add(AnotherList.GetItem(i));
        Assign(TempList);
      finally
        TempList.Free;
      end;
    end;

    laSrcUnique:
    begin
      for i := Count-1 downto 0 do
        if AnotherList.IndexOf(GetItem(i)) <> -1 then Delete(i);
    end;

    laDestUnique:
    begin
      TempList := mnTFloatList.Create;
      try
        TempList.Capacity := AnotherList.Count;
        for AnotherItem in AnotherList do
        if IndexOf(AnotherItem) = -1 then
          TempList.Add(AnotherItem);
        Assign(TempList);
      finally
        TempList.Free;
      end;
    end;
  end;
end;

procedure mnTFloatList.SaveToStreamTurbo(StreamTurbo: mnTStreamTurbo);
var
  i: Integer;
begin
  StreamTurbo.WriteUInt32(Count);
  for i := 0 to Count-1 do
    StreamTurbo.WriteExtended(GetItem(i));
end;

procedure mnTFloatList.LoadFromStreamTurbo(StreamTurbo: mnTStreamTurbo);
var
  i: Integer;
  StoredCount: Integer;
begin
  Clear;
  StoredCount := StreamTurbo.ReadUInt32;
  Capacity := StoredCount;
  for i := 0 to StoredCount-1 do
    Add(StreamTurbo.ReadExtended);
end;

procedure mnTFloatList.SaveToFile(const FileName: string);
var
  strs: TStringList;
  i: Integer;
begin
  strs := TStringList.Create;
  try
    for i := 0 to Count-1 do
      strs.Append(FloatToStr(GetItem(i)));
    strs.SaveToFile(FileName);
  finally
    strs.Free;
  end;
end;

procedure mnTFloatList.LoadFromFile(const FileName: string);
var
  strs: TStringList;
  str: string;
begin
  strs := TStringList.Create;
  try
    strs.LoadFromFile(FileName);
    Clear;
    for str in strs do
      Add(StrToFloat(str));
  finally
    strs.Free;
  end;
end;

procedure mnTFloatList.SaveToArray(var Arr: array of Extended);
var
  i: Integer;
begin
  mnCreateErrorIf(Length(Arr) < Count, SArrayTooShortForList);
  for i := Low(Arr) to High(Arr) do
    Arr[i] := GetItem(i-Low(Arr));
end;

procedure mnTFloatList.LoadFromArray(const Arr: array of Extended);
var
  i: Integer;
begin
  Clear;
  Capacity := Length(Arr);
  for i := Low(Arr) to High(Arr) do
    Add(Arr[i]);
end;

function mnTFloatList.SaveToVA: Variant;
var
  i: Integer;
begin
  Result := VarArrayCreate([1, Count], varVariant);
  try
    VarArrayLock(Result);
    for i := 0 to Count-1 do
      VarArrayPut(Result, GetItem(i), [i+1]);
  finally
    VarArrayUnlock(Result);
  end;
end;

procedure mnTFloatList.LoadFromVA(const VA: Variant);
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim1(VA);
{$ENDIF}
  try
    VarArrayLock(VA);
    Clear;
    Capacity := mnVALength(VA, 1);
    for i := VarArrayLowBound(VA, 1) to VarArrayHighBound(VA, 1) do
      Add(VarArrayGet(VA, [i]));
  finally
    VarArrayUnlock(VA);
  end;
end;

function mnTFloatList.Combine(const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Count-1 do
  begin
    if i <> 0 then Result := Result + Connector;
    Result := Result + FloatToStr(GetItem(i));
  end;
  if HasBorder then Result := Connector + Result + Connector;
end;

function mnTFloatList.Split(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
var
  strs: mnTStrList;
begin
  strs := mnTStrList.Create;
  try
    Result := mnSplit(S, strs, Separator, HasBorder);
    LinkStrs(strs);
  finally
    strs.Free;
  end;
end;

function mnTFloatList.AnsiSplit(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
var
  strs: mnTStrList;
begin
  strs := mnTStrList.Create;
  try
    Result := mnAnsiSplit(S, strs, Separator, HasBorder);
    LinkStrs(strs);
  finally
    strs.Free;
  end;
end;

function mnTFloatList.GetEnumerator: mnTFloatListEnumerator;
begin
  Result := mnTFloatListEnumerator.Create(Self);
end;

{ mnTDTListEnumerator }

constructor mnTDTListEnumerator.Create(AList: mnTDTList);
begin
  inherited Create;
  Index := -1;
  List := AList;
end;

function mnTDTListEnumerator.GetCurrent: TDateTime;
begin
  Result := List[Index];
end;

function mnTDTListEnumerator.MoveNext: Boolean;
begin
  Result := Index < List.Count - 1;
  if Result then Inc(Index);
end;

{ mnTDTList }

function mnTDTList.GetItem(Index: Integer): TDateTime;
begin
  Result := mnReadDTPointer(Get(Index));
end;

procedure mnTDTList.SetItem(Index: Integer; const Value: TDateTime);
begin
  mnWriteDTPointer(Get(Index), Value);
end;

function mnTDTList.GetMin: TDateTime;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := GetItem(0);
  for i := 1 to Count-1 do
    if Result > GetItem(i) then Result := GetItem(i);
end;

function mnTDTList.GetMax: TDateTime;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := GetItem(0);
  for i := 1 to Count-1 do
    if Result < GetItem(i) then Result := GetItem(i);
end;

constructor mnTDTList.Create;
begin
  inherited Create;
end;

function mnTDTList.IndexOf(const Item: TDateTime): Integer;
begin
  for Result := 0 to Count-1 do
    if GetItem(Result) = Item then Exit;
  Result := -1;
end;

function mnTDTList.First: TDateTime;
begin
  Result := mnReadDTPointer(inherited First);
end;

function mnTDTList.Last: TDateTime;
begin
  Result := mnReadDTPointer(inherited Last);
end;

function mnTDTList.Add(const Item: TDateTime): Integer;
begin
  Result := -1;
  if FDuplicates <> dupAccept then
  begin
    if IndexOf(Item) <> -1 then
      if FDuplicates = dupIgnore then Exit
      else if FDuplicates = dupError then mnCreateError(EListError, STryToAddDuplicateItem, [DateTimeToStr(Item)]);
  end;

  Result := inherited Add(mnNewDTPointer(Item));
end;

procedure mnTDTList.Insert(const Index: Integer; const Item: TDateTime);
begin
  if FDuplicates <> dupAccept then
  begin
    if IndexOf(Item) <> -1 then
      if FDuplicates = dupIgnore then Exit
      else if FDuplicates = dupError then mnCreateError(EListError, STryToAddDuplicateItem, [DateTimeToStr(Item)]);
  end;

  inherited Insert(Index, mnNewDTPointer(Item));
end;

function mnTDTList.Extract(const Index: Integer): TDateTime;
begin
  if not mnBetweenIE(Index, 0, Count) then
    Error(@SListIndexError, Index);

  Result := GetItem(Index);
  Delete(Index);
end;

function mnTDTList.Remove(const Item: TDateTime): Integer;
begin
  Result := IndexOf(Item);
  if Result >= 0 then Delete(Result);
end;

function mnTDTList.RemoveAll(const Item: TDateTime): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := Count-1 downto 0 do
    if GetItem(i) = Item then
    begin
      Delete(i);
      Inc(Result);
    end;
end;

function DTListCompareAsc(Item1, Item2: Pointer): Integer;
begin
  if mnReadDTPointer(Item1) < mnReadDTPointer(Item2) then
    Result := -1
  else if mnReadDTPointer(Item1) > mnReadDTPointer(Item2) then
    Result := 1
  else
    Result := 0;
end;

function DTListCompareDesc(Item1, Item2: Pointer): Integer;
begin
  if mnReadDTPointer(Item1) < mnReadDTPointer(Item2) then
    Result := 1
  else if mnReadDTPointer(Item1) > mnReadDTPointer(Item2) then
    Result := -1
  else
    Result := 0;
end;

procedure mnTDTList.SortNormal(const OrderStyle: mnTOrderStyle);
begin
  if OrderStyle = osAsc then
    inherited Sort(DTListCompareAsc)
  else
    inherited Sort(DTListCompareDesc);
end;

function mnTDTList.IsUnique: Boolean;
var
  i, j: Integer;
begin
  for i := Count-1 downto 0 do
    for j := 0 to i-1 do
      if GetItem(i) = GetItem(j) then
      begin
        Result := False;
        Exit;
      end;
  Result := True;
end;

procedure mnTDTList.MakeUnique;
var
  i, j: Integer;
begin
  for i := Count-1 downto 0 do
    for j := 0 to i-1 do
      if GetItem(i) = GetItem(j) then
      begin
        Delete(i);
        Break;
      end;
end;

function mnTDTList.Equals(AnotherList: mnTDTList): Boolean;
var
  i: Integer;
begin
  Result := Count = AnotherList.Count;
  if not Result then Exit;

  for i := 0 to Count-1 do
    if GetItem(i) <> AnotherList.GetItem(i) then
    begin
      Result := False;
      Exit;
    end;
end;

procedure mnTDTList.Compare(AnotherList: mnTDTList; OutSolo, OutAnotherSolo: mnTDTList);
var
  i: Integer;
begin
  OutSolo.Capacity := OutSolo.Count + Count;
  OutAnotherSolo.Capacity := OutAnotherSolo.Count + AnotherList.Count;
  for i := 0 to Count-1 do
    if AnotherList.IndexOf(GetItem(i)) = -1 then OutSolo.Add(GetItem(i));
  for i := 0 to AnotherList.Count-1 do
    if IndexOf(AnotherList.GetItem(i)) = -1 then OutAnotherSolo.Add(AnotherList.GetItem(i));
end;

procedure mnTDTList.Link(AnotherList: mnTDTList);
var
  AnotherItem: TDateTime;
begin
  Capacity := Count + AnotherList.Count;
  for AnotherItem in AnotherList do
    Add(AnotherItem);
end;

procedure mnTDTList.LinkStrs(Strs: TStrings);
var
  str: string;
begin
  for str in Strs do
    if str <> '' then
      Add(StrToDateTime(str));
end;

procedure mnTDTList.Assign(AnotherList: mnTDTList; AOperator: TListAssignOp = laCopy);
var
  i: Integer;
  AnotherItem: TDateTime;
  TempList: mnTDTList;
begin
  case AOperator of
    laCopy:
    begin
      Clear;
      Link(AnotherList);
    end;

    laAnd:
    begin
      for i := Count-1 downto 0 do
        if AnotherList.IndexOf(GetItem(i)) = -1 then
          Delete(i);
    end;

    laOr:
    begin
      Capacity := Count + AnotherList.Count;
      for AnotherItem in AnotherList do
        if IndexOf(AnotherItem) = -1 then
          Add(AnotherItem);
    end;

    laXor:
    begin
      TempList := mnTDTList.Create;
      try
        TempList.Capacity := Count + AnotherList.Count;
        for i := 0 to Count-1 do
          if AnotherList.IndexOf(GetItem(i)) = -1 then TempList.Add(GetItem(i));
        for i := 0 to AnotherList.Count-1 do
          if IndexOf(AnotherList.GetItem(i)) = -1 then TempList.Add(AnotherList.GetItem(i));
        Assign(TempList);
      finally
        TempList.Free;
      end;
    end;

    laSrcUnique:
    begin
      for i := Count-1 downto 0 do
        if AnotherList.IndexOf(GetItem(i)) <> -1 then Delete(i);
    end;

    laDestUnique:
    begin
      TempList := mnTDTList.Create;
      try
        TempList.Capacity := AnotherList.Count;
        for AnotherItem in AnotherList do
        if IndexOf(AnotherItem) = -1 then
          TempList.Add(AnotherItem);
        Assign(TempList);
      finally
        TempList.Free;
      end;
    end;
  end;
end;

procedure mnTDTList.SaveToStreamTurbo(StreamTurbo: mnTStreamTurbo);
var
  i: Integer;
begin
  StreamTurbo.WriteUInt32(Count);
  for i := 0 to Count-1 do
    StreamTurbo.WriteDateTime(GetItem(i));
end;

procedure mnTDTList.LoadFromStreamTurbo(StreamTurbo: mnTStreamTurbo);
var
  i: Integer;
  StoredCount: Integer;
begin
  Clear;
  StoredCount := StreamTurbo.ReadUInt32;
  Capacity := StoredCount;
  for i := 0 to StoredCount-1 do
    Add(StreamTurbo.ReadDateTime);
end;

procedure mnTDTList.SaveToFile(const FileName: string);
var
  strs: TStringList;
  i: Integer;
begin
  strs := TStringList.Create;
  try
    for i := 0 to Count-1 do
      strs.Append(DateTimeToStr(GetItem(i)));
    strs.SaveToFile(FileName);
  finally
    strs.Free;
  end;
end;

procedure mnTDTList.LoadFromFile(const FileName: string);
var
  strs: TStringList;
  str: string;
begin
  strs := TStringList.Create;
  try
    strs.LoadFromFile(FileName);
    Clear;
    for str in strs do
      Add(StrToDateTime(str));
  finally
    strs.Free;
  end;
end;

procedure mnTDTList.SaveToArray(var Arr: array of TDateTime);
var
  i: Integer;
begin
  mnCreateErrorIf(Length(Arr) < Count, SArrayTooShortForList);
  for i := Low(Arr) to High(Arr) do
    Arr[i] := GetItem(i-Low(Arr));
end;

procedure mnTDTList.LoadFromArray(const Arr: array of TDateTime);
var
  i: Integer;
begin
  Clear;
  Capacity := Length(Arr);
  for i := Low(Arr) to High(Arr) do
    Add(Arr[i]);
end;

function mnTDTList.SaveToVA: Variant;
var
  i: Integer;
begin
  Result := VarArrayCreate([1, Count], varVariant);
  try
    VarArrayLock(Result);
    for i := 0 to Count-1 do
      VarArrayPut(Result, GetItem(i), [i+1]);
  finally
    VarArrayUnlock(Result);
  end;
end;

procedure mnTDTList.LoadFromVA(const VA: Variant);
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim1(VA);
{$ENDIF}
  try
    VarArrayLock(VA);
    Clear;
    Capacity := mnVALength(VA, 1);
    for i := VarArrayLowBound(VA, 1) to VarArrayHighBound(VA, 1) do
      Add(VarArrayGet(VA, [i]));
  finally
    VarArrayUnlock(VA);
  end;
end;

function mnTDTList.Combine(const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Count-1 do
  begin
    if i <> 0 then Result := Result + Connector;
    Result := Result + DateTimeToStr(GetItem(i));
  end;
  if HasBorder then Result := Connector + Result + Connector;
end;

function mnTDTList.Split(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
var
  strs: mnTStrList;
begin
  strs := mnTStrList.Create;
  try
    Result := mnSplit(S, strs, Separator, HasBorder);
    LinkStrs(strs);
  finally
    strs.Free;
  end;
end;

function mnTDTList.AnsiSplit(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
var
  strs: mnTStrList;
begin
  strs := mnTStrList.Create;
  try
    Result := mnAnsiSplit(S, strs, Separator, HasBorder);
    LinkStrs(strs);
  finally
    strs.Free;
  end;
end;

function mnTDTList.GetEnumerator: mnTDTListEnumerator;
begin
  Result := mnTDTListEnumerator.Create(Self);
end;

{ mnTCurrListEnumerator }

constructor mnTCurrListEnumerator.Create(AList: mnTCurrList);
begin
  inherited Create;
  Index := -1;
  List := AList;
end;

function mnTCurrListEnumerator.GetCurrent: Currency;
begin
  Result := List[Index];
end;

function mnTCurrListEnumerator.MoveNext: Boolean;
begin
  Result := Index < List.Count - 1;
  if Result then Inc(Index);
end;

{ mnTCurrList }

function mnTCurrList.GetItem(Index: Integer): Currency;
begin
  Result := mnReadCurrPointer(Get(Index));
end;

procedure mnTCurrList.SetItem(Index: Integer; const Value: Currency);
begin
  mnWriteCurrPointer(Get(Index), Value);
end;

function mnTCurrList.GetMin: Currency;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := GetItem(0);
  for i := 1 to Count-1 do
    if Result > GetItem(i) then Result := GetItem(i);
end;

function mnTCurrList.GetMax: Currency;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := GetItem(0);
  for i := 1 to Count-1 do
    if Result < GetItem(i) then Result := GetItem(i);
end;

function mnTCurrList.GetSum: Currency;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := 0;
  for i := 0 to Count-1 do
    Result := Result + GetItem(i);
end;

function mnTCurrList.GetAvg: Currency;
begin
  Result := GetSum / Count;
end;

function mnTCurrList.GetProduct: Currency;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := 1;
  for i := 0 to Count-1 do
    Result := Result * GetItem(i);
end;

constructor mnTCurrList.Create;
begin
  inherited Create;
end;

function mnTCurrList.IndexOf(const Item: Currency): Integer;
begin
  for Result := 0 to Count-1 do
    if GetItem(Result) = Item then Exit;
  Result := -1;
end;

function mnTCurrList.First: Currency;
begin
  Result := mnReadCurrPointer(inherited First);
end;

function mnTCurrList.Last: Currency;
begin
  Result := mnReadCurrPointer(inherited Last);
end;

function mnTCurrList.Add(const Item: Currency): Integer;
begin
  Result := -1;
  if FDuplicates <> dupAccept then
  begin
    if IndexOf(Item) <> -1 then
      if FDuplicates = dupIgnore then Exit
      else if FDuplicates = dupError then mnCreateError(EListError, STryToAddDuplicateItem, [CurrToStr(Item)]);
  end;

  Result := inherited Add(mnNewCurrPointer(Item));
end;

procedure mnTCurrList.Insert(const Index: Integer; const Item: Currency);
begin
  if FDuplicates <> dupAccept then
  begin
    if IndexOf(Item) <> -1 then
      if FDuplicates = dupIgnore then Exit
      else if FDuplicates = dupError then mnCreateError(EListError, STryToAddDuplicateItem, [CurrToStr(Item)]);
  end;

  inherited Insert(Index, mnNewCurrPointer(Item));
end;

function mnTCurrList.Extract(const Index: Integer): Currency;
begin
  if not mnBetweenIE(Index, 0, Count) then
    Error(@SListIndexError, Index);

  Result := GetItem(Index);
  Delete(Index);
end;

function mnTCurrList.Remove(const Item: Currency): Integer;
begin
  Result := IndexOf(Item);
  if Result >= 0 then Delete(Result);
end;

function mnTCurrList.RemoveAll(const Item: Currency): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := Count-1 downto 0 do
    if GetItem(i) = Item then
    begin
      Delete(i);
      Inc(Result);
    end;
end;

function CurrListCompareAsc(Item1, Item2: Pointer): Integer;
begin
  if mnReadCurrPointer(Item1) < mnReadCurrPointer(Item2) then
    Result := -1
  else if mnReadCurrPointer(Item1) > mnReadCurrPointer(Item2) then
    Result := 1
  else
    Result := 0;
end;

function CurrListCompareDesc(Item1, Item2: Pointer): Integer;
begin
  if mnReadCurrPointer(Item1) < mnReadCurrPointer(Item2) then
    Result := 1
  else if mnReadCurrPointer(Item1) > mnReadCurrPointer(Item2) then
    Result := -1
  else
    Result := 0;
end;

procedure mnTCurrList.SortNormal(const OrderStyle: mnTOrderStyle);
begin
  if OrderStyle = osAsc then
    inherited Sort(CurrListCompareAsc)
  else
    inherited Sort(CurrListCompareDesc);
end;

function mnTCurrList.IsUnique: Boolean;
var
  i, j: Integer;
begin
  for i := Count-1 downto 0 do
    for j := 0 to i-1 do
      if GetItem(i) = GetItem(j) then
      begin
        Result := False;
        Exit;
      end;
  Result := True;
end;

procedure mnTCurrList.MakeUnique;
var
  i, j: Integer;
begin
  for i := Count-1 downto 0 do
    for j := 0 to i-1 do
      if GetItem(i) = GetItem(j) then
      begin
        Delete(i);
        Break;
      end;
end;

function mnTCurrList.Equals(AnotherList: mnTCurrList): Boolean;
var
  i: Integer;
begin
  Result := Count = AnotherList.Count;
  if not Result then Exit;

  for i := 0 to Count-1 do
    if GetItem(i) <> AnotherList.GetItem(i) then
    begin
      Result := False;
      Exit;
    end;
end;

procedure mnTCurrList.Compare(AnotherList: mnTCurrList; OutSolo, OutAnotherSolo: mnTCurrList);
var
  i: Integer;
begin
  OutSolo.Capacity := OutSolo.Count + Count;
  OutAnotherSolo.Capacity := OutAnotherSolo.Count + AnotherList.Count;
  for i := 0 to Count-1 do
    if AnotherList.IndexOf(GetItem(i)) = -1 then OutSolo.Add(GetItem(i));
  for i := 0 to AnotherList.Count-1 do
    if IndexOf(AnotherList.GetItem(i)) = -1 then OutAnotherSolo.Add(AnotherList.GetItem(i));
end;

procedure mnTCurrList.Link(AnotherList: mnTCurrList);
var
  AnotherItem: Currency;
begin
  Capacity := Count + AnotherList.Count;
  for AnotherItem in AnotherList do
    Add(AnotherItem);
end;

procedure mnTCurrList.LinkStrs(Strs: TStrings);
var
  str: string;
begin
  for str in Strs do
    if str <> '' then
      Add(StrToCurr(str));
end;

procedure mnTCurrList.Assign(AnotherList: mnTCurrList; AOperator: TListAssignOp = laCopy);
var
  i: Integer;
  AnotherItem: Currency;
  TempList: mnTCurrList;
begin
  case AOperator of
    laCopy:
    begin
      Clear;
      Link(AnotherList);
    end;

    laAnd:
    begin
      for i := Count-1 downto 0 do
        if AnotherList.IndexOf(GetItem(i)) = -1 then
          Delete(i);
    end;

    laOr:
    begin
      Capacity := Count + AnotherList.Count;
      for AnotherItem in AnotherList do
        if IndexOf(AnotherItem) = -1 then
          Add(AnotherItem);
    end;

    laXor:
    begin
      TempList := mnTCurrList.Create;
      try
        TempList.Capacity := Count + AnotherList.Count;
        for i := 0 to Count-1 do
          if AnotherList.IndexOf(GetItem(i)) = -1 then TempList.Add(GetItem(i));
        for i := 0 to AnotherList.Count-1 do
          if IndexOf(AnotherList.GetItem(i)) = -1 then TempList.Add(AnotherList.GetItem(i));
        Assign(TempList);
      finally
        TempList.Free;
      end;
    end;

    laSrcUnique:
    begin
      for i := Count-1 downto 0 do
        if AnotherList.IndexOf(GetItem(i)) <> -1 then Delete(i);
    end;

    laDestUnique:
    begin
      TempList := mnTCurrList.Create;
      try
        TempList.Capacity := AnotherList.Count;
        for AnotherItem in AnotherList do
        if IndexOf(AnotherItem) = -1 then
          TempList.Add(AnotherItem);
        Assign(TempList);
      finally
        TempList.Free;
      end;
    end;
  end;
end;

procedure mnTCurrList.SaveToStreamTurbo(StreamTurbo: mnTStreamTurbo);
var
  i: Integer;
begin
  StreamTurbo.WriteUInt32(Count);
  for i := 0 to Count-1 do
    StreamTurbo.WriteCurrency(GetItem(i));
end;

procedure mnTCurrList.LoadFromStreamTurbo(StreamTurbo: mnTStreamTurbo);
var
  i: Integer;
  StoredCount: Integer;
begin
  Clear;
  StoredCount := StreamTurbo.ReadUInt32;
  Capacity := StoredCount;
  for i := 0 to StoredCount-1 do
    Add(StreamTurbo.ReadCurrency);
end;

procedure mnTCurrList.SaveToFile(const FileName: string);
var
  strs: TStringList;
  i: Integer;
begin
  strs := TStringList.Create;
  try
    for i := 0 to Count-1 do
      strs.Append(CurrToStr(GetItem(i)));
    strs.SaveToFile(FileName);
  finally
    strs.Free;
  end;
end;

procedure mnTCurrList.LoadFromFile(const FileName: string);
var
  strs: TStringList;
  str: string;
begin
  strs := TStringList.Create;
  try
    strs.LoadFromFile(FileName);
    Clear;
    for str in strs do
      Add(StrToCurr(str));
  finally
    strs.Free;
  end;
end;

procedure mnTCurrList.SaveToArray(var Arr: array of Currency);
var
  i: Integer;
begin
  mnCreateErrorIf(Length(Arr) < Count, SArrayTooShortForList);
  for i := Low(Arr) to High(Arr) do
    Arr[i] := GetItem(i-Low(Arr));
end;

procedure mnTCurrList.LoadFromArray(const Arr: array of Currency);
var
  i: Integer;
begin
  Clear;
  Capacity := Length(Arr);
  for i := Low(Arr) to High(Arr) do
    Add(Arr[i]);
end;

function mnTCurrList.SaveToVA: Variant;
var
  i: Integer;
begin
  Result := VarArrayCreate([1, Count], varVariant);
  try
    VarArrayLock(Result);
    for i := 0 to Count-1 do
      VarArrayPut(Result, GetItem(i), [i+1]);
  finally
    VarArrayUnlock(Result);
  end;
end;

procedure mnTCurrList.LoadFromVA(const VA: Variant);
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim1(VA);
{$ENDIF}
  try
    VarArrayLock(VA);
    Clear;
    Capacity := mnVALength(VA, 1);
    for i := VarArrayLowBound(VA, 1) to VarArrayHighBound(VA, 1) do
      Add(VarArrayGet(VA, [i]));
  finally
    VarArrayUnlock(VA);
  end;
end;

function mnTCurrList.Combine(const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Count-1 do
  begin
    if i <> 0 then Result := Result + Connector;
    Result := Result + CurrToStr(GetItem(i));
  end;
  if HasBorder then Result := Connector + Result + Connector;
end;

function mnTCurrList.Split(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
var
  strs: mnTStrList;
begin
  strs := mnTStrList.Create;
  try
    Result := mnSplit(S, strs, Separator, HasBorder);
    LinkStrs(strs);
  finally
    strs.Free;
  end;
end;

function mnTCurrList.AnsiSplit(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
var
  strs: mnTStrList;
begin
  strs := mnTStrList.Create;
  try
    Result := mnAnsiSplit(S, strs, Separator, HasBorder);
    LinkStrs(strs);
  finally
    strs.Free;
  end;
end;

function mnTCurrList.GetEnumerator: mnTCurrListEnumerator;
begin
  Result := mnTCurrListEnumerator.Create(Self);
end;

{ mnTBoolListEnumerator }

constructor mnTBoolListEnumerator.Create(AList: mnTBoolList);
begin
  inherited Create;
  Index := -1;
  List := AList;
end;

function mnTBoolListEnumerator.GetCurrent: Boolean;
begin
  Result := List[Index];
end;

function mnTBoolListEnumerator.MoveNext: Boolean;
begin
  Result := Index < List.Count - 1;
  if Result then Inc(Index);
end;

{ mnTBoolList }

function mnTBoolList.GetItem(Index: Integer): Boolean;
begin
  Result := mnReadBoolPointer(Get(Index));
end;

procedure mnTBoolList.SetItem(Index: Integer; const Value: Boolean);
begin
  mnWriteBoolPointer(Get(Index), Value);
end;

function mnTBoolList.GetMin: Boolean;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := GetItem(0);
  for i := 1 to Count-1 do
    if Result > GetItem(i) then Result := GetItem(i);
end;

function mnTBoolList.GetMax: Boolean;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := GetItem(0);
  for i := 1 to Count-1 do
    if Result < GetItem(i) then Result := GetItem(i);
end;

constructor mnTBoolList.Create;
begin
  inherited Create;
end;

function mnTBoolList.IndexOf(const Item: Boolean): Integer;
begin
  for Result := 0 to Count-1 do
    if GetItem(Result) = Item then Exit;
  Result := -1;
end;

function mnTBoolList.First: Boolean;
begin
  Result := mnReadBoolPointer(inherited First);
end;

function mnTBoolList.Last: Boolean;
begin
  Result := mnReadBoolPointer(inherited Last);
end;

function mnTBoolList.Add(const Item: Boolean): Integer;
begin
  Result := -1;
  if FDuplicates <> dupAccept then
  begin
    if IndexOf(Item) <> -1 then
      if FDuplicates = dupIgnore then Exit
      else if FDuplicates = dupError then mnCreateError(EListError, STryToAddDuplicateItem, [BoolToStr(Item, True)]);
  end;

  Result := inherited Add(mnNewBoolPointer(Item));
end;

procedure mnTBoolList.Insert(const Index: Integer; const Item: Boolean);
begin
  if FDuplicates <> dupAccept then
  begin
    if IndexOf(Item) <> -1 then
      if FDuplicates = dupIgnore then Exit
      else if FDuplicates = dupError then mnCreateError(EListError, STryToAddDuplicateItem, [BoolToStr(Item, True)]);
  end;

  inherited Insert(Index, mnNewBoolPointer(Item));
end;

function mnTBoolList.Extract(const Index: Integer): Boolean;
begin
  if not mnBetweenIE(Index, 0, Count) then
    Error(@SListIndexError, Index);

  Result := GetItem(Index);
  Delete(Index);
end;

function mnTBoolList.Remove(const Item: Boolean): Integer;
begin
  Result := IndexOf(Item);
  if Result >= 0 then Delete(Result);
end;

function mnTBoolList.RemoveAll(const Item: Boolean): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := Count-1 downto 0 do
    if GetItem(i) = Item then
    begin
      Delete(i);
      Inc(Result);
    end;
end;

function BoolListCompareAsc(Item1, Item2: Pointer): Integer;
begin
  if mnReadBoolPointer(Item1) < mnReadBoolPointer(Item2) then
    Result := -1
  else if mnReadBoolPointer(Item1) > mnReadBoolPointer(Item2) then
    Result := 1
  else
    Result := 0;
end;

function BoolListCompareDesc(Item1, Item2: Pointer): Integer;
begin
  if mnReadBoolPointer(Item1) < mnReadBoolPointer(Item2) then
    Result := 1
  else if mnReadBoolPointer(Item1) > mnReadBoolPointer(Item2) then
    Result := -1
  else
    Result := 0;
end;

procedure mnTBoolList.SortNormal(const OrderStyle: mnTOrderStyle);
begin
  if OrderStyle = osAsc then
    inherited Sort(BoolListCompareAsc)
  else
    inherited Sort(BoolListCompareDesc);
end;

function mnTBoolList.IsUnique: Boolean;
var
  i, j: Integer;
begin
  for i := Count-1 downto 0 do
    for j := 0 to i-1 do
      if GetItem(i) = GetItem(j) then
      begin
        Result := False;
        Exit;
      end;
  Result := True;
end;

procedure mnTBoolList.MakeUnique;
var
  i, j: Integer;
begin
  for i := Count-1 downto 0 do
    for j := 0 to i-1 do
      if GetItem(i) = GetItem(j) then
      begin
        Delete(i);
        Break;
      end;
end;

function mnTBoolList.Equals(AnotherList: mnTBoolList): Boolean;
var
  i: Integer;
begin
  Result := Count = AnotherList.Count;
  if not Result then Exit;

  for i := 0 to Count-1 do
    if GetItem(i) <> AnotherList.GetItem(i) then
    begin
      Result := False;
      Exit;
    end;
end;

procedure mnTBoolList.Compare(AnotherList: mnTBoolList; OutSolo, OutAnotherSolo: mnTBoolList);
var
  i: Integer;
begin
  OutSolo.Capacity := OutSolo.Count + Count;
  OutAnotherSolo.Capacity := OutAnotherSolo.Count + AnotherList.Count;
  for i := 0 to Count-1 do
    if AnotherList.IndexOf(GetItem(i)) = -1 then OutSolo.Add(GetItem(i));
  for i := 0 to AnotherList.Count-1 do
    if IndexOf(AnotherList.GetItem(i)) = -1 then OutAnotherSolo.Add(AnotherList.GetItem(i));
end;

procedure mnTBoolList.Link(AnotherList: mnTBoolList);
var
  AnotherItem: Boolean;
begin
  Capacity := Count + AnotherList.Count;
  for AnotherItem in AnotherList do
    Add(AnotherItem);
end;

procedure mnTBoolList.LinkStrs(Strs: TStrings);
var
  str: string;
begin
  for str in Strs do
    if str <> '' then
      Add(StrToBool(str));
end;

procedure mnTBoolList.Assign(AnotherList: mnTBoolList; AOperator: TListAssignOp = laCopy);
var
  i: Integer;
  AnotherItem: Boolean;
  TempList: mnTBoolList;
begin
  case AOperator of
    laCopy:
    begin
      Clear;
      Link(AnotherList);
    end;

    laAnd:
    begin
      for i := Count-1 downto 0 do
        if AnotherList.IndexOf(GetItem(i)) = -1 then
          Delete(i);
    end;

    laOr:
    begin
      Capacity := Count + AnotherList.Count;
      for AnotherItem in AnotherList do
        if IndexOf(AnotherItem) = -1 then
          Add(AnotherItem);
    end;

    laXor:
    begin
      TempList := mnTBoolList.Create;
      try
        TempList.Capacity := Count + AnotherList.Count;
        for i := 0 to Count-1 do
          if AnotherList.IndexOf(GetItem(i)) = -1 then TempList.Add(GetItem(i));
        for i := 0 to AnotherList.Count-1 do
          if IndexOf(AnotherList.GetItem(i)) = -1 then TempList.Add(AnotherList.GetItem(i));
        Assign(TempList);
      finally
        TempList.Free;
      end;
    end;

    laSrcUnique:
    begin
      for i := Count-1 downto 0 do
        if AnotherList.IndexOf(GetItem(i)) <> -1 then Delete(i);
    end;

    laDestUnique:
    begin
      TempList := mnTBoolList.Create;
      try
        TempList.Capacity := AnotherList.Count;
        for AnotherItem in AnotherList do
        if IndexOf(AnotherItem) = -1 then
          TempList.Add(AnotherItem);
        Assign(TempList);
      finally
        TempList.Free;
      end;
    end;
  end;
end;

procedure mnTBoolList.SaveToStreamTurbo(StreamTurbo: mnTStreamTurbo);
var
  i: Integer;
begin
  StreamTurbo.WriteUInt32(Count);
  for i := 0 to Count-1 do
    StreamTurbo.WriteBoolean(GetItem(i));
end;

procedure mnTBoolList.LoadFromStreamTurbo(StreamTurbo: mnTStreamTurbo);
var
  i: Integer;
  StoredCount: Integer;
begin
  Clear;
  StoredCount := StreamTurbo.ReadUInt32;
  Capacity := StoredCount;
  for i := 0 to StoredCount-1 do
    Add(StreamTurbo.ReadBoolean);
end;

procedure mnTBoolList.SaveToFile(const FileName: string);
var
  strs: TStringList;
  i: Integer;
begin
  strs := TStringList.Create;
  try
    for i := 0 to Count-1 do
      strs.Append(BoolToStr(GetItem(i), True));
    strs.SaveToFile(FileName);
  finally
    strs.Free;
  end;
end;

procedure mnTBoolList.LoadFromFile(const FileName: string);
var
  strs: TStringList;
  str: string;
begin
  strs := TStringList.Create;
  try
    strs.LoadFromFile(FileName);
    Clear;
    for str in strs do
      Add(StrToBool(str));
  finally
    strs.Free;
  end;
end;

procedure mnTBoolList.SaveToArray(var Arr: array of Boolean);
var
  i: Integer;
begin
  mnCreateErrorIf(Length(Arr) < Count, SArrayTooShortForList);
  for i := Low(Arr) to High(Arr) do
    Arr[i] := GetItem(i-Low(Arr));
end;

procedure mnTBoolList.LoadFromArray(const Arr: array of Boolean);
var
  i: Integer;
begin
  Clear;
  Capacity := Length(Arr);
  for i := Low(Arr) to High(Arr) do
    Add(Arr[i]);
end;

function mnTBoolList.SaveToVA: Variant;
var
  i: Integer;
begin
  Result := VarArrayCreate([1, Count], varVariant);
  try
    VarArrayLock(Result);
    for i := 0 to Count-1 do
      VarArrayPut(Result, GetItem(i), [i+1]);
  finally
    VarArrayUnlock(Result);
  end;
end;

procedure mnTBoolList.LoadFromVA(const VA: Variant);
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim1(VA);
{$ENDIF}
  try
    VarArrayLock(VA);
    Clear;
    Capacity := mnVALength(VA, 1);
    for i := VarArrayLowBound(VA, 1) to VarArrayHighBound(VA, 1) do
      Add(VarArrayGet(VA, [i]));
  finally
    VarArrayUnlock(VA);
  end;
end;

function mnTBoolList.Combine(const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Count-1 do
  begin
    if i <> 0 then Result := Result + Connector;
    Result := Result + BoolToStr(GetItem(i), True);
  end;
  if HasBorder then Result := Connector + Result + Connector;
end;

function mnTBoolList.Split(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
var
  strs: mnTStrList;
begin
  strs := mnTStrList.Create;
  try
    Result := mnSplit(S, strs, Separator, HasBorder);
    LinkStrs(strs);
  finally
    strs.Free;
  end;
end;

function mnTBoolList.AnsiSplit(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
var
  strs: mnTStrList;
begin
  strs := mnTStrList.Create;
  try
    Result := mnAnsiSplit(S, strs, Separator, HasBorder);
    LinkStrs(strs);
  finally
    strs.Free;
  end;
end;

function mnTBoolList.GetEnumerator: mnTBoolListEnumerator;
begin
  Result := mnTBoolListEnumerator.Create(Self);
end;

function mnTBoolList.SaveByBit(const BitCount: Integer = 32): UInt32;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to BitCount-1 do
    if GetItem(i) then Result := mnSetBit1InBinary(Result, i);
end;

procedure mnTBoolList.LoadByBit(const Value: UInt32; const BitCount: Integer = 32);
var
  i: Integer;
begin
  for i := 0 to BitCount-1 do
    Add(mnBitIs1InBinary(Value, i));
end;

{ mnTStrList }

function mnTStrList.GetMin: string;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := Get(0);
  for i := 1 to Count-1 do
    if Result > Get(i) then Result := Get(i);
end;

function mnTStrList.GetMax: string;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := Get(0);
  for i := 1 to Count-1 do
    if Result < Get(i) then Result := Get(i);
end;

function mnTStrList.GetMinLength: Integer;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := Length(Get(0));
  for i := 1 to Count-1 do
    if Result > Length(Get(i)) then Result := Length(Get(i));
end;

function mnTStrList.GetMaxLength: Integer;
var
  i: Integer;
begin
  mnCreateErrorIf(Count = 0, SMakeStatOnEmptyList);
  Result := Length(Get(0));
  for i := 1 to Count-1 do
    if Result < Length(Get(i)) then Result := Length(Get(i));
end;

procedure mnTStrList.AppendF(const S: string);
begin
  Append(S);
end;

procedure mnTStrList.AppendF(const S: string; const Args: array of const);
begin
  Append(Format(S, Args));
end;

function mnTStrList.First: string;
begin
  Result := Get(0);
end;

function mnTStrList.Last: string;
begin
  Result := Get(Count-1);
end;

function mnTStrList.Extract(const Index: Integer): string;
begin
  if not mnBetweenIE(Index, 0, Count) then
    Error(@SListIndexError, Index);

  Result := Get(Index);
  Delete(Index);
end;

function mnTStrList.Remove(const Item: string): Integer;
begin
  Result := IndexOf(Item);
  if Result >= 0 then Delete(Result);
end;

function mnTStrList.RemoveAll(const Item: string): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := Count-1 downto 0 do
    if Get(i) = Item then
    begin
      Delete(i);
      Inc(Result);
    end;
end;

procedure mnTStrList.Concat(const Index: Integer; const S: string);
begin
  if not mnBetweenIE(Index, 0, Count) then
    Error(@SListIndexError, Index);

  Put(Index, Get(Index) + S);
end;

procedure mnTStrList.ConcatToLast(const S: string);
begin
  if Count = 0 then
    Add(S)
  else
    Put(Count-1, Get(Count-1) + S);
end;

function mnTStrList.CountItem(const Item: string): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to Count-1 do
    if Get(i) = Item then
      Inc(Result);
end;

function StrListCompareAsc(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := AnsiCompareStr(List[Index1], List[Index2]);
end;

function StrListCompareDesc(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := - AnsiCompareStr(List[Index1], List[Index2]);
end;

function StrListCompareNameAsc(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := AnsiCompareStr(List.Names[Index1], List.Names[Index2]);
end;

function StrListCompareNameDesc(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := - AnsiCompareStr(List.Names[Index1], List.Names[Index2]);
end;

procedure mnTStrList.SortNormal(const OrderStyle: mnTOrderStyle; const NamePartOnly: Boolean = False);
begin
  if NamePartOnly then
  begin
    if OrderStyle = osAsc then
      CustomSort(StrListCompareNameAsc)
    else
      CustomSort(StrListCompareNameDesc);
  end
  else
  begin
    if OrderStyle = osAsc then
      CustomSort(StrListCompareAsc)
    else
      CustomSort(StrListCompareDesc);
  end;
end;

function StrListCompareInNumberStyleAsc(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := mnCompareStrInNumberStyle(List[Index1], List[Index2]);
end;

function StrListCompareInNumberStyleDesc(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := - mnCompareStrInNumberStyle(List[Index1], List[Index2]);
end;

function StrListCompareNameInNumberStyleAsc(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := mnCompareStrInNumberStyle(List.Names[Index1], List.Names[Index2]);
end;

function StrListCompareNameInNumberStyleDesc(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := - mnCompareStrInNumberStyle(List.Names[Index1], List.Names[Index2]);
end;

procedure mnTStrList.SortInNumberStyle(const OrderStyle: mnTOrderStyle; const NamePartOnly: Boolean = False);
begin
  if NamePartOnly then
  begin
    if OrderStyle = osAsc then
      CustomSort(StrListCompareNameInNumberStyleAsc)
    else
      CustomSort(StrListCompareNameInNumberStyleDesc);
  end
  else
  begin
    if OrderStyle = osAsc then
      CustomSort(StrListCompareInNumberStyleAsc)
    else
      CustomSort(StrListCompareInNumberStyleDesc);
  end;
end;

function mnTStrList.IsUnique(const NamePartOnly: Boolean = False): Boolean;
var
  i, j: Integer;
begin
  for i := Count-1 downto 0 do
    for j := 0 to i-1 do
      if mnChooseBool(NamePartOnly, Names[i] = Names[j], Get(i) = Get(j)) then
      begin
        Result := False;
        Exit;
      end;
  Result := True;
end;

procedure mnTStrList.MakeUnique(const NamePartOnly: Boolean = False);
var
  i, j: Integer;
begin
  for i := Count-1 downto 0 do
    for j := 0 to i-1 do
      if mnChooseBool(NamePartOnly, Names[i] = Names[j], Get(i) = Get(j)) then
      begin
        Delete(i);
        Break;
      end;
end;

procedure mnTStrList.Compare(AnotherList: TStrings; OutSolo, OutAnotherSolo: TStrings);
var
  i: Integer;
begin
  OutSolo.Capacity := OutSolo.Count + Count;
  OutAnotherSolo.Capacity := OutAnotherSolo.Count + AnotherList.Count;
  for i := 0 to Count-1 do
    if AnotherList.IndexOf(Get(i)) = -1 then OutSolo.AddObject(Get(i), Objects[i]);
  for i := 0 to AnotherList.Count-1 do
    if IndexOf(AnotherList[i]) = -1 then OutAnotherSolo.AddObject(AnotherList[i], AnotherList.Objects[i]);
end;

procedure mnTStrList.AssignByOp(AnotherList: TStrings; AOperator: TListAssignOp = laCopy);
var
  i: Integer;
  TempList: TStrings;
begin
  case AOperator of
    laCopy:
    begin
      Assign(AnotherList);
    end;

    laAnd:
    begin
      for i := Count-1 downto 0 do
        if AnotherList.IndexOf(Get(i)) = -1 then
          Delete(i);
    end;

    laOr:
    begin
      Capacity := Count + AnotherList.Count;
      for i := 0 to AnotherList.Count-1 do
        if IndexOf(AnotherList[i]) = -1 then
          AddObject(AnotherList[i], AnotherList.Objects[i]);
    end;

    laXor:
    begin
      TempList := TStringList.Create;
      try
        TempList.Capacity := Count + AnotherList.Count;
        for i := 0 to Count-1 do
          if AnotherList.IndexOf(Get(i)) = -1 then TempList.AddObject(Get(i), Objects[i]);
        for i := 0 to AnotherList.Count-1 do
          if IndexOf(AnotherList[i]) = -1 then TempList.AddObject(AnotherList[i], AnotherList.Objects[i]);
        Assign(TempList);
      finally
        TempList.Free;
      end;
    end;

    laSrcUnique:
    begin
      for i := Count-1 downto 0 do
        if AnotherList.IndexOf(Get(i)) <> -1 then Delete(i);
    end;

    laDestUnique:
    begin
      TempList := TStringList.Create;
      try
        TempList.Capacity := AnotherList.Count;
        for i := 0 to AnotherList.Count-1 do
          if IndexOf(AnotherList[i]) = -1 then TempList.AddObject(AnotherList[i], AnotherList.Objects[i]);
        Assign(TempList);
      finally
        TempList.Free;
      end;
    end;
  end;
end;

procedure mnTStrList.SaveToUTF8File(const FileName: string; const HasBOM: Boolean = True);
var
  Stream: TStream;
  UTF8Text: UTF8String;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    if HasBOM then
      Stream.WriteBuffer(mnUTF8BOM[1], Length(mnUTF8BOM));
    UTF8Text := UTF8Encode(GetTextStr);
    Stream.WriteBuffer(Pointer(UTF8Text)^, Length(UTF8Text));
  finally
    Stream.Free;
  end;
end;

procedure mnTStrList.LoadFromUTF8File(const FileName: string; const HasBOM: Boolean = True);
var
  Stream: TStream;
  UTF8Text: UTF8String;
  BOM: string;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    if HasBOM then
    begin
      SetLength(BOM, Length(mnUTF8BOM));
      Stream.Read(BOM[1], Length(BOM));
      mnCreateErrorIf(BOM <> mnUTF8BOM, SWrongBOM);
    end;
    SetLength(UTF8Text, Stream.Size-Stream.Position);
    Stream.Read(Pointer(UTF8Text)^, Length(UTF8Text));
    SetTextStr(UTF8Decode(UTF8Text));
  finally
    Stream.Free;
  end;
end;

procedure mnTStrList.SaveToStreamTurbo(StreamTurbo: mnTStreamTurbo);
var
  i: Integer;
begin
  StreamTurbo.WriteUInt32(Count);
  for i := 0 to Count-1 do
    StreamTurbo.WriteString(Get(i));
end;

procedure mnTStrList.SaveToStreamBin(Stream: TStream);
var
  StreamTurbo: mnTStreamTurbo;
begin
  StreamTurbo := mnTStreamTurbo.Create(Stream);
  try
    SaveToStreamTurbo(StreamTurbo);
  finally
    StreamTurbo.Free;
  end;
end;

procedure mnTStrList.SaveToStreamFile(const FileName: string);
var
  Stream: TStream;
  StreamTurbo: mnTStreamTurbo;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  StreamTurbo := mnTStreamTurbo.Create(Stream);
  try
    SaveToStreamTurbo(StreamTurbo);
  finally
    StreamTurbo.Free;
    Stream.Free;
  end;
end;

procedure mnTStrList.LoadFromStreamTurbo(StreamTurbo: mnTStreamTurbo);
var
  i: Integer;
  StoredCount: Integer;
begin
  Clear;
  StoredCount := StreamTurbo.ReadUInt32;
  Capacity := StoredCount;
  for i := 0 to StoredCount-1 do
    Add(StreamTurbo.ReadString);
end;

procedure mnTStrList.LoadFromStreamBin(Stream: TStream);
var
  StreamTurbo: mnTStreamTurbo;
begin
  StreamTurbo := mnTStreamTurbo.Create(Stream);
  try
    LoadFromStreamTurbo(StreamTurbo);
  finally
    StreamTurbo.Free;
  end;
end;

procedure mnTStrList.LoadFromStreamFile(const FileName: string);
var
  Stream: TStream;
  StreamTurbo: mnTStreamTurbo;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  StreamTurbo := mnTStreamTurbo.Create(Stream);
  try
    LoadFromStreamTurbo(StreamTurbo);
  finally
    StreamTurbo.Free;
    Stream.Free;
  end;
end;

procedure mnTStrList.SaveToArray(var Arr: array of string);
var
  i: Integer;
begin
  mnCreateErrorIf(Length(Arr) < Count, SArrayTooShortForList);
  for i := Low(Arr) to High(Arr) do
    Arr[i] := Get(i-Low(Arr));
end;

procedure mnTStrList.LoadFromArray(const Arr: array of string);
var
  i: Integer;
begin
  Clear;
  Capacity := Length(Arr);
  for i := Low(Arr) to High(Arr) do
    Add(Arr[i]);
end;

function mnTStrList.SaveToVA: Variant;
var
  i: Integer;
begin
  Result := VarArrayCreate([1, Count], varVariant);
  try
    VarArrayLock(Result);
    for i := 0 to Count-1 do
      VarArrayPut(Result, Get(i), [i+1]);
  finally
    VarArrayUnlock(Result);
  end;
end;

procedure mnTStrList.LoadFromVA(const VA: Variant);
var
  i: Integer;
begin
{$IFDEF MN_DEBUG}
  mnCheckVADim1(VA);
{$ENDIF}
  try
    VarArrayLock(VA);
    Clear;
    Capacity := mnVALength(VA, 1);
    for i := VarArrayLowBound(VA, 1) to VarArrayHighBound(VA, 1) do
      Add(VarArrayGet(VA, [i]));
  finally
    VarArrayUnlock(VA);
  end;
end;

procedure mnTStrList.AppendToFile(const FileName: string);
var
  Stream: TStream;
begin
  if FileExists(FileName) then
    Stream := TFileStream.Create(FileName, fmOpenReadWrite)
  else
    Stream := TFileStream.Create(FileName, fmCreate);
  try
    Stream.Seek(0, soEnd);
    SaveToStream(Stream);
  finally
    Stream.Free;
  end;
end;

function mnTStrList.Combine(const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Count-1 do
  begin
    if i <> 0 then Result := Result + Connector;
    Result := Result + Get(i);
  end;
  if HasBorder then Result := Connector + Result + Connector;
end;

function mnTStrList.CombinePart(const PartIndexs: array of Integer; const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string;
var
  Index: Integer;
begin
  Result := '';
  for Index in PartIndexs do
  begin
    if Result <> '' then Result := Result + Connector;
    Result := Result + Get(Index);
  end;
  if HasBorder then Result := Connector + Result + Connector;
end;

function mnTStrList.Split(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
begin
  Result := mnSplit(S, Self, Separator, HasBorder);
end;

function mnTStrList.AnsiSplit(const S: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
begin
  Result := mnAnsiSplit(S, Self, Separator, HasBorder);
end;

{ mnTObjList }

procedure mnTObjList.Engrave;
begin
  EngravedCount := Count;
end;

procedure mnTObjList.Drop;
var
  i: Integer;
begin
  for i := Count-1 downto EngravedCount do
    Delete(i);
end;

function mnCombineFieldNames(const FieldNames: array of string): mnTFieldNames; overload;
begin
  Result := mnCombine(FieldNames, ';');
end;

function mnCombineFieldNames(FieldNames: TStrings): mnTFieldNames; overload;
begin
  Result := mnCombine(FieldNames, ';');
end;

function mnSplitFieldNames(const FieldNames: mnTFieldNames; OutSplitedFieldNames: TStrings): Integer;
begin
  Result := mnSplit(FieldNames, OutSplitedFieldNames, ';');
end;

function mnCountFieldNames(const FieldNames: mnTFieldNames): Integer;
begin
  if FieldNames = '' then
    Result := 0
  else
    Result := mnCountDelimiter(';', FieldNames) + 1;
end;

function mnTimeUnitToStr(const TimeUnit: mnTTimeUnit): string;
begin
  case TimeUnit of
    tuYear:   Result := 'Year';
    tuMonth:  Result := 'Month';
    tuDay:    Result := 'Day';
    tuHour:   Result := 'Hour';
    tuMinute: Result := 'Minute';
    tuSecond: Result := 'Second';
  else
    mnCreateError(SIllegalTimeUnit);
  end;
end;

function mnRectWidth(const Rect: TRect): Integer; inline;
begin
  Result := Rect.Right - Rect.Left;
end;

function mnRectHeight(const Rect: TRect): Integer; inline;
begin
  Result := Rect.Bottom - Rect.Top;
end;

function mnEqualRectSize(const RectA, RectB: TRect): Boolean; inline;
begin
  Result := (mnRectWidth(RectA) = mnRectWidth(RectB)) and (mnRectHeight(RectA) = mnRectHeight(RectB));
end;

function mnMoveRect(const Rect: TRect; const Left: Integer = 0; const Top: Integer = 0): TRect;
begin
  Result := Bounds(Left, Top, mnRectWidth(Rect), mnRectHeight(Rect));
end;

function mnAdjustX(const X, Width: Integer; const HAlign: TAlignment = taLeftJustify): Integer;
begin
  case HAlign of
    taLeftJustify:  Result := X;
    taCenter:       Result := X - Width div 2;
    taRightJustify: Result := X - Width + 1;
  else
    Result := X;
  end;
end;

function mnAdjustY(const Y, Height: Integer; const VAlign: TVerticalAlignment = taAlignTop): Integer;
begin
  case VAlign of
    taAlignTop:       Result := Y;
    taVerticalCenter: Result := Y - Height div 2;
    taAlignBottom:    Result := Y - Height + 1;
  else
    Result := Y;
  end;
end;

function mnAdjustPoint(const APoint: TPoint; const Width, Height: Integer;
  const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop): TPoint;
begin
  Result.X := mnAdjustX(APoint.X, Width, HAlign);
  Result.Y := mnAdjustY(APoint.Y, Height, VAlign);
end;

function mnAdjustRect(const ARect: TRect;
  const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop): TRect;
begin
  Result.Left := mnAdjustX(ARect.Left, ARect.Right - ARect.Left, HAlign);
  Result.Top := mnAdjustY(ARect.Top, ARect.Bottom - ARect.Top, VAlign);
  Result.Right := Result.Left + ARect.Right - ARect.Left;
  Result.Bottom := Result.Top + ARect.Bottom - ARect.Top;
end;

{ mnTCoordinatesTable }

constructor mnTCoordinatesTable.Create;
begin
  FColumnWidths := mnTIntList.Create;
  FRowHeights := mnTIntList.Create;
  FHAlign := taCenter;
  FVAlign := taVerticalCenter;
end;

constructor mnTCoordinatesTable.Create(const ALeft, ATop: Integer);
begin
  Create;
  FLeft := ALeft;
  FTop := ATop;
end;

destructor mnTCoordinatesTable.Destroy;
begin
  FColumnWidths.Free;
  FRowHeights.Free;
  inherited;
end;

function mnTCoordinatesTable.AddColumns(const Width: Integer; const Count: Integer = 1): Integer;
var
  i: Integer;
begin
  Result := FColumnCount;
  for i := 1 to Count do
    FColumnWidths.Add(Width);
  FColumnCount := FColumnCount + Count;
end;

function mnTCoordinatesTable.AddRows(const Height: Integer; const Count: Integer = 1): Integer;
var
  i: Integer;
begin
  Result := FRowCount;
  for i := 1 to Count do
    FRowHeights.Add(Height);
  FRowCount := FRowCount + Count;
end;

procedure mnTCoordinatesTable.InsertColumns(const Index: Integer; const Width: Integer; const Count: Integer = 1);
var
  i: Integer;
begin
  mnCreateErrorIf(not mnBetweenII(Index, 0, FColumnCount), SCoordinatesTableColumnIndexError, [Index, FColumnCount]);
  for i := 1 to Count do
    FColumnWidths.Insert(Index, Width);
  FColumnCount := FColumnCount + Count;
end;

procedure mnTCoordinatesTable.InsertRows(const Index: Integer; const Height: Integer; const Count: Integer = 1);
var
  i: Integer;
begin
  mnCreateErrorIf(not mnBetweenII(Index, 0, FRowCount), SCoordinatesTableRowIndexError, [Index, FRowCount]);
  for i := 1 to Count do
    FRowHeights.Insert(Index, Height);
  FRowCount := FRowCount + Count;
end;

procedure mnTCoordinatesTable.DeleteColumns(const Index: Integer; Count: Integer = 1);
var
  i: Integer;
begin
  mnCreateErrorIf(not mnBetweenIE(Index, 0, FColumnCount), SCoordinatesTableColumnIndexError, [Index, FColumnCount]);
  if Count > FColumnCount - Index then
    Count := FColumnCount - Index;

  for i := 1 to Count do
    FColumnWidths.Delete(Index);
  FColumnCount := FColumnCount - Count;
end;

procedure mnTCoordinatesTable.DeleteRows(const Index: Integer; Count: Integer = 1);
var
  i: Integer;
begin
  mnCreateErrorIf(not mnBetweenIE(Index, 0, FRowCount), SCoordinatesTableRowIndexError, [Index, FRowCount]);
  if Count > FRowCount - Index then
    Count := FRowCount - Index;

  for i := 1 to Count do
    FRowHeights.Delete(Index);
  FRowCount := FRowCount - Count;
end;

function mnTCoordinatesTable.GetX(const ColumnIndex: Integer): Integer;
begin
  Result := GetX(ColumnIndex, FHAlign);
end;

function mnTCoordinatesTable.GetX(const ColumnIndex: Integer; const AHAlign: TAlignment): Integer;
var
  i: Integer;
begin
  mnCreateErrorIf(not mnBetweenIE(ColumnIndex, 0, FColumnCount), SCoordinatesTableColumnIndexError, [ColumnIndex, FColumnCount]);

  Result := FLeft;
  for i := 0 to ColumnIndex-1 do
    Result := Result + ColumnWidths[i];
  case AHAlign of
    taCenter:       Result := Result + ColumnWidths[ColumnIndex] div 2;
    taRightJustify: Result := Result + ColumnWidths[ColumnIndex] - 1;
  end;
end;

function mnTCoordinatesTable.GetY(const RowIndex: Integer): Integer;
begin
  Result := GetY(RowIndex, FVAlign);
end;

function mnTCoordinatesTable.GetY(const RowIndex: Integer; const AVAlign: TVerticalAlignment): Integer;
var
  i: Integer;
begin
  mnCreateErrorIf(not mnBetweenIE(RowIndex, 0, FRowCount), SCoordinatesTableRowIndexError, [RowIndex, FRowCount]);

  Result := FTop;
  for i := 0 to RowIndex-1 do
    Result := Result + RowHeights[i];
  case AVAlign of
    taVerticalCenter: Result := Result + RowHeights[RowIndex] div 2;
    taAlignBottom:    Result := Result + RowHeights[RowIndex] - 1;
  end;
end;

{ mnTLog }

constructor mnTLog.Create;
begin
  FContent := mnTStrList.Create;
  FMaxStrsLines := 0;
  FMaxMemoLines := 0;

  BindedStrs := nil;
  BindedFileName := '';
  BindedMemo := nil;
end;

destructor mnTLog.Destroy;
begin
  FContent.Free;
  inherited;
end;

procedure mnTLog.Append(const Text: string);
begin
  FContent.Append(Text);
end;

procedure mnTLog.Append(const Text: string; const Args: array of const);
begin
  FContent.Append(Format(Text, Args));
end;

procedure mnTLog.AssignToStrs(const Strs: TStrings; const MaxLines: Integer = 0);
var
  i: Integer;
  Index: Integer;
begin
  if MaxLines = 0 then
    Strs.Assign(FContent)
  else
  begin
    Strs.Clear;
    for i := 0 to MaxLines-1 do
    begin
      Index := FContent.Count - MaxLines + i;
      if mnBetweenII(Index, 0, FContent.Count-1) then
        Strs.Append(FContent[Index]);
    end;
  end;
end;

procedure mnTLog.SaveToFile(const FileName: string);
begin
  FContent.SaveToFile(FileName);
end;

procedure mnTLog.BindToStrs(const Strs: TStrings);
begin
  BindedStrs := Strs;
end;

procedure mnTLog.BindToFile(const FileName: string);
begin
  BindedFileName := FileName;
end;

procedure mnTLog.BindToMemo(const Memo: TcxMemo);
begin
  BindedMemo := Memo;
end;

procedure mnTLog.Sync;
begin
  if Assigned(BindedStrs) then AssignToStrs(BindedStrs, FMaxStrsLines);
  if BindedFileName <> '' then SaveToFile(BindedFileName);
  if Assigned(BindedMemo) then
  begin
    mnPauseRedraw(BindedMemo.Handle);
    AssignToStrs(BindedMemo.Lines, FMaxMemoLines);
    mnResumeRedraw(BindedMemo.Handle);
    BindedMemo.SetSelection(Length(BindedMemo.Text), 0);
    mnScrollToEnd(BindedMemo);
    Application.ProcessMessages;
  end;
end;

{ mnTExternalCommandFile }

constructor mnTExternalCommandFile.Create(ACommandFileName: string; const InDefaultPath: Boolean = True);
begin
  if InDefaultPath then
    ACommandFileName := mnAppPathSub('ExternalCommandFiles\' + ACommandFileName);
  mnValidateFileExists(ACommandFileName);
  FCommandFileName := ACommandFileName;

  FUseJavaToRunJar := False;
end;

function mnTExternalCommandFile.NewExecution(const CommandName: string; const ArgsStr: string = ''): mnTExternalCommandExecution;
begin
  Result := mnTExternalCommandExecution.Create(Self, CommandName, ArgsStr);
end;

{ mnTExternalCommandExecution }

constructor mnTExternalCommandExecution.Create(const ACommandFile: mnTExternalCommandFile; const ACommandName: string; const AnArgsStr: string);
begin
  FCommandFile := ACommandFile;
  FCommandName := ACommandName;
  FArgsStr := AnArgsStr;

  FAnnouncementDir := mnAppPathSub('ExternalCommandFiles\' + mnNewGUID);
  FAnnouncementFileName := FAnnouncementDir + '\ok';
  FCompletedArgs := FCommandName + ' ' + FAnnouncementDir + mnAppendLeftIfNotEmpty(' ', FArgsStr);
  ForceDirectories(FAnnouncementDir);

  FTimeout := 0;
  FKeepAnnouncementDir := False;
end;

function mnTExternalCommandExecution.WaitAndParse: mnTExternalCommandExecutionResult;
var
  Deadline: TDateTime;
  strs: mnTStrList;
begin
  // Wait
  Deadline := IncSecond(Now, FTimeout);
  repeat
    if (FTimeout > 0) and (Now > Deadline) then
    begin
      Result := erFreezed;
      FMsg := '';
      Exit;
    end;
  until FileExists(FAnnouncementFileName) and mnCanFileBeRW(FAnnouncementFileName);

  // Parse
  strs := mnTStrList.Create;
  try
    strs.LoadFromFile(FAnnouncementFileName);
    if strs[0] = 'finished' then
      Result := erFinished
    else if strs[0] = 'exception' then
      Result := erException
    else if strs[0] = 'halted' then
      Result := erHalted
    else
    begin
      mnCreateError(SIllegalExternalCommandExecutionResult);
      Result := erHalted;
      FMsg := '';
      Exit;
    end;
    strs.Delete(0);
    FMsg := strs.Combine(mnNewLine); 
  finally
    strs.Free;
  end;
end;

procedure mnTExternalCommandExecution.DeleteAnnouncementDir;
begin
  mnDeleteDir(FAnnouncementDir);
end;

function mnTExternalCommandExecution.Execute: mnTExternalCommandExecutionResult;
begin
  if FCommandFile.UseJavaToRunJar then
    mnShellOpen('java', '-jar ' + FCommandFile.CommandFileName + ' ' + FCompletedArgs)
  else
    mnShellOpen(FCommandFile.CommandFileName, FCompletedArgs);
  Result := WaitAndParse;
  if not FKeepAnnouncementDir then
    DeleteAnnouncementDir;
end;

{ mnTDelphiTypeConvertors }

const
  DelphiTypeTexts: array [0..Integer(dtOthers)-1] of string =
    ('string', 'Boolean', 'Currency', 'TDateTime', 'Single', 'Double',
     'Shortint', 'Smallint', 'Integer', 'Byte', 'Word', 'Longword', 'Int64');

  DelphiTypeMNTexts: array [0..Integer(dtOthers)-1] of string =
    ('Str', 'Bool', 'Curr', 'DT', 'Float', 'Float',
     'Int', 'Int', 'Int', 'Int', 'Int', 'Int', 'Int');

  DelphiAsFuncs: array [0..Integer(dtOthers)-1] of string =
    ('AsString', 'AsBoolean', 'AsCurrency', 'AsDateTime', 'AsFloat', 'AsFloat',
     'AsInteger', 'AsInteger', 'AsInteger', 'AsInteger', 'AsInteger', 'AsInteger', 'AsInteger');

  DelphiToStrFuncs: array [0..Integer(dtOthers)-1] of string =
    ('', 'mnBoolToStr', 'CurrToStr', 'DateTimeToStr', 'FloatToStr', 'FloatToStr',
     'IntToStr', 'IntToStr', 'IntToStr', 'IntToStr', 'IntToStr', 'IntToStr', 'IntToStr');

  DelphiStrToFuncs: array [0..Integer(dtOthers)-1] of string =
    ('', 'StrToBool', 'StrToCurr', 'StrToDateTime', 'StrToFloat', 'StrToFloat',
     'StrToInt', 'StrToInt', 'StrToInt', 'StrToInt', 'StrToInt', 'StrToInt', 'StrToInt');

  DelphiNullValues: array [0..Integer(dtOthers)-1] of string =
    ('''''', 'False', '0', '0', '0', '0',
     '0', '0', '0', '0', '0', '0', '0');

  DelphiFormatTypes: array [0..Integer(dtOthers)-1] of string =
    ('%s', '%s', '%n', '%s', '%n', '%n',
     '%d', '%d', '%d', '%d', '%d', '%d', '%d');

  DelphiSQLFormatTypes: array [0..Integer(dtOthers)-1] of string =
    ('''''%s''''', '''''%s''''', '%n', '''''%s''''', '%n', '%n',
     '%d', '%d', '%d', '%d', '%d', '%d', '%d');

  DelphiFormatArgs: array [0..Integer(dtOthers)-1] of string =
    ('', 'mnBoolToStr', '', 'DateTimeToStr', '', '',
     '', '', '', '', '', '', '');

class function mnTDelphiTypeConvertors.ToText         (const DelphiType: mnTDelphiType): string;
begin
  if DelphiType < dtOthers then
    Result := DelphiTypeTexts[Integer(DelphiType)]
  else
    Result := '';
end;

class function mnTDelphiTypeConvertors.ToMNText       (const DelphiType: mnTDelphiType): string;
begin
  if DelphiType < dtOthers then
    Result := DelphiTypeMNTexts[Integer(DelphiType)]
  else
    Result := '';
end;

class function mnTDelphiTypeConvertors.ToAsFunc       (const DelphiType: mnTDelphiType): string;
begin
  if DelphiType < dtOthers then
    Result := DelphiAsFuncs[Integer(DelphiType)]
  else
    Result := '';
end;

class function mnTDelphiTypeConvertors.ToToStrFunc    (const DelphiType: mnTDelphiType): string;
begin
  if DelphiType < dtOthers then
    Result := DelphiToStrFuncs[Integer(DelphiType)]
  else
    Result := '';
end;

class function mnTDelphiTypeConvertors.ToStrToFunc    (const DelphiType: mnTDelphiType): string;
begin
  if DelphiType < dtOthers then
    Result := DelphiStrToFuncs[Integer(DelphiType)]
  else
    Result := '';
end;

class function mnTDelphiTypeConvertors.ToNullValue    (const DelphiType: mnTDelphiType): string;
begin
  if DelphiType < dtOthers then
    Result := DelphiNullValues[Integer(DelphiType)]
  else
    Result := '';
end;

class function mnTDelphiTypeConvertors.ToFormatType   (const DelphiType: mnTDelphiType): string;
begin
  if DelphiType < dtOthers then
    Result := DelphiFormatTypes[Integer(DelphiType)]
  else
    Result := '';
end;

class function mnTDelphiTypeConvertors.ToSQLFormatType(const DelphiType: mnTDelphiType): string;
begin
  if DelphiType < dtOthers then
    Result := DelphiSQLFormatTypes[Integer(DelphiType)]
  else
    Result := '';
end;

class function mnTDelphiTypeConvertors.ToFormatArg    (const DelphiType: mnTDelphiType): string;
begin
  if DelphiType < dtOthers then
    Result := DelphiFormatArgs[Integer(DelphiType)]
  else
    Result := '';
end;

initialization

  mnAppPath := ExtractFilePath(Application.ExeName);

  ppStrs := mnTStrList.Create;

finalization

  ppStrs.Free;

end.
