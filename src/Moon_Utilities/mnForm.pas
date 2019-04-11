unit mnForm;

interface

uses Forms, Controls, Windows, Messages;

type
{--------------------------------
  һ������Ĵ��壺ǰ�˴��塣�ɱ��̳С�
  ǰ�˴�����Զ��ʾ�����д������ǰ��������㣩����ǰ�˴�����ʾʱ���û��޷������������塣�������ģ̬�������ơ�
  ���Ǻ�ģ̬���岻ͬ���ǣ�������ʾʱ������ͣӦ�ó�������̡߳�
  Ҳ����˵��Ӧ�ó����ڵ���ShowFrontal��ʾǰ�˴�����Կɼ���ִ�д���������������������ı�ǰ�˴���Ľ��档
  �û���ǰ�˴���������������������رհ�ť���ɹر�ǰ�˴��壬Ӧ�ó���Ҳ�ɵ���CloseFrontal�����رա�
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
  ��MDI������ر����е�MDI�Ӵ��塣
  No test.
 --------------------------------}
procedure mnCloseAllMDIChildren;

{--------------------------------
  ��MDI���������ָ�����MDI�Ӵ��岢��ʾ��
  �����Ƿ��ҵ�����ʾ�ɹ���
  AutoMaximizeָʾ����ʾ�Ӵ���ʱ���Ƿ��Զ���󻯡�
  No test.
 --------------------------------}
function mnShowMDIChild(MDIChildClass: TFormClass; const AutoMaximize: Boolean): Boolean;

{--------------------------------
  Enable��DisableӦ�ó��������д��塣
  Tested in TestApp.
 --------------------------------}
procedure mnEnableAllForms;
procedure mnDisableAllForms;

{--------------------------------
  װ�ش�����Դ��
  ���������ͨ��CreateNew�����ģ���ɵ��ñ��������ֹ�װ�ش�����Դ��
  ���磬�ڷ�MDI�����д���MDIChild����ʱ������ʹ��Createֱ�Ӵ�������ֻ��ʹ��CreateNew��mnLoadFormRes��
  No test.
 --------------------------------}
procedure mnLoadFormRes(FormClass: TFormClass; var FormReference);

{--------------------------------
  �ı�ָ������Ĵ�С��ʹ֮������Ļ�Ĺ�������
  Tested in TestApp.
 --------------------------------}
procedure mnFillScreen(AForm: TCustomForm);

{--------------------------------
  ��ָ�������������ɵ�ǰ����ϵͳ�����µı�׼���塣
  Tested in TestApp.
 --------------------------------}
procedure mnSetStandardFont(AForm: TCustomForm);

const
{--------------------------------
  ר����About�Ի���Ĳ˵���ID��
 --------------------------------}
  ItemID_About = $8208;

{--------------------------------
  �ڴ����ϵͳ�˵������Ӳ˵����ָ�����
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
       Name := '����';
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
