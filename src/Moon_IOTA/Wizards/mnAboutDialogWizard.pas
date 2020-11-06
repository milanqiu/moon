unit mnAboutDialogWizard;

interface

uses ToolsAPI;

type
  mnTAboutDialogWizard = class(TNotifierObject,
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

{$R ..\..\..\files\Strings\IOTA\mnAboutDialogWizard\mnAboutDialogWizard.res}
{$R ..\..\..\files\Icons\IOTA\mnAboutDialogWizard.res}

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

  TFormFile = class(TBaseFile, IOTAFile)
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
  Result := mnLoadResAsStr(HInstance, 'AboutDialog');
end;

function TUnitFile.GetAge: TDateTime;
begin
  Result := -1;
end;

{ TFormFile }

function TFormFile.GetSource: string;
begin
  Result := mnLoadResAsStr(HInstance, 'AboutDialogDFM');
end;

function TFormFile.GetAge: TDateTime;
begin
  Result := -1;
end;

{ mnTAboutDialogWizard }

function mnTAboutDialogWizard.GetIDString: string;
begin
  Result := 'Moon.mnTAboutDialogWizard';
end;

function mnTAboutDialogWizard.GetName: string;
begin
  Result := 'About Dialog';
end;

function mnTAboutDialogWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure mnTAboutDialogWizard.Execute;
begin
  FModuleName := 'About';
  FUnitName := 'Dlg' + FModuleName;
  FFormName := FModuleName + 'Dialog';

  (BorlandIDEServices as IOTAModuleServices).CreateModule(Self);
end;

function mnTAboutDialogWizard.GetAuthor: string;
begin
  Result := 'Milan Qiu';
end;

function mnTAboutDialogWizard.GetComment: string;
begin
  Result := 'Creates a new about dialog.';
end;

function mnTAboutDialogWizard.GetPage: string;
begin
  Result := 'Moon';
end;

function mnTAboutDialogWizard.GetGlyph: Cardinal;
begin
  Result := LoadImage(hInstance, 'mnTAboutDialogWizard', IMAGE_ICON, 0, 0, LR_DEFAULTSIZE);
end;

function mnTAboutDialogWizard.GetCreatorType: string;
begin
  Result := '';
end;

function mnTAboutDialogWizard.GetExisting: Boolean;
begin
  Result := False;
end;

function mnTAboutDialogWizard.GetFileSystem: string;
begin
  Result := '';
end;

function mnTAboutDialogWizard.GetOwner: IOTAModule;
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

function mnTAboutDialogWizard.GetUnnamed: Boolean;
begin
  Result := True;
end;

function mnTAboutDialogWizard.GetAncestorName: string;
begin
  Result := '';
end;

function mnTAboutDialogWizard.GetImplFileName: string;
begin
  // Note: full path name required!
  Result := Format('%s%s.pas', [ExtractFilePath(GetOwner.FileName), FUnitName]);
end;

function mnTAboutDialogWizard.GetIntfFileName: string;
begin
  Result := '';
end;

function mnTAboutDialogWizard.GetFormName: string;
begin
  Result := FFormName;
end;

function mnTAboutDialogWizard.GetMainForm: Boolean;
begin
  Result := False;
end;

function mnTAboutDialogWizard.GetShowForm: Boolean;
begin
  Result := True;
end;

function mnTAboutDialogWizard.GetShowSource: Boolean;
begin
  Result := True;
end;

function mnTAboutDialogWizard.NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := TFormFile.Create(FModuleName, '', AncestorIdent);
end;

function mnTAboutDialogWizard.NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := TUnitFile.Create(FModuleName, '', AncestorIdent);
end;

function mnTAboutDialogWizard.NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

procedure mnTAboutDialogWizard.FormCreated(const FormEditor: IOTAFormEditor);
begin
  // do nothing
end;

initialization

  RegisterPackageWizard(mnTAboutDialogWizard.Create);

end.
