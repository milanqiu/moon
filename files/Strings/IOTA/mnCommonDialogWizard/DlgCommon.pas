unit DlgCommon;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Menus, cxLookAndFeelPainters, cxButtons;

type
  TCommonDialog = class(TForm)
    cxbtnOK: TcxButton;
    cxbtnCancel: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure ValidateBeforeSubmit;
  public
    { Public declarations }
  end;

var
  CommonDialog: TCommonDialog;

implementation

{$R *.dfm}

{ TCommonDialog }

procedure TCommonDialog.ValidateBeforeSubmit;
begin

end;

procedure TCommonDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrOK then ValidateBeforeSubmit;
end;

end.
