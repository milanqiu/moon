unit DlgTest;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Menus, cxLookAndFeelPainters, cxButtons;

type
  TTestDialog = class(TForm)
    cxbtnOK: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure ValidateBeforeSubmit; virtual;
  public
    { Public declarations }
  end;

var
  TestDialog: TTestDialog;

implementation

{$R *.dfm}

{ TTestDialog }

procedure TTestDialog.ValidateBeforeSubmit;
begin
end;

procedure TTestDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrOK then ValidateBeforeSubmit;
end;

end.
