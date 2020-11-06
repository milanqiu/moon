unit mnMDIChildFormWizard;

interface

uses ToolsAPI;

type
  mnTMDIChildFormWizard = class(TNotifierObject,
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

{$R ..\..\..\files\Strings\IOTA\mnMDIChildFormWizard\mnMDIChildFormWizard.res}
{$R ..\..\..\files\Icons\IOTA\mnMDIChildFormWizard.res}

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
  Result := mnReplaceStr(mnLoadResAsStr(HInstance, 'MDIChildForm'), FAncestorName, FModuleName);
end;

function TUnitFile.GetAge: TDateTime;
begin
  Result := -1;
end;

{ TFormFile }

function TFormFile.GetSource: string;
begin
  Result := mnReplaceStr(mnLoadResAsStr(HInstance, 'MDIChildFormDFM'), FAncestorName, FModuleName);
  Result := mnReplaceStr(Result, 'fs' + FModuleName, 'fs' + FAncestorName);
end;

function TFormFile.GetAge: TDateTime;
begin
  Result := -1;
end;

{ mnTMDIChildFormWizard }

function mnTMDIChildFormWizard.GetIDString: string;
begin
  Result := 'Moon.mnTMDIChildFormWizard';
end;

function mnTMDIChildFormWizard.GetName: string;
begin
  Result := 'MDIChild Form';
end;

function mnTMDIChildFormWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure mnTMDIChildFormWizard.Execute;
begin
  FModuleName := 'MDIChild';
  mnEditDialog('MDIChild Name', 'Please input a MDI child name:', FModuleName, FModuleName, scNotEmpty);
  FUnitName := 'Form' + FModuleName;
  FFormName := FModuleName + 'Form';

  (BorlandIDEServices as IOTAModuleServices).CreateModule(Self);
end;

function mnTMDIChildFormWizard.GetAuthor: string;
begin
  Result := 'Milan Qiu';
end;

function mnTMDIChildFormWizard.GetComment: string;
begin
  Result := 'Creates a new MDI child form.';
end;

function mnTMDIChildFormWizard.GetPage: string;
begin
  Result := 'Moon';
end;

function mnTMDIChildFormWizard.GetGlyph: Cardinal;
begin
  Result := LoadImage(hInstance, 'mnTMDIChildFormWizard', IMAGE_ICON, 0, 0, LR_DEFAULTSIZE);
end;

function mnTMDIChildFormWizard.GetCreatorType: string;
begin
  Result := '';
end;

function mnTMDIChildFormWizard.GetExisting: Boolean;
begin
  Result := False;
end;

function mnTMDIChildFormWizard.GetFileSystem: string;
begin
  Result := '';
end;

function mnTMDIChildFormWizard.GetOwner: IOTAModule;
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

function mnTMDIChildFormWizard.GetUnnamed: Boolean;
begin
  Result := True;
end;

function mnTMDIChildFormWizard.GetAncestorName: string;
begin
  Result := 'MDIChild';
end;

function mnTMDIChildFormWizard.GetImplFileName: string;
begin
  // Note: full path name required!
  Result := Format('%s%s.pas', [ExtractFilePath(GetOwner.FileName), FUnitName]);
end;

function mnTMDIChildFormWizard.GetIntfFileName: string;
begin
  Result := '';
end;

function mnTMDIChildFormWizard.GetFormName: string;
begin
  Result := FFormName;
end;

function mnTMDIChildFormWizard.GetMainForm: Boolean;
begin
  Result := False;
end;

function mnTMDIChildFormWizard.GetShowForm: Boolean;
begin
  Result := True;
end;

function mnTMDIChildFormWizard.GetShowSource: Boolean;
begin
  Result := True;
end;

function mnTMDIChildFormWizard.NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := TFormFile.Create(FModuleName, '', AncestorIdent);
end;

function mnTMDIChildFormWizard.NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := TUnitFile.Create(FModuleName, '', AncestorIdent);
end;

function mnTMDIChildFormWizard.NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

procedure mnTMDIChildFormWizard.FormCreated(const FormEditor: IOTAFormEditor);
begin
  // do nothing
end;

initialization

  RegisterPackageWizard(mnTMDIChildFormWizard.Create);

end.
