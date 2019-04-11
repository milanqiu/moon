unit DlgTestTPL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DlgTest, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCalc, cxCheckComboBox, cxListBox, cxMaskEdit, cxDropDownEdit,
  cxMCListBox, cxTextEdit, cxContainer, cxMemo, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid;

type
  TTestTPLDialog = class(TTestDialog)
    cxgTeacher: TcxGrid;
    cxgdbtvTeacher: TcxGridDBTableView;
    cxgdbcTeacherID: TcxGridDBColumn;
    cxgdbcTeacherName: TcxGridDBColumn;
    cxglTeacher: TcxGridLevel;
    edtDecimalDigits: TEdit;
    btnSetTeacherIDPrecision: TButton;
    btnSetTeacherNamePrecision: TButton;
    cxmScroll: TcxMemo;
    cxteScroll: TcxTextEdit;
    btnScrollToEnd: TButton;
    cxmclbSelected: TcxMCListBox;
    cxcbSelected: TcxComboBox;
    cxlbSelected: TcxListBox;
    btnSelectedItem: TButton;
    btnSelectedAttachedInt: TButton;
    btnIndexOfAttachedInt: TButton;
    cxccbTags: TcxCheckComboBox;
    cxccbLoad: TcxCheckComboBox;
    DrawItemCustom: TcxComboBox;
    btnLoad: TButton;
    CheckedTags: TButton;
    btnCheckByTags: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestTPLDialog: TTestTPLDialog;

implementation

{$R *.dfm}

end.
