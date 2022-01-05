unit mnTPLTestCase;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit
  being tested.

}

interface

uses
  TestFramework;

type
  TmnTPLTestCase = class(TTestCase)
  strict private
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure testParseJsonToStrArray;
  end;

implementation

uses mnTPL, mnSystem, mnDebug;

{ TmnTPLTestCase }

procedure TmnTPLTestCase.SetUp;
begin
end;

procedure TmnTPLTestCase.TearDown;
begin
end;

procedure TmnTPLTestCase.testParseJsonToStrArray;
var
  Arr: mnTStrArray;
begin
  Arr := mnParseJsonToStrArray('["aaa", bbb, 111]');
  CheckEquals(Length(Arr), 3);
  CheckEquals(Arr[0], 'aaa');
  CheckEquals(Arr[1], 'bbb');
  CheckEquals(Arr[2], '111');

  Arr := mnParseJsonToStrArray('[]');
  CheckEquals(Length(Arr), 0);

  try
    Arr := mnParseJsonToStrArray('["aaa"');
    mnNeverGoesHere;
  except
  end;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TmnTPLTestCase.Suite);
end.