unit mnDebug;

interface

uses SysUtils;

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
