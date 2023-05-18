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
  SFromDateEditNotAssigned = 'FromDateEditû������';
  SToDateEditNotAssigned = 'ToDateEditû������';

  // in mnWaitDialog
  SDefaultWaitDialogCaption = 'WaitDialog';
  SDefaultWaitDialogPrompt = '��ȴ�...';
  SDefaultMsgConfirmCancel = 'ȷ��ȡ����';
  SDefaultMsgCancelled = '�Ի����ѱ�ȡ��';
  SShowVisibleWaitDialog = '������ʾһ���ɼ���WaitDialog';
  SCloseInvisibleWaitDialog = '���Թر�һ�����ɼ���WaitDialog';
  SChangeHasGaugeWhenVisible = '��WaitDialog�ɼ�ʱ�����ܸı�HasGauge����';
  SChangeCanCancelWhenVisible = '��WaitDialog�ɼ�ʱ�����ܸı�CanCancel����';

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
  SFromDateEditNotAssigned = 'FromDateEdit not assigned';
  SToDateEditNotAssigned = 'ToDateEdit not assigned';

  // in mnWaitDialog
  SDefaultWaitDialogCaption = 'WaitDialog';
  SDefaultWaitDialogPrompt = 'Please wait...';
  SDefaultMsgConfirmCancel = 'Confirm to cancel?';
  SDefaultMsgCancelled = 'Dialog has been cancelled';
  SShowVisibleWaitDialog = 'Try to show a visible WaitDialog';
  SCloseInvisibleWaitDialog = 'Try to close an invisible WaitDialog';
  SChangeHasGaugeWhenVisible = 'Can''t change HasGauge property when WaitDialog is visible';
  SChangeCanCancelWhenVisible = 'Can''t change CanCancel property when WaitDialog is visible';

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
