unit mnHTMLTestCase;
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
  TmnHTMLTestCase = class(TTestCase)
  strict private
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure testHTMLSpaces;
    procedure testHTMLEscape;
    procedure testHTMLLineBreaks;
    procedure testHTMLSetFontColor;
    procedure testHTMLSetFontStyle;
    procedure testHTMLSimplePage;
    procedure testHTMLRemoveTags;

    procedure testHTMLWriter_TableSeries;
  end;

implementation

uses mnHTML, mnSystem, Graphics, mnFile;

{ TmnHTMLTestCase }

procedure TmnHTMLTestCase.SetUp;
begin
end;

procedure TmnHTMLTestCase.TearDown;
begin
end;

procedure TmnHTMLTestCase.testHTMLSpaces;
begin
  CheckEquals(mnHTMLSpaces(-3), '');
  CheckEquals(mnHTMLSpaces(0), '');
  CheckEquals(mnHTMLSpaces(1), '&nbsp;');
  CheckEquals(mnHTMLSpaces(3), '&nbsp;&nbsp;&nbsp;');
end;

procedure TmnHTMLTestCase.testHTMLEscape;
begin
  CheckEquals(mnHTMLEscape('''<title>"Tom & Jerry"</title>'''),
    '&#39;&lt;title&gt;&quot;Tom&nbsp;&amp;&nbsp;Jerry&quot;&lt;/title&gt;&#39;');
end;

procedure TmnHTMLTestCase.testHTMLLineBreaks;
begin
  CheckEquals(mnHTMLLineBreaks(-3), '');
  CheckEquals(mnHTMLLineBreaks(0), '');
  CheckEquals(mnHTMLLineBreaks(1), '<br>');
  CheckEquals(mnHTMLLineBreaks(3), '<br><br><br>');
end;

procedure TmnHTMLTestCase.testHTMLSetFontColor;
begin
  CheckEquals(mnHTMLSetFontColor('a', clBlue), '<font color="#0000FF">a</font>');
  CheckEquals(mnHTMLSetFontColor('a', $667788), '<font color="#887766">a</font>');
end;

procedure TmnHTMLTestCase.testHTMLSetFontStyle;
begin
  CheckEquals(mnHTMLSetFontStyle('a', fsBold), '<b>a</b>');
  CheckEquals(mnHTMLSetFontStyle('a', fsItalic), '<i>a</i>');
  CheckEquals(mnHTMLSetFontStyle('a', fsUnderline), '<u>a</u>');
end;

procedure TmnHTMLTestCase.testHTMLSimplePage;
begin
  mnSaveStrToFile(mnHTMLSimplePage('Simple Page', 'It is a simple page.<table><tr><td>adgj8</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr><tr><td>ADGJ8</td><td></td></tr></table>'),
                  mnTProjectConvention.GetTestOutPathSub('TmnHTMLTestCase.testHTMLSimplePage.tmp'));
end;

procedure TmnHTMLTestCase.testHTMLRemoveTags;
begin
  CheckEquals(mnHTMLRemoveTags(
    '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">' + mnNewLine +
    '<html>' + mnNewLine +
    '<head>' + mnNewLine +
    '  <title> title </title>' + mnNewLine +
    '  <meta name="Generator" content="EditPlus">' + mnNewLine +
    '  <meta name="Author" content="">' + mnNewLine +
    '  <meta name="Keywords" content="">' + mnNewLine +
    '  <meta name="Description" content="">' + mnNewLine +
    '  head' + mnNewLine +
    '</head>' + mnNewLine +
    '' + mnNewLine +
    '<body>' + mnNewLine +
    'body' + mnNewLine +
    '</body>' + mnNewLine +
    '</html>' + mnNewLine),
    '' + mnNewLine +
    '' + mnNewLine +
    '' + mnNewLine +
    '   title ' + mnNewLine +
    '  ' + mnNewLine +
    '  ' + mnNewLine +
    '  ' + mnNewLine +
    '  ' + mnNewLine +
    '  head' + mnNewLine +
    '' + mnNewLine +
    '' + mnNewLine +
    '' + mnNewLine +
    'body' + mnNewLine +
    '' + mnNewLine +
    '' + mnNewLine);
end;

procedure TmnHTMLTestCase.testHTMLWriter_TableSeries;
var
  hw: mnTHTMLWriter;
begin
  hw := mnTHTMLWriter.Create;
  try
    hw.BeginRow('attrR="valueR"');
    hw.BeginCell('attrC="valueC"', 2, 3);
    hw.Write('Cell1');
    hw.EndCell;
    hw.EndRow;

    hw.HasNewLine := False;
    hw.Indent := '';
    hw.BeginRow;
    hw.WriteCell('Cell2');
    hw.EndRow;

    CheckEquals(hw.ToHTML,
      '<tr attrR="valueR">' + mnNewLine +
      '  <td colspan="2" rowspan="3" attrC="valueC">Cell1</td>' + mnNewLine +
      '</tr>' + mnNewLine +
      '<tr><td>Cell2</td></tr>');
  finally
    hw.Free;
  end;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TmnHTMLTestCase.Suite);
end.