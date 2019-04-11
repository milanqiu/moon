unit mnTestCaseWizard;

interface

uses ToolsAPI;

type
  mnTTestCaseWizard = class(TNotifierObject,
    IOTAWizard, IOTARepositoryWizard, IOTAFormWizard, IOTACreator, IOTAModuleCreator)
  private
    FModuleName: string;
    FUnitName: string;
    FFormName: string;
  protected
    // IOTAWizard methods
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;
    // IOTARepositoryWizard methods
    function GetAuthor: string;
    function GetComment: string;
    function GetPage: string;
    function GetGlyph: Cardinal;
    // IOTACreator methods
    function GetCreatorType: string;
    function GetExisting: Boolean;
    function GetFileSystem: string;
    function GetOwner: IOTAModule;
    function GetUnnamed: Boolean;
    // IOTAModuleCreator methods
    function GetAncestorName: string;
    function GetImplFileName: string;
    function GetIntfFileName: string;
    function GetFormName: string;
    function GetMainForm: Boolean;
    function GetShowForm: Boolean;
    function GetShowSource: Boolean;
    function NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
    function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    function NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    procedure FormCreated(const FormEditor: IOTAFormEditor);
  end;

implementation

uses Windows, SysUtils, Dialogs, mnWindows, mnDialog, mnSystem, mnString;

{$R ..\..\..\files\Strings\IOTA\mnTestCaseWizard\mnTestCaseWizard.res}
{$R ..\..\..\files\Icons\IOTA\mnTestCaseWizard.res}

type
  TBaseFile = class(TInterfacedObject)
  private
    FModuleName: string;
    FFormName: string;
    FAncestorName: string;
  public
    constructor Create(const ModuleName, FormName, AncestorName: string);
  end;

  TUnitFile = class(TBaseFile, IOTAFile)
  protected
    function GetSource: string;
    function GetAge: TDateTime;
  end;

{ TBaseFile }

constructor TBaseFile.Create(const ModuleName, FormName, AncestorName: string);
begin
  inherited Create;
  FModuleName := ModuleName;
  FFormName := FormName;
  FAncestorName := AncestorName;
end;

{ TUnitFile }

function TUnitFile.GetSource: string;
begin
  Result := mnReplaceStr(mnLoadResAsStr(HInstance, 'UTestCase'), FAncestorName, FModuleName);
end;

function TUnitFile.GetAge: TDateTime;
begin
  Result := -1;
end;

{ mnTTestCaseWizard }

function mnTTestCaseWizard.GetIDString: string;
begin
  Result := 'Moon.mnTTestCaseWizard';
end;

function mnTTestCaseWizard.GetName: string;
begin
  Result := 'Test Case Unit';
end;

function mnTTestCaseWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure mnTTestCaseWizard.Execute;
begin
  FModuleName := 'TargetUnit';
  mnEditDialog('TargetUnit Name', 'Please input a target unit name:', FModuleName, FModuleName, scNotEmpty);
  FUnitName := FModuleName + 'TestCase';
  FFormName := '';

  (BorlandIDEServices as IOTAModuleServices).CreateModule(Self);
end;

function mnTTestCaseWizard.GetAuthor: string;
begin
  Result := 'Milan Qiu';
end;

function mnTTestCaseWizard.GetComment: string;
begin
  Result := 'Creates a new test case unit.';
end;

function mnTTestCaseWizard.GetPage: string;
begin
  Result := 'Moon';
end;

function mnTTestCaseWizard.GetGlyph: Cardinal;
begin
  Result := LoadImage(hInstance, 'mnTTestCaseWizard', IMAGE_ICON, 0, 0, LR_DEFAULTSIZE);
end;

function mnTTestCaseWizard.GetCreatorType: string;
begin
  Result := '';
end;

function mnTTestCaseWizard.GetExisting: Boolean;
begin
  Result := False;
end;

function mnTTestCaseWizard.GetFileSystem: string;
begin
  Result := '';
end;

function mnTTestCaseWizard.GetOwner: IOTAModule;
var
  i: Integer;
  ModServ: IOTAModuleServices;
  Module: IOTAModule;
  ProjGrp: IOTAProjectGroup;
begin
  Result := nil;
  ModServ := BorlandIDEServices as IOTAModuleServices;
  for i := 0 to ModServ.ModuleCount - 1 do
  begin
    Module := ModSErv.Modules[i];
    // find current project group
    if CompareText(ExtractFileExt(Module.FileName), '.bdsgroup') = 0 then
      if Module.QueryInterface(IOTAProjectGroup, ProjGrp) = S_OK then
      begin
        // return active project of group
        Result := ProjGrp.GetActiveProject;
        Exit;
      end;
  end;
end;

function mnTTestCaseWizard.GetUnnamed: Boolean;
begin
  Result := True;
end;

function mnTTestCaseWizard.GetAncestorName: string;
begin
  Result := 'TargetUnit';
end;

function mnTTestCaseWizard.GetImplFileName: string;
begin
  // Note: full path name required!
  Result := Format('%s%s.pas', [ExtractFilePath(GetOwner.FileName), FUnitName]);
end;

function mnTTestCaseWizard.GetIntfFileName: string;
begin
  Result := '';
end;

function mnTTestCaseWizard.GetFormName: string;
begin
  Result := '';
end;

function mnTTestCaseWizard.GetMainForm: Boolean;
begin
  Result := False;
end;

function mnTTestCaseWizard.GetShowForm: Boolean;
begin
  Result := False;
end;

function mnTTestCaseWizard.GetShowSource: Boolean;
begin
  Result := True;
end;

function mnTTestCaseWizard.NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

function mnTTestCaseWizard.NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := TUnitFile.Create(FModuleName, '', AncestorIdent);
end;

function mnTTestCaseWizard.NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

procedure mnTTestCaseWizard.FormCreated(const FormEditor: IOTAFormEditor);
begin
  // do nothing
end;

initialization

  RegisterPackageWizard(mnTTestCaseWizard.Create);

end.
