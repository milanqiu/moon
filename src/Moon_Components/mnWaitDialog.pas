unit mnWaitDialog;

interface

uses Classes, SysUtils, mnForm, StdCtrls, cxButtons, Gauges;

type
{--------------------------------
  �ȴ��Ի�����ʾһ��ǰ�˴������û��ȴ���ͬʱ��̨�Ծ�ִ�д��롣
  �ȴ��Ի����Ͽɸ�����Ҫ�������Ƿ������û�ȡ�����Լ��Ƿ���ʾ��������
  ע������ǰ�˴���Ľ��ܣ��μ�mnForm��Ԫ��mnTFrontalForm�ࡣ
  Tested in TestUnit and TestApp.
 --------------------------------}
  mnTWaitDialog = class(TComponent)
  private
    // �Ի����弰�����ϸ��ؼ�
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
    // ������������ʾ�ڽ�������
    property Workload: Integer read FWorkload write SetWorkload;
    // �������ȣ�����ʾ�ڽ�������
    property Progress: Integer read FProgress write SetProgress;
    // ����һЩ��������
    procedure AddProgress(const Step: Integer = 1);
  private
    FCancelled: Boolean;
  public
    // �û�������Ƿ���ȡ���Ի���
    // �û�ȡ���ķ��������֣�һ���ǵ��ȡ����ť����һ���ǹرմ��ڣ�ͨ������رհ�ť����Alt+F4��
    // ����ȡ���ķ�����һ�֣�������Cancel��Ա����
    property Cancelled: Boolean read FCancelled;
    // ȡ���Ի���
    procedure Cancel;
    // ���Ի����Ƿ��ѱ�ȡ��������ѱ�ȡ�����׳�һ��EWaitDialogCancelledException�쳣
    procedure CheckCancelled;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    // ��ʾ�Ի���
    procedure Show;
    // �رնԻ���
    procedure Close;
    // ���ضԻ����Ƿ�ɼ�
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
    // �Ի���ı���
    property Caption: string read FCaption write SetCaption;
    // �Ի����ϵ���ʾ����
    property Prompt: string read FPrompt write SetPrompt;
    // �Ƿ���ʾ������
    property HasGauge: Boolean read FHasGauge write SetHasGauge default False;
    // �Ƿ������û�ȡ��
    property CanCancel: Boolean read FCanCancel write SetCanCancel default True;
    // ��������û�ȡ������ȷ���û��Ƿ�ȡ��ʱ����������ʾ����
    property MsgConfirmCancel: string read FMsgConfirmCancel write FMsgConfirmCancel;
    // ��������û�ȡ�������û�ȷ��ȡ���󣬵�������ʾ����
    property MsgCancelled: string read FMsgCancelled write FMsgCancelled;
  end;

{--------------------------------
  �ض��쳣��ר�ڳ������WaitDialog��CheckCancelledʱ�����Ի����ѱ�ȡ�������׳���
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

  // �����Ի�����
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

  // ������ʾ��ǩ
  lbPrompt := TLabel.Create(WaitForm);
  with lbPrompt do
  begin
    Parent := WaitForm;
    Left := 40;
    Top := 30;
  end;

  // ����ȡ����ť
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

  // ����������
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
