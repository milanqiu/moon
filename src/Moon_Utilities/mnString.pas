unit mnString;

interface

uses Classes, DB, mnSystem;

{--------------------------------
  在半角字符串和全角字符串之间转换。DBC为半角，SBC为全角。
  Tested in TestUnit.
 --------------------------------}
function mnDBCToSBC(const S: string): string;
function mnSBCToDBC(const S: string): string;

{--------------------------------
  查找指定单位在S中的第一次出现或最后一次出现，返回出现的位置。
  支持的单位有：
    - 指定字符
    - 指定Delimiters字符集中的任意字符
    - 指定字符串（此时返回匹配子串的第一个字符的位置）
  对指定单位的查找是大小写敏感的。除不带Ansi的字符串调用外，其余调用都支持MBCS。
  如果指定单位没有出现，返回0。
  注意一：VCL中的标准LastDelimiter函数，在MBCS上存在bug，因此进行了重写。
  注意二：mnFirstPos和mnAnsiFirstPos等同于VCL中的Pos和AnsiPos，故略去。
  Tested in TestUnit.
 --------------------------------}
function mnLastChar (const Ch: Char; const S: string): Integer;
function mnFirstChar(const Ch: Char; const S: string): Integer;
function mnLastDelimiter (const Delimiters, S: string): Integer;
function mnFirstDelimiter(const Delimiters, S: string): Integer;
function mnLastPos    (const Substr, S: string): Integer;
function mnAnsiLastPos(const Substr, S: string): Integer;

{--------------------------------
  从Offset开始，在S中查找指定子串。
  如果没有找到任何SubStr，或Offset小于1，或Offset大于S的长度，返回0。
  同VCL中的标准PosEx函数类似，但支持MBCS。有趣的是，VCL中包含了Pos、PosEx和AnsiPos，仅仅缺少AnsiPosEx。
  Tested in TestUnit.
 --------------------------------}
function mnAnsiPosEx(const SubStr, S: string; Offset: Integer = 1): Integer;

{--------------------------------
  确保字符串中的指定字节没有截断一个双字节字符。
  如果指定字节是双字节字符的首字节，则使之指向其尾字节。
  Tested in TestUnit.
 --------------------------------}
function mnSettleByte(const S: string; const Index: Integer): Integer;

{--------------------------------
  判断一个字符是否是纯ASCII字符，或一个字符串是否所有字符都是纯ASCII字符。
  纯ASCII字符指ASCII值小于128的字符。
  Tested in TestUnit.
 --------------------------------}
function mnIsASCIIChar(const Ch: Char): Boolean; inline;
function mnIsASCIIStr(const S: string): Boolean;

{--------------------------------
  判断指定Delimiters字符集中的所有字符，是否都在S中出现。支持MBCS。
  Tested in TestUnit.
 --------------------------------}
function mnContainDelimiters(const Delimiters, S: string): Boolean;

{--------------------------------
  判断一个字符串是否以指定子串开始，或以指定子串结束。不支持MBCS。
  VCL中的标准StartsStr和EndsStr函数支持MBCS，因此在不需要MBCS的场合会降低效率。
  Tested in TestUnit.
 --------------------------------}
function mnStartsStr(const SubStr, S: string): Boolean;
function mnEndsStr(const SubStr, S: string): Boolean;

{--------------------------------
  统计一个字符串的开始处或结束处，指定子串连续出现的次数。不支持MBCS。
  如果SubStr为空串，返回0。
  Tested in TestUnit.
 --------------------------------}
function mnStartsStrCount(const SubStr, S: string): Integer;
function mnEndsStrCount(const SubStr, S: string): Integer;

{--------------------------------
  将SubStr插入到S的指定位置，插入后，子串第一个字符的位置为Index。和MBCS无关。
  如果Index小于1，则插入到最前面。如果Index大于S的长度，则插入到最后面。
  Tested in TestUnit.
 --------------------------------}
function mnInsertStr(const SubStr, S: string; const Index: Integer): string;
{--------------------------------
  从S中删除第Index个开始的连续Count个字符。和MBCS无关。
  如果Index小于1或大于S的长度，则不进行任何操作。如果Count过长，则删除到字符串末尾为止。
  和mnTruncBMiddle功能相同。
  Tested in TestUnit.
 --------------------------------}
function mnDeleteStr(const S: string; const Index, Count: Integer): string;

{--------------------------------
  截短一个字符串，从左边或右边截去指定长度的子串。支持MBCS。
  如果长度过长，将截去所有内容而最终返回空串。
  Tested in TestUnit.
 --------------------------------}
function mnTruncLeft (const S: string; Count: Integer): string;
function mnTruncRight(const S: string; Count: Integer): string;
{--------------------------------
  截去一个字符串的中间部分、指定长度的子串。支持MBCS。
  如果长度过长，将截到字符串末尾为止。
  如果Start越界，将抛出异常。
  Tested in TestUnit.
 --------------------------------}
function mnTruncMiddle(const S: string; Start, Count: Integer): string;
{--------------------------------
  截短一个字符串，从左边或右边截去指定数量的字节。和MBCS无关。
  如果字节数过多，将截去所有内容而最终返回空串。
  Tested in TestUnit.
 --------------------------------}
function mnTruncBLeft (const S: string; Count: Integer): string; inline;
function mnTruncBRight(const S: string; Count: Integer): string; inline;
{--------------------------------
  截去一个字符串的中间部分、指定数量的字节。和MBCS无关。
  如果长度过长，将截到字符串末尾为止。
  如果Start越界，将抛出异常。
  和mnDeleteStr功能相同。
  Tested in TestUnit.
 --------------------------------}
function mnTruncBMiddle(const S: string; Start, Count: Integer): string;

{--------------------------------
  得到S的子串。方式是，查找指定单位在S中的第一次出现或最后一次出现，返回初秀之前或末日秀之后的子串。
  支持的单位有：
    - 指定字符
    - 指定Delimiters字符集中的任意字符
    - 指定字符串
  对指定单位的查找是大小写敏感的。除不带Ansi的字符串调用外，其余调用都支持MBCS。
  如果指定单位没有出现，返回空串。
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
  截短S。方式是，查找指定单位在S中的第一次出现或最后一次出现，将初秀之前或末日秀之后的子串，连同指定单位一起截去。
  支持的单位有：
    - 指定字符
    - 指定Delimiters字符集中的任意字符
    - 指定字符串
  对指定单位的查找是大小写敏感的。除不带Ansi的字符串调用外，其余调用都支持MBCS。
  如果指定单位没有出现，不截去任何字符，返回S。
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
  截短S并得到其被截去的子串。
  方式是，查找指定单位在S中的第一次出现或最后一次出现，返回初秀之前或末日秀之后的子串，并截短S本身。
  相当于LeftRightStrTo和TruncLeftRightOver的组合。
  支持的单位有：
    - 指定字符
    - 指定Delimiters字符集中的任意字符
    - 指定字符串
  对指定单位的查找是大小写敏感的。除不带Ansi的字符串调用外，其余调用都支持MBCS。
  如果指定单位没有出现，返回空串，同时S不变。
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
  如果S以指定单位开始，或以指定单位结束，则截去指定单位，返回S的剩余部分。否则，直接返回S。
  如果S以连续多个指定单位开始或结束，则只会截去一个指定单位。
  相当于先用StartsEndsStr判断，若满足条件，则使用TruncLeftRightOver。
  支持的单位有：
    - 指定字符
    - 指定Delimiters字符集中的任意字符
    - 指定字符串
  对指定单位的判断是大小写敏感的。除不带Ansi的字符串调用外，其余调用都支持MBCS。
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
  确保S以指定单位开始或结束，即，若S不以指定单位开始或结束，则在S的前面或后面加上指定单位。
  支持的单位有：
    - 指定字符
    - 指定Delimiters字符集中的任意字符
    - 指定字符串
  对指定单位的判断是大小写敏感的。除不带Ansi的字符串调用外，其余调用都支持MBCS。
  Tested in TestUnit.
 --------------------------------}
function mnEnsureLeftChar (const Ch: Char; const S: string): string;
function mnEnsureRightChar(const Ch: Char; const S: string): string;
function mnEnsureLeft     (const Substr, S: string): string;
function mnEnsureRight    (const Substr, S: string): string;
function mnAnsiEnsureLeft (const Substr, S: string): string;
function mnAnsiEnsureRight(const Substr, S: string): string;

{--------------------------------
  如果S不为空，则在开始处或结束处加上指定单位。和MBCS无关。
  支持的单位有：
    - 指定字符
    - 指定字符串
  Tested in TestUnit.
 --------------------------------}
function mnAppendLeftCharIfNotEmpty (const Ch: Char; const S: string): string;
function mnAppendRightCharIfNotEmpty(const Ch: Char; const S: string): string;
function mnAppendLeftIfNotEmpty     (const Substr, S: string): string;
function mnAppendRightIfNotEmpty    (const Substr, S: string): string;

{--------------------------------
  统计在S中指定单位的出现次数。
  支持的单位有：
    - 指定字符
    - 指定Delimiters字符集中的任意字符
    - 指定字符串
  对指定单位的查找是大小写敏感的。除不带Ansi的字符串调用外，其余调用都支持MBCS。
  Tested in TestUnit.
 --------------------------------}
function mnCountChar(const Ch: Char; const S: string): Integer;
function mnCountDelimiter(const Delimiters, S: string): Integer;
function mnCount(const Substr, S: string): Integer;
function mnAnsiCount(const Substr, S: string): Integer;

{--------------------------------
  删去S中所有的指定单位。
  支持的单位有：
    - 指定字符
    - 指定Delimiters字符集中的任意字符
    - 指定字符串
  对指定单位的查找是大小写敏感的。除不带Ansi的字符串调用外，其余调用都支持MBCS。
  Tested in TestUnit.
 --------------------------------}
function mnDiscardChar(const Ch: Char; const S: string): string;
function mnDiscardDelimiter(const Delimiters, S: string): string;
function mnDiscard(const Substr, S: string): string;
function mnAnsiDiscard(const Substr, S: string): string;

{--------------------------------
  在S中，所有的指定单位如果连续出现，删去多余的，仅保留一份。
  非连续出现的子串全部保留。
  支持的单位有：
    - 指定字符
    - 指定Delimiters字符集中的任意字符（字符集中不同字符的连续出现也会被处理）
    - 指定字符串
  对指定单位的查找是大小写敏感的。除不带Ansi的字符串调用外，其余调用都支持MBCS。
  Tested in TestUnit.
 --------------------------------}
function mnShrinkChar(const Ch: Char; const S: string): string;
function mnShrinkDelimiter(const Delimiters, S: string): string;
function mnShrink(const Substr, S: string): string;
function mnAnsiShrink(const Substr, S: string): string;

{--------------------------------
  在S中，截去左边和右边所有的指定单位。
  支持的单位有：
    - 指定字符串
    - 指定字符串数组中的任意字符串
  对指定单位的匹配是大小写敏感的。不支持MBCS。
  Tested in TestUnit.
 --------------------------------}
function mnTrim(const SubStr: string; const S: string): string;
function mnTrimStrs(const SubStrs: array of string; const S: string): string;

{--------------------------------
  将S往左或往右扩展到新的长度，不足的位置用FillingChar补齐。
  Tested in TestUnit.
 --------------------------------}
function mnExpandLeft (const S: string; const NewLength: Integer; const FillingChar: Char): string;
function mnExpandRight(const S: string; const NewLength: Integer; const FillingChar: Char): string;
{--------------------------------
  将一个整数扩展成需要的长度，不足的位置在前面缺省用0补齐。
  Tested in TestUnit.
 --------------------------------}
function mnExpandInt(const Value: Integer; const RequiredLength: Integer; const FillingChar: Char = '0'): string;

type
{--------------------------------
  用于调用mnCompareStr函数时传入参数，以指定比较方式。
    scoCaseSensitive：大小写敏感。
    scoWholeWordOnly：整词匹配。
 --------------------------------}
  mnTStrComparisonOption = (scoCaseSensitive, scoWholeWordOnly);
  mnTStrComparisonOptions = set of mnTStrComparisonOption;

{--------------------------------
  比较两个字符串，可传入是否大小写敏感或整词匹配的设置。
  如果非整词匹配，则使用SMajor作为主串，SMinor作为子串。
  ResultWhenMinorIsEmpty表示当子串为空串时，如何返回。
  Tested in TestUnit.
 --------------------------------}
function mnCompareStr(SMajor, SMinor: string; const Options: mnTStrComparisonOptions; const ResultWhenMinorIsEmpty: Boolean = True): Boolean;

{--------------------------------
  以数字方式比较两个字符串。
  如果A>B，返回值>0。如果A=B，返回值=0。如果A<B，返回值<0。
  以数字方式是指，将字符串左边尽可能多的字符转换为整数，并对整数进行比较。（不支持负数）
  如果某一字符串左边没有数字，则它大于另一有数字的字符串。
  如果两个字符串左边都没有数字，则使用普通的字符串比较AnsiCompareStr。
  Tested in TestUnit.
 --------------------------------}
function mnCompareStrInNumberStyle(const SA: string; const SB: string): Integer;

{--------------------------------
  在S中查找所有指定子串，并替换成新串。
  该查找是大小写敏感的。
  替换不是递归的。也就是说，如果替换的新串导致了新的子串匹配，这个新匹配不会再被替换。
  VCL中的标准AnsiReplaceStr函数支持MBCS，因此在不需要MBCS的场合会降低效率。
  Tested in TestUnit.
 --------------------------------}
function mnReplaceStr(const S, OldStr, NewStr: string): string;
{--------------------------------
  与mnReplaceStr相似，但使用整字匹配的查找。
  Tested in TestUnit.
 --------------------------------}
function mnReplaceStrWholeWord(const S, OldStr, NewStr: string): string;
{--------------------------------
  与mnReplaceStr相似，但只替换指定子串的第一次出现。
  VCL中的标准StringReplace函数支持MBCS，因此在不需要MBCS的场合会降低效率。
  Tested in TestUnit.
 --------------------------------}
function mnReplaceStrOnce(const S, OldStr, NewStr: string): string;

{--------------------------------
  从Offset开始，在S中查找以SubstrHead开始、以SubstrTail结尾的子串。
  该查找是大小写敏感的。
  如果Offset没有越界，并且子串能够被找到，返回True。查找失败时返回False，只有Head却没有Tail，也意味着失败。
  当返回True时，SubstrBeginPos返回该子串的起始位置（第一个字符的索引），SubstrEndPos返回该子串的结束位置（最后一个字符的索引加1），
  SubstrBody返回Head和Tail之间的子串内容。
  如果只需要Body而不需要BeginPos和EndPos，可以调用第二种简洁的重载形式。
  Tested in TestUnit.
 --------------------------------}
function mnFindStrBetween    (const S, SubstrHead, SubstrTail: string; var SubstrBeginPos, SubstrEndPos: Integer; var SubstrBody: string; Offset: Integer = 1): Boolean; overload;
function mnFindStrBetween    (const S, SubstrHead, SubstrTail: string;                                            var SubstrBody: string; Offset: Integer = 1): Boolean; overload;
function mnAnsiFindStrBetween(const S, SubstrHead, SubstrTail: string; var SubstrBeginPos, SubstrEndPos: Integer; var SubstrBody: string; Offset: Integer = 1): Boolean; overload;
function mnAnsiFindStrBetween(const S, SubstrHead, SubstrTail: string;                                            var SubstrBody: string; Offset: Integer = 1): Boolean; overload;

{--------------------------------
  在S中查找所有以SubstrHead开始、以SubstrTail结尾的子串，并替换成新串。
  新串的内容可以是指定的固定串，也可以是以原子串的Body为name，从NameValuePairs中查出的value。
  该查找是大小写敏感的。
  替换不是递归的。也就是说，如果替换的新串导致了新的子串匹配，这个新匹配不会再被替换。
  如果没有指定SubstrHead和SubstrTail，则使用mnStdSeparator1作为SubstrHead和SubstrTail。
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
  将一组数据联接成单个字符串。每两个相连的数据元素间，用Connector连接。
  HasBorder表示是否需要在第一个元素前和最后一个元素后放置Connector。
  如果数据组为空，则联接出空串，再根据HasBorder判断是否要在两边放置Connector。
  数据组的来源可以是：
  - 一个静态或动态的字符串数组
  - 一个TStrings变量
  - 一个DataSet中所有记录在指定字段上的值
  - 一个Fields在指定的多个字段上的值
  Tested in TestUnit.
 --------------------------------}
function mnCombine(const Strs: array of string;                        const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;
function mnCombine(Strs: TStrings;                                     const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;
function mnCombine(DataSet: TDataSet; const FieldName: string;         const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;
function mnCombine(Fields: TFields; FieldNames: mnTFieldNames;         const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;
function mnCombine(Fields: TFields; FieldNames: TStrings;              const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;
function mnCombine(Fields: TFields; const FieldNames: array of string; const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;

{--------------------------------
  将单个字符串分割成一组字符串，在每个Separator处进行分割。
  返回分割后的字符串数量。
  HasBorder表示在第一个元素前和最后一个元素后，是否存在Separator。
  分割后的字符串组放在OutSplittedStrs中，但OutSplittedStrs原有的数据不会清空。
  注意：如果原始字符串为空串（除去HasBorder的影响后），则分割后也会得到一个空串，而不是得到零个字符串。
  Tested in TestUnit.
 --------------------------------}
function mnSplit    (const S: string; OutSplittedStrs: TStrings; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;
function mnAnsiSplit(const S: string; OutSplittedStrs: TStrings; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False): Integer;

{--------------------------------
  将一个字符串分割成一组字符串。分隔符不是固定的，而是任意以SeparatorHead开始、以SeparatorTail结尾的子串。
  返回分割后的字符串数量。
  分割后的字符串组放在OutSplittedStrs中，但OutSplittedStrs原有的数据不会清空。
  所有分隔符的Body，也就是Head和Tail之间的内容，存放在OutSeparatorBodies中，但OutSeparatorBodies原有的数据不会被清空。
  注意：如果原始字符串为空串，则分割后也会得到一个空串，而不是得到零个字符串。
  Tested in TestUnit.
 --------------------------------}
function mnSplitBetween    (const S: string; OutSplittedStrs: TStrings; OutSeparatorBodies: TStrings; const SeparatorHead, SeparatorTail: string): Integer;
function mnAnsiSplitBetween(const S: string; OutSplittedStrs: TStrings; OutSeparatorBodies: TStrings; const SeparatorHead, SeparatorTail: string): Integer;

{--------------------------------
  将一个字符串分割成一组字符串，在每个固定的长度处进行分割。和MBCS无关。
  返回分割后的字符串数量。
  分割后的字符串组放在OutSplittedStrs中，但OutSplittedStrs原有的数据不会清空。
  注意：如果原始字符串为空串，则分割后也会得到一个空串，而不是得到零个字符串。
  Tested in TestUnit.
 --------------------------------}
function mnSplitByLen(const S: string; OutSplittedStrs: TStrings; const SplittedLen: Integer): Integer;

{--------------------------------
  字符串模式，可用来匹配字符串，并对符合模式的字符串，从中提取出参数的值。
  模式中允许有0或多个参数，每个参数以ParamHead开始，以ParamTail结尾。Head和Tail之间的Body就是参数名称。
  参数可以匹配任意字符，模式中参数以外的字符，称为固定段，必须精确匹配。
  例如，设ParamHead和ParamTail都是“%”，则“abc%p1%def%p2%gh”表示有名为p1和p2的两个参数的模式，它匹配“abc111def222gh”。
  注意：格式里不能有两个连续的参数，否则系统将无法分清每个参数的值。

  还可用来实现字符串。
  即提供一个NameValuePairs，对每个参数，根据参数名称，从NameValuePairs中查出对应值，替换回模式串里。
  等同于mnReplaceStrBetween和mnAnsiReplaceStrBetween。但在需要多次实现时，由于不用每次都重新解析参数，因而可提高执行效率。
  在某种意义上，实现可看成是匹配的逆向操作，反之亦然。
  注意：在实现时，格式里可以有两个连续的参数，这不会有任何逻辑问题。

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
    // 解析模式到PatternSections和PatternParams。带Ansi的支持MBCS
    procedure ParsePattern;
    procedure AnsiParsePattern;
  public
    // 模式串，用来赋值以定义模式
    property Pattern: string read FPattern write SetPattern;
    // 从模式串中解析出的固定段，用来执行匹配
    property PatternSections: mnTStrList read FPatternSections;
    // 从模式串中解析出的参数，用来执行匹配
    property PatternParams: mnTStrList read FPatternParams;
    // 模式串是否已被解析。新赋值的模式串将在第一次匹配或实现时被解析，这样只要模式串没有改变，一次解析后可用来执行多次匹配或实现
    property PatternParsed: Boolean read FPatternParsed;
    // 将整个文本文件加载为模式
    procedure LoadPatternFromFile(const FileName: string); overload;
  private
    FParamHead: string;
    FParamTail: string;
    FIgnoreUnnamedParams: Boolean;
    FAutoClearPairs: Boolean;
  public
    // 定位参数的开始，缺省为mnStdSeparator1
    property ParamHead: string read FParamHead write FParamHead;
    // 定位参数的结束，缺省为mnStdSeparator1
    property ParamTail: string read FParamTail write FParamTail;
    // 如果为True，则没有名字的参数不会被存入ParamPairs。缺省为True
    property IgnoreUnnamedParams: Boolean read FIgnoreUnnamedParams write FIgnoreUnnamedParams;
    // 如果为True，则在每次匹配前会自动清除原有的ParamPairs，缺省为True
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
    // 在执行一次匹配后，存储匹配对象字符串
    property WorkStr: string read FWorkStr;
    // 在执行一次成功匹配后，每个参数的值会取出，同参数名一起，组成name-value对存入
    property ParamPairs: mnTStrList read FParamPairs;
    // 在执行一次成功匹配后，可以调用这些属性，根据参数名，从ParamPairs里读取不同类型的参数值
    property ParamValue       [ParamName: string]: string    read GetParamValue;
    property ParamValueAsInt  [ParamName: string]: Integer   read GetParamValueAsInt;
    property ParamValueAsFloat[ParamName: string]: Extended  read GetParamValueAsFloat;
    property ParamValueAsDT   [ParamName: string]: TDateTime read GetParamValueAsDT;
    property ParamValueAsCurr [ParamName: string]: Currency  read GetParamValueAsCurr;
    // 在执行一次成功匹配子串后，返回该子串的起始位置（第一个字符的索引）
    property PartBeginPos: Integer read FPartBeginPos;
    // 在执行一次成功匹配子串后，返回该子串的结束位置（最后一个字符的索引加1）
    property PartEndPos: Integer read FPartEndPos;
    // 清除ParamPairs里的所有内容
    procedure ClearParamPairs;
  public
    constructor Create;
    destructor Destroy; override;
  public
    // 匹配一个字符串，返回匹配结果成功或失败。带Ansi的支持MBCS
    function Match(const S: string): Boolean;
    function AnsiMatch(const S: string): Boolean;
    // 从Offset开始，匹配一个字符串的部分子串，返回匹配结果成功或失败。带Ansi的支持MBCS
    function MatchSub(const S: string; const Offset: Integer = 1): Boolean;
    function AnsiMatchSub(const S: string; const Offset: Integer = 1): Boolean;
    // 以上次MatchSub的结束位置作为Offset，继续匹配下一个子串，返回匹配结果成功或失败。带Ansi的支持MBCS
    function MatchNextSub: Boolean;
    function AnsiMatchNextSub: Boolean;
    // 准备开始一个子串序列的匹配，在准备完成后，就可以使用while MatchNextSub do的循环来不断匹配子串
    procedure PrepareSubSequence(const S: string);
  public
    // 从NameValuePairs根据参数名取值，以实现一个字符串。带Ansi的支持MBCS
    function Realize(NameValuePairs: TStrings): string;
    function AnsiRealize(NameValuePairs: TStrings): string;
  end;

var
{--------------------------------
  预先准备好的，已实例化的一个mnTStringPattern变量。在临时需要mnTStringPattern时，可以很方便地调用。
 --------------------------------}
  ppPattern: mnTStringPattern;

type
{--------------------------------
  文本的编码方式，有Ansi、Unicode Little-Endian、Unicode Big-Endian、UTF8等。
 --------------------------------}
  mnTTextEncoding = (teAnsi, teUnicodeLE, teUnicodeBE, teUTF8);

const
{--------------------------------
  表明文本编码方式的头字节。
 --------------------------------}
  mnUnicodeLEBOM = #$FF#$FE;
  mnUnicodeBEBOM = #$FE#$FF;
  mnUTF8BOM = #$EF#$BB#$BF;

{--------------------------------
  根据头字节，得到文本的编码方式。
  Tested in TestUnit.
 --------------------------------}
function mnGetTextEncoding(const S: string): mnTTextEncoding;

{--------------------------------
  以string形式表达WideString。
  与直接将WideString赋值给string不同的是，本函数不处理任何编码转换，
  而仅仅是将WideString的每个字节逐一变成string的每个字节。
  Tested in TestUnit.
 --------------------------------}
function mnExpressWideString(const WS: WideString): string;

type
{--------------------------------
  特殊的字符串：所有字符全都是数字。
 --------------------------------}
  mnTDigitStr = string;
{--------------------------------
  特殊的字符串：所有字符全都是字母或数字。
 --------------------------------}
  mnTDigletStr = string;

{--------------------------------
  生成一个长度指定、内容随机的字符串。
  mnRandomStr：内容在Candidates字符串中随机选择。若Candidates为空串，则在任意字符中随机选择。
  mnRandomDigitStr：内容在全部数字字符中随机选择。
  mnRandomDigletStr：内容在全部字母加数字字符中随机选择。
  mnRandomUpperDigletStr：内容在全部大写字母加数字字符中随机选择。
  mnRandomLowerDigletStr：内容在全部小写字母加数字字符中随机选择。
  Tested in TestUnit.
 --------------------------------}
function mnRandomStr      (const Len: Integer; const Candidates: string = ''): string;
function mnRandomDigitStr (const Len: Integer): mnTDigitStr;
function mnRandomDigletStr(const Len: Integer): mnTDigletStr;
function mnRandomUpperDigletStr(const Len: Integer): mnTDigletStr;
function mnRandomLowerDigletStr(const Len: Integer): mnTDigletStr;

{--------------------------------
  将普通字符串编码解码成全都是数字的字符串，或全都是字母或数字的字符串。
  Capital指示全都是字母或数字的字符串里，字母使用大写或小写。
  Tested in TestUnit.
 --------------------------------}
function mnEncodeToDigitStr   (const S: string): mnTDigitStr;
function mnDecodeFromDigitStr (const S: mnTDigitStr): string;
function mnEncodeToDigletStr  (const S: string; const Capital: Boolean = True): mnTDigletStr;
function mnDecodeFromDigletStr(const S: mnTDigletStr): string;

{--------------------------------
  在字符串里插入大量随机生成的字符进行隐蔽，每个字符用DisguiseLen个字符来掩饰。
  掩饰字符可以是任意字符，或全部数字字符，或全部字母加数字字符。
  用一个统一的显露函数。
  Capital指示用作掩饰的全部字母加数字字符里，字母使用大写或小写。
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

  // 截去左边
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

  // 截去右边
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

  // 截去左边
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

  // 截去右边
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
