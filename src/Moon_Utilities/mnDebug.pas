unit mnDebug;

interface

uses SysUtils;

type
{--------------------------------
  NeverGoesHere异常类型。
 --------------------------------}
  ENeverGoesHereException = class(Exception);

{--------------------------------
  抛出一个NeverGoesHere异常。
  通常放在程序逻辑上不会运行到的地方。如果运行时这个函数被调用，表示程序运行出错了。
  Tested in TestUnit.
 --------------------------------}
procedure mnNeverGoesHere;

{--------------------------------
  断言一件事实。
  注意：只在项目的预编译定义包含MN_DEBUG时执行。
  Tested in TestUnit.
 --------------------------------}
procedure mnAssert(const Reality: Boolean); overload;
procedure mnAssert(const Reality: Boolean; const Description: string); overload;

implementation

uses mnSystem, mnResStrsU;

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

end.
