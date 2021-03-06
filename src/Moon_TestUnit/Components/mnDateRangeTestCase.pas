unit mnDateRangeTestCase;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit
  being tested.

}

interface

uses
  TestFramework, mnDateRange, cxCalendar;

type
  TmnDateRangeTestCase = class(TTestCase)
  strict private
    DateRange: mnTDateRange;
    FromDateEdit: TcxDateEdit;
    ToDateEdit: TcxDateEdit;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure testCreate;
    procedure testFromToDate;
    procedure testSelectedKind;
    procedure testOptionsKinds;
  end;

implementation

uses DateUtils, UTestConsts;

{ TmnDateRangeTestCase }

procedure TmnDateRangeTestCase.SetUp;
begin
  DateRange := mnTDateRange.Create(nil);
  FromDateEdit := TcxDateEdit.Create(nil);
  ToDateEdit := TcxDateEdit.Create(nil);

  DateRange.FromDateEdit := FromDateEdit;
  DateRange.ToDateEdit := ToDateEdit;
end;

procedure TmnDateRangeTestCase.TearDown;
begin
  DateRange.Free;
  FromDateEdit.Free;
  ToDateEdit.Free;
end;

procedure TmnDateRangeTestCase.testCreate;
begin
  Check(True);
end;

procedure TmnDateRangeTestCase.testFromToDate;
begin
  DateRange.SelectedKind := drkToday;
  Check(DateRange.FromDate = Today);
  Check(DateRange.ToDate = Today);
  Check(FromDateEdit.Date = Today);
  Check(ToDateEdit.Date = Today);

  DateRange.FromDate := DT_0;
  DateRange.ToDate := DT_1;
  Check(DateRange.FromDate = DT_0);
  Check(DateRange.ToDate = DT_1);
  Check(DateRange.SelectedKind = drkCustom);
  Check(FromDateEdit.Date = DT_0);
  Check(ToDateEdit.Date = DT_1);
end;

procedure TmnDateRangeTestCase.testSelectedKind;
begin
  DateRange.SelectedKind := drkSoFarThisYear;
  Check(DateRange.SelectedKind = drkSoFarThisYear);
end;

procedure TmnDateRangeTestCase.testOptionsKinds;
begin
  DateRange.OptionsKinds := [drkCustom, drkSoFarThisYear];
  DateRange.SelectedKind := drkSoFarThisYear;
  Check(DateRange.FromDate = StartOfTheYear(Today));
  Check(DateRange.ToDate = Today);
  Check(FromDateEdit.Date = StartOfTheYear(Today));
  Check(ToDateEdit.Date = Today);
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TmnDateRangeTestCase.Suite);
end.