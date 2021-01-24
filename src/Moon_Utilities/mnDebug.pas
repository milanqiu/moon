unit mnDebug;

interface

uses SysUtils, mnSystem, Classes, cxMemo;

type
{--------------------------------
  NeverGoesHere�쳣���͡�
 --------------------------------}
  ENeverGoesHereException = class(Exception);

{--------------------------------
  �׳�һ��NeverGoesHere�쳣��
  ͨ�����ڳ����߼��ϲ������е��ĵط����������ʱ������������ã���ʾ�������г����ˡ�
  Tested in TestUnit.
 --------------------------------}
procedure mnNeverGoesHere;

{--------------------------------
  ����һ����ʵ��
  ע�⣺ֻ����Ŀ��Ԥ���붨�����MN_DEBUGʱִ�С�
  Tested in TestUnit.
 --------------------------------}
procedure mnAssert(const Reality: Boolean); overload;
procedure mnAssert(const Reality: Boolean; const Description: string); overload;

type
{--------------------------------
  �����ݵ����ɺ������־��

  Content����־���ݡ�

  Append������һ����־��

  AssignToStrs������־��ֵ��һ��TStrings������ָ�������������ֻ��ֵ��־�ĺ���һ���֡�
  SaveToFile������־���浽�ļ���

  BindToStrs������־�󶨵�һ��TStrings��
  BindToFile������־�󶨵�һ���ļ���
  BindToMemo������־�󶨵�һ��cxMemo��
  Sync����������־ͬ�������а󶨵Ķ���
  MaxStrsLines��ͬ����TStringsʱ��ͬ�������������
  MaxMemoLines��ͬ����cxMemoʱ��ͬ�������������

  Tested in TestUnit.
 --------------------------------}
  mnTLog = class
  private
    FContent: mnTStrList;
    FMaxStrsLines: Integer;
    FMaxMemoLines: Integer;
  public
    property Content: mnTStrList read FContent;
    property MaxStrsLines: Integer read FMaxStrsLines write FMaxStrsLines;
    property MaxMemoLines: Integer read FMaxMemoLines write FMaxMemoLines;
  private
    BindedStrs: TStrings;
    BindedFileName: string;
    BindedMemo: TcxMemo;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Append(const Text: string); overload;
    procedure Append(const Text: string; const Args: array of const); overload;

    procedure AssignToStrs(const Strs: TStrings; const MaxLines: Integer = 0);
    procedure SaveToFile(const FileName: string);

    procedure BindToStrs(const Strs: TStrings);
    procedure BindToFile(const FileName: string);
    procedure BindToMemo(const Memo: TcxMemo);
    procedure Sync;
  end;

implementation

uses mnResStrsU, Windows, mnTPL, Forms, Messages;

procedure mnNeverGoesHere; overload;
begin
  mnCreateError(ENeverGoesHereException, SGoesToNeverGoesHere);
end;

procedure mnAssert(const Reality: Boolean); overload;
begin
{$IFDEF MN_DEBUG}
  mnCreateErrorIf(not Reality, SAssertionFailed);
{$ENDIF}
end;

procedure mnAssert(const Reality: Boolean; const Description: string); overload;
begin
{$IFDEF MN_DEBUG}
  mnCreateErrorIf(not Reality, SAssertionFailedWithDesc, [Description]);
{$ENDIF}
end;

{ mnTLog }

constructor mnTLog.Create;
begin
  FContent := mnTStrList.Create;
  FMaxStrsLines := 0;
  FMaxMemoLines := 0;

  BindedStrs := nil;
  BindedFileName := '';
  BindedMemo := nil;
end;

destructor mnTLog.Destroy;
begin
  FContent.Free;
  inherited;
end;

procedure mnTLog.Append(const Text: string);
begin
  FContent.Append(Text);
end;

procedure mnTLog.Append(const Text: string; const Args: array of const);
begin
  FContent.Append(Format(Text, Args));
end;

procedure mnTLog.AssignToStrs(const Strs: TStrings; const MaxLines: Integer = 0);
var
  i: Integer;
  Index: Integer;
begin
  if MaxLines = 0 then
    Strs.Assign(FContent)
  else
  begin
    Strs.Clear;
    for i := 0 to MaxLines-1 do
    begin
      Index := FContent.Count - MaxLines + i;
      if mnBetweenII(Index, 0, FContent.Count-1) then
        Strs.Append(FContent[Index]);
    end;
  end;
end;

procedure mnTLog.SaveToFile(const FileName: string);
begin
  FContent.SaveToFile(FileName);
end;

procedure mnTLog.BindToStrs(const Strs: TStrings);
begin
  BindedStrs := Strs;
end;

procedure mnTLog.BindToFile(const FileName: string);
begin
  BindedFileName := FileName;
end;

procedure mnTLog.BindToMemo(const Memo: TcxMemo);
begin
  BindedMemo := Memo;
end;

procedure mnTLog.Sync;
begin
  if Assigned(BindedStrs) then AssignToStrs(BindedStrs, FMaxStrsLines);
  if BindedFileName <> '' then SaveToFile(BindedFileName);
  if Assigned(BindedMemo) then
  begin
    SendMessage(BindedMemo.Handle, WM_SETREDRAW, 0, 0);
    AssignToStrs(BindedMemo.Lines, FMaxMemoLines);
    SendMessage(BindedMemo.Handle, WM_SETREDRAW, 1, 0);
    RedrawWindow(BindedMemo.Handle, nil, 0, RDW_INVALIDATE or RDW_ALLCHILDREN);
    BindedMemo.SetSelection(Length(BindedMemo.Text), 0);
    mnScrollToEnd(BindedMemo);
    Application.ProcessMessages;
  end;
end;

end.
