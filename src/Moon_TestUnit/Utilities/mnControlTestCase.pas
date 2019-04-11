unit mnControlTestCase;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit
  being tested.

}

interface

uses
  TestFramework;

type
  TmnControlTestCase = class(TTestCase)
  strict private
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure testGetControlText;
    procedure testValidateControlText;
    procedure testValidateControlSelected;
  end;

implementation

uses mnControl, UTestConsts, StdCtrls, cxTextEdit, cxMaskEdit, cxCalc, cxCalendar, mnDebug, mnSystem,
  SysUtils, mnResStrsU, Forms, cxListBox, cxDropDownEdit, cxMCListBox, Windows, Graphics, mnFile, Types,
  mnDialog;

{ TmnControlTestCase }

procedure TmnControlTestCase.SetUp;
begin
end;

procedure TmnControlTestCase.TearDown;
begin
end;

procedure TmnControlTestCase.testGetControlText;
var
  Edit: TEdit;
  Memo: TMemo;
  ComboBox: TComboBox;
  TextEdit: TcxTextEdit;
  MaskEdit: TcxMaskEdit;
  CalcEdit: TcxCalcEdit;
  DateEdit: TcxDateEdit;
begin
  Edit := TEdit.Create(nil);
  try
    Edit.Text := Str_0;
    CheckEquals(mnGetControlText(Edit), Str_0);
  finally
    Edit.Free;
  end;

  Memo := TMemo.Create(nil);
  try
    Memo.Text := Str_0;
    CheckEquals(mnGetControlText(Memo), Str_0);
  finally
    Memo.Free;
  end;

  ComboBox := TComboBox.Create(nil);
  try
    ComboBox.Text := Str_0;
    CheckEquals(mnGetControlText(ComboBox), Str_0);
  finally
    ComboBox.Free;
  end;

  TextEdit := TcxTextEdit.Create(nil);
  try
    TextEdit.Text := Str_0;
    CheckEquals(mnGetControlText(TextEdit), Str_0);
  finally
    TextEdit.Free;
  end;

  MaskEdit := TcxMaskEdit.Create(nil);
  try
    MaskEdit.Text := Str_0;
    CheckEquals(mnGetControlText(MaskEdit), Str_0);
  finally
    MaskEdit.Free;
  end;

  CalcEdit := TcxCalcEdit.Create(nil);
  try
    CalcEdit.Text := Str_0;
    CheckEquals(mnGetControlText(CalcEdit), Str_0);
  finally
    CalcEdit.Free;
  end;

  DateEdit := TcxDateEdit.Create(nil);
  try
    DateEdit.Text := Str_0;
    CheckEquals(mnGetControlText(DateEdit), Str_0);
  finally
    DateEdit.Free;
  end;
end;

procedure TmnControlTestCase.testValidateControlText;
var
  Form: TForm;
  Edit: TEdit;
begin
  Form := TForm.Create(nil);
  Edit := TEdit.Create(Form);
  Edit.Parent := Form;
  Edit.Name := 'Edit';
  try
    Form.Show;

    // scAny
    Edit.Text := Str_0;
    mnValidateControlText(Edit, scAny);
    Edit.Text := '';
    mnValidateControlText(Edit, scAny);

    // scNotEmpty
    Edit.Text := Str_0;
    mnValidateControlText(Edit, scNotEmpty);
    Edit.Text := '';
    try
      mnValidateControlText(Edit, scNotEmpty);
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgNotEmpty, [Edit.Name]));
    end;
    try
      mnValidateControlText(Edit, scNotEmpty, 'the content');
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgNotEmpty, ['the content']));
    end;
    try
      mnValidateControlText(Edit, scNotEmpty, '', 'an error');
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, 'an error');
    end;

    // scNotEmptyAbs
    Edit.Text := Str_0;
    mnValidateControlText(Edit, scNotEmptyAbs);
    Edit.Text := '   ';
    try
      mnValidateControlText(Edit, scNotEmptyAbs);
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgNotEmptyAbs, [Edit.Name]));
    end;
    try
      mnValidateControlText(Edit, scNotEmptyAbs, 'the content');
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgNotEmptyAbs, ['the content']));
    end;
    try
      mnValidateControlText(Edit, scNotEmptyAbs, '', 'an error');
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, 'an error');
    end;

    // scIsInt
    Edit.Text := Str_Of_Int_0;
    mnValidateControlText(Edit, scIsInt);
    Edit.Text := Str_0;
    try
      mnValidateControlText(Edit, scIsInt);
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgIsInt, [Edit.Name]));
    end;
    try
      mnValidateControlText(Edit, scIsInt, 'the content');
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgIsInt, ['the content']));
    end;
    try
      mnValidateControlText(Edit, scIsInt, '', 'an error');
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, 'an error');
    end;

    // scIsFloat
    Edit.Text := Str_Of_Float_0;
    mnValidateControlText(Edit, scIsFloat);
    Edit.Text := Str_0;
    try
      mnValidateControlText(Edit, scIsFloat);
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgIsFloat, [Edit.Name]));
    end;

    // scIsDT
    Edit.Text := Str_Of_DT_0;
    mnValidateControlText(Edit, scIsDT);
    Edit.Text := Str_0;
    try
      mnValidateControlText(Edit, scIsDT);
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgIsDT, [Edit.Name]));
    end;

    // scIsCurr
    Edit.Text := Str_Of_Curr_0;
    mnValidateControlText(Edit, scIsCurr);
    Edit.Text := Str_0;
    try
      mnValidateControlText(Edit, scIsCurr);
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgIsCurr, [Edit.Name]));
    end;

    // scNE0
    Edit.Text := '1';
    mnValidateControlText(Edit, scNE0);
    Edit.Text := '0';
    try
      mnValidateControlText(Edit, scNE0);
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgNE0, [Edit.Name]));
    end;

    // scLT0
    Edit.Text := '-1';
    mnValidateControlText(Edit, scLT0);
    Edit.Text := '0';
    try
      mnValidateControlText(Edit, scLT0);
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgLT0, [Edit.Name]));
    end;

    // scLE0
    Edit.Text := '-1';
    mnValidateControlText(Edit, scLE0);
    Edit.Text := '1';
    try
      mnValidateControlText(Edit, scLE0);
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgLE0, [Edit.Name]));
    end;

    // scGT0
    Edit.Text := '1';
    mnValidateControlText(Edit, scGT0);
    Edit.Text := '0';
    try
      mnValidateControlText(Edit, scGT0);
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgGT0, [Edit.Name]));
    end;

    // scGE0
    Edit.Text := '1';
    mnValidateControlText(Edit, scGE0);
    Edit.Text := '-1';
    try
      mnValidateControlText(Edit, scGE0);
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgGE0, [Edit.Name]));
    end;
  finally
    Form.Close;
    Form.Free;
  end;
end;

procedure TmnControlTestCase.testValidateControlSelected;
var
  Form: TForm;
  ListBox: TcxListBox;
  ComboBox: TcxComboBox;
  MCListBox: TcxMCListBox;
begin
  Form := TForm.Create(nil);
  ListBox := TcxListBox.Create(Form);
  ListBox.Parent := Form;
  ListBox.Name := 'ListBox';
  ListBox.Items.Append('0');
  ComboBox := TcxComboBox.Create(Form);
  ComboBox.Parent := Form;
  ComboBox.Name := 'ComboBox';
  ComboBox.Properties.Items.Append('0');
  MCListBox := TcxMCListBox.Create(Form);
  MCListBox.Parent := Form;
  MCListBox.Name := 'MCListBox';
  MCListBox.Items.Append('0');
  try
    Form.Show;

    // overload form 1: TcxListBox
    ListBox.ItemIndex := 0;
    mnValidateControlSelected(ListBox);
    ListBox.ItemIndex := -1;
    try
      mnValidateControlSelected(ListBox);
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgSelected, [ListBox.Name]));
    end;
    try
      mnValidateControlSelected(ListBox, 'the content');
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgSelected, ['the content']));
    end;
    try
      mnValidateControlSelected(ListBox, '', 'an error');
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, 'an error');
    end;

    // overload form 2: TcxComboBox
    ComboBox.ItemIndex := 0;
    mnValidateControlSelected(ComboBox);
    ComboBox.ItemIndex := -1;
    try
      mnValidateControlSelected(ComboBox, 'the content');
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgSelected, ['the content']));
    end;
    try
      mnValidateControlSelected(ComboBox);
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgSelected, [ComboBox.Name]));
    end;
    try
      mnValidateControlSelected(ComboBox, '', 'an error');
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, 'an error');
    end;

    // overload form 3: TcxMCListBox
    MCListBox.ItemIndex := 0;
    mnValidateControlSelected(MCListBox);
    MCListBox.ItemIndex := -1;
    try
      mnValidateControlSelected(MCListBox, 'the content');
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgSelected, ['the content']));
    end;
    try
      mnValidateControlSelected(MCListBox);
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, Format(SErrorMsgSelected, [MCListBox.Name]));
    end;
    try
      mnValidateControlSelected(MCListBox, '', 'an error');
      mnNeverGoesHere;
    except
      on E: Exception do
        CheckEquals(E.Message, 'an error');
    end;

    // overload form 4: TcxLookupComboBox is ignored
  finally
    Form.Close;
    Form.Free;
  end;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TmnControlTestCase.Suite);
end.


