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
  DMMain in '..\src\TestCommon\DMMain.pas' {MainDataModule: TDataModule},
  mnSystem in '..\src\Moon_Utilities\mnSystem.pas',
  mnSystemTestCase in '..\src\Moon_TestUnit\Utilities\mnSystemTestCase.pas';

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

