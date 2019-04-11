unit DlgTestDialog;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Menus, cxLookAndFeelPainters, cxButtons, DlgTest, Dialogs;

type
  TTestDialogDialog = class(TTestDialog)
    btnInfoBox: TButton;
    btnErrorBox: TButton;
    btnWarningBox: TButton;
    btnWarningBoxEx: TButton;
    btnConfirmBoxEx: TButton;
    btnConfirmBox: TButton;
    btnMemoBox: TButton;
    btnShouldBeBox: TButton;
    btnEditDialog: TButton;
    cbEditConstraint: TComboBox;
    btnComboBoxDialog: TButton;
    cbDialogFilter: TComboBox;
    btnOpenDialog: TButton;
    btnSaveDialog: TButton;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    btnCheckListBoxDialog: TButton;
    procedure btnCheckListBoxDialogClick(Sender: TObject);
    procedure btnSaveDialogClick(Sender: TObject);
    procedure btnOpenDialogClick(Sender: TObject);
    procedure btnComboBoxDialogClick(Sender: TObject);
    procedure btnEditDialogClick(Sender: TObject);
    procedure btnMemoBoxClick(Sender: TObject);
    procedure btnShouldBeBoxClick(Sender: TObject);
    procedure btnConfirmBoxExClick(Sender: TObject);
    procedure btnConfirmBoxClick(Sender: TObject);
    procedure btnWarningBoxExClick(Sender: TObject);
    procedure btnWarningBoxClick(Sender: TObject);
    procedure btnErrorBoxClick(Sender: TObject);
    procedure btnInfoBoxClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestDialogDialog: TTestDialogDialog;

implementation

{$R *.dfm}

uses mnDialog, UTestConsts, mnSystem, mnDebug;

{ TTestDialogDialog }

procedure TTestDialogDialog.btnInfoBoxClick(Sender: TObject);
begin
  mnInfoBox('This is an info.');
  mnInfoBox(Int_0);
  mnInfoBox(Float_0);
  mnInfoBox(Bool_0);
  mnInfoBox(DT_0);
  mnInfoBoxDT(DT_0);
  mnInfoBoxVar(Var_0);
end;

procedure TTestDialogDialog.btnErrorBoxClick(Sender: TObject);
begin
  mnErrorBox('This is an error.', 'Errorrrrrrrrrrrr!');
end;

procedure TTestDialogDialog.btnWarningBoxClick(Sender: TObject);
begin
  mnWarningBox('This is a warning.');
end;

procedure TTestDialogDialog.btnWarningBoxExClick(Sender: TObject);
begin
  if mnWarningBoxEx('Warning need to be responded.', 'Warnnnnnnnnnning') then
    mnInfoBox('You choose yes')
  else
    mnInfoBox('You choose no');
end;

procedure TTestDialogDialog.btnConfirmBoxClick(Sender: TObject);
begin
  if mnConfirmBox('Question need to be confirmed by yes or no.') then
    mnInfoBox('You choose yes')
  else
    mnInfoBox('You choose no');
end;

procedure TTestDialogDialog.btnConfirmBoxExClick(Sender: TObject);
begin
  case mnConfirmBoxEx('Question need to be confirmed by yes, no or cancel.') of
    IDYES:    mnInfoBox('You choose yes');
    IDNO:     mnInfoBox('You choose no');
    IDCANCEL: mnInfoBox('You choose cancel');
  end;
end;

procedure TTestDialogDialog.btnShouldBeBoxClick(Sender: TObject);
begin
  mnShouldBeBox(Str_0, Str_0);
  mnShouldBeBox(Str_0, Str_1);
  mnShouldBeBox(Int_0, Int_0);
  mnShouldBeBox(Int_0, Int_1);
  mnShouldBeBox(Float_0, Float_0);
  mnShouldBeBox(Float_0, Float_1);
  mnShouldBeBox(Bool_0, Bool_0);
  mnShouldBeBox(Bool_0, Bool_1);
  mnShouldBeBox(DT_0, DT_0);
  mnShouldBeBox(DT_0, DT_1);
  mnShouldBeBoxDT(DT_0, DT_0);
  mnShouldBeBoxDT(DT_0, DT_1);
end;

procedure TTestDialogDialog.btnMemoBoxClick(Sender: TObject);
var
  strs: mnTStrList;
begin
  strs := mnTStrList.Create;
  try
    strs.LoadFromFile(mnAppPathSub('dunit.ini'));
    mnMemoBox(strs.Text);
  finally
    strs.Free;
  end;
end;

procedure TTestDialogDialog.btnEditDialogClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('Input string', 'Please input a string:', 'default sring', Value,
                  mnTStrConstraint(cbEditConstraint.ItemIndex), 'your input is illegal') then
  begin
    mnInfoBox('You choose ok');
    mnInfoBox('Your input is ' + Value);
  end
  else
    mnInfoBox('You choose cancel');
end;

procedure TTestDialogDialog.btnComboBoxDialogClick(Sender: TObject);
var
  SelectedIndex: Integer;
  ComboItems: mnTStrList;
begin
  ComboItems := mnTStrList.Create;
  try
    ComboItems.Append(Str_0);
    ComboItems.Append(Str_1);
    ComboItems.Append(Str_2);
    ComboItems.Append(Str_3);
    ComboItems.Append(Str_4);

    SelectedIndex := 3;
    if mnComboBoxDialog('Choose string', 'Please choose a string:', ComboItems, SelectedIndex) then
    begin
      mnInfoBox('You choose ok');
      mnInfoBox('You choose ' + ComboItems[SelectedIndex]);
    end
    else
      mnInfoBox('You choose cancel');
  finally
    ComboItems.Free;
  end;
end;

procedure TTestDialogDialog.btnCheckListBoxDialogClick(Sender: TObject);
var
  CheckedResult: mnTBoolList;
  CheckItems: mnTStrList;
  i: Integer;
begin
  CheckedResult := mnTBoolList.Create;
  CheckItems := mnTStrList.Create;
  try
    CheckItems.Append(Str_0);
    CheckItems.Append(Str_1);
    CheckItems.Append(Str_2);
    CheckItems.Append(Str_3);
    CheckItems.Append(Str_4);

    CheckedResult.Add(True);
    CheckedResult.Add(False);
    CheckedResult.Add(True);
    CheckedResult.Add(False);
    CheckedResult.Add(False);

    if mnCheckListBoxDialog('Check items', 'Please check some items:', CheckItems, CheckedResult) then
    begin
      mnInfoBox('You choose ok');
      mnAssert(CheckedResult.Count = 5);
      for i := 0 to CheckedResult.Count-1 do
        if CheckedResult[i] then
          mnInfoBox('You check ' + CheckItems[i]);
    end
    else
      mnInfoBox('You choose cancel');
  finally
    CheckItems.Free;
    CheckedResult.Free;
  end;
end;

procedure TTestDialogDialog.btnOpenDialogClick(Sender: TObject);
begin
  mnSetOpenDialogFilter(OpenDialog, mnTDialogFilter(cbDialogFilter.ItemIndex));
  OpenDialog.Execute;
end;

procedure TTestDialogDialog.btnSaveDialogClick(Sender: TObject);
begin
  mnSetSaveDialogFilter(SaveDialog, mnTDialogFilter(cbDialogFilter.ItemIndex));
  SaveDialog.Execute;
end;

end.
