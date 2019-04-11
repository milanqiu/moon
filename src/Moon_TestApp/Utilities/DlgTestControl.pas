unit DlgTestControl;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Menus, cxLookAndFeelPainters, cxButtons, DlgTest,
  cxControls, cxContainer, cxEdit, cxTextEdit, ComCtrls;

type
  TTestControlDialog = class(TTestDialog)
    gbPointAndControl: TGroupBox;
    pnControl: TPanel;
    btnPointInControl: TButton;
    btnGetControlTopLeftAndBottomRight: TButton;
    gbControlTextAndValidate: TGroupBox;
    edtEdit: TEdit;
    btnGetEditText: TButton;
    cxteEdit: TcxTextEdit;
    btnValidateNotEmpty: TButton;
    btnValidateIsInt: TButton;
    btnValidateIsFloat: TButton;
    btnValidateIsDT: TButton;
    btnValidateIsCurr: TButton;
    btnValidateNE0: TButton;
    btnValidateLT0: TButton;
    btnValidateLE0: TButton;
    btnValidateGT0: TButton;
    btnValidateGE0: TButton;
    gbEdit: TGroupBox;
    reRichEdit: TRichEdit;
    teEdit: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    pmEdit: TPopupMenu;
    aaa1: TMenuItem;
    xyz1: TMenuItem;
    btnGetSelText: TButton;
    btnValidateNotEmptyAbs: TButton;
    btnValidateAny: TButton;
    procedure btnGetSelTextClick(Sender: TObject);
    procedure reRichEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure teEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnValidateGE0Click(Sender: TObject);
    procedure btnValidateGT0Click(Sender: TObject);
    procedure btnValidateLE0Click(Sender: TObject);
    procedure btnValidateLT0Click(Sender: TObject);
    procedure btnValidateNE0Click(Sender: TObject);
    procedure btnValidateIsCurrClick(Sender: TObject);
    procedure btnValidateIsDTClick(Sender: TObject);
    procedure btnValidateIsFloatClick(Sender: TObject);
    procedure btnValidateIsIntClick(Sender: TObject);
    procedure btnValidateNotEmptyAbsClick(Sender: TObject);
    procedure btnValidateNotEmptyClick(Sender: TObject);
    procedure btnValidateAnyClick(Sender: TObject);
    procedure btnGetEditTextClick(Sender: TObject);
    procedure btnPointInControlClick(Sender: TObject);
    procedure btnGetControlTopLeftAndBottomRightClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestControlDialog: TTestControlDialog;

implementation

{$R *.dfm}

uses mnControl, mnDialog, mnSystem, mnWindows;

{ TTestControlDialog }

procedure TTestControlDialog.btnGetControlTopLeftAndBottomRightClick(
  Sender: TObject);
begin
  mnInfoBox(Format('TopLeft: %d, %d - BottomRight: %d, %d',
            [mnGetControlTopLeft(pnControl).X,
             mnGetControlTopLeft(pnControl).Y,
             mnGetControlBottomRight(pnControl).X,
             mnGetControlBottomRight(pnControl).Y]));
end;

procedure TTestControlDialog.btnPointInControlClick(Sender: TObject);
begin
  if mnPointInControl(mnMousePos, pnControl) then
    mnInfoBox('Mouse is in Control')
  else
    mnInfoBox('Mouse is not in Control');
end;

procedure TTestControlDialog.btnGetEditTextClick(Sender: TObject);
begin
  mnInfoBox('Text of edtEdit: ' + mnGetControlText(edtEdit) + mnNewLine +
            'Text of cxteEdit: ' + mnGetControlText(cxteEdit));
end;

procedure TTestControlDialog.btnValidateAnyClick(Sender: TObject);
begin
  mnValidateControlText(edtEdit, scAny);
  mnValidateControlText(cxteEdit, scAny);
end;

procedure TTestControlDialog.btnValidateNotEmptyClick(Sender: TObject);
begin
  mnValidateControlText(edtEdit, scNotEmpty);
  mnValidateControlText(cxteEdit, scNotEmpty);
end;

procedure TTestControlDialog.btnValidateNotEmptyAbsClick(Sender: TObject);
begin
  mnValidateControlText(edtEdit, scNotEmptyAbs);
  mnValidateControlText(cxteEdit, scNotEmptyAbs);
end;

procedure TTestControlDialog.btnValidateIsIntClick(Sender: TObject);
begin
  mnValidateControlText(edtEdit, scIsInt);
  mnValidateControlText(cxteEdit, scIsInt);
end;

procedure TTestControlDialog.btnValidateIsFloatClick(Sender: TObject);
begin
  mnValidateControlText(edtEdit, scIsFloat);
  mnValidateControlText(cxteEdit, scIsFloat);
end;

procedure TTestControlDialog.btnValidateIsDTClick(Sender: TObject);
begin
  mnValidateControlText(edtEdit, scIsDT);
  mnValidateControlText(cxteEdit, scIsDT);
end;

procedure TTestControlDialog.btnValidateIsCurrClick(Sender: TObject);
begin
  mnValidateControlText(edtEdit, scIsCurr);
  mnValidateControlText(cxteEdit, scIsCurr);
end;

procedure TTestControlDialog.btnValidateNE0Click(Sender: TObject);
begin
  mnValidateControlText(edtEdit, scNE0);
  mnValidateControlText(cxteEdit, scNE0);
end;

procedure TTestControlDialog.btnValidateLT0Click(Sender: TObject);
begin
  mnValidateControlText(edtEdit, scLT0);
  mnValidateControlText(cxteEdit, scLT0);
end;

procedure TTestControlDialog.btnValidateLE0Click(Sender: TObject);
begin
  mnValidateControlText(edtEdit, scLE0);
  mnValidateControlText(cxteEdit, scLE0);
end;

procedure TTestControlDialog.btnValidateGT0Click(Sender: TObject);
begin
  mnValidateControlText(edtEdit, scGT0);
  mnValidateControlText(cxteEdit, scGT0);
end;

procedure TTestControlDialog.btnValidateGE0Click(Sender: TObject);
begin
  mnValidateControlText(edtEdit, scGE0);
  mnValidateControlText(cxteEdit, scGE0);
end;

procedure TTestControlDialog.teEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SHIFT then
    mnInsertTextInEdit(teEdit, '000', '111');
  if Key = VK_APPS then
    mnPopupMenuInEdit(teEdit, pmEdit);
end;

procedure TTestControlDialog.reRichEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SHIFT then
    mnInsertTextInRichEdit(reRichEdit, '000', '111');
end;

procedure TTestControlDialog.btnGetSelTextClick(Sender: TObject);
var
  Prefix, Suffix: string;
begin
  mnInfoBox('SelText:' + mnGetSelText(teEdit, Prefix, Suffix) + mnNewLine +
            'Prefix:' + Prefix + mnNewLine +
            'Suffix:' + Suffix);

end;

end.
