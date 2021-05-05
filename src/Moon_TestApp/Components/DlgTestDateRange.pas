unit DlgTestDateRange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DlgTest, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxGraphics, cxDropDownEdit, mnDateRange, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxCalendar;

type
  TTestDateRangeDialog = class(TTestDialog)
    cxdeFromDate: TcxDateEdit;
    cxdeToDate: TcxDateEdit;
    mndrDateRange: mnTDateRange;
    Label1: TLabel;
    Label2: TLabel;
    btnGet: TButton;
    procedure btnGetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestDateRangeDialog: TTestDateRangeDialog;

implementation

uses mnSystem, mnDialog;

{$R *.dfm}

procedure TTestDateRangeDialog.btnGetClick(Sender: TObject);
begin
  mnInfoBox('SelectedKind: ' + IntToStr(Integer(mndrDateRange.SelectedKind)) + mnNewLine +
            'FromDate: ' + DateTimeToStr(mndrDateRange.FromDate) + mnNewLine +
            'ToDate: ' + DateTimeToStr(mndrDateRange.ToDate));
end;

end.
