unit mnSQLTestCase;
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
  TmnSQLTestCase = class(TTestCase)
  strict private
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
  end;

implementation

uses mnSQL;

{ TmnSQLTestCase }

procedure TmnSQLTestCase.SetUp;
begin
end;

procedure TmnSQLTestCase.TearDown;
begin
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TmnSQLTestCase.Suite);
end.