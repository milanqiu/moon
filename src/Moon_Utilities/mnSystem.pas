unit mnSystem;

interface

var
{--------------------------------
  Ӧ�ó�������·����Ҳ���Ǳ�ִ�е�exe��·����
  Tested in TestUnit.
 --------------------------------}
  mnAppPath: string;

{--------------------------------
  ����Ӧ�ó�������·���������µ���Ŀ¼�����ļ������·���õ������·����
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
