unit UOptionsReg;

interface

type
  TOptionsReg = class
  private
    FKeyPath: string;
    // Put private values of data fields here
  public
    property KeyPath: string read FKeyPath write FKeyPath;
    // Put public properties of data fields here
  public
    procedure LoadFromRegistry;
    procedure SaveToRegistry;
  end;

var
  OptionsReg: TOptionsReg;

implementation

uses Registry, mnSystem;

const
  // Set registry key path here
  OptionsRegKeyPath = '\*';

{ TOptionsReg }

procedure TOptionsReg.LoadFromRegistry;
var
  Registry: TRegistry;
begin
  Registry := TRegistry.Create;
  try
    if Registry.OpenKey(FKeyPath, True) then
    begin
      // Load field values from registry by 'Registry.ReadString' and so on
      Registry.CloseKey;
    end;
  finally
    Registry.Free;
  end;
end;

procedure TOptionsReg.SaveToRegistry;
var
  Registry: TRegistry;
begin
  Registry := TRegistry.Create;
  try
    if Registry.OpenKey(FKeyPath, True) then
    begin
      // Save field values to registry by 'Registry.WriteString' and so on
      Registry.CloseKey;
    end;
  finally
    Registry.Free;
  end;
end;

initialization

  OptionsReg := TOptionsReg.Create;
  OptionsReg.KeyPath := OptionsRegKeyPath;
  OptionsReg.LoadFromRegistry;

finalization

  OptionsReg.SaveToRegistry;
  OptionsReg.Free;

end.