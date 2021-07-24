unit mnDialog;

interface

uses mnSystem, Classes, Dialogs, Windows, Graphics, mnGraphics;

{$IFDEF MN_NODIALOG}

type
{--------------------------------
  当项目的预编译定义包含MN_NODIALOG时，mnDialog单元内，除M打头的函数外（表示Mandatory），所有函数都不会弹出对话框，
  而是把应弹出的对话框信息存在一个mnTDialogInfo结构里，包括对话框种类和消息。
  一般用于单元测试中，在与界面进行交互时，不再需要让用户手工处理对话框。
 --------------------------------}
  mnTDialogInfo = record
    Kind: string;
    Msg: string;
  end;

var
{--------------------------------
  上次弹出的对话框信息，可在单元测试里检验。
 --------------------------------}
  mnLastDialogInfo: mnTDialogInfo;

{$ENDIF}

{--------------------------------
  显示一个提示框，内容为Msg，标题为Title。
  若未指定标题，则缺省为应用程序的标题。
  Tested in TestUnit and TestApp.
 --------------------------------}
procedure mnInfoBox(const Msg: string;   const Title: string = ''); overload;
procedure mnInfoBox(const Msg: Integer;  const Title: string = ''); overload;
procedure mnInfoBox(const Msg: Extended; const Title: string = ''); overload;
procedure mnInfoBox(const Msg: Boolean;  const Title: string = ''); overload;
procedure mnInfoBoxDT(const Msg: TDateTime; const Title: string = '');
procedure mnInfoBoxVar(const Msg: Variant; const Title: string = '');

{--------------------------------
  强制性地显示一个提示框，内容为Msg，标题为Title。
  若未指定标题，则缺省为应用程序的标题。
  和mnInfoBox系列函数的功能相同，但不受预编译定义MN_NODIALOG的影响。
  Tested in TestApp.
 --------------------------------}
procedure mnMInfoBox(const Msg: string;   const Title: string = ''); overload;
procedure mnMInfoBox(const Msg: Integer;  const Title: string = ''); overload;
procedure mnMInfoBox(const Msg: Extended; const Title: string = ''); overload;
procedure mnMInfoBox(const Msg: Boolean;  const Title: string = ''); overload;
procedure mnMInfoBoxDT(const Msg: TDateTime; const Title: string = '');
procedure mnMInfoBoxVar(const Msg: Variant; const Title: string = '');

{--------------------------------
  显示一个错误框，内容为Msg，标题为Title。
  若未指定标题，则缺省为应用程序的标题。
  Tested in TestUnit and TestApp.
 --------------------------------}
procedure mnErrorBox(const Msg: string; const Title: string = '');
{--------------------------------
  显示一个警告框，内容为Msg，标题为Title。
  若未指定标题，则缺省为应用程序的标题。
  Tested in TestUnit and TestApp.
 --------------------------------}
procedure mnWarningBox(const Msg: string; const Title: string = '');
{--------------------------------
  显示一个带Yes和No两个按钮的警告框，内容为Msg，标题为Title。
  用户点击Yes返回True，点击No返回False。
  若未指定标题，则缺省为应用程序的标题。
  Tested in TestUnit and TestApp.
 --------------------------------}
function mnWarningBoxEx(const Msg: string; const Title: string = ''): Boolean;
{--------------------------------
  显示一个带Yes和No两个按钮的确认框，内容为Msg，标题为Title。
  用户点击Yes返回True，点击No返回False。
  若未指定标题，则缺省为应用程序的标题。
  Tested in TestUnit and TestApp.
 --------------------------------}
function mnConfirmBox(const Msg: string; const Title: string = ''): Boolean;
{--------------------------------
  显示一个带Yes、No和Cancel三个按钮的确认框，内容为Msg，标题为Title。
  用户点击Yes返回IDYES，点击No返回IDNO，点击Cancel返回IDCANCEL。
  若未指定标题，则缺省为应用程序的标题。
  Tested in TestUnit and TestApp.
 --------------------------------}
function mnConfirmBoxEx(const Msg: string; const Title: string = ''): Integer;

{--------------------------------
  根据实际值和期望值是否一致，显示提示框或错误框。
  若未指定标题，则缺省为应用程序的标题。
  Tested in TestUnit and TestApp.
 --------------------------------}
procedure mnShouldBeBox(const Actual, Expected: string;   const Title: string = ''); overload;
procedure mnShouldBeBox(const Actual, Expected: Integer;  const Title: string = ''); overload;
procedure mnShouldBeBox(const Actual, Expected: Extended; const Title: string = ''); overload;
procedure mnShouldBeBox(const Actual, Expected: Boolean;  const Title: string = ''); overload;
procedure mnShouldBeBoxDT(const Actual, Expected: TDateTime; const Title: string = '');

{--------------------------------
  显示一个多行文本框，内容为Msg，标题为Title。
  若未指定标题，则缺省为应用程序的标题。
  CanSave表示是否有保存按钮，可以将文本框内容保存到文件。
  Tested in TestUnit and TestApp.
 --------------------------------}
procedure mnMemoBox(const Msg: string; const Title: string = ''; const CanSave: Boolean = False);

{--------------------------------
  强制性地显示一个多行文本框，内容为Msg，标题为Title。
  若未指定标题，则缺省为应用程序的标题。
  CanSave表示是否有保存按钮，可以将文本框内容保存到文件。
  和mnMemoBox函数的功能相同，但不受预编译定义MN_NODIALOG的影响。
  Tested in TestApp.
 --------------------------------}
procedure mnMMemoBox(const Msg: string; const Title: string = ''; const CanSave: Boolean = False);

{--------------------------------
  显示一个图片对话框，内容为BMP或PixeledImage，标题为Title。
  若未指定标题，则缺省为应用程序的标题。
  另有确定和取消按钮。
  返回用户是否确认了对话框，即对话框是否返回mrOK。
  Tested in TestApp.
 --------------------------------}
function mnImageBox(BMP: TBitmap;                  const Title: string = ''): Boolean; overload;
function mnImageBox(PixeledImage: mnTPixeledImage; const Title: string = ''): Boolean; overload;

{--------------------------------
  显示一个对话框，上面有一个编辑框供用户输入。
  Title是对话框的标题，Prompt是对话框上提示用户输入的内容，Default是编辑框初始的缺省值。
  返回用户是否确认了对话框，即对话框是否返回mrOK。如果是，Value将存储编辑框的值。
  可以指定对用户输入的约束，和未满足约束时的错误信息。
  Tested in TestUnit and TestApp.
 --------------------------------}
function mnEditDialog(const Title, Prompt, Default: string; var Value: string;
  const EditConstraint: mnTStrConstraint = scAny; const ErrorMsg: string = ''): Boolean;

{--------------------------------
  显示一个对话框，上面有一个ComboBox供用户选择。
  Title是对话框的标题，Prompt是对话框上提示用户选择的内容，ComboItems是ComboBox的选项。
  返回用户是否确认了对话框，即对话框是否返回mrOK。如果是，SelectedIndex将存储ComboBox的被选项索引。
  可以通过预先对SelectedIndex赋值，来决定ComboBox缺省选中的项目。如果SelectedIndex越界，则缺省选中第0项。
  Tested in TestUnit and TestApp.
 --------------------------------}
function mnComboBoxDialog(const Title, Prompt: string; ComboItems: TStrings; var SelectedIndex: Integer): Boolean;

{--------------------------------
  显示一个对话框，上面有一个CheckListBox供用户勾选。
  Title是对话框的标题，Prompt是对话框上提示用户勾选的内容，CheckItems是CheckListBox的选项。
  返回用户是否确认了对话框，即对话框是否返回mrOK。如果是，CheckedResult将存储CheckListBox的每一项是否被勾选的结果。
  注意：可以通过预先对CheckedResult赋值，来决定CheckListBox中缺省勾选上的项目。
        这时，CheckedResult的个数，必须不小于CheckItems的个数。
        如果CheckedResult个数为0，表示所有项缺省都未勾选上。
  Tested in TestUnit and TestApp.
 --------------------------------}
function mnCheckListBoxDialog(const Title, Prompt: string; CheckItems: TStrings; CheckedResult: mnTBoolList): Boolean;

type
{--------------------------------
  标准OpenDialog和SaveDialog的预定义的各种文件类型的Filter，可以快捷设置。
 --------------------------------}
  mnTDialogFilter = (dfAll, dfText, dfExcel, dfWord, dfXML);

{--------------------------------
  快捷设置OpenDialog和SaveDialog的Filter。
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
