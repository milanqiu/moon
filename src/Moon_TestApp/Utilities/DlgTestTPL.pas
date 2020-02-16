unit DlgTestTPL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DlgTest, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCalc, cxCheckComboBox, cxListBox, cxMaskEdit, cxDropDownEdit,
  cxMCListBox, cxTextEdit, cxContainer, cxMemo, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ComCtrls;

type
  TTestTPLDialog = class(TTestDialog)
    pcTestTPL: TPageControl;
    tsMisc: TTabSheet;
    tsGrid: TTabSheet;
    cxmScroll: TcxMemo;
    cxteScroll: TcxTextEdit;
    btnScrollToEnd: TButton;
    cxlbSelected: TcxListBox;
    cxcbSelected: TcxComboBox;
    cxmclbSelected: TcxMCListBox;
    btnSelectedItem: TButton;
    btnSelectedAttachedInt: TButton;
    btnIndexOfAttachedInt: TButton;
    cxccbTags: TcxCheckComboBox;
    CheckedTags: TButton;
    btnCheckByTags: TButton;
    cxccbLoad: TcxCheckComboBox;
    btnLoad: TButton;
    DrawItemCustom: TcxComboBox;
    procedure DrawItemCustomPropertiesDrawItem(AControl: TcxCustomComboBox;
      ACanvas: TcxCanvas; AIndex: Integer; const ARect: TRect;
      AState: TOwnerDrawState);
    procedure btnLoadClick(Sender: TObject);
    procedure btnCheckByTagsClick(Sender: TObject);
    procedure CheckedTagsClick(Sender: TObject);
    procedure btnIndexOfAttachedIntClick(Sender: TObject);
    procedure btnSelectedAttachedIntClick(Sender: TObject);
    procedure btnSelectedItemClick(Sender: TObject);
    procedure btnScrollToEndClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestTPLDialog: TTestTPLDialog;

implementation

{$R *.dfm}

uses mnTPL, mnDialog, mnSystem, mnDebug, UTestConsts;

{ TTestTPLDialog }

procedure TTestTPLDialog.FormShow(Sender: TObject);
begin
  inherited;
  cxlbSelected.Items.Objects[0] := mnNewIntPointer(111);
  cxlbSelected.Items.Objects[1] := mnNewIntPointer(222);
  cxlbSelected.Items.Objects[2] := mnNewIntPointer(333);
  cxlbSelected.Items.Objects[3] := mnNewIntPointer(444);
  cxcbSelected.Properties.Items.Objects[0] := mnNewIntPointer(1111);
  cxcbSelected.Properties.Items.Objects[1] := mnNewIntPointer(2222);
  cxcbSelected.Properties.Items.Objects[2] := mnNewIntPointer(3333);
  cxcbSelected.Properties.Items.Objects[3] := mnNewIntPointer(4444);
  cxmclbSelected.Items.Objects[0] := mnNewIntPointer(11111);
  cxmclbSelected.Items.Objects[1] := mnNewIntPointer(22222);
  cxmclbSelected.Items.Objects[2] := mnNewIntPointer(33333);
  cxmclbSelected.Items.Objects[3] := mnNewIntPointer(44444);
end;

procedure TTestTPLDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  mnFreeObjects(cxlbSelected.Items);
  mnFreeObjects(cxcbSelected.Properties.Items);
  mnFreeObjects(cxmclbSelected.Items);
  inherited;
end;

procedure TTestTPLDialog.btnScrollToEndClick(Sender: TObject);
begin
  mnScrollToEnd(cxmScroll);
  mnScrollToEnd(cxteScroll);
end;

procedure TTestTPLDialog.btnSelectedItemClick(Sender: TObject);
begin
  mnInfoBox('ListBox: ' + mnSelectedItem(cxlbSelected) + mnNewLine +
            'ComboBox: ' + mnSelectedItem(cxcbSelected) + mnNewLine +
            'MCListBox: ' + mnSelectedItem(cxmclbSelected));
end;

procedure TTestTPLDialog.btnSelectedAttachedIntClick(Sender: TObject);
begin
  mnInfoBox('ListBox: ' + IntToStr(mnSelectedAttachedInt(cxlbSelected)) + mnNewLine +
            'ComboBox: ' + IntToStr(mnSelectedAttachedInt(cxcbSelected)) + mnNewLine +
            'MCListBox: ' + IntToStr(mnSelectedAttachedInt(cxmclbSelected)));
end;

procedure TTestTPLDialog.btnIndexOfAttachedIntClick(Sender: TObject);
begin
  mnAssert(mnIndexOfAttachedInt(cxlbSelected, 222) = 1);
  mnAssert(mnIndexOfAttachedInt(cxcbSelected, 3333) = 2);
  mnAssert(mnIndexOfAttachedInt(cxmclbSelected, 44444) = 3);
  mnAssert(mnIndexOfAttachedInt(cxlbSelected, 555) = -1);
  mnAssert(mnIndexOfAttachedInt(cxcbSelected, 5555) = -1);
  mnAssert(mnIndexOfAttachedInt(cxmclbSelected, 55555) = -1);
  mnInfoBox('Perfect!');
end;

procedure TTestTPLDialog.CheckedTagsClick(Sender: TObject);
begin
  mnInfoBox(mnCheckedTags(cxccbTags, ';'));
end;

procedure TTestTPLDialog.btnCheckByTagsClick(Sender: TObject);
var
  str: string;
begin
  if mnEditDialog('Tags', 'Please input Tags to be checked:', '222;444', str) then
    mnCheckByTags(cxccbTags, str, ';');
end;

procedure TTestTPLDialog.btnLoadClick(Sender: TObject);
begin
  mnLoadCheckComboBoxFromArray(cxccbLoad, [Str_0, Str_1, Str_2, Str_3, Str_4]);
end;

procedure TTestTPLDialog.DrawItemCustomPropertiesDrawItem(
  AControl: TcxCustomComboBox; ACanvas: TcxCanvas; AIndex: Integer;
  const ARect: TRect; AState: TOwnerDrawState);
begin
  if AIndex mod 2 = 0 then
    ACanvas.Font.Color := clRed
  else
    ACanvas.Font.Color := clBlue;

  mnDrawItemCustom(AControl, ACanvas, AIndex, ARect);
end;

end.
