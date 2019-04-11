program Moon_TestApp;

uses
  FastMM4,
  Forms,
  mnArray in '..\src\Moon_Utilities\mnArray.pas',
  mnChinese in '..\src\Moon_Utilities\mnChinese.pas',
  mnCOM in '..\src\Moon_Utilities\mnCOM.pas',
  mnControl in '..\src\Moon_Utilities\mnControl.pas',
  mnDateTime in '..\src\Moon_Utilities\mnDateTime.pas',
  mnDB in '..\src\Moon_Utilities\mnDB.pas',
  mnDebug in '..\src\Moon_Utilities\mnDebug.pas',
  mnDialog in '..\src\Moon_Utilities\mnDialog.pas',
  mnFile in '..\src\Moon_Utilities\mnFile.pas',
  mnForm in '..\src\Moon_Utilities\mnForm.pas',
  mnGraphics in '..\src\Moon_Utilities\mnGraphics.pas',
  mnHTML in '..\src\Moon_Utilities\mnHTML.pas',
  mnMath in '..\src\Moon_Utilities\mnMath.pas',
  mnNetwork in '..\src\Moon_Utilities\mnNetwork.pas',
  mnResStrsU in '..\src\Moon_Utilities\mnResStrsU.pas',
  mnSQL in '..\src\Moon_Utilities\mnSQL.pas',
  mnString in '..\src\Moon_Utilities\mnString.pas',
  mnSystem in '..\src\Moon_Utilities\mnSystem.pas',
  mnTPL in '..\src\Moon_Utilities\mnTPL.pas',
  mnWindows in '..\src\Moon_Utilities\mnWindows.pas',
  UTestConsts in '..\src\TestCommon\UTestConsts.pas',
  UTestClasses in '..\src\TestCommon\UTestClasses.pas',
  DMMain in '..\src\TestCommon\DMMain.pas' {MainDataModule: TDataModule},
  FormMain in '..\src\Moon_TestApp\FormMain.pas' {MainForm},
  DlgTest in '..\src\Moon_TestApp\DlgTest.pas' {TestDialog},
  DlgTestCOM in '..\src\Moon_TestApp\Utilities\DlgTestCOM.pas' {TestCOMDialog},
  DlgTestControl in '..\src\Moon_TestApp\Utilities\DlgTestControl.pas' {TestControlDialog},
  DlgTestDialog in '..\src\Moon_TestApp\Utilities\DlgTestDialog.pas' {TestDialogDialog},
  DlgTestForm in '..\src\Moon_TestApp\Utilities\DlgTestForm.pas' {TestFormDialog},
  DlgTestGraphics in '..\src\Moon_TestApp\Utilities\DlgTestGraphics.pas' {TestGraphicsDialog},
  DlgTestNetwork in '..\src\Moon_TestApp\Utilities\DlgTestNetwork.pas' {TestNetworkDialog},
  DlgTestSystem in '..\src\Moon_TestApp\Utilities\DlgTestSystem.pas' {TestSystemDialog},
  DlgTestTPL in '..\src\Moon_TestApp\Utilities\DlgTestTPL.pas' {TestTPLDialog},
  DlgTestWindows in '..\src\Moon_TestApp\Utilities\DlgTestWindows.pas' {TestWindowsDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'TestApp';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TMainDataModule, MainDataModule);
  Application.CreateForm(TTestCOMDialog, TestCOMDialog);
  Application.CreateForm(TTestControlDialog, TestControlDialog);
  Application.CreateForm(TTestDialogDialog, TestDialogDialog);
  Application.CreateForm(TTestFormDialog, TestFormDialog);
  Application.CreateForm(TTestGraphicsDialog, TestGraphicsDialog);
  Application.CreateForm(TTestNetworkDialog, TestNetworkDialog);
  Application.CreateForm(TTestSystemDialog, TestSystemDialog);
  Application.CreateForm(TTestTPLDialog, TestTPLDialog);
  Application.CreateForm(TTestWindowsDialog, TestWindowsDialog);
  Application.Run;
end.
