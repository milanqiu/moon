unit mnTPL;

interface

uses cxTextEdit, cxListBox, cxDropDownEdit, cxMCListBox, mnSystem, cxCheckComboBox,
  cxGraphics, Types, superobject;

{--------------------------------
  将一个Json串或Json数组对象转换为字符串数组。
  Tested in TestUnit.
 --------------------------------}
function mnParseJsonToStrArray(const JsonStr: string): mnTStrArray; overload;
function mnParseJsonToStrArray(const JsonArray: TSuperArray): mnTStrArray; overload;

{--------------------------------
  获取一个Json串或Json对象的所有属性名。
  Tested in TestUnit.
 --------------------------------}
function mnParseJsonObjectNames(const JsonStr: string): mnTStrArray; overload;
function mnParseJsonObjectNames(const JsonObject: TSuperTableString): mnTStrArray; overload;

{--------------------------------
  获取一个Json串或Json对象的指定属性的值。
  Tested in TestUnit.
 --------------------------------}
function mnParseJsonObjectValue(const JsonStr: string; const Name: string): string; overload;
function mnParseJsonObjectValue(const JsonObject: TSuperTableString; const Name: string): string; overload;

{--------------------------------
  滚动一个TextEdit到末尾。
  Tested in TestApp.
 --------------------------------}
procedure mnScrollToEnd(TextEdit: TcxCustomTextEdit);

{--------------------------------
  得到一个列表框、下拉选择框或多列列表框的当前选中项的文本。
  Tested in TestApp.
 --------------------------------}
function mnSelectedItem(ListBox: TcxListBox): string; overload;
function mnSelectedItem(ComboBox: TcxComboBox): string; overload;
function mnSelectedItem(MCListBox: TcxMCListBox): string; overload;

{--------------------------------
  得到一个列表框、下拉选择框或多列列表框的当前选中项的附加的整数。
  执行该函数时，应保证传入框的附加对象是一个整数指针。
  Tested in TestApp.
 --------------------------------}
function mnSelectedAttachedInt(ListBox: TcxListBox): Integer; overload;
function mnSelectedAttachedInt(ComboBox: TcxComboBox): Integer; overload;
function mnSelectedAttachedInt(MCListBox: TcxMCListBox): Integer; overload;

{--------------------------------
  在一个列表框、下拉选择框或多列列表框中，查找附加的整数等于指定值的项，返回项的索引。
  如果找不到，返回-1。
  执行该函数时，应保证传入框的附加对象是一个整数指针。
  Tested in TestApp.
 --------------------------------}
function mnIndexOfAttachedInt(ListBox: TcxListBox; const Value: Integer): Integer; overload;
function mnIndexOfAttachedInt(ComboBox: TcxComboBox; const Value: Integer): Integer; overload;
function mnIndexOfAttachedInt(MCListBox: TcxMCListBox; const Value: Integer): Integer; overload;

{--------------------------------
  将一个多选下拉选择框中所有选中项的Tag，存储到指定TIntList里，或联接成字符串。
  OutTags中原有数据不会被清空。
  Tested in TestApp.
 --------------------------------}
procedure mnCheckedTags(CheckComboBox: TcxCheckComboBox; OutTags: mnTIntList); overload;
function mnCheckedTags(CheckComboBox: TcxCheckComboBox; const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;

{--------------------------------
  在一个多选下拉选择框中，选中所有Tag出现在指定TIntList里或指定联接字符串里的项。
  Tested in TestApp.
 --------------------------------}
procedure mnCheckByTags(CheckComboBox: TcxCheckComboBox; Tags: mnTIntList); overload;
procedure mnCheckByTags(CheckComboBox: TcxCheckComboBox; const TagsStr: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False); overload;

{--------------------------------
  从一个字符串数组装载所有元素到多选下拉选择框中。
  Tested in TestApp.
 --------------------------------}
procedure mnLoadCheckComboBoxFromArray(CheckComboBox: TcxCheckComboBox; const Arr: array of string);

{--------------------------------
  自定义绘制一个cxCustomComboBox的指定项，使用指定cxCanvas，在指定的Rect中。
  绘制方法和标准绘制相同，自定义的好处是可以更加灵活地设置字体、颜色等。
  Tested in TestApp.
 --------------------------------}
procedure mnDrawItemCustom(ComboBox: TcxCustomComboBox; Canvas: TcxCanvas; const Index: Integer; const Rect: TRect);

implementation

uses cxCheckBox, Windows;

function mnParseJsonToStrArray(const JsonStr: string): mnTStrArray; overload;
var
  Obj: ISuperObject;
begin
  Obj := SO(JsonStr);
  Result := mnParseJsonToStrArray(Obj.AsArray);
end;

function mnParseJsonToStrArray(const JsonArray: TSuperArray): mnTStrArray; overload;
var
  i: Integer;
begin
  SetLength(Result, JsonArray.Length);
  for i := 0 to JsonArray.Length-1 do
  begin
    Result[i] := JsonArray[i].AsString;
  end;
end;

function mnParseJsonObjectNames(const JsonStr: string): mnTStrArray; overload;
var
  Obj: ISuperObject;
begin
  Obj := SO(JsonStr);
  Result := mnParseJsonObjectNames(Obj.AsObject);
end;

function mnParseJsonObjectNames(const JsonObject: TSuperTableString): mnTStrArray; overload;
begin
  Result := mnParseJsonToStrArray(JsonObject.GetNames.AsArray);
end;

function mnParseJsonObjectValue(const JsonStr: string; const Name: string): string; overload;
var
  Obj: ISuperObject;
begin
  Obj := SO(JsonStr);
  Result := mnParseJsonObjectValue(Obj.AsObject, Name);
end;

function mnParseJsonObjectValue(const JsonObject: TSuperTableString; const Name: string): string; overload;
begin
  Result := JsonObject.S[Name];
end;

procedure mnScrollToEnd(TextEdit: TcxCustomTextEdit);
begin
  TextEdit.SetSelection(Length(TextEdit.Text), 0);
end;

function mnSelectedItem(ListBox: TcxListBox): string; overload;
begin
  Result := ListBox.Items[ListBox.ItemIndex];
end;

function mnSelectedItem(ComboBox: TcxComboBox): string; overload;
begin
  Result := ComboBox.Properties.Items[ComboBox.ItemIndex];
end;

function mnSelectedItem(MCListBox: TcxMCListBox): string; overload;
begin
  Result := MCListBox.Items[MCListBox.ItemIndex];
end;

function mnSelectedAttachedInt(ListBox: TcxListBox): Integer; overload;
begin
  Result := mnReadIntPointer(ListBox.Items.Objects[ListBox.ItemIndex]);
end;

function mnSelectedAttachedInt(ComboBox: TcxComboBox): Integer; overload;
begin
  Result := mnReadIntPointer(ComboBox.Properties.Items.Objects[ComboBox.ItemIndex]);
end;

function mnSelectedAttachedInt(MCListBox: TcxMCListBox): Integer; overload;
begin
  Result := mnReadIntPointer(MCListBox.Items.Objects[MCListBox.ItemIndex]);
end;

function mnIndexOfAttachedInt(ListBox: TcxListBox; const Value: Integer): Integer; overload;
begin
  for Result := 0 to ListBox.Items.Count-1 do
    if mnReadIntPointer(ListBox.Items.Objects[Result]) = Value then
      Exit;
  Result := -1;
end;

function mnIndexOfAttachedInt(ComboBox: TcxComboBox; const Value: Integer): Integer; overload;
begin
  for Result := 0 to ComboBox.Properties.Items.Count-1 do
    if mnReadIntPointer(ComboBox.Properties.Items.Objects[Result]) = Value then
      Exit;
  Result := -1;
end;

function mnIndexOfAttachedInt(MCListBox: TcxMCListBox; const Value: Integer): Integer; overload;
begin
  for Result := 0 to MCListBox.Items.Count-1 do
    if mnReadIntPointer(MCListBox.Items.Objects[Result]) = Value then
      Exit;
  Result := -1;
end;

procedure mnCheckedTags(CheckComboBox: TcxCheckComboBox; OutTags: mnTIntList); overload;
var
  i: Integer;
begin
  for i := 0 to CheckComboBox.Properties.Items.Count-1 do
    if CheckComboBox.States[i] = cbsChecked then
      OutTags.Add(CheckComboBox.Properties.Items[i].Tag);
end;

function mnCheckedTags(CheckComboBox: TcxCheckComboBox; const Connector: string = mnStdConnector1; const HasBorder: Boolean = False): string; overload;
var
  Tags: mnTIntList;
begin
  Tags := mnTIntList.Create;
  try
    mnCheckedTags(CheckComboBox, Tags);
    Result := Tags.Combine(Connector, HasBorder);
  finally
    Tags.Free;
  end;
end;

procedure mnCheckByTags(CheckComboBox: TcxCheckComboBox; Tags: mnTIntList); overload;
var
  Tag: Integer;
  i: Integer;
begin
  CheckComboBox.Clear;
  for Tag in Tags do
    for i := 0 to CheckComboBox.Properties.Items.Count-1 do
      if CheckComboBox.Properties.Items[i].Tag = Tag then
      begin
        CheckComboBox.States[i] := cbsChecked;
        Break;
      end;
end;

procedure mnCheckByTags(CheckComboBox: TcxCheckComboBox; const TagsStr: string; const Separator: string = mnStdSeparator1; const HasBorder: Boolean = False); overload;
var
  Tags: mnTIntList;
begin
  Tags := mnTIntList.Create;
  try
    Tags.Split(TagsStr, Separator, HasBorder);
    mnCheckByTags(CheckComboBox, Tags);
  finally
    Tags.Free;
  end;
end;

procedure mnLoadCheckComboBoxFromArray(CheckComboBox: TcxCheckComboBox; const Arr: array of string);
var
  Element: string;
begin
  for Element in Arr do
    CheckComboBox.Properties.Items.Add.Description := Element;
end;

procedure mnDrawItemCustom(ComboBox: TcxCustomComboBox; Canvas: TcxCanvas; const Index: Integer; const Rect: TRect);
var
  VarRect: TRect;
  Flags: Longint;
  Text: string;
begin
  VarRect := Rect;
  Canvas.FillRect(VarRect);
  if (Index >= 0) and (Index < ComboBox.Properties.Items.Count) then
  begin
    Flags := ComboBox.DrawTextBiDiModeFlags(DT_SINGLELINE or DT_VCENTER or DT_NOPREFIX);
    if not ComboBox.UseRightToLeftAlignment then
      Inc(VarRect.Left, 2)
    else
      Dec(VarRect.Right, 2);
    Text := ComboBox.Properties.Items[Index];
    DrawText(Canvas.Handle, PChar(Text), Length(Text), VarRect, Flags);
  end;
end;

end.
