unit mnWindows;

interface

uses Windows, Controls, Graphics, Classes, mnSystem, mnString, Messages, mnGraphics;

{--------------------------------
  在Windows环境中创建和关闭Desktop。
  mnCreateDesktop返回新创建的Desktop的句柄。
  mnCloseDesktop返回是否成功关闭。
  Tested in TestApp.
 --------------------------------}
function mnCreateDesktop(const DesktopName: string): HDESK;
function mnCloseDesktop(const DesktopHandle: HDESK): Boolean;

{--------------------------------
  通过命令行方式执行任何命令（包括exe），以创建一个进程。
  ShowWindow指示进程运行的程序界面是否可见。
  OwnerDesktopName指示在哪个Desktop中创建。如果为空，则在当前Desktop中创建。
  如果不是在当前Desktop中创建，进程运行的程序界面将对用户不可见。
  返回新创建的进程的句柄。
  Tested in TestApp.
 --------------------------------}
function mnCreateProcess(const CmdLine: string; const ShowWindow: Boolean = True; const OwnerDesktopName: string = ''): THandle;
{--------------------------------
  强行终止一个进程。
  返回是否成功终止。
  Tested in TestApp.
 --------------------------------}
function mnTerminateProcess(const ProcessHandle: THandle): Boolean;
{--------------------------------
  判断一个进程是否已结束。
  Tested in TestApp.
 --------------------------------}
function mnHasProcessExited(const ProcessHandle: THandle): Boolean;

{--------------------------------
  在Windows环境中打开一个文件，或文件夹，或网址，或任何能打开的对象。
  和开始菜单中的“运行”效果相同。
  如果是运行可执行程序，可使用Parameter传入调用参数。
  Tested in TestApp.
 --------------------------------}
procedure mnShellOpen(const Name: string; const Parameter: string = '');

{--------------------------------
  得到指定文件的文件版本号。
  Tested in TestApp.
 --------------------------------}
function mnGetFileVersion(const FileName: string): String;

{--------------------------------
  得到本地计算机名。
  Tested in TestApp.
 --------------------------------}
function mnLocalhostName: string;

{--------------------------------
  得到本机的临时文件存储的路径。
  Tested in TestApp.
 --------------------------------}
function mnTempPath: string;

{--------------------------------
  关闭、重启或注销计算机。
  Tested in TestApp.
 --------------------------------}
procedure mnShutDownComputer;
procedure mnRebootComputer;
procedure mnLogoffComputer;

type
{--------------------------------
  操作系统语言。
 --------------------------------}
  mnTOSLanguage = (olTaiwan, olChinese, olHongKong, olJapanese, olKorean, olUSA, olOther);

{--------------------------------
  得到本机操作系统的语言。
  Tested in TestApp.
 --------------------------------}
function mnGetOSLanguage: mnTOSLanguage;

{--------------------------------
  检查一个消息是否是鼠标消息。
  Tested in TestApp.
 --------------------------------}
function mnIsMouseMsg(const AMsg: TMsg): Boolean;
{--------------------------------
  从鼠标消息中解析出鼠标位置。
  调用之前，必须先调用mnIsMouseMsg检查以确保传入的消息是鼠标消息。
  返回的位置并非处于屏幕坐标系中，而是处于该位置所在控件的坐标系中。
  Tested in TestApp.
 --------------------------------}
function mnPointFromMouseMsg(const AMsg: TMsg): TPoint;
{--------------------------------
  从鼠标消息中解析出鼠标所在位置的控件。
  调用之前，必须先调用mnIsMouseMsg检查以确保传入的消息是鼠标消息。
  Tested in TestApp.
 --------------------------------}
function mnControlFromMouseMsg(const AMsg: TMsg): TWinControl;
{--------------------------------
  检查是否鼠标消息是在指定控件的范围内触发的。
  调用之前，必须先调用mnIsMouseMsg检查以确保传入的消息是鼠标消息。
  Tested in TestApp.
 --------------------------------}
function mnMouseMsgInControl(const AMsg: TMsg; AControl: TControl): Boolean;

{--------------------------------
  返回鼠标所在位置。使用屏幕坐标系。
  Tested in TestApp.
 --------------------------------}
function mnMousePos: TPoint;

{--------------------------------
  模拟鼠标单击、双击、右键单击或滚轮。
  Tested in TestApp.
 --------------------------------}
procedure mnMouseClick;
procedure mnMouseDblClick;
procedure mnMouseRightClick;
procedure mnMouseWheel(const Delta: Integer);

{--------------------------------
  检查一个Virtual Key是否正被按下，或一个Char Key是否正被按下。
  Tested in TestApp.
 --------------------------------}
function mnIsVKeyHold(const VKey: Integer): Boolean;
function mnIsKeyHold(const Key: Char): Boolean;

{--------------------------------
  模拟按下、弹起和敲击一个Virtual Key。
  Tested in TestApp.
 --------------------------------}
procedure mnVKeyDown(const VKey: Integer);
procedure mnVKeyUp(const VKey: Integer);
procedure mnVKeyPress(const VKey: Integer);
{--------------------------------
  模拟敲击一个Char Key，或按顺序敲击一个字符串。
  Tested in TestApp.
 --------------------------------}
procedure mnKeyPress(const Key: Char); overload;
procedure mnKeyPress(const Keys: string); overload;

type
{--------------------------------
  窗口句柄数组和指针。
 --------------------------------}
  mnTHWNDArray = array of HWND;
  mnPHWND = ^HWND;
{--------------------------------
  在窗口句柄数组和指针列表之间转换。
  Tested in TestUnit.
 --------------------------------}
function mnHWNDArrayToList(const HWNDArray: mnTHWNDArray): TList;
function mnHWNDListToArray(const HWNDList: TList): mnTHWNDArray;

{--------------------------------
  得到指定窗口的类名或标题。
  如果指定窗口不存在，则抛出异常。
  Tested in TestApp.
 --------------------------------}
function mnGetWindowClassName(const Window: HWND): string;
function mnGetWindowCaption(const Window: HWND): string;
{--------------------------------
  得到指定的多个窗口的类名或标题。
  Tested in TestApp.
 --------------------------------}
procedure mnGetWindowsClassNames(const Windows: mnTHWNDArray; ClassNames: TStrings);
procedure mnGetWindowsCaptions(const Windows: mnTHWNDArray; Captions: TStrings);

const
{--------------------------------
  标准的窗口描述格式。
 --------------------------------}
  mnStdWindowDescriptionFormat = '%0:d:%2:s[%1:s]';
{--------------------------------
  得到指定的多个窗口的描述，描述由窗口句柄ID、类别和标题拼接而成，格式以Format形式传入。
  Tested in TestApp.
 --------------------------------}
procedure mnGetWindowsDescriptions(const Windows: mnTHWNDArray; Descriptions: TStrings; const DescriptionFormat: string = mnStdWindowDescriptionFormat);

{--------------------------------
  得到系统里全部窗口的描述，描述由窗口句柄ID、类别和标题拼接而成，格式以Format形式传入。
  可指定是否只取可见的窗口。
  Tested in TestApp.
 --------------------------------}
procedure mnGetAllWindowsDescriptions(Descriptions: TStrings; const VisibleRequired: Boolean = True; const DescriptionFormat: string = mnStdWindowDescriptionFormat);

type
{--------------------------------
  用于查找窗口时传入参数。
    ParentWindow：所属的父窗口。
    ClassName：需匹配的类名。
    ClassNameMatchOptions：匹配类名时的比较选项。
    Caption：需匹配的标题。
    CaptionMatchOptions：匹配标题时的比较选项。
    VisibleRequired：是否要求窗口可见。
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
  缺省的查找窗口选项，没有设置任何条件。自定义的条件可以在此基础上修改。
  No test.
 --------------------------------}
function mnDefaultFindWindowsOption: mnTFindWindowsOption;
{--------------------------------
  查找窗口，返回窗口句柄数组。
  Tested in TestApp.
 --------------------------------}
function mnFindWindows(const Option: mnTFindWindowsOption): mnTHWNDArray;
{--------------------------------
  查找第一个符合条件选项的窗口。
  如果没有找到，返回High(HWND)。
  Tested in TestApp.
 --------------------------------}
function mnFindFirstWindow(const Option: mnTFindWindowsOption): HWND;

{--------------------------------
  判断一个窗口是否存在。
  No test.
 --------------------------------}
function mnWindowIsPresent(const Window: HWND): Boolean;
{--------------------------------
  判断一个窗口是否不存在。
  No test.
 --------------------------------}
function mnWindowIsAbsent(const Window: HWND): Boolean;
{--------------------------------
  验证一个窗口的存在，不存在时抛出异常。
  No test.
 --------------------------------}
procedure mnValidateWindowIsPresent(const Window: HWND; const ErrorMsg: string = '');

{--------------------------------
  应用程序挂起，直到符合指定选项的窗口存在。
  返回该窗口。
  Tested in TestApp.
 --------------------------------}
function mnSleepUntilWindowIsPresent(const Option: mnTFindWindowsOption; const SleepInterval: Integer = 50): HWND;
{--------------------------------
  应用程序挂起，直到符合指定选项的窗口不再存在。
  Tested in TestApp.
 --------------------------------}
procedure mnSleepUntilWindowIsAbsent(const Option: mnTFindWindowsOption; const SleepInterval: Integer = 50); overload;
{--------------------------------
  应用程序挂起，直到指定窗口不再存在。
  No test.
 --------------------------------}
procedure mnSleepUntilWindowIsAbsent(const Window: HWND; const SleepInterval: Integer = 50); overload;
{--------------------------------
  应用程序挂起，直到指定窗口变成当前焦点窗口。
  Tested in TestApp.
 --------------------------------}
procedure mnSleepUntilWindowIsForeground(const Window: HWND; const SleepInterval: Integer = 50);

{--------------------------------
  应用程序挂起，直到指定窗口的截图包含指定图片。
  Tested in TestApp.
 --------------------------------}
procedure mnSleepUntilWindowContainsImage(const Window: HWND; const Image: mnTPixeledImage;                    const SleepInterval: Integer = 50); overload;
procedure mnSleepUntilWindowContainsImage(const Window: HWND; const Image: mnTPixeledImage; var X, Y: Integer; const SleepInterval: Integer = 50); overload;

{--------------------------------
  应用程序挂起，直到指定窗口的截图包含指定图片，然后鼠标移到指定窗口的图片区域并点击。
  Tested in TestApp.
 --------------------------------}
procedure mnSleepAndClickUntilWindowContainsImage(const Window: HWND; const Image: mnTPixeledImage; const SleepInterval: Integer = 50);

{--------------------------------
  将鼠标移动到指定窗口的(X, Y)处。
  (X, Y)坐标以窗口左上角为原点。
  Tested in TestApp.
 --------------------------------}
procedure mnSetCursorPosOnWindow(const Window: HWND; const X, Y: Integer);
{--------------------------------
  将鼠标移动到指定窗口的(X, Y)处并点击。
  (X, Y)坐标以窗口左上角为原点。
  Tested in TestApp.
 --------------------------------}
procedure mnClickWindow(const Window: HWND; const X, Y: Integer);

{--------------------------------
  往指定窗口发送一个Virtual Key。
  mnPostVKeyToWindow和mnPostSysVKeyToWindow分别使用WM_KEYDOWN和WM_SYSKEYDOWN发送消息。并不是所有Virtual Key都能得到正确处理，要看窗口具体是如何处理的。
  Tested in TestApp.
 --------------------------------}
procedure mnPostVKeyToWindow(const Window: HWND; const VKey: Integer);
procedure mnPostSysVKeyToWindow(const Window: HWND; const VKey: Integer);
{--------------------------------
  往指定窗口发送一个Char Key。
  Tested in TestApp.
 --------------------------------}
procedure mnPostKeyToWindow(const Window: HWND; const Key: Char);

type
{--------------------------------
  用于查找进程时传入参数。
    ExeFile：需匹配的ExeFile。
    ExeFileMatchOptions：匹配ExeFile时的比较选项。
 --------------------------------}
  mnTFindProcessOption = record
    ExeFile: string;
    ExeFileMatchOptions: mnTStrComparisonOptions;
  end;
{--------------------------------
  缺省的查找进程选项，没有设置任何条件。自定义的条件可以在此基础上修改。
  No test.
 --------------------------------}
function mnDefaultFindProcessOption: mnTFindProcessOption;

{--------------------------------
  查找进程，返回进程ID数组。
  Tested in TestApp.
 --------------------------------}
function mnFindProcesses(const Option: mnTFindProcessOption): mnTDWORDArray;
{--------------------------------
  查找第一个符合条件选项的进程。
  如果没有找到，返回High(DWORD)。
  Tested in TestApp.
 --------------------------------}
function mnFindFirstProcess(const Option: mnTFindProcessOption): DWORD;

{--------------------------------
  根据进程ID和所需访问权限打开进程，返回进程的句柄。
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
  允许指定句柄或指定控件接受文件拖入。
  Tested in TestApp.
 --------------------------------}
procedure mnAcceptDropFiles(AHandle: THandle); overload;
procedure mnAcceptDropFiles(AWinControl: TWinControl); overload;
{--------------------------------
  根据文件拖入消息，得到拖入的文件数量。
  Tested in TestApp.
 --------------------------------}
function mnGetDropFileCount(const AMsg: TWMDropFiles): Integer;
{--------------------------------
  根据文件拖入消息，得到指定索引的拖入文件名。索引从0开始。
  Tested in TestApp.
 --------------------------------}
function mnGetDropFileName(const AMsg: TWMDropFiles; const FileIndex: Integer = 0): string;
{--------------------------------
  根据文件拖入消息，得到所有拖入文件名。
  Tested in TestApp.
 --------------------------------}
function mnGetDropFileNames(const AMsg: TWMDropFiles): mnTStrArray;
{--------------------------------
  根据文件拖入消息，得到拖入文件释放时的鼠标位置。
  Tested in TestApp.
 --------------------------------}
function mnGetDropFilesPoint(const AMsg: TWMDropFiles): TPoint;
{--------------------------------
  终结文件拖入消息，进行释放内存等操作。
  Tested in TestApp.
 --------------------------------}
procedure mnFinishDropFiles(var AMsg: TWMDropFiles);

{--------------------------------
  得到指定窗口中某点的颜色。
  若没有指定窗口，则返回屏幕某点的颜色。
  Tested in TestApp.
 --------------------------------}
function mnGetWindowColor(const APoint: TPoint; const Window: HWND = 0): TColor;

{--------------------------------
  Windows API.
 --------------------------------}
function PrintWindow(hWnd: HWND; hdcBlt: HDC; nFlags: UINT): BOOL; stdcall; external user32 name 'PrintWindow';

{--------------------------------
  以下两个函数的功能都是截取指定窗口中某区域的图像，并绘制到Canvas的(CanvasX, CanvasY)处。
  若没有指定窗口，则截取屏幕某区域的图像。
  该区域不一定位于前端，被遮挡或在屏幕外皆可，但不能最小化，也不能被hide。
  这两个函数的实现方法不同，在实际运行过程中，不一定能成功，取决于操作系统版本、应用程序的界面绘制方式、截取窗口的特征，等等。
  通常地，如果需要截取的是应用程序主窗口，适合用mnSnapWindowEx；如果是子控件窗口，适合用mnSnapWindow。
  Tested in TestApp.
 --------------------------------}
procedure mnSnapWindow(Canvas: TCanvas; const ARect: TRect; const Window: HWND = 0;
  const CanvasX: Integer = 0; const CanvasY: Integer = 0);
procedure mnSnapWindowEx(Canvas: TCanvas; const ARect: TRect; const Window: HWND = 0;
  const CanvasX: Integer = 0; const CanvasY: Integer = 0);

{--------------------------------
  装载资源，并以字符串形式返回。
  可以指定资源的句柄，若没有指定，使用应用程序的句柄，即HInstance。
  Tested in TestUnit.
 --------------------------------}
function mnLoadResAsStr(                  ResName: PChar; ResType: PChar = RT_RCDATA): string; overload;
function mnLoadResAsStr(AHandle: THandle; ResName: PChar; ResType: PChar = RT_RCDATA): string; overload;

{--------------------------------
  暂停和继续指定句柄的重画。
  测试：略
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
