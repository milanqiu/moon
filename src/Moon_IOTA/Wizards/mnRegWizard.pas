unit mnRegWizard;

interface

uses ToolsAPI;

type
  mnTRegWizard = class(TNotifierObject,
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

{$R ..\..\..\files\Strings\IOTA\mnRegWizard\mnRegWizard.res}
{$R ..\..\..\files\Icons\IOTA\mnRegWizard.res}

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
  Result := mnReplaceStr(mnLoadResAsStr(HInstance, 'UReg'), FAncestorName, FModuleName);
end;

function TUnitFile.GetAge: TDateTime;
begin
  Result := -1;
end;

{ mnTRegWizard }

function mnTRegWizard.GetIDString: string;
begin
  Result := 'Moon.mnTRegWizard';
end;

function mnTRegWizard.GetName: string;
begin
  Result := 'Reg Unit';
end;

function mnTRegWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure mnTRegWizard.Execute;
begin
  FModuleName := 'Options';
  mnEditDialog('Reg Name', 'Please input a reg name:', FModuleName, FModuleName, scNotEmpty);
  FUnitName := 'U' + FModuleName + 'Reg';
  FFormName := '';

  (BorlandIDEServices as IOTAModuleServices).CreateModule(Self);
end;

function mnTRegWizard.GetAuthor: string;
begin
  Result := 'Milan Qiu';
end;

function mnTRegWizard.GetComment: string;
begin
  Result := 'Creates a new unit to work on registry.';
end;

function mnTRegWizard.GetPage: string;
begin
  Result := 'Moon';
end;

function mnTRegWizard.GetGlyph: Cardinal;
begin
  Result := LoadImage(hInstance, 'mnTRegWizard', IMAGE_ICON, 0, 0, LR_DEFAULTSIZE);
end;

function mnTRegWizard.GetCreatorType: string;
begin
  Result := '';
end;

function mnTRegWizard.GetExisting: Boolean;
begin
  Result := False;
end;

function mnTRegWizard.GetFileSystem: string;
begin
  Result := '';
end;

function mnTRegWizard.GetOwner: IOTAModule;
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

function mnTRegWizard.GetUnnamed: Boolean;
begin
  Result := True;
end;

function mnTRegWizard.GetAncestorName: string;
begin
  Result := 'Options';
end;

function mnTRegWizard.GetImplFileName: string;
begin
  // Note: full path name required!
  Result := Format('%s%s.pas', [ExtractFilePath(GetOwner.FileName), FUnitName]);
end;

function mnTRegWizard.GetIntfFileName: string;
begin
  Result := '';
end;

function mnTRegWizard.GetFormName: string;
begin
  Result := '';
end;

function mnTRegWizard.GetMainForm: Boolean;
begin
  Result := False;
end;

function mnTRegWizard.GetShowForm: Boolean;
begin
  Result := False;
end;

function mnTRegWizard.GetShowSource: Boolean;
begin
  Result := True;
end;

function mnTRegWizard.NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

function mnTRegWizard.NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := TUnitFile.Create(FModuleName, '', AncestorIdent);
end;

function mnTRegWizard.NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

procedure mnTRegWizard.FormCreated(const FormEditor: IOTAFormEditor);
begin
  // do nothing
end;

initialization

  RegisterPackageWizard(mnTRegWizard.Create);

end.
