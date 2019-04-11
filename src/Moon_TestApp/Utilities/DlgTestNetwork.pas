unit DlgTestNetwork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DlgTest, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TTestNetworkDialog = class(TTestDialog)
    btnHTTPGet: TButton;
    btnHTTPGet6: TButton;
    btnHTTPGetFail: TButton;
    btnHTTPGetFail6: TButton;
    btnHTTPPost: TButton;
    btnHTTPPost6: TButton;
    btnHTTPPostFail: TButton;
    btnHTTPPostFail6: TButton;
    btnThreadHTTPGet: TButton;
    btnThreadHTTPGet6: TButton;
    btnThreadHTTPGetFail: TButton;
    btnThreadHTTPGetFail6: TButton;
    btnThreadHTTPPost: TButton;
    btnThreadHTTPPost6: TButton;
    btnThreadHTTPPostFail: TButton;
    btnThreadHTTPPostFail6: TButton;
    btnThreadHTTPTerminate: TButton;
    procedure btnThreadHTTPTerminateClick(Sender: TObject);
    procedure btnThreadHTTPPostFail6Click(Sender: TObject);
    procedure btnThreadHTTPPostFailClick(Sender: TObject);
    procedure btnThreadHTTPPost6Click(Sender: TObject);
    procedure btnThreadHTTPPostClick(Sender: TObject);
    procedure btnThreadHTTPGetFail6Click(Sender: TObject);
    procedure btnThreadHTTPGetFailClick(Sender: TObject);
    procedure btnThreadHTTPGet6Click(Sender: TObject);
    procedure btnThreadHTTPGetClick(Sender: TObject);
    procedure btnHTTPPostFail6Click(Sender: TObject);
    procedure btnHTTPPostFailClick(Sender: TObject);
    procedure btnHTTPPost6Click(Sender: TObject);
    procedure btnHTTPPostClick(Sender: TObject);
    procedure btnHTTPGetFail6Click(Sender: TObject);
    procedure btnHTTPGetFailClick(Sender: TObject);
    procedure btnHTTPGet6Click(Sender: TObject);
    procedure btnHTTPGetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestNetworkDialog: TTestNetworkDialog;

implementation

{$R *.dfm}

uses mnNetwork, mnDialog, UTestConsts;

procedure TTestNetworkDialog.btnHTTPGetClick(Sender: TObject);
begin
  mnMemoBox(mnHTTPGet(Url_Get+Params_Get));
end;

procedure TTestNetworkDialog.btnHTTPGet6Click(Sender: TObject);
begin
  mnHTTPGet(Url_Get+Params_Get);
  mnHTTPGet(Url_Get+Params_Get);
  mnHTTPGet(Url_Get+Params_Get);
  mnHTTPGet(Url_Get+Params_Get);
  mnHTTPGet(Url_Get+Params_Get);
  mnMemoBox(mnHTTPGet(Url_Get+Params_Get));
end;

procedure TTestNetworkDialog.btnHTTPGetFailClick(Sender: TObject);
begin
  mnMemoBox(mnHTTPGet(Url_Fake));
end;

procedure TTestNetworkDialog.btnHTTPGetFail6Click(Sender: TObject);
begin
  mnMemoBox(mnHTTPGet(Url_Fake, 6));
end;

procedure TTestNetworkDialog.btnHTTPPostClick(Sender: TObject);
begin
  mnMemoBox(mnHTTPPost(Url_Post, Params_Post));
end;

procedure TTestNetworkDialog.btnHTTPPost6Click(Sender: TObject);
begin
  mnHTTPPost(Url_Post, Params_Post);
  mnHTTPPost(Url_Post, Params_Post);
  mnHTTPPost(Url_Post, Params_Post);
  mnHTTPPost(Url_Post, Params_Post);
  mnHTTPPost(Url_Post, Params_Post);
  mnMemoBox(mnHTTPPost(Url_Post, Params_Post));
end;

procedure TTestNetworkDialog.btnHTTPPostFailClick(Sender: TObject);
begin
  mnMemoBox(mnHTTPPost(Url_Fake, Params_Post));
end;

procedure TTestNetworkDialog.btnHTTPPostFail6Click(Sender: TObject);
begin
  mnMemoBox(mnHTTPPost(Url_Fake, Params_Post, 6));
end;

procedure TTestNetworkDialog.btnThreadHTTPGetClick(Sender: TObject);
begin
  mnMemoBox(mnThreadHTTPGet(Url_Get+Params_Get));
end;

procedure TTestNetworkDialog.btnThreadHTTPGet6Click(Sender: TObject);
begin
  mnThreadHTTPGet(Url_Get+Params_Get);
  mnThreadHTTPGet(Url_Get+Params_Get);
  mnThreadHTTPGet(Url_Get+Params_Get);
  mnThreadHTTPGet(Url_Get+Params_Get);
  mnThreadHTTPGet(Url_Get+Params_Get);
  mnMemoBox(mnThreadHTTPGet(Url_Get+Params_Get));
end;

procedure TTestNetworkDialog.btnThreadHTTPGetFailClick(Sender: TObject);
begin
  mnMemoBox(mnThreadHTTPGet(Url_Fake));
end;

procedure TTestNetworkDialog.btnThreadHTTPGetFail6Click(Sender: TObject);
begin
  mnMemoBox(mnThreadHTTPGet(Url_Fake, 6));
end;

procedure TTestNetworkDialog.btnThreadHTTPPostClick(Sender: TObject);
begin
  mnMemoBox(mnThreadHTTPPost(Url_Post, Params_Post));
end;

procedure TTestNetworkDialog.btnThreadHTTPPost6Click(Sender: TObject);
begin
  mnThreadHTTPPost(Url_Post, Params_Post);
  mnThreadHTTPPost(Url_Post, Params_Post);
  mnThreadHTTPPost(Url_Post, Params_Post);
  mnThreadHTTPPost(Url_Post, Params_Post);
  mnThreadHTTPPost(Url_Post, Params_Post);
  mnMemoBox(mnThreadHTTPPost(Url_Post, Params_Post));
end;

procedure TTestNetworkDialog.btnThreadHTTPPostFailClick(Sender: TObject);
begin
  mnMemoBox(mnThreadHTTPPost(Url_Fake, Params_Post));
end;

procedure TTestNetworkDialog.btnThreadHTTPPostFail6Click(Sender: TObject);
begin
  mnMemoBox(mnThreadHTTPPost(Url_Fake, Params_Post, 6));
end;

procedure TTestNetworkDialog.btnThreadHTTPTerminateClick(Sender: TObject);
begin
  mnThreadHTTPTerminate;
end;

end.
