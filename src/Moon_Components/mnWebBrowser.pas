unit mnWebBrowser;

interface

uses SHDocVw, Classes, ActiveX, Controls, MSHTML;

type
{--------------------------------
  mnTWebBrowser�ı�ʾ��ҳ������ϵ��¼���
 --------------------------------}
  mnTWebBrowserPageComplete = procedure (ASender: TObject; const pDisp: IDispatch; const URL: OleVariant) of object;

{--------------------------------
  ��ҳ��������̳���VCL�ı�׼TWebBrowser����������Դ��ActiveX�ؼ����ṩ�˸���ʹ�õĽӿں͸���ĸ��ӹ��ܡ�
  Tested in TestUnit and TestApp.
 --------------------------------}
  mnTWebBrowser = class(TWebBrowser)
  private
    FIdle: Boolean;
  public
    // ��ǰ�Ƿ��ڿ���״̬
    // ��ʹ��Get��Post��SetBlank��SetContent������ҳʱ��״̬Ϊæµ��������Ϻ�״̬�ع鵽����
    property Idle: Boolean read FIdle;
    // Ӧ�ó������ֱ����������ڿ���״̬���༴ֱ����ҳ������ϣ�
    procedure WaitForIdle;
  protected
    procedure InvokeEvent(DispID: TDispID; var Params: TDispParams); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure SetParent(AParent: TWinControl); override;
  public
    // ͨ��Get��ʽ����һ����ַ
    procedure Get(const URL: string);
    // ͨ��Post��ʽ����һ����ַ
    // ע�⣺Post�Ĳ�������ǵ��ַ�����ʾ���������֮���úͷ��ţ�&���ָ���
    procedure Post(const URL: string; Params: TStrings); overload;
    procedure Post(const URL: string; Params: string); overload;
    // ���������Ϊ�հ�ҳ
    procedure SetBlank;
    // ���������������
    // ע�⣺��������֮ǰû�з��ʹ��κ���ַ��������ȵ���SetBlank���г�ʼ��
    procedure SetContent(const HTML: string);
  public
    // ����������HTML��Body HTML��Body Text
    // ���У�GetHTML��ֱ�ӻ�ȡ�������ԭʼ�ű�����������Get��ͨ���������Document���ʣ���������ԭʼ�ű����н���
    // ��ˣ�������Get���صĽ������ԭʼ�ű����ܲ�����ȫһ��
    // ���磬GetBodyHTML���е�HTML��ǩ�����Զ�ת��Ϊȫ��д
    // �����磬GetHTML�̶�����Ansi���룬��������Get�������ҳʵ�ʱ��뷵��
    function GetHTML: string;
    function GetBodyHTML: string;
    function GetBodyText: string;
  public
    // ����������Document����ת��Ϊʵ�ʵ�IHtmlDocument2�ӿ����ͷ���
    function GetDocument: IHtmlDocument2;
  private
    FOnPageComplete: mnTWebBrowserPageComplete;
  published
    // �����������ҳ�ķ������ʱ����
    // �����Դ���OnDocumentComplete����Ϊ�����һ��ҳ���ж��frame����ôÿ��frame���ᴥ��һ��OnDocumentComplete
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

  // ����ȫ��TLS 1.2֧��
  InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
  InternetSetOption(nil, INTERNET_OPTION_REFRESH, nil, 0);

end.
