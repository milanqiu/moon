unit mnResStrsC;

interface

resourcestring

{$IFDEF MN_CHINESE}

  // in mnDateRange
  SCustom = '自定义范围';
  SToday = '本日';
  SThisWeek = '本周';
  SThisMonth = '本月';
  SThisQuarter = '本季度';
  SThisYear = '本年';
  SYesterday = '上日';
  SLastWeek = '上周';
  SLastMonth = '上月';
  SLastQuarter = '上季度';
  SLastYear = '上年';
  SLatest7Days = '之前7日';
  SLatest1Month = '之前1月';
  SLatest3Months = '之前3月';
  SLatest12Months = '之前12月';
  SSoFarThisWeek = '本周至今';
  SSoFarThisMonth = '本月至今';
  SSoFarThisQuarter = '本季度至今';
  SSoFarThisYear = '本年至今';

{$ELSE}

  // in mnDateRange
  SCustom = 'Custom';
  SToday = 'Today';
  SThisWeek = 'This Week';
  SThisMonth = 'This Month';
  SThisQuarter = 'This Quarter';
  SThisYear = 'This Year';
  SYesterday = 'Yesterday';
  SLastWeek = 'Last Week';
  SLastMonth = 'Last Month';
  SLastQuarter = 'Last Quarter';
  SLastYear = 'Last Year';
  SLatest7Days = 'Latest 7 Days';
  SLatest1Month = 'Latest 1 Month';
  SLatest3Months = 'Latest 3 Months';
  SLatest12Months = 'Latest 12 Months';
  SSoFarThisWeek = 'So Far This Week';
  SSoFarThisMonth = 'So Far This Month';
  SSoFarThisQuarter = 'So Far This Quarter';
  SSoFarThisYear = 'So Far This Year';

{$ENDIF}

const
  SDateRangeTexts: array [0..18] of string = (
    SCustom,
    SToday, SThisWeek, SThisMonth, SThisQuarter, SThisYear,
    SYesterday, SLastWeek, SLastMonth, SLastQuarter, SLastYear,
    SLatest7Days, SLatest1Month, SLatest3Months, SLatest12Months,
    SSoFarThisWeek, SSoFarThisMonth, SSoFarThisQuarter, SSoFarThisYear);

implementation

end.
