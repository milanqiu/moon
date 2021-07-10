unit mnResStrsU;

interface

resourcestring

{$IFDEF MN_CHINESE}

  // common
  SOK = '确定';
  SCancel = '取消';
  SSave = '保存';
  SCheckAll = '全选';
  SCheckNone = '全部清除';

  // in mnArray
  SArrayCopySrcIndexError = 'mnArrayCopy的源数组索引越界: %d（总长度：%d）';
  SArrayCopyDstIndexError = 'mnArrayCopy的目标数组索引越界: %d（总长度：%d）';
  SArrayInsertIndexError = 'mnArrayInsert索引越界: %d（总长度：%d）';
  SArrayDeleteIndexError = 'mnArrayDelete索引越界: %d（总长度：%d）';
  SArrayTooShort = '数组太短，装不下转换后的variant array：%d < %d';
  SVANotDim1 = 'Variant array不是一维的';
  SVANotDim2 = 'Variant array不是二维的';
  SVANotContainRangeDim2 = 'Variant array[%d, %d, %d, %d]不能包含范围[%d, %d, %d, %d]';

  // in mnChinese
  SDigitNotIn0To9 = '数字必须是0-9中的一个: %d';
  SWrongWanYiStrFormat = 'WanYi字符串却不以''万''或''亿''结尾: %s';

  // in mnCOM
  SExcelFileNameNotAssigned = 'Excel文件名未赋值。请使用SaveAs';
  SExcelBookNotAssigned = 'ExcelBook未赋值。请调用New或Open';
  SSheetIndexError = '工作表索引越界: %d（总长度：%d）';
  SAtLeastOneSheet = '必须至少有一个工作表';
  SArrayTooShortForExcelRange = '数组太短，装不下Excel范围内的所有元素';
  SWordFileNameNotAssigned = 'Word文件名未赋值。请使用SaveAs';

  // in mnControl
  SErrorMsgNotEmpty = '%s不能为空';
  SErrorMsgNotEmptyAbs = '%s不能为空，也不能全为空格';
  SErrorMsgIsInt = '%s必须是整数';
  SErrorMsgIsFloat = '%s必须是浮点数';
  SErrorMsgIsDT = '%s必须是有效的时间';
  SErrorMsgIsCurr = '%s必须是有效的货币';
  SErrorMsgNE0 = '%s不能等于0';
  SErrorMsgLT0 = '%s必须小于0';
  SErrorMsgLE0 = '%s必须小于或等于0';
  SErrorMsgGT0 = '%s必须大于0';
  SErrorMsgGE0 = '%s必须大于或等于0';
  SErrorMsgSelected = '请选择%s';

  // in mnDateTime
  SIllegalYear = '非法的年份: %d';
  SIllegalMonth = '非法的月份: %d';
  SDateToLunarOutOfRange = 'mnDateToLunar中，需转换的公历日期超出范围';
  SLunarToDateOutOfRange = 'mnLunarToDate中，需转换的农历日期超出范围';

  // in mnDB
  SReleaseActiveDataSet = '尝试释放一个活动的数据集';
  SReleaseWildDataSet = '尝试释放一个野数据集: %s';
  SUsedDBNotAssigned = 'mnUsedDB没有赋值';
  SIllegalTableJoinStyle = '非法的表连接方式';
  STableListIndexError = 'mnTTableList索引越界';
  SMatchEditNotSupported = 'MatchEdit不被支持'#13#10'名称: %s 类: %s';
  SIllegalItemClass = '非法的mnTFieldFilterCombination类: %s';
  SPKNameNotFound = '主键名没有找到: %s';
  SFieldSchemaNotMatch = '字段结构不匹配数据集';
  SIllegalTableSchemaType = '非法的TableSchemaType';

  // in mnDebug
  SGoesToNeverGoesHere = '程序运行到一个NeverGoesHere点';
  SAssertionFailed = '断言失败';
  SAssertionFailedWithDesc = '断言失败：%s';

  // in mnDialog
  SShouldBeCorrect = '实际值: %s (正确)';
  SShouldBeWrong = '实际值: %s (应当是%s)';
  SSaveSuccessfully = '成功保存';
  SDialogFilterAll = '所有文件(*.*)|*.*';
  SDialogFilterText = '文本文件(*.txt)|*.txt';
  SDialogFilterExcel = 'Excel文件(*.xls;*.xlsx)|*.xls;*.xlsx';
  SDialogFilterWord = 'Word文件(*.doc;*.docx)|*.doc;*.docx';
  SDialogFilterXML = 'XML文件(*.xml)|*.xml';

  // in mnFile
  SFileNotExists = '文件不存在: %s';

  // in mnGraphics
  SDrawingCanvasNotAssigned = 'DrawingCanvas没有赋值';
  SGraphicListIndexError = 'mnTGraphicList访问内部图像时索引越界: %d（总长度：%d）';
  SPixeledImageNameNotFound = '没有在mnTPixeledImageList里找到名称';

  // in mnMath
  SSectionsTooShort = 'Sections太短了，装不下Ordinal';

  // in mnNetwork
  SHTTPThreadTerminated = 'HTTP线程被终止';

  // in mnSQL
  SCompareDTNotSupportExcel = 'Excel数据库不支持mnSQLCompareDT';

  // in mnString
  SAnsiPosOffsetOnTrailByte = '在尝试调用mnAnsiPosEx时，起始位置在一个尾字节上: 起始位置：%d 字符串：%s';
  STruncMiddleIndexError = 'mnTruncMiddle索引越界: %d（总长度：%d）';
  STruncBMiddleIndexError = 'mnTruncBMiddle索引越界: %d（总长度：%d）';
  SSplitWithoutBorder = '被分割的字符串没有带边: %s';
  SSplittedLenNegative = '分割长度必须是正整数: %d';
  SContinuousTwoParams = '连续的两个参数: %s';

  // in mnSystem
  SIllegalRelationOp = '非法的关系运算符';
  SWrongPercentStrTail = '带百分号的字符串没有以"%%"结尾: %s';
  SIllegalLLStrForInt = '非法的用于整数的LL文法字符串: %s';
  SIllegalLLStrForFloat = '非法的用于浮点数的LL文法字符串: %s';
  SIllegalStrConstraint = '非法的字符串约束';
  SMethodNotFound = '名字"%s"不是对象"%s"的一个published成员';
  STryToAddDuplicateItem = '尝试往TypeList里添加一个重复成员: %s';
  SArrayTooShortForList = '数组太短，无法装载TypeList的所有元素';
  SMakeStatOnEmptyList = '尝试对一个空列表进行统计';
  SWrongBOM = '错误的BOM';
  SIllegalTimeUnit = '非法的时间单位';
  SCoordinatesTableColumnIndexError = 'mnTCoordinatesTable列的索引越界: %d（总长度：%d）';
  SCoordinatesTableRowIndexError = 'mnTCoordinatesTable行的索引越界: %d（总长度：%d）';
  SIllegalExternalCommandExecutionResult = '非法的外部命令执行结果';
  SExternalCommandExecutionException = '外部命令执行出现异常：';
  SExternalCommandExecutionHalted = '外部命令执行中止：';
  SExternalCommandExecutionFreezed = '外部命令执行冻结：';
  SAbnormalExternalCommandAnnouncementFile = '外部命令的宣告文件没有正常生成';

  // in mnTPC
  SItemPrecisionShoudBeNumeric = 'SetItemPrecision只能用于TcxCalcEditProperties或TcxCurrencyEditProperties';

  // in mnWindows
  SShutdownPrivilegeError = '设置关机权限时出错';
  SWindowNotExists = '窗口不存在';

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
  SWrongWanYiStrFormat = 'WanYi string doesn''t end with ''万'' or ''亿'': %s';

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
