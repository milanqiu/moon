unit mnWaitDialog;

interface

uses Classes, SysUtils, mnForm, StdCtrls, cxButtons, Gauges;

type
{--------------------------------
  等待对话框，显示一个前端窗体让用户等待，同时后台仍旧执行代码。
  等待对话框上可根据需要，决定是否允许用户取消，以及是否显示进度条。
  注：关于前端窗体的介绍，参见mnForm单元的mnTFrontalForm类。
  Tested in TestUnit and TestApp.
 --------------------------------}
  mnTWaitDialog = class(TComponent)
  private
    // 对话框窗体及窗体上各控件
    WaitForm: mnTFrontalForm;
    lbPrompt: TLabel;
    cxbtnCancel: TcxButton;
    gauWork: TGauge;
    procedure WhenWaitFormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure WhencxbtnCancelClick(Sender: TObject);
  private
    FWorkload: Integer;
    FProgress: Integer;
    procedure SetWorkload(const Value: Integer);
    procedure SetProgress(const Value: Integer);
  public
    // 工作量，会显示在进度条上
    property Workload: Integer read FWorkload write SetWorkload;
    // 工作进度，会显示在进度条上
    property Progress: Integer read FProgress write SetProgress;
    // 增加一些工作进度
    procedure AddProgress(const Step: Integer = 1);
  private
    FCancelled: Boolean;
  public
    // 用户或程序是否已取消对话框
    // 用户取消的方法有两种，一种是点击取消按钮，另一种是关闭窗口（通过点击关闭按钮或按下Alt+F4）
    // 程序取消的方法有一种，即调用Cancel成员函数
    property Cancelled: Boolean read FCancelled;
    // 取消对话框
    procedure Cancel;
    // 检查对话框是否已被取消。如果已被取消，抛出一个EWaitDialogCancelledException异常
    procedure CheckCancelled;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    // 显示对话框
    procedure Show;
    // 关闭对话框
    procedure Close;
    // 返回对话框是否可见
    function IsVisible: Boolean;
  private
    FCaption: string;
    FPrompt: string;
    FHasGauge: Boolean;
    FCanCancel: Boolean;
    FMsgConfirmCancel: string;
    FMsgCancelled: string;
    procedure SetCaption(const Value: string);
    procedure SetPrompt(const Value: string);
    procedure SetHasGauge(const Value: Boolean);
    procedure SetCanCancel(const Value: Boolean);
  published
    // 对话框的标题
    property Caption: string read FCaption write SetCaption;
    // 对话框上的提示文字
    property Prompt: string read FPrompt write SetPrompt;
    // 是否显示进度条
    property HasGauge: Boolean read FHasGauge write SetHasGauge default False;
    // 是否允许用户取消
    property CanCancel: Boolean read FCanCancel write SetCanCancel default True;
    // 如果允许用户取消，当确认用户是否取消时，弹出的提示文字
    property MsgConfirmCancel: string read FMsgConfirmCancel write FMsgConfirmCancel;
    // 如果允许用户取消，当用户确定取消后，弹出的提示文字
    property MsgCancelled: string read FMsgCancelled write FMsgCancelled;
  end;

{--------------------------------
  特定异常，专在程序调用WaitDialog的CheckCancelled时，若对话框已被取消，则抛出。
 --------------------------------}
  EWaitDialogCancelledException = class(Exception);

implementation

uses mnResStrsU, mnResStrsC, Forms, mnSystem, mnDialog;

{$R ..\..\files\Icons\Components\mnWaitDialog.dcr}

{ mnTWaitDialog }

procedure mnTWaitDialog.WhenWaitFormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if WaitForm.Visible then
  begin
    CanClose := False;
    if CanCancel then cxbtnCancel.Click;
  end;
end;

procedure mnTWaitDialog.WhencxbtnCancelClick(Sender: TObject);
begin
  FCancelled := mnConfirmBox(MsgConfirmCancel);
end;

procedure mnTWaitDialog.SetWorkload(const Value: Integer);
begin
  FWorkload := Value;
  FProgress := 0;

  gauWork.MinValue := 0;
  gauWork.MaxValue := FWorkload;
  gauWork.Progress := 0;
  if WaitForm.Visible then Application.ProcessMessages;
end;

procedure mnTWaitDialog.SetProgress(const Value: Integer);
begin
  FProgress := Value;

  gauWork.Progress := FProgress;
  if WaitForm.Visible then Application.ProcessMessages;
end;

procedure mnTWaitDialog.AddProgress(const Step: Integer);
begin
  Progress := Progress + Step;
end;

procedure mnTWaitDialog.Cancel;
begin
  FCancelled := True;
end;

procedure mnTWaitDialog.CheckCancelled;
begin
  if WaitForm.Visible then Application.ProcessMessages;
  mnCreateErrorIf(Cancelled, EWaitDialogCancelledException, MsgCancelled);
end;

constructor mnTWaitDialog.Create(AOwner: TComponent);
begin
  inherited;

  FCaption := SDefaultWaitDialogCaption;
  FPrompt := SDefaultWaitDialogPrompt;
  FHasGauge := False;
  FCanCancel := True;
  FMsgConfirmCancel := SDefaultMsgConfirmCancel;
  FMsgCancelled := SDefaultMsgCancelled;

  // 创建对话框窗体
  WaitForm := mnTFrontalForm.CreateNew(nil);
  with WaitForm do
  begin
    BorderStyle := bsDialog;
    Position := poScreenCenter;
    Width := 500;
    Height := 100;
    OnCloseQuery := WhenWaitFormCloseQuery;
  end;
  mnSetStandardFont(WaitForm);

  // 创建提示标签
  lbPrompt := TLabel.Create(WaitForm);
  with lbPrompt do
  begin
    Parent := WaitForm;
    Left := 40;
    Top := 30;
  end;

  // 创建取消按钮
  cxbtnCancel := TcxButton.Create(WaitForm);
  with cxbtnCancel do
  begin
    Parent := WaitForm;
    Caption := SCancel;
    Left := 208;
    Top := 56;
    Width := 75;
    Height := 25;
    OnClick := WhencxbtnCancelClick;
  end;

  // 创建进度条
  gauWork := TGauge.Create(WaitForm);
  with gauWork do
  begin
    Parent := WaitForm;
    Left := 40;
    Top := 56;
    Width := 412;
    Height := 25;
  end;
end;

destructor mnTWaitDialog.Destroy;
begin
  WaitForm.Free;
  inherited;
end;

procedure mnTWaitDialog.Show;
begin
  mnCreateErrorIf(WaitForm.Visible, SShowVisibleWaitDialog);

  cxbtnCancel.Visible := CanCancel;
  gauWork.Visible := HasGauge;
  WaitForm.Height := 100;
  if HasGauge then WaitForm.Height := WaitForm.Height + 38;
  if CanCancel then WaitForm.Height := WaitForm.Height + 30;
  cxbtnCancel.Top := 56;
  if HasGauge then cxbtnCancel.Top := cxbtnCancel.Top + 40;

  FCancelled := False;
  WaitForm.ShowFrontal;
  Application.ProcessMessages;
end;

procedure mnTWaitDialog.Close;
begin
  mnCreateErrorIf(not WaitForm.Visible, SCloseInvisibleWaitDialog);

  WaitForm.CloseFrontal;
  Application.ProcessMessages;
end;

function mnTWaitDialog.IsVisible: Boolean;
begin
  Result := WaitForm.Visible;
end;

procedure mnTWaitDialog.SetCaption(const Value: string);
begin
  FCaption := Value;

  WaitForm.Caption := Value;
  if WaitForm.Visible then Application.ProcessMessages;
end;

procedure mnTWaitDialog.SetPrompt(const Value: string);
begin
  FPrompt := Value;

  lbPrompt.Caption := Value;
  if WaitForm.Visible then Application.ProcessMessages;
end;

procedure mnTWaitDialog.SetHasGauge(const Value: Boolean);
begin
  mnCreateErrorIf(WaitForm.Visible, SChangeHasGaugeWhenVisible);
  FHasGauge := Value;
end;

procedure mnTWaitDialog.SetCanCancel(const Value: Boolean);
begin
  mnCreateErrorIf(WaitForm.Visible, SChangeCanCancelWhenVisible);
  FCanCancel := Value;
end;

end.
