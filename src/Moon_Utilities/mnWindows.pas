unit mnWindows;

interface

uses Windows, Controls, Graphics, Classes, mnSystem, mnString, Messages, mnGraphics;

{--------------------------------
  ��Windows�����д����͹ر�Desktop��
  mnCreateDesktop�����´�����Desktop�ľ����
  mnCloseDesktop�����Ƿ�ɹ��رա�
  Tested in TestApp.
 --------------------------------}
function mnCreateDesktop(const DesktopName: string): HDESK;
function mnCloseDesktop(const DesktopHandle: HDESK): Boolean;

{--------------------------------
  ͨ�������з�ʽִ���κ��������exe�����Դ���һ�����̡�
  ShowWindowָʾ�������еĳ�������Ƿ�ɼ���
  OwnerDesktopNameָʾ���ĸ�Desktop�д��������Ϊ�գ����ڵ�ǰDesktop�д�����
  ��������ڵ�ǰDesktop�д������������еĳ�����潫���û����ɼ���
  �����´����Ľ��̵ľ����
  Tested in TestApp.
 --------------------------------}
function mnCreateProcess(const CmdLine: string; const ShowWindow: Boolean = True; const OwnerDesktopName: string = ''): THandle;
{--------------------------------
  ǿ����ֹһ�����̡�
  �����Ƿ�ɹ���ֹ��
  Tested in TestApp.
 --------------------------------}
function mnTerminateProcess(const ProcessHandle: THandle): Boolean;
{--------------------------------
  �ж�һ�������Ƿ��ѽ�����
  Tested in TestApp.
 --------------------------------}
function mnHasProcessExited(const ProcessHandle: THandle): Boolean;

{--------------------------------
  ��Windows�����д�һ���ļ������ļ��У�����ַ�����κ��ܴ򿪵Ķ���
  �Ϳ�ʼ�˵��еġ����С�Ч����ͬ��
  ��������п�ִ�г��򣬿�ʹ��Parameter������ò�����
  Tested in TestApp.
 --------------------------------}
procedure mnShellOpen(const Name: string; const Parameter: string = '');

{--------------------------------
  �õ�ָ���ļ����ļ��汾�š�
  Tested in TestApp.
 --------------------------------}
function mnGetFileVersion(const FileName: string): String;

{--------------------------------
  �õ����ؼ��������
  Tested in TestApp.
 --------------------------------}
function mnLocalhostName: string;

{--------------------------------
  �õ���������ʱ�ļ��洢��·����
  Tested in TestApp.
 --------------------------------}
function mnTempPath: string;

{--------------------------------
  �رա�������ע���������
  Tested in TestApp.
 --------------------------------}
procedure mnShutDownComputer;
procedure mnRebootComputer;
procedure mnLogoffComputer;

type
{--------------------------------
  ����ϵͳ���ԡ�
 --------------------------------}
  mnTOSLanguage = (olTaiwan, olChinese, olHongKong, olJapanese, olKorean, olUSA, olOther);

{--------------------------------
  �õ���������ϵͳ�����ԡ�
  Tested in TestApp.
 --------------------------------}
function mnGetOSLanguage: mnTOSLanguage;

{--------------------------------
  ���һ����Ϣ�Ƿ��������Ϣ��
  Tested in TestApp.
 --------------------------------}
function mnIsMouseMsg(const AMsg: TMsg): Boolean;
{--------------------------------
  �������Ϣ�н��������λ�á�
  ����֮ǰ�������ȵ���mnIsMouseMsg�����ȷ���������Ϣ�������Ϣ��
  ���ص�λ�ò��Ǵ�����Ļ����ϵ�У����Ǵ��ڸ�λ�����ڿؼ�������ϵ�С�
  Tested in TestApp.
 --------------------------------}
function mnPointFromMouseMsg(const AMsg: TMsg): TPoint;
{--------------------------------
  �������Ϣ�н������������λ�õĿؼ���
  ����֮ǰ�������ȵ���mnIsMouseMsg�����ȷ���������Ϣ�������Ϣ��
  Tested in TestApp.
 --------------------------------}
function mnControlFromMouseMsg(const AMsg: TMsg): TWinControl;
{--------------------------------
  ����Ƿ������Ϣ����ָ���ؼ��ķ�Χ�ڴ����ġ�
  ����֮ǰ�������ȵ���mnIsMouseMsg�����ȷ���������Ϣ�������Ϣ��
  Tested in TestApp.
 --------------------------------}
function mnMouseMsgInControl(const AMsg: TMsg; AControl: TControl): Boolean;

{--------------------------------
  �����������λ�á�ʹ����Ļ����ϵ��
  Tested in TestApp.
 --------------------------------}
function mnMousePos: TPoint;

{--------------------------------
  ģ����굥����˫�����Ҽ���������֡�
  Tested in TestApp.
 --------------------------------}
procedure mnMouseClick;
procedure mnMouseDblClick;
procedure mnMouseRightClick;
procedure mnMouseWheel(const Delta: Integer);

{--------------------------------
  ���һ��Virtual Key�Ƿ��������£���һ��Char Key�Ƿ��������¡�
  Tested in TestApp.
 --------------------------------}
function mnIsVKeyHold(const VKey: Integer): Boolean;
function mnIsKeyHold(const Key: Char): Boolean;

{--------------------------------
  ģ�ⰴ�¡�������û�һ��Virtual Key��
  Tested in TestApp.
 --------------------------------}
procedure mnVKeyDown(const VKey: Integer);
procedure mnVKeyUp(const VKey: Integer);
procedure mnVKeyPress(const VKey: Integer);
{--------------------------------
  ģ���û�һ��Char Key����˳���û�һ���ַ�����
  Tested in TestApp.
 --------------------------------}
procedure mnKeyPress(const Key: Char); overload;
procedure mnKeyPress(const Keys: string); overload;

type
{--------------------------------
  ���ھ�������ָ�롣
 --------------------------------}
  mnTHWNDArray = array of HWND;
  mnPHWND = ^HWND;
{--------------------------------
  �ڴ��ھ�������ָ���б�֮��ת����
  Tested in TestUnit.
 --------------------------------}
function mnHWNDArrayToList(const HWNDArray: mnTHWNDArray): TList;
function mnHWNDListToArray(const HWNDList: TList): mnTHWNDArray;

{--------------------------------
  �õ�ָ�����ڵ���������⡣
  ���ָ�����ڲ����ڣ����׳��쳣��
  Tested in TestApp.
 --------------------------------}
function mnGetWindowClassName(const Window: HWND): string;
function mnGetWindowCaption(const Window: HWND): string;
{--------------------------------
  �õ�ָ���Ķ�����ڵ���������⡣
  Tested in TestApp.
 --------------------------------}
procedure mnGetWindowsClassNames(const Windows: mnTHWNDArray; ClassNames: TStrings);
procedure mnGetWindowsCaptions(const Windows: mnTHWNDArray; Captions: TStrings);

const
{--------------------------------
  ��׼�Ĵ���������ʽ��
 --------------------------------}
  mnStdWindowDescriptionFormat = '%0:d:%2:s[%1:s]';
{--------------------------------
  �õ�ָ���Ķ�����ڵ������������ɴ��ھ��ID�����ͱ���ƴ�Ӷ��ɣ���ʽ��Format��ʽ���롣
  Tested in TestApp.
 --------------------------------}
procedure mnGetWindowsDescriptions(const Windows: mnTHWNDArray; Descriptions: TStrings; const DescriptionFormat: string = mnStdWindowDescriptionFormat);

{--------------------------------
  �õ�ϵͳ��ȫ�����ڵ������������ɴ��ھ��ID�����ͱ���ƴ�Ӷ��ɣ���ʽ��Format��ʽ���롣
  ��ָ���Ƿ�ֻȡ�ɼ��Ĵ��ڡ�
  Tested in TestApp.
 --------------------------------}
procedure mnGetAllWindowsDescriptions(Descriptions: TStrings; const VisibleRequired: Boolean = True; const DescriptionFormat: string = mnStdWindowDescriptionFormat);

type
{--------------------------------
  ���ڲ��Ҵ���ʱ���������
    ParentWindow�������ĸ����ڡ�
    ClassName����ƥ���������
    ClassNameMatchOptions��ƥ������ʱ�ıȽ�ѡ�
    Caption����ƥ��ı��⡣
    CaptionMatchOptions��ƥ�����ʱ�ıȽ�ѡ�
    VisibleRequired���Ƿ�Ҫ�󴰿ڿɼ���
 --------------------------------}
  mnTFindWindowsOption = record
    ParentWindow: HWND;
    ClassName: string;
    ClassNameMatchOptions: mnTStrComparisonOptions;
    Caption: string;
    CaptionMatchOptions: mnTStrComparisonOptions;
    VisibleRequired: Boolean;
  end;
{--------------------------------
  ȱʡ�Ĳ��Ҵ���ѡ�û�������κ��������Զ�������������ڴ˻������޸ġ�
  No test.
 --------------------------------}
function mnDefaultFindWindowsOption: mnTFindWindowsOption;
{--------------------------------
  ���Ҵ��ڣ����ش��ھ�����顣
  Tested in TestApp.
 --------------------------------}
function mnFindWindows(const Option: mnTFindWindowsOption): mnTHWNDArray;
{--------------------------------
  ���ҵ�һ����������ѡ��Ĵ��ڡ�
  ���û���ҵ�������High(HWND)��
  Tested in TestApp.
 --------------------------------}
function mnFindFirstWindow(const Option: mnTFindWindowsOption): HWND;

{--------------------------------
  �ж�һ�������Ƿ���ڡ�
  No test.
 --------------------------------}
function mnWindowIsPresent(const Window: HWND): Boolean;
{--------------------------------
  �ж�һ�������Ƿ񲻴��ڡ�
  No test.
 --------------------------------}
function mnWindowIsAbsent(const Window: HWND): Boolean;
{--------------------------------
  ��֤һ�����ڵĴ��ڣ�������ʱ�׳��쳣��
  No test.
 --------------------------------}
procedure mnValidateWindowIsPresent(const Window: HWND; const ErrorMsg: string = '');

{--------------------------------
  Ӧ�ó������ֱ������ָ��ѡ��Ĵ��ڴ��ڡ�
  ���ظô��ڡ�
  Tested in TestApp.
 --------------------------------}
function mnSleepUntilWindowIsPresent(const Option: mnTFindWindowsOption; const SleepInterval: Integer = 50): HWND;
{--------------------------------
  Ӧ�ó������ֱ������ָ��ѡ��Ĵ��ڲ��ٴ��ڡ�
  Tested in TestApp.
 --------------------------------}
procedure mnSleepUntilWindowIsAbsent(const Option: mnTFindWindowsOption; const SleepInterval: Integer = 50); overload;
{--------------------------------
  Ӧ�ó������ֱ��ָ�����ڲ��ٴ��ڡ�
  No test.
 --------------------------------}
procedure mnSleepUntilWindowIsAbsent(const Window: HWND; const SleepInterval: Integer = 50); overload;
{--------------------------------
  Ӧ�ó������ֱ��ָ�����ڱ�ɵ�ǰ���㴰�ڡ�
  Tested in TestApp.
 --------------------------------}
procedure mnSleepUntilWindowIsForeground(const Window: HWND; const SleepInterval: Integer = 50);

{--------------------------------
  Ӧ�ó������ֱ��ָ�����ڵĽ�ͼ����ָ��ͼƬ��
  Tested in TestApp.
 --------------------------------}
procedure mnSleepUntilWindowContainsImage(const Window: HWND; const Image: mnTPixeledImage;                    const SleepInterval: Integer = 50); overload;
procedure mnSleepUntilWindowContainsImage(const Window: HWND; const Image: mnTPixeledImage; var X, Y: Integer; const SleepInterval: Integer = 50); overload;

{--------------------------------
  Ӧ�ó������ֱ��ָ�����ڵĽ�ͼ����ָ��ͼƬ��Ȼ������Ƶ�ָ�����ڵ�ͼƬ���򲢵����
  Tested in TestApp.
 --------------------------------}
procedure mnSleepAndClickUntilWindowContainsImage(const Window: HWND; const Image: mnTPixeledImage; const SleepInterval: Integer = 50);

{--------------------------------
  ������ƶ���ָ�����ڵ�(X, Y)����
  (X, Y)�����Դ������Ͻ�Ϊԭ�㡣
  Tested in TestApp.
 --------------------------------}
procedure mnSetCursorPosOnWindow(const Window: HWND; const X, Y: Integer);
{--------------------------------
  ������ƶ���ָ�����ڵ�(X, Y)���������
  (X, Y)�����Դ������Ͻ�Ϊԭ�㡣
  Tested in TestApp.
 --------------------------------}
procedure mnClickWindow(const Window: HWND; const X, Y: Integer);

{--------------------------------
  ��ָ�����ڷ���һ��Virtual Key��
  mnPostVKeyToWindow��mnPostSysVKeyToWindow�ֱ�ʹ��WM_KEYDOWN��WM_SYSKEYDOWN������Ϣ������������Virtual Key���ܵõ���ȷ����Ҫ�����ھ�������δ���ġ�
  Tested in TestApp.
 --------------------------------}
procedure mnPostVKeyToWindow(const Window: HWND; const VKey: Integer);
procedure mnPostSysVKeyToWindow(const Window: HWND; const VKey: Integer);
{--------------------------------
  ��ָ�����ڷ���һ��Char Key��
  Tested in TestApp.
 --------------------------------}
procedure mnPostKeyToWindow(const Window: HWND; const Key: Char);

type
{--------------------------------
  ���ڲ��ҽ���ʱ���������
    ExeFile����ƥ���ExeFile��
    ExeFileMatchOptions��ƥ��ExeFileʱ�ıȽ�ѡ�
 --------------------------------}
  mnTFindProcessOption = record
    ExeFile: string;
    ExeFileMatchOptions: mnTStrComparisonOptions;
  end;
{--------------------------------
  ȱʡ�Ĳ��ҽ���ѡ�û�������κ��������Զ�������������ڴ˻������޸ġ�
  No test.
 --------------------------------}
function mnDefaultFindProcessOption: mnTFindProcessOption;

{--------------------------------
  ���ҽ��̣����ؽ���ID���顣
  Tested in TestApp.
 --------------------------------}
function mnFindProcesses(const Option: mnTFindProcessOption): mnTDWORDArray;
{--------------------------------
  ���ҵ�һ����������ѡ��Ľ��̡�
  ���û���ҵ�������High(DWORD)��
  Tested in TestApp.
 --------------------------------}
function mnFindFirstProcess(const Option: mnTFindProcessOption): DWORD;

{--------------------------------
  ���ݽ���ID���������Ȩ�޴򿪽��̣����ؽ��̵ľ����
  Tested in TestApp.
 --------------------------------}
function mnOpenProcess(const ProcessID: DWORD; const DesiredAccess: DWORD = PROCESS_ALL_ACCESS): THandle;

{--------------------------------
  Windows API.
 --------------------------------}
procedure DragAcceptFiles(hWnd: Cardinal; fAccept: Boolean); stdcall; external 'Shell32';
function DragQueryFile(hDrop: Cardinal; iFile: Cardinal; lpszFile: PChar; cch: Integer): Integer; stdcall; external 'Shell32';
function DragQueryPoint(hDrop: Cardinal; ppt: PPoint): Boolean; stdcall; external 'Shell32';
procedure DragFinish(hDrop: Cardinal); stdcall; external 'Shell32';

{--------------------------------
  ����ָ�������ָ���ؼ������ļ����롣
  Tested in TestApp.
 --------------------------------}
procedure mnAcceptDropFiles(AHandle: THandle); overload;
procedure mnAcceptDropFiles(AWinControl: TWinControl); overload;
{--------------------------------
  �����ļ�������Ϣ���õ�������ļ�������
  Tested in TestApp.
 --------------------------------}
function mnGetDropFileCount(const AMsg: TWMDropFiles): Integer;
{--------------------------------
  �����ļ�������Ϣ���õ�ָ�������������ļ�����������0��ʼ��
  Tested in TestApp.
 --------------------------------}
function mnGetDropFileName(const AMsg: TWMDropFiles; const FileIndex: Integer = 0): string;
{--------------------------------
  �����ļ�������Ϣ���õ����������ļ�����
  Tested in TestApp.
 --------------------------------}
function mnGetDropFileNames(const AMsg: TWMDropFiles): mnTStrArray;
{--------------------------------
  �����ļ�������Ϣ���õ������ļ��ͷ�ʱ�����λ�á�
  Tested in TestApp.
 --------------------------------}
function mnGetDropFilesPoint(const AMsg: TWMDropFiles): TPoint;
{--------------------------------
  �ս��ļ�������Ϣ�������ͷ��ڴ�Ȳ�����
  Tested in TestApp.
 --------------------------------}
procedure mnFinishDropFiles(var AMsg: TWMDropFiles);

{--------------------------------
  �õ�ָ��������ĳ�����ɫ��
  ��û��ָ�����ڣ��򷵻���Ļĳ�����ɫ��
  Tested in TestApp.
 --------------------------------}
function mnGetWindowColor(const APoint: TPoint; const Window: HWND = 0): TColor;

{--------------------------------
  Windows API.
 --------------------------------}
function PrintWindow(hWnd: HWND; hdcBlt: HDC; nFlags: UINT): BOOL; stdcall; external user32 name 'PrintWindow';

{--------------------------------
  �������������Ĺ��ܶ��ǽ�ȡָ��������ĳ�����ͼ�񣬲����Ƶ�Canvas��(CanvasX, CanvasY)����
  ��û��ָ�����ڣ����ȡ��Ļĳ�����ͼ��
  ������һ��λ��ǰ�ˣ����ڵ�������Ļ��Կɣ���������С����Ҳ���ܱ�hide��
  ������������ʵ�ַ�����ͬ����ʵ�����й����У���һ���ܳɹ���ȡ���ڲ���ϵͳ�汾��Ӧ�ó���Ľ�����Ʒ�ʽ����ȡ���ڵ��������ȵȡ�
  ͨ���أ������Ҫ��ȡ����Ӧ�ó��������ڣ��ʺ���mnSnapWindowEx��������ӿؼ����ڣ��ʺ���mnSnapWindow��
  Tested in TestApp.
 --------------------------------}
procedure mnSnapWindow(Canvas: TCanvas; const ARect: TRect; const Window: HWND = 0;
  const CanvasX: Integer = 0; const CanvasY: Integer = 0);
procedure mnSnapWindowEx(Canvas: TCanvas; const ARect: TRect; const Window: HWND = 0;
  const CanvasX: Integer = 0; const CanvasY: Integer = 0);

{--------------------------------
  װ����Դ�������ַ�����ʽ���ء�
  ����ָ����Դ�ľ������û��ָ����ʹ��Ӧ�ó���ľ������HInstance��
  Tested in TestUnit.
 --------------------------------}
function mnLoadResAsStr(                  ResName: PChar; ResType: PChar = RT_RCDATA): string; overload;
function mnLoadResAsStr(AHandle: THandle; ResName: PChar; ResType: PChar = RT_RCDATA): string; overload;

{--------------------------------
  ��ͣ�ͼ���ָ��������ػ���
  ���ԣ���
 --------------------------------}
procedure mnPauseRedraw(AHandle: THandle);
procedure mnResumeRedraw(AHandle: THandle);

implementation

uses ShellAPI, Forms, mnControl, mnResStrsU, SysUtils, Types, TLHelp32;

function mnCreateDesktop(const DesktopName: string): HDESK;
begin
  Result := CreateDesktop(PChar(DesktopName), nil, nil, 0, GENERIC_ALL, nil);
end;

function mnCloseDesktop(const DesktopHandle: HDESK): Boolean;
begin
  if DesktopHandle <> 0 then
    Result := CloseDesktop(DesktopHandle)
  else
    Result := False;
end;

function mnCreateProcess(const CmdLine: string; const ShowWindow: Boolean = True; const OwnerDesktopName: string = ''): THandle;
var
  SI: TStartupInfo;
  PI: TProcessInformation;
begin
  FillChar(SI, SizeOf(SI), 0);
  SI.cb := SizeOf(SI);
  SI.dwFlags := STARTF_USESHOWWINDOW;
  SI.wShowWindow := mnChooseInt(ShowWindow, SW_SHOW, SW_HIDE);
  SI.hStdInput := 0;
  SI.hStdOutput := 0;
  SI.hStdError := 0;
  if OwnerDesktopName <> '' then SI.lpDesktop := PChar(OwnerDesktopName);
  CreateProcess(nil, PChar(CmdLine), nil, nil, False, CREATE_NEW_CONSOLE, nil, nil, SI, PI);
  Result := PI.hProcess;
end;

function mnTerminateProcess(const ProcessHandle: THandle): Boolean;
begin
  if ProcessHandle <> 0 then
    Result := TerminateProcess(ProcessHandle, 0)
  else
    Result := False;
end;

function mnHasProcessExited(const ProcessHandle: THandle): Boolean;
begin
  if ProcessHandle <> 0 then
    Result := WaitForSingleObject(ProcessHandle, 0) = WAIT_OBJECT_0
  else
    Result := True;
end;

procedure mnShellOpen(const Name: string; const Parameter: string = '');
begin
  if Parameter = '' then
    ShellExecute(Application.Handle, 'open', PChar(Name), nil, nil, SW_SHOW)
  else
    ShellExecute(Application.Handle, 'open', PChar(Name), PChar(Parameter), nil, SW_SHOW);
end;

type
  TFixedFileInfo = record
    dwSignature:        DWORD;
    dwStrucVersion:     DWORD;
    dwFileVersionMS:    DWORD;
    dwFileVersionLS:    DWORD;
    dwProductVersionMS: DWORD;
    dwProductVersionLS: DWORD;
    dwFileFlagsMask:    DWORD;
    dwFileFlags:        DWORD;
    dwFileOS:           DWORD;
    dwFileType:         DWORD;
    dwFileSubtype:      DWORD;
    dwFileDateMS:       DWORD;
    dwFileDateLS:       DWORD;
  end;
  PFixedFileInfo = ^TFixedFileInfo;

function mnGetFileVersion(const FileName: string): String;
var
  CFileName: array [0..255] of Char;
  Len: DWORD;
  Buffer: Pointer;
  PFFI: PFixedFileInfo;
begin
  StrPCopy(CFileName, FileName);
  Result := '';

  Len := GetFileVersionInfoSize(CFileName, Len);
  if Len = 0 then Exit;

  GetMem(Buffer, Len);
  try
    GetFileVersionInfo(CFileName, 0, Len, Buffer);
    if VerQueryValue(Buffer, '\', Pointer(PFFI), Len) then
    begin
      Result := Format('%d.%d.%d.%d',
                       [HiWord(PFFI.dwFileVersionMS), LoWord(PFFI.dwFileVersionMS),
                        HiWord(PFFI.dwFileVersionLS), LoWord(PFFI.dwFileVersionLS)]);
    end;
  finally
    FreeMem(Buffer);
  end;
end;

function mnLocalhostName: string;
var
  Name: array [0..255] of Char;
  Size: DWORD;
begin
  Size := SizeOf(Name);
  if GetComputerName(Name, Size) then
    Result := Name
  else Result := '';
end;

function mnTempPath: string;
var
  Path: array [0..255] of Char;
  Size: DWORD;
begin
  Size := SizeOf(Path);
  if GetTempPath(Size, Path) > 0 then
    Result := Path
  else Result := '';
end;

function SetShutdownPrivilege: Boolean;
var
  hToken: THandle;
  dwLen: DWORD;
  tkp, otkp: TOKEN_PRIVILEGES;
begin
  if OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken) then
  begin
    LookupPrivilegeValue(nil, 'SeShutdownPrivilege', tkp.Privileges[0].Luid);
    tkp.PrivilegeCount := 1;
    tkp.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
    AdjustTokenPrivileges(hToken, False, tkp, sizeof(tkp), otkp, dwLen);
    Result := GetLastError = ERROR_SUCCESS;
  end
  else Result := False;
end;

procedure mnShutDownComputer;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    if SetShutdownPrivilege then
      ExitWindowsEx(EWX_SHUTDOWN, 0)
    else mnCreateError(SShutdownPrivilegeError)
  else ExitWindowsEx(EWX_SHUTDOWN, 0);
end;

procedure mnRebootComputer;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    if SetShutdownPrivilege then
      ExitWindowsEx(EWX_REBOOT, 0)
    else mnCreateError(SShutdownPrivilegeError)
  else ExitWindowsEx(EWX_REBOOT, 0);
end;

procedure mnLogoffComputer;
begin
  ExitWindowsEx(EWX_LOGOFF, 0);
end;

function mnGetOSLanguage: mnTOSLanguage;
begin
  case GetSystemDefaultLangID of
    $0404: Result := olTaiwan;
    $0804: Result := olChinese;
    $0C04: Result := olHongKong;
    $0411: Result := olJapanese;
    $0412: Result := olKorean;
    $0409: Result := olUSA;
  else
    Result := olOther;
  end;
end;

function mnIsMouseMsg(const AMsg: TMsg): Boolean;
begin
  Result := (AMsg.message >= WM_MOUSEFIRST) and (AMsg.message <= WM_MOUSELAST);
end;

function mnPointFromMouseMsg(const AMsg: TMsg): TPoint;
begin
  Result := Point(LOWORD(AMsg.lParam), HIWORD(AMsg.lParam));
end;

function mnControlFromMouseMsg(const AMsg: TMsg): TWinControl;
begin
  Result := FindControl(AMsg.hwnd);
end;

function mnMouseMsgInControl(const AMsg: TMsg; AControl: TControl): Boolean;
begin
  Result := mnPointInControl(mnControlFromMouseMsg(AMsg).ClientToScreen(mnPointFromMouseMsg(AMsg)), AControl);
end;

function mnMousePos: TPoint;
begin
  GetCursorPos(Result);
end;

procedure mnMouseClick;
begin
  mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
  mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
end;

procedure mnMouseDblClick;
begin
  mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
  mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
  mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
  mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
end;

procedure mnMouseRightClick;
begin
  mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0);
  mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
end;

procedure mnMouseWheel(const Delta: Integer);
begin
  mouse_event(MOUSEEVENTF_WHEEL, 0, 0, Delta, 0);
end;

function mnIsVKeyHold(const VKey: Integer): Boolean;
begin
  Result := (GetKeyState(VKey) and $80) <> 0;
end;

function mnIsKeyHold(const Key: Char): Boolean;
var
  VKey: Word;
  VKeyH, VKeyL: Byte;
begin
  VKey := VkKeyScan(Key);
  VKeyL := VKey and $FF;
  VKeyH := VKey shr 8;
  Result := mnIsVKeyHold(VKeyL)
    and not (((VKeyH and $01) <> 0) xor mnIsVKeyHold(VK_SHIFT))
    and not (((VKeyH and $02) <> 0) xor mnIsVKeyHold(VK_CONTROL))
    and not (((VKeyH and $04) <> 0) xor mnIsVKeyHold(VK_MENU));
end;

procedure mnVKeyDown(const VKey: Integer);
begin
  keybd_event(VKey, 0, 0, 0);
end;

procedure mnVKeyUp(const VKey: Integer);
begin
  keybd_event(VKey, 0, KEYEVENTF_KEYUP, 0);
end;

procedure mnVKeyPress(const VKey: Integer);
begin
  keybd_event(VKey, 0, 0, 0);
  keybd_event(VKey, 0, KEYEVENTF_KEYUP, 0);
end;

procedure mnKeyPress(const Key: Char); overload;
var
  VKey: Word;
  VKeyH, VKeyL: Byte;
begin
  VKey := VkKeyScan(Key);
  VKeyL := VKey and $FF;
  VKeyH := VKey shr 8;
  if (VKeyH and $01) <> 0 then mnVKeyDown(VK_SHIFT);
  if (VKeyH and $02) <> 0 then mnVKeyDown(VK_CONTROL);
  if (VKeyH and $04) <> 0 then mnVKeyDown(VK_MENU);
  mnVKeyPress(VKeyL);
  if (VKeyH and $04) <> 0 then mnVKeyUp(VK_MENU);
  if (VKeyH and $02) <> 0 then mnVKeyUp(VK_CONTROL);
  if (VKeyH and $01) <> 0 then mnVKeyUp(VK_SHIFT);
end;

procedure mnKeyPress(const Keys: string); overload;
var
  i: Integer;
begin
  for i := 1 to Length(Keys) do
    mnKeyPress(Keys[i]);
end;

function mnHWNDArrayToList(const HWNDArray: mnTHWNDArray): TList;
var
  H: HWND;
  P: mnPHWND;
begin
  Result := TList.Create;
  Result.Capacity := Length(HWNDArray);
  for H in HWNDArray do
  begin
    New(P);
    P^ := H;
    Result.Add(P);
  end;
end;

function mnHWNDListToArray(const HWNDList: TList): mnTHWNDArray;
var
  i: Integer;
begin
  SetLength(Result, HWNDList.Count);
  for i := 0 to HWNDList.Count-1 do
    Result[i] := mnPHWND(HWNDList[i])^;
end;

function mnGetWindowClassName(const Window: HWND): string;
var
  ClassName: array [0..255] of Char;
begin
  mnCreateErrorIf(mnWindowIsAbsent(Window), SWindowNotExists);
  if GetClassName(Window, ClassName, SizeOf(ClassName)) <> 0 then
    Result := ClassName
  else Result := '';
end;

function mnGetWindowCaption(const Window: HWND): string;
var
  Caption: array [0..255] of Char;
begin
  mnCreateErrorIf(mnWindowIsAbsent(Window), SWindowNotExists);
  if GetWindowText(Window, Caption, SizeOf(Caption)) <> 0 then
    Result := Caption
  else Result := '';
end;

procedure mnGetWindowsClassNames(const Windows: mnTHWNDArray; ClassNames: TStrings);
var
  Window: HWND;
begin
  ClassNames.Capacity := ClassNames.Count + Length(Windows);
  for Window in Windows do
    ClassNames.Append(mnGetWindowClassName(Window));
end;

procedure mnGetWindowsCaptions(const Windows: mnTHWNDArray; Captions: TStrings);
var
  Window: HWND;
begin
  Captions.Capacity := Captions.Count + Length(Windows);
  for Window in Windows do
    Captions.Append(mnGetWindowCaption(Window));
end;

procedure mnGetWindowsDescriptions(const Windows: mnTHWNDArray; Descriptions: TStrings; const DescriptionFormat: string = mnStdWindowDescriptionFormat);
var
  Window: HWND;
begin
  Descriptions.Capacity := Descriptions.Count + Length(Windows);
  for Window in Windows do
    Descriptions.Append(Format(DescriptionFormat, [Window, mnGetWindowClassName(Window), mnGetWindowCaption(Window)]));
end;

procedure mnGetAllWindowsDescriptions(Descriptions: TStrings; const VisibleRequired: Boolean = True; const DescriptionFormat: string = mnStdWindowDescriptionFormat);
var
  Option: mnTFindWindowsOption;
  Windows: mnTHWNDArray;
begin
  Option := mnDefaultFindWindowsOption;
  Option.VisibleRequired := VisibleRequired;
  Windows := mnFindWindows(Option);
  mnGetWindowsDescriptions(Windows, Descriptions, DescriptionFormat);
end;

function mnDefaultFindWindowsOption: mnTFindWindowsOption;
begin
  Result.ParentWindow := 0;
  Result.ClassName := '';
  Result.ClassNameMatchOptions := [];
  Result.Caption := '';
  Result.CaptionMatchOptions := [];
  Result.VisibleRequired := False;
end;

function mnFindWindows(const Option: mnTFindWindowsOption): mnTHWNDArray;
type
  TEnumParam = record
    Option: mnTFindWindowsOption;
    Windows: TList;
  end;
  PEnumParam = ^TEnumParam;
var
  P: PEnumParam;
  Windows: TList;

  function EnumWindowsFunc(Window: HWND; lParam: LPARAM): Boolean; stdcall;
  var
    P: PEnumParam;
    PWindow: mnPHWND;
  begin
    Result := True;
    P := PEnumParam(lParam);
    if not mnCompareStr(mnGetWindowClassName(Window), P.Option.ClassName, P.Option.ClassNameMatchOptions) then
      Exit;
    if not mnCompareStr(mnGetWindowCaption(Window), P.Option.Caption, P.Option.CaptionMatchOptions) then
      Exit;
    if P.Option.VisibleRequired and not IsWindowVisible(Window) then
      Exit;
    New(PWindow);
    PWindow^ := Window;
    P.Windows.Add(PWindow);
  end;

begin
  Windows := TList.Create;
  New(P);
  try
    P.Option := Option;
    P.Windows := Windows;
    if Option.ParentWindow = 0 then
      EnumWindows(@EnumWindowsFunc, LPARAM(P))
    else
      EnumChildWindows(Option.ParentWindow, @EnumWindowsFunc, LPARAM(P));
    Result := mnHWNDListToArray(Windows);
    mnClearList(Windows);
  finally
    Dispose(P);
    Windows.Free;
  end;
end;

function mnFindFirstWindow(const Option: mnTFindWindowsOption): HWND;
type
  TEnumParam = record
    Option: mnTFindWindowsOption;
    Window: HWND;
  end;
  PEnumParam = ^TEnumParam;
var
  P: PEnumParam;

  function EnumWindowsFunc(Window: HWND; lParam: LPARAM): Boolean; stdcall;
  var
    P: PEnumParam;
  begin
    Result := True;
    P := PEnumParam(lParam);
    if not mnCompareStr(mnGetWindowClassName(Window), P.Option.ClassName, P.Option.ClassNameMatchOptions) then
      Exit;
    if not mnCompareStr(mnGetWindowCaption(Window), P.Option.Caption, P.Option.CaptionMatchOptions) then
      Exit;
    if P.Option.VisibleRequired and not IsWindowVisible(Window) then
      Exit;
    P.Window := Window;
    Result := False;
  end;

begin
  New(P);
  try
    P.Option := Option;
    P.Window := High(HWND);
    if Option.ParentWindow = 0 then
      EnumWindows(@EnumWindowsFunc, LPARAM(P))
    else
      EnumChildWindows(Option.ParentWindow, @EnumWindowsFunc, LPARAM(P));
    Result := P.Window;
  finally
    Dispose(P);
  end;
end;

function mnWindowIsPresent(const Window: HWND): Boolean;
begin
  Result := (Window <> 0) and IsWindow(Window);
end;

function mnWindowIsAbsent(const Window: HWND): Boolean;
begin
  Result := (Window = 0) or not IsWindow(Window);
end;

procedure mnValidateWindowIsPresent(const Window: HWND; const ErrorMsg: string = '');
begin
  mnCreateErrorIf(mnWindowIsAbsent(Window), mnChooseStr(ErrorMsg = '', SWindowNotExists, ErrorMsg));
end;

function mnSleepUntilWindowIsPresent(const Option: mnTFindWindowsOption; const SleepInterval: Integer = 50): HWND;
begin
  repeat
    Sleep(SleepInterval);
    Result := mnFindFirstWindow(Option);
  until mnWindowIsPresent(Result);
  Sleep(SleepInterval);
end;

procedure mnSleepUntilWindowIsAbsent(const Option: mnTFindWindowsOption; const SleepInterval: Integer = 50); overload;
var
  Window: HWND;
begin
  repeat
    Sleep(SleepInterval);
    Window := mnFindFirstWindow(Option);
  until mnWindowIsAbsent(Window);
end;

procedure mnSleepUntilWindowIsAbsent(const Window: HWND; const SleepInterval: Integer = 50); overload;
begin
  repeat
    Sleep(SleepInterval);
  until mnWindowIsAbsent(Window);
end;

procedure mnSleepUntilWindowIsForeground(const Window: HWND; const SleepInterval: Integer = 50);
begin
  repeat
    Sleep(SleepInterval);
  until GetForegroundWindow = Window;
end;

procedure mnSleepUntilWindowContainsImage(const Window: HWND; const Image: mnTPixeledImage;                    const SleepInterval: Integer = 50); overload;
var
  X, Y: Integer;
begin
  mnSleepUntilWindowContainsImage(Window, Image, X, Y, SleepInterval);
end;

procedure mnSleepUntilWindowContainsImage(const Window: HWND; const Image: mnTPixeledImage; var X, Y: Integer; const SleepInterval: Integer = 50); overload;
var
  WindowImage: mnTPixeledImage;
begin
  WindowImage := mnTPixeledImage.Create;
  try
    repeat
      Sleep(SleepInterval);
      mnCreateErrorIf(mnWindowIsAbsent(Window), SWindowNotExists);
      WindowImage.SnapshotWindow(Window);
    until WindowImage.Find(Image, X, Y);
  finally
    WindowImage.Free;
  end;
end;

procedure mnSleepAndClickUntilWindowContainsImage(const Window: HWND; const Image: mnTPixeledImage; const SleepInterval: Integer = 50);
var
  X, Y: Integer;
begin
  mnSleepUntilWindowContainsImage(Window, Image, X, Y, SleepInterval);
  mnClickWindow(Window, X + Image.Width div 2, Y + Image.Height div 2);
end;

procedure mnSetCursorPosOnWindow(const Window: HWND; const X, Y: Integer);
var
  WindowRect: TRect;
begin
  GetWindowRect(Window, WindowRect);
  SetCursorPos(WindowRect.Left+X, WindowRect.Top+Y);
end;

procedure mnClickWindow(const Window: HWND; const X, Y: Integer);
begin
  mnSetCursorPosOnWindow(Window, X, Y);
  mnMouseClick;
end;

procedure mnPostVKeyToWindow(const Window: HWND; const VKey: Integer);
begin
  PostMessage(Window, WM_KEYDOWN, VKey, 0);
  PostMessage(Window, WM_KEYUP, VKey, 0);
end;

procedure mnPostSysVKeyToWindow(const Window: HWND; const VKey: Integer);
begin
  PostMessage(Window, WM_SYSKEYDOWN, VKey, 0);
  PostMessage(Window, WM_SYSKEYUP, VKey, 0);
end;

procedure mnPostKeyToWindow(const Window: HWND; const Key: Char);
begin
  PostMessage(Window, WM_CHAR, Ord(Key), 0);
end;

function mnDefaultFindProcessOption: mnTFindProcessOption;
begin
  Result.ExeFile := '';
  Result.ExeFileMatchOptions := [];
end;

function mnFindProcesses(const Option: mnTFindProcessOption): mnTDWORDArray;
var
  List: TList;
  Snapshot: THandle;
  ProcessEntry: TProcessEntry32;
  P: PLongWord;
begin
  List := TList.Create;
  try
    Snapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    ProcessEntry.dwSize := SizeOf(ProcessEntry);
    if Process32First(Snapshot, ProcessEntry) then
    begin
      repeat
        if mnCompareStr(ProcessEntry.szExeFile, Option.ExeFile, Option.ExeFileMatchOptions) then
        begin
          P := New(PLongWord);
          P^ := ProcessEntry.th32ProcessID;
          List.Add(P);
        end;
      until not Process32Next(Snapshot, ProcessEntry);
    end;
    CloseHandle(Snapshot);
    Result := mnListToDWORDArray(List);
    mnClearList(List);
  finally
    List.Free;
  end;
end;

function mnFindFirstProcess(const Option: mnTFindProcessOption): DWORD;
var
  Snapshot: THandle;
  ProcessEntry: TProcessEntry32;
begin
  Snapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  ProcessEntry.dwSize := SizeOf(ProcessEntry);
  if Process32First(Snapshot, ProcessEntry) then
  begin
    repeat
      if mnCompareStr(ProcessEntry.szExeFile, Option.ExeFile, Option.ExeFileMatchOptions) then
      begin
        Result := ProcessEntry.th32ProcessID;
        CloseHandle(Snapshot);
        Exit;
      end;
    until not Process32Next(Snapshot, ProcessEntry);
  end;
  Result := High(DWORD);
  CloseHandle(Snapshot);
end;

function mnOpenProcess(const ProcessID: DWORD; const DesiredAccess: DWORD = PROCESS_ALL_ACCESS): THandle;
begin
  Result := OpenProcess(DesiredAccess, True, ProcessID);
end;

procedure mnAcceptDropFiles(AHandle: THandle); overload;
begin
  DragAcceptFiles(AHandle, True);
end;

procedure mnAcceptDropFiles(AWinControl: TWinControl); overload;
begin
  DragAcceptFiles(AWinControl.Handle, True);
end;

function mnGetDropFileCount(const AMsg: TWMDropFiles): Integer;
begin
  Result := DragQueryFile(AMsg.Drop, $FFFFFFFF, nil, 0);
end;

function mnGetDropFileName(const AMsg: TWMDropFiles; const FileIndex: Integer = 0): string;
const
  Size = 65535;
var
  Len: Integer;
begin
  SetLength(Result, Size);
  Len := DragQueryFile(AMsg.Drop, FileIndex, PChar(Result), Size);
  SetLength(Result, Len);
end;

function mnGetDropFileNames(const AMsg: TWMDropFiles): mnTStrArray;
var
  Count: Integer;
  i: Integer;
begin
  Count := mnGetDropFileCount(AMsg);
  SetLength(Result, Count);
  for i := 0 to Count-1 do
    Result[i] := mnGetDropFileName(AMsg, i);
end;

function mnGetDropFilesPoint(const AMsg: TWMDropFiles): TPoint;
var
  PP: PPoint;
begin
  New(PP);
  try
    DragQueryPoint(AMsg.Drop, PP);
    Result := PP^;
  finally
    Dispose(PP);
  end;
end;

procedure mnFinishDropFiles(var AMsg: TWMDropFiles);
begin
  DragFinish(AMsg.Drop);
  AMsg.Result := 0;
end;

function mnGetWindowColor(const APoint: TPoint; const Window: HWND = 0): TColor;
var
  WindowDC: HDC;
begin
  if Window = 0 then
    WindowDC := GetWindowDC(GetDesktopWindow)
  else
    WindowDC := GetWindowDC(Window);
  Result := GetPixel(WindowDC, APoint.X, APoint.Y);
end;

procedure mnSnapWindow(Canvas: TCanvas; const ARect: TRect; const Window: HWND = 0;
  const CanvasX: Integer = 0; const CanvasY: Integer = 0);
var
  WindowDC: HDC;
begin
  if Window = 0 then
    WindowDC := GetWindowDC(GetDesktopWindow)
  else
    WindowDC := GetWindowDC(Window);
  BitBlt(Canvas.Handle, CanvasX, CanvasY, mnRectWidth(ARect), mnRectHeight(ARect),
         WindowDC, ARect.Left, ARect.Top, SRCCOPY);
end;

procedure mnSnapWindowEx(Canvas: TCanvas; const ARect: TRect; const Window: HWND = 0;
  const CanvasX: Integer = 0; const CanvasY: Integer = 0);
var
  BMP: TBitmap;
  DstRect: TRect;
begin
  if Window = 0 then
    mnSnapWindow(Canvas, ARect, Window, CanvasX, CanvasY)
  else
  begin
    BMP := TBitmap.Create;
    try
      BMP.Width := ARect.Right;
      BMP.Height := ARect.Bottom;
      PrintWindow(Window, BMP.Canvas.Handle, 0);

      DstRect.Left := CanvasX;
      DstRect.Top := CanvasY;
      DstRect.Right := DstRect.Left + mnRectWidth(ARect);
      DstRect.Bottom := DstRect.Top + mnRectHeight(ARect);
      Canvas.CopyRect(DstRect, BMP.Canvas, ARect);
    finally
      BMP.Free;
    end;
  end;
end;

function mnLoadResAsStr(                  ResName: PChar; ResType: PChar = RT_RCDATA): string; overload;
begin
  Result := mnLoadResAsStr(HInstance, ResName, ResType);
end;

function mnLoadResAsStr(AHandle: THandle; ResName: PChar; ResType: PChar = RT_RCDATA): string; overload;
var
  HRes: HRSRC;
begin
  HRes := FindResource(AHandle, ResName, ResType);
  Result := PChar(LockResource(LoadResource(AHandle, HRes)));
  SetLength(Result, SizeOfResource(AHandle, HRes));
end;

procedure mnPauseRedraw(AHandle: THandle);
begin
  SendMessage(AHandle, WM_SETREDRAW, 0, 0);
end;

procedure mnResumeRedraw(AHandle: THandle);
begin
  SendMessage(AHandle, WM_SETREDRAW, 1, 0);
  RedrawWindow(AHandle, nil, 0, RDW_INVALIDATE or RDW_ALLCHILDREN);
end;

end.
