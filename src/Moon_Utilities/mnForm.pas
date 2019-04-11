unit mnForm;

interface

uses Forms, Controls, Windows, Messages;

type
{--------------------------------
  一种特殊的窗体：前端窗体。可被继承。
  前端窗体永远显示在所有窗体的最前方（即最顶层），在前端窗体显示时，用户无法操作其它窗体。这两点和模态窗体类似。
  但是和模态窗体不同的是，它在显示时不会暂停应用程序的主线程。
  也就是说，应用程序在调用ShowFrontal显示前端窗体后，仍可继续执行代码进行其它操作，包括改变前端窗体的界面。
  用户在前端窗体进行正常操作（如点击关闭按钮）可关闭前端窗体，应用程序也可调用CloseFrontal自主关闭。
  Tested in TestApp.
 --------------------------------}
  mnTFrontalForm = class(TForm)
  private
    WindowList: Pointer;
    SaveFocusState: TFocusState;
    SaveCursor: TCursor;
    SaveCount: Integer;
    ActiveWindow: HWnd;
    procedure WMClose(var Message: TWMClose); message WM_CLOSE;
  public
    procedure ShowFrontal;
    procedure CloseFrontal;
  end;

{--------------------------------
  在MDI程序里，关闭所有的MDI子窗体。
  No test.
 --------------------------------}
procedure mnCloseAllMDIChildren;

{--------------------------------
  在MDI程序里，查找指定类的MDI子窗体并显示。
  返回是否找到并显示成功。
  AutoMaximize指示在显示子窗体时，是否自动最大化。
  No test.
 --------------------------------}
function mnShowMDIChild(MDIChildClass: TFormClass; const AutoMaximize: Boolean): Boolean;

{--------------------------------
  Enable和Disable应用程序中所有窗体。
  Tested in TestApp.
 --------------------------------}
procedure mnEnableAllForms;
procedure mnDisableAllForms;

{--------------------------------
  装载窗体资源。
  如果窗体是通过CreateNew创建的，则可调用本函数来手工装载窗体资源。
  例如，在非MDI程序中创建MDIChild窗体时，不能使用Create直接创建，而只能使用CreateNew和mnLoadFormRes。
  No test.
 --------------------------------}
procedure mnLoadFormRes(FormClass: TFormClass; var FormReference);

{--------------------------------
  改变指定窗体的大小，使之充满屏幕的工作区域。
  Tested in TestApp.
 --------------------------------}
procedure mnFillScreen(AForm: TCustomForm);

{--------------------------------
  将指定窗体的字体设成当前操作系统语言下的标准字体。
  Tested in TestApp.
 --------------------------------}
procedure mnSetStandardFont(AForm: TCustomForm);

const
{--------------------------------
  专用于About对话框的菜单项ID。
 --------------------------------}
  ItemID_About = $8208;

{--------------------------------
  在窗体的系统菜单中增加菜单项或分隔符。
  Tested in TestApp.
 --------------------------------}
procedure mnAppendItemToSystemMenu(AForm: TCustomForm; const ItemID: Integer; const Caption: string);
procedure mnAppendSeparatorToSystemMenu(AForm: TCustomForm);

implementation

uses Classes, Consts, mnWindows;

{ mnTFrontalForm }

procedure mnTFrontalForm.WMClose(var Message: TWMClose);
begin
  ModalResult := mrOK;
  CloseModal;
  if ModalResult <> 0 then CloseFrontal;
end;

procedure mnTFrontalForm.ShowFrontal;
begin
  CancelDrag;
  if Visible or not Enabled or (fsModal in FFormState) or
    (FormStyle = fsMDIChild) then
    raise EInvalidOperation.Create(SCannotShowModal);
  if GetCapture <> 0 then SendMessage(GetCapture, WM_CANCELMODE, 0, 0);
  ReleaseCapture;
  Application.ModalStarted;
  Include(FFormState, fsModal);
  if PopupMode = pmNone then
    RecreateWnd;
  ActiveWindow := GetActiveWindow;
  SaveFocusState := Forms.SaveFocusState;
  Screen.SaveFocusedList.Insert(0, Screen.FocusedForm);
  Screen.FocusedForm := Self;
  SaveCursor := Screen.Cursor;
  Screen.Cursor := crDefault;
  SaveCount := Screen.CursorCount;
  WindowList := DisableTaskWindows(0);
  Show;
  SendMessage(Handle, CM_ACTIVATE, 0, 0);
end;

procedure mnTFrontalForm.CloseFrontal;
begin
  SendMessage(Handle, CM_DEACTIVATE, 0, 0);
  if GetActiveWindow <> Handle then ActiveWindow := 0;
  Hide;
  if Screen.CursorCount = SaveCount then
    Screen.Cursor := SaveCursor
  else Screen.Cursor := crDefault;
  EnableTaskWindows(WindowList);
  if Screen.SaveFocusedList.Count > 0 then
  begin
    Screen.FocusedForm := Screen.SaveFocusedList.First;
    Screen.SaveFocusedList.Remove(Screen.FocusedForm);
  end else Screen.FocusedForm := nil;
  if ActiveWindow <> 0 then SetActiveWindow(ActiveWindow);
  RestoreFocusState(SaveFocusState);
  Exclude(FFormState, fsModal);
  Application.ModalFinished;
end;

procedure mnCloseAllMDIChildren;
var
  i: Integer;
begin
  for i := Application.MainForm.MDIChildCount-1 downto 0 do
    Application.MainForm.MDIChildren[i].Close;
end;

function mnShowMDIChild(MDIChildClass: TFormClass; const AutoMaximize: Boolean): Boolean;
var
  i: Integer;
  MDIChild: TForm;
begin
  for i := 0 to Application.MainForm.MDIChildCount-1 do
    if Application.MainForm.MDIChildren[i] is MDIChildClass then
    begin
      Result := True;
      MDIChild := Application.MainForm.MDIChildren[i];
      MDIChild.Show;
      if AutoMaximize then MDIChild.WindowState := wsMaximized;
      Exit;
    end;
  Result := False;
end;

procedure mnEnableAllForms;
var
  i: Integer;
begin
  for i := 0 to Application.ComponentCount-1 do
    if Application.Components[i] is TForm then
      TForm(Application.Components[i]).Enabled := True;
end;

procedure mnDisableAllForms;
var
  i: Integer;
begin
  for i := 0 to Application.ComponentCount-1 do
    if Application.Components[i] is TForm then
      TForm(Application.Components[i]).Enabled := False;
end;

procedure mnLoadFormRes(FormClass: TFormClass; var FormReference);
begin
  with TResourceStream.Create(FindResourceHInstance(FindClassHInstance(FormClass)),
                              FormClass.ClassName, RT_RCDATA) do
  begin
    try
      TComponent(FormReference) := ReadComponent(TComponent(FormReference));
    finally
      Free;
    end;
  end;
end;

procedure mnFillScreen(AForm: TCustomForm);
begin
  with AForm do
  begin
    Left := Screen.WorkAreaLeft;
    Top := Screen.WorkAreaTop;
    Width := Screen.WorkAreaWidth;
    Height := Screen.WorkAreaHeight;
  end;
end;

procedure mnSetStandardFont(AForm: TCustomForm);
begin
 with AForm.Font do
   case mnGetOSLanguage of
     olChinese:
     begin
       Charset := GB2312_CHARSET;
       Name := '宋体';
       Size := 9;
     end;
     else
     begin
       Charset := DEFAULT_CHARSET;
       Name := 'Tahoma';
       Size := 8;
     end;
   end;
end;

procedure mnAppendItemToSystemMenu(AForm: TCustomForm; const ItemID: Integer; const Caption: string);
begin
  AppendMenu(GetSystemMenu(AForm.Handle, False), MF_POPUP, ItemID, PChar(Caption));
end;

procedure mnAppendSeparatorToSystemMenu(AForm: TCustomForm);
begin
  AppendMenu(GetSystemMenu(AForm.Handle, False), MF_SEPARATOR, 0, '');
end;

end.
