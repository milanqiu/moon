unit mnHTML;

interface

uses Graphics;

const
{--------------------------------
  HTMLת�����еĿո�
 --------------------------------}
  mnHTMLSpace = '&nbsp;';
{--------------------------------
  HTMLת�����е�&�ַ���
 --------------------------------}
  mnHTMLAmpersand = '&amp;';
{--------------------------------
  HTMLת�����е�С�ںš�
 --------------------------------}
  mnHTMLLessThan = '&lt;';
{--------------------------------
  HTMLת�����еĴ��ںš�
 --------------------------------}
  mnHTMLGreaterThan = '&gt;';
{--------------------------------
  HTMLת�����е�˫���š�
 --------------------------------}
  mnHTMLDoubleQuotation = '&quot;';
{--------------------------------
  HTMLת�����еĵ����š�
 --------------------------------}
  mnHTMLSingleQuotation = '&#39;';

{--------------------------------
  HTML��ǩ�Ļ��з���
 --------------------------------}
  mnHTMLLineBreak = '<br>';

{--------------------------------
  HTMLת�����еĶ���ո�
  Tested in TestUnit.
 --------------------------------}
function mnHTMLSpaces(const Count: Integer): string;

{--------------------------------
  ����ͨ�ַ���ת����HTMLת�����С�
  Tested in TestUnit.
 --------------------------------}
function mnHTMLEscape(const S: string): string;

{--------------------------------
  HTML��ǩ�Ķ�����з���
  Tested in TestUnit.
 --------------------------------}
function mnHTMLLineBreaks(const Count: Integer): string;

{--------------------------------
  HTML��ʾ��������ɫ����ʽ��
  Tested in TestUnit.
 --------------------------------}
function mnHTMLSetFontColor(const S: string; const FontColor: TColor): string;
function mnHTMLSetFontStyle(const S: string; const FontStyle: TFontStyle): string;

{--------------------------------
  ����һ���򵥵�HTML��ҳ��
  Tested in TestUnit.
 --------------------------------}
function mnHTMLSimplePage(const Title, Body: string): string;

{--------------------------------
  �Ƴ��ַ����е�HTML��ǩ��
  Tested in TestUnit.
 --------------------------------}
function mnHTMLRemoveTags(const HTML: string): string;

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

end.
