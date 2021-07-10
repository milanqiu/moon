unit mnResStrsU;

interface

resourcestring

{$IFDEF MN_CHINESE}

  // common
  SOK = 'ȷ��';
  SCancel = 'ȡ��';
  SSave = '����';
  SCheckAll = 'ȫѡ';
  SCheckNone = 'ȫ�����';

  // in mnArray
  SArrayCopySrcIndexError = 'mnArrayCopy��Դ��������Խ��: %d���ܳ��ȣ�%d��';
  SArrayCopyDstIndexError = 'mnArrayCopy��Ŀ����������Խ��: %d���ܳ��ȣ�%d��';
  SArrayInsertIndexError = 'mnArrayInsert����Խ��: %d���ܳ��ȣ�%d��';
  SArrayDeleteIndexError = 'mnArrayDelete����Խ��: %d���ܳ��ȣ�%d��';
  SArrayTooShort = '����̫�̣�װ����ת�����variant array��%d < %d';
  SVANotDim1 = 'Variant array����һά��';
  SVANotDim2 = 'Variant array���Ƕ�ά��';
  SVANotContainRangeDim2 = 'Variant array[%d, %d, %d, %d]���ܰ�����Χ[%d, %d, %d, %d]';

  // in mnChinese
  SDigitNotIn0To9 = '���ֱ�����0-9�е�һ��: %d';
  SWrongWanYiStrFormat = 'WanYi�ַ���ȴ����''��''��''��''��β: %s';

  // in mnCOM
  SExcelFileNameNotAssigned = 'Excel�ļ���δ��ֵ����ʹ��SaveAs';
  SExcelBookNotAssigned = 'ExcelBookδ��ֵ�������New��Open';
  SSheetIndexError = '����������Խ��: %d���ܳ��ȣ�%d��';
  SAtLeastOneSheet = '����������һ��������';
  SArrayTooShortForExcelRange = '����̫�̣�װ����Excel��Χ�ڵ�����Ԫ��';
  SWordFileNameNotAssigned = 'Word�ļ���δ��ֵ����ʹ��SaveAs';

  // in mnControl
  SErrorMsgNotEmpty = '%s����Ϊ��';
  SErrorMsgNotEmptyAbs = '%s����Ϊ�գ�Ҳ����ȫΪ�ո�';
  SErrorMsgIsInt = '%s����������';
  SErrorMsgIsFloat = '%s�����Ǹ�����';
  SErrorMsgIsDT = '%s��������Ч��ʱ��';
  SErrorMsgIsCurr = '%s��������Ч�Ļ���';
  SErrorMsgNE0 = '%s���ܵ���0';
  SErrorMsgLT0 = '%s����С��0';
  SErrorMsgLE0 = '%s����С�ڻ����0';
  SErrorMsgGT0 = '%s�������0';
  SErrorMsgGE0 = '%s������ڻ����0';
  SErrorMsgSelected = '��ѡ��%s';

  // in mnDateTime
  SIllegalYear = '�Ƿ������: %d';
  SIllegalMonth = '�Ƿ����·�: %d';
  SDateToLunarOutOfRange = 'mnDateToLunar�У���ת���Ĺ������ڳ�����Χ';
  SLunarToDateOutOfRange = 'mnLunarToDate�У���ת����ũ�����ڳ�����Χ';

  // in mnDB
  SReleaseActiveDataSet = '�����ͷ�һ��������ݼ�';
  SReleaseWildDataSet = '�����ͷ�һ��Ұ���ݼ�: %s';
  SUsedDBNotAssigned = 'mnUsedDBû�и�ֵ';
  SIllegalTableJoinStyle = '�Ƿ��ı����ӷ�ʽ';
  STableListIndexError = 'mnTTableList����Խ��';
  SMatchEditNotSupported = 'MatchEdit����֧��'#13#10'����: %s ��: %s';
  SIllegalItemClass = '�Ƿ���mnTFieldFilterCombination��: %s';
  SPKNameNotFound = '������û���ҵ�: %s';
  SFieldSchemaNotMatch = '�ֶνṹ��ƥ�����ݼ�';
  SIllegalTableSchemaType = '�Ƿ���TableSchemaType';

  // in mnDebug
  SGoesToNeverGoesHere = '�������е�һ��NeverGoesHere��';
  SAssertionFailed = '����ʧ��';
  SAssertionFailedWithDesc = '����ʧ�ܣ�%s';

  // in mnDialog
  SShouldBeCorrect = 'ʵ��ֵ: %s (��ȷ)';
  SShouldBeWrong = 'ʵ��ֵ: %s (Ӧ����%s)';
  SSaveSuccessfully = '�ɹ�����';
  SDialogFilterAll = '�����ļ�(*.*)|*.*';
  SDialogFilterText = '�ı��ļ�(*.txt)|*.txt';
  SDialogFilterExcel = 'Excel�ļ�(*.xls;*.xlsx)|*.xls;*.xlsx';
  SDialogFilterWord = 'Word�ļ�(*.doc;*.docx)|*.doc;*.docx';
  SDialogFilterXML = 'XML�ļ�(*.xml)|*.xml';

  // in mnFile
  SFileNotExists = '�ļ�������: %s';

  // in mnGraphics
  SDrawingCanvasNotAssigned = 'DrawingCanvasû�и�ֵ';
  SGraphicListIndexError = 'mnTGraphicList�����ڲ�ͼ��ʱ����Խ��: %d���ܳ��ȣ�%d��';
  SPixeledImageNameNotFound = 'û����mnTPixeledImageList���ҵ�����';

  // in mnMath
  SSectionsTooShort = 'Sections̫���ˣ�װ����Ordinal';

  // in mnNetwork
  SHTTPThreadTerminated = 'HTTP�̱߳���ֹ';

  // in mnSQL
  SCompareDTNotSupportExcel = 'Excel���ݿⲻ֧��mnSQLCompareDT';

  // in mnString
  SAnsiPosOffsetOnTrailByte = '�ڳ��Ե���mnAnsiPosExʱ����ʼλ����һ��β�ֽ���: ��ʼλ�ã�%d �ַ�����%s';
  STruncMiddleIndexError = 'mnTruncMiddle����Խ��: %d���ܳ��ȣ�%d��';
  STruncBMiddleIndexError = 'mnTruncBMiddle����Խ��: %d���ܳ��ȣ�%d��';
  SSplitWithoutBorder = '���ָ���ַ���û�д���: %s';
  SSplittedLenNegative = '�ָ�ȱ�����������: %d';
  SContinuousTwoParams = '��������������: %s';

  // in mnSystem
  SIllegalRelationOp = '�Ƿ��Ĺ�ϵ�����';
  SWrongPercentStrTail = '���ٷֺŵ��ַ���û����"%%"��β: %s';
  SIllegalLLStrForInt = '�Ƿ�������������LL�ķ��ַ���: %s';
  SIllegalLLStrForFloat = '�Ƿ������ڸ�������LL�ķ��ַ���: %s';
  SIllegalStrConstraint = '�Ƿ����ַ���Լ��';
  SMethodNotFound = '����"%s"���Ƕ���"%s"��һ��published��Ա';
  STryToAddDuplicateItem = '������TypeList�����һ���ظ���Ա: %s';
  SArrayTooShortForList = '����̫�̣��޷�װ��TypeList������Ԫ��';
  SMakeStatOnEmptyList = '���Զ�һ�����б����ͳ��';
  SWrongBOM = '�����BOM';
  SIllegalTimeUnit = '�Ƿ���ʱ�䵥λ';
  SCoordinatesTableColumnIndexError = 'mnTCoordinatesTable�е�����Խ��: %d���ܳ��ȣ�%d��';
  SCoordinatesTableRowIndexError = 'mnTCoordinatesTable�е�����Խ��: %d���ܳ��ȣ�%d��';
  SIllegalExternalCommandExecutionResult = '�Ƿ����ⲿ����ִ�н��';
  SExternalCommandExecutionException = '�ⲿ����ִ�г����쳣��';
  SExternalCommandExecutionHalted = '�ⲿ����ִ����ֹ��';
  SExternalCommandExecutionFreezed = '�ⲿ����ִ�ж��᣺';
  SAbnormalExternalCommandAnnouncementFile = '�ⲿ����������ļ�û����������';

  // in mnTPC
  SItemPrecisionShoudBeNumeric = 'SetItemPrecisionֻ������TcxCalcEditProperties��TcxCurrencyEditProperties';

  // in mnWindows
  SShutdownPrivilegeError = '���ùػ�Ȩ��ʱ����';
  SWindowNotExists = '���ڲ�����';

{$ELSE}

  // common
  SOK = 'OK';
  SCancel = 'Cancel';
  SSave = 'Save';
  SCheckAll = 'Check All';
  SCheckNone = 'Check None';

  // in mnArray
  SArrayCopySrcIndexError = 'mnArrayCopy source index out of bounds: %d of length %d';
  SArrayCopyDstIndexError = 'mnArrayCopy destination index out of bounds: %d of length %d';
  SArrayInsertIndexError = 'mnArrayInsert index out of bounds: %d of length %d';
  SArrayDeleteIndexError = 'mnArrayDelete index out of bounds: %d of length %d';
  SArrayTooShort = 'Array is too short to hold converted variant array: %d < %d';
  SVANotDim1 = 'Variant array is not one-dimensional';
  SVANotDim2 = 'Variant array is not two-dimensional';
  SVANotContainRangeDim2 = 'Variant array[%d, %d, %d, %d] can''t contain range[%d, %d, %d, %d]';

  // in mnChinese
  SDigitNotIn0To9 = 'Digit must be in 0-9: %d';
  SWrongWanYiStrFormat = 'WanYi string doesn''t end with ''��'' or ''��'': %s';

  // in mnCOM
  SExcelFileNameNotAssigned = 'Excel file name not assigned. Please use SaveAs';
  SExcelBookNotAssigned = 'ExcelBook not assigned. Please call New or Open';
  SSheetIndexError = 'Work sheet index out of bounds: %d of length %d';
  SAtLeastOneSheet = 'Must have at least one work sheet';
  SArrayTooShortForExcelRange = 'Array is too short to hold all elements of excel range';
  SWordFileNameNotAssigned = 'Word file name not assigned. Please use SaveAs';

  // in mnControl
  SErrorMsgNotEmpty = '%s must not be empty';
  SErrorMsgNotEmptyAbs = '%s must not be empty or space-only';
  SErrorMsgIsInt = '%s must be an integer';
  SErrorMsgIsFloat = '%s must be a float';
  SErrorMsgIsDT = '%s must be a valid datetime';
  SErrorMsgIsCurr = '%s must be a valid currency';
  SErrorMsgNE0 = '%s must not be equal to 0';
  SErrorMsgLT0 = '%s must be less than 0';
  SErrorMsgLE0 = '%s must be less than or equal to 0';
  SErrorMsgGT0 = '%s must be greater than 0';
  SErrorMsgGE0 = '%s must be greater than or equal to 0';
  SErrorMsgSelected = '%s must be selected';

  // in mnDateTime
  SIllegalYear = 'Illegal year: %d';
  SIllegalMonth = 'Illegal month: %d';
  SDateToLunarOutOfRange = 'mnDateToLunar out of range';
  SLunarToDateOutOfRange = 'mnLunarToDate out of range';

  // in mnDB
  SReleaseActiveDataSet = 'Try to release an active dataset';
  SReleaseWildDataSet = 'Try to release a wild dataset: %s';
  SUsedDBNotAssigned = 'mnUsedDB not assigned';
  SIllegalTableJoinStyle = 'Illegal table join style';
  STableListIndexError = 'mnTTableList index out of bounds';
  SMatchEditNotSupported = 'MatchEdit not supported'#13#10'Name: %s Class: %s';
  SIllegalItemClass = 'Illegal item class of mnTFieldFilterCombination: %s';
  SPKNameNotFound = 'Primary key name not found: %s';
  SFieldSchemaNotMatch = 'Field schema doesn''t match dataset';
  SIllegalTableSchemaType = 'Illegal TableSchemaType';

  // in mnDebug
  SGoesToNeverGoesHere = 'Goes to a NeverGoesHere point';
  SAssertionFailed = 'Assertion failed';
  SAssertionFailedWithDesc = 'Assertion failed: %s';

  // in mnDialog
  SShouldBeCorrect = 'Actual: %s (correct)';
  SShouldBeWrong = 'Actual: %s (should be %s)';
  SSaveSuccessfully = 'Save successfully';
  SDialogFilterAll = 'All Files(*.*)|*.*';
  SDialogFilterText = 'Text Files(*.txt)|*.txt';
  SDialogFilterExcel = 'Excel Files(*.xls;*.xlsx)|*.xls;*.xlsx';
  SDialogFilterWord = 'Word Files(*.doc;*.docx)|*.doc;*.docx';
  SDialogFilterXML = 'XML Files(*.xml)|*.xml';

  // in mnFile
  SFileNotExists = 'File does not exist: %s';

  // in mnGraphics
  SDrawingCanvasNotAssigned = 'DrawingCanvas not assigned';
  SGraphicListIndexError = 'mnTGraphicList index out of bounds: %d of length %d';
  SPixeledImageNameNotFound = 'Name not found in mnTPixeledImageList';

  // in mnMath
  SSectionsTooShort = 'Sections is too short for Ordinal';

  // in mnNetwork
  SHTTPThreadTerminated = 'HTTP thread terminated';

  // in mnSQL
  SCompareDTNotSupportExcel = 'mnSQLCompareDT is not supported by Excel database';

  // in mnString
  SAnsiPosOffsetOnTrailByte = 'Try to call mnAnsiPosEx with offset on a trail byte: %d of %s';
  STruncMiddleIndexError = 'mnTruncMiddle index out of bounds: %d of length %d';
  STruncBMiddleIndexError = 'mnTruncBMiddle index out of bounds: %d of length %d';
  SSplitWithoutBorder = 'No border in the splitted string: %s';
  SSplittedLenNegative = 'Splitted length should be a positive integer: %d';
  SContinuousTwoParams = 'Continuous two parameters: %s';

  // in mnSystem
  SIllegalRelationOp = 'Illegal relation operator';
  SWrongPercentStrTail = 'Percent string doesn''t end with "%%": %s';
  SIllegalLLStrForInt = 'Illegal LL grammar string for integer: %s';
  SIllegalLLStrForFloat = 'Illegal LL grammar string for float: %s';
  SIllegalStrConstraint = 'Illegal string constraint';
  SMethodNotFound = 'Name "%s" does not specify a published method for the object "%s"';
  STryToAddDuplicateItem = 'Try to add a duplicate item into TypeList: %s';
  SArrayTooShortForList = 'Array is too short to hold all elements of TypeList';
  SMakeStatOnEmptyList = 'Try to make statistics on an empty list';
  SWrongBOM = 'Wrong BOM';
  SIllegalTimeUnit = 'Illegal time unit';
  SCoordinatesTableColumnIndexError = 'mnTCoordinatesTable column index out of bounds: %d of length %d';
  SCoordinatesTableRowIndexError = 'mnTCoordinatesTable row index out of bounds: %d of length %d';
  SIllegalExternalCommandExecutionResult = 'Illegal external command execution result';
  SExternalCommandExecutionException = 'Execution with exception:';
  SExternalCommandExecutionHalted = 'Execution halted:';
  SExternalCommandExecutionFreezed = 'Execution freezed:';
  SAbnormalExternalCommandAnnouncementFile = 'Abnormal announcement file of external command';

  // in mnTPC
  SItemPrecisionShoudBeNumeric = 'SetItemPrecision should be used only on TcxCalcEditProperties or TcxCurrencyEditProperties';

  // in mnWindows
  SShutdownPrivilegeError = 'Error in setting shutdown privilege';
  SWindowNotExists = 'Window does not exist';

{$ENDIF}

implementation

end.
