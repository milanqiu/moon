unit DlgTestForm;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Menus, cxLookAndFeelPainters, cxButtons, DlgTest;

type
  TTestFormDialog = class(TTestDialog)
    btnShowFrontalForm: TButton;
    btnEnableDisableAllForms: TButton;
    lbCountDown: TLabel;
    btnFillScreen: TButton;
    lbFont: TLabel;
    btnSetStandardFont: TButton;
    btnAppendToSystemMenu: TButton;
    procedure btnAppendToSystemMenuClick(Sender: TObject);
    procedure btnSetStandardFontClick(Sender: TObject);
    procedure btnFillScreenClick(Sender: TObject);
    procedure btnEnableDisableAllFormsClick(Sender: TObject);
    procedure btnShowFrontalFormClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestFormDialog: TTestFormDialog;

implementation

{$R *.dfm}

uses mnForm, mnDialog, Messages;

type
  TFrontalForm = class(mnTFrontalForm)
  private
    procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;
  public
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  end;

{ TFrontalForm }

procedure TFrontalForm.WMSysCommand(var Message: TWMSysCommand);
begin
  if Message.CmdType = $8210 then mnInfoBox('You clicked added item');
  inherited;
end;

procedure TFrontalForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := mnConfirmBox('Confirm to close?');
end;

{ TTestFormDialog }

procedure TTestFormDialog.btnShowFrontalFormClick(Sender: TObject);
var
  FrontalForm: TFrontalForm;
begin
  FrontalForm := TFrontalForm.CreateNew(Application);
  FrontalForm.OnCloseQuery := FrontalForm.FormCloseQuery;
  FrontalForm.ShowFrontal;
  FrontalForm.Caption := 'Do something in background';
end;

procedure TTestFormDialog.btnEnableDisableAllFormsClick(Sender: TObject);
var
  i: Integer;
begin
  mnDisableAllForms;
  for i := 5 downto 0 do
  begin
    lbCountDown.Caption := IntToStr(i);
    Application.ProcessMessages;
    Sleep(1000);
  end;
  mnEnableAllForms;
end;

procedure TTestFormDialog.btnFillScreenClick(Sender: TObject);
begin
  mnFillScreen(Self);
end;

procedure TTestFormDialog.btnSetStandardFontClick(Sender: TObject);
begin
  mnSetStandardFont(Self);
end;

procedure TTestFormDialog.btnAppendToSystemMenuClick(Sender: TObject);
var
  FrontalForm: TFrontalForm;
begin
  FrontalForm := TFrontalForm.CreateNew(Application);
  FrontalForm.OnCloseQuery := FrontalForm.FormCloseQuery;
  FrontalForm.ShowFrontal;
  FrontalForm.Caption := 'Please check the system menu';

  mnAppendSeparatorToSystemMenu(FrontalForm);
  mnAppendItemToSystemMenu(FrontalForm, $8210, 'Added Item');
end;

end.
