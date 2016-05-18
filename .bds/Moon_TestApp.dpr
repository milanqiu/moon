program Moon_TestApp;

uses
  FastMM4,
  Forms,
  FormMain in '..\src\Moon_TestApp\FormMain.pas' {MainForm},
  DMMain in '..\src\TestCommon\DMMain.pas' {MainDataModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'TestApp';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TMainDataModule, MainDataModule);
  Application.Run;
end.
