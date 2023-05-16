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

type
{--------------------------------
  ���ڱ�дHTML�ű���
  Tested in TestUnit.
 --------------------------------}
  mnTHTMLWriter = class
  private
    HTML: string;
  private
    FHasNewLine: Boolean;
    FIndent: string;
  public
    // �ű��Ƿ���л��У�ȱʡΪ��
    property HasNewLine: Boolean read FHasNewLine write FHasNewLine;
    // �ű���������ȱʡΪ�����ո�
    property Indent: string read FIndent write FIndent;
  public
    constructor Create;

    // ���HTML�ű�
    function ToHTML: string;
    // �����ǰ��д���HTML�ű�
    procedure Clear;

    // д�ı�
    procedure Write(const Text: string);
    // д���У�ȡ���ڽű��Ƿ���л��е�����
    procedure WriteNewLine;
    // д������ȡ���ڽű�����������
    procedure WriteIndent;

    // ��ʼһ�С��ɶ���tr��Attributes
    procedure BeginRow(const Attributes: string = '');
    // ����һ��
    procedure EndRow;
    // ��ʼһ����Ԫ�񡣿ɶ���td��Attributes��ColSpan��RowSpan
    procedure BeginCell(const Attributes: string = ''; const ColSpan: Integer = 1; const RowSpan: Integer = 1);
    // ����һ����Ԫ��
    procedure EndCell;
    // дһ����Ԫ�񡣵�ͬ�ڿ�ʼ��Ԫ��->д�ı�->������Ԫ��
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
