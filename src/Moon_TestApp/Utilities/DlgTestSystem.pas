unit DlgTestSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DlgTest, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TTestSystemDialog = class(TTestDialog)
    cxbtnSleep: TcxButton;
    cxbtnmnSleep: TcxButton;
    cxbtnProcess: TcxButton;
    procedure cxbtnProcessClick(Sender: TObject);
    procedure cxbtnmnSleepClick(Sender: TObject);
    procedure cxbtnSleepClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestSystemDialog: TTestSystemDialog;

implementation

{$R *.dfm}

uses mnDialog, mnSystem;

procedure TTestSystemDialog.cxbtnSleepClick(Sender: TObject);
begin
  Sleep(5000);
  mnInfoBox('Finished');
end;

procedure TTestSystemDialog.cxbtnmnSleepClick(Sender: TObject);
begin
  mnSleep(5000);
  mnInfoBox('Finished');
end;

procedure TTestSystemDialog.cxbtnProcessClick(Sender: TObject);
begin
  mnInfoBox('Processed');
end;

end.
