unit mnWebBrowser;

interface

uses SHDocVw, Classes, ActiveX, Controls, MSHTML;

type
{--------------------------------
  mnTWebBrowser的表示整页访问完毕的事件。
 --------------------------------}
  mnTWebBrowserPageComplete = procedure (ASender: TObject; const pDisp: IDispatch; const URL: OleVariant) of object;

{--------------------------------
  网页浏览器，继承自VCL的标准TWebBrowser，本质上来源于ActiveX控件，提供了更易使用的接口和更多的附加功能。
  Tested in TestUnit and TestApp.
 --------------------------------}
  mnTWebBrowser = class(TWebBrowser)
  private
    FIdle: Boolean;
  public
    // 当前是否处于空闲状态
    // 在使用Get、Post、SetBlank或SetContent访问网页时，状态为忙碌。访问完毕后，状态回归到空闲
    property Idle: Boolean read FIdle;
    // 应用程序挂起，直到浏览器处于空闲状态（亦即直到网页访问完毕）
    procedure WaitForIdle;
  protected
    procedure InvokeEvent(DispID: TDispID; var Params: TDispParams); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure SetParent(AParent: TWinControl); override;
  public
    // 通过Get方式访问一个网址
    procedure Get(const URL: string);
    // 通过Post方式访问一个网址
    // 注意：Post的参数如果是单字符串表示，则各参数之间用和符号（&）分隔开
    procedure Post(const URL: string; Params: TStrings); overload;
    procedure Post(const URL: string; Params: string); overload;
    // 设置浏览器为空白页
    procedure SetBlank;
    // 设置浏览器的内容
    // 注意：如果浏览器之前没有访问过任何网址，则必须先调用SetBlank进行初始化
    procedure SetContent(const HTML: string);
  public
    // 获得浏览器的HTML、Body HTML或Body Text
    // 其中，GetHTML是直接获取浏览器的原始脚本，而其它的Get会通过浏览器的Document访问，而其会对其原始脚本进行解析
    // 因此，其它的Get返回的结果，和原始脚本可能不会完全一致
    // 例如，GetBodyHTML含有的HTML标签，会自动转换为全大写
    // 再例如，GetHTML固定返回Ansi编码，而其它的Get会根据网页实际编码返回
    function GetHTML: string;
    function GetBodyHTML: string;
    function GetBodyText: string;
  public
    // 获得浏览器的Document，并转换为实质的IHtmlDocument2接口类型返回
    function GetDocument: IHtmlDocument2;
  private
    FOnPageComplete: mnTWebBrowserPageComplete;
  published
    // 在浏览器对整页的访问完毕时触发
    // 不用自带的OnDocumentComplete是因为，如果一个页面有多个frame，那么每个frame都会触发一次OnDocumentComplete
    property OnPageComplete: mnTWebBrowserPageComplete read FOnPageComplete write FOnPageComplete;
  end;

implementation

uses Forms, mnSystem, mnCOM, mnString, Variants, Windows, SysUtils, ComObj, WinInet;

{$R ..\..\files\Icons\Components\mnWebBrowser.dcr}

{ mnTWebBrowser }

procedure mnTWebBrowser.WaitForIdle;
begin
  repeat
    Forms.Application.ProcessMessages;
  until FIdle;
end;

procedure mnTWebBrowser.InvokeEvent(DispID: TDispID; var Params: TDispParams);
var
  pDisp: IDispatch;
  URL: OleVariant;
begin
  inherited InvokeEvent(DispID, Params);
  case DispID of
    259:
    begin
      pDisp := mnParseDispParam(@Params, 0);
      URL := mnParseDispParam(@Params, 1);
      if (pDisp as IWebBrowser) = DefaultInterface then
      begin
        if Assigned(FOnPageComplete) then
          FOnPageComplete(Self, pDisp, URL);
        FIdle := True;
      end;
    end;
  end;
end;

constructor mnTWebBrowser.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIdle := True;
end;

procedure mnTWebBrowser.SetParent(AParent: TWinControl);
begin
  // just for making this member public
  inherited SetParent(AParent);
end;

procedure mnTWebBrowser.Get(const URL: string);
var
  URLVar: OleVariant;
begin
  FIdle := False;
  URLVar := URL;
  Navigate2(URLVar);
end;

procedure mnTWebBrowser.Post(const URL: string; Params: TStrings);
begin
  Post(URL, mnCombine(Params, '&'));
end;

procedure mnTWebBrowser.Post(const URL: string; Params: string);
var
  URLVar, PostData, Headers: OleVariant;
begin
  FIdle := False;
  URLVar := URL;
  PostData := mnStrToOleVar(Params);
  Headers := 'Content-Type: application/x-www-form-urlencoded';
  Navigate2(URLVar, EmptyParam, EmptyParam, PostData, Headers);
end;

procedure mnTWebBrowser.SetBlank;
begin
  Get('about:blank');
  WaitForIdle;
end;

procedure mnTWebBrowser.SetContent(const HTML: string);
var
  Stream: IStream;
  hHTML: HGLOBAL;
  PSI: IPersistStreamInit;
begin
  if not Assigned(Document) then Exit;
  FIdle := False;
  hHTML := GlobalAlloc(GPTR, Length(HTML) + 1);
  if hHTML = 0 then RaiseLastOSError;
  CopyMemory(Pointer(hHTML), PChar(HTML), Length(HTML));
  try
    OleCheck(CreateStreamOnHGlobal(hHTML, True, Stream));
    OleCheck(Document.QueryInterface(IPersistStreamInit, PSI));
    OleCheck(PSI.InitNew);
    OleCheck(PSI.Load(Stream));
  finally
    PSI := nil;
    Stream := nil;
  end;
end;

function mnTWebBrowser.GetHTML: string;
const
  BufSize = $10000;
var
  Size: Int64;
  Stream: IStream;
  hHTML: HGLOBAL;
  PSI: IPersistStreamInit;
begin
  Result := '';
  if not Assigned(Document) then Exit;
  hHTML := GlobalAlloc(GPTR, BufSize);
  if hHTML = 0 then RaiseLastOSError;
  try
    OleCheck(CreateStreamOnHGlobal(hHTML, True, Stream));
    OleCheck(Document.QueryInterface(IPersistStreamInit, PSI));
    OleCheck(PSI.Save(Stream, False));
    Size := StrLen(PChar(hHTML));
    SetLength(Result, Size);
    CopyMemory(PChar(Result), Pointer(hHTML), Size);
  finally
    PSI := nil;
    Stream := nil;
  end;
end;

function mnTWebBrowser.GetBodyHTML: string;
begin
  Result := '';
  if not Assigned(Document) then Exit;
  Result := (Document as IHtmlDocument2).body.innerHTML;
end;

function mnTWebBrowser.GetBodyText: string;
begin
  Result := '';
  if not Assigned(Document) then Exit;
  Result := (Document as IHtmlDocument2).body.innerText;
end;

function mnTWebBrowser.GetDocument: IHtmlDocument2;
begin
  Result := Document as IHtmlDocument2;
end;

initialization

  // 设置全局TLS 1.2支持
  InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
  InternetSetOption(nil, INTERNET_OPTION_REFRESH, nil, 0);

end.
