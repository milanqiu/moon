unit mnFileChooser;

interface

uses cxMRUEdit, Messages, Classes;

type
  mnTFileChooser = class(TcxMRUEdit)
  private
    procedure WMDropFiles(var Message: TWMDropFiles); message WM_DropFiles;
  protected
    procedure CreateHandle; override;
    procedure DoButtonClick(AButtonVisibleIndex: Integer); override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses mnDialog, mnSystem, mnString, mnWindows, Dialogs;

{$R ..\..\files\Icons\Components\mnFileChooser.dcr}

{ mnTFileChooser }

procedure mnTFileChooser.WMDropFiles(var Message: TWMDropFiles);
begin
  try
    Text := mnGetDropFileName(Message);
    AddItem(Text);
  finally
    mnFinishDropFiles(Message);
  end;
end;

procedure mnTFileChooser.CreateHandle;
begin
  inherited CreateHandle;

  mnAcceptDropFiles(Handle);
end;

procedure mnTFileChooser.DoButtonClick(AButtonVisibleIndex: Integer);
var
  OpenDialog: TOpenDialog;
begin
  if AButtonVisibleIndex = 1 then
  begin
    OpenDialog := TOpenDialog.Create(nil);
    try
      mnSetOpenDialogFilter(OpenDialog, dfAll);
      if OpenDialog.Execute then
      begin
        Text := OpenDialog.FileName;
        AddItem(Text);
      end;
    finally
      OpenDialog.Free;
    end;
  end;

  inherited DoButtonClick(AButtonVisibleIndex);
end;

constructor mnTFileChooser.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Width := 369;
  Text := '';
end;

end.
