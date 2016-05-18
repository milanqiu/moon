unit mnSystem;

interface

var
{--------------------------------
  The path which the current application locates in.
  Tested in TestUnit.
 --------------------------------}
  mnAppPath: string;

{--------------------------------
  Returns the absolute path from the relative path of sub directory or sub file in application path.
  Tested in TestUnit.
 --------------------------------}
function mnAppPathSub(const SubName: string): string; overload;
function mnAppPathSub(const SubNameFormat: string; const Args: array of const): string; overload;

implementation

uses SysUtils, Forms;

function mnAppPathSub(const SubName: string): string; overload;
begin
  Result := mnAppPath + SubName;
end;

function mnAppPathSub(const SubNameFormat: string; const Args: array of const): string; overload;
begin
  Result := Format(mnAppPath + SubNameFormat, Args);
end;

initialization

  mnAppPath := ExtractFilePath(Application.ExeName);

finalization

end.
