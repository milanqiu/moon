unit mnDialog;

interface

uses mnSystem, Classes, Dialogs, Windows, Graphics, mnGraphics;

{$IFDEF MN_NODIALOG}

type
{--------------------------------
  ����Ŀ��Ԥ���붨�����MN_NODIALOGʱ��mnDialog��Ԫ�ڣ���M��ͷ�ĺ����⣨��ʾMandatory�������к��������ᵯ���Ի���
  ���ǰ�Ӧ�����ĶԻ�����Ϣ����һ��mnTDialogInfo�ṹ������Ի����������Ϣ��
  һ�����ڵ�Ԫ�����У����������н���ʱ��������Ҫ���û��ֹ�����Ի���
 --------------------------------}
  mnTDialogInfo = record
    Kind: string;
    Msg: string;
  end;

var
{--------------------------------
  �ϴε����ĶԻ�����Ϣ�����ڵ�Ԫ��������顣
 --------------------------------}
  mnLastDialogInfo: mnTDialogInfo;

{$ENDIF}

{--------------------------------
  ��ʾһ����ʾ������ΪMsg������ΪTitle��
  ��δָ�����⣬��ȱʡΪӦ�ó���ı��⡣
  Tested in TestUnit and TestApp.
 --------------------------------}
procedure mnInfoBox(const Msg: string;   const Title: string = ''); overload;
procedure mnInfoBox(const Msg: Integer;  const Title: string = ''); overload;
procedure mnInfoBox(const Msg: Extended; const Title: string = ''); overload;
procedure mnInfoBox(const Msg: Boolean;  const Title: string = ''); overload;
procedure mnInfoBoxDT(const Msg: TDateTime; const Title: string = '');
procedure mnInfoBoxVar(const Msg: Variant; const Title: string = '');

{--------------------------------
  ǿ���Ե���ʾһ����ʾ������ΪMsg������ΪTitle��
  ��δָ�����⣬��ȱʡΪӦ�ó���ı��⡣
  ��mnInfoBoxϵ�к����Ĺ�����ͬ��������Ԥ���붨��MN_NODIALOG��Ӱ�졣
  Tested in TestApp.
 --------------------------------}
procedure mnMInfoBox(const Msg: string;   const Title: string = ''); overload;
procedure mnMInfoBox(const Msg: Integer;  const Title: string = ''); overload;
procedure mnMInfoBox(const Msg: Extended; const Title: string = ''); overload;
procedure mnMInfoBox(const Msg: Boolean;  const Title: string = ''); overload;
procedure mnMInfoBoxDT(const Msg: TDateTime; const Title: string = '');
procedure mnMInfoBoxVar(const Msg: Variant; const Title: string = '');

{--------------------------------
  ��ʾһ�����������ΪMsg������ΪTitle��
  ��δָ�����⣬��ȱʡΪӦ�ó���ı��⡣
  Tested in TestUnit and TestApp.
 --------------------------------}
procedure mnErrorBox(const Msg: string; const Title: string = '');
{--------------------------------
  ��ʾһ�����������ΪMsg������ΪTitle��
  ��δָ�����⣬��ȱʡΪӦ�ó���ı��⡣
  Tested in TestUnit and TestApp.
 --------------------------------}
procedure mnWarningBox(const Msg: string; const Title: string = '');
{--------------------------------
  ��ʾһ����Yes��No������ť�ľ��������ΪMsg������ΪTitle��
  �û����Yes����True�����No����False��
  ��δָ�����⣬��ȱʡΪӦ�ó���ı��⡣
  Tested in TestUnit and TestApp.
 --------------------------------}
function mnWarningBoxEx(const Msg: string; const Title: string = ''): Boolean;
{--------------------------------
  ��ʾһ����Yes��No������ť��ȷ�Ͽ�����ΪMsg������ΪTitle��
  �û����Yes����True�����No����False��
  ��δָ�����⣬��ȱʡΪӦ�ó���ı��⡣
  Tested in TestUnit and TestApp.
 --------------------------------}
function mnConfirmBox(const Msg: string; const Title: string = ''): Boolean;
{--------------------------------
  ��ʾһ����Yes��No��Cancel������ť��ȷ�Ͽ�����ΪMsg������ΪTitle��
  �û����Yes����IDYES�����No����IDNO�����Cancel����IDCANCEL��
  ��δָ�����⣬��ȱʡΪӦ�ó���ı��⡣
  Tested in TestUnit and TestApp.
 --------------------------------}
function mnConfirmBoxEx(const Msg: string; const Title: string = ''): Integer;

{--------------------------------
  ����ʵ��ֵ������ֵ�Ƿ�һ�£���ʾ��ʾ�������
  ��δָ�����⣬��ȱʡΪӦ�ó���ı��⡣
  Tested in TestUnit and TestApp.
 --------------------------------}
procedure mnShouldBeBox(const Actual, Expected: string;   const Title: string = ''); overload;
procedure mnShouldBeBox(const Actual, Expected: Integer;  const Title: string = ''); overload;
procedure mnShouldBeBox(const Actual, Expected: Extended; const Title: string = ''); overload;
procedure mnShouldBeBox(const Actual, Expected: Boolean;  const Title: string = ''); overload;
procedure mnShouldBeBoxDT(const Actual, Expected: TDateTime; const Title: string = '');

{--------------------------------
  ��ʾһ�������ı�������ΪMsg������ΪTitle��
  ��δָ�����⣬��ȱʡΪӦ�ó���ı��⡣
  CanSave��ʾ�Ƿ��б��水ť�����Խ��ı������ݱ��浽�ļ���
  Tested in TestUnit and TestApp.
 --------------------------------}
procedure mnMemoBox(const Msg: string; const Title: string = ''; const CanSave: Boolean = False);

{--------------------------------
  ǿ���Ե���ʾһ�������ı�������ΪMsg������ΪTitle��
  ��δָ�����⣬��ȱʡΪӦ�ó���ı��⡣
  CanSave��ʾ�Ƿ��б��水ť�����Խ��ı������ݱ��浽�ļ���
  ��mnMemoBox�����Ĺ�����ͬ��������Ԥ���붨��MN_NODIALOG��Ӱ�졣
  Tested in TestApp.
 --------------------------------}
procedure mnMMemoBox(const Msg: string; const Title: string = ''; const CanSave: Boolean = False);

{--------------------------------
  ��ʾһ��ͼƬ�Ի�������ΪBMP��PixeledImage������ΪTitle��
  ��δָ�����⣬��ȱʡΪӦ�ó���ı��⡣
  ����ȷ����ȡ����ť��
  �����û��Ƿ�ȷ���˶Ի��򣬼��Ի����Ƿ񷵻�mrOK��
  Tested in TestApp.
 --------------------------------}
function mnImageBox(BMP: TBitmap;                  const Title: string = ''): Boolean; overload;
function mnImageBox(PixeledImage: mnTPixeledImage; const Title: string = ''): Boolean; overload;

{--------------------------------
  ��ʾһ���Ի���������һ���༭���û����롣
  Title�ǶԻ���ı��⣬Prompt�ǶԻ�������ʾ�û���������ݣ�Default�Ǳ༭���ʼ��ȱʡֵ��
  �����û��Ƿ�ȷ���˶Ի��򣬼��Ի����Ƿ񷵻�mrOK������ǣ�Value���洢�༭���ֵ��
  ����ָ�����û������Լ������δ����Լ��ʱ�Ĵ�����Ϣ��
  Tested in TestUnit and TestApp.
 --------------------------------}
function mnEditDialog(const Title, Prompt, Default: string; var Value: string;
  const EditConstraint: mnTStrConstraint = scAny; const ErrorMsg: string = ''): Boolean;

{--------------------------------
  ��ʾһ���Ի���������һ��ComboBox���û�ѡ��
  Title�ǶԻ���ı��⣬Prompt�ǶԻ�������ʾ�û�ѡ������ݣ�ComboItems��ComboBox��ѡ�
  �����û��Ƿ�ȷ���˶Ի��򣬼��Ի����Ƿ񷵻�mrOK������ǣ�SelectedIndex���洢ComboBox�ı�ѡ��������
  ����ͨ��Ԥ�ȶ�SelectedIndex��ֵ��������ComboBoxȱʡѡ�е���Ŀ�����SelectedIndexԽ�磬��ȱʡѡ�е�0�
  Tested in TestUnit and TestApp.
 --------------------------------}
function mnComboBoxDialog(const Title, Prompt: string; ComboItems: TStrings; var SelectedIndex: Integer): Boolean;

{--------------------------------
  ��ʾһ���Ի���������һ��CheckListBox���û���ѡ��
  Title�ǶԻ���ı��⣬Prompt�ǶԻ�������ʾ�û���ѡ�����ݣ�CheckItems��CheckListBox��ѡ�
  �����û��Ƿ�ȷ���˶Ի��򣬼��Ի����Ƿ񷵻�mrOK������ǣ�CheckedResult���洢CheckListBox��ÿһ���Ƿ񱻹�ѡ�Ľ����
  ע�⣺����ͨ��Ԥ�ȶ�CheckedResult��ֵ��������CheckListBox��ȱʡ��ѡ�ϵ���Ŀ��
        ��ʱ��CheckedResult�ĸ��������벻С��CheckItems�ĸ�����
        ���CheckedResult����Ϊ0����ʾ������ȱʡ��δ��ѡ�ϡ�
  Tested in TestUnit and TestApp.
 --------------------------------}
function mnCheckListBoxDialog(const Title, Prompt: string; CheckItems: TStrings; CheckedResult: mnTBoolList): Boolean;

type
{--------------------------------
  ��׼OpenDialog��SaveDialog��Ԥ����ĸ����ļ����͵�Filter�����Կ�����á�
 --------------------------------}
  mnTDialogFilter = (dfAll, dfText, dfExcel, dfWord, dfXML);

{--------------------------------
  �������OpenDialog��SaveDialog��Filter��
  Tested in TestApp.
 --------------------------------}
procedure mnSetOpenDialogFilter(OpenDialog: TOpenDialog; const DialogFilter: mnTDialogFilter);
procedure mnSetSaveDialogFilter(SaveDialog: TSaveDialog; const DialogFilter: mnTDialogFilter);

implementation

uses SysUtils, Variants, Forms, mnResStrsU, StdCtrls, mnWindows,
  cxTextEdit, cxButtons, mnForm, Controls, cxDropDownEdit, mnControl,
  cxCheckListBox, mnFile, ExtCtrls;

procedure mnInfoBox(const Msg: string;   const Title: string = ''); overload;
begin
{$IFDEF MN_NODIALOG}
  mnLastDialogInfo.Kind := 'mnInfoBox';
  mnLastDialogInfo.Msg := Msg;
{$ELSE}
  mnMInfoBox(Msg, Title);
{$ENDIF}
end;

procedure mnInfoBox(const Msg: Integer;  const Title: string = ''); overload;
begin
  mnInfoBox(IntToStr(Msg), Title);
end;

procedure mnInfoBox(const Msg: Extended; const Title: string = ''); overload;
begin
  mnInfoBox(FloatToStr(Msg), Title);
end;

procedure mnInfoBox(const Msg: Boolean;  const Title: string = ''); overload;
begin
  mnInfoBox(mnBoolToStr(Msg), Title);
end;

procedure mnInfoBoxDT(const Msg: TDateTime; const Title: string = '');
begin
  mnInfoBox(DateTimeToStr(Msg), Title);
end;

procedure mnInfoBoxVar(const Msg: Variant; const Title: string = '');
begin
  mnInfoBox(VarToStr(Msg), Title);
end;

procedure mnMInfoBox(const Msg: string;   const Title: string = ''); overload;
begin
  Application.MessageBox(PChar(Msg), PChar(mnChooseStr(Title = '', Application.Title, Title)), MB_ICONINFORMATION);
end;

procedure mnMInfoBox(const Msg: Integer;  const Title: string = ''); overload;
begin
  mnMInfoBox(IntToStr(Msg), Title);
end;

procedure mnMInfoBox(const Msg: Extended; const Title: string = ''); overload;
begin
  mnMInfoBox(FloatToStr(Msg), Title);
end;

procedure mnMInfoBox(const Msg: Boolean;  const Title: string = ''); overload;
begin
  mnMInfoBox(BoolToStr(Msg, True), Title);
end;

procedure mnMInfoBoxDT(const Msg: TDateTime; const Title: string = '');
begin
  mnMInfoBox(DateTimeToStr(Msg), Title);
end;

procedure mnMInfoBoxVar(const Msg: Variant; const Title: string = '');
begin
  mnMInfoBox(VarToStr(Msg), Title);
end;

procedure mnErrorBox(const Msg: string; const Title: string = '');
begin
{$IFDEF MN_NODIALOG}
  mnLastDialogInfo.Kind := 'mnErrorBox';
  mnLastDialogInfo.Msg := Msg;
{$ELSE}
  Application.MessageBox(PChar(Msg), PChar(mnChooseStr(Title = '', Application.Title, Title)), MB_ICONERROR);
{$ENDIF}
end;

procedure mnWarningBox(const Msg: string; const Title: string = '');
begin
{$IFDEF MN_NODIALOG}
  mnLastDialogInfo.Kind := 'mnWarningBox';
  mnLastDialogInfo.Msg := Msg;
{$ELSE}
  Application.MessageBox(PChar(Msg), PChar(mnChooseStr(Title = '', Application.Title, Title)), MB_ICONWARNING);
{$ENDIF}
end;

function mnWarningBoxEx(const Msg: string; const Title: string = ''): Boolean;
begin
{$IFDEF MN_NODIALOG}
  mnLastDialogInfo.Kind := 'mnWarningBoxEx';
  mnLastDialogInfo.Msg := Msg;
  Result := True;
{$ELSE}
  Result := Application.MessageBox(PChar(Msg), PChar(mnChooseStr(Title = '', Application.Title, Title)), MB_ICONWARNING or MB_YESNO) = IDYES;
{$ENDIF}
end;

function mnConfirmBox(const Msg: string; const Title: string = ''): Boolean;
begin
{$IFDEF MN_NODIALOG}
  mnLastDialogInfo.Kind := 'mnConfirmBox';
  mnLastDialogInfo.Msg := Msg;
  Result := True;
{$ELSE}
  Result := Application.MessageBox(PChar(Msg), PChar(mnChooseStr(Title = '', Application.Title, Title)), MB_ICONQUESTION or MB_YESNO) = IDYES;
{$ENDIF}
end;

function mnConfirmBoxEx(const Msg: string; const Title: string = ''): Integer;
begin
{$IFDEF MN_NODIALOG}
  mnLastDialogInfo.Kind := 'mnConfirmBoxEx';
  mnLastDialogInfo.Msg := Msg;
  Result := IDYES;
{$ELSE}
  Result := Application.MessageBox(PChar(Msg), PChar(mnChooseStr(Title = '', Application.Title, Title)), MB_ICONQUESTION or MB_YESNOCANCEL);
{$ENDIF}
end;

procedure mnShouldBeBox(const Actual, Expected: string;   const Title: string = ''); overload;
begin
  if Actual = Expected then
    mnInfoBox(Format(SShouldBeCorrect, [Actual]), Title)
  else
    mnErrorBox(Format(SShouldBeWrong, [Actual, Expected]), Title);
end;

procedure mnShouldBeBox(const Actual, Expected: Integer;  const Title: string = ''); overload;
begin
  if Actual = Expected then
    mnInfoBox(Format(SShouldBeCorrect, [IntToStr(Actual)]), Title)
  else
    mnErrorBox(Format(SShouldBeWrong, [IntToStr(Actual), IntToStr(Expected)]), Title);
end;

procedure mnShouldBeBox(const Actual, Expected: Extended; const Title: string = ''); overload;
begin
  if Actual = Expected then
    mnInfoBox(Format(SShouldBeCorrect, [FloatToStr(Actual)]), Title)
  else
    mnErrorBox(Format(SShouldBeWrong, [FloatToStr(Actual), FloatToStr(Expected)]), Title);
end;

procedure mnShouldBeBox(const Actual, Expected: Boolean;  const Title: string = ''); overload;
begin
  if Actual = Expected then
    mnInfoBox(Format(SShouldBeCorrect, [mnBoolToStr(Actual)]), Title)
  else
    mnErrorBox(Format(SShouldBeWrong, [mnBoolToStr(Actual), mnBoolToStr(Expected)]), Title);
end;

procedure mnShouldBeBoxDT(const Actual, Expected: TDateTime; const Title: string = '');
begin
  if Actual = Expected then
    mnInfoBox(Format(SShouldBeCorrect, [DateTimeToStr(Actual)]), Title)
  else
    mnErrorBox(Format(SShouldBeWrong, [DateTimeToStr(Actual), DateTimeToStr(Expected)]), Title);
end;

type
  TShortcutMemo = class(TMemo)
  private
    procedure WhenMemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  end;

{ TShortcutMemo }

procedure TShortcutMemo.WhenMemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then (Parent as TForm).Close
  else if (Key = Ord('A')) and mnIsVKeyHold(VK_CONTROL) then SelectAll;
end;

type
  TShortcutSaveBtn = class(TcxButton)
  private
    StrToBeSaved: string;
    procedure WhenButtonClick(Sender: TObject);
  end;

{ TShortcutSaveBtn }

procedure TShortcutSaveBtn.WhenButtonClick(Sender: TObject);
var
  SaveDialog: TSaveDialog;
begin
  SaveDialog := TSaveDialog.Create(nil);
  try
    mnSetSaveDialogFilter(SaveDialog, dfAll);
    if SaveDialog.Execute then
    begin
      mnSaveStrToFile(StrToBeSaved, SaveDialog.FileName);
      mnInfoBox(SSaveSuccessfully);
    end;
  finally
    SaveDialog.Free;
  end;
end;

procedure mnMemoBox(const Msg: string; const Title: string = ''; const CanSave: Boolean = False);
begin
{$IFDEF MN_NODIALOG}
  mnLastDialogInfo.Kind := 'mnMemoBox';
  mnLastDialogInfo.Msg := Msg;
{$ELSE}
  mnMMemoBox(Msg, Title, CanSave);
{$ENDIF}
end;

procedure mnMMemoBox(const Msg: string; const Title: string = ''; const CanSave: Boolean = False);
var
  MemoDialog: TForm;
begin
  MemoDialog := TForm.Create(nil);
  try
    mnSetStandardFont(MemoDialog);

    with MemoDialog do
    begin
      Caption := mnChooseStr(Title = '', Application.Title, Title);
      BorderStyle := bsDialog;
      Position := poScreenCenter;
      Width := Screen.WorkAreaWidth * 2 div 3;
      Height := Screen.WorkAreaHeight * 2 div 3;
    end;

    with TShortcutMemo.Create(MemoDialog) do
    begin
      Parent := MemoDialog;
      if CanSave then
      begin
        Align := alTop;
        Height := MemoDialog.ClientHeight - 45;
      end
      else
      begin
        Align := alClient;
      end;
      Text := Msg;
      ScrollBars := ssBoth;
      ReadOnly := True;
      OnKeyDown := WhenMemoKeyDown;
    end;

    if CanSave then
    begin
      with TShortcutSaveBtn.Create(MemoDialog) do
      begin
        Parent := MemoDialog;
        Caption := SSave;
        Left := (MemoDialog.ClientWidth - Width) div 2;
        Top := MemoDialog.ClientHeight - 10 - Height;
        StrToBeSaved := Msg;
        OnClick := WhenButtonClick;
      end;
    end;

    MemoDialog.ShowModal;
  finally
    MemoDialog.Free;
  end;
end;

function mnImageBox(BMP: TBitmap;                  const Title: string = ''): Boolean; overload;
{$IFDEF MN_NODIALOG}
begin
  mnLastDialogInfo.Kind := 'mnImageBox';
  mnLastDialogInfo.Msg := '';
  Result := True;
end;
{$ELSE}
var
  ImageDialog: TForm;
  Panel: TPanel;
begin
  ImageDialog := TForm.Create(nil);
  try
    mnSetStandardFont(ImageDialog);

    with ImageDialog do
    begin
      Caption := mnChooseStr(Title = '', Application.Title, Title);
      BorderStyle := bsDialog;
      Position := poScreenCenter;
      Width := Screen.WorkAreaWidth * 2 div 3;
      Height := Screen.WorkAreaHeight * 2 div 3;
    end;

    Panel := TPanel.Create(ImageDialog);
    with Panel do
    begin
      Parent := ImageDialog;
      Align := alTop;
      Height := ImageDialog.ClientHeight - 45;
      BevelOuter := bvLowered;
    end;

    with TImage.Create(ImageDialog) do
    begin
      Parent := Panel;
      Align := alClient;
      Picture.Bitmap.Assign(BMP);
    end;

    with TcxButton.Create(ImageDialog) do
    begin
      Parent := ImageDialog;
      Caption := SOK;
      Left := ImageDialog.ClientWidth div 2 - 10 - Width;
      Top := ImageDialog.ClientHeight - 10 - Height;
      ModalResult := mrOK;
      Default := True;
    end;

    with TcxButton.Create(ImageDialog) do
    begin
      Parent := ImageDialog;
      Caption := SCancel;
      Left := ImageDialog.ClientWidth div 2 + 10;
      Top := ImageDialog.ClientHeight - 10 - Height;
      ModalResult := mrCancel;
      Cancel := True;
    end;

    Result := ImageDialog.ShowModal = mrOK;
  finally
    ImageDialog.Free;
  end;
end;
{$ENDIF}

function mnImageBox(PixeledImage: mnTPixeledImage; const Title: string = ''): Boolean; overload;
var
  BMP: TBitmap;
begin
  BMP := TBitmap.Create;
  try
    PixeledImage.SaveToBMP(BMP);
    Result := mnImageBox(BMP, Title);
  finally
    BMP.Free;
  end;
end;

{$IFNDEF MN_NODIALOG}

type
  TEditForm = class(TForm)
  private
    FEdit: TcxTextEdit;
    FEditConstraint: mnTStrConstraint;
    FErrorMsg: string;
    procedure WhenFormClose(Sender: TObject; var Action: TCloseAction);
  end;

{ TEditForm }

procedure TEditForm.WhenFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrOK then mnValidateControlText(FEdit, FEditConstraint, '', FErrorMsg);
end;

{$ENDIF}

function mnEditDialog(const Title, Prompt, Default: string; var Value: string;
  const EditConstraint: mnTStrConstraint = scAny; const ErrorMsg: string = ''): Boolean;
{$IFDEF MN_NODIALOG}
begin
  mnLastDialogInfo.Kind := 'mnEditDialog';
  mnLastDialogInfo.Msg := '';
  Value := Default;
  Result := True;
end;
{$ELSE}
var
  EditDialog: TEditForm;
  Edit: TcxTextEdit;
begin
  EditDialog := TEditForm.CreateNew(nil);
  try
    mnSetStandardFont(EditDialog);

    with EditDialog do
    begin
      Caption := Title;
      BorderStyle := bsDialog;
      Position := poScreenCenter;
      Width := 298;
      Height := 135;
      FEditConstraint := EditConstraint;
      FErrorMsg := ErrorMsg;
      OnClose := WhenFormClose;
    end;

    with TLabel.Create(EditDialog) do
    begin
      Parent := EditDialog;
      Caption := Prompt;
      Left := 20;
      Top := 20;
    end;

    Edit := TcxTextEdit.Create(EditDialog);
    with Edit do
    begin
      Parent := EditDialog;
      Left := 20;
      Top := 40;
      Width := 250;
      Text := Default;
    end;
    EditDialog.FEdit := Edit;

    with TcxButton.Create(EditDialog) do
    begin
      Parent := EditDialog;
      Caption := SOK;
      Left := 140 - Width;
      Top := 72;
      ModalResult := mrOK;
      Default := True;
    end;

    with TcxButton.Create(EditDialog) do
    begin
      Parent := EditDialog;
      Caption := SCancel;
      Left := 150;
      Top := 72;
      ModalResult := mrCancel;
      Cancel := True;
    end;

    Result := EditDialog.ShowModal = mrOK;
    if Result then Value := Edit.Text;
  finally
    EditDialog.Free;
  end;
end;
{$ENDIF}

function mnComboBoxDialog(const Title, Prompt: string; ComboItems: TStrings; var SelectedIndex: Integer): Boolean;
{$IFDEF MN_NODIALOG}
begin
  mnLastDialogInfo.Kind := 'mnComboBoxDialog';
  mnLastDialogInfo.Msg := '';
  Result := True;
end;
{$ELSE}
var
  ComboBoxDialog: TForm;
  ComboBox: TcxComboBox;
begin
  if not mnBetweenIE(SelectedIndex, 0, ComboItems.Count) then
    SelectedIndex := 0;
    
  ComboBoxDialog := TForm.Create(nil);
  try
    mnSetStandardFont(ComboBoxDialog);

    with ComboBoxDialog do
    begin
      Caption := Title;
      BorderStyle := bsDialog;
      Position := poScreenCenter;
      Width := 298;
      Height := 135;
    end;

    with TLabel.Create(ComboBoxDialog) do
    begin
      Parent := ComboBoxDialog;
      Caption := Prompt;
      Left := 20;
      Top := 20;
    end;

    ComboBox := TcxComboBox.Create(ComboBoxDialog);
    with ComboBox do
    begin
      Parent := ComboBoxDialog;
      Left := 20;
      Top := 40;
      Width := 250;
      Properties.DropDownListStyle := lsFixedList;
      Properties.Items.Assign(ComboItems);
      ItemIndex := SelectedIndex;
    end;

    with TcxButton.Create(ComboBoxDialog) do
    begin
      Parent := ComboBoxDialog;
      Caption := SOK;
      Left := 140 - Width;
      Top := 72;
      ModalResult := mrOK;
      Default := True;
    end;

    with TcxButton.Create(ComboBoxDialog) do
    begin
      Parent := ComboBoxDialog;
      Caption := SCancel;
      Left := 150;
      Top := 72;
      ModalResult := mrCancel;
      Cancel := True;
    end;

    Result := ComboBoxDialog.ShowModal = mrOK;
    if Result then SelectedIndex := ComboBox.ItemIndex;
  finally
    ComboBoxDialog.Free;
  end;
end;
{$ENDIF}

type
  TEventContainer = class
    procedure WhenCheckAllBtnClick(Sender: TObject);
    procedure WhenCheckNoneBtnClick(Sender: TObject);
  end;

{ TEventContainer }

procedure TEventContainer.WhenCheckAllBtnClick(Sender: TObject);
var
  CheckListBox: TcxCheckListBox;
  i: Integer;
begin
  CheckListBox := TcxCheckListBox((Sender as TcxButton).Tag);
  for i := 0 to CheckListBox.Items.Count-1 do
    CheckListBox.Items[i].Checked := True;
end;

procedure TEventContainer.WhenCheckNoneBtnClick(Sender: TObject);
var
  CheckListBox: TcxCheckListBox;
  i: Integer;
begin
  CheckListBox := TcxCheckListBox((Sender as TcxButton).Tag);
  for i := 0 to CheckListBox.Items.Count-1 do
    CheckListBox.Items[i].Checked := False;
end;

function mnCheckListBoxDialog(const Title, Prompt: string; CheckItems: TStrings; CheckedResult: mnTBoolList): Boolean;
{$IFDEF MN_NODIALOG}
begin
  mnLastDialogInfo.Kind := 'mnCheckListBoxDialog';
  mnLastDialogInfo.Msg := '';
  Result := True;
end;
{$ELSE}
var
  CheckListBoxDialog: TForm;
  CheckListBox: TcxCheckListBox;
  EventContainer: TEventContainer;
  i: Integer;
begin
  CheckListBoxDialog := TForm.Create(nil);
  EventContainer := TEventContainer.Create;
  try
    mnSetStandardFont(CheckListBoxDialog);

    with CheckListBoxDialog do
    begin
      Caption := Title;
      BorderStyle := bsDialog;
      Position := poScreenCenter;
      Width := 298;
      Height := 397;
    end;

    with TLabel.Create(CheckListBoxDialog) do
    begin
      Parent := CheckListBoxDialog;
      Caption := Prompt;
      Left := 20;
      Top := 20;
    end;

    CheckListBox := TcxCheckListBox.Create(CheckListBoxDialog);
    with CheckListBox do
    begin
      Parent := CheckListBoxDialog;
      Left := 20;
      Top := 40;
      Width := 250;
      Height := 250;
      for i := 0 to CheckItems.Count-1 do
        with Items.Add do
        begin
          Text := CheckItems[i];
          if CheckedResult.Count > 0 then
            Checked := CheckedResult[i];
        end;
    end;

    with TcxButton.Create(CheckListBoxDialog) do
    begin
      Parent := CheckListBoxDialog;
      Caption := SOK;
      Left := 140 - Width;
      Top := 335;
      ModalResult := mrOK;
      Default := True;
    end;

    with TcxButton.Create(CheckListBoxDialog) do
    begin
      Parent := CheckListBoxDialog;
      Caption := SCancel;
      Left := 150;
      Top := 335;
      ModalResult := mrCancel;
      Cancel := True;
    end;

    with TcxButton.Create(CheckListBoxDialog) do
    begin
      Parent := CheckListBoxDialog;
      Caption := SCheckAll;
      Left := 110 - Width;
      Top := 302;
      Tag := Integer(CheckListBox);
      OnClick := EventContainer.WhenCheckAllBtnClick;
    end;

    with TcxButton.Create(CheckListBoxDialog) do
    begin
      Parent := CheckListBoxDialog;
      Caption := SCheckNone;
      Left := 180;
      Top := 302;
      Tag := Integer(CheckListBox);
      OnClick := EventContainer.WhenCheckNoneBtnClick;
    end;

    Result := CheckListBoxDialog.ShowModal = mrOK;
    if Result then
    begin
      CheckedResult.Clear;
      for i := 0 to CheckListBox.Items.Count-1 do
        CheckedResult.Add(CheckListBox.Items[i].Checked);
    end;
  finally
    EventContainer.Free;
    CheckListBoxDialog.Free;
  end;
end;
{$ENDIF}

procedure mnSetOpenDialogFilter(OpenDialog: TOpenDialog; const DialogFilter: mnTDialogFilter);
begin
  case DialogFilter of
    dfAll:   OpenDialog.Filter := SDialogFilterAll;
    dfText:  OpenDialog.Filter := SDialogFilterText;
    dfExcel: OpenDialog.Filter := SDialogFilterExcel;
    dfWord:  OpenDialog.Filter := SDialogFilterWord;
    dfXML:   OpenDialog.Filter := SDialogFilterXML;
  end;
  case DialogFilter of
    dfText:  OpenDialog.DefaultExt := 'txt';
    dfExcel: OpenDialog.DefaultExt := 'xlsx';
    dfWord:  OpenDialog.DefaultExt := 'docx';
    dfXML:   OpenDialog.DefaultExt := 'xml';
  end;
end;

procedure mnSetSaveDialogFilter(SaveDialog: TSaveDialog; const DialogFilter: mnTDialogFilter);
begin
  case DialogFilter of
    dfAll:   SaveDialog.Filter := SDialogFilterAll;
    dfText:  SaveDialog.Filter := SDialogFilterText;
    dfExcel: SaveDialog.Filter := SDialogFilterExcel;
    dfWord:  SaveDialog.Filter := SDialogFilterWord;
    dfXML:   SaveDialog.Filter := SDialogFilterXML;
  end;
  case DialogFilter of
    dfText:  SaveDialog.DefaultExt := 'txt';
    dfExcel: SaveDialog.DefaultExt := 'xlsx';
    dfWord:  SaveDialog.DefaultExt := 'docx';
    dfXML:   SaveDialog.DefaultExt := 'xml';
  end;
end;

end.
