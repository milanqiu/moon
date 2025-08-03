unit DlgTestWebBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DlgTest, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, OleCtrls,
  SHDocVw, mnWebBrowser;

type
  TTestWebBrowserDialog = class(TTestDialog)
    WebBrowser: mnTWebBrowser;
    btnGet: TButton;
    btnPost: TButton;
    btnSetBlank: TButton;
    btnSetContent: TButton;
    btnGetHTML: TButton;
    btnGetBodyHTML: TButton;
    btnGetBodyText: TButton;
    btnTestPKU: TButton;
    btnTest12306: TButton;
    procedure btnTest12306Click(Sender: TObject);
    procedure btnTestPKUClick(Sender: TObject);
    procedure btnGetBodyTextClick(Sender: TObject);
    procedure btnGetBodyHTMLClick(Sender: TObject);
    procedure btnGetHTMLClick(Sender: TObject);
    procedure btnSetContentClick(Sender: TObject);
    procedure btnSetBlankClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnGetClick(Sender: TObject);
    procedure WebBrowserPageComplete(ASender: TObject; const pDisp: IDispatch;
      const URL: OleVariant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestWebBrowserDialog: TTestWebBrowserDialog;

implementation

{$R *.dfm}

uses mnDialog, UTestConsts, mnSystem, MSHTML, mnHTML;

procedure TTestWebBrowserDialog.WebBrowserPageComplete(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
  mnInfoBox('Page Completed: ' + mnNewLine + VarToStr(URL));
end;

procedure TTestWebBrowserDialog.btnGetClick(Sender: TObject);
begin
  WebBrowser.Get(Url_Get+Params_Get);
end;

procedure TTestWebBrowserDialog.btnPostClick(Sender: TObject);
begin
  ppStrs.Text := Params_Post;
  WebBrowser.Post(Url_Post, ppStrs);
end;

procedure TTestWebBrowserDialog.btnSetBlankClick(Sender: TObject);
begin
  WebBrowser.SetBlank;
end;

procedure TTestWebBrowserDialog.btnSetContentClick(Sender: TObject);
begin
  WebBrowser.SetContent(mnHTMLSimplePage('Title', 'Body'));
end;

procedure TTestWebBrowserDialog.btnGetHTMLClick(Sender: TObject);
begin
  mnMemoBox(WebBrowser.GetHTML, Application.Title, True);
end;

procedure TTestWebBrowserDialog.btnGetBodyHTMLClick(Sender: TObject);
begin
  mnMemoBox(WebBrowser.GetBodyHTML, Application.Title, True);
end;

procedure TTestWebBrowserDialog.btnGetBodyTextClick(Sender: TObject);
begin
  mnMemoBox(WebBrowser.GetBodyText, Application.Title, True);
end;

procedure TTestWebBrowserDialog.btnTestPKUClick(Sender: TObject);
begin
  WebBrowser.Get('http://www.pku.org.cn');
end;

procedure TTestWebBrowserDialog.btnTest12306Click(Sender: TObject);
begin
  WebBrowser.Get('https://www.12306.cn');
end;

end.
