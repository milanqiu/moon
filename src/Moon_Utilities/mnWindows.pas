unit mnWindows;

interface

uses Windows, Controls, Graphics, Classes, mnSystem;

{--------------------------------
  Windows API.
 --------------------------------}
function PrintWindow(hWnd: HWND; hdcBlt: HDC; nFlags: UINT): BOOL; stdcall; external user32 name 'PrintWindow';

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
  OwnerDesktopName指示在哪个Desktop中创建。如果为空，则在当前Desktop中创建。
  如果不是在当前Desktop中创建，进程运行的程序界面将对用户不可见。
  返回新创建的进程的句柄。
  Tested in TestApp.
 --------------------------------}
function mnCreateProcess(const CmdLine: string; const OwnerDesktopName: string = ''): THandle;
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

{--------------------------------
  得到指定窗口的类名或标题。
  如果指定窗口不存在，则返回空字符串。
  Tested in TestApp.
 --------------------------------}
function mnGetWindowClassName(const Window: HWND): string;
function mnGetWindowCaption(const Window: HWND): string;
{--------------------------------
  得到所有窗口的类名或标题的列表，可指定其父窗口。
  列表的Object属性会以整数指针形式存储窗口句柄。
  列表原有的数据不会被清空。
  返回所有窗口数量。
  Tested in TestApp.
 --------------------------------}
function mnGetWindowsClassNames(ClassNames: TStrings; const ParentWindow: HWND = 0): Integer;
function mnGetWindowsCaptions(Captions: TStrings; const ParentWindow: HWND = 0): Integer;
{--------------------------------
  根据窗口的类名或标题查找窗口，可指定其父窗口及起始子窗口。返回窗口句柄。
  不区分大小写。
  如果没有找到，返回0。
  Tested in TestApp.
 --------------------------------}
function mnFindWindowByClassName(const ClassName: string; const ParentWindow: HWND = 0; const AfterChildWindow: HWND = 0): HWND;
function mnFindWindowByCaption(const Caption: string; const ParentWindow: HWND = 0; const AfterChildWindow: HWND = 0): HWND;
{--------------------------------
  根据窗口的标题的子串查找窗口，可指定其父窗口。返回窗口句柄。
  不区分大小写。
  如果没有找到，返回0。
  Tested in TestApp.
 --------------------------------}
function mnFindWindowByCaptionSub(const CaptionSub: string; const ParentWindow: HWND = 0): HWND;
{--------------------------------
  根据窗口的标题的子串，查找所有标题中含有该子串的窗口，可指定其父窗口。
  不区分大小写。
  HWNDs原有的数据不会被清空。
  返回找到的窗口数量。
  Tested in TestApp.
 --------------------------------}
function mnFindWindowsByCaptionSub(HWNDs: mnTIntList; const CaptionSub: string; const ParentWindow: HWND = 0): HWND;

var
{--------------------------------
  在往窗口发送按键消息时，键按下和弹起的时间间隔。
 --------------------------------}
  KeyDownUpInterval: Integer = 10;
{--------------------------------
  在往窗口发送按键消息时，键弹起后的休整时间。
 --------------------------------}
  KeyRest: Integer = 10;

{--------------------------------
  往指定窗口发送一个Virtual Key。
  Tested in TestApp.
 --------------------------------}
procedure mnSendVKeyToWindow(const Window: HWND; const VKey: Integer);
{--------------------------------
  往指定窗口发送一个Char Key。
  Tested in TestApp.
 --------------------------------}
procedure mnSendKeyToWindow(const Window: HWND; const Key: Char);

{--------------------------------
  得到指定窗口中某点的颜色。
  若没有指定窗口，则返回屏幕某点的颜色。
  Tested in TestApp.
 --------------------------------}
function mnGetWindowColor(const APoint: TPoint; const Window: HWND = 0): TColor;

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

uses ShellAPI, Forms, mnControl, mnResStrsU, SysUtils, Messages, Types;

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

function mnCreateProcess(const CmdLine: string; const OwnerDesktopName: string = ''): THandle;
var
  SI: TStartupInfo;
  PI: TProcessInformation;
begin
  FillChar(SI, SizeOf(SI), 0);
  SI.cb := SizeOf(SI);
  SI.dwFlags := STARTF_USESHOWWINDOW;
  SI.wShowWindow := SW_SHOW;
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

function mnGetWindowClassName(const Window: HWND): string;
var
  ClassName: array [0..255] of Char;
  Size: DWORD;
begin
  Size := SizeOf(ClassName);
  if GetClassName(Window, ClassName, Size) <> 0 then
    Result := ClassName
  else Result := '';
end;

function mnGetWindowCaption(const Window: HWND): string;
var
  Caption: array [0..255] of Char;
  Size: DWORD;
begin
  Size := SizeOf(Caption);
  if GetWindowText(Window, Caption, Size) <> 0 then
    Result := Caption
  else Result := '';
end;

function mnGetWindowsClassNames(ClassNames: TStrings; const ParentWindow: HWND = 0): Integer;
var
  OldCount: Integer;

  function EnumWindowsFunc(Window: HWND; ClassNames: TStrings): Boolean; stdcall;
  begin
    ClassNames.AddObject(mnGetWindowClassName(Window), mnNewIntPointer(Window));
    Result := True;
  end;

begin
  OldCount := ClassNames.Count;
  if ParentWindow = 0 then
    EnumWindows(@EnumWindowsFunc, LPARAM(ClassNames))
  else
    EnumChildWindows(ParentWindow, @EnumWindowsFunc, LPARAM(ClassNames));
  Result := ClassNames.Count - OldCount;
end;

function mnGetWindowsCaptions(Captions: TStrings; const ParentWindow: HWND = 0): Integer;
var
  OldCount: Integer;

  function EnumWindowsFunc(Window: HWND; Captions: TStrings): Boolean; stdcall;
  begin
    Captions.AddObject(mnGetWindowCaption(Window), mnNewIntPointer(Window));
    Result := True;
  end;

begin
  OldCount := Captions.Count;
  if ParentWindow = 0 then
    EnumWindows(@EnumWindowsFunc, LPARAM(Captions))
  else
    EnumChildWindows(ParentWindow, @EnumWindowsFunc, LPARAM(Captions));
  Result := Captions.Count - OldCount;
end;

function mnFindWindowByClassName(const ClassName: string; const ParentWindow: HWND = 0; const AfterChildWindow: HWND = 0): HWND;
begin
  if ParentWindow = 0 then
    Result := FindWindow(PChar(ClassName), nil)
  else
    Result := FindWindowEx(ParentWindow, AfterChildWindow, PChar(ClassName), nil);
end;

function mnFindWindowByCaption(const Caption: string; const ParentWindow: HWND = 0; const AfterChildWindow: HWND = 0): HWND;
begin
  if ParentWindow = 0 then
    Result := FindWindow(nil, PChar(Caption))
  else
    Result := FindWindowEx(ParentWindow, AfterChildWindow, nil, PChar(Caption));
end;

function mnFindWindowByCaptionSub(const CaptionSub: string; const ParentWindow: HWND = 0): HWND;
type
  TEnumParam = record
    CaptionSub: string;
    Window: HWND;
  end;
  PEnumParam = ^TEnumParam;
var
  P: PEnumParam;

  function EnumWindowsFunc(Window: HWND; lParam: LPARAM): Boolean; stdcall;
  var
    CaptionSub: string;
    Caption: string;
  begin
    CaptionSub := LowerCase(PEnumParam(lParam).CaptionSub);
    Caption := LowerCase(mnGetWindowCaption(Window));
    if (CaptionSub = '') or (Pos(CaptionSub, Caption) > 0) then
    begin
      PEnumParam(lParam).Window := Window;
      Result := False;
    end
    else Result := True;
  end;

begin
  New(P);
  try
    P.CaptionSub := CaptionSub;
    P.Window := 0;
    if ParentWindow = 0 then
      EnumWindows(@EnumWindowsFunc, LPARAM(P))
    else
      EnumChildWindows(ParentWindow, @EnumWindowsFunc, LPARAM(P));
    Result := P.Window;
  finally
    Dispose(P);
  end;
end;

function mnFindWindowsByCaptionSub(HWNDs: mnTIntList; const CaptionSub: string; const ParentWindow: HWND = 0): HWND;
type
  TEnumParam = record
    CaptionSub: string;
    HWNDs: mnTIntList;
    Count: Integer;
  end;
  PEnumParam = ^TEnumParam;
var
  P: PEnumParam;

  function EnumWindowsFunc(Window: HWND; lParam: LPARAM): Boolean; stdcall;
  var
    CaptionSub: string;
    Caption: string;
  begin
    CaptionSub := LowerCase(PEnumParam(lParam).CaptionSub);
    Caption := LowerCase(mnGetWindowCaption(Window));
    if (CaptionSub = '') or (Pos(CaptionSub, Caption) > 0) then
    begin
      PEnumParam(lParam).HWNDs.Add(Window);
      PEnumParam(lParam).Count := PEnumParam(lParam).Count + 1;
    end;
    Result := True;
  end;

begin
  New(P);
  try
    P.CaptionSub := CaptionSub;
    P.HWNDs := HWNDs;
    P.Count := 0;
    if ParentWindow = 0 then
      EnumWindows(@EnumWindowsFunc, LPARAM(P))
    else
      EnumChildWindows(ParentWindow, @EnumWindowsFunc, LPARAM(P));
    Result := P.Count;
  finally
    Dispose(P);
  end;
end;

procedure mnSendVKeyToWindow(const Window: HWND; const VKey: Integer);
begin
  PostMessage(Window, WM_KEYDOWN, VKey, 0);
  Sleep(KeyDownUpInterval);
  PostMessage(Window, WM_KEYUP, VKey, 0);
  Sleep(KeyRest);
end;

procedure mnSendKeyToWindow(const Window: HWND; const Key: Char);
begin
  PostMessage(Window, WM_CHAR, Ord(Key), 0);
  Sleep(KeyRest);
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
