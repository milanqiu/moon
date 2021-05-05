unit mnResStrsC;

interface

resourcestring

{$IFDEF MN_CHINESE}

  // in mnDateRange
  SCustom = '�Զ��巶Χ';
  SToday = '����';
  SThisWeek = '����';
  SThisMonth = '����';
  SThisQuarter = '������';
  SThisYear = '����';
  SYesterday = '����';
  SLastWeek = '����';
  SLastMonth = '����';
  SLastQuarter = '�ϼ���';
  SLastYear = '����';
  SLatest7Days = '֮ǰ7��';
  SLatest1Month = '֮ǰ1��';
  SLatest3Months = '֮ǰ3��';
  SLatest12Months = '֮ǰ12��';
  SSoFarThisWeek = '��������';
  SSoFarThisMonth = '��������';
  SSoFarThisQuarter = '����������';
  SSoFarThisYear = '��������';

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
