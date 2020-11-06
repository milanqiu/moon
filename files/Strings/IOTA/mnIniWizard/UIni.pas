unit UOptionsIni;

interface

type
  TOptionsIni = class
  private
    FFileName: string;
    // Put private values of data fields here
  public
    property FileName: string read FFileName write FFileName;
    // Put public properties of data fields here
  public
    procedure LoadFromFile;
    procedure SaveToFile;
  end;

var
  OptionsIni: TOptionsIni;

implementation

uses IniFiles, mnSystem;

const
  // Set ini file name here
  OptionsIniFileName = 'Options.ini';

{ TOptionsIni }

procedure TOptionsIni.LoadFromFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(FFileName);
  try
    // Load field values from file by 'IniFile.ReadString' and so on
  finally
    IniFile.Free;
  end;
end;

procedure TOptionsIni.SaveToFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(FFileName);
  try
    // Save field values to file by 'IniFile.WriteString' and so on
  finally
    IniFile.Free;
  end;
end;

initialization

  OptionsIni := TOptionsIni.Create;
  OptionsIni.FileName := mnAppPath + OptionsIniFileName;
  OptionsIni.LoadFromFile;

finalization

  OptionsIni.SaveToFile;
  OptionsIni.Free;

end.