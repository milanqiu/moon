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
    btnHTTPGetHTTPS: TButton;
    btnHTTPPost: TButton;
    btnHTTPPost6: TButton;
    btnHTTPPostFail: TButton;
    btnHTTPPostFail6: TButton;
    btnHTTPPostHTTPS: TButton;
    btnThreadHTTPGet: TButton;
    btnThreadHTTPGet6: TButton;
    btnThreadHTTPGetFail: TButton;
    btnThreadHTTPGetFail6: TButton;
    btnThreadHTTPGetHTTPS: TButton;
    btnThreadHTTPPost: TButton;
    btnThreadHTTPPost6: TButton;
    btnThreadHTTPPostFail: TButton;
    btnThreadHTTPPostFail6: TButton;
    btnThreadHTTPPostHTTPS: TButton;
    btnThreadHTTPTerminate: TButton;
    procedure btnThreadHTTPTerminateClick(Sender: TObject);
    procedure btnThreadHTTPPostHTTPSClick(Sender: TObject);
    procedure btnThreadHTTPPostFail6Click(Sender: TObject);
    procedure btnThreadHTTPPostFailClick(Sender: TObject);
    procedure btnThreadHTTPPost6Click(Sender: TObject);
    procedure btnThreadHTTPPostClick(Sender: TObject);
    procedure btnThreadHTTPGetHTTPSClick(Sender: TObject);
    procedure btnThreadHTTPGetFail6Click(Sender: TObject);
    procedure btnThreadHTTPGetFailClick(Sender: TObject);
    procedure btnThreadHTTPGet6Click(Sender: TObject);
    procedure btnThreadHTTPGetClick(Sender: TObject);
    procedure btnHTTPPostHTTPSClick(Sender: TObject);
    procedure btnHTTPPostFail6Click(Sender: TObject);
    procedure btnHTTPPostFailClick(Sender: TObject);
    procedure btnHTTPPost6Click(Sender: TObject);
    procedure btnHTTPPostClick(Sender: TObject);
    procedure btnHTTPGetHTTPSClick(Sender: TObject);
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

uses mnNetwork, mnDialog, UTestConsts, mnFile;

procedure TTestNetworkDialog.btnHTTPGetClick(Sender: TObject);
begin
  mnMemoBox(mnHTTPGet(Url_Get+Params_Get), '', True);
end;

procedure TTestNetworkDialog.btnHTTPGet6Click(Sender: TObject);
begin
  mnHTTPGet(Url_Get+Params_Get);
  mnHTTPGet(Url_Get+Params_Get);
  mnHTTPGet(Url_Get+Params_Get);
  mnHTTPGet(Url_Https);
  mnHTTPGet(Url_Https);
  mnMemoBox(mnHTTPGet(Url_Get+Params_Get), '', True);
end;

procedure TTestNetworkDialog.btnHTTPGetFailClick(Sender: TObject);
begin
  mnMemoBox(mnHTTPGet(Url_Fake_Page), '', True);
end;

procedure TTestNetworkDialog.btnHTTPGetFail6Click(Sender: TObject);
begin
  mnMemoBox(mnHTTPGet(Url_Fake_Host, 6), '', True);
end;

procedure TTestNetworkDialog.btnHTTPGetHTTPSClick(Sender: TObject);
begin
  mnMemoBox(mnHTTPGet(Url_Https), '', True);
end;

procedure TTestNetworkDialog.btnHTTPPostClick(Sender: TObject);
begin
  mnMemoBox(mnHTTPPost(Url_Post, Params_Post), '', True);
end;

procedure TTestNetworkDialog.btnHTTPPost6Click(Sender: TObject);
begin
  mnHTTPPost(Url_Post, Params_Post);
  mnHTTPPost(Url_Post, Params_Post);
  mnHTTPPost(Url_Post, Params_Post);
  mnHTTPPost(Url_Https, '');
  mnHTTPPost(Url_Https, '');
  mnMemoBox(mnHTTPPost(Url_Post, Params_Post), '', True);
end;

procedure TTestNetworkDialog.btnHTTPPostFailClick(Sender: TObject);
begin
  mnMemoBox(mnHTTPPost(Url_Fake_Page, Params_Post), '', True);
end;

procedure TTestNetworkDialog.btnHTTPPostFail6Click(Sender: TObject);
begin
  mnMemoBox(mnHTTPPost(Url_Fake_Host, Params_Post, 6), '', True);
end;

procedure TTestNetworkDialog.btnHTTPPostHTTPSClick(Sender: TObject);
begin
  mnMemoBox(mnHTTPPost(Url_Https, ''), '', True);
end;

procedure TTestNetworkDialog.btnThreadHTTPGetClick(Sender: TObject);
begin
  mnMemoBox(mnThreadHTTPGet(Url_Get+Params_Get), '', True);
end;

procedure TTestNetworkDialog.btnThreadHTTPGet6Click(Sender: TObject);
begin
  mnThreadHTTPGet(Url_Get+Params_Get);
  mnThreadHTTPGet(Url_Get+Params_Get);
  mnThreadHTTPGet(Url_Get+Params_Get);
  mnThreadHTTPGet(Url_Https);
  mnThreadHTTPGet(Url_Https);
  mnMemoBox(mnThreadHTTPGet(Url_Get+Params_Get), '', True);
end;

procedure TTestNetworkDialog.btnThreadHTTPGetFailClick(Sender: TObject);
begin
  mnMemoBox(mnThreadHTTPGet(Url_Fake_Page), '', True);
end;

procedure TTestNetworkDialog.btnThreadHTTPGetFail6Click(Sender: TObject);
begin
  mnMemoBox(mnThreadHTTPGet(Url_Fake_Host, 6), '', True);
end;

procedure TTestNetworkDialog.btnThreadHTTPGetHTTPSClick(Sender: TObject);
begin
  mnMemoBox(mnThreadHTTPGet(Url_Https), '', True);
end;

procedure TTestNetworkDialog.btnThreadHTTPPostClick(Sender: TObject);
begin
  mnMemoBox(mnThreadHTTPPost(Url_Post, Params_Post), '', True);
end;

procedure TTestNetworkDialog.btnThreadHTTPPost6Click(Sender: TObject);
begin
  mnThreadHTTPPost(Url_Post, Params_Post);
  mnThreadHTTPPost(Url_Post, Params_Post);
  mnThreadHTTPPost(Url_Post, Params_Post);
  mnThreadHTTPPost(Url_Https, '');
  mnThreadHTTPPost(Url_Https, '');
  mnMemoBox(mnThreadHTTPPost(Url_Post, Params_Post), '', True);
end;

procedure TTestNetworkDialog.btnThreadHTTPPostFailClick(Sender: TObject);
begin
  mnMemoBox(mnThreadHTTPPost(Url_Fake_Page, Params_Post), '', True);
end;

procedure TTestNetworkDialog.btnThreadHTTPPostFail6Click(Sender: TObject);
begin
  mnMemoBox(mnThreadHTTPPost(Url_Fake_Host, Params_Post, 6), '', True);
end;

procedure TTestNetworkDialog.btnThreadHTTPPostHTTPSClick(Sender: TObject);
begin
  mnMemoBox(mnThreadHTTPPost(Url_Https, ''), '', True);
end;

procedure TTestNetworkDialog.btnThreadHTTPTerminateClick(Sender: TObject);
begin
  mnThreadHTTPTerminate;
end;

end.
