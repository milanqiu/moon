unit DlgTestWindows;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DlgTest, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  ComCtrls, AppEvnts, mnWindows;

type
  TTestWindowsDialog = class(TTestDialog)
    odChooseProcess: TOpenDialog;
    appeTestWindows: TApplicationEvents;
    tmrTestWindows: TTimer;
    pcTestWindows: TPageControl;
    tsMisc: TTabSheet;
    btnCreateDesktop: TButton;
    btnCloseDesktop: TButton;
    btnCreateProcess: TButton;
    btnTerminateProcess: TButton;
    btnHasProcessExited: TButton;
    btnReportWhenProcessExited: TButton;
    cbUseNewDesktop: TCheckBox;
    ShellOpenNotepad: TButton;
    ShellOpenC: TButton;
    btnGetFileVersion: TButton;
    btnLocalhostName: TButton;
    btnTempPath: TButton;
    btnShutDown: TButton;
    btnReboot: TButton;
    btnLogoff: TButton;
    btnOSLanguage: TButton;
    tsKeyMouse: TTabSheet;
    lbMouseMsg1: TLabel;
    lbMouseMsg2: TLabel;
    lbMouseClick: TLabel;
    Label1: TLabel;
    lbKeyPress: TLabel;
    Label3: TLabel;
    lbMousePos: TLabel;
    pnTestPanel: TPanel;
    cbInspectMouseMsg: TCheckBox;
    btnMouseClick: TButton;
    btnMouseDblClick: TButton;
    btnMouseRightClick: TButton;
    btnIsKeyPressed: TButton;
    btnIsVKeyPressed: TButton;
    btnCtrlC: TButton;
    btnCtrlV: TButton;
    btnKeyPress: TButton;
    edtTo: TEdit;
    edtFrom: TEdit;
    tsWindow: TTabSheet;
    lbCurrWindow: TLabel;
    lbCurrWindowClassName: TLabel;
    lbCurrWindowCaption: TLabel;
    btnGetWindowsCaptions: TButton;
    btnGetWindowsClassNames: TButton;
    btnPostVKeyToWindow: TButton;
    btnPostKeyToWindow: TButton;
    cbVKey: TComboBox;
    cbKey: TEdit;
    btnGotoCurrWindowLeftTop: TButton;
    tsSnap: TTabSheet;
    Label2: TLabel;
    lbScreenColor: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btnSnapWindow: TButton;
    edtLeft: TEdit;
    edtTop: TEdit;
    edtWidth: TEdit;
    edtHeight: TEdit;
    sbScreen: TScrollBox;
    imgScreen: TImage;
    btnSnapWindowEx: TButton;
    lbMouseMsg3: TLabel;
    lbMouseMsg4: TLabel;
    btnMouseWheel: TButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtParentWindow: TEdit;
    edtClassName: TEdit;
    edtCaption: TEdit;
    cbClassNameCaseSensitive: TCheckBox;
    cbClassNameWholeWordOnly: TCheckBox;
    cbCaptionCaseSensitive: TCheckBox;
    cbCaptionWholeWordOnly: TCheckBox;
    cbVisibleRequired: TCheckBox;
    btnGetWindowsDescriptions: TButton;
    btnFindFirstWindow: TButton;
    btnPostSysVKeyToWindow: TButton;
    cbShowWindow: TCheckBox;
    Label11: TLabel;
    procedure btnSnapWindowExClick(Sender: TObject);
    procedure btnSnapWindowClick(Sender: TObject);
    procedure btnPostKeyToWindowClick(Sender: TObject);
    procedure btnPostSysVKeyToWindowClick(Sender: TObject);
    procedure btnPostVKeyToWindowClick(Sender: TObject);
    procedure btnGotoCurrWindowLeftTopClick(Sender: TObject);
    procedure btnFindFirstWindowClick(Sender: TObject);
    procedure btnGetWindowsDescriptionsClick(Sender: TObject);
    procedure btnGetWindowsCaptionsClick(Sender: TObject);
    procedure btnGetWindowsClassNamesClick(Sender: TObject);
    procedure btnKeyPressClick(Sender: TObject);
    procedure btnCtrlVClick(Sender: TObject);
    procedure btnCtrlCClick(Sender: TObject);
    procedure btnIsKeyPressedClick(Sender: TObject);
    procedure btnIsVKeyPressedClick(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDblClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure btnMouseWheelClick(Sender: TObject);
    procedure btnMouseRightClickClick(Sender: TObject);
    procedure btnMouseDblClickClick(Sender: TObject);
    procedure btnMouseClickClick(Sender: TObject);
    procedure tmrTestWindowsTimer(Sender: TObject);
    procedure appeTestWindowsMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure btnOSLanguageClick(Sender: TObject);
    procedure btnLogoffClick(Sender: TObject);
    procedure btnRebootClick(Sender: TObject);
    procedure btnShutDownClick(Sender: TObject);
    procedure btnTempPathClick(Sender: TObject);
    procedure btnLocalhostNameClick(Sender: TObject);
    procedure btnGetFileVersionClick(Sender: TObject);
    procedure ShellOpenCClick(Sender: TObject);
    procedure ShellOpenNotepadClick(Sender: TObject);
    procedure btnReportWhenProcessExitedClick(Sender: TObject);
    procedure btnHasProcessExitedClick(Sender: TObject);
    procedure btnTerminateProcessClick(Sender: TObject);
    procedure btnCreateProcessClick(Sender: TObject);
    procedure btnCloseDesktopClick(Sender: TObject);
    procedure btnCreateDesktopClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetFindWindowsOption: mnTFindWindowsOption;
    procedure WMDropFiles(var Message: TWMDropFiles); message WM_DropFiles;
  public
    { Public declarations }
  end;

var
  TestWindowsDialog: TTestWindowsDialog;

implementation

{$R *.dfm}

uses mnDialog, mnSystem, mnFile, mnString;

{ TTestWindowsDialog }

procedure TTestWindowsDialog.FormCreate(Sender: TObject);
begin
  inherited;
  edtWidth.Text := IntToStr(Screen.Width);
  edtHeight.Text := IntToStr(Screen.Height);
end;

procedure TTestWindowsDialog.FormShow(Sender: TObject);
begin
  mnAcceptDropFiles(Handle);
end;

var
  DesktopHandle: HDESK;

procedure TTestWindowsDialog.btnCreateDesktopClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('Desktop Name', 'Please input a desktop name:', 'ADesktop', Value, scNotEmpty) then
  begin
    DesktopHandle := mnCreateDesktop(Value);
    mnInfoBox('DesktopHandle: ' + IntToStr(DesktopHandle));
    if mnConfirmBox('Switch to the new created desktop? Warning: Can NOT quit it unless logoff') then
      SwitchDesktop(DesktopHandle);
  end;
end;

procedure TTestWindowsDialog.btnCloseDesktopClick(Sender: TObject);
begin
  if mnCloseDesktop(DesktopHandle) then
    mnInfoBox('Successfully')
  else
    mnErrorBox('Failed');
end;

var
  ProcessHandle: THandle;

procedure TTestWindowsDialog.btnCreateProcessClick(Sender: TObject);
var
  OwnerDesktopName: string;
begin
  if odChooseProcess.Execute then
  begin
    if cbUseNewDesktop.Checked then
    begin
      OwnerDesktopName := mnNewGUID;
      mnCreateDesktop(OwnerDesktopName);
      ProcessHandle := mnCreateProcess(odChooseProcess.FileName, cbShowWindow.Checked, OwnerDesktopName);
    end
    else
      ProcessHandle := mnCreateProcess(odChooseProcess.FileName, cbShowWindow.Checked, '');
    mnInfoBox('ProcessHandle: ' + IntToStr(ProcessHandle));
  end;
end;

procedure TTestWindowsDialog.btnTerminateProcessClick(Sender: TObject);
begin
  if mnTerminateProcess(ProcessHandle) then
    mnInfoBox('Successfully')
  else
    mnErrorBox('Failed');
end;

procedure TTestWindowsDialog.btnHasProcessExitedClick(Sender: TObject);
begin
  mnInfoBox(mnHasProcessExited(ProcessHandle));
end;

procedure TTestWindowsDialog.btnReportWhenProcessExitedClick(Sender: TObject);
begin
  repeat
  until mnHasProcessExited(ProcessHandle);
  mnInfoBox('Process has exited');
end;

procedure TTestWindowsDialog.ShellOpenNotepadClick(Sender: TObject);
begin
  mnShellOpen('Notepad', mnAppPathSub('dunit.ini'));
end;

procedure TTestWindowsDialog.ShellOpenCClick(Sender: TObject);
begin
  mnShellOpen('C:\');
end;

procedure TTestWindowsDialog.btnGetFileVersionClick(Sender: TObject);
begin
  mnInfoBox(Format('Utilities: %s'  + mnNewLine +
                   'Components: %s' + mnNewLine +
                   'IOTA: %s'       + mnNewLine +
                   'TestUnit: %s'   + mnNewLine +
                   'TestApp: %s',
                   [mnGetFileVersion(mnAppPathSub('Moon_Utilities.bpl')),
                    mnGetFileVersion(mnAppPathSub('Moon_Components.bpl')),
                    mnGetFileVersion(mnAppPathSub('Moon_IOTA.bpl')),
                    mnGetFileVersion(mnAppPathSub('Moon_TestUnit.exe')),
                    mnGetFileVersion(mnAppPathSub('Moon_TestApp.exe'))]));
end;

procedure TTestWindowsDialog.btnLocalhostNameClick(Sender: TObject);
begin
  mnInfoBox(mnLocalhostName);
end;

procedure TTestWindowsDialog.btnTempPathClick(Sender: TObject);
begin
  mnInfoBox(mnTempPath);
end;

procedure TTestWindowsDialog.btnShutDownClick(Sender: TObject);
begin
  if mnConfirmBox('Want to shut down?') then
    mnShutDownComputer;
end;

procedure TTestWindowsDialog.btnRebootClick(Sender: TObject);
begin
  if mnConfirmBox('Want to reboot?') then
    mnRebootComputer;
end;

procedure TTestWindowsDialog.btnLogoffClick(Sender: TObject);
begin
  if mnConfirmBox('Want to logoff?') then
    mnLogoffComputer;
end;

procedure TTestWindowsDialog.btnOSLanguageClick(Sender: TObject);
begin
  case mnGetOSLanguage of
    olTaiwan:   mnInfoBox('Taiwan');
    olChinese:  mnInfoBox('Chinese');
    olHongKong: mnInfoBox('HongKong');
    olJapanese: mnInfoBox('Japanese');
    olKorean:   mnInfoBox('Korean');
    olUSA:      mnInfoBox('USA');
    olOther:    mnInfoBox('Other');
  end;
end;

procedure TTestWindowsDialog.WMDropFiles(var Message: TWMDropFiles);
var
  Point: TPoint;
begin
  try
    Point := mnGetDropFilesPoint(Message);
    mnMemoBox('mnGetDropFileCount: ' + IntToStr(mnGetDropFileCount(Message)) + mnNewline + mnNewline +
              'mnGetDropFileName: ' + mnNewline + mnGetDropFileName(Message, 0) + mnNewline + mnNewline +
              'mnGetDropFileNames: ' + mnNewline + mnCombine(mnGetDropFileNames(Message), mnNewline) + mnNewline + mnNewline +
              'mnGetDropFilesPoint: ' + IntToStr(Point.X) + ',' + IntToStr(Point.Y)
             );
  finally
    mnFinishDropFiles(Message);
  end;
end;

procedure TTestWindowsDialog.appeTestWindowsMessage(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if cbInspectMouseMsg.Checked then
  begin
    if mnIsMouseMsg(Msg) then
    begin
      lbMouseMsg1.Caption := Format('mnControlFromMouseMsg: %s', [mnControlFromMouseMsg(Msg).Name]);
      lbMouseMsg2.Caption := Format('mnPointFromMouseMsg: %d, %d', [mnPointFromMouseMsg(Msg).X, mnPointFromMouseMsg(Msg).Y]);
      lbMouseMsg3.Caption := Format('mnControlFromMouseMsg.ClientToScreen(mnPointFromMouseMsg): %d, %d', [mnControlFromMouseMsg(Msg).ClientToScreen(mnPointFromMouseMsg(Msg)).X, mnControlFromMouseMsg(Msg).ClientToScreen(mnPointFromMouseMsg(Msg)).Y]);
      if mnMouseMsgInControl(Msg, pnTestPanel) then
        lbMouseMsg4.Caption := 'mnMouseMsgInControl: inside pnTestPanel'
      else
        lbMouseMsg4.Caption := 'mnMouseMsgInControl: outside pnTestPanel';
    end;
  end;
end;

procedure TTestWindowsDialog.tmrTestWindowsTimer(Sender: TObject);
var
  Color: TColor;
begin
  lbMousePos.Caption := Format('%d, %d', [mnMousePos.X, mnMousePos.Y]);

  Color := mnGetWindowColor(mnMousePos);
  lbScreenColor.Caption := IntToHex(Color, 6);
  lbScreenColor.Font.Color := Color;
end;

procedure TTestWindowsDialog.btnMouseClickClick(Sender: TObject);
begin
  SetCursorPos(TestWindowsDialog.ClientToScreen(Point(1, 1)).X, TestWindowsDialog.ClientToScreen(Point(1, 1)).Y);
  mnMouseClick;
end;

procedure TTestWindowsDialog.btnMouseDblClickClick(Sender: TObject);
begin
  SetCursorPos(TestWindowsDialog.ClientToScreen(Point(1, 1)).X, TestWindowsDialog.ClientToScreen(Point(1, 1)).Y);
  mnMouseDblClick;
end;

procedure TTestWindowsDialog.btnMouseRightClickClick(Sender: TObject);
begin
  SetCursorPos(TestWindowsDialog.ClientToScreen(Point(1, 1)).X, TestWindowsDialog.ClientToScreen(Point(1, 1)).Y);
  mnMouseRightClick;
end;

procedure TTestWindowsDialog.btnMouseWheelClick(Sender: TObject);
begin
  SetCursorPos(TestWindowsDialog.ClientToScreen(Point(1, 1)).X, TestWindowsDialog.ClientToScreen(Point(1, 1)).Y);
  mnMouseWheel(-100);
end;

procedure TTestWindowsDialog.FormClick(Sender: TObject);
begin
  inherited;
  lbMouseClick.Caption := 'Mouse click';
end;

procedure TTestWindowsDialog.FormDblClick(Sender: TObject);
begin
  inherited;
  lbMouseClick.Caption := 'Mouse double click';
end;

procedure TTestWindowsDialog.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbRight then
    lbMouseClick.Caption := 'Mouse right click' + '    X:' + IntToStr(X) + '    Y:' + IntToStr(Y);
end;

procedure TTestWindowsDialog.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  inherited;
  lbMouseClick.Caption := 'Mouse wheel' + '    WheelDelta:' + IntToStr(WheelDelta) + '    MousePos:' + IntToStr(MousePos.X) + ',' + IntToStr(MousePos.Y);
end;

procedure TTestWindowsDialog.btnIsVKeyPressedClick(Sender: TObject);
var
  VKey: Integer;
begin
  lbKeyPress.Caption := '';
  for VKey := 1 to 254 do
    if mnIsVKeyHold(VKey) then
      lbKeyPress.Caption := lbKeyPress.Caption + IntToStr(VKey) + ' ';
end;

procedure TTestWindowsDialog.btnIsKeyPressedClick(Sender: TObject);
var
  Key: Char;
begin
  lbKeyPress.Caption := '';
  for Key := Chr(1) to Chr(255) do
    if mnIsKeyHold(Key) then
      lbKeyPress.Caption := lbKeyPress.Caption + Key + ' ';
end;

procedure TTestWindowsDialog.btnCtrlCClick(Sender: TObject);
begin
  edtFrom.SetFocus;
  edtFrom.SelectAll;
  mnVKeyDown(VK_CONTROL);
  mnVKeyPress(Ord('C'));
  mnVKeyUp(VK_CONTROL);
end;

procedure TTestWindowsDialog.btnCtrlVClick(Sender: TObject);
begin
  edtTo.SetFocus;
  edtTo.SelectAll;
  mnVKeyDown(VK_CONTROL);
  mnVKeyPress(Ord('V'));
  mnVKeyUp(VK_CONTROL);
end;

procedure TTestWindowsDialog.btnKeyPressClick(Sender: TObject);
begin
  edtTo.SetFocus;
  edtTo.SelectAll;
  mnKeyPress(edtFrom.Text);
end;

function TTestWindowsDialog.GetFindWindowsOption: mnTFindWindowsOption;
begin
  Result := mnDefaultFindWindowsOption;

  Result.ParentWindow := mnABStrToInt(edtParentWindow.Text);

  Result.ClassName := edtClassName.Text;
  Result.ClassNameMatchOptions := [];
  if cbClassNameCaseSensitive.Checked then
    Include(Result.ClassNameMatchOptions, scoCaseSensitive);
  if cbClassNameWholeWordOnly.Checked then
    Include(Result.ClassNameMatchOptions, scoWholeWordOnly);

  Result.Caption := edtCaption.Text;
  Result.CaptionMatchOptions := [];
  if cbCaptionCaseSensitive.Checked then
    Include(Result.CaptionMatchOptions, scoCaseSensitive);
  if cbCaptionWholeWordOnly.Checked then
    Include(Result.CaptionMatchOptions, scoWholeWordOnly);

  Result.VisibleRequired := cbVisibleRequired.Checked; 
end;

procedure TTestWindowsDialog.btnGetWindowsClassNamesClick(Sender: TObject);
var
  Windows: mnTHWNDArray;
begin
  Windows := mnFindWindows(GetFindWindowsOption);
  ppStrs.Clear;
  mnGetWindowsClassNames(Windows, ppStrs);
  mnInfoBox(Format('共有%d个窗口', [Length(Windows)]));
  mnMemoBox(ppStrs.Text);
end;

procedure TTestWindowsDialog.btnGetWindowsCaptionsClick(Sender: TObject);
var
  Windows: mnTHWNDArray;
begin
  Windows := mnFindWindows(GetFindWindowsOption);
  ppStrs.Clear;
  mnGetWindowsCaptions(Windows, ppStrs);
  mnInfoBox(Format('共有%d个窗口', [Length(Windows)]));
  mnMemoBox(ppStrs.Text);
end;

procedure TTestWindowsDialog.btnGetWindowsDescriptionsClick(
  Sender: TObject);
var
  Windows: mnTHWNDArray;
begin
  Windows := mnFindWindows(GetFindWindowsOption);
  ppStrs.Clear;
  mnGetWindowsDescriptions(Windows, ppStrs, mnStdWindowDescriptionFormat);
  mnInfoBox(Format('共有%d个窗口', [Length(Windows)]));
  mnMemoBox(ppStrs.Text);
end;

var
  CurrWindow: HWND;

procedure TTestWindowsDialog.btnFindFirstWindowClick(Sender: TObject);
begin
  CurrWindow := mnFindFirstWindow(GetFindWindowsOption);;
  lbCurrWindow.Caption := 'Curr Window: ' + IntToStr(CurrWindow);
  lbCurrWindowClassName.Caption := 'Curr Window Class Name: ' + mnGetWindowClassName(CurrWindow);
  lbCurrWindowCaption.Caption := 'Curr Window Caption: ' + mnGetWindowCaption(CurrWindow);
end;

procedure TTestWindowsDialog.btnGotoCurrWindowLeftTopClick(Sender: TObject);
var
  Rect: TRect;
begin
  GetWindowRect(CurrWindow, Rect);
  SetCursorPos(Rect.Left, Rect.Top);
end;

procedure TTestWindowsDialog.btnPostVKeyToWindowClick(Sender: TObject);
var
  VKey: Integer;
begin
  case cbVKey.ItemIndex of
    0: VKey := VK_F1;
    1: VKey := VK_F2;
    2: VKey := VK_F3;
    3: VKey := VK_RETURN;
    4: VKey := VK_LEFT;
    5: VKey := VK_RIGHT;
    6: VKey := VK_UP;
    7: VKey := VK_DOWN;
    8: VKey := VK_NUMPAD5;
    9: VKey := VK_NUMLOCK;
  else
    VKey := 0;
  end;
  mnPostVKeyToWindow(CurrWindow, VKey);
end;

procedure TTestWindowsDialog.btnPostSysVKeyToWindowClick(Sender: TObject);
var
  VKey: Integer;
begin
  case cbVKey.ItemIndex of
    0: VKey := VK_F1;
    1: VKey := VK_F2;
    2: VKey := VK_F3;
    3: VKey := VK_RETURN;
    4: VKey := VK_LEFT;
    5: VKey := VK_RIGHT;
    6: VKey := VK_UP;
    7: VKey := VK_DOWN;
    8: VKey := VK_NUMPAD5;
    9: VKey := VK_NUMLOCK;
  else
    VKey := 0;
  end;
  mnPostSysVKeyToWindow(CurrWindow, VKey);
end;

procedure TTestWindowsDialog.btnPostKeyToWindowClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to Length(cbKey.Text) do
    mnPostKeyToWindow(CurrWindow, cbKey.Text[i]);
end;

procedure TTestWindowsDialog.btnSnapWindowClick(Sender: TObject);
var
  ARect: TRect;
begin
  ARect.Left := StrToInt(edtLeft.Text);
  ARect.Top := StrToInt(edtTop.Text);
  ARect.Right := ARect.Left + StrToInt(edtWidth.Text);
  ARect.Bottom := ARect.Top + StrToInt(edtHeight.Text);

  sbScreen.ScrollBy(-2000, -2000);
  imgScreen.Left := 0;
  imgScreen.Top := 0;
  imgScreen.Width := StrToInt(edtWidth.Text);
  imgScreen.Height := StrToInt(edtHeight.Text);
  imgScreen.Canvas.Brush.Color := clWhite;
  imgScreen.Canvas.FillRect(Rect(imgScreen.Left, imgScreen.Top, imgScreen.Left+imgScreen.Width, imgScreen.Top+imgScreen.Height));

  mnSnapWindow(imgScreen.Canvas, ARect, CurrWindow);
end;

procedure TTestWindowsDialog.btnSnapWindowExClick(Sender: TObject);
var
  ARect: TRect;
begin
  ARect.Left := StrToInt(edtLeft.Text);
  ARect.Top := StrToInt(edtTop.Text);
  ARect.Right := ARect.Left + StrToInt(edtWidth.Text);
  ARect.Bottom := ARect.Top + StrToInt(edtHeight.Text);

  sbScreen.ScrollBy(-2000, -2000);
  imgScreen.Left := 0;
  imgScreen.Top := 0;
  imgScreen.Width := StrToInt(edtWidth.Text);
  imgScreen.Height := StrToInt(edtHeight.Text);
  imgScreen.Canvas.Brush.Color := clWhite;
  imgScreen.Canvas.FillRect(Rect(imgScreen.Left, imgScreen.Top, imgScreen.Left+imgScreen.Width, imgScreen.Top+imgScreen.Height));

  mnSnapWindowEx(imgScreen.Canvas, ARect, CurrWindow);
end;

end.
