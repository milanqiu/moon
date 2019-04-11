unit mnControl;

interface

uses Controls, Types, mnSystem, cxListBox, cxDropDownEdit, cxMCListBox,
  cxDBLookupComboBox, cxTextEdit, ComCtrls, Menus;

{--------------------------------
  得到一个控件的左上角和右下角的点的坐标。使用屏幕坐标系。
  Tested in TestApp.
 --------------------------------}
function mnGetControlTopLeft(AControl: TControl): TPoint;
function mnGetControlBottomRight(AControl: TControl): TPoint;

{--------------------------------
  判断一个点是否在控件范围内。点的坐标使用屏幕坐标系。
  Tested in TestApp.
 --------------------------------}
function mnPointInControl(const APoint: TPoint; AControl: TControl): Boolean;

{--------------------------------
  得到一个控件的Text。
  VCL的TControl类本身有Text属性，但是是protected的。
  Tested in TestUnit and TestApp.
 --------------------------------}
function mnGetControlText(AControl: TControl): TCaption;

{--------------------------------
  验证一个Windows控件的Text是否满足指定约束。如果不满足，将输入焦点置于该控件，并抛出异常。
  异常消息的规则如下：如果ErrorMsg有赋值，则为ErrorMsg；
  否则，如果ControlMeaning有赋值，则使用ControlMeaning组合成异常消息；
  如果这两个参数都没有赋值，则使用该控件的Name组合成缺省消息，作为异常消息。
  Tested in TestUnit and TestApp.
 --------------------------------}
procedure mnValidateControlText(AWinControl: TWinControl; const TextConstraint: mnTStrConstraint;
  const ControlMeaning: string = ''; const ErrorMsg: string = '');

{--------------------------------
  验证一个cxListBox、cxComboBox、cxMCListBox或cxLookupComboBox是否已被选择。
  如果没有，将输入焦点置于该控件，并抛出异常。
  异常消息的规则如下：如果ErrorMsg有赋值，则为ErrorMsg；
  否则，如果ControlMeaning有赋值，则使用ControlMeaning组合成异常消息；
  如果这两个参数都没有赋值，则使用该控件的Name组合成缺省消息，作为异常消息。
  Tested in TestUnit.
 --------------------------------}
procedure mnValidateControlSelected(ListBox: TcxListBox;               const ControlMeaning: string = ''; const ErrorMsg: string = ''); overload;
procedure mnValidateControlSelected(ComboBox: TcxComboBox;             const ControlMeaning: string = ''; const ErrorMsg: string = ''); overload;
procedure mnValidateControlSelected(MCListBox: TcxMCListBox;           const ControlMeaning: string = ''; const ErrorMsg: string = ''); overload;
procedure mnValidateControlSelected(LookupComboBox: TcxLookupComboBox; const ControlMeaning: string = ''; const ErrorMsg: string = ''); overload;

{--------------------------------
  在一个Edit或RichEdit的当前光标处插入文本。
  连续插入TextBeforeCursor和TextAfterCursor，将光标移到TextBeforeCursor的后面，亦即TextAfterCursor的前面。
  Tested in TestApp.
 --------------------------------}
procedure mnInsertTextInEdit(Edit: TcxCustomTextEdit; const TextBeforeCursor, TextAfterCursor: string);
procedure mnInsertTextInRichEdit(RichEdit: TRichEdit; const TextBeforeCursor, TextAfterCursor: string);

{--------------------------------
  在一个Edit的当前光标处弹出菜单。
  Tested in TestApp.
 --------------------------------}
procedure mnPopupMenuInEdit(Edit: TcxCustomTextEdit; Menu: TPopupMenu);

{--------------------------------
  得到一个Edit的当前被选中文本，并将其之前的文本存入Prefix，将其之后的文本存入Suffix。
  Tested in TestApp.
 --------------------------------}
function mnGetSelText(Edit: TcxCustomTextEdit; var Prefix, Suffix: string): string;

implementation

uses mnResStrsU, Classes, mnDebug, Variants, mnString, StrUtils;

function mnGetControlTopLeft(AControl: TControl): TPoint;
begin
  Result := AControl.ClientToScreen(AControl.ClientRect.TopLeft);
end;

function mnGetControlBottomRight(AControl: TControl): TPoint;
begin
  Result := AControl.ClientToScreen(AControl.ClientRect.BottomRight);
end;

function mnPointInControl(const APoint: TPoint; AControl: TControl): Boolean;
begin
  Result := PtInRect(Rect(mnGetControlTopLeft(AControl), mnGetControlBottomRight(AControl)), APoint);
end;

function mnGetControlText(AControl: TControl): TCaption;
var
  Len: Integer;
begin
  Len := AControl.GetTextLen;
  if Len > 0 then
  begin
    SetString(Result, nil, Len+1);
    AControl.GetTextBuf(Pointer(Result), Len+1);
    SetLength(Result, Len);
  end
  else Result := '';
end;

procedure mnValidateControlText(AWinControl: TWinControl; const TextConstraint: mnTStrConstraint;
  const ControlMeaning: string = ''; const ErrorMsg: string = '');
var
  ErrorParam: string;
begin
  if not mnCheckStrConstraint(mnGetControlText(AWinControl), TextConstraint) then
  begin
    AWinControl.SetFocus;
    if ErrorMsg = '' then
    begin
      ErrorParam := mnChooseStr(ControlMeaning = '', AWinControl.Name, ControlMeaning);
      case TextConstraint of
        scNotEmpty:    mnCreateError(SErrorMsgNotEmpty,    [ErrorParam]);
        scNotEmptyAbs: mnCreateError(SErrorMsgNotEmptyAbs, [ErrorParam]);
        scIsInt:       mnCreateError(SErrorMsgIsInt,       [ErrorParam]);
        scIsFloat:     mnCreateError(SErrorMsgIsFloat,     [ErrorParam]);
        scIsDT:        mnCreateError(SErrorMsgIsDT,        [ErrorParam]);
        scIsCurr:      mnCreateError(SErrorMsgIsCurr,      [ErrorParam]);
        scNE0:         mnCreateError(SErrorMsgNE0,         [ErrorParam]);
        scLT0:         mnCreateError(SErrorMsgLT0,         [ErrorParam]);
        scLE0:         mnCreateError(SErrorMsgLE0,         [ErrorParam]);
        scGT0:         mnCreateError(SErrorMsgGT0,         [ErrorParam]);
        scGE0:         mnCreateError(SErrorMsgGE0,         [ErrorParam]);
      else
        mnNeverGoesHere;
      end;
    end
    else mnCreateError(ErrorMsg);
  end;
end;

procedure mnValidateControlSelected(ListBox: TcxListBox;               const ControlMeaning: string = ''; const ErrorMsg: string = ''); overload;
begin
  if ListBox.ItemIndex = -1 then
  begin
    ListBox.SetFocus;
    if ErrorMsg = '' then
      mnCreateError(SErrorMsgSelected, [mnChooseStr(ControlMeaning = '', ListBox.Name, ControlMeaning)])
    else
      mnCreateError(ErrorMsg);
  end;
end;

procedure mnValidateControlSelected(ComboBox: TcxComboBox;             const ControlMeaning: string = ''; const ErrorMsg: string = ''); overload;
begin
  if ComboBox.ItemIndex = -1 then
  begin
    ComboBox.SetFocus;
    if ErrorMsg = '' then
      mnCreateError(SErrorMsgSelected, [mnChooseStr(ControlMeaning = '', ComboBox.Name, ControlMeaning)])
    else
      mnCreateError(ErrorMsg);
  end;
end;

procedure mnValidateControlSelected(MCListBox: TcxMCListBox;           const ControlMeaning: string = ''; const ErrorMsg: string = ''); overload;
begin
  if MCListBox.ItemIndex = -1 then
  begin
    MCListBox.SetFocus;
    if ErrorMsg = '' then
      mnCreateError(SErrorMsgSelected, [mnChooseStr(ControlMeaning = '', MCListBox.Name, ControlMeaning)])
    else
      mnCreateError(ErrorMsg);
  end;
end;

procedure mnValidateControlSelected(LookupComboBox: TcxLookupComboBox; const ControlMeaning: string = ''; const ErrorMsg: string = ''); overload;
begin
  if LookupComboBox.EditValue = Null then
  begin
    LookupComboBox.SetFocus;
    if ErrorMsg = '' then
      mnCreateError(SErrorMsgSelected, [mnChooseStr(ControlMeaning = '', LookupComboBox.Name, ControlMeaning)])
    else
      mnCreateError(ErrorMsg);
  end;
end;

procedure mnInsertTextInEdit(Edit: TcxCustomTextEdit; const TextBeforeCursor, TextAfterCursor: string);
var
  OldSelStart: Integer;
begin
  OldSelStart := mnSettleByte(Edit.Text, Edit.CursorPos);
  Edit.Text := Copy(Edit.Text, 1, OldSelStart) +
               TextBeforeCursor + TextAfterCursor +
               Copy(Edit.Text, OldSelStart+1);
  Edit.SelStart := OldSelStart + Length(TextBeforeCursor);
  Edit.SelLength := 0;
end;

procedure mnInsertTextInRichEdit(RichEdit: TRichEdit; const TextBeforeCursor, TextAfterCursor: string);
var
  OldSelStart: Integer;
begin
  OldSelStart := RichEdit.SelStart;
  RichEdit.SelText := TextBeforeCursor + TextAfterCursor;
  RichEdit.SelStart := OldSelStart + Length(TextBeforeCursor);
  RichEdit.SelLength := 0;
end;

procedure mnPopupMenuInEdit(Edit: TcxCustomTextEdit; Menu: TPopupMenu);
var
  TextBeforeCursor: string;
begin
  TextBeforeCursor := Copy(Edit.Text, 1, mnSettleByte(Edit.Text, Edit.CursorPos));
  Menu.Popup(Edit.ClientToScreen(Edit.ClientRect.TopLeft).X + Edit.Canvas.TextWidth(TextBeforeCursor),
             Edit.ClientToScreen(Edit.ClientRect.TopLeft).Y + Edit.Canvas.TextHeight(TextBeforeCursor));
end;

function mnGetSelText(Edit: TcxCustomTextEdit; var Prefix, Suffix: string): string;
begin
  Result := Edit.SelText;
  Prefix := LeftBStr(Edit.Text, Edit.SelStart);
  Suffix := RightBStr(Edit.Text, Length(Edit.Text) - Edit.SelLength - Edit.SelStart);
end;

end.
