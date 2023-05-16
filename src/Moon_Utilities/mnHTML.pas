unit mnHTML;

interface

uses Graphics;

const
{--------------------------------
  HTML转义序列的空格。
 --------------------------------}
  mnHTMLSpace = '&nbsp;';
{--------------------------------
  HTML转义序列的&字符。
 --------------------------------}
  mnHTMLAmpersand = '&amp;';
{--------------------------------
  HTML转义序列的小于号。
 --------------------------------}
  mnHTMLLessThan = '&lt;';
{--------------------------------
  HTML转义序列的大于号。
 --------------------------------}
  mnHTMLGreaterThan = '&gt;';
{--------------------------------
  HTML转义序列的双引号。
 --------------------------------}
  mnHTMLDoubleQuotation = '&quot;';
{--------------------------------
  HTML转义序列的单引号。
 --------------------------------}
  mnHTMLSingleQuotation = '&#39;';

{--------------------------------
  HTML标签的换行符。
 --------------------------------}
  mnHTMLLineBreak = '<br>';

{--------------------------------
  HTML转义序列的多个空格。
  Tested in TestUnit.
 --------------------------------}
function mnHTMLSpaces(const Count: Integer): string;

{--------------------------------
  将普通字符串转换成HTML转义序列。
  Tested in TestUnit.
 --------------------------------}
function mnHTMLEscape(const S: string): string;

{--------------------------------
  HTML标签的多个换行符。
  Tested in TestUnit.
 --------------------------------}
function mnHTMLLineBreaks(const Count: Integer): string;

{--------------------------------
  HTML表示的字体颜色和样式。
  Tested in TestUnit.
 --------------------------------}
function mnHTMLSetFontColor(const S: string; const FontColor: TColor): string;
function mnHTMLSetFontStyle(const S: string; const FontStyle: TFontStyle): string;

{--------------------------------
  生成一个简单的HTML网页。
  Tested in TestUnit.
 --------------------------------}
function mnHTMLSimplePage(const Title, Body: string): string;

{--------------------------------
  移除字符串中的HTML标签。
  Tested in TestUnit.
 --------------------------------}
function mnHTMLRemoveTags(const HTML: string): string;

type
{--------------------------------
  用于编写HTML脚本。
  Tested in TestUnit.
 --------------------------------}
  mnTHTMLWriter = class
  private
    HTML: string;
  private
    FHasNewLine: Boolean;
    FIndent: string;
  public
    // 脚本是否带有换行，缺省为是
    property HasNewLine: Boolean read FHasNewLine write FHasNewLine;
    // 脚本的缩进。缺省为两个空格
    property Indent: string read FIndent write FIndent;
  public
    constructor Create;

    // 输出HTML脚本
    function ToHTML: string;
    // 清除当前已写入的HTML脚本
    procedure Clear;

    // 写文本
    procedure Write(const Text: string);
    // 写换行，取决于脚本是否带有换行的属性
    procedure WriteNewLine;
    // 写缩进，取决于脚本的缩进属性
    procedure WriteIndent;

    // 开始一行。可定义tr的Attributes
    procedure BeginRow(const Attributes: string = '');
    // 结束一行
    procedure EndRow;
    // 开始一个单元格。可定义td的Attributes、ColSpan和RowSpan
    procedure BeginCell(const Attributes: string = ''; const ColSpan: Integer = 1; const RowSpan: Integer = 1);
    // 结束一个单元格
    procedure EndCell;
    // 写一个单元格。等同于开始单元格->写文本->结束单元格
    procedure WriteCell(const Text: string; const Attributes: string = ''; const ColSpan: Integer = 1; const RowSpan: Integer = 1);
  end;

implementation

uses StrUtils, mnString, PerlRegEx, SysUtils, mnSystem;

function mnHTMLSpaces(const Count: Integer): string;
begin
  Result := DupeString(mnHTMLSpace, Count);
end;

function mnHTMLEscape(const S: string): string;
begin
  Result := mnReplaceStr(S,      '&', mnHTMLAmpersand);
  Result := mnReplaceStr(Result, '<', mnHTMLLessThan);
  Result := mnReplaceStr(Result, '>', mnHTMLGreaterThan);
  Result := mnReplaceStr(Result, '"', mnHTMLDoubleQuotation);
  Result := mnReplaceStr(Result, '''', mnHTMLSingleQuotation);
  Result := mnReplaceStr(Result, ' ', mnHTMLSpace);
end;

function mnHTMLLineBreaks(const Count: Integer): string;
begin
  Result := DupeString(mnHTMLLineBreak, Count);
end;

function mnHTMLSetFontColor(const S: string; const FontColor: TColor): string;
var
  FontColorStr: string;
begin
  FontColorStr := IntToHex(FontColor, 6);
  Result := Format('<font color="#%s%s%s">%s</font>',
    [Copy(FontColorStr, 5, 2), Copy(FontColorStr, 3, 2), Copy(FontColorStr, 1, 2), S]);
end;

function mnHTMLSetFontStyle(const S: string; const FontStyle: TFontStyle): string;
begin
  if FontStyle = fsBold then
    Result := '<b>' + S + '</b>'
  else if FontStyle = fsItalic then
    Result := '<i>' + S + '</i>'
  else if FontStyle = fsUnderline then
    Result := '<u>' + S + '</u>'
  else
    Result := S;
end;

const
  SimplePageTemplate =
    '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">' + mnNewLine +
    '<html>' + mnNewLine +
    '<head>' + mnNewLine +
    '<title>```Title```</title>' + mnNewLine +
    '<style>' + mnNewLine +
    'body { font-family:Arial; font-size:14px; line-height:25px; margin:15px; }' + mnNewLine +
    'table { border-collapse:collapse; border:none; }' + mnNewLine +
    'td { border:solid silver 1.0pt; padding:1.0pt 3.0pt 1.0pt 3.0pt; }' + mnNewLine +
    '</style>' + mnNewLine +
    '</head>' + mnNewLine +
    '' + mnNewLine +
    '<body>' + mnNewLine +
    '```Body```' + mnNewLine +
    '</body>' + mnNewLine +
    '</html>' + mnNewLine;

function mnHTMLSimplePage(const Title, Body: string): string;
begin
  Result := mnReplaceStr(SimplePageTemplate, '```Title```', Title);
  Result := mnReplaceStr(Result,             '```Body```', Body);
end;

function mnHTMLRemoveTags(const HTML: string): string;
var
  RegEx: TPerlRegEx;
begin
  RegEx := TPerlRegEx.Create;
  try
    RegEx.Subject := HTML;
    RegEx.RegEx := '<.*?>';
    RegEx.Replacement := '';
    RegEx.ReplaceAll;
    Result := RegEx.Subject;
  finally
    RegEx.Free;
  end;
end;

{ mnTHTMLWriter }

constructor mnTHTMLWriter.Create;
begin
  FHasNewLine := True;
  FIndent := '  ';

  HTML := '';
end;

function mnTHTMLWriter.ToHTML: string;
begin
  Result := HTML;
end;

procedure mnTHTMLWriter.Clear;
begin
  HTML := '';
end;

procedure mnTHTMLWriter.Write(const Text: string);
begin
  HTML := HTML + Text;
end;

procedure mnTHTMLWriter.WriteNewLine;
begin
  if HasNewLine then HTML := HTML + mnNewLine;
end;

procedure mnTHTMLWriter.WriteIndent;
begin
  if Indent <> '' then HTML := HTML + Indent;
end;

procedure mnTHTMLWriter.BeginRow(const Attributes: string = '');
begin
  HTML := HTML + '<tr';
  if Attributes <> '' then HTML := HTML + ' ' + Attributes;
  HTML := HTML + '>';
  WriteNewLine;
end;

procedure mnTHTMLWriter.EndRow;
begin
  HTML := HTML + '</tr>';
  WriteNewLine;
end;

procedure mnTHTMLWriter.BeginCell(const Attributes: string = ''; const ColSpan: Integer = 1; const RowSpan: Integer = 1);
begin
  WriteIndent;
  HTML := HTML + '<td';
  if ColSpan <> 1 then HTML := HTML + Format(' colspan="%d"', [ColSpan]);
  if RowSpan <> 1 then HTML := HTML + Format(' rowspan="%d"', [RowSpan]);
  if Attributes <> '' then HTML := HTML + ' ' + Attributes;
  HTML := HTML + '>';
end;

procedure mnTHTMLWriter.EndCell;
begin
  HTML := HTML + '</td>';
  WriteNewLine;
end;

procedure mnTHTMLWriter.WriteCell(const Text: string; const Attributes: string = ''; const ColSpan: Integer = 1; const RowSpan: Integer = 1);
begin
  BeginCell(Attributes, ColSpan, RowSpan);
  Write(Text);
  EndCell;
end;

end.
