program Moon_TestUnit;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by 
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  FastMM4,
  Forms,
  TestFramework,
  GUITestRunner,
  TextTestRunner,
  UTestConsts in '..\src\TestCommon\UTestConsts.pas',
  UTestClasses in '..\src\TestCommon\UTestClasses.pas',
  DMMain in '..\src\TestCommon\DMMain.pas' {MainDataModule: TDataModule},
  mnArrayTestCase in '..\src\Moon_TestUnit\Utilities\mnArrayTestCase.pas',
  mnChineseTestCase in '..\src\Moon_TestUnit\Utilities\mnChineseTestCase.pas',
  mnCOMTestCase in '..\src\Moon_TestUnit\Utilities\mnCOMTestCase.pas',
  mnControlTestCase in '..\src\Moon_TestUnit\Utilities\mnControlTestCase.pas',
  mnDateTimeTestCase in '..\src\Moon_TestUnit\Utilities\mnDateTimeTestCase.pas',
  mnDBTestCase in '..\src\Moon_TestUnit\Utilities\mnDBTestCase.pas',
  mnDebugTestCase in '..\src\Moon_TestUnit\Utilities\mnDebugTestCase.pas',
  mnDialogTestCase in '..\src\Moon_TestUnit\Utilities\mnDialogTestCase.pas',
  mnFileTestCase in '..\src\Moon_TestUnit\Utilities\mnFileTestCase.pas',
  mnFormTestCase in '..\src\Moon_TestUnit\Utilities\mnFormTestCase.pas',
  mnGraphicsTestCase in '..\src\Moon_TestUnit\Utilities\mnGraphicsTestCase.pas',
  mnHTMLTestCase in '..\src\Moon_TestUnit\Utilities\mnHTMLTestCase.pas',
  mnMathTestCase in '..\src\Moon_TestUnit\Utilities\mnMathTestCase.pas',
  mnNetworkTestCase in '..\src\Moon_TestUnit\Utilities\mnNetworkTestCase.pas',
  mnSQLTestCase in '..\src\Moon_TestUnit\Utilities\mnSQLTestCase.pas',
  mnStringTestCase in '..\src\Moon_TestUnit\Utilities\mnStringTestCase.pas',
  mnSystemTestCase in '..\src\Moon_TestUnit\Utilities\mnSystemTestCase.pas',
  mnTPLTestCase in '..\src\Moon_TestUnit\Utilities\mnTPLTestCase.pas',
  mnWindowsTestCase in '..\src\Moon_TestUnit\Utilities\mnWindowsTestCase.pas',
  mnDateRangeTestCase in '..\src\Moon_TestUnit\Components\mnDateRangeTestCase.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'TestUnit';
  Application.CreateForm(TMainDataModule, MainDataModule);
  if IsConsole then
    TextTestRunner.RunRegisteredTests
  else
    GUITestRunner.RunRegisteredTests;
end.

