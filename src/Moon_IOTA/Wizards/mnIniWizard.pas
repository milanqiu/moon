unit mnIniWizard;

interface

uses ToolsAPI;

type
  mnTIniWizard = class(TNotifierObject,
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

{$R ..\..\..\files\Strings\IOTA\mnIniWizard\mnIniWizard.res}
{$R ..\..\..\files\Icons\IOTA\mnIniWizard.res}

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
  Result := mnReplaceStr(mnLoadResAsStr(HInstance, 'UIni'), FAncestorName, FModuleName);
end;

function TUnitFile.GetAge: TDateTime;
begin
  Result := -1;
end;

{ mnTIniWizard }

function mnTIniWizard.GetIDString: string;
begin
  Result := 'Moon.mnTIniWizard';
end;

function mnTIniWizard.GetName: string;
begin
  Result := 'Ini Unit';
end;

function mnTIniWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure mnTIniWizard.Execute;
begin
  FModuleName := 'Options';
  mnEditDialog('Ini Name', 'Please input an ini name:', FModuleName, FModuleName, scNotEmpty);
  FUnitName := 'U' + FModuleName + 'Ini';
  FFormName := '';

  (BorlandIDEServices as IOTAModuleServices).CreateModule(Self);
end;

function mnTIniWizard.GetAuthor: string;
begin
  Result := 'Milan Qiu';
end;

function mnTIniWizard.GetComment: string;
begin
  Result := 'Creates a new unit to work on ini file.';
end;

function mnTIniWizard.GetPage: string;
begin
  Result := 'Moon';
end;

function mnTIniWizard.GetGlyph: Cardinal;
begin
  Result := LoadImage(hInstance, 'mnTIniWizard', IMAGE_ICON, 0, 0, LR_DEFAULTSIZE);
end;

function mnTIniWizard.GetCreatorType: string;
begin
  Result := '';
end;

function mnTIniWizard.GetExisting: Boolean;
begin
  Result := False;
end;

function mnTIniWizard.GetFileSystem: string;
begin
  Result := '';
end;

function mnTIniWizard.GetOwner: IOTAModule;
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

function mnTIniWizard.GetUnnamed: Boolean;
begin
  Result := True;
end;

function mnTIniWizard.GetAncestorName: string;
begin
  Result := 'Options';
end;

function mnTIniWizard.GetImplFileName: string;
begin
  // Note: full path name required!
  Result := Format('%s%s.pas', [ExtractFilePath(GetOwner.FileName), FUnitName]);
end;

function mnTIniWizard.GetIntfFileName: string;
begin
  Result := '';
end;

function mnTIniWizard.GetFormName: string;
begin
  Result := '';
end;

function mnTIniWizard.GetMainForm: Boolean;
begin
  Result := False;
end;

function mnTIniWizard.GetShowForm: Boolean;
begin
  Result := False;
end;

function mnTIniWizard.GetShowSource: Boolean;
begin
  Result := True;
end;

function mnTIniWizard.NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

function mnTIniWizard.NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := TUnitFile.Create(FModuleName, '', AncestorIdent);
end;

function mnTIniWizard.NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

procedure mnTIniWizard.FormCreated(const FormEditor: IOTAFormEditor);
begin
  // do nothing
end;

initialization

  RegisterPackageWizard(mnTIniWizard.Create);

end.
