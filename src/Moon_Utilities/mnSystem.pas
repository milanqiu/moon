unit mnSystem;

interface

var
{--------------------------------
  应用程序所在路径，也就是被执行的exe的路径。
  Tested in TestUnit.
 --------------------------------}
  mnAppPath: string;

{--------------------------------
  基于应用程序所在路径，从其下的子目录或子文件的相对路径得到其绝对路径。
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
