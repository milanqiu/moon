unit DlgTestFileChooser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DlgTest, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxMRUEdit, mnFileChooser;

type
  TTestFileChooserDialog = class(TTestDialog)
    mnfcTest: mnTFileChooser;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestFileChooserDialog: TTestFileChooserDialog;

implementation

{$R *.dfm}

end.
