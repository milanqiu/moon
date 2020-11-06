unit mnCommonDialogWizard;

interface

uses ToolsAPI;

type
  mnTCommonDialogWizard = class(TNotifierObject,
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

{$R ..\..\..\files\Strings\IOTA\mnCommonDialogWizard\mnCommonDialogWizard.res}
{$R ..\..\..\files\Icons\IOTA\mnCommonDialogWizard.res}

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
  Result := mnReplaceStr(mnLoadResAsStr(HInstance, 'CommonDialog'), FAncestorName, FModuleName);
end;

function TUnitFile.GetAge: TDateTime;
begin
  Result := -1;
end;

{ TFormFile }

function TFormFile.GetSource: string;
begin
  Result := mnReplaceStr(mnLoadResAsStr(HInstance, 'CommonDialogDFM'), FAncestorName, FModuleName);
end;

function TFormFile.GetAge: TDateTime;
begin
  Result := -1;
end;

{ mnTCommonDialogWizard }

function mnTCommonDialogWizard.GetIDString: string;
begin
  Result := 'Moon.mnTCommonDialogWizard';
end;

function mnTCommonDialogWizard.GetName: string;
begin
  Result := 'Common Dialog';
end;

function mnTCommonDialogWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure mnTCommonDialogWizard.Execute;
begin
  FModuleName := 'Common';
  mnEditDialog('Dialog Name', 'Please input a dialog name:', FModuleName, FModuleName, scNotEmpty);
  FUnitName := 'Dlg' + FModuleName;
  FFormName := FModuleName + 'Dialog';

  (BorlandIDEServices as IOTAModuleServices).CreateModule(Self);
end;

function mnTCommonDialogWizard.GetAuthor: string;
begin
  Result := 'Milan Qiu';
end;

function mnTCommonDialogWizard.GetComment: string;
begin
  Result := 'Creates a new common dialog.';
end;

function mnTCommonDialogWizard.GetPage: string;
begin
  Result := 'Moon';
end;

function mnTCommonDialogWizard.GetGlyph: Cardinal;
begin
  Result := LoadImage(hInstance, 'mnTCommonDialogWizard', IMAGE_ICON, 0, 0, LR_DEFAULTSIZE);
end;

function mnTCommonDialogWizard.GetCreatorType: string;
begin
  Result := '';
end;

function mnTCommonDialogWizard.GetExisting: Boolean;
begin
  Result := False;
end;

function mnTCommonDialogWizard.GetFileSystem: string;
begin
  Result := '';
end;

function mnTCommonDialogWizard.GetOwner: IOTAModule;
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

function mnTCommonDialogWizard.GetUnnamed: Boolean;
begin
  Result := True;
end;

function mnTCommonDialogWizard.GetAncestorName: string;
begin
  Result := 'Common';
end;

function mnTCommonDialogWizard.GetImplFileName: string;
begin
  // Note: full path name required!
  Result := Format('%s%s.pas', [ExtractFilePath(GetOwner.FileName), FUnitName]);
end;

function mnTCommonDialogWizard.GetIntfFileName: string;
begin
  Result := '';
end;

function mnTCommonDialogWizard.GetFormName: string;
begin
  Result := FFormName;
end;

function mnTCommonDialogWizard.GetMainForm: Boolean;
begin
  Result := False;
end;

function mnTCommonDialogWizard.GetShowForm: Boolean;
begin
  Result := True;
end;

function mnTCommonDialogWizard.GetShowSource: Boolean;
begin
  Result := True;
end;

function mnTCommonDialogWizard.NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := TFormFile.Create(FModuleName, '', AncestorIdent);
end;

function mnTCommonDialogWizard.NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := TUnitFile.Create(FModuleName, '', AncestorIdent);
end;

function mnTCommonDialogWizard.NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

procedure mnTCommonDialogWizard.FormCreated(const FormEditor: IOTAFormEditor);
begin
  // do nothing
end;

initialization

  RegisterPackageWizard(mnTCommonDialogWizard.Create);

end.
