unit DlgTestWaitDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DlgTest, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  mnWaitDialog;

type
  TTestWaitDialogDialog = class(TTestDialog)
    wdMain: mnTWaitDialog;
    cbCanCancel: TCheckBox;
    cbHasGauge: TCheckBox;
    cbCancelAfter5Secs: TCheckBox;
    btnShow: TButton;
    tmrCancel: TTimer;
    procedure tmrCancelTimer(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestWaitDialogDialog: TTestWaitDialogDialog;

implementation

uses mnDialog, mnSystem;

{$R *.dfm}

procedure TTestWaitDialogDialog.btnShowClick(Sender: TObject);
var
  i: Integer;
begin
  tmrCancel.Enabled := cbCancelAfter5Secs.Checked;

  try try
    wdMain.CanCancel := cbCanCancel.Checked;
    wdMain.HasGauge := cbHasGauge.Checked;
    wdMain.Workload := 2000;
    wdMain.Show;

    for i := 1 to wdMain.Workload do
    begin
      wdMain.Prompt := Format('Please wait... %d / %d', [i, wdMain.Workload]);

      Sleep(2);

      wdMain.AddProgress(1);
      wdMain.CheckCancelled;
    end;

    mnInfoBox('Mission accomplished');
  except
    on E: Exception do
    begin
      mnCreateError(ExceptClass(E.ClassType), E.Message + mnNewLine + mnNewLine + 'Current prompt: ' + mnNewLine + wdMain.Prompt);
    end; end;
  finally
    wdMain.Close;
  end;
end;

procedure TTestWaitDialogDialog.tmrCancelTimer(Sender: TObject);
begin
  wdMain.Cancel;
end;

end.
