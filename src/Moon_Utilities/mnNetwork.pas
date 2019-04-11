unit mnNetwork;

interface

uses Classes, IdHTTP, IdThread;

{--------------------------------
  注意：本单元中所有函数在同一时刻只能有一个被调用。
 --------------------------------}

{--------------------------------
  通过内部维护的IdHTTP对象，以Get或Post方式访问一个URL。返回该URL内容。
  如果访问URL时出错，会自动清除IdHTTP的错误状态以备下次使用，并抛出Exception。
  RetryTimes表示允许的重试次数。只有在达到最大重试次数时，才认为访问URL出错。
  SleepInterval是每两次重试间的间隔。
  注意：Post的参数如果是单字符串表示，则各参数之间用换行符（#13#10）分隔开。
  Tested in TestUnit and TestApp.
 --------------------------------}
function mnHTTPGet(const URL: string;
  const RetryTimes: Integer = 1; const SleepInterval: Integer = 500): string;
function mnHTTPPost(const URL: string; Params: TStrings;
  const RetryTimes: Integer = 1; const SleepInterval: Integer = 500): string; overload;
function mnHTTPPost(const URL: string; Params: string;
  const RetryTimes: Integer = 1; const SleepInterval: Integer = 500): string; overload;

{--------------------------------
  新开一个线程，通过内部维护的IdHTTP对象，以Get或Post方式访问一个URL。返回该URL内容。但主线程将挂起。
  和非线程方式的唯一区别在于，在HTTP访问期间应用程序仍可响应消息，例如可以根据用户点击按钮事件触发终止访问。
  如果访问URL时出错，会自动清除IdHTTP的错误状态以备下次使用，并抛出Exception。
  RetryTimes表示允许的重试次数。只有在达到最大重试次数时，才认为访问URL出错。
  SleepInterval是每两次重试间的间隔。
  注意：Post的参数如果是单字符串表示，则各参数之间用换行符（#13#10）分隔开。
  Tested in TestUnit and TestApp.
 --------------------------------}
function mnThreadHTTPGet(const URL: string;
  const RetryTimes: Integer = 1; const SleepInterval: Integer = 500): string;
function mnThreadHTTPPost(const URL: string; Params: TStrings;
  const RetryTimes: Integer = 1; const SleepInterval: Integer = 500): string; overload;
function mnThreadHTTPPost(const URL: string; Params: string;
  const RetryTimes: Integer = 1; const SleepInterval: Integer = 500): string; overload;
{--------------------------------
  强制终止http访问的线程。
  Tested in TestApp.
 --------------------------------}
procedure mnThreadHTTPTerminate;

{--------------------------------
  将一段XML文本Post到一个URL。XML必须是完整有效的。
  一般用于调用Web Service。
  测试：无
 --------------------------------}
function mnXMLHTTPPost(const URL: string; const XML: string): string;

implementation

uses
{$IFDEF MN_DEBUG}
  FastMM4, IdGlobal, IdThreadSafe,
{$ENDIF}
  SysUtils, Forms, mnSystem, IdException, ComObj, XMLDoc, mnDebug, mnResStrsU;

var
  UsedHTTP: TIdHTTP;

procedure CreateUsedHTTP;
begin
  if not Assigned(UsedHTTP) then UsedHTTP := TIdHTTP.Create(nil);
end;

procedure FreeUsedHTTP;
begin
  if Assigned(UsedHTTP) then
  begin
    UsedHTTP.Free;
    UsedHTTP := nil;
  end;
end;

function mnHTTPGet(const URL: string;
  const RetryTimes: Integer = 1; const SleepInterval: Integer = 500): string;
var
  i: Integer;
begin
  for i := 1 to RetryTimes do
  begin
    CreateUsedHTTP;
    try
      Result := UsedHTTP.Get(URL);
      Exit;
    except
      FreeUsedHTTP;
      if i = RetryTimes then raise;
    end;
    Sleep(SleepInterval);
    Application.ProcessMessages;
  end;
end;

function mnHTTPPost(const URL: string; Params: TStrings;
  const RetryTimes: Integer = 1; const SleepInterval: Integer = 500): string; overload;
var
  i: Integer;
begin
  for i := 1 to RetryTimes do
  begin
    CreateUsedHTTP;
    try
      Result := UsedHTTP.Post(URL, Params);
      Exit;
    except
      FreeUsedHTTP;
      if i = RetryTimes then raise;
    end;
    Sleep(SleepInterval);
    Application.ProcessMessages;
  end;
end;

function mnHTTPPost(const URL: string; Params: string;
  const RetryTimes: Integer = 1; const SleepInterval: Integer = 500): string; overload;
var
  ParamsStrs: mnTStrList;
begin
  ParamsStrs := mnTStrList.Create;
  try
    ParamsStrs.Text := Params;
    Result := mnHTTPPost(URL, ParamsStrs, RetryTimes, SleepInterval);
  finally
    ParamsStrs.Free;
  end;
end;

const
  HTTPThreadStatus_Executing    = 0;
  HTTPThreadStatus_Successfully = 1;
  HTTPThreadStatus_Failed       = 2;
  HTTPThreadStatus_Terminated   = 3;

  HTTPThreadStyle_Get  = 0;
  HTTPThreadStyle_Post = 1;

type
  THTTPThread = class(TThread)
  private
    FStatus: Integer;
    FStyle: Integer;
    FURL: string;
    FParams: string;
    FRetryTimes: Integer;
    FSleepInterval: Integer;
    FResult: string;
  public
    property Status: Integer read FStatus write FStatus;
    property Style: Integer read FStyle write FStyle;
    property URL: string read FURL write FURL;
    property Params: string read FParams write FParams;
    property RetryTimes: Integer read FRetryTimes write FRetryTimes;
    property SleepInterval: Integer read FSleepInterval write FSleepInterval;
    property Result: string read FResult write FResult;
  public
    procedure Execute; override;
  end;

{ THTTPThread }

procedure THTTPThread.Execute;
var
  ParamsStrs: mnTStrList;
  i: Integer;
begin
  ParamsStrs := mnTStrList.Create;
  try try
    ParamsStrs.Text := FParams;
    for i := 1 to FRetryTimes do
    begin
      CreateUsedHTTP;
      try
        if FStyle = HTTPThreadStyle_Get then
          FResult := UsedHTTP.Get(FURL)
        else
          FResult := UsedHTTP.Post(FURL, ParamsStrs);
        FStatus := HTTPThreadStatus_Successfully;
        Exit;
      except
        FreeUsedHTTP;
        if i = FRetryTimes then raise;
      end;
      if Terminated then
      begin
        FStatus := HTTPThreadStatus_Terminated;
        Exit;
      end;
      Sleep(FSleepInterval);
      if Terminated then
      begin
        FStatus := HTTPThreadStatus_Terminated;
        Exit;
      end;
    end;
    mnNeverGoesHere;
  except
    on E: Exception do
    begin
      FResult := E.Message;
      FStatus := HTTPThreadStatus_Failed;
    end;
    end;
  finally
    ParamsStrs.Free;
  end;
end;

var
  HTTPThread: THTTPThread;

function mnThreadHTTPGet(const URL: string;
  const RetryTimes: Integer = 1; const SleepInterval: Integer = 500): string;
begin
  HTTPThread := THTTPThread.Create(True);
  try
    HTTPThread.Status := HTTPThreadStatus_Executing;
    HTTPThread.Style := HTTPThreadStyle_Get;
    HTTPThread.URL := URL;
    HTTPThread.RetryTimes := RetryTimes;
    HTTPThread.SleepInterval := SleepInterval;
    HTTPThread.Result := '';
    HTTPThread.Resume;

    while HTTPThread.Status = HTTPThreadStatus_Executing do Application.ProcessMessages;
    if HTTPThread.Status = HTTPThreadStatus_Failed then raise EIdException.Create(HTTPThread.Result);
    if HTTPThread.Status = HTTPThreadStatus_Terminated then raise EIdException.Create(SHTTPThreadTerminated);
    Result := HTTPThread.Result;
  finally
    HTTPThread.Free;
  end;
end;

function mnThreadHTTPPost(const URL: string; Params: TStrings;
  const RetryTimes: Integer = 1; const SleepInterval: Integer = 500): string; overload;
begin
  HTTPThread := THTTPThread.Create(True);
  try
    HTTPThread.Status := HTTPThreadStatus_Executing;
    HTTPThread.Style := HTTPThreadStyle_Post;
    HTTPThread.URL := URL;
    HTTPThread.Params := Params.Text;
    HTTPThread.RetryTimes := RetryTimes;
    HTTPThread.SleepInterval := SleepInterval;
    HTTPThread.Result := '';
    HTTPThread.Resume;

    while HTTPThread.Status = HTTPThreadStatus_Executing do Application.ProcessMessages;
    if HTTPThread.Status = HTTPThreadStatus_Failed then raise EIdException.Create(HTTPThread.Result);
    if HTTPThread.Status = HTTPThreadStatus_Terminated then raise EIdException.Create(SHTTPThreadTerminated);
    Result := HTTPThread.Result;
  finally
    HTTPThread.Free;
  end;
end;

function mnThreadHTTPPost(const URL: string; Params: string;
  const RetryTimes: Integer = 1; const SleepInterval: Integer = 500): string; overload;
begin
  HTTPThread := THTTPThread.Create(True);
  try
    HTTPThread.Status := HTTPThreadStatus_Executing;
    HTTPThread.Style := HTTPThreadStyle_Post;
    HTTPThread.URL := URL;
    HTTPThread.Params := Params;
    HTTPThread.RetryTimes := RetryTimes;
    HTTPThread.SleepInterval := SleepInterval;
    HTTPThread.Result := '';
    HTTPThread.Resume;

    while HTTPThread.Status = HTTPThreadStatus_Executing do Application.ProcessMessages;
    if HTTPThread.Status = HTTPThreadStatus_Failed then raise EIdException.Create(HTTPThread.Result);
    if HTTPThread.Status = HTTPThreadStatus_Terminated then raise EIdException.Create(SHTTPThreadTerminated);
    Result := HTTPThread.Result;
  finally
    HTTPThread.Free;
  end;
end;

procedure mnThreadHTTPTerminate;
begin
  HTTPThread.Terminate;
end;

function mnXMLHTTPPost(const URL: string; const XML: string): string;
var
  XMLDocument: TXMLDocument;
  OV: OleVariant;
begin
  XMLDocument := TXMLDocument.Create(nil);
  try
    XMLDocument.LoadFromXML(XML);
    OV := CreateOleObject('Microsoft.XMLHTTP');
    OV.Open('POST', URL, False);
    OV.SetRequestHeader('Content-Type', 'text/xml');
    OV.Send(XML);
    while OV.ReadyState <> 4 do;
    Result := OV.ResponseText;
  finally
    XMLDocument.Free;
  end;
end;

initialization

{$IFDEF MN_DEBUG}
  RegisterExpectedMemoryLeak(TIdThreadSafeInteger);
  RegisterExpectedMemoryLeak(TIdCriticalSection, 2);
{$ENDIF}

finalization

  FreeUsedHTTP;

end.
