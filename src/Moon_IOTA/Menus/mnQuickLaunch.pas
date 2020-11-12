unit mnQuickLaunch;

interface

uses ToolsAPI, cxMCListBox, Forms;

type
  mnTOpenBDSFolder = class(TNotifierObject, IOTAWizard, IOTAMenuWizard)
  protected
    // IOTAWizard methods
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;
    // IOTAMenuWizard methods
    function GetMenuText: string;
  end;

  mnTOpenMoonFolder = class(TNotifierObject, IOTAWizard, IOTAMenuWizard)
  protected
    // IOTAWizard methods
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;
    // IOTAMenuWizard methods
    function GetMenuText: string;
  end;

  mnTOpenMoonSource = class(TNotifierObject, IOTAWizard, IOTAMenuWizard)
  private
    Form: TForm;
    Choosed: string;
    procedure WhenMCListBoxDblClick(Sender: TObject);
    procedure InitForm;
  protected
    // IOTAWizard methods
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;
    // IOTAMenuWizard methods
    function GetMenuText: string;
  end;

implementation

uses mnWindows, Classes, mnString, Controls, mnTPL, mnFile, SysUtils;

var
  MoonPath: string = '';

function GetMoonPath: string;
var
  EnvironmentOptions: IOTAEnvironmentOptions;
  Paths: TStrings;
  Path: string;
begin
  if MoonPath = '' then
  begin
    Paths := TStringList.Create;
    try
      EnvironmentOptions := (BorlandIDEServices as IOTAServices).GetEnvironmentOptions;
      mnSplit(EnvironmentOptions.Values['LibraryPath'], Paths, ';');
      for Path in Paths do
        if Pos('\moon\', Path) > 0 then
        begin
          MoonPath := mnLeftStrTo('\moon\', Path) + '\moon\';
          Break;
        end;
    finally
      Paths.Free;
    end;
  end;
  Result := MoonPath;
end;

{ mnTOpenBDSFolder }

function mnTOpenBDSFolder.GetIDString: string;
begin
  Result := 'Moon.mnTOpenBDSFolder';
end;

function mnTOpenBDSFolder.GetName: string;
begin
 Result := 'OpenBDSFolder';
end;

function mnTOpenBDSFolder.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure mnTOpenBDSFolder.Execute;
begin
  mnShellOpen((BorlandIDEServices as IOTAServices).GetRootDirectory);
end;

function mnTOpenBDSFolder.GetMenuText: string;
begin
  Result := 'Open B&DS Folder';
end;

{ mnTOpenMoonFolder }

function mnTOpenMoonFolder.GetIDString: string;
begin
  Result := 'Moon.mnTOpenMoonFolder';
end;

function mnTOpenMoonFolder.GetName: string;
begin
 Result := 'OpenMoonFolder';
end;

function mnTOpenMoonFolder.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure mnTOpenMoonFolder.Execute;
begin
  mnShellOpen(GetMoonPath);
end;

function mnTOpenMoonFolder.GetMenuText: string;
begin
  Result := 'Open &Moon Folder';
end;

{ mnTOpenMoonSource }

procedure mnTOpenMoonSource.WhenMCListBoxDblClick(Sender: TObject);
begin
  Choosed := mnRightStrToChar(';', mnSelectedItem((Sender as TcxMCListBox)));
  ((Sender as TcxMCListBox).Parent as TForm).Close;
end;

procedure SearchMoonSources(MCListBox: TcxMCListBox; const PackageName, SourceDir: string);
var
  SourceFiles: TStrings;
  SourceFile: string;
begin
  SourceFiles := TStringList.Create;
  try
    mnGetFileList(SourceDir + '\*.pas', SourceFiles);
    for SourceFile in SourceFiles do
      MCListBox.AddItem(PackageName + ';' + mnExtractFileNoExt(ExtractFileName(SourceFile)) + ';' + SourceFile, nil);
  finally
    SourceFiles.Free;
  end;
end;

procedure mnTOpenMoonSource.InitForm;
var
  MCListBox: TcxMCListBox;
begin
  Form.ClientHeight := 500;
  Form.ClientWidth := 840;
  Form.Caption := 'Double click to choose';
  Form.Position := poScreenCenter;

  MCListBox := TcxMCListBox.Create(Form);
  MCListBox.Parent := Form;
  MCListBox.Align := alClient;
  MCListBox.HeaderSections.Clear;
  MCListBox.OnDblClick := WhenMCListBoxDblClick;
  with MCListBox.HeaderSections.Add do
  begin
    Text := 'Package';
    Width := 80;
  end;
  with MCListBox.HeaderSections.Add do
  begin
    Text := 'Source Name';
    Width := 160;
  end;
  with MCListBox.HeaderSections.Add do
  begin
    Text := 'Source File';
    Width := 600;
  end;

  SearchMoonSources(MCListBox, 'Utilities', GetMoonPath + 'src\Moon_Utilities');
  SearchMoonSources(MCListBox, 'Components', GetMoonPath + 'src\Moon_Components');
  SearchMoonSources(MCListBox, 'IOTA', GetMoonPath + 'src\Moon_IOTA\Menus');
  SearchMoonSources(MCListBox, 'IOTA', GetMoonPath + 'src\Moon_IOTA\Wizards');
end;

function mnTOpenMoonSource.GetIDString: string;
begin
  Result := 'Moon.mnTOpenMoonSource';
end;

function mnTOpenMoonSource.GetName: string;
begin
 Result := 'OpenMoonSource';
end;

function mnTOpenMoonSource.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure mnTOpenMoonSource.Execute;
begin
  Form := TForm.Create(Application);
  try
    InitForm;
    Choosed := '';
    Form.ShowModal;
    if Choosed <> '' then mnShellOpen(Choosed);
  finally
    Form.Free;
  end;
end;

function mnTOpenMoonSource.GetMenuText: string;
begin
  Result := 'Open Moon Sour&ce';
end;

initialization

  RegisterPackageWizard(mnTOpenMoonSource.Create);
  RegisterPackageWizard(mnTOpenMoonFolder.Create);
  RegisterPackageWizard(mnTOpenBDSFolder.Create);

end.
