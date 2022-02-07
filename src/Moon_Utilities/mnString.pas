unit mnString;

interface

uses Classes, DB, mnSystem;

{--------------------------------
  �ڰ���ַ�����ȫ���ַ���֮��ת����DBCΪ��ǣ�SBCΪȫ�ǡ�
  Tested in TestUnit.
 --------------------------------}
function mnDBCToSBC(const S: string): string;
function mnSBCToDBC(const S: string): string;

{--------------------------------
  ����ָ����λ��S�еĵ�һ�γ��ֻ����һ�γ��֣����س��ֵ�λ�á�
  ֧�ֵĵ�λ�У�
    - ָ���ַ�
    - ָ��Delimiters�ַ����е������ַ�
    - ָ���ַ�������ʱ����ƥ���Ӵ��ĵ�һ���ַ���λ�ã�
  ��ָ����λ�Ĳ����Ǵ�Сд���еġ�������Ansi���ַ��������⣬������ö�֧��MBCS��
  ���ָ����λû�г��֣�����0��
  ע��һ��VCL�еı�׼LastDelimiter��������MBCS�ϴ���bug����˽�������д��
  ע�����mnFirstPos��mnAnsiFirstPos��ͬ��VCL�е�Pos��AnsiPos������ȥ��
  Tested in TestUnit.
 --------------------------------}
function mnLastChar (const Ch: Char; const S: string): Integer;
function mnFirstChar(const Ch: Char; const S: string): Integer;
function mnLastDelimiter (const Delimiters, S: string): Integer;
function mnFirstDelimiter(const Delimiters, S: string): Integer;
function mnLastPos    (const Substr, S: string): Integer;
function mnAnsiLastPos(const Substr, S: string): Integer;

{--------------------------------
  ��Offset��ʼ����S�в���ָ���Ӵ���
  ���û���ҵ��κ�SubStr����OffsetС��1����Offset����S�ĳ��ȣ�����0��
  ͬVCL�еı�׼PosEx�������ƣ���֧��MBCS����Ȥ���ǣ�VCL�а�����Pos��PosEx��AnsiPos������ȱ��AnsiPosEx��
  Tested in TestUnit.
 --------------------------------}
function mnAnsiPosEx(const SubStr, S: string; Offset: Integer = 1): Integer;

{--------------------------------
  ȷ���ַ����е�ָ���ֽ�û�нض�һ��˫�ֽ��ַ���
  ���ָ���ֽ���˫�ֽ��ַ������ֽڣ���ʹָ֮����β�ֽڡ�
  Tested in TestUnit.
 --------------------------------}
function mnSettleByte(const S: string; const Index: Integer): Integer;

{--------------------------------
  �ж�һ���ַ��Ƿ��Ǵ�ASCII�ַ�����һ���ַ����Ƿ������ַ����Ǵ�ASCII�ַ���
  ��ASCII�ַ�ָASCIIֵС��128���ַ���
  Tested in TestUnit.
 --------------------------------}
function mnIsASCIIChar(const Ch: Char): Boolean; inline;
function mnIsASCIIStr(const S: string): Boolean;

{--------------------------------
  �ж�ָ��Delimiters�ַ����е������ַ����Ƿ���S�г��֡�֧��MBCS��
  Tested in TestUnit.
 --------------------------------}
function mnContainDelimiters(const Delimiters, S: string): Boolean;

{--------------------------------
  �ж�һ���ַ����Ƿ���ָ���Ӵ���ʼ������ָ���Ӵ���������֧��MBCS��
  VCL�еı�׼StartsStr��EndsStr����֧��MBCS������ڲ���ҪMBCS�ĳ��ϻή��Ч�ʡ�
  Tested in TestUnit.
 --------------------------------}
function mnStartsStr(const SubStr, S: string): Boolean;
function mnEndsStr(const SubStr, S: string): Boolean;

{--------------------------------
  ͳ��һ���ַ����Ŀ�ʼ�����������ָ���Ӵ��������ֵĴ�������֧��MBCS��
  ���SubStrΪ�մ�������0��
  Tested in TestUnit.
 --------------------------------}
function mnStartsStrCount(const SubStr, S: string): Integer;
function mnEndsStrCount(const SubStr, S: string): Integer;

{--------------------------------
  ��SubStr���뵽S��ָ��λ�ã�������Ӵ���һ���ַ���λ��ΪIndex����MBCS�޹ء�
  ���IndexС��1������뵽��ǰ�档���Index����S�ĳ��ȣ�����뵽����档
  Tested in TestUnit.
 --------------------------------}
function mnInsertStr(const SubStr, S: string; const Index: Integer): string;
{--------------------------------
  ��S��ɾ����Index����ʼ������Count���ַ�����MBCS�޹ء�
  ���IndexС��1�����S�ĳ��ȣ��򲻽����κβ��������Count��������ɾ�����ַ���ĩβΪֹ��
  ��mnTruncBMiddle������ͬ��
  Tested in TestUnit.
 --------------------------------}
function mnDeleteStr(const S: string; const Index, Count: Integer): string;

{--------------------------------
  �ض�һ���ַ���������߻��ұ߽�ȥָ�����ȵ��Ӵ���֧��MBCS��
  ������ȹ���������ȥ�������ݶ����շ��ؿմ���
  Tested in TestUnit.
 --------------------------------}
function mnTruncLeft (const S: string; Count: Integer): string;
function mnTruncRight(const S: string; Count: Integer): string;
{--------------------------------
  ��ȥһ���ַ������м䲿�֡�ָ�����ȵ��Ӵ���֧��MBCS��
  ������ȹ��������ص��ַ���ĩβΪֹ��
  ���StartԽ�磬���׳��쳣��
  Tested in TestUnit.
 --------------------------------}
function mnTruncMiddle(const S: string; Start, Count: Integer): string;
{--------------------------------
  �ض�һ���ַ���������߻��ұ߽�ȥָ���������ֽڡ���MBCS�޹ء�
  ����ֽ������࣬����ȥ�������ݶ����շ��ؿմ���
  Tested in TestUnit.
 --------------------------------}
function mnTruncBLeft (const S: string; Count: Integer): string; inline;
function mnTruncBRight(const S: string; Count: Integer): string; inline;
{--------------------------------
  ��ȥһ���ַ������м䲿�֡�ָ���������ֽڡ���MBCS�޹ء�
  ������ȹ��������ص��ַ���ĩβΪֹ��
  ���StartԽ�磬���׳��쳣��
  ��mnDeleteStr������ͬ��
  Tested in TestUnit.
 --------------------------------}
function mnTruncBMiddle(const S: string; Start, Count: Integer): string;

{--------------------------------
  �õ�S���Ӵ�����ʽ�ǣ�����ָ����λ��S�еĵ�һ�γ��ֻ����һ�γ��֣����س���֮ǰ��ĩ����֮����Ӵ���
  ֧�ֵĵ�λ�У�
    - ָ���ַ�
    - ָ��Delimiters�ַ����е������ַ�
    - ָ���ַ���
  ��ָ����λ�Ĳ����Ǵ�Сд���еġ�������Ansi���ַ��������⣬������ö�֧��MBCS��
  ���ָ����λû�г��֣����ؿմ���
  Tested in TestUnit.
 --------------------------------}
function mnLeftStrToChar (const Ch: Char; const S: string): string;
function mnRightStrToChar(const Ch: Char; const S: string): string;
function mnLeftStrToDelimiter (const Delimiters, S: string): string;
function mnRightStrToDelimiter(const Delimiters, S: string): string;
function mnLeftStrTo     (const Substr, S: string): string;
function mnRightStrTo    (const Substr, S: string): string;
function mnAnsiLeftStrTo (const Substr, S: string): string;
function mnAnsiRightStrTo(const Substr, S: string): string;

{--------------------------------
  �ض�S����ʽ�ǣ�����ָ����λ��S�еĵ�һ�γ��ֻ����һ�γ��֣�������֮ǰ��ĩ����֮����Ӵ�����ָͬ����λһ���ȥ��
  ֧�ֵĵ�λ�У�
    - ָ���ַ�
    - ָ��Delimiters�ַ����е������ַ�
    - ָ���ַ���
  ��ָ����λ�Ĳ����Ǵ�Сд���еġ�������Ansi���ַ��������⣬������ö�֧��MBCS��
  ���ָ����λû�г��֣�����ȥ�κ��ַ�������S��
  Tested in TestUnit.
 --------------------------------}
function mnTruncLeftOverChar (const Ch: Char; const S: string): string;
function mnTruncRightOverChar(const Ch: Char; const S: string): string;
function mnTruncLeftOverDelimiter (const Delimiters, S: string): string;
function mnTruncRightOverDelimiter(const Delimiters, S: string): string;
function mnTruncLeftOver     (const Substr, S: string): string;
function mnTruncRightOver    (const Substr, S: string): string;
function mnAnsiTruncLeftOver (const Substr, S: string): string;
function mnAnsiTruncRightOver(const Substr, S: string): string;

{--------------------------------
  �ض�S���õ��䱻��ȥ���Ӵ���
  ��ʽ�ǣ�����ָ����λ��S�еĵ�һ�γ��ֻ����һ�γ��֣����س���֮ǰ��ĩ����֮����Ӵ������ض�S����
  �൱��LeftRightStrTo��TruncLeftRightOver����ϡ�
  ֧�ֵĵ�λ�У�
    - ָ���ַ�
    - ָ��Delimiters�ַ����е������ַ�
    - ָ���ַ���
  ��ָ����λ�Ĳ����Ǵ�Сд���еġ�������Ansi���ַ��������⣬������ö�֧��MBCS��
  ���ָ����λû�г��֣����ؿմ���ͬʱS���䡣
  Tested in TestUnit.
 --------------------------------}
function mnCutLeftByChar (const Ch: Char; var S: string): string;
function mnCutRightByChar(const Ch: Char; var S: string): string;
function mnCutLeftByDelimiter (const Delimiters: string; var S: string): string;
function mnCutRightByDelimiter(const Delimiters: string; var S: string): string;
function mnCutLeftBy     (const Substr: string; var S: string): string;
function mnCutRightBy    (const Substr: string; var S: string): string;
function mnAnsiCutLeftBy (const Substr: string; var S: string): string;
function mnAnsiCutRightBy(const Substr: string; var S: string): string;

{--------------------------------
  ���S��ָ����λ��ʼ������ָ����λ���������ȥָ����λ������S��ʣ�ಿ�֡�����ֱ�ӷ���S��
  ���S���������ָ����λ��ʼ���������ֻ���ȥһ��ָ����λ��
  �൱������StartsEndsStr�жϣ���������������ʹ��TruncLeftRightOver��
  ֧�ֵĵ�λ�У�
    - ָ���ַ�
    - ָ��Delimiters�ַ����е������ַ�
    - ָ���ַ���
  ��ָ����λ���ж��Ǵ�Сд���еġ�������Ansi���ַ��������⣬������ö�֧��MBCS��
  Tested in TestUnit.
 --------------------------------}
function mnRemoveLeftChar (const Ch: Char; const S: string): string;
function mnRemoveRightChar(const Ch: Char; const S: string): string;
function mnRemoveLeftDelimiter (const Delimiters, S: string): string;
function mnRemoveRightDelimiter(const Delimiters, S: string): string;
function mnRemoveLeft     (const Substr, S: string): string;
function mnRemoveRight    (const Substr, S: string): string;
function mnAnsiRemoveLeft (const Substr, S: string): string;
function mnAnsiRemoveRight(const Substr, S: string): string;

{--------------------------------
  ȷ��S��ָ����λ��ʼ�������������S����ָ����λ��ʼ�����������S��ǰ���������ָ����λ��
  ֧�ֵĵ�λ�У�
    - ָ���ַ�
    - ָ��Delimiters�ַ����е������ַ�
    - ָ���ַ���
  ��ָ����λ���ж��Ǵ�Сд���еġ�������Ansi���ַ��������⣬������ö�֧��MBCS��
  Tested in TestUnit.
 --------------------------------}
function mnEnsureLeftChar (const Ch: Char; const S: string): string;
function mnEnsureRightChar(const Ch: Char; const S: string): string;
function mnEnsureLeft     (const Substr, S: string): string;
function mnEnsureRight    (const Substr, S: string): string;
function mnAnsiEnsureLeft (const Substr, S: string): string;
function mnAnsiEnsureRight(const Substr, S: string): string;

{--------------------------------
  ���S��Ϊ�գ����ڿ�ʼ�������������ָ����λ����MBCS�޹ء�
  ֧�ֵĵ�λ�У�
    - ָ���ַ�
    - ָ���ַ���
  Tested in TestUnit.
 --------------------------------}
function mnAppendLeftCharIfNotEmpty (const Ch: Char; const S: string): string;
function mnAppendRightCharIfNotEmpty(const Ch: Char; const S: string): string;
function mnAppendLeftIfNotEmpty     (const Substr, S: string): string;
function mnAppendRightIfNotEmpty    (const Substr, S: string): string;

{--------------------------------
  ͳ����S��ָ����λ�ĳ��ִ�����
  ֧�ֵĵ�λ�У�
    - ָ���ַ�
    - ָ��Delimiters�ַ����е������ַ�
    - ָ���ַ���
  ��ָ����λ�Ĳ����Ǵ�Сд���еġ�������Ansi���ַ��������⣬������ö�֧��MBCS��
  Tested in TestUnit.
 --------------------------------}
function mnCountChar(const Ch: Char; const S: string): Integer;
function mnCountDelimiter(const Delimiters, S: string): Integer;
function mnCount(const Substr, S: string): Integer;
function mnAnsiCount(const Substr, S: string): Integer;

{--------------------------------
  ɾȥS�����е�ָ����λ��
  ֧�ֵĵ�λ�У�
    - ָ���ַ�
    - ָ��Delimiters�ַ����е������ַ�
    - ָ���ַ���
  ��ָ����λ�Ĳ����Ǵ�Сд���еġ�������Ansi���ַ��������⣬������ö�֧��MBCS��
  Tested in TestUnit.
 --------------------------------}
function mnDiscardChar(const Ch: Char; const S: string): string;
function mnDiscardDelimiter(const Delimiters, S: string): string;
function mnDiscard(const Substr, S: string): string;
function mnAnsiDiscard(const Substr, S: string): string;

{--------------------------------
  ��S�У����е�ָ����λ����������֣�ɾȥ����ģ�������һ�ݡ�
  ���������ֵ��Ӵ�ȫ��������
  ֧�ֵĵ�λ�У�
    - ָ���ַ�
    - ָ��Delimiters�ַ����е������ַ����ַ����в�ͬ�ַ�����������Ҳ�ᱻ����
    - ָ���ַ���
  ��ָ����λ�Ĳ����Ǵ�Сд���еġ�������Ansi���ַ��������⣬������ö�֧��MBCS��
  Tested in TestUnit.
 --------------------------------}
function mnShrinkChar(const Ch: Char; const S: string): string;
function mnShrinkDelimiter(const Delimiters, S: string): string;
function mnShrink(const Substr, S: string): string;
function mnAnsiShrink(const Substr, S: string): string;

{--------------------------------
  ��S�У���ȥ��ߺ��ұ����е�ָ����λ��
  ֧�ֵĵ�λ�У�
    - ָ���ַ���
    - ָ���ַ��������е������ַ���
  ��ָ����λ��ƥ���Ǵ�Сд���еġ���֧��MBCS��
  Tested in TestUnit.
 --------------------------------}
function mnTrim(const SubStr: string; const S: string): string;
function mnTrimStrs(const SubStrs: array of string; const S: string): string;

{--------------------------------
  ��S�����������չ���µĳ��ȣ������λ����FillingChar���롣
  Tested in TestUnit.
 --------------------------------}
function mnExpandLeft (const S: string; const NewLength: Integer; const FillingChar: Char): string;
function mnExpandRight(const S: string; const NewLength: Integer; const FillingChar: Char): string;
{--------------------------------
  ��һ��������չ����Ҫ�ĳ��ȣ������λ����ǰ��ȱʡ��0���롣
  Tested in TestUnit.
 --------------------------------}
function mnExpandInt(const Value: Integer; const RequiredLength: Integer; const FillingChar: Char = '0'): string;

type
{--------------------------------
  ���ڵ���mnCompareStr����ʱ�����������ָ���ȽϷ�ʽ��
    scoCaseSensitive����Сд���С�
    scoWholeWordOnly������ƥ�䡣
 --------------------------------}
  mnTStrComparisonOption = (scoCaseSensitive, scoWholeWordOnly);
  mnTStrComparisonOptions = set of mnTStrComparisonOption;

{--------------------------------
  �Ƚ������ַ������ɴ����Ƿ��Сд���л�����ƥ������á�
  ���������ƥ�䣬��ʹ��SMajor��Ϊ������SMinor��Ϊ�Ӵ���
  ResultWhenMinorIsEmpty��ʾ���Ӵ�Ϊ�մ�ʱ����η��ء�
  Tested in TestUnit.
 --------------------------------}
function mnCompareStr(SMajor, SMinor: string; const Options: mnTStrComparisonOptions; const ResultWhenMinorIsEmpty: Boolean = True): Boolean;

{--------------------------------
  �����ַ�ʽ�Ƚ������ַ�����
  ���A>B������ֵ>0�����A=B������ֵ=0�����A<B������ֵ<0��
  �����ַ�ʽ��ָ�����ַ�����߾����ܶ���ַ�ת��Ϊ�����������������бȽϡ�����֧�ָ�����
  ���ĳһ�ַ������û�����֣�����������һ�����ֵ��ַ�����
  ��������ַ�����߶�û�����֣���ʹ����ͨ���ַ����Ƚ�AnsiCompareStr��
  Tested in TestUnit.
 --------------------------------}
function mnCompareStrInNumberStyle(const SA: string; const SB: string): Integer;

{--------------------------------
  ��S�в�������ָ���Ӵ������滻���´���
  �ò����Ǵ�Сд���еġ�
  �滻���ǵݹ�ġ�Ҳ����˵������滻���´��������µ��Ӵ�ƥ�䣬�����ƥ�䲻���ٱ��滻��
  VCL�еı�׼AnsiReplaceStr����֧��MBCS������ڲ���ҪMBCS�ĳ��ϻή��Ч�ʡ�
  Tested in TestUnit.
 --------------------------------}
function mnReplaceStr(const S, OldStr, NewStr: string): string;
{--------------------------------
  ��mnReplaceStr���ƣ���ʹ������ƥ��Ĳ��ҡ�
  Tested in TestUnit.
 --------------------------------}
function mnReplaceStrWholeWord(const S, OldStr, NewStr: string): string;
{--------------------------------
  ��mnReplaceStr���ƣ���ֻ�滻ָ���Ӵ��ĵ�һ�γ��֡�
  VCL�еı�׼StringReplace����֧��MBCS������ڲ���ҪMBCS�ĳ��ϻή��Ч�ʡ�
  Tested in TestUnit.
 --------------------------------}
function mnReplaceStrOnce(const S, OldStr, NewStr: string): string;

{--------------------------------
  ��Offset��ʼ����S�в�����SubstrHead��ʼ����SubstrTail��β���Ӵ���
  �ò����Ǵ�Сд���еġ�
  ���Offsetû��Խ�磬�����Ӵ��ܹ����ҵ�������True������ʧ��ʱ����False��ֻ��Headȴû��Tail��Ҳ��ζ��ʧ�ܡ�
  ������Trueʱ��SubstrBeginPos���ظ��Ӵ�����ʼλ�ã���һ���ַ�����������SubstrEndPos���ظ��Ӵ��Ľ���λ�ã����һ���ַ���������1����
  SubstrBody����Head��Tail֮����Ӵ����ݡ�
  ���ֻ��ҪBody������ҪBeginPos��EndPos�����Ե��õڶ��ּ���������ʽ��
  Tested in TestUnit.
 --------------------------------}
function mnFindStrBetween    (const S, SubstrHead, SubstrTail: string; var SubstrBeginPos, SubstrEndPos: Integer; var SubstrBody: string; Offset: Integer = 1): Boolean; overload;
function mnFindStrBetween    (const S, SubstrHead, SubstrTail: string;                                            var SubstrBody: string; Offset: Integer = 1): Boolean; overload;
function mnAnsiFindStrBetween(const S, SubstrHead, SubstrTail: string; var SubstrBeginPos, SubstrEndPos: Integer; var SubstrBody: string; Offset: Integer = 1): Boolean; overload;
function mnAnsiFindStrBetween(const S, SubstrHead, SubstrTail: string;                                            var SubstrBody: string; Offset: Integer = 1): Boolean; overload;

{--------------------------------
  ��S�в���������SubstrHead��ʼ����SubstrTail��β���Ӵ������滻���´���
  �´������ݿ�����ָ���Ĺ̶�����Ҳ��������ԭ�Ӵ���BodyΪname����NameValuePairs�в����value��
  �ò����Ǵ�Сд���еġ�
  �滻���ǵݹ�ġ�Ҳ����˵������滻���´��������µ��Ӵ�ƥ�䣬�����ƥ�䲻���ٱ��滻��
  ���û��ָ��SubstrHead��SubstrTail����ʹ��mnStdSeparator1��ΪSubstrHead��SubstrTail��
  Tested in TestUnit.
 --------------------------------}
function mnReplaceStrBetween    (const S, SubstrHead, SubstrTail, NewStr: string): string; overload;
function mnReplaceStrBetween    (const S, SubstrHead, SubstrTail: string; NameValuePairs: TStrings): string; overload;
function mnReplaceStrBetween    (const S,                         NewStr: string): string; overload;
function mnReplaceStrBetween    (const S:                         string; NameValuePairs: TStrings): string; overload;
function mnAnsiReplaceStrBetween(const S, SubstrHead, SubstrTail, NewStr: string): string; overload;
function mnAnsiReplaceStrBetween(const S, SubstrHead, SubstrTail: string; NameValuePairs: TStrings): string; overload;
function mnAnsiReplaceStrBetween(const S,                         NewStr: string): string; overload;
function mnAnsiReplaceStrBetween(const S:                         string; NameValuePairs: TStrings): string; overload;

{--------------------------------
  ��һ���������ӳɵ����ַ�����ÿ��������������Ԫ�ؼ䣬��Connector���ӡ�
  HasBorder��ʾ�Ƿ���Ҫ�ڵ�һ��Ԫ��ǰ�����һ��Ԫ�غ����Connector��
  ���������Ϊ�գ������ӳ��մ����ٸ���HasBorder�ж��Ƿ�Ҫ�����߷���Connector��
  ���������Դ�����ǣ�
  - һ����̬��̬���ַ�������
  - һ��TStrings����
  - һ��DataSet�����м�¼��ָ���ֶ��ϵ�ֵ
  - һ��Fields��ָ���Ķ���ֶ��ϵ�ֵ
  Tested in TestUnit.
 --------------------------------}
function mnCombine(const Strs: array of string;                        const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;
function mnCombine(Strs: TStrings;                                     const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;
function mnCombine(DataSet: TDataSet; const FieldName: string;         const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;
function mnCombine(Fields: TFields; FieldNames: mnTFieldNames;         const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;
function mnCombine(Fields: TFields; FieldNames: TStrings;              const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;
function mnCombine(Fields: TFields; const FieldNames: array of string; const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;

{--------------------------------
  �������ַ����ָ��һ���ַ�������ÿ��Separator�����зָ
  ���طָ����ַ���������
  HasBorder��ʾ�ڵ�һ��Ԫ��ǰ�����һ��Ԫ�غ��Ƿ����Separator��
  �ָ����ַ��������OutSplittedStrs�У���OutSplittedStrsԭ�е����ݲ�����ա�
  ע�⣺���ԭʼ�ַ���Ϊ�մ�����ȥHasBorder��Ӱ��󣩣���ָ��Ҳ��õ�һ���մ��������ǵõ�����ַ�����
  Tested in TestUnit.
 --------------------------------}
function mnSplit    (const S: string; OutSplittedStrs: TStrings; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
function mnAnsiSplit(const S: string; OutSplittedStrs: TStrings; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;

{--------------------------------
  ��һ���ַ����ָ��һ���ַ������ָ������ǹ̶��ģ�����������SeparatorHead��ʼ����SeparatorTail��β���Ӵ���
  ���طָ����ַ���������
  �ָ����ַ��������OutSplittedStrs�У���OutSplittedStrsԭ�е����ݲ�����ա�
  ���зָ�����Body��Ҳ����Head��Tail֮������ݣ������OutSeparatorBodies�У���OutSeparatorBodiesԭ�е����ݲ��ᱻ��ա�
  ע�⣺���ԭʼ�ַ���Ϊ�մ�����ָ��Ҳ��õ�һ���մ��������ǵõ�����ַ�����
  Tested in TestUnit.
 --------------------------------}
function mnSplitBetween    (const S: string; OutSplittedStrs: TStrings; OutSeparatorBodies: TStrings; const SeparatorHead, SeparatorTail: string): Integer;
function mnAnsiSplitBetween(const S: string; OutSplittedStrs: TStrings; OutSeparatorBodies: TStrings; const SeparatorHead, SeparatorTail: string): Integer;

{--------------------------------
  ��һ���ַ����ָ��һ���ַ�������ÿ���̶��ĳ��ȴ����зָ��MBCS�޹ء�
  ���طָ����ַ���������
  �ָ����ַ��������OutSplittedStrs�У���OutSplittedStrsԭ�е����ݲ�����ա�
  ע�⣺���ԭʼ�ַ���Ϊ�մ�����ָ��Ҳ��õ�һ���մ��������ǵõ�����ַ�����
  Tested in TestUnit.
 --------------------------------}
function mnSplitByLen(const S: string; OutSplittedStrs: TStrings; const SplittedLen: Integer): Integer;

{--------------------------------
  �ַ���ģʽ��������ƥ���ַ��������Է���ģʽ���ַ�����������ȡ��������ֵ��
  ģʽ��������0����������ÿ��������ParamHead��ʼ����ParamTail��β��Head��Tail֮���Body���ǲ������ơ�
  ��������ƥ�������ַ���ģʽ�в���������ַ�����Ϊ�̶��Σ����뾫ȷƥ�䡣
  ���磬��ParamHead��ParamTail���ǡ�%������abc%p1%def%p2%gh����ʾ����Ϊp1��p2������������ģʽ����ƥ�䡰abc111def222gh����
  ע�⣺��ʽ�ﲻ�������������Ĳ���������ϵͳ���޷�����ÿ��������ֵ��

  ��������ʵ���ַ�����
  ���ṩһ��NameValuePairs����ÿ�����������ݲ������ƣ���NameValuePairs�в����Ӧֵ���滻��ģʽ���
  ��ͬ��mnReplaceStrBetween��mnAnsiReplaceStrBetween��������Ҫ���ʵ��ʱ�����ڲ���ÿ�ζ����½�����������������ִ��Ч�ʡ�
  ��ĳ�������ϣ�ʵ�ֿɿ�����ƥ��������������֮��Ȼ��
  ע�⣺��ʵ��ʱ����ʽ����������������Ĳ������ⲻ�����κ��߼����⡣

  Tested in TestUnit.
 --------------------------------}
type
  mnTStringPattern = class
  private
    FPattern: string;
    FPatternSections: mnTStrList;
    FPatternParams: mnTStrList;
    FPatternParsed: Boolean;
    procedure SetPattern(const Value: string);
  public
    // ����ģʽ��PatternSections��PatternParams����Ansi��֧��MBCS
    procedure ParsePattern;
    procedure AnsiParsePattern;
  public
    // ģʽ����������ֵ�Զ���ģʽ
    property Pattern: string read FPattern write SetPattern;
    // ��ģʽ���н������Ĺ̶��Σ�����ִ��ƥ��
    property PatternSections: mnTStrList read FPatternSections;
    // ��ģʽ���н������Ĳ���������ִ��ƥ��
    property PatternParams: mnTStrList read FPatternParams;
    // ģʽ���Ƿ��ѱ��������¸�ֵ��ģʽ�����ڵ�һ��ƥ���ʵ��ʱ������������ֻҪģʽ��û�иı䣬һ�ν����������ִ�ж��ƥ���ʵ��
    property PatternParsed: Boolean read FPatternParsed;
    // �������ı��ļ�����Ϊģʽ
    procedure LoadPatternFromFile(const FileName: string); overload;
  private
    FParamHead: string;
    FParamTail: string;
    FIgnoreUnnamedParams: Boolean;
    FAutoClearPairs: Boolean;
  public
    // ��λ�����Ŀ�ʼ��ȱʡΪmnStdSeparator1
    property ParamHead: string read FParamHead write FParamHead;
    // ��λ�����Ľ�����ȱʡΪmnStdSeparator1
    property ParamTail: string read FParamTail write FParamTail;
    // ���ΪTrue����û�����ֵĲ������ᱻ����ParamPairs��ȱʡΪTrue
    property IgnoreUnnamedParams: Boolean read FIgnoreUnnamedParams write FIgnoreUnnamedParams;
    // ���ΪTrue������ÿ��ƥ��ǰ���Զ����ԭ�е�ParamPairs��ȱʡΪTrue
    property AutoClearPairs: Boolean read FAutoClearPairs write FAutoClearPairs;
  private
    FWorkStr: string;
    FParamPairs: mnTStrList;
    FPartBeginPos: Integer;
    FPartEndPos: Integer;
    function GetParamValue(ParamName: string): string;
    function GetParamValueAsInt(ParamName: string): Integer;
    function GetParamValueAsFloat(ParamName: string): Extended;
    function GetParamValueAsDT(ParamName: string): TDateTime;
    function GetParamValueAsCurr(ParamName: string): Currency;
  public
    // ��ִ��һ��ƥ��󣬴洢ƥ������ַ���
    property WorkStr: string read FWorkStr;
    // ��ִ��һ�γɹ�ƥ���ÿ��������ֵ��ȡ����ͬ������һ�����name-value�Դ���
    property ParamPairs: mnTStrList read FParamPairs;
    // ��ִ��һ�γɹ�ƥ��󣬿��Ե�����Щ���ԣ����ݲ���������ParamPairs���ȡ��ͬ���͵Ĳ���ֵ
    property ParamValue       [ParamName: string]: string    read GetParamValue;
    property ParamValueAsInt  [ParamName: string]: Integer   read GetParamValueAsInt;
    property ParamValueAsFloat[ParamName: string]: Extended  read GetParamValueAsFloat;
    property ParamValueAsDT   [ParamName: string]: TDateTime read GetParamValueAsDT;
    property ParamValueAsCurr [ParamName: string]: Currency  read GetParamValueAsCurr;
    // ��ִ��һ�γɹ�ƥ���Ӵ��󣬷��ظ��Ӵ�����ʼλ�ã���һ���ַ���������
    property PartBeginPos: Integer read FPartBeginPos;
    // ��ִ��һ�γɹ�ƥ���Ӵ��󣬷��ظ��Ӵ��Ľ���λ�ã����һ���ַ���������1��
    property PartEndPos: Integer read FPartEndPos;
    // ���ParamPairs�����������
    procedure ClearParamPairs;
  public
    constructor Create;
    destructor Destroy; override;
  public
    // ƥ��һ���ַ���������ƥ�����ɹ���ʧ�ܡ���Ansi��֧��MBCS
    function Match(const S: string): Boolean;
    function AnsiMatch(const S: string): Boolean;
    // ��Offset��ʼ��ƥ��һ���ַ����Ĳ����Ӵ�������ƥ�����ɹ���ʧ�ܡ���Ansi��֧��MBCS
    function MatchSub(const S: string; const Offset: Integer = 1): Boolean;
    function AnsiMatchSub(const S: string; const Offset: Integer = 1): Boolean;
    // ���ϴ�MatchSub�Ľ���λ����ΪOffset������ƥ����һ���Ӵ�������ƥ�����ɹ���ʧ�ܡ���Ansi��֧��MBCS
    function MatchNextSub: Boolean;
    function AnsiMatchNextSub: Boolean;
    // ׼����ʼһ���Ӵ����е�ƥ�䣬��׼����ɺ󣬾Ϳ���ʹ��while MatchNextSub do��ѭ��������ƥ���Ӵ�
    procedure PrepareSubSequence(const S: string);
  public
    // ��NameValuePairs���ݲ�����ȡֵ����ʵ��һ���ַ�������Ansi��֧��MBCS
    function Realize(NameValuePairs: TStrings): string;
    function AnsiRealize(NameValuePairs: TStrings): string;
  end;

var
{--------------------------------
  Ԥ��׼���õģ���ʵ������һ��mnTStringPattern����������ʱ��ҪmnTStringPatternʱ�����Ժܷ���ص��á�
 --------------------------------}
  ppPattern: mnTStringPattern;

type
{--------------------------------
  �ı��ı��뷽ʽ����Ansi��Unicode Little-Endian��Unicode Big-Endian��UTF8�ȡ�
 --------------------------------}
  mnTTextEncoding = (teAnsi, teUnicodeLE, teUnicodeBE, teUTF8);

const
{--------------------------------
  �����ı����뷽ʽ��ͷ�ֽڡ�
 --------------------------------}
  mnUnicodeLEBOM = #$FF#$FE;
  mnUnicodeBEBOM = #$FE#$FF;
  mnUTF8BOM = #$EF#$BB#$BF;

{--------------------------------
  ����ͷ�ֽڣ��õ��ı��ı��뷽ʽ��
  Tested in TestUnit.
 --------------------------------}
function mnGetTextEncoding(const S: string): mnTTextEncoding;

{--------------------------------
  ��string��ʽ���WideString��
  ��ֱ�ӽ�WideString��ֵ��string��ͬ���ǣ��������������κα���ת����
  �������ǽ�WideString��ÿ���ֽ���һ���string��ÿ���ֽڡ�
  Tested in TestUnit.
 --------------------------------}
function mnExpressWideString(const WS: WideString): string;

type
{--------------------------------
  ������ַ����������ַ�ȫ�������֡�
 --------------------------------}
  mnTDigitStr = string;
{--------------------------------
  ������ַ����������ַ�ȫ������ĸ�����֡�
 --------------------------------}
  mnTDigletStr = string;

{--------------------------------
  ����һ������ָ��������������ַ�����
  mnRandomStr��������Candidates�ַ��������ѡ����CandidatesΪ�մ������������ַ������ѡ��
  mnRandomDigitStr��������ȫ�������ַ������ѡ��
  mnRandomDigletStr��������ȫ����ĸ�������ַ������ѡ��
  mnRandomUpperDigletStr��������ȫ����д��ĸ�������ַ������ѡ��
  mnRandomLowerDigletStr��������ȫ��Сд��ĸ�������ַ������ѡ��
  Tested in TestUnit.
 --------------------------------}
function mnRandomStr      (const Len: Integer; const Candidates: string = ''): string;
function mnRandomDigitStr (const Len: Integer): mnTDigitStr;
function mnRandomDigletStr(const Len: Integer): mnTDigletStr;
function mnRandomUpperDigletStr(const Len: Integer): mnTDigletStr;
function mnRandomLowerDigletStr(const Len: Integer): mnTDigletStr;

{--------------------------------
  ����ͨ�ַ�����������ȫ�������ֵ��ַ�������ȫ������ĸ�����ֵ��ַ�����
  Capitalָʾȫ������ĸ�����ֵ��ַ������ĸʹ�ô�д��Сд��
  Tested in TestUnit.
 --------------------------------}
function mnEncodeToDigitStr   (const S: string): mnTDigitStr;
function mnDecodeFromDigitStr (const S: mnTDigitStr): string;
function mnEncodeToDigletStr  (const S: string; const Capital: Boolean = True): mnTDigletStr;
function mnDecodeFromDigletStr(const S: mnTDigletStr): string;

{--------------------------------
  ���ַ�����������������ɵ��ַ��������Σ�ÿ���ַ���DisguiseLen���ַ������Ρ�
  �����ַ������������ַ�����ȫ�������ַ�����ȫ����ĸ�������ַ���
  ��һ��ͳһ����¶������
  Capitalָʾ�������ε�ȫ����ĸ�������ַ����ĸʹ�ô�д��Сд��
  Tested in TestUnit.
 --------------------------------}
function mnHideStr      (const S: string; const DisguiseLen: Integer = 4): string;
function mnHideDigitStr (const S: string; const DisguiseLen: Integer = 4): mnTDigitStr;
function mnHideDigletStr(const S: string; const Capital: Boolean = True; const DisguiseLen: Integer = 4): mnTDigletStr;
function mnRevealStr    (const S: string; const DisguiseLen: Integer = 4): string;

implementation

uses SysUtils, StrUtils, mnResStrsU, Variants, mnFile, Windows;

function mnDBCToSBC(const S: string): string;
var
  i: Integer;
  B: Byte;
begin
  Result := '';
  for i := 1 to Length(S) do
    if ByteType(S, i) = mbSingleByte then
    begin
      B := Ord(S[i]);
      if B = 32 then
      begin
        Result := Result + Chr(41377 div 256);
        Result := Result + Chr(41377 mod 256);
      end
      else if (B >= 33) and (B <= 126) then
      begin
        Result := Result + Chr((B + 41856) div 256);
        Result := Result + Chr((B + 41856) mod 256);
      end
      else Result := Result + S[i];
    end
    else Result := Result + S[i];
end;

function mnSBCToDBC(const S: string): string;
var
  i: Integer;
  W: Word;
begin
  Result := '';
  for i := 1 to Length(S) do
    if ByteType(S, i) = mbLeadByte then
    begin
      W := Ord(S[i]) * 256 + Ord(S[i+1]);
      if W = 41377 then
        Result := Result + ' '
      else if (W >= 41889) and (W <= 41982) then
        Result := Result + Chr(W - 41856)
      else
        Result := Result + S[i] + S[i+1];
    end
    else if ByteType(S, i) = mbSingleByte then
      Result := Result + S[i];
end;

function mnLastChar (const Ch: Char; const S: string): Integer;
begin
  for Result := Length(S) downto 1 do
    if (ByteType(S, Result) = mbSingleByte) and (S[Result] = Ch) then Exit;
  Result := 0;
end;

function mnFirstChar(const Ch: Char; const S: string): Integer;
begin
  for Result := 1 to Length(S) do
    if (ByteType(S, Result) = mbSingleByte) and (S[Result] = Ch) then Exit;
  Result := 0;
end;

function mnLastDelimiter (const Delimiters, S: string): Integer;
var
  P: PChar;
begin
  P := PChar(Delimiters);
  for Result := Length(S) downto 1 do
    if (ByteType(S, Result) = mbSingleByte) and (StrScan(P, S[Result]) <> nil) then Exit;
  Result := 0;
end;

function mnFirstDelimiter(const Delimiters, S: string): Integer;
var
  P: PChar;
begin
  P := PChar(Delimiters);
  for Result := 1 to Length(S) do
    if (ByteType(S, Result) = mbSingleByte) and (StrScan(P, S[Result]) <> nil) then Exit;
  Result := 0;
end;

function mnLastPos    (const Substr, S: string): Integer;
begin
  Result := Pos(ReverseString(Substr), ReverseString(S));
  if Result > 0 then Result := Length(S) - Length(Substr) - Result + 2;
end;

function mnAnsiLastPos(const Substr, S: string): Integer;
begin
  Result := AnsiPos(ReverseString(Substr), ReverseString(S));
  if Result > 0 then Result := Length(S) - Length(Substr) - Result + 2;
end;

function mnAnsiPosEx(const SubStr, S: string; Offset: Integer = 1): Integer;
begin
  if (Offset < 1) or (Offset > Length(S)) then
    Result := 0
  else if Offset = 1 then
    Result := AnsiPos(SubStr, S)
  else
  begin
    mnCreateErrorIf(ByteType(S, Offset) = mbTrailByte, SAnsiPosOffsetOnTrailByte, [Offset, S]);
    Result := AnsiPos(SubStr, Copy(S, Offset));
    if Result <> 0 then Result := Result + Offset - 1;
  end;
end;

function mnSettleByte(const S: string; const Index: Integer): Integer;
begin
  if ByteType(S, Index) = mbLeadByte then
    Result := Index + 1
  else
    Result := Index;
end;

function mnIsASCIIChar(const Ch: Char): Boolean; inline;
begin
  Result := Ord(Ch) < 128;
end;

function mnIsASCIIStr(const S: string): Boolean;
var
  ch: Char;
begin
  Result := True;
  for ch in S do
    if not mnIsASCIIChar(Ch) then
    begin
      Result := False;
      Exit;
    end;
end;

function mnContainDelimiters(const Delimiters, S: string): Boolean;
var
  ch: Char;
begin
  Result := True;
  for ch in Delimiters do
    if mnFirstChar(ch, S) = 0 then
    begin
      Result := False;
      Exit;
    end;
end;

function mnStartsStr(const SubStr, S: string): Boolean;
begin
  Result := SameStr(SubStr, Copy(S, 1, Length(SubStr)));
end;

function mnEndsStr(const SubStr, S: string): Boolean;
begin
  Result := SameStr(SubStr, Copy(S, Length(S)-Length(SubStr)+1));
end;

function mnStartsStrCount(const SubStr, S: string): Integer;
var
  varS: string;
begin
  if SubStr = '' then
  begin
    Result := 0;
    Exit;
  end;

  varS := S;
  Result := 0;
  while mnStartsStr(SubStr, varS) do
  begin
    varS := Copy(varS, Length(Substr)+1);
    Inc(Result);
  end;
end;

function mnEndsStrCount(const SubStr, S: string): Integer;
var
  varS: string;
begin
  if SubStr = '' then
  begin
    Result := 0;
    Exit;
  end;

  varS := S;
  Result := 0;
  while mnEndsStr(SubStr, varS) do
  begin
    varS := Copy(varS, 1, Length(varS)-Length(Substr));
    Inc(Result);
  end;
end;

function mnInsertStr(const SubStr, S: string; const Index: Integer): string;
begin
  Result := S;
  Insert(Substr, Result, Index);
end;

function mnDeleteStr(const S: string; const Index, Count: Integer): string;
begin
  Result := S;
  Delete(Result, Index, Count);
end;

function mnTruncLeft (const S: string; Count: Integer): string;
begin
  Result := mnTruncBLeft(S, Length(LeftStr(S, Count)));
end;

function mnTruncRight(const S: string; Count: Integer): string;
begin
  Result := mnTruncBRight(S, Length(RightStr(S, Count)));
end;

function mnTruncMiddle(const S: string; Start, Count: Integer): string;
var
  Mid: string;
begin
  mnCreateErrorIf((Start < 1) or (Start > Length(S)), STruncMiddleIndexError, [Start, Length(S)]);
  Mid := MidStr(S, Start, Count);
  Result := Copy(S, 1, Start-1) + Copy(S, Start+Length(Mid));
end;

function mnTruncBLeft (const S: string; Count: Integer): string; inline;
begin
  Result := Copy(S, Count+1);
end;

function mnTruncBRight(const S: string; Count: Integer): string; inline;
begin
  Result := Copy(S, 1, Length(S)-Count);
end;

function mnTruncBMiddle(const S: string; Start, Count: Integer): string;
var
  Mid: string;
begin
  mnCreateErrorIf((Start < 1) or (Start > Length(S)), STruncBMiddleIndexError, [Start, Length(S)]);
  Mid := MidBStr(S, Start, Count);
  Result := Copy(S, 1, Start-1) + Copy(S, Start+Length(Mid));
end;

function mnLeftStrToChar (const Ch: Char; const S: string): string;
var
  i: Integer;
begin
  i := mnFirstChar(Ch, S);
  if i = 0 then
    Result := ''
  else Result := Copy(S, 1, i-1);
end;

function mnRightStrToChar(const Ch: Char; const S: string): string;
var
  i: Integer;
begin
  i := mnLastChar(Ch, S);
  if i = 0 then
    Result := ''
  else Result := Copy(S, i+1);
end;

function mnLeftStrToDelimiter (const Delimiters, S: string): string;
var
  i: Integer;
begin
  i := mnFirstDelimiter(Delimiters, S);
  if i = 0 then
    Result := ''
  else Result := Copy(S, 1, i-1);
end;

function mnRightStrToDelimiter(const Delimiters, S: string): string;
var
  i: Integer;
begin
  i := mnLastDelimiter(Delimiters, S);
  if i = 0 then
    Result := ''
  else Result := Copy(S, i+1);
end;

function mnLeftStrTo     (const Substr, S: string): string;
var
  i: Integer;
begin
  i := Pos(Substr, S);
  if i = 0 then
    Result := ''
  else Result := Copy(S, 1, i-1);
end;

function mnRightStrTo    (const Substr, S: string): string;
var
  i: Integer;
begin
  i := mnLastPos(Substr, S);
  if i = 0 then
    Result := ''
  else Result := Copy(S, i+Length(Substr));
end;

function mnAnsiLeftStrTo (const Substr, S: string): string;
var
  i: Integer;
begin
  i := AnsiPos(Substr, S);
  if i = 0 then
    Result := ''
  else Result := Copy(S, 1, i-1);
end;

function mnAnsiRightStrTo(const Substr, S: string): string;
var
  i: Integer;
begin
  i := mnAnsiLastPos(Substr, S);
  if i = 0 then
    Result := ''
  else Result := Copy(S, i+Length(Substr));
end;

function mnTruncLeftOverChar (const Ch: Char; const S: string): string;
var
  i: Integer;
begin
  i := mnFirstChar(Ch, S);
  if i = 0 then
    Result := S
  else Result := Copy(S, i+1);
end;

function mnTruncRightOverChar(const Ch: Char; const S: string): string;
var
  i: Integer;
begin
  i := mnLastChar(Ch, S);
  if i = 0 then
    Result := S
  else Result := Copy(S, 1, i-1);
end;

function mnTruncLeftOverDelimiter (const Delimiters, S: string): string;
var
  i: Integer;
begin
  i := mnFirstDelimiter(Delimiters, S);
  if i = 0 then
    Result := S
  else Result := Copy(S, i+1);
end;

function mnTruncRightOverDelimiter(const Delimiters, S: string): string;
var
  i: Integer;
begin
  i := mnLastDelimiter(Delimiters, S);
  if i = 0 then
    Result := S
  else Result := Copy(S, 1, i-1);
end;

function mnTruncLeftOver     (const Substr, S: string): string;
var
  i: Integer;
begin
  i := Pos(Substr, S);
  if i = 0 then
    Result := S
  else Result := Copy(S, i+Length(Substr));
end;

function mnTruncRightOver    (const Substr, S: string): string;
var
  i: Integer;
begin
  i := mnLastPos(Substr, S);
  if i = 0 then
    Result := S
  else Result := Copy(S, 1, i-1);
end;

function mnAnsiTruncLeftOver (const Substr, S: string): string;
var
  i: Integer;
begin
  i := AnsiPos(Substr, S);
  if i = 0 then
    Result := S
  else Result := Copy(S, i+Length(Substr));
end;

function mnAnsiTruncRightOver(const Substr, S: string): string;
var
  i: Integer;
begin
  i := mnAnsiLastPos(Substr, S);
  if i = 0 then
    Result := S
  else Result := Copy(S, 1, i-1);
end;

function mnCutLeftByChar (const Ch: Char; var S: string): string;
var
  i: Integer;
begin
  i := mnFirstChar(Ch, S);
  if i = 0 then
  begin
    Result := '';
  end
  else
  begin
    Result := Copy(S, 1, i-1);
    S := Copy(S, i+1);
  end;
end;

function mnCutRightByChar(const Ch: Char; var S: string): string;
var
  i: Integer;
begin
  i := mnLastChar(Ch, S);
  if i = 0 then
  begin
    Result := '';
  end
  else
  begin
    Result := Copy(S, i+1);
    S := Copy(S, 1, i-1);
  end;
end;

function mnCutLeftByDelimiter (const Delimiters: string; var S: string): string;
var
  i: Integer;
begin
  i := mnFirstDelimiter(Delimiters, S);
  if i = 0 then
  begin
    Result := '';
  end
  else
  begin
    Result := Copy(S, 1, i-1);
    S := Copy(S, i+1);
  end;
end;

function mnCutRightByDelimiter(const Delimiters: string; var S: string): string;
var
  i: Integer;
begin
  i := mnLastDelimiter(Delimiters, S);
  if i = 0 then
  begin
    Result := '';
  end
  else
  begin
    Result := Copy(S, i+1);
    S := Copy(S, 1, i-1);
  end;
end;

function mnCutLeftBy     (const Substr: string; var S: string): string;
var
  i: Integer;
begin
  i := Pos(Substr, S);
  if i = 0 then
  begin
    Result := '';
  end
  else
  begin
    Result := Copy(S, 1, i-1);
    S := Copy(S, i+Length(Substr));
  end;
end;

function mnCutRightBy    (const Substr: string; var S: string): string;
var
  i: Integer;
begin
  i := mnLastPos(Substr, S);
  if i = 0 then
  begin
    Result := '';
  end
  else
  begin
    Result := Copy(S, i+Length(Substr));
    S := Copy(S, 1, i-1);
  end;
end;

function mnAnsiCutLeftBy (const Substr: string; var S: string): string;
var
  i: Integer;
begin
  i := AnsiPos(Substr, S);
  if i = 0 then
  begin
    Result := '';
  end
  else
  begin
    Result := Copy(S, 1, i-1);
    S := Copy(S, i+Length(Substr));
  end;
end;

function mnAnsiCutRightBy(const Substr: string; var S: string): string;
var
  i: Integer;
begin
  i := mnAnsiLastPos(Substr, S);
  if i = 0 then
  begin
    Result := '';
  end
  else
  begin
    Result := Copy(S, i+Length(Substr));
    S := Copy(S, 1, i-1);
  end;
end;

function mnRemoveLeftChar (const Ch: Char; const S: string): string;
begin
  if S = '' then
  begin
    Result := '';
    Exit;
  end;
  if S[1] = Ch then
    Result := Copy(S, 2)
  else
    Result := S;
end;

function mnRemoveRightChar(const Ch: Char; const S: string): string;
var
  Len: Integer;
begin
  if S = '' then
  begin
    Result := '';
    Exit;
  end;
  Len := Length(S);
  if S[Len] = Ch then
    Result := Copy(S, 1, Len-1)
  else
    Result := S;
end;

function mnRemoveLeftDelimiter (const Delimiters, S: string): string;
var
  P: PChar;
begin
  if S = '' then
  begin
    Result := '';
    Exit;
  end;
  P := PChar(Delimiters);
  if (ByteType(S, 1) = mbSingleByte) and (StrScan(P, S[1]) <> nil) then
    Result := Copy(S, 2)
  else
    Result := S;
end;

function mnRemoveRightDelimiter(const Delimiters, S: string): string;
var
  P: PChar;
  Len: Integer;
begin
  if S = '' then
  begin
    Result := '';
    Exit;
  end;
  P := PChar(Delimiters);
  Len := Length(S);
  if (ByteType(S, Len) = mbSingleByte) and (StrScan(P, S[Len]) <> nil) then
    Result := Copy(S, 1, Len-1)
  else
    Result := S;
end;

function mnRemoveLeft     (const Substr, S: string): string;
begin
  if S = '' then
  begin
    Result := '';
    Exit;
  end;
  if mnStartsStr(Substr, S) then
    Result := Copy(S, Length(Substr)+1)
  else
    Result := S;
end;

function mnRemoveRight    (const Substr, S: string): string;
begin
  if S = '' then
  begin
    Result := '';
    Exit;
  end;
  if mnEndsStr(Substr, S) then
    Result := Copy(S, 1, Length(S)-Length(Substr))
  else
    Result := S;
end;

function mnAnsiRemoveLeft (const Substr, S: string): string;
begin
  if S = '' then
  begin
    Result := '';
    Exit;
  end;
  if StartsStr(Substr, S) then
    Result := Copy(S, Length(Substr)+1)
  else
    Result := S;
end;

function mnAnsiRemoveRight(const Substr, S: string): string;
begin
  if S = '' then
  begin
    Result := '';
    Exit;
  end;
  if EndsStr(Substr, S) then
    Result := Copy(S, 1, Length(S)-Length(Substr))
  else
    Result := S;
end;

function mnEnsureLeftChar (const Ch: Char; const S: string): string;
begin
  if S = '' then
  begin
    Result := Ch;
    Exit;
  end;
  if S[1] = Ch then
    Result := S
  else
    Result := Ch + S;
end;

function mnEnsureRightChar(const Ch: Char; const S: string): string;
var
  Len: Integer;
begin
  if S = '' then
  begin
    Result := Ch;
    Exit;
  end;
  Len := Length(S);
  if S[Len] = Ch then
    Result := S
  else
    Result := S + Ch;
end;

function mnEnsureLeft     (const Substr, S: string): string;
begin
  if S = '' then
  begin
    Result := Substr;
    Exit;
  end;
  if mnStartsStr(Substr, S) then
    Result := S
  else
    Result := Substr + S;
end;

function mnEnsureRight    (const Substr, S: string): string;
begin
  if S = '' then
  begin
    Result := Substr;
    Exit;
  end;
  if mnEndsStr(Substr, S) then
    Result := S
  else
    Result := S + Substr;
end;

function mnAnsiEnsureLeft (const Substr, S: string): string;
begin
  if S = '' then
  begin
    Result := Substr;
    Exit;
  end;
  if StartsStr(Substr, S) then
    Result := S
  else
    Result := Substr + S;
end;

function mnAnsiEnsureRight(const Substr, S: string): string;
begin
  if S = '' then
  begin
    Result := Substr;
    Exit;
  end;
  if EndsStr(Substr, S) then
    Result := S
  else
    Result := S + Substr;
end;

function mnAppendLeftCharIfNotEmpty (const Ch: Char; const S: string): string;
begin
  if S = '' then
    Result := S
  else
    Result := Ch + S;
end;

function mnAppendRightCharIfNotEmpty(const Ch: Char; const S: string): string;
begin
  if S = '' then
    Result := S
  else
    Result := S + Ch;
end;

function mnAppendLeftIfNotEmpty     (const Substr, S: string): string;
begin
  if S = '' then
    Result := S
  else
    Result := Substr + S;
end;

function mnAppendRightIfNotEmpty    (const Substr, S: string): string;
begin
  if S = '' then
    Result := S
  else
    Result := S + Substr;
end;

function mnCountChar(const Ch: Char; const S: string): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(S) do
    if (ByteType(S, i) = mbSingleByte) and (S[i] = Ch) then Inc(Result);
end;

function mnCountDelimiter(const Delimiters, S: string): Integer;
var
  P: PChar;
  i: Integer;
begin
  P := PChar(Delimiters);
  Result := 0;
  for i := 1 to Length(S) do
    if (ByteType(S, i) = mbSingleByte) and (StrScan(P, S[i]) <> nil) then Inc(Result);
end;

function mnCount(const Substr, S: string): Integer;
var
  Position: Integer;
begin
  Result := 0;
  Position := 1;
  repeat
    Position := PosEx(Substr, S, Position);
    if Position > 0 then
    begin
      Inc(Result);
      Position := Position + Length(Substr);
      if Position > Length(S) then Position := 0;
    end;
  until Position = 0;
end;

function mnAnsiCount(const Substr, S: string): Integer;
var
  Position: Integer;
begin
  Result := 0;
  Position := 1;
  repeat
    Position := mnAnsiPosEx(Substr, S, Position);
    if Position > 0 then
    begin
      Inc(Result);
      Position := Position + Length(Substr);
      if Position > Length(S) then Position := 0;
    end;
  until Position = 0;
end;

function mnDiscardChar(const Ch: Char; const S: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(S) do
  begin
    if (ByteType(S, i) <> mbSingleByte) or (S[i] <> Ch) then Result := Result + S[i];
  end;
end;

function mnDiscardDelimiter(const Delimiters, S: string): string;
var
  P: PChar;
  i: Integer;
begin
  P := PChar(Delimiters);
  Result := '';
  for i := 1 to Length(S) do
  begin
    if (ByteType(S, i) <> mbSingleByte) or (StrScan(P, S[i]) = nil) then Result := Result + S[i];
  end;
end;

function mnDiscard(const Substr, S: string): string;
var
  Position, Offset: Integer;
begin
  Result := '';
  Offset := 1;
  repeat
    Position := PosEx(Substr, S, Offset);
    if Position > 0 then
    begin
      Result := Result + Copy(S, Offset, Position-Offset);
      Offset := Position + Length(Substr);
      if Offset > Length(S) then Position := 0;
    end;
  until Position = 0;
  Result := Result + Copy(S, Offset);
end;

function mnAnsiDiscard(const Substr, S: string): string;
var
  Position, Offset: Integer;
begin
  Result := '';
  Offset := 1;
  repeat
    Position := mnAnsiPosEx(Substr, S, Offset);
    if Position > 0 then
    begin
      Result := Result + Copy(S, Offset, Position-Offset);
      Offset := Position + Length(Substr);
      if Offset > Length(S) then Position := 0;
    end;
  until Position = 0;
  Result := Result + Copy(S, Offset);
end;

function mnShrinkChar(const Ch: Char; const S: string): string;
var
  i: Integer;
begin
  Result := '';
  i := 1;
  while i <= Length(S) do
  begin
    Result := Result + S[i];
    if (ByteType(S, i) = mbSingleByte) and (S[i] = Ch) then
       repeat
         Inc(i);
       until (ByteType(S, i) <> mbSingleByte) or (S[i] <> Ch)
    else Inc(i);
  end;
end;

function mnShrinkDelimiter(const Delimiters, S: string): string;
var
  P: PChar;
  i: Integer;
begin
  P := PChar(Delimiters);
  Result := '';
  i := 1;
  while i <= Length(S) do
  begin
    Result := Result + S[i];
    if (ByteType(S, i) = mbSingleByte) and (StrScan(P, S[i]) <> nil) then
       repeat
         Inc(i);
       until (ByteType(S, i) <> mbSingleByte) or (StrScan(P, S[i]) = nil)
    else Inc(i);
  end;
end;

function mnShrink(const Substr, S: string): string;
var
  Position, Offset: Integer;
begin
  Result := '';
  Offset := 1;
  repeat
    Position := PosEx(Substr, S, Offset);
    if Position > 0 then
    begin
      Result := Result + Copy(S, Offset, Position-Offset+Length(Substr));
      Offset := Position + Length(Substr);
      while Copy(S, Offset, Length(SubStr)) = Substr do Offset := Offset + Length(Substr);
      if Offset > Length(S) then Position := 0;
    end;
  until Position = 0;
  Result := Result + Copy(S, Offset);
end;

function mnAnsiShrink(const Substr, S: string): string;
var
  Position, Offset: Integer;
begin
  Result := '';
  Offset := 1;
  repeat
    Position := mnAnsiPosEx(Substr, S, Offset);
    if Position > 0 then
    begin
      Result := Result + Copy(S, Offset, Position-Offset+Length(Substr));
      Offset := Position + Length(Substr);
      while Copy(S, Offset, Length(SubStr)) = Substr do Offset := Offset + Length(Substr);
      if Offset > Length(S) then Position := 0;
    end;
  until Position = 0;
  Result := Result + Copy(S, Offset);
end;

function mnTrim(const SubStr: string; const S: string): string;
var
  NeedContinue: Boolean;
begin
  Result := S;

  // ��ȥ���
  NeedContinue := True;
  while NeedContinue do
  begin
    NeedContinue := False;
    if mnStartsStr(Substr, Result) then
    begin
      Result := mnTruncBLeft(Result, Length(Substr));
      NeedContinue := True;
    end;
  end;

  // ��ȥ�ұ�
  NeedContinue := True;
  while NeedContinue do
  begin
    NeedContinue := False;
    if mnEndsStr(Substr, Result) then
    begin
      Result := mnTruncBRight(Result, Length(Substr));
      NeedContinue := True;
    end;
  end;
end;

function mnTrimStrs(const SubStrs: array of string; const S: string): string;
var
  NeedContinue: Boolean;
  SubStr: string;
begin
  Result := S;

  // ��ȥ���
  NeedContinue := True;
  while NeedContinue do
  begin
    NeedContinue := False;
    for SubStr in SubStrs do
      if mnStartsStr(Substr, Result) then
      begin
        Result := mnTruncBLeft(Result, Length(Substr));
        NeedContinue := True;
        Break;
      end;
  end;

  // ��ȥ�ұ�
  NeedContinue := True;
  while NeedContinue do
  begin
    NeedContinue := False;
    for SubStr in SubStrs do
      if mnEndsStr(Substr, Result) then
      begin
        Result := mnTruncBRight(Result, Length(Substr));
        NeedContinue := True;
        Break;
      end;
  end;
end;

function mnExpandLeft (const S: string; const NewLength: Integer; const FillingChar: Char): string;
begin
  Result := StringOfChar(FillingChar, NewLength-Length(S)) + S;
end;

function mnExpandRight(const S: string; const NewLength: Integer; const FillingChar: Char): string;
begin
  Result := S + StringOfChar(FillingChar, NewLength-Length(S));
end;

function mnExpandInt(const Value: Integer; const RequiredLength: Integer; const FillingChar: Char = '0'): string;
begin
  Result := mnExpandLeft(IntToStr(Value), RequiredLength, FillingChar);
end;

function mnCompareStr(SMajor, SMinor: string; const Options: mnTStrComparisonOptions; const ResultWhenMinorIsEmpty: Boolean = True): Boolean;
begin
  if SMinor = '' then
  begin
    Result := ResultWhenMinorIsEmpty;
    Exit;
  end;

  if not (scoCaseSensitive in Options) then
  begin
    SMajor := LowerCase(SMajor);
    SMinor := LowerCase(SMinor);
  end;
  if scoWholeWordOnly in Options then
    Result := SMajor = SMinor
  else
    Result := AnsiPos(SMinor, SMajor) > 0;
end;

function mnCompareStrInNumberStyle(const SA: string; const SB: string): Integer;
var
  IntA, IntB: Integer;
  StrIsIntA, StrIsIntB: Boolean;
begin
  try
    IntA := mnLLStrToInt(SA);
    StrIsIntA := True;
  except
    IntA := 0;
    StrIsIntA := False;
  end;
  try
    IntB := mnLLStrToInt(SB);
    StrIsIntB := True;
  except
    IntB := 0;
    StrIsIntB := False;
  end;

  if StrIsIntA and StrIsIntB then
    Result := mnChooseInt(IntA, IntB, 1, 0, -1)
  else if StrIsIntA then
    Result := -1
  else if StrIsIntB then
    Result := 1
  else
    Result := AnsiCompareStr(SA, SB);
end;

function mnReplaceStr(const S, OldStr, NewStr: string): string;
var
  Position, Offset: Integer;
begin
  Result := '';
  Offset := 1;
  repeat
    Position := PosEx(OldStr, S, Offset);
    if Position > 0 then
    begin
      Result := Result + Copy(S, Offset, Position-Offset) + NewStr;
      Offset := Position + Length(OldStr);
      if Offset > Length(S) then Position := 0;
    end;
  until Position = 0;
  Result := Result + Copy(S, Offset);
end;

function mnReplaceStrWholeWord(const S, OldStr, NewStr: string): string;
var
  Position, Offset: Integer;

  function IsIdChar(const Index: Integer): Boolean;
  begin
    if (Index < 1) or (Index > Length(S)) then
      Result := False
    else
      Result := mnIsLetter(S[Index]) or mnIsDigit(S[Index]) or (S[Index] = '_');
  end;

begin
  Result := '';
  Offset := 1;
  repeat
    Position := PosEx(OldStr, S, Offset);
    if Position > 0 then
    begin
      if (IsIdChar(Position) and IsIdChar(Position-1)) or
        (IsIdChar(Position + Length(OldStr) - 1) and IsIdChar(Position + Length(OldStr))) then
        // not Whole Word, don't replace
        Result := Result + Copy(S, Offset, Position-Offset) + OldStr
      else
        Result := Result + Copy(S, Offset, Position-Offset) + NewStr;
      Offset := Position + Length(OldStr);
      if Offset > Length(S) then Position := 0;
    end;
  until Position = 0;
  Result := Result + Copy(S, Offset);
end;

function mnReplaceStrOnce(const S, OldStr, NewStr: string): string;
var
  Position: Integer;
begin
  Position := Pos(OldStr, S);
  if Position > 0 then
    Result := Copy(S, 1, Position-1) + NewStr + Copy(S, Position+Length(OldStr))
  else
    Result := S;
end;

function mnFindStrBetween    (const S, SubstrHead, SubstrTail: string; var SubstrBeginPos, SubstrEndPos: Integer; var SubstrBody: string; Offset: Integer = 1): Boolean; overload;
var
  HeadPos, TailPos: Integer;
begin
  Result := mnBetweenII(Offset, 1, Length(S));
  if not Result then Exit;

  HeadPos := PosEx(SubstrHead, S, Offset);
  Result := HeadPos <> 0;
  if not Result then Exit;

  TailPos := PosEx(SubstrTail, S, HeadPos + Length(SubstrHead));
  Result := TailPos <> 0;
  if not Result then Exit;

  SubstrBeginPos := HeadPos;
  SubstrEndPos := TailPos + Length(SubstrTail);
  SubstrBody := Copy(S, HeadPos + Length(SubstrHead), TailPos - HeadPos - Length(SubstrHead));
end;

function mnFindStrBetween    (const S, SubstrHead, SubstrTail: string;                                            var SubstrBody: string; Offset: Integer = 1): Boolean; overload;
var
  SubstrBeginPos, SubstrEndPos: Integer;
begin
  Result := mnFindStrBetween(S, SubstrHead, SubstrTail, SubstrBeginPos, SubstrEndPos, SubstrBody, Offset);
end;

function mnAnsiFindStrBetween(const S, SubstrHead, SubstrTail: string; var SubstrBeginPos, SubstrEndPos: Integer; var SubstrBody: string; Offset: Integer = 1): Boolean; overload;
var
  HeadPos, TailPos: Integer;
begin
  Result := mnBetweenII(Offset, 1, Length(S));
  if not Result then Exit;

  HeadPos := mnAnsiPosEx(SubstrHead, S, Offset);
  Result := HeadPos <> 0;
  if not Result then Exit;

  TailPos := mnAnsiPosEx(SubstrTail, S, HeadPos + Length(SubstrHead));
  Result := TailPos <> 0;
  if not Result then Exit;

  SubstrBeginPos := HeadPos;
  SubstrEndPos := TailPos + Length(SubstrTail);
  SubstrBody := Copy(S, HeadPos + Length(SubstrHead), TailPos - HeadPos - Length(SubstrHead));
end;

function mnAnsiFindStrBetween(const S, SubstrHead, SubstrTail: string;                                            var SubstrBody: string; Offset: Integer = 1): Boolean; overload;
var
  SubstrBeginPos, SubstrEndPos: Integer;
begin
  Result := mnAnsiFindStrBetween(S, SubstrHead, SubstrTail, SubstrBeginPos, SubstrEndPos, SubstrBody, Offset);
end;

function mnReplaceStrBetween    (const S, SubstrHead, SubstrTail, NewStr: string): string; overload;
var
  Position, SubstrBeginPos, SubstrEndPos: Integer;
  SubStrBody: string;
  SubstrFound: Boolean;
begin
  Result := '';
  Position := 1;
  repeat
    SubstrFound := mnFindStrBetween(S, SubstrHead, SubstrTail, SubstrBeginPos, SubstrEndPos, SubStrBody, Position);
    if SubstrFound then
    begin
      Result := Result + Copy(S, Position, SubstrBeginPos-Position) + NewStr;
      Position := SubstrEndPos;
    end
    else Result := Result + Copy(S, Position);
  until not SubstrFound;
end;

function mnReplaceStrBetween    (const S, SubstrHead, SubstrTail: string; NameValuePairs: TStrings): string; overload;
var
  Position, SubstrBeginPos, SubstrEndPos: Integer;
  SubStrBody: string;
  SubstrFound: Boolean;
begin
  Result := '';
  Position := 1;
  repeat
    SubstrFound := mnFindStrBetween(S, SubstrHead, SubstrTail, SubstrBeginPos, SubstrEndPos, SubStrBody, Position);
    if SubstrFound then
    begin
      Result := Result + Copy(S, Position, SubstrBeginPos-Position) + NameValuePairs.Values[SubStrBody];;
      Position := SubstrEndPos;
    end
    else Result := Result + Copy(S, Position);
  until not SubstrFound;
end;

function mnReplaceStrBetween    (const S,                         NewStr: string): string; overload;
begin
  Result := mnReplaceStrBetween(S, mnStdSeparator1, mnStdSeparator1, NewStr);
end;

function mnReplaceStrBetween    (const S:                         string; NameValuePairs: TStrings): string; overload;
begin
  Result := mnReplaceStrBetween(S, mnStdSeparator1, mnStdSeparator1, NameValuePairs);
end;

function mnAnsiReplaceStrBetween(const S, SubstrHead, SubstrTail, NewStr: string): string; overload;
var
  Position, SubstrBeginPos, SubstrEndPos: Integer;
  SubStrBody: string;
  SubstrFound: Boolean;
begin
  Result := '';
  Position := 1;
  repeat
    SubstrFound := mnAnsiFindStrBetween(S, SubstrHead, SubstrTail, SubstrBeginPos, SubstrEndPos, SubStrBody, Position);
    if SubstrFound then
    begin
      Result := Result + Copy(S, Position, SubstrBeginPos-Position) + NewStr;
      Position := SubstrEndPos;
    end
    else Result := Result + Copy(S, Position);
  until not SubstrFound;
end;

function mnAnsiReplaceStrBetween(const S, SubstrHead, SubstrTail: string; NameValuePairs: TStrings): string; overload;
var
  Position, SubstrBeginPos, SubstrEndPos: Integer;
  SubStrBody: string;
  SubstrFound: Boolean;
begin
  Result := '';
  Position := 1;
  repeat
    SubstrFound := mnAnsiFindStrBetween(S, SubstrHead, SubstrTail, SubstrBeginPos, SubstrEndPos, SubStrBody, Position);
    if SubstrFound then
    begin
      Result := Result + Copy(S, Position, SubstrBeginPos-Position) + NameValuePairs.Values[SubStrBody];;
      Position := SubstrEndPos;
    end
    else Result := Result + Copy(S, Position);
  until not SubstrFound;
end;

function mnAnsiReplaceStrBetween(const S,                         NewStr: string): string; overload;
begin
  Result := mnAnsiReplaceStrBetween(S, mnStdSeparator1, mnStdSeparator1, NewStr);
end;

function mnAnsiReplaceStrBetween(const S:                         string; NameValuePairs: TStrings): string; overload;
begin
  Result := mnAnsiReplaceStrBetween(S, mnStdSeparator1, mnStdSeparator1, NameValuePairs);
end;

function mnCombine(const Strs: array of string;                        const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;
var
  i: Integer;
begin
  Result := '';
  for i := Low(Strs) to High(Strs) do
  begin
    if i <> Low(Strs) then Result := Result + Connector;
    Result := Result + Strs[i];
  end;
  if HasBorder then Result := Connector + Result + Connector;
end;

function mnCombine(Strs: TStrings;                                     const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Strs.Count-1 do
  begin
    if i <> 0 then Result := Result + Connector;
    Result := Result + Strs[i];
  end;
  if HasBorder then Result := Connector + Result + Connector;
end;

function mnCombine(DataSet: TDataSet; const FieldName: string;         const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;
begin
  Result := '';
  while not DataSet.Eof do
  begin
    if Result <> '' then Result := Result + Connector;
    Result := Result + DataSet.FieldByName(FieldName).AsString;
    DataSet.Next;
  end;
  if HasBorder then Result := Connector + Result + Connector;
end;

function mnCombine(Fields: TFields; FieldNames: mnTFieldNames;         const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;
var
  StrsFieldNames: mnTStrList;
begin
  StrsFieldNames := mnTStrList.Create;
  try
    mnSplitFieldNames(FieldNames, StrsFieldNames);
    Result := mnCombine(Fields, StrsFieldNames, Connector, HasBorder);
  finally
    StrsFieldNames.Free;
  end;
end;

function mnCombine(Fields: TFields; FieldNames: TStrings;              const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to FieldNames.Count-1 do
  begin
    if i <> 0 then Result := Result + Connector;
    Result := Result + Fields.FieldByName(FieldNames[i]).AsString;
  end;
  if HasBorder then Result := Connector + Result + Connector;
end;

function mnCombine(Fields: TFields; const FieldNames: array of string; const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;
var
  i: Integer;
begin
  Result := '';
  for i := Low(FieldNames) to High(FieldNames) do
  begin
    if i <> Low(FieldNames) then Result := Result + Connector;
    Result := Result + Fields.FieldByName(FieldNames[i]).AsString;
  end;
  if HasBorder then Result := Connector + Result + Connector;
end;

function mnSplit    (const S: string; OutSplittedStrs: TStrings; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
var
  varS: string;
begin
  varS := S;
  if HasBorder then
  begin
    mnCreateErrorIf(not mnStartsStr(Separator, S) or not mnEndsStr(Separator, S), SSplitWithoutBorder, [S]);
    varS := Copy(varS, Length(Separator)+1, Length(varS)-2*Length(Separator));
  end;

  Result := 0;
  repeat
    if Pos(Separator, varS) = 0 then
    begin
      OutSplittedStrs.Append(varS);
      Inc(Result);
      Exit;
    end
    else
    begin
      OutSplittedStrs.Append(mnCutLeftBy(Separator, varS));
      Inc(Result);
    end;
  until False;
end;

function mnAnsiSplit(const S: string; OutSplittedStrs: TStrings; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
var
  varS: string;
begin
  varS := S;
  if HasBorder then
  begin
    mnCreateErrorIf(not AnsiStartsStr(Separator, S) or not AnsiEndsStr(Separator, S), SSplitWithoutBorder, [S]);
    varS := Copy(varS, Length(Separator)+1, Length(varS)-2*Length(Separator));
  end;

  Result := 0;
  repeat
    if AnsiPos(Separator, varS) = 0 then
    begin
      OutSplittedStrs.Append(varS);
      Inc(Result);
      Exit;
    end
    else
    begin
      OutSplittedStrs.Append(mnAnsiCutLeftBy(Separator, varS));
      Inc(Result);
    end;
  until False;
end;

function mnSplitBetween    (const S: string; OutSplittedStrs: TStrings; OutSeparatorBodies: TStrings; const SeparatorHead, SeparatorTail: string): Integer;
var
  CurrPos, SeparatorBeginPos, SeparatorEndPos: Integer;
  SubStrBody: string;
  SeparatorFound: Boolean;
begin
  Result := 1;
  CurrPos := 1;
  repeat
    SeparatorFound := mnFindStrBetween(S, SeparatorHead, SeparatorTail, SeparatorBeginPos, SeparatorEndPos, SubStrBody, CurrPos);
    if SeparatorFound then
    begin
      OutSplittedStrs.Append(Copy(S, CurrPos, SeparatorBeginPos-CurrPos));
      OutSeparatorBodies.Append(SubStrBody);
      CurrPos := SeparatorEndPos;
      Inc(Result);
    end
    else OutSplittedStrs.Append(Copy(S, CurrPos));
  until not SeparatorFound;
end;

function mnAnsiSplitBetween(const S: string; OutSplittedStrs: TStrings; OutSeparatorBodies: TStrings; const SeparatorHead, SeparatorTail: string): Integer;
var
  CurrPos, SeparatorBeginPos, SeparatorEndPos: Integer;
  SubStrBody: string;
  SeparatorFound: Boolean;
begin
  Result := 1;
  CurrPos := 1;
  repeat
    SeparatorFound := mnAnsiFindStrBetween(S, SeparatorHead, SeparatorTail, SeparatorBeginPos, SeparatorEndPos, SubStrBody, CurrPos);
    if SeparatorFound then
    begin
      OutSplittedStrs.Append(Copy(S, CurrPos, SeparatorBeginPos-CurrPos));
      OutSeparatorBodies.Append(SubStrBody);
      CurrPos := SeparatorEndPos;
      Inc(Result);
    end
    else OutSplittedStrs.Append(Copy(S, CurrPos));
  until not SeparatorFound;
end;

function mnSplitByLen(const S: string; OutSplittedStrs: TStrings; const SplittedLen: Integer): Integer;
var
  i: Integer;
begin
  mnCreateErrorIf(SplittedLen <= 0, SSplittedLenNegative, [SplittedLen]);
  Result := (Length(S)-1) div SplittedLen + 1;
  for i := 1 to Result do
    OutSplittedStrs.Add(MidBStr(S, (i-1)*SplittedLen+1, SplittedLen));
end;

{ mnTStringPattern }

procedure mnTStringPattern.SetPattern(const Value: string);
begin
  FPattern := Value;
  FPatternSections.Clear;
  FPatternParams.Clear;
  FPatternParsed := False;
end;

procedure mnTStringPattern.ParsePattern;
begin
  if not FPatternParsed then
  begin
    mnSplitBetween(FPattern, FPatternSections, FPatternParams, FParamHead, FParamTail);
    FPatternParsed := True;
  end;
end;

procedure mnTStringPattern.AnsiParsePattern;
begin
  if not FPatternParsed then
  begin
    mnAnsiSplitBetween(FPattern, FPatternSections, FPatternParams, FParamHead, FParamTail);
    FPatternParsed := True;
  end;
end;

procedure mnTStringPattern.LoadPatternFromFile(const FileName: string);
begin
  Pattern := mnLoadStrFromFile(FileName);
end;

function mnTStringPattern.GetParamValue(ParamName: string): string;
begin
  Result := FParamPairs.Values[ParamName];
end;

function mnTStringPattern.GetParamValueAsInt(ParamName: string): Integer;
begin
  Result := StrToInt(FParamPairs.Values[ParamName]);
end;

function mnTStringPattern.GetParamValueAsFloat(ParamName: string): Extended;
begin
  Result := StrToFloat(FParamPairs.Values[ParamName]);
end;

function mnTStringPattern.GetParamValueAsDT(ParamName: string): TDateTime;
begin
  Result := StrToDateTime(FParamPairs.Values[ParamName]);
end;

function mnTStringPattern.GetParamValueAsCurr(ParamName: string): Currency;
begin
  Result := StrToCurr(FParamPairs.Values[ParamName]);
end;

procedure mnTStringPattern.ClearParamPairs;
begin
  FParamPairs.Clear;
end;

constructor mnTStringPattern.Create;
begin
  FPattern := '';
  FPatternSections := mnTStrList.Create;
  FPatternParams := mnTStrList.Create;
  FPatternParsed := False;

  FParamHead := mnStdSeparator1;
  FParamTail := mnStdSeparator1;
  FIgnoreUnnamedParams := True;
  FAutoClearPairs := True;

  FWorkStr := '';
  FParamPairs := mnTStrList.Create;
end;

destructor mnTStringPattern.Destroy;
begin
  FPatternSections.Free;
  FPatternParams.Free;
  FParamPairs.Free;
  inherited;
end;

function mnTStringPattern.Match(const S: string): Boolean;
var
  varS: string;
  FirstSection, LastSection: string;
  Pairs: mnTStrList;
  ParamValue: string;
  i: Integer;
begin
  ParsePattern;
  Result := False;
  FWorkStr := S;
  varS := S;

  // no parameters
  if FPatternParams.Count = 0 then
  begin
    Result := S = FPattern;
    if Result then FParamPairs.Clear;
    Exit;
  end;

  // check first section
  FirstSection := FPatternSections.First;
  if FirstSection <> '' then
    if mnStartsStr(FirstSection, varS) then
      varS := mnTruncBLeft(varS, Length(FirstSection))
    else Exit;

  // check last section
  LastSection := FPatternSections.Last;
  if LastSection <> '' then
    if mnEndsStr(LastSection, varS) then
      varS := mnTruncBRight(varS, Length(LastSection))
    else Exit;

  Pairs := mnTStrList.Create;
  try
    for i := 1 to FPatternSections.Count-2 do
    begin
      // check each section
      mnCreateErrorIf(FPatternSections[i] = '', SContinuousTwoParams, [FPattern]);
      if Pos(FPatternSections[i], varS) = 0 then Exit;
      ParamValue := mnCutLeftBy(FPatternSections[i], varS);
      if not FIgnoreUnnamedParams or (FPatternParams[i-1] <> '') then
        Pairs.Append(FPatternParams[i-1] + '=' + ParamValue);
    end;
    if not FIgnoreUnnamedParams or (FPatternParams.Last <> '') then
      Pairs.Append(FPatternParams.Last + '=' + varS);

    if FAutoClearPairs then FParamPairs.Clear;
    FParamPairs.AddStrings(Pairs);
    Result := True;
  finally
    Pairs.Free;
  end;
end;

function mnTStringPattern.AnsiMatch(const S: string): Boolean;
var
  varS: string;
  FirstSection, LastSection: string;
  Pairs: mnTStrList;
  ParamValue: string;
  i: Integer;
begin
  AnsiParsePattern;
  Result := False;
  FWorkStr := S;
  varS := S;

  // no parameters
  if FPatternParams.Count = 0 then
  begin
    Result := S = FPattern;
    if Result then FParamPairs.Clear;
    Exit;
  end;

  // check first section
  FirstSection := FPatternSections.First;
  if FirstSection <> '' then
    if AnsiStartsStr(FirstSection, varS) then
      varS := mnTruncBLeft(varS, Length(FirstSection))
    else Exit;

  // check last section
  LastSection := FPatternSections.Last;
  if LastSection <> '' then
    if AnsiEndsStr(LastSection, varS) then
      varS := mnTruncBRight(varS, Length(LastSection))
    else Exit;

  Pairs := mnTStrList.Create;
  try
    for i := 1 to FPatternSections.Count-2 do
    begin
      // check each section
      mnCreateErrorIf(FPatternSections[i] = '', SContinuousTwoParams, [FPattern]);
      if AnsiPos(FPatternSections[i], varS) = 0 then Exit;
      ParamValue := mnAnsiCutLeftBy(FPatternSections[i], varS);
      if not FIgnoreUnnamedParams or (FPatternParams[i-1] <> '') then
        Pairs.Append(FPatternParams[i-1] + '=' + ParamValue);
    end;
    if not FIgnoreUnnamedParams or (FPatternParams.Last <> '') then
      Pairs.Append(FPatternParams.Last + '=' + varS);

    if FAutoClearPairs then FParamPairs.Clear;
    FParamPairs.AddStrings(Pairs);
    Result := True;
  finally
    Pairs.Free;
  end;
end;

function mnTStringPattern.MatchSub(const S: string; const Offset: Integer): Boolean;
var
  varS: string;
  FirstSection, LastSection: string;
  Pairs: mnTStrList;
  ParamValue: string;
  i: Integer;
  BeginPos, EndPos: Integer;
begin
  ParsePattern;
  Result := False;
  FWorkStr := S;
  varS := S;

  // check validity of Offset
  if not mnBetweenII(Offset, 1, Length(S)) then Exit;

  // no parameters
  if FPatternParams.Count = 0 then
  begin
    BeginPos := PosEx(FPattern, S, Offset);
    EndPos := BeginPos + Length(FPattern);
    Result := BeginPos > 0;
    if Result then
    begin
      FPartBeginPos := BeginPos;
      FPartEndPos := EndPos;
      FParamPairs.Clear;
    end;
    Exit;
  end;

  // locate the first section
  FirstSection := FPatternSections.First;
  if FirstSection = '' then
  begin
    // Offset leads the part
    BeginPos := Offset;
    EndPos := BeginPos;
    varS := Copy(varS, EndPos);
  end
  else
  begin
    // find the first section to lead the part
    BeginPos := PosEx(FirstSection, S, Offset);
    EndPos := BeginPos + Length(FirstSection);
    if BeginPos = 0 then Exit;
    varS := Copy(varS, EndPos);
  end;

  Pairs := mnTStrList.Create;
  try
    for i := 1 to FPatternSections.Count-2 do
    begin
      // check each section
      mnCreateErrorIf(FPatternSections[i] = '', SContinuousTwoParams, [FPattern]);
      if Pos(FPatternSections[i], varS) = 0 then Exit;
      ParamValue := mnCutLeftBy(FPatternSections[i], varS);
      if not FIgnoreUnnamedParams or (FPatternParams[i-1] <> '') then
        Pairs.Append(FPatternParams[i-1] + '=' + ParamValue);
      EndPos := EndPos + Length(ParamValue) + Length(FPatternSections[i]);
    end;

    // locate the last section
    LastSection := FPatternSections.Last;
    if LastSection = '' then
    begin
      // all leaving string are value of last param
      EndPos := Length(S) + 1;
      if not IgnoreUnnamedParams or (FPatternParams.Last <> '') then
        Pairs.Append(FPatternParams.Last + '=' + varS);
    end
    else
    begin
      // find the last section to end the part
      if Pos(LastSection, varS) = 0 then Exit;
      ParamValue := mnCutLeftBy(LastSection, varS);
      if not IgnoreUnnamedParams or (FPatternParams.Last <> '') then
        Pairs.Append(FPatternParams.Last + '=' + ParamValue);
      EndPos := EndPos + Length(ParamValue) + Length(LastSection);
    end;

    if FAutoClearPairs then FParamPairs.Clear;
    FParamPairs.AddStrings(Pairs);
    FPartBeginPos := BeginPos;
    FPartEndPos := EndPos;
    Result := True;
  finally
    Pairs.Free;
  end;
end;

function mnTStringPattern.AnsiMatchSub(const S: string; const Offset: Integer): Boolean;
var
  varS: string;
  FirstSection, LastSection: string;
  Pairs: mnTStrList;
  ParamValue: string;
  i: Integer;
  BeginPos, EndPos: Integer;
begin
  AnsiParsePattern;
  Result := False;
  FWorkStr := S;
  varS := S;

  // check validity of Offset
  if not mnBetweenII(Offset, 1, Length(S)) then Exit;

  // no parameters
  if FPatternParams.Count = 0 then
  begin
    BeginPos := mnAnsiPosEx(FPattern, S, Offset);
    EndPos := BeginPos + Length(FPattern);
    Result := BeginPos > 0;
    if Result then
    begin
      FPartBeginPos := BeginPos;
      FPartEndPos := EndPos;
      FParamPairs.Clear;
    end;
    Exit;
  end;

  // locate the first section
  FirstSection := FPatternSections.First;
  if FirstSection = '' then
  begin
    // Offset leads the part
    BeginPos := Offset;
    EndPos := BeginPos;
    varS := Copy(varS, EndPos);
  end
  else
  begin
    // find the first section to lead the part
    BeginPos := mnAnsiPosEx(FirstSection, S, Offset);
    EndPos := BeginPos + Length(FirstSection);
    if BeginPos = 0 then Exit;
    varS := Copy(varS, EndPos);
  end;

  Pairs := mnTStrList.Create;
  try
    for i := 1 to FPatternSections.Count-2 do
    begin
      // check each section
      mnCreateErrorIf(FPatternSections[i] = '', SContinuousTwoParams, [FPattern]);
      if AnsiPos(FPatternSections[i], varS) = 0 then Exit;
      ParamValue := mnAnsiCutLeftBy(FPatternSections[i], varS);
      if not FIgnoreUnnamedParams or (FPatternParams[i-1] <> '') then
        Pairs.Append(FPatternParams[i-1] + '=' + ParamValue);
      EndPos := EndPos + Length(ParamValue) + Length(FPatternSections[i]);
    end;

    // locate the last section
    LastSection := FPatternSections.Last;
    if LastSection = '' then
    begin
      // all leaving string are value of last param
      EndPos := Length(S) + 1;
      if not IgnoreUnnamedParams or (FPatternParams.Last <> '') then
        Pairs.Append(FPatternParams.Last + '=' + varS);
    end
    else
    begin
      // find the last section to end the part
      if AnsiPos(LastSection, varS) = 0 then Exit;
      ParamValue := mnAnsiCutLeftBy(LastSection, varS);
      if not IgnoreUnnamedParams or (FPatternParams.Last <> '') then
        Pairs.Append(FPatternParams.Last + '=' + ParamValue);
      EndPos := EndPos + Length(ParamValue) + Length(LastSection);
    end;

    if FAutoClearPairs then FParamPairs.Clear;
    FParamPairs.AddStrings(Pairs);
    FPartBeginPos := BeginPos;
    FPartEndPos := EndPos;
    Result := True;
  finally
    Pairs.Free;
  end;
end;

function mnTStringPattern.MatchNextSub: Boolean;
begin
  Result := MatchSub(FWorkStr, FPartEndPos);
end;

function mnTStringPattern.AnsiMatchNextSub: Boolean;
begin
  Result := AnsiMatchSub(FWorkStr, FPartEndPos);
end;

procedure mnTStringPattern.PrepareSubSequence(const S: string);
begin
  FWorkStr := S;
  FParamPairs.Clear;
  FPartBeginPos := 1;
  FPartEndPos := 1;
end;

function mnTStringPattern.Realize(NameValuePairs: TStrings): string;
var
  i: Integer;
begin
  ParsePattern;
  Result := '';
  for i := 0 to FPatternSections.Count-1 do
  begin
    if i <> 0 then
      Result := Result + NameValuePairs.Values[FPatternParams[i-1]];
    Result := Result + FPatternSections[i];
  end;
end;

function mnTStringPattern.AnsiRealize(NameValuePairs: TStrings): string;
var
  i: Integer;
begin
  AnsiParsePattern;
  Result := '';
  for i := 0 to FPatternSections.Count-1 do
  begin
    if i <> 0 then
      Result := Result + NameValuePairs.Values[FPatternParams[i-1]];
    Result := Result + FPatternSections[i];
  end;
end;

function mnGetTextEncoding(const S: string): mnTTextEncoding;
begin
  if mnStartsStr(mnUnicodeLEBOM, S) then
    Result := teUnicodeLE
  else if mnStartsStr(mnUnicodeBEBOM, S) then
    Result := teUnicodeBE
  else if mnStartsStr(mnUTF8BOM, S) then
    Result := teUTF8
  else
    Result := teAnsi;
end;

function mnExpressWideString(const WS: WideString): string;
var
  WSLen: Integer;
  i: Integer;
begin
  WSLen := Length(WS);
  SetLength(Result, WSLen * SizeOf(WideChar));
  for i := 1 to WSLen do
  begin
    Result[i*2-1] := Chr(Lo(Word(WS[i])));
    Result[i*2]   := Chr(Hi(Word(WS[i])));
  end;
end;

function mnRandomStr      (const Len: Integer; const Candidates: string = ''): string;
var
  i: Integer;
  PResult: PByte;
begin
  SetLength(Result, Len);
  PResult := PByte(Result);
  for i := 1 to Len do
  begin
    if Candidates = '' then
      PResult^ := Random(256)
    else
      PResult^ := Ord(Candidates[Random(Length(Candidates))+1]);
    Inc(PResult);
  end;
end;

function mnRandomDigitStr (const Len: Integer): mnTDigitStr;
var
  i: Integer;
  PResult: PByte;
begin
  SetLength(Result, Len);
  PResult := PByte(Result);
  for i := 1 to Len do
  begin
    PResult^ := mnDigitIntToByte(Random(10));
    Inc(PResult);
  end;
end;

function mnRandomDigletStr(const Len: Integer): mnTDigletStr;
var
  i, r: Integer;
  PResult: PByte;
begin
  SetLength(Result, Len);
  PResult := PByte(Result);
  for i := 1 to Len do
  begin
    r := Random(62);
    if r < 10 then
      PResult^ := mnDigitIntToByte(r)
    else if r < 36 then
      PResult^ := Ord('A') - 10 + r
    else
      PResult^ := Ord('a') - 36 + r;
    Inc(PResult);
  end;
end;

function mnRandomUpperDigletStr(const Len: Integer): mnTDigletStr;
var
  i: Integer;
  PResult: PByte;
begin
  SetLength(Result, Len);
  PResult := PByte(Result);
  for i := 1 to Len do
  begin
    PResult^ := mnDigletIntToByte(Random(36), True);
    Inc(PResult);
  end;
end;

function mnRandomLowerDigletStr(const Len: Integer): mnTDigletStr;
var
  i: Integer;
  PResult: PByte;
begin
  SetLength(Result, Len);
  PResult := PByte(Result);
  for i := 1 to Len do
  begin
    PResult^ := mnDigletIntToByte(Random(36), False);
    Inc(PResult);
  end;
end;

function mnEncodeToDigitStr   (const S: string): mnTDigitStr;
var
  i: Integer;
  PResult: PByte;
  B: Byte;
begin
  SetLength(Result, Length(S) * 3);
  PResult := PByte(Result);
  for i := 1 to Length(S) do
  begin
    B := Ord(S[i]);
    PResult^ := mnDigitIntToByte(B shr 6);
    Inc(PResult);
    PResult^ := mnDigitIntToByte((B shr 3) and $7);
    Inc(PResult);
    PResult^ := mnDigitIntToByte(B and $7);
    Inc(PResult);
  end;
end;

function mnDecodeFromDigitStr (const S: mnTDigitStr): string;
var
  i: Integer;
  PResult, PS: PByte;
begin
  SetLength(Result, Length(S) div 3);
  PResult := PByte(Result);
  PS := PByte(S);
  for i := 1 to Length(Result) do
  begin
    PResult^ := mnByteToDigitInt(PS^);
    Inc(PS);
    PResult^ := (PResult^ shl 3) + mnByteToDigitInt(PS^);
    Inc(PS);
    PResult^ := (PResult^ shl 3) + mnByteToDigitInt(PS^);
    Inc(PS);
    Inc(PResult);
  end;
end;

function mnEncodeToDigletStr  (const S: string; const Capital: Boolean = True): mnTDigletStr;
var
  i: Integer;
  PResult: PByte;
  B: Byte;
begin
  SetLength(Result, Length(S) * 2);
  PResult := PByte(Result);
  for i := 1 to Length(S) do
  begin
    B := Ord(S[i]);
    PResult^ := mnDigletIntToByte(B shr 4, Capital);
    Inc(PResult);
    PResult^ := mnDigletIntToByte(B and $F, Capital);
    Inc(PResult);
  end;
end;

function mnDecodeFromDigletStr(const S: mnTDigletStr): string;
var
  i: Integer;
  PResult, PS: PByte;
  HB, LB: Byte;
begin
  SetLength(Result, Length(S) div 2);
  PResult := PByte(Result);
  PS := PByte(S);
  for i := 1 to Length(Result) do
  begin
    HB := mnByteToDigletInt(PS^);
    Inc(PS);
    LB := mnByteToDigletInt(PS^);
    Inc(PS);
    PResult^ := (HB shl 4) + LB;
    Inc(PResult);
  end;
end;

function mnHideStr      (const S: string; const DisguiseLen: Integer = 4): string;
var
  i: Integer;
  PResult, PS: PByte;
begin
  Result := mnRandomStr(Length(S) * (DisguiseLen + 1) + DisguiseLen);
  PResult := PByte(Result);
  PS := PByte(S);
  for i := 1 to Length(S) do
  begin
    Inc(PResult, DisguiseLen);
    PResult^ := PS^;
    Inc(PResult);
    Inc(PS);
  end;
end;

function mnHideDigitStr (const S: string; const DisguiseLen: Integer = 4): mnTDigitStr;
var
  i: Integer;
  PResult, PS: PByte;
begin
  Result := mnRandomDigitStr(Length(S) * (DisguiseLen + 1) + DisguiseLen);
  PResult := PByte(Result);
  PS := PByte(S);
  for i := 1 to Length(S) do
  begin
    Inc(PResult, DisguiseLen);
    PResult^ := PS^;
    Inc(PResult);
    Inc(PS);
  end;
end;

function mnHideDigletStr(const S: string; const Capital: Boolean = True; const DisguiseLen: Integer = 4): mnTDigletStr;
var
  i: Integer;
  PResult, PS: PByte;
begin
  if Capital then
    Result := mnRandomUpperDigletStr(Length(S) * (DisguiseLen + 1) + DisguiseLen)
  else
    Result := mnRandomLowerDigletStr(Length(S) * (DisguiseLen + 1) + DisguiseLen);
  PResult := PByte(Result);
  PS := PByte(S);
  for i := 1 to Length(S) do
  begin
    Inc(PResult, DisguiseLen);
    PResult^ := PS^;
    Inc(PResult);
    Inc(PS);
  end;
end;

function mnRevealStr    (const S: string; const DisguiseLen: Integer = 4): string;
var
  i: Integer;
  PResult, PS: PByte;
begin
  SetLength(Result, (Length(S) + 1) div (DisguiseLen + 1) - 1);
  PResult := PByte(Result);
  PS := PByte(S);
  for i := 1 to Length(Result) do
  begin
    Inc(PS, DisguiseLen);
    PResult^ := PS^;
    Inc(PS);
    Inc(PResult);
  end;
end;

initialization

  ppPattern := mnTStringPattern.Create;

finalization

  ppPattern.Free;

end.
