program Moon_TestApp;

uses
  FastMM4,
  Forms,
  UTestConsts in '..\src\TestCommon\UTestConsts.pas',
  UTestClasses in '..\src\TestCommon\UTestClasses.pas',
  DMMain in '..\src\TestCommon\DMMain.pas' {MainDataModule: TDataModule},
  FormMain in '..\src\Moon_TestApp\FormMain.pas' {MainForm},
  DlgTest in '..\src\Moon_TestApp\DlgTest.pas' {TestDialog},
  DlgTestCOM in '..\src\Moon_TestApp\Utilities\DlgTestCOM.pas' {TestCOMDialog},
  DlgTestControl in '..\src\Moon_TestApp\Utilities\DlgTestControl.pas' {TestControlDialog},
  DlgTestDialog in '..\src\Moon_TestApp\Utilities\DlgTestDialog.pas' {TestDialogDialog},
  DlgTestFile in '..\src\Moon_TestApp\Utilities\DlgTestFile.pas' {TestFileDialog},
  DlgTestForm in '..\src\Moon_TestApp\Utilities\DlgTestForm.pas' {TestFormDialog},
  DlgTestGraphics in '..\src\Moon_TestApp\Utilities\DlgTestGraphics.pas' {TestGraphicsDialog},
  DlgTestNetwork in '..\src\Moon_TestApp\Utilities\DlgTestNetwork.pas' {TestNetworkDialog},
  DlgTestSystem in '..\src\Moon_TestApp\Utilities\DlgTestSystem.pas' {TestSystemDialog},
  DlgTestTPL in '..\src\Moon_TestApp\Utilities\DlgTestTPL.pas' {TestTPLDialog},
  DlgTestWindows in '..\src\Moon_TestApp\Utilities\DlgTestWindows.pas' {TestWindowsDialog},
  DlgTestDateRange in '..\src\Moon_TestApp\Components\DlgTestDateRange.pas' {TestDateRangeDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'TestApp';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TMainDataModule, MainDataModule);
  Application.CreateForm(TTestCOMDialog, TestCOMDialog);
  Application.CreateForm(TTestControlDialog, TestControlDialog);
  Application.CreateForm(TTestDialogDialog, TestDialogDialog);
  Application.CreateForm(TTestFileDialog, TestFileDialog);
  Application.CreateForm(TTestFormDialog, TestFormDialog);
  Application.CreateForm(TTestGraphicsDialog, TestGraphicsDialog);
  Application.CreateForm(TTestNetworkDialog, TestNetworkDialog);
  Application.CreateForm(TTestSystemDialog, TestSystemDialog);
  Application.CreateForm(TTestTPLDialog, TestTPLDialog);
  Application.CreateForm(TTestWindowsDialog, TestWindowsDialog);
  Application.CreateForm(TTestDateRangeDialog, TestDateRangeDialog);
  Application.Run;
end.
