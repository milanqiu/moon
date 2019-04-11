unit mnCOM;

{--------------------------------
  ����Ԫ��initialization�������OleInitialize��OLE���г�ʼ��������õ�ActiveX�ؼ��ĳ��򣬿���use����Ԫ��
 --------------------------------}

interface

uses ActiveX, Graphics, mnSystem, Contnrs;

{--------------------------------
  ��һ��PDispParams�н�����ָ�������Ĳ�����
  No test.����mnTWebBrowser�б���Ӳ��ԣ�
 --------------------------------}
function mnParseDispParam(DispParams: PDispParams; Index: Integer): OleVariant;

{--------------------------------
  ��Ԫ��߿�����ࡣ
 --------------------------------}
type
  XlBordersIndex = TOleEnum;
const
  xlEdgesAll = 0;                 // ���������ĵ��߿�
  xlInsideHorizontal = $0000000C; // ��ʱ����
  xlInsideVertical = $0000000B;   // ��ʱ����
  xlDiagonalDown = $00000005;     // ���ϵ����µĶԽ���
  xlDiagonalUp = $00000006;       // ���µ����ϵĶԽ���
  xlEdgeBottom = $00000009;       // �ױ߿�
  xlEdgeLeft = $00000007;         // ��߿�
  xlEdgeRight = $0000000A;        // �ұ߿�
  xlEdgeTop = $00000008;          // ���߿�

{--------------------------------
  ��Ԫ��߿�Ĵ�ϸ�ȡ�
 --------------------------------}
type
  XlBorderWeight = TOleEnum;
const
  xlHairline = $00000001; // ��ϸ��ʵ������ǳɫ�ĵ���ɵ����ߣ�
  xlMedium = $FFFFEFD6;   // �е�
  xlThick = $00000004;    // ��
  xlThin = $00000002;     // ��������ͨ�߿��ϸ��һ�£�������ʵ�ߣ�

{--------------------------------
  ���͡�
 --------------------------------}
type
  XlLineStyle = TOleEnum;
const
  xlContinuous = $00000001;    // ʵ��
  xlDash = $FFFFEFED;          // ����
  xlDashDot = $00000004;       // ���������
  xlDashDotDot = $00000005;    // �������������
  xlDot = $FFFFEFEA;           // ����ɵ�����
  xlDouble = $FFFFEFE9;        // ˫��ʵ��
  xlSlantDashDot = $0000000D;  // ������б�Ĵ��������
  xlLineStyleNone = $FFFFEFD2; // û����

{--------------------------------
  ���뷽ʽ��
 --------------------------------}
type
  XlALignment = TOleEnum;
const
  xlCenter = $FFFFEFF4; // ��ˮƽ����ֱ���룩�м�
  xlTop = $FFFFEFC0;    // ����ֱ���룩����
  xlBottom = $FFFFEFF5; // ����ֱ���룩�׶�
  xlLeft = $FFFFEFDD;   // ��ˮƽ���룩���
  xlRight = $FFFFEFC8;  // ��ˮƽ���룩�ұ�

{--------------------------------
  ��Excel�ļ����д����һϵ���ࡣ

  mnTExcel�Ǻ����࣬���ڲ�ά����ExcelApp��ExcelBook����COM����ָʾ�����ڴ����ExcelӦ�ó�����ĵ���
  ���ഴ��ʵ��ʱ��������һ���µ�Excel���������Ƿ�����Excel�����У�����������в�����

  mnTExcelGlobal��mnTExcelUsedRange��mnTExcelCell��mnTExcelRow��mnTExcelColumn��mnTExcelRange
  ָʾ��Excel�ģ���ǰSheet�ģ���������
  ���Ǹ�����mnTExcel�����ϣ��ֱ��ʾ���е�Ԫ��ʹ�õ��ľ��η�Χ��ָ����Ԫ��ָ���С�ָ���к�ָ�����η�Χ��
  ������һ����ͬ�Ļ���mnTExcelArea���û�����麯��GetArea���ڵõ����������COM���󣬸�����ֱ�ʵ�֡�

  Tested in TestUnit and TestApp.
 --------------------------------}
type
  mnTExcel = class;

  mnTExcelArea = class
  protected
    // �õ����������COM����
    function GetArea: Variant; virtual; abstract;
  protected
    FParent: mnTExcel;
  public
    // ������������mnTExcel����
    property Parent: mnTExcel read FParent;
  public
    constructor Create(AParent: mnTExcel);
  private
    function GetAnchorRowIndex: Integer;
    function GetAnchorColumnIndex: Integer;
  public
    // �õ��������ê�㣨�����Ͻǵĵ�Ԫ�񣩵���������������
    property AnchorRowIndex: Integer read GetAnchorRowIndex;
    property AnchorColumnIndex: Integer read GetAnchorColumnIndex;
  private
    function GetColumnWidth: Extended;
    procedure SetColumnWidth(const Value: Extended);
    function GetRowHeight: Extended;
    procedure SetRowHeight(const Value: Extended);
  public
    // ��ȡ�����ñ�������п���λ���ַ�����������ȡʱ�������һ�е��п�Ϊ׼
    property ColumnWidth: Extended read GetColumnWidth write SetColumnWidth;
    // ��ȡ�����ñ�������иߣ���λ������1��=0.035���ף�����ȡʱ��������һ�е��и�Ϊ׼
    property RowHeight: Extended read GetRowHeight write SetRowHeight;
  public
    // ���ñ���������е�Ԫ����ı��Զ�����
    procedure SetWrapText(const WrapText: Boolean);
    // �ڱ���������Ͻ�֮ǰ�������ҳ��
    procedure SetPageBreak(const PageBreak: Boolean);
    // ���ñ���������е�Ԫ���ָ����߿�Ĵ�ϸ��
    procedure SetBorderWeight(const BordersIndex: XlBordersIndex = xlEdgesAll; const Weight: XlBorderWeight = xlThin);
    // ���ñ���������е�Ԫ���ָ����߿������
    procedure SetBorderLineStyle(const BordersIndex: XlBordersIndex = xlEdgesAll; const LineStyle: XlLineStyle = xlDash);
    // ���ñ���������е�Ԫ����������ơ���С����ɫ����ʽ
    procedure SetFontName(const FontName: string);
    procedure SetFontSize(const FontSize: Extended);
    procedure SetFontColor(const FontColor: TColor);
    procedure SetFontStyles(const FontStyles: TFontStyles);
    // ���ñ���������е�Ԫ���ˮƽ����ֱ�Ķ��뷽ʽ
    procedure SetHorizontalAlignment(const Alignment: XlALignment);
    procedure SetVerticalAlignment(const Alignment: XlALignment);
    // ���ñ���������е�Ԫ��������ɫ
    procedure SetFillColor(const FillColor: TColor);
  public
    // ��������������
    procedure ClearContents;
    // �����������������ݺ͸�ʽ
    procedure Clear;
    // ���������򵽼�����
    procedure Copy;
    // �Ӽ�����ճ����������
    // ����ĸ��ƺ�ճ���������£�
    //   Global -> Global / UsedRange
    //   Cell -> ������������򣺴�ʱ��Դ��Ԫ������Ŀ����������е�Ԫ��
    //   UsedRange / Range -> ������������򣺴�ʱ��
    //      ��Ŀ������Ŀ�͸߶��ܱ�Դ����Ŀ�͸�������������Ŀ����������е�Ԫ��
    //      ������Ŀ������Ŀ�Ϊ1����ֻ��1�У��������ܱ�Դ����ĸ���������������Դ����ֱ������Ŀ������
    //      ������Ŀ������ĸ�Ϊ1����ֻ��1�У��������ܱ�Դ����Ŀ���������������Դ����ֱ������Ŀ������
    //      ����ֻ��Ŀ����������Ͻ�Ϊê�㣬����һ��������Դ���򣬼�ʹĿ������С��Դ����
    //   Row -> Global / UsedRange / Row
    //   Column -> Global / UsedRange / Column
    // ע�⣺�ڸ��ƺ�Դ����Ͳ��������Ķ��ˣ�����ճ��ʧ��
    // DISABLED IN EXCEL 2010: Cell -> Global, UsedRange / Range -> Global, Row -> Global
    procedure Paste;
    // �ϲ������򡣺ϲ������з��������Ͻǵĵ�Ԫ��Ϊ׼
    procedure Merge;
    // ��ֱ������ԭʼ��Ԫ��
    procedure Unmerge;
    // ���ñ���������е�Ԫ��Ϊ�����ı���ʽ
    // ע�⣺������������ʽ����д�뵥Ԫ�����ݣ���������Excel�ĺ���ת��
    procedure SetFormatToNormal;
  public
    // ����ո񵽱����򣬵���֧��Global
    // �����ԭ�е��������ݽ����ƣ�����������Column�������ƣ�
    // ����أ�����������Row��Column���൱�ڲ���һ�л�һ��
    procedure Insert;
    // ɾ������������е�Ԫ��
    // ɾ����ԭ�е��������ݽ����ƣ�����������Column�������ƣ�
    // ����أ�����������Row��Column���൱��ɾ��һ�л�һ��
    procedure Delete;
  end;

  mnTExcelGlobal = class(mnTExcelArea)
  protected
    function GetArea: Variant; override;
  public
    // ���������и�Ϊ�Զ���Ӧ���ݵĸ߶�
    procedure AutoFitRows;
    // ���������п�Ϊ�Զ���Ӧ���ݵĿ��
    procedure AutoFitColumns;
  end;

  mnTExcelUsedRange = class(mnTExcelArea)
  protected
    function GetArea: Variant; override;
  end;

  mnTExcelCell = class(mnTExcelArea)
  protected
    function GetArea: Variant; override;
  private
    FRowIndex: Integer;
    FColumnIndex: Integer;
  public
    property RowIndex: Integer read FRowIndex;
    property ColumnIndex: Integer read FColumnIndex;
    // �����к��ж�λ��Ԫ��
    procedure Locate(const ARowIndex, AColumnIndex: Integer);
  protected
    function GetValue: Variant;
    function GetAsString: string;
    function GetAsInteger: Integer;
    function GetAsFloat: Extended;
    function GetAsDateTime: TDateTime;
    function GetAsCurrency: Currency;
    procedure SetValue(const AValue: Variant);
    procedure SetAsString(const AValue: string);
    procedure SetAsInteger(const AValue: Integer);
    procedure SetAsFloat(const AValue: Extended);
    procedure SetAsDateTime(const AValue: TDateTime);
    procedure SetAsCurrency(const AValue: Currency);
  public
    // ��Ԫ���ֵ�������Բ�ͬ���Ͷ�д
    property Value: Variant read GetValue write SetValue;
    property AsString: string read GetAsString write SetAsString;
    property AsInteger: Integer read GetAsInteger write SetAsInteger;
    property AsFloat: Extended read GetAsFloat write SetAsFloat;
    property AsDateTime: TDateTime read GetAsDateTime write SetAsDateTime;
    property AsCurrency: Currency read GetAsCurrency write SetAsCurrency;
  public
    // �Ե�Ԫ����Ϊ���Ͻǣ���չ��һƬ��Ӧ�����С�����򣬽���ͬ���͵Ķ�ά���������д�뵽������
    procedure LoadFromArray(const Arr: mnTVarArrayDim2); overload;
    procedure LoadFromArray(const Arr: mnTStrArrayDim2); overload;
    procedure LoadFromArray(const Arr: mnTIntArrayDim2); overload;
  end;

  mnTExcelRow = class(mnTExcelArea)
  protected
    function GetArea: Variant; override;
  private
    FRowIndex: Integer;
  public
    property RowIndex: Integer read FRowIndex;
    // ������������λ��
    procedure Locate(const ARowIndex: Integer);
  public
    // ʹ��������ʽ������ͬ���͵�һά���������д�뵽�е�һ���ֵ�Ԫ���У������ᳬ����д�뵥Ԫ��ķ�Χ
    procedure LoadFromArray(const BeginColumnIndex, EndColumnIndex: Integer; const Arr: array of Variant);   overload;
    procedure LoadFromArray(const BeginColumnIndex, EndColumnIndex: Integer; const Arr: array of string);    overload;
    procedure LoadFromArray(const BeginColumnIndex, EndColumnIndex: Integer; const Arr: array of Integer);   overload;
    procedure LoadFromArray(const BeginColumnIndex, EndColumnIndex: Integer; const Arr: array of Extended);  overload;
    procedure LoadFromArray(const BeginColumnIndex, EndColumnIndex: Integer; const Arr: array of TDateTime); overload;
    procedure LoadFromArray(const BeginColumnIndex, EndColumnIndex: Integer; const Arr: array of Currency);  overload;
    // ���е�һ���ֵ�Ԫ���У��������ݴ��뵽��ͬ���͵�һά��������鳤�ȱ�����ڴ�����Ԫ�������
    procedure SaveToArray(const BeginColumnIndex, EndColumnIndex: Integer; var Arr: array of Variant);   overload;
    procedure SaveToArray(const BeginColumnIndex, EndColumnIndex: Integer; var Arr: array of string);    overload;
    procedure SaveToArray(const BeginColumnIndex, EndColumnIndex: Integer; var Arr: array of Integer);   overload;
    procedure SaveToArray(const BeginColumnIndex, EndColumnIndex: Integer; var Arr: array of Extended);  overload;
    procedure SaveToArray(const BeginColumnIndex, EndColumnIndex: Integer; var Arr: array of TDateTime); overload;
    procedure SaveToArray(const BeginColumnIndex, EndColumnIndex: Integer; var Arr: array of Currency);  overload;
  public
    // �����и�Ϊ�Զ���Ӧ���ݵĸ߶�
    procedure AutoFit;
  end;

  mnTExcelColumn = class(mnTExcelArea)
  protected
    function GetArea: Variant; override;
  private
    FColumnIndex: Integer;
  public
    property ColumnIndex: Integer read FColumnIndex;
    // ������������λ��
    procedure Locate(const AColumnIndex: Integer);
  public
    // ʹ��������ʽ������ͬ���͵�һά���������д�뵽�е�һ���ֵ�Ԫ���У������ᳬ����д�뵥Ԫ��ķ�Χ
    procedure LoadFromArray(const BeginRowIndex, EndRowIndex: Integer; const Arr: array of Variant);   overload;
    procedure LoadFromArray(const BeginRowIndex, EndRowIndex: Integer; const Arr: array of string);    overload;
    procedure LoadFromArray(const BeginRowIndex, EndRowIndex: Integer; const Arr: array of Integer);   overload;
    procedure LoadFromArray(const BeginRowIndex, EndRowIndex: Integer; const Arr: array of Extended);  overload;
    procedure LoadFromArray(const BeginRowIndex, EndRowIndex: Integer; const Arr: array of TDateTime); overload;
    procedure LoadFromArray(const BeginRowIndex, EndRowIndex: Integer; const Arr: array of Currency);  overload;
    // ���е�һ���ֵ�Ԫ���У��������ݴ��뵽��ͬ���͵�һά��������鳤�ȱ�����ڴ�����Ԫ�������
    procedure SaveToArray(const BeginRowIndex, EndRowIndex: Integer; var Arr: array of Variant);   overload;
    procedure SaveToArray(const BeginRowIndex, EndRowIndex: Integer; var Arr: array of string);    overload;
    procedure SaveToArray(const BeginRowIndex, EndRowIndex: Integer; var Arr: array of Integer);   overload;
    procedure SaveToArray(const BeginRowIndex, EndRowIndex: Integer; var Arr: array of Extended);  overload;
    procedure SaveToArray(const BeginRowIndex, EndRowIndex: Integer; var Arr: array of TDateTime); overload;
    procedure SaveToArray(const BeginRowIndex, EndRowIndex: Integer; var Arr: array of Currency);  overload;
  public
    // �����п�Ϊ�Զ���Ӧ���ݵĿ��
    procedure AutoFit;
  end;

  mnTExcelRange = class(mnTExcelArea)
  protected
    function GetArea: Variant; override;
  private
    FTopRowIndex: Integer;
    FLeftColumnIndex: Integer;
    FBottomRowIndex: Integer;
    FRightColumnIndex: Integer;
  public
    property TopRowIndex: Integer read FTopRowIndex;
    property LeftColumnIndex: Integer read FLeftColumnIndex;
    property BottomRowIndex: Integer read FBottomRowIndex;
    property RightColumnIndex: Integer read FRightColumnIndex;
    // �������С����к����С����ж�λ���η�Χ
    procedure Locate(const ATopRowIndex, ALeftColumnIndex, ABottomRowIndex, ARightColumnIndex: Integer);
  public
    // ʹ��������ʽ����һ����άVariant Array������д�뵽��������е�Ԫ���У������ᳬ������ķ�Χ
    procedure LoadFromVA(const VA: Variant);
    // ʹ��������ʽ������ͬ���͵Ķ�ά���������д�뵽��������е�Ԫ���У������ᳬ������ķ�Χ
    procedure LoadFromArray(const Arr: mnTVarArrayDim2); overload;
    procedure LoadFromArray(const Arr: mnTStrArrayDim2); overload;
    procedure LoadFromArray(const Arr: mnTIntArrayDim2); overload;
    // ����������е�Ԫ���У�������������һ����άVariant Array
    // ���ɵ�Variant Array�Ƕ�ά�ģ�ÿ��ά�ȵ��±�Ϊ1���ϱ�ֱ�Ϊ���������������
    function SaveToVA: Variant;
    // ����������е�Ԫ���У��������ݴ��뵽��ͬ���͵Ķ�ά��������鳤�ȱ�����ڴ�����Ԫ�������
    // ��A�ı�ʾ��ά���鲻��Ҫ���ȷ���ռ䣬�����ڲ�����������á����ú�����ÿ��ά�ȵ��±�Ϊ0���ϱ�ֱ�Ϊ�����������������1
    procedure SaveToArray(var Arr: mnTVarArrayDim2); overload;
    procedure SaveToArray(var Arr: mnTStrArrayDim2); overload;
    procedure SaveToArray(var Arr: mnTIntArrayDim2); overload;
    procedure SaveToArray_A(var Arr: mnTVarArrayDim2); overload;
    procedure SaveToArray_A(var Arr: mnTStrArrayDim2); overload;
    procedure SaveToArray_A(var Arr: mnTIntArrayDim2); overload;
  public
    // �жϱ����η�Χ�Ƿ����һ�����η�Χ��ͬ��Ҫ��Χ�Ĵ�С�ͷ�Χ��ÿ����Ԫ����ͬ������Ҫ��Χ��λ����ͬ��
    function IsSameAs(AnotherRange: mnTExcelRange): Boolean;
  end;

  mnTExcel = class
  protected
    ExcelApp: Variant;
    ExcelBook: Variant;
  // Ŀǰ���ڴ����Excel���ļ���
  protected
    FFileName: string;
  public
    property FileName: string read FFileName;
  // ָʾ��ǰSheet�Ĳ�������
  protected
    FGlobal: mnTExcelGlobal;
    FUsedRange: mnTExcelUsedRange;
    FCells: TObjectList;
    FRows: TObjectList;
    FColumns: TObjectList;
    FRanges: TObjectList;
    function GetCell(ARowIndex, AColumnIndex: Integer): mnTExcelCell;
    function GetRow(ARowIndex: Integer): mnTExcelRow;
    function GetColumn(AColumnIndex: Integer): mnTExcelColumn;
    function GetRange(ATopRowIndex, ALeftColumnIndex, ABottomRowIndex, ARightColumnIndex: Integer): mnTExcelRange;
  public
    property Global: mnTExcelGlobal read FGlobal;
    property UsedRange: mnTExcelUsedRange read FUsedRange;
    property Cells[ARowIndex, AColumnIndex: Integer]: mnTExcelCell read GetCell;
    property Rows[ARowIndex: Integer]: mnTExcelRow read GetRow;
    property Columns[AColumnIndex: Integer]: mnTExcelColumn read GetColumn;
    property Range[ATopRowIndex, ALeftColumnIndex, ABottomRowIndex, ARightColumnIndex: Integer]: mnTExcelRange read GetRange;
  // Application Level
  // �½����򿪡��رա���������Ϊ
  public
    constructor Create;
    destructor Destroy; override;
    procedure New;
    procedure Open(const AFileName: string);
    procedure Close;
    procedure Save;
    procedure SaveAs(const AFileName: string);
  // Excel�����Ƿ���ʾ
  protected
    function GetVisible: Boolean;
    procedure SetVisible(const Value: Boolean);
  public
    property Visible: Boolean read GetVisible write SetVisible;
  // �õ���ǰѡ�еĵ�Ԫ����λ�ڵ�ǰҳ��
  protected
    function GetActiveCell: mnTExcelCell;
  public
    property ActiveCell: mnTExcelCell read GetActiveCell;
  // Book Level
  // �õ���ǰҳ����š������ĵ�ҳ�������ʸ�ҳ���ơ����õ�ǰҳ�����ҳ��ɾ��ҳ
  protected
    function GetActiveSheet: Variant;
    function GetActiveSheetIndex: Integer;
    function GetSheetCount: Integer;
    function GetSheetName(Index: Integer): string;
    procedure SetSheetName(Index: Integer; const Value: string);
    property ActiveSheet: Variant read GetActiveSheet;
  public
    property ActiveSheetIndex: Integer read GetActiveSheetIndex;
    property SheetCount: Integer read GetSheetCount;
    property SheetNames[Index: Integer]: string read GetSheetName write SetSheetName;
    procedure SetActiveSheet(const Index: Integer);
    procedure AddSheet;
    procedure DeleteSheet(const Index: Integer);
  // �ж��ĵ��Ƿ����һ��Excel���ĵ���ͬ��Ҫ��ҳ����ÿҳ���ƺ�ÿ����Ԫ����ͬ
  public
    function IsSameAs(AnotherExcel: mnTExcel): Boolean;
  // Sheet Level
  // ��ǰҳ����������������Simple��������ʹ�ù��ģ�����Simple����Ŀǰʹ�õ���
  protected
    function GetSimpleRowCount: Integer;
    function GetSimpleColumnCount: Integer;
    function GetRowCount: Integer;
    function GetColumnCount: Integer;
  public
    property SimpleRowCount: Integer read GetSimpleRowCount;
    property SimpleColumnCount: Integer read GetSimpleColumnCount;
    property RowCount: Integer read GetRowCount;
    property ColumnCount: Integer read GetColumnCount;
  // ҳ�����úʹ�ӡ��ص�ϵ�к���
  public
    // ���õ�ǰҳ��ҳü
    procedure SetPageCenterHeader(const Header: string);
    // ���õ�ǰҳ��ҳ��
    procedure SetPageCenterFooter(const Footer: string);
    // ���õ�ǰҳ��ҳü��ֽ�Ŷ��˱߾ࣨ��λ������1��=0.035���ף�
    procedure SetPageHeaderMargin(const Margin: Extended);
    // ���õ�ǰҳ��ҳ�ŵ�ֽ�ŵ׶˱߾ࣨ��λ������1��=0.035���ף�
    procedure SetPageFooterMargin(const Margin: Extended);
    // ���õ�ǰҳ�Ķ��߾ࣨ��λ������1��=0.035���ף�
    procedure SetPageTopMargin(const Margin: Extended);
    // ���õ�ǰҳ�ĵױ߾ࣨ��λ������1��=0.035���ף�
    procedure SetPageBottomMargin(const Margin: Extended);
    // ���õ�ǰҳ����߾ࣨ��λ������1��=0.035���ף�
    procedure SetPageLeftMargin(const Margin: Extended);
    // ���õ�ǰҳ���ұ߾ࣨ��λ������1��=0.035���ף�
    procedure SetPageRightMargin(const Margin: Extended);
    // ���õ�ǰҳ��ҳ���Ƿ�ˮƽ����
    procedure SetPageCenterHorizontally(const Center: Boolean);
    // ���õ�ǰҳ��ҳ���Ƿ�ֱ����
    procedure SetPageCenterVertically(const Center: Boolean);
    // ���õ�ǰҳ�Ƿ��ӡ��Ԫ������
    procedure SetPagePrintGridLines(const PrintGridLines: Boolean);
    // ��ӡԤ����ǰҳ
    procedure PrintPreview;
    // ��ӡ��ǰҳ
    procedure Print;
  end;

{--------------------------------
  ��Word�ļ����д����һϵ���ࡣ

  mnTWord�Ǻ����࣬���ڲ�ά����WordApp��WordDoc����COM����ָʾ�����ڴ����WordӦ�ó�����ĵ���
  ���ഴ��ʵ��ʱ��������һ���µ�Word���������Ƿ�����Word�����У�����������в�����

  mnTWordGlobal��mnTWordSelection��mnTWordParagraph��mnTWordTable��mnTWordCell��mnTWordHeader��mnTWordFooter
  ָʾ��Word�Ĳ�������
  ���Ǹ�����mnTWord�����ϣ��ֱ��ʾ��ƪ�ĵ�����ǰ���ѡ���ı���ָ�����䡢ָ�����ָ�����ĵ�Ԫ��ҳü��ҳ�š�
  ������һ����ͬ�Ļ���mnTWordArea���û�����麯��GetArea���ڵõ����������COM���󣬸�����ֱ�ʵ�֡�

  Tested in TestUnit and TestApp.
 --------------------------------}
type
  mnTWord = class;

  mnTWordArea = class
  protected
    // �õ����������COM����
    function GetArea: Variant; virtual; abstract;
  protected
    FParent: mnTWord;
  public
    // ������������mnTWord����
    property Parent: mnTWord read FParent;
  public
    constructor Create(AParent: mnTWord);
  protected
    function GetText: string;
    procedure SetText(const Value: string);
  public
    // �������ڵ��ı�
    // ����������Selection�������ǰû��ѡ���κ����֣�SetText�ǽ���걾�������֣�GetText�Ƿ��ع����һ���ַ�
    property Text: string read GetText write SetText;
  public
    // ���ñ�������������ֵ��������ơ���С����ɫ����ʽ
    procedure SetFontName(const FontName: string);
    procedure SetFontSize(const FontSize: Extended);
    procedure SetFontColor(const FontColor: TColor);
    procedure SetFontStyles(const FontStyles: TFontStyles);
  public
    // ���������򵽼�����
    procedure Copy;
    // �Ӽ�����ճ����������
    procedure Paste;
    // ѡ������
    procedure Select;
    // ���������滻�ı��ĵ�һ�γ��֣�ȱʡ����Ϊ���ִ�Сд�ͷ�����ƥ�䣬�����Ƿ��ҵ����ı����滻�ɹ�
    function Replace(const OldText, NewText: string; const MatchCase: Boolean = True; const MatchWholeWord: Boolean = False): Boolean;
    // ���������滻�ı������г���
    procedure ReplaceAll(const OldText, NewText: string; const MatchCase: Boolean = True; const MatchWholeWord: Boolean = False);
  end;

  mnTWordGlobal = class(mnTWordArea)
  protected
    function GetArea: Variant; override;
  end;

  mnTWordSelection = class(mnTWordArea)
  protected
    function GetArea: Variant; override;
  public
    // TypeText���ڹ�괦�������֣����ƶ����
    // InsertText���ڹ�괦�������֣��������
    // ���֮�£�SetText�ǽ���걾�������֣���ѡ����Щ����
    // ���磬ͬ���ǵ������Σ��ֱ���aa��bb�����Ϊ��
    //   TypeText -> aabb|    InsertText -> |bbaa    SetText -> |bb|
    procedure TypeText(const Text: string);
    procedure InsertText(const Text: string);
  public
    // ������Ƶ��ĵ����ʼ����ĩβ
    procedure GotoBegin;
    procedure GotoEnd;
    // �ڹ�괦����һ�����RealLine��ʾ���ı߿���Ϊ��ɫʵ�߻�ǳ��ɫ����
    procedure InsertTable(const RowCount, ColumnCount: Integer; const RealLine: Boolean = True);
  end;

  mnTWordParagraph = class(mnTWordArea)
  protected
    function GetArea: Variant; override;
  private
    FParagraphIndex: Integer;
  public
    property ParagraphIndex: Integer read FParagraphIndex;
    // ���ݶ���������λ����
    procedure Locate(const AParagraphIndex: Integer);
  end;

  mnTWordTable = class(mnTWordArea)
  protected
    function GetArea: Variant; override;
    function GetComObject: Variant;
  public
    // �õ���Ӧ�����COM����
    property ComObject: Variant read GetComObject;
  private
    FTableIndex: Integer;
  public
    property TableIndex: Integer read FTableIndex;
    // ���ݱ��������λ���
    procedure Locate(const ATableIndex: Integer);
  protected
    function GetRowCount: Integer;
    procedure SetRowCount(const Value: Integer);
    function GetColumnCount: Integer;
    procedure SetColumnCount(const Value: Integer);
  public
    // �õ������ñ�������������
    property RowCount: Integer read GetRowCount write SetRowCount;
    property ColumnCount: Integer read GetColumnCount write SetColumnCount;
    // ���������һ�л�һ�У������������кŻ��к�
    function AddRow: Integer;
    function AddColumn: Integer;
    // ɾ������һ�л�һ��
    procedure DeleteRow(const ARowIndex: Integer);
    procedure DeleteColumn(const AColumnIndex: Integer);
  end;

  mnTWordCell = class(mnTWordArea)
  protected
    function GetArea: Variant; override;
  private
    FTableIndex: Integer;
    FRowIndex: Integer;
    FColumnIndex: Integer;
  public
    property TableIndex: Integer read FTableIndex;
    property RowIndex: Integer read FRowIndex;
    property ColumnIndex: Integer read FColumnIndex;
    // ���ݱ������������������������λ���ĵ�Ԫ��
    procedure Locate(const ATableIndex, ARowIndex, AColumnIndex: Integer);
  protected
    function GetActualText: string;
  public
    // ��Ԫ���ڵ�ʵ���ı���ȥ����Word�Զ����ӵ�#13#7
    property ActualText: string read GetActualText;
  end;

  mnTWordHeader = class(mnTWordArea)
  protected
    function GetArea: Variant; override;
  end;

  mnTWordFooter = class(mnTWordArea)
  protected
    function GetArea: Variant; override;
  end;

  mnTWord = class
  protected
    WordApp: Variant;
    WordDoc: Variant;
  // Ŀǰ���ڴ����Word���ļ���
  protected
    FFileName: string;
  public
    property FileName: string read FFileName;
  // ָʾ��ǰ�ĵ��Ĳ�������
  protected
    FGlobal: mnTWordGlobal;
    FSelection: mnTWordSelection;
    FParagraphs: TObjectList;
    FTables: TObjectList;
    FCells: TObjectList;
    FHeader: mnTWordHeader;
    FFooter: mnTWordFooter;
    function GetParagraph(AParagraphIndex: Integer): mnTWordParagraph;
    function GetTable(ATableIndex: Integer): mnTWordTable;
    function GetCell(ATableIndex, ARowIndex, AColumnIndex: Integer): mnTWordCell;
  public
    property Global: mnTWordGlobal read FGlobal;
    property Selection: mnTWordSelection read FSelection;
    property Paragraphs[AParagraphIndex: Integer]: mnTWordParagraph read GetParagraph;
    property Tables[ATableIndex: Integer]: mnTWordTable read GetTable;
    property Cells[ATableIndex, ARowIndex, AColumnIndex: Integer]: mnTWordCell read GetCell;
    property Header: mnTWordHeader read FHeader;
    property Footer: mnTWordFooter read FFooter;
  // Application Level
  // �½����򿪡��رա���������Ϊ
  public
    constructor Create;
    destructor Destroy; override;
    procedure New;
    procedure Open(const AFileName: string);
    procedure Close;
    procedure Save;
    procedure SaveAs(const AFileName: string);
  // Word�����Ƿ���ʾ
  protected
    function GetVisible: Boolean;
    procedure SetVisible(const Value: Boolean);
  public
    property Visible: Boolean read GetVisible write SetVisible;
  // Document Level
  // �ж��ĵ��Ƿ����һ��Word���ĵ���ͬ��Ҫ�����ĵ�������ͬ����
  public
    function IsSameAs(AnotherWord: mnTWord): Boolean;
  // �������ͱ����
  protected
    function GetParagraphCount: Integer;
    function GetTableCount: Integer;
  public
    property ParagraphCount: Integer read GetParagraphCount;
    property TableCount: Integer read GetTableCount;
  end;

implementation

uses mnDebug, Variants, mnArray, mnResStrsU, ComObj, SysUtils, mnString;

function mnParseDispParam(DispParams: PDispParams; Index: Integer): OleVariant;
var
  PVA: PVariantArg;
begin
  if DispParams.cNamedArgs <= 0 then
    Index := DispParams.cArgs - 1 - Index;
  PVA := @DispParams.rgvarg[Index];
  Result := POleVariant(PVA)^;
end;

const
  xlDoNotSaveChanges = $00000000;
  xlCellTypeLastCell = $0000000B;

{ mnTExcelArea }

constructor mnTExcelArea.Create(AParent: mnTExcel);
begin
  FParent := AParent;
end;

function mnTExcelArea.GetAnchorRowIndex: Integer;
begin
  Result := GetArea.Row;
end;

function mnTExcelArea.GetAnchorColumnIndex: Integer;
begin
  Result := GetArea.Column;
end;

function mnTExcelArea.GetColumnWidth: Extended;
begin
  Result := GetArea.ColumnWidth;
end;

procedure mnTExcelArea.SetColumnWidth(const Value: Extended);
begin
  GetArea.ColumnWidth := Value;
end;

function mnTExcelArea.GetRowHeight: Extended;
begin
  Result := GetArea.RowHeight;
end;

procedure mnTExcelArea.SetRowHeight(const Value: Extended);
begin
  GetArea.RowHeight := Value;
end;

procedure mnTExcelArea.SetWrapText(const WrapText: Boolean);
begin
  GetArea.WrapText := WrapText;
end;

procedure mnTExcelArea.SetPageBreak(const PageBreak: Boolean);
begin
  GetArea.PageBreak := PageBreak;
end;

procedure mnTExcelArea.SetBorderWeight(const BordersIndex: XlBordersIndex = xlEdgesAll; const Weight: XlBorderWeight = xlThin);
begin
  if BordersIndex = xlEdgesAll then
    GetArea.Borders.Weight := Weight
  else
    GetArea.Borders[BordersIndex].Weight := Weight;
end;

procedure mnTExcelArea.SetBorderLineStyle(const BordersIndex: XlBordersIndex = xlEdgesAll; const LineStyle: XlLineStyle = xlDash);
begin
  if BordersIndex = xlEdgesAll then
    GetArea.Borders.LineStyle := LineStyle
  else
    GetArea.Borders[BordersIndex].LineStyle := LineStyle;
end;

procedure mnTExcelArea.SetFontName(const FontName: string);
begin
  GetArea.Font.Name := FontName;
end;

procedure mnTExcelArea.SetFontSize(const FontSize: Extended);
begin
  GetArea.Font.Size := FontSize;
end;

procedure mnTExcelArea.SetFontColor(const FontColor: TColor);
begin
  GetArea.Font.Color := FontColor;
end;

procedure mnTExcelArea.SetFontStyles(const FontStyles: TFontStyles);
begin
  GetArea.Font.Bold := fsBold in FontStyles;
  GetArea.Font.Italic := fsItalic in FontStyles;
  GetArea.Font.UnderLine := fsUnderline in FontStyles;
end;

procedure mnTExcelArea.SetHorizontalAlignment(const Alignment: XlALignment);
begin
  GetArea.HorizontalAlignment := Alignment;
end;

procedure mnTExcelArea.SetVerticalAlignment(const Alignment: XlALignment);
begin
  GetArea.VerticalAlignment := Alignment;
end;

procedure mnTExcelArea.SetFillColor(const FillColor: TColor);
begin
  GetArea.Interior.Color := FillColor;
end;

procedure mnTExcelArea.ClearContents;
begin
  GetArea.ClearContents;
end;

procedure mnTExcelArea.Clear;
begin
  GetArea.Clear;
end;

procedure mnTExcelArea.Copy;
begin
  GetArea.Copy;
end;

procedure mnTExcelArea.Paste;
begin
  GetArea.PasteSpecial;
end;

procedure mnTExcelArea.Merge;
begin
  GetArea.Merge;
end;

procedure mnTExcelArea.Unmerge;
begin
  GetArea.Unmerge;
end;

procedure mnTExcelArea.SetFormatToNormal;
begin
  GetArea.NumberFormatLocal := '@';
end;

procedure mnTExcelArea.Insert;
begin
  GetArea.Insert;
end;

procedure mnTExcelArea.Delete;
begin
  GetArea.Delete;
end;

{ mnTExcelGlobal }

function mnTExcelGlobal.GetArea: Variant;
begin
  Result := FParent.ActiveSheet.Cells;
end;

procedure mnTExcelGlobal.AutoFitRows;
begin
  FParent.ActiveSheet.Rows.AutoFit;
end;

procedure mnTExcelGlobal.AutoFitColumns;
begin
  FParent.ActiveSheet.Columns.AutoFit;
end;

{ mnTExcelUsedRange }

function mnTExcelUsedRange.GetArea: Variant;
begin
  Result := FParent.ActiveSheet.UsedRange;
end;

{ mnTExcelCell }

function mnTExcelCell.GetArea: Variant;
begin
  Result := FParent.ActiveSheet.Cells[FRowIndex, FColumnIndex];
end;

procedure mnTExcelCell.Locate(const ARowIndex, AColumnIndex: Integer);
begin
  FRowIndex := ARowIndex;
  FColumnIndex := AColumnIndex;
  mnAssert(GetArea.Row = ARowIndex);
  mnAssert(GetArea.Column = AColumnIndex);
end;

function mnTExcelCell.GetValue: Variant;
begin
  Result := GetArea.Value;
end;

function mnTExcelCell.GetAsString: string;
begin
  Result := VarToStr(GetArea.Value);
end;

function mnTExcelCell.GetAsInteger: Integer;
begin
  Result := mnVarToInt(GetArea.Value);
end;

function mnTExcelCell.GetAsFloat: Extended;
begin
  Result := mnVarToFloat(GetArea.Value);
end;

function mnTExcelCell.GetAsDateTime: TDateTime;
begin
  Result := mnVarToDT(GetArea.Value);
end;

function mnTExcelCell.GetAsCurrency: Currency;
begin
  Result := mnVarToCurr(GetArea.Value);
end;

procedure mnTExcelCell.SetValue(const AValue: Variant);
begin
  GetArea.Value := AValue;
end;

procedure mnTExcelCell.SetAsString(const AValue: string);
begin
  GetArea.Value := AValue;
end;

procedure mnTExcelCell.SetAsInteger(const AValue: Integer);
begin
  GetArea.Value := AValue;
end;

procedure mnTExcelCell.SetAsFloat(const AValue: Extended);
begin
  GetArea.Value := AValue;
end;

procedure mnTExcelCell.SetAsDateTime(const AValue: TDateTime);
begin
  GetArea.Value := AValue;
end;

procedure mnTExcelCell.SetAsCurrency(const AValue: Currency);
begin
  GetArea.Value := AValue;
end;

procedure mnTExcelCell.LoadFromArray(const Arr: mnTVarArrayDim2);
var
  ArrLen1, ArrLen2: Integer;
begin
  ArrLen1 := Length(Arr);
  ArrLen2 := Length(Arr[0]);
  FParent.Range[FRowIndex, FColumnIndex, FRowIndex+ArrLen1-1, FColumnIndex+ArrLen2-1].LoadFromArray(Arr);
end;

procedure mnTExcelCell.LoadFromArray(const Arr: mnTStrArrayDim2);
var
  ArrLen1, ArrLen2: Integer;
begin
  ArrLen1 := Length(Arr);
  ArrLen2 := Length(Arr[0]);
  FParent.Range[FRowIndex, FColumnIndex, FRowIndex+ArrLen1-1, FColumnIndex+ArrLen2-1].LoadFromArray(Arr);
end;

procedure mnTExcelCell.LoadFromArray(const Arr: mnTIntArrayDim2);
var
  ArrLen1, ArrLen2: Integer;
begin
  ArrLen1 := Length(Arr);
  ArrLen2 := Length(Arr[0]);
  FParent.Range[FRowIndex, FColumnIndex, FRowIndex+ArrLen1-1, FColumnIndex+ArrLen2-1].LoadFromArray(Arr);
end;

{ mnTExcelRow }

function mnTExcelRow.GetArea: Variant;
begin
  Result := FParent.ActiveSheet.Rows[FRowIndex];
end;

procedure mnTExcelRow.Locate(const ARowIndex: Integer);
begin
  FRowIndex := ARowIndex;
  mnAssert(GetArea.Row = ARowIndex);
end;

procedure mnTExcelRow.LoadFromArray(const BeginColumnIndex, EndColumnIndex: Integer; const Arr: array of Variant);
var
  VA: Variant;
  ArrLen: Integer;
  ColumnIndex: Integer;
begin
  VA := mnArrayToVA(Arr);
  ArrLen := Length(Arr);

  ColumnIndex := BeginColumnIndex;
  while ColumnIndex <= EndColumnIndex do
  begin
    if EndColumnIndex - ColumnIndex + 1 < ArrLen then
    begin
      FParent.Range[FRowIndex, ColumnIndex, FRowIndex, EndColumnIndex].GetArea.Value := VA;
      ColumnIndex := EndColumnIndex + 1;
    end
    else
    begin
      FParent.Range[FRowIndex, ColumnIndex, FRowIndex, ColumnIndex+ArrLen-1].GetArea.Value := VA;
      ColumnIndex := ColumnIndex + ArrLen;
    end;
  end;
end;

procedure mnTExcelRow.LoadFromArray(const BeginColumnIndex, EndColumnIndex: Integer; const Arr: array of string);
var
  VA: Variant;
  ArrLen: Integer;
  ColumnIndex: Integer;
begin
  VA := mnArrayToVA(Arr);
  ArrLen := Length(Arr);

  ColumnIndex := BeginColumnIndex;
  while ColumnIndex <= EndColumnIndex do
  begin
    if EndColumnIndex - ColumnIndex + 1 < ArrLen then
    begin
      FParent.Range[FRowIndex, ColumnIndex, FRowIndex, EndColumnIndex].GetArea.Value := VA;
      ColumnIndex := EndColumnIndex + 1;
    end
    else
    begin
      FParent.Range[FRowIndex, ColumnIndex, FRowIndex, ColumnIndex+ArrLen-1].GetArea.Value := VA;
      ColumnIndex := ColumnIndex + ArrLen;
    end;
  end;
end;

procedure mnTExcelRow.LoadFromArray(const BeginColumnIndex, EndColumnIndex: Integer; const Arr: array of Integer);
var
  VA: Variant;
  ArrLen: Integer;
  ColumnIndex: Integer;
begin
  VA := mnArrayToVA(Arr);
  ArrLen := Length(Arr);

  ColumnIndex := BeginColumnIndex;
  while ColumnIndex <= EndColumnIndex do
  begin
    if EndColumnIndex - ColumnIndex + 1 < ArrLen then
    begin
      FParent.Range[FRowIndex, ColumnIndex, FRowIndex, EndColumnIndex].GetArea.Value := VA;
      ColumnIndex := EndColumnIndex + 1;
    end
    else
    begin
      FParent.Range[FRowIndex, ColumnIndex, FRowIndex, ColumnIndex+ArrLen-1].GetArea.Value := VA;
      ColumnIndex := ColumnIndex + ArrLen;
    end;
  end;
end;

procedure mnTExcelRow.LoadFromArray(const BeginColumnIndex, EndColumnIndex: Integer; const Arr: array of Extended);
var
  VA: Variant;
  ArrLen: Integer;
  ColumnIndex: Integer;
begin
  VA := mnArrayToVA(Arr);
  ArrLen := Length(Arr);

  ColumnIndex := BeginColumnIndex;
  while ColumnIndex <= EndColumnIndex do
  begin
    if EndColumnIndex - ColumnIndex + 1 < ArrLen then
    begin
      FParent.Range[FRowIndex, ColumnIndex, FRowIndex, EndColumnIndex].GetArea.Value := VA;
      ColumnIndex := EndColumnIndex + 1;
    end
    else
    begin
      FParent.Range[FRowIndex, ColumnIndex, FRowIndex, ColumnIndex+ArrLen-1].GetArea.Value := VA;
      ColumnIndex := ColumnIndex + ArrLen;
    end;
  end;
end;

procedure mnTExcelRow.LoadFromArray(const BeginColumnIndex, EndColumnIndex: Integer; const Arr: array of TDateTime);
var
  VA: Variant;
  ArrLen: Integer;
  ColumnIndex: Integer;
begin
  VA := mnArrayToVA(Arr);
  ArrLen := Length(Arr);

  ColumnIndex := BeginColumnIndex;
  while ColumnIndex <= EndColumnIndex do
  begin
    if EndColumnIndex - ColumnIndex + 1 < ArrLen then
    begin
      FParent.Range[FRowIndex, ColumnIndex, FRowIndex, EndColumnIndex].GetArea.Value := VA;
      ColumnIndex := EndColumnIndex + 1;
    end
    else
    begin
      FParent.Range[FRowIndex, ColumnIndex, FRowIndex, ColumnIndex+ArrLen-1].GetArea.Value := VA;
      ColumnIndex := ColumnIndex + ArrLen;
    end;
  end;
end;

procedure mnTExcelRow.LoadFromArray(const BeginColumnIndex, EndColumnIndex: Integer; const Arr: array of Currency);
var
  VA: Variant;
  ArrLen: Integer;
  ColumnIndex: Integer;
begin
  VA := mnArrayToVA(Arr);
  ArrLen := Length(Arr);

  ColumnIndex := BeginColumnIndex;
  while ColumnIndex <= EndColumnIndex do
  begin
    if EndColumnIndex - ColumnIndex + 1 < ArrLen then
    begin
      FParent.Range[FRowIndex, ColumnIndex, FRowIndex, EndColumnIndex].GetArea.Value := VA;
      ColumnIndex := EndColumnIndex + 1;
    end
    else
    begin
      FParent.Range[FRowIndex, ColumnIndex, FRowIndex, ColumnIndex+ArrLen-1].GetArea.Value := VA;
      ColumnIndex := ColumnIndex + ArrLen;
    end;
  end;
end;

procedure mnTExcelRow.SaveToArray(const BeginColumnIndex, EndColumnIndex: Integer; var Arr: array of Variant);
var
  VA: Variant;
  ArrLen: Integer;
  ColumnCount: Integer;
begin
  ArrLen := Length(Arr);
  ColumnCount := EndColumnIndex - BeginColumnIndex + 1;
  mnCreateErrorIf(ColumnCount > ArrLen, SArrayTooShortForExcelRange);

  VA := FParent.Range[FRowIndex, BeginColumnIndex, FRowIndex, EndColumnIndex].GetArea.Value;
  mnAssert(VarArrayDimCount(VA) = 2);
  mnAssert(VarArrayLowBound(VA, 1) = 1);
  mnAssert(VarArrayHighBound(VA, 1) = 1);
  mnAssert(VarArrayLowBound(VA, 2) = 1);
  mnAssert(VarArrayHighBound(VA, 2) = ColumnCount);

  mnBase1VAToArrayDim2(VA, Arr, 1, 1, ColumnCount);
end;

procedure mnTExcelRow.SaveToArray(const BeginColumnIndex, EndColumnIndex: Integer; var Arr: array of string);
var
  VA: Variant;
  ArrLen: Integer;
  ColumnCount: Integer;
begin
  ArrLen := Length(Arr);
  ColumnCount := EndColumnIndex - BeginColumnIndex + 1;
  mnCreateErrorIf(ColumnCount > ArrLen, SArrayTooShortForExcelRange);

  VA := FParent.Range[FRowIndex, BeginColumnIndex, FRowIndex, EndColumnIndex].GetArea.Value;
  mnAssert(VarArrayDimCount(VA) = 2);
  mnAssert(VarArrayLowBound(VA, 1) = 1);
  mnAssert(VarArrayHighBound(VA, 1) = 1);
  mnAssert(VarArrayLowBound(VA, 2) = 1);
  mnAssert(VarArrayHighBound(VA, 2) = ColumnCount);

  mnBase1VAToArrayDim2(VA, Arr, 1, 1, ColumnCount);
end;

procedure mnTExcelRow.SaveToArray(const BeginColumnIndex, EndColumnIndex: Integer; var Arr: array of Integer);
var
  VA: Variant;
  ArrLen: Integer;
  ColumnCount: Integer;
begin
  ArrLen := Length(Arr);
  ColumnCount := EndColumnIndex - BeginColumnIndex + 1;
  mnCreateErrorIf(ColumnCount > ArrLen, SArrayTooShortForExcelRange);

  VA := FParent.Range[FRowIndex, BeginColumnIndex, FRowIndex, EndColumnIndex].GetArea.Value;
  mnAssert(VarArrayDimCount(VA) = 2);
  mnAssert(VarArrayLowBound(VA, 1) = 1);
  mnAssert(VarArrayHighBound(VA, 1) = 1);
  mnAssert(VarArrayLowBound(VA, 2) = 1);
  mnAssert(VarArrayHighBound(VA, 2) = ColumnCount);

  mnBase1VAToArrayDim2(VA, Arr, 1, 1, ColumnCount);
end;

procedure mnTExcelRow.SaveToArray(const BeginColumnIndex, EndColumnIndex: Integer; var Arr: array of Extended);
var
  VA: Variant;
  ArrLen: Integer;
  ColumnCount: Integer;
begin
  ArrLen := Length(Arr);
  ColumnCount := EndColumnIndex - BeginColumnIndex + 1;
  mnCreateErrorIf(ColumnCount > ArrLen, SArrayTooShortForExcelRange);

  VA := FParent.Range[FRowIndex, BeginColumnIndex, FRowIndex, EndColumnIndex].GetArea.Value;
  mnAssert(VarArrayDimCount(VA) = 2);
  mnAssert(VarArrayLowBound(VA, 1) = 1);
  mnAssert(VarArrayHighBound(VA, 1) = 1);
  mnAssert(VarArrayLowBound(VA, 2) = 1);
  mnAssert(VarArrayHighBound(VA, 2) = ColumnCount);

  mnBase1VAToArrayDim2(VA, Arr, 1, 1, ColumnCount);
end;

procedure mnTExcelRow.SaveToArray(const BeginColumnIndex, EndColumnIndex: Integer; var Arr: array of TDateTime);
var
  VA: Variant;
  ArrLen: Integer;
  ColumnCount: Integer;
begin
  ArrLen := Length(Arr);
  ColumnCount := EndColumnIndex - BeginColumnIndex + 1;
  mnCreateErrorIf(ColumnCount > ArrLen, SArrayTooShortForExcelRange);

  VA := FParent.Range[FRowIndex, BeginColumnIndex, FRowIndex, EndColumnIndex].GetArea.Value;
  mnAssert(VarArrayDimCount(VA) = 2);
  mnAssert(VarArrayLowBound(VA, 1) = 1);
  mnAssert(VarArrayHighBound(VA, 1) = 1);
  mnAssert(VarArrayLowBound(VA, 2) = 1);
  mnAssert(VarArrayHighBound(VA, 2) = ColumnCount);

  mnBase1VAToArrayDim2(VA, Arr, 1, 1, ColumnCount);
end;

procedure mnTExcelRow.SaveToArray(const BeginColumnIndex, EndColumnIndex: Integer; var Arr: array of Currency);
var
  VA: Variant;
  ArrLen: Integer;
  ColumnCount: Integer;
begin
  ArrLen := Length(Arr);
  ColumnCount := EndColumnIndex - BeginColumnIndex + 1;
  mnCreateErrorIf(ColumnCount > ArrLen, SArrayTooShortForExcelRange);

  VA := FParent.Range[FRowIndex, BeginColumnIndex, FRowIndex, EndColumnIndex].GetArea.Value;
  mnAssert(VarArrayDimCount(VA) = 2);
  mnAssert(VarArrayLowBound(VA, 1) = 1);
  mnAssert(VarArrayHighBound(VA, 1) = 1);
  mnAssert(VarArrayLowBound(VA, 2) = 1);
  mnAssert(VarArrayHighBound(VA, 2) = ColumnCount);

  mnBase1VAToArrayDim2(VA, Arr, 1, 1, ColumnCount);
end;

procedure mnTExcelRow.AutoFit;
begin
  GetArea.AutoFit;
end;

{ mnTExcelColumn }

function mnTExcelColumn.GetArea: Variant;
begin
  Result := FParent.ActiveSheet.Columns[FColumnIndex];
end;

procedure mnTExcelColumn.Locate(const AColumnIndex: Integer);
begin
  FColumnIndex := AColumnIndex;
  mnAssert(GetArea.Column = AColumnIndex);
end;

procedure mnTExcelColumn.LoadFromArray(const BeginRowIndex, EndRowIndex: Integer; const Arr: array of Variant);
var
  VA: Variant;
  ArrLen: Integer;
  RowIndex: Integer;
begin
  ArrLen := Length(Arr);
  VA := VarArrayCreate([1, ArrLen, 1, 1], varVariant);
  mnBase2ArrayToVADim2(Arr, VA, 1, 1);

  RowIndex := BeginRowIndex;
  while RowIndex <= EndRowIndex do
  begin
    if EndRowIndex - RowIndex + 1 < ArrLen then
    begin
      FParent.Range[RowIndex, FColumnIndex, EndRowIndex, FColumnIndex].GetArea.Value := VA;
      RowIndex := EndRowIndex + 1;
    end
    else
    begin
      FParent.Range[RowIndex, FColumnIndex, RowIndex + ArrLen - 1, FColumnIndex].GetArea.Value := VA;
      RowIndex := RowIndex + ArrLen;
    end;
  end;
end;

procedure mnTExcelColumn.LoadFromArray(const BeginRowIndex, EndRowIndex: Integer; const Arr: array of string);
var
  VA: Variant;
  ArrLen: Integer;
  RowIndex: Integer;
begin
  ArrLen := Length(Arr);
  VA := VarArrayCreate([1, ArrLen, 1, 1], varVariant);
  mnBase2ArrayToVADim2(Arr, VA, 1, 1);

  RowIndex := BeginRowIndex;
  while RowIndex <= EndRowIndex do
  begin
    if EndRowIndex - RowIndex + 1 < ArrLen then
    begin
      FParent.Range[RowIndex, FColumnIndex, EndRowIndex, FColumnIndex].GetArea.Value := VA;
      RowIndex := EndRowIndex + 1;
    end
    else
    begin
      FParent.Range[RowIndex, FColumnIndex, RowIndex + ArrLen - 1, FColumnIndex].GetArea.Value := VA;
      RowIndex := RowIndex + ArrLen;
    end;
  end;
end;

procedure mnTExcelColumn.LoadFromArray(const BeginRowIndex, EndRowIndex: Integer; const Arr: array of Integer);
var
  VA: Variant;
  ArrLen: Integer;
  RowIndex: Integer;
begin
  ArrLen := Length(Arr);
  VA := VarArrayCreate([1, ArrLen, 1, 1], varVariant);
  mnBase2ArrayToVADim2(Arr, VA, 1, 1);

  RowIndex := BeginRowIndex;
  while RowIndex <= EndRowIndex do
  begin
    if EndRowIndex - RowIndex + 1 < ArrLen then
    begin
      FParent.Range[RowIndex, FColumnIndex, EndRowIndex, FColumnIndex].GetArea.Value := VA;
      RowIndex := EndRowIndex + 1;
    end
    else
    begin
      FParent.Range[RowIndex, FColumnIndex, RowIndex + ArrLen - 1, FColumnIndex].GetArea.Value := VA;
      RowIndex := RowIndex + ArrLen;
    end;
  end;
end;

procedure mnTExcelColumn.LoadFromArray(const BeginRowIndex, EndRowIndex: Integer; const Arr: array of Extended);
var
  VA: Variant;
  ArrLen: Integer;
  RowIndex: Integer;
begin
  ArrLen := Length(Arr);
  VA := VarArrayCreate([1, ArrLen, 1, 1], varVariant);
  mnBase2ArrayToVADim2(Arr, VA, 1, 1);

  RowIndex := BeginRowIndex;
  while RowIndex <= EndRowIndex do
  begin
    if EndRowIndex - RowIndex + 1 < ArrLen then
    begin
      FParent.Range[RowIndex, FColumnIndex, EndRowIndex, FColumnIndex].GetArea.Value := VA;
      RowIndex := EndRowIndex + 1;
    end
    else
    begin
      FParent.Range[RowIndex, FColumnIndex, RowIndex + ArrLen - 1, FColumnIndex].GetArea.Value := VA;
      RowIndex := RowIndex + ArrLen;
    end;
  end;
end;

procedure mnTExcelColumn.LoadFromArray(const BeginRowIndex, EndRowIndex: Integer; const Arr: array of TDateTime);
var
  VA: Variant;
  ArrLen: Integer;
  RowIndex: Integer;
begin
  ArrLen := Length(Arr);
  VA := VarArrayCreate([1, ArrLen, 1, 1], varVariant);
  mnBase2ArrayToVADim2(Arr, VA, 1, 1);

  RowIndex := BeginRowIndex;
  while RowIndex <= EndRowIndex do
  begin
    if EndRowIndex - RowIndex + 1 < ArrLen then
    begin
      FParent.Range[RowIndex, FColumnIndex, EndRowIndex, FColumnIndex].GetArea.Value := VA;
      RowIndex := EndRowIndex + 1;
    end
    else
    begin
      FParent.Range[RowIndex, FColumnIndex, RowIndex + ArrLen - 1, FColumnIndex].GetArea.Value := VA;
      RowIndex := RowIndex + ArrLen;
    end;
  end;
end;

procedure mnTExcelColumn.LoadFromArray(const BeginRowIndex, EndRowIndex: Integer; const Arr: array of Currency);
var
  VA: Variant;
  ArrLen: Integer;
  RowIndex: Integer;
begin
  ArrLen := Length(Arr);
  VA := VarArrayCreate([1, ArrLen, 1, 1], varVariant);
  mnBase2ArrayToVADim2(Arr, VA, 1, 1);

  RowIndex := BeginRowIndex;
  while RowIndex <= EndRowIndex do
  begin
    if EndRowIndex - RowIndex + 1 < ArrLen then
    begin
      FParent.Range[RowIndex, FColumnIndex, EndRowIndex, FColumnIndex].GetArea.Value := VA;
      RowIndex := EndRowIndex + 1;
    end
    else
    begin
      FParent.Range[RowIndex, FColumnIndex, RowIndex + ArrLen - 1, FColumnIndex].GetArea.Value := VA;
      RowIndex := RowIndex + ArrLen;
    end;
  end;
end;

procedure mnTExcelColumn.SaveToArray(const BeginRowIndex, EndRowIndex: Integer; var Arr: array of Variant);
var
  VA: Variant;
  ArrLen: Integer;
  RowCount: Integer;
begin
  ArrLen := Length(Arr);
  RowCount := EndRowIndex - BeginRowIndex + 1;
  mnCreateErrorIf(RowCount > ArrLen, SArrayTooShortForExcelRange);

  VA := FParent.Range[BeginRowIndex, FColumnIndex, EndRowIndex, FColumnIndex].GetArea.Value;
  mnAssert(VarArrayDimCount(VA) = 2);
  mnAssert(VarArrayLowBound(VA, 1) = 1);
  mnAssert(VarArrayHighBound(VA, 1) = RowCount);
  mnAssert(VarArrayLowBound(VA, 2) = 1);
  mnAssert(VarArrayHighBound(VA, 2) = 1);

  mnBase2VAToArrayDim2(VA, Arr, 1, RowCount, 1);
end;

procedure mnTExcelColumn.SaveToArray(const BeginRowIndex, EndRowIndex: Integer; var Arr: array of string);
var
  VA: Variant;
  ArrLen: Integer;
  RowCount: Integer;
begin
  ArrLen := Length(Arr);
  RowCount := EndRowIndex - BeginRowIndex + 1;
  mnCreateErrorIf(RowCount > ArrLen, SArrayTooShortForExcelRange);

  VA := FParent.Range[BeginRowIndex, FColumnIndex, EndRowIndex, FColumnIndex].GetArea.Value;
  mnAssert(VarArrayDimCount(VA) = 2);
  mnAssert(VarArrayLowBound(VA, 1) = 1);
  mnAssert(VarArrayHighBound(VA, 1) = RowCount);
  mnAssert(VarArrayLowBound(VA, 2) = 1);
  mnAssert(VarArrayHighBound(VA, 2) = 1);

  mnBase2VAToArrayDim2(VA, Arr, 1, RowCount, 1);
end;

procedure mnTExcelColumn.SaveToArray(const BeginRowIndex, EndRowIndex: Integer; var Arr: array of Integer);
var
  VA: Variant;
  ArrLen: Integer;
  RowCount: Integer;
begin
  ArrLen := Length(Arr);
  RowCount := EndRowIndex - BeginRowIndex + 1;
  mnCreateErrorIf(RowCount > ArrLen, SArrayTooShortForExcelRange);

  VA := FParent.Range[BeginRowIndex, FColumnIndex, EndRowIndex, FColumnIndex].GetArea.Value;
  mnAssert(VarArrayDimCount(VA) = 2);
  mnAssert(VarArrayLowBound(VA, 1) = 1);
  mnAssert(VarArrayHighBound(VA, 1) = RowCount);
  mnAssert(VarArrayLowBound(VA, 2) = 1);
  mnAssert(VarArrayHighBound(VA, 2) = 1);

  mnBase2VAToArrayDim2(VA, Arr, 1, RowCount, 1);
end;

procedure mnTExcelColumn.SaveToArray(const BeginRowIndex, EndRowIndex: Integer; var Arr: array of Extended);
var
  VA: Variant;
  ArrLen: Integer;
  RowCount: Integer;
begin
  ArrLen := Length(Arr);
  RowCount := EndRowIndex - BeginRowIndex + 1;
  mnCreateErrorIf(RowCount > ArrLen, SArrayTooShortForExcelRange);

  VA := FParent.Range[BeginRowIndex, FColumnIndex, EndRowIndex, FColumnIndex].GetArea.Value;
  mnAssert(VarArrayDimCount(VA) = 2);
  mnAssert(VarArrayLowBound(VA, 1) = 1);
  mnAssert(VarArrayHighBound(VA, 1) = RowCount);
  mnAssert(VarArrayLowBound(VA, 2) = 1);
  mnAssert(VarArrayHighBound(VA, 2) = 1);

  mnBase2VAToArrayDim2(VA, Arr, 1, RowCount, 1);
end;

procedure mnTExcelColumn.SaveToArray(const BeginRowIndex, EndRowIndex: Integer; var Arr: array of TDateTime);
var
  VA: Variant;
  ArrLen: Integer;
  RowCount: Integer;
begin
  ArrLen := Length(Arr);
  RowCount := EndRowIndex - BeginRowIndex + 1;
  mnCreateErrorIf(RowCount > ArrLen, SArrayTooShortForExcelRange);

  VA := FParent.Range[BeginRowIndex, FColumnIndex, EndRowIndex, FColumnIndex].GetArea.Value;
  mnAssert(VarArrayDimCount(VA) = 2);
  mnAssert(VarArrayLowBound(VA, 1) = 1);
  mnAssert(VarArrayHighBound(VA, 1) = RowCount);
  mnAssert(VarArrayLowBound(VA, 2) = 1);
  mnAssert(VarArrayHighBound(VA, 2) = 1);

  mnBase2VAToArrayDim2(VA, Arr, 1, RowCount, 1);
end;

procedure mnTExcelColumn.SaveToArray(const BeginRowIndex, EndRowIndex: Integer; var Arr: array of Currency);
var
  VA: Variant;
  ArrLen: Integer;
  RowCount: Integer;
begin
  ArrLen := Length(Arr);
  RowCount := EndRowIndex - BeginRowIndex + 1;
  mnCreateErrorIf(RowCount > ArrLen, SArrayTooShortForExcelRange);

  VA := FParent.Range[BeginRowIndex, FColumnIndex, EndRowIndex, FColumnIndex].GetArea.Value;
  mnAssert(VarArrayDimCount(VA) = 2);
  mnAssert(VarArrayLowBound(VA, 1) = 1);
  mnAssert(VarArrayHighBound(VA, 1) = RowCount);
  mnAssert(VarArrayLowBound(VA, 2) = 1);
  mnAssert(VarArrayHighBound(VA, 2) = 1);

  mnBase2VAToArrayDim2(VA, Arr, 1, RowCount, 1);
end;

procedure mnTExcelColumn.AutoFit;
begin
  GetArea.AutoFit;
end;

{ mnTExcelRange }

function mnTExcelRange.GetArea: Variant;
begin
  Result := FParent.ActiveSheet.Range[FParent.ActiveSheet.Cells[FTopRowIndex, FLeftColumnIndex],
                                      FParent.ActiveSheet.Cells[FBottomRowIndex, FRightColumnIndex]];
end;

procedure mnTExcelRange.Locate(const ATopRowIndex, ALeftColumnIndex, ABottomRowIndex, ARightColumnIndex: Integer);
begin
  FTopRowIndex := ATopRowIndex;
  FLeftColumnIndex := ALeftColumnIndex;
  FBottomRowIndex := ABottomRowIndex;
  FRightColumnIndex := ARightColumnIndex;
  mnAssert(GetArea.Row = ATopRowIndex);
  mnAssert(GetArea.Column = ALeftColumnIndex);
end;

procedure mnTExcelRange.LoadFromVA(const VA: Variant);
var
  Len1, Len2: Integer;
  RowIndex, ColumnIndex: Integer;
begin
  Len1 := mnVALength(VA, 1);
  Len2 := mnVALength(VA, 2);
  RowIndex := FTopRowIndex;
  while RowIndex <= FBottomRowIndex do
  begin
    if FBottomRowIndex - RowIndex + 1 < Len1 then
    begin
      ColumnIndex := FLeftColumnIndex;
      while ColumnIndex <= FRightColumnIndex do
      begin
        if FRightColumnIndex - ColumnIndex + 1 < Len2 then
        begin
          FParent.Range[RowIndex, ColumnIndex, FBottomRowIndex, FRightColumnIndex].GetArea.Value := VA;
          ColumnIndex := FRightColumnIndex + 1;
        end
        else
        begin
          FParent.Range[RowIndex, ColumnIndex, FBottomRowIndex, ColumnIndex + Len2 - 1].GetArea.Value := VA;
          ColumnIndex := ColumnIndex + Len2;
        end;
      end;
      RowIndex := FBottomRowIndex + 1;
    end
    else
    begin
      ColumnIndex := FLeftColumnIndex;
      while ColumnIndex <= FRightColumnIndex do
      begin
        if FRightColumnIndex - ColumnIndex + 1 < Len2 then
        begin
          FParent.Range[RowIndex, ColumnIndex, RowIndex + Len1 - 1, FRightColumnIndex].GetArea.Value := VA;
          ColumnIndex := FRightColumnIndex + 1;
        end
        else
        begin
          FParent.Range[RowIndex, ColumnIndex, RowIndex + Len1 - 1, ColumnIndex + Len2 - 1].GetArea.Value := VA;
          ColumnIndex := ColumnIndex + Len2;
        end;
      end;
      RowIndex := RowIndex + Len1;
    end;
  end;
end;

procedure mnTExcelRange.LoadFromArray(const Arr: mnTVarArrayDim2);
var
  VA: Variant;
begin
  VA := mnArrayToVADim2(Arr);
  LoadFromVA(VA);
end;

procedure mnTExcelRange.LoadFromArray(const Arr: mnTStrArrayDim2);
var
  VA: Variant;
begin
  VA := mnArrayToVADim2(Arr);
  LoadFromVA(VA);
end;

procedure mnTExcelRange.LoadFromArray(const Arr: mnTIntArrayDim2);
var
  VA: Variant;
begin
  VA := mnArrayToVADim2(Arr);
  LoadFromVA(VA);
end;

function mnTExcelRange.SaveToVA: Variant;
begin
  // if just one cell
  if (FTopRowIndex = FBottomRowIndex) and (FLeftColumnIndex = FRightColumnIndex) then
  begin
    Result := VarArrayCreate([1, 1, 1, 1], varVariant);
    VarArrayPut(Result, FParent.Cells[FTopRowIndex, FLeftColumnIndex].Value, [1, 1]);
    Exit;
  end;

  Result := GetArea.Value;
end;

procedure mnTExcelRange.SaveToArray(var Arr: mnTVarArrayDim2);
var
  VA: Variant;
  RowCount, ColumnCount: Integer;
begin
  RowCount := FBottomRowIndex - FTopRowIndex + 1;
  ColumnCount := FRightColumnIndex - FLeftColumnIndex + 1;
  mnCreateErrorIf(RowCount > Length(Arr), SArrayTooShortForExcelRange);
  mnCreateErrorIf(ColumnCount > Length(Arr[0]), SArrayTooShortForExcelRange);

  // if just one cell
  if (FTopRowIndex = FBottomRowIndex) and (FLeftColumnIndex = FRightColumnIndex) then
  begin
    Arr[0][0] := FParent.Cells[FTopRowIndex, FLeftColumnIndex].Value;
    Exit;
  end;

  VA := GetArea.Value;
  mnAssert(VarArrayDimCount(VA) = 2);
  mnAssert(VarArrayLowBound(VA, 1) = 1);
  mnAssert(VarArrayHighBound(VA, 1) = RowCount);
  mnAssert(VarArrayLowBound(VA, 2) = 1);
  mnAssert(VarArrayHighBound(VA, 2) = ColumnCount);

  mnVAToArrayDim2(VA, Arr);
end;

procedure mnTExcelRange.SaveToArray(var Arr: mnTStrArrayDim2);
var
  VA: Variant;
  RowCount, ColumnCount: Integer;
begin
  RowCount := FBottomRowIndex - FTopRowIndex + 1;
  ColumnCount := FRightColumnIndex - FLeftColumnIndex + 1;
  mnCreateErrorIf(RowCount > Length(Arr), SArrayTooShortForExcelRange);
  mnCreateErrorIf(ColumnCount > Length(Arr[0]), SArrayTooShortForExcelRange);

  // if just one cell
  if (FTopRowIndex = FBottomRowIndex) and (FLeftColumnIndex = FRightColumnIndex) then
  begin
    Arr[0][0] := FParent.Cells[FTopRowIndex, FLeftColumnIndex].Value;
    Exit;
  end;

  VA := GetArea.Value;
  mnAssert(VarArrayDimCount(VA) = 2);
  mnAssert(VarArrayLowBound(VA, 1) = 1);
  mnAssert(VarArrayHighBound(VA, 1) = RowCount);
  mnAssert(VarArrayLowBound(VA, 2) = 1);
  mnAssert(VarArrayHighBound(VA, 2) = ColumnCount);

  mnVAToArrayDim2(VA, Arr);
end;

procedure mnTExcelRange.SaveToArray(var Arr: mnTIntArrayDim2);
var
  VA: Variant;
  RowCount, ColumnCount: Integer;
begin
  RowCount := FBottomRowIndex - FTopRowIndex + 1;
  ColumnCount := FRightColumnIndex - FLeftColumnIndex + 1;
  mnCreateErrorIf(RowCount > Length(Arr), SArrayTooShortForExcelRange);
  mnCreateErrorIf(ColumnCount > Length(Arr[0]), SArrayTooShortForExcelRange);

  // if just one cell
  if (FTopRowIndex = FBottomRowIndex) and (FLeftColumnIndex = FRightColumnIndex) then
  begin
    Arr[0][0] := FParent.Cells[FTopRowIndex, FLeftColumnIndex].Value;
    Exit;
  end;

  VA := GetArea.Value;
  mnAssert(VarArrayDimCount(VA) = 2);
  mnAssert(VarArrayLowBound(VA, 1) = 1);
  mnAssert(VarArrayHighBound(VA, 1) = RowCount);
  mnAssert(VarArrayLowBound(VA, 2) = 1);
  mnAssert(VarArrayHighBound(VA, 2) = ColumnCount);

  mnVAToArrayDim2(VA, Arr);
end;

procedure mnTExcelRange.SaveToArray_A(var Arr: mnTVarArrayDim2);
var
  VA: Variant;
  RowCount, ColumnCount: Integer;
begin
  RowCount := FBottomRowIndex - FTopRowIndex + 1;
  ColumnCount := FRightColumnIndex - FLeftColumnIndex + 1;
  SetLength(Arr, RowCount, ColumnCount);

  // if just one cell
  if (FTopRowIndex = FBottomRowIndex) and (FLeftColumnIndex = FRightColumnIndex) then
  begin
    Arr[0][0] := FParent.Cells[FTopRowIndex, FLeftColumnIndex].Value;
    Exit;
  end;

  VA := GetArea.Value;
  mnAssert(VarArrayDimCount(VA) = 2);
  mnAssert(VarArrayLowBound(VA, 1) = 1);
  mnAssert(VarArrayHighBound(VA, 1) = RowCount);
  mnAssert(VarArrayLowBound(VA, 2) = 1);
  mnAssert(VarArrayHighBound(VA, 2) = ColumnCount);

  mnVAToArrayDim2(VA, Arr);
end;

procedure mnTExcelRange.SaveToArray_A(var Arr: mnTStrArrayDim2);
var
  VA: Variant;
  RowCount, ColumnCount: Integer;
begin
  RowCount := FBottomRowIndex - FTopRowIndex + 1;
  ColumnCount := FRightColumnIndex - FLeftColumnIndex + 1;
  SetLength(Arr, RowCount, ColumnCount);

  // if just one cell
  if (FTopRowIndex = FBottomRowIndex) and (FLeftColumnIndex = FRightColumnIndex) then
  begin
    Arr[0][0] := FParent.Cells[FTopRowIndex, FLeftColumnIndex].Value;
    Exit;
  end;

  VA := GetArea.Value;
  mnAssert(VarArrayDimCount(VA) = 2);
  mnAssert(VarArrayLowBound(VA, 1) = 1);
  mnAssert(VarArrayHighBound(VA, 1) = RowCount);
  mnAssert(VarArrayLowBound(VA, 2) = 1);
  mnAssert(VarArrayHighBound(VA, 2) = ColumnCount);

  mnVAToArrayDim2(VA, Arr);
end;

procedure mnTExcelRange.SaveToArray_A(var Arr: mnTIntArrayDim2);
var
  VA: Variant;
  RowCount, ColumnCount: Integer;
begin
  RowCount := FBottomRowIndex - FTopRowIndex + 1;
  ColumnCount := FRightColumnIndex - FLeftColumnIndex + 1;
  SetLength(Arr, RowCount, ColumnCount);

  // if just one cell
  if (FTopRowIndex = FBottomRowIndex) and (FLeftColumnIndex = FRightColumnIndex) then
  begin
    Arr[0][0] := FParent.Cells[FTopRowIndex, FLeftColumnIndex].Value;
    Exit;
  end;

  VA := GetArea.Value;
  mnAssert(VarArrayDimCount(VA) = 2);
  mnAssert(VarArrayLowBound(VA, 1) = 1);
  mnAssert(VarArrayHighBound(VA, 1) = RowCount);
  mnAssert(VarArrayLowBound(VA, 2) = 1);
  mnAssert(VarArrayHighBound(VA, 2) = ColumnCount);

  mnVAToArrayDim2(VA, Arr);
end;

function mnTExcelRange.IsSameAs(AnotherRange: mnTExcelRange): Boolean;
var
  Arr, AnotherArr: mnTVarArrayDim2;
  RowCount, ColumnCount: Integer;
  RowIndex, ColumnIndex: Integer;
begin
  Result := (BottomRowIndex - TopRowIndex = AnotherRange.BottomRowIndex - AnotherRange.TopRowIndex) and
            (RightColumnIndex - LeftColumnIndex = AnotherRange.RightColumnIndex - AnotherRange.LeftColumnIndex);
  if not Result then Exit;

  RowCount := BottomRowIndex - TopRowIndex + 1;
  ColumnCount := RightColumnIndex - LeftColumnIndex + 1;
  SetLength(Arr, RowCount, ColumnCount);
  SetLength(AnotherArr, RowCount, ColumnCount);
  SaveToArray(Arr);
  AnotherRange.SaveToArray(AnotherArr);

  for RowIndex := 0 to RowCount-1 do
    for ColumnIndex := 0 to ColumnCount-1 do
    begin
      Result := mnCompareVarLoose(Arr[RowIndex, ColumnIndex], AnotherArr[RowIndex, ColumnIndex]);
      if not Result then Exit;
    end;
end;

{ mnTExcel }

function mnTExcel.GetCell(ARowIndex, AColumnIndex: Integer): mnTExcelCell;
var
  i: Integer;
  ACell: mnTExcelCell;
begin
  for i := 0 to FCells.Count-1 do
  begin
    ACell := FCells[i] as mnTExcelCell;
    if (ACell.RowIndex = ARowIndex) and (ACell.ColumnIndex = AColumnIndex) then
    begin
      Result := ACell;
      Exit;
    end;
  end;

  ACell := mnTExcelCell.Create(Self);
  FCells.Add(ACell);
  ACell.Locate(ARowIndex, AColumnIndex);
  Result := ACell;
end;

function mnTExcel.GetRow(ARowIndex: Integer): mnTExcelRow;
var
  i: Integer;
  ARow: mnTExcelRow;
begin
  for i := 0 to FRows.Count-1 do
  begin
    ARow := FRows[i] as mnTExcelRow;
    if ARow.RowIndex = ARowIndex then
    begin
      Result := ARow;
      Exit;
    end;
  end;

  ARow := mnTExcelRow.Create(Self);
  FRows.Add(ARow);
  ARow.Locate(ARowIndex);
  Result := ARow;
end;

function mnTExcel.GetColumn(AColumnIndex: Integer): mnTExcelColumn;
var
  i: Integer;
  AColumn: mnTExcelColumn;
begin
  for i := 0 to FColumns.Count-1 do
  begin
    AColumn := FColumns[i] as mnTExcelColumn;
    if AColumn.ColumnIndex = AColumnIndex then
    begin
      Result := AColumn;
      Exit;
    end;
  end;

  AColumn := mnTExcelColumn.Create(Self);
  FColumns.Add(AColumn);
  AColumn.Locate(AColumnIndex);
  Result := AColumn;
end;

function mnTExcel.GetRange(ATopRowIndex, ALeftColumnIndex, ABottomRowIndex, ARightColumnIndex: Integer): mnTExcelRange;
var
  i: Integer;
  Range: mnTExcelRange;
begin
  for i := 0 to FRanges.Count-1 do
  begin
    Range := FRanges[i] as mnTExcelRange;
    if (Range.TopRowIndex = ATopRowIndex) and (Range.LeftColumnIndex = ALeftColumnIndex) and
      (Range.BottomRowIndex = ABottomRowIndex) and (Range.RightColumnIndex = ARightColumnIndex) then
    begin
      Result := Range;
      Exit;
    end;
  end;

  Range := mnTExcelRange.Create(Self);
  FRanges.Add(Range);
  Range.Locate(ATopRowIndex, ALeftColumnIndex, ABottomRowIndex, ARightColumnIndex);
  Result := Range;
end;

constructor mnTExcel.Create;
begin
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.DisplayAlerts := False;
  ExcelBook := Unassigned;

  FGlobal := mnTExcelGlobal.Create(Self);
  FUsedRange := mnTExcelUsedRange.Create(Self);
  FCells := TObjectList.Create;
  FRows := TObjectList.Create;
  FColumns := TObjectList.Create;
  FRanges := TObjectList.Create;
end;

destructor mnTExcel.Destroy;
begin
  FGlobal.Free;
  FUsedRange.Free;
  FCells.Free;
  FRows.Free;
  FColumns.Free;
  FRanges.Free;

  Close;
  ExcelApp.Quit;
  ExcelApp := Unassigned;
  inherited;
end;

procedure mnTExcel.New;
begin
  Close;
  FFileName := '';
  ExcelBook := ExcelApp.WorkBooks.Add;
end;

procedure mnTExcel.Open(const AFileName: string);
begin
  Close;
  FFileName := AFileName;
  ExcelBook := ExcelApp.WorkBooks.Open(FFileName);
end;

procedure mnTExcel.Close;
begin
  if not VarIsEmpty(ExcelBook) then
  begin
    ExcelBook.Close(xlDoNotSaveChanges);
    ExcelBook := Unassigned;
  end;
end;

procedure mnTExcel.Save;
begin
  mnCreateErrorIf(FFileName = '', SExcelFileNameNotAssigned);
  ExcelBook.Save;
end;

procedure mnTExcel.SaveAs(const AFileName: string);
begin
  FFileName := AFileName;
  ExcelBook.SaveAs(FFileName);
end;

function mnTExcel.GetVisible: Boolean;
begin
  Result := ExcelApp.Visible;
end;

procedure mnTExcel.SetVisible(const Value: Boolean);
begin
  ExcelApp.Visible := Value;
end;

function mnTExcel.GetActiveCell: mnTExcelCell;
begin
  Result := Cells[ExcelApp.ActiveCell.Row, ExcelApp.ActiveCell.Column];
end;

function mnTExcel.GetActiveSheet: Variant;
begin
{$IFDEF MN_DEBUG}
  mnCreateErrorIf(VarIsEmpty(ExcelBook), SExcelBookNotAssigned);
{$ENDIF}
  Result := ExcelBook.ActiveSheet;
end;

function mnTExcel.GetActiveSheetIndex: Integer;
begin
  Result := ExcelBook.ActiveSheet.Index;
end;

function mnTExcel.GetSheetCount: Integer;
begin
  Result := ExcelBook.WorkSheets.Count;
end;

function mnTExcel.GetSheetName(Index: Integer): string;
begin
  Result := ExcelBook.WorkSheets[Index].Name;
end;

procedure mnTExcel.SetSheetName(Index: Integer; const Value: string);
begin
  ExcelBook.WorkSheets[Index].Name := Value;
end;

procedure mnTExcel.SetActiveSheet(const Index: Integer);
begin
  mnCreateErrorIf(not mnBetweenII(Index, 1, SheetCount), SSheetIndexError, [Index, SheetCount]);
  ExcelBook.WorkSheets[Index].Activate;
end;

procedure mnTExcel.AddSheet;
begin
  ExcelBook.WorkSheets.Add;
end;

procedure mnTExcel.DeleteSheet(const Index: Integer);
begin
  mnCreateErrorIf(not mnBetweenII(Index, 1, SheetCount), SSheetIndexError, [Index, SheetCount]);
  mnCreateErrorIf(GetSheetCount = 1, SAtLeastOneSheet);
  ExcelBook.WorkSheets[Index].Delete;
end;

function mnTExcel.IsSameAs(AnotherExcel: mnTExcel): Boolean;
var
  StoredActiveSheetIndex, StoredAnotherActiveSheetIndex: Integer;
  i: Integer;
  RowCount, ColumnCount: Integer;
begin
  Result := SheetCount = AnotherExcel.SheetCount;
  if not Result then Exit;

  StoredActiveSheetIndex := ActiveSheetIndex;
  StoredAnotherActiveSheetIndex := AnotherExcel.ActiveSheetIndex;
  try
    for i := 1 to SheetCount do
    begin
      Result := SheetNames[i] = AnotherExcel.SheetNames[i];
      if not Result then Exit;

      SetActiveSheet(i);
      AnotherExcel.SetActiveSheet(i);

      RowCount := Self.RowCount;
      ColumnCount := Self.ColumnCount;
      Result := (RowCount = AnotherExcel.RowCount) and (ColumnCount = AnotherExcel.ColumnCount);
      if not Result then Exit;

      Result := Range[1, 1, RowCount, ColumnCount].IsSameAs(AnotherExcel.Range[1, 1, RowCount, ColumnCount]);
      if not Result then Exit;
    end;
  finally
    SetActiveSheet(StoredActiveSheetIndex);
    AnotherExcel.SetActiveSheet(StoredAnotherActiveSheetIndex);
  end;
end;

function mnTExcel.GetSimpleRowCount: Integer;
begin
  Result := ActiveSheet.Cells.SpecialCells(xlCellTypeLastCell).Row;
end;

function mnTExcel.GetSimpleColumnCount: Integer;
begin
  Result := ActiveSheet.Cells.SpecialCells(xlCellTypeLastCell).Column;
end;

function mnTExcel.GetRowCount: Integer;
var
  VA: Variant;
  i: Integer;
begin
  Result := GetSimpleRowCount;
  while Result > 1 do
  begin
    VA := ActiveSheet.Range[ActiveSheet.Cells[Result, 1], ActiveSheet.Cells[Result, GetSimpleColumnCount]].Value;
    for i := 1 to GetSimpleColumnCount do
      if not VarIsEmpty(VarArrayGet(VA, [1, i])) then Exit;
    Result := Result - 1;
  end;
end;

function mnTExcel.GetColumnCount: Integer;
var
  VA: Variant;
  i: Integer;
begin
  Result := GetSimpleColumnCount;
  while Result > 1 do
  begin
    VA := ActiveSheet.Range[ActiveSheet.Cells[1, Result], ActiveSheet.Cells[GetSimpleRowCount, Result]].Value;
    for i := 1 to GetSimpleRowCount do
      if not VarIsEmpty(VarArrayGet(VA, [i, 1])) then Exit;
    Result := Result - 1;
  end;
end;

procedure mnTExcel.SetPageCenterHeader(const Header: string);
begin
  ActiveSheet.PageSetup.CenterHeader := Header;
end;

procedure mnTExcel.SetPageCenterFooter(const Footer: string);
begin
  ActiveSheet.PageSetup.CenterFooter := Footer;
end;

procedure mnTExcel.SetPageHeaderMargin(const Margin: Extended);
begin
  ActiveSheet.PageSetup.HeaderMargin := Margin;
end;

procedure mnTExcel.SetPageFooterMargin(const Margin: Extended);
begin
  ActiveSheet.PageSetup.FooterMargin := Margin;
end;

procedure mnTExcel.SetPageTopMargin(const Margin: Extended);
begin
  ActiveSheet.PageSetup.TopMargin := Margin;
end;

procedure mnTExcel.SetPageBottomMargin(const Margin: Extended);
begin
  ActiveSheet.PageSetup.BottomMargin := Margin;
end;

procedure mnTExcel.SetPageLeftMargin(const Margin: Extended);
begin
  ActiveSheet.PageSetup.LeftMargin := Margin;
end;

procedure mnTExcel.SetPageRightMargin(const Margin: Extended);
begin
  ActiveSheet.PageSetup.RightMargin := Margin;
end;

procedure mnTExcel.SetPageCenterHorizontally(const Center: Boolean);
begin
  ActiveSheet.PageSetup.CenterHorizontally := Center;
end;

procedure mnTExcel.SetPageCenterVertically(const Center: Boolean);
begin
  ActiveSheet.PageSetup.CenterVertically := Center;
end;

procedure mnTExcel.SetPagePrintGridLines(const PrintGridLines: Boolean);
begin
  ActiveSheet.PageSetup.PrintGridLines := PrintGridLines;
end;

procedure mnTExcel.PrintPreview;
begin
  ActiveSheet.PrintPreview;
end;

procedure mnTExcel.Print;
begin
  ActiveSheet.PrintOut;
end;

const
  wdDoNotSaveChanges = $00000000;
  wdFindContinue = $00000001;
  wdCharacter = $00000001;
  wdScreen = $00000007;
  wdHeaderFooterPrimary = $00000001;

{ mnTWordArea }

constructor mnTWordArea.Create(AParent: mnTWord);
begin
  FParent := AParent;
end;

function mnTWordArea.GetText: string;
begin
  Result := GetArea.Text;
end;

procedure mnTWordArea.SetText(const Value: string);
begin
  GetArea.Text := Value;
end;

procedure mnTWordArea.SetFontName(const FontName: string);
begin
  GetArea.Font.Name := FontName;
end;

procedure mnTWordArea.SetFontSize(const FontSize: Extended);
begin
  GetArea.Font.Size := FontSize;
end;

procedure mnTWordArea.SetFontColor(const FontColor: TColor);
begin
  GetArea.Font.Color := FontColor;
end;

procedure mnTWordArea.SetFontStyles(const FontStyles: TFontStyles);
begin
  GetArea.Font.Bold := fsBold in FontStyles;
  GetArea.Font.Italic := fsItalic in FontStyles;
  GetArea.Font.UnderLine := fsUnderline in FontStyles;
end;

procedure mnTWordArea.Copy;
begin
  GetArea.Copy;
end;

procedure mnTWordArea.Paste;
begin
  GetArea.Paste;
end;

procedure mnTWordArea.Select;
begin
  GetArea.Select;
end;

function mnTWordArea.Replace(const OldText, NewText: string; const MatchCase: Boolean = True; const MatchWholeWord: Boolean = False): Boolean;
begin
  Result := GetArea.Find.Execute(OldText, MatchCase, MatchWholeWord, False, False, False,
    True, wdFindContinue, False, NewText, True);
end;

procedure mnTWordArea.ReplaceAll(const OldText, NewText: string; const MatchCase: Boolean = True; const MatchWholeWord: Boolean = False);
begin
  while Replace(OldText, NewText, MatchCase, MatchWholeWord) do;
end;

{ mnTWordGlobal }

function mnTWordGlobal.GetArea: Variant;
begin
  Result := FParent.WordDoc.Range;
end;

{ mnTWordSelection }

function mnTWordSelection.GetArea: Variant;
begin
  Result := FParent.WordApp.Selection;
end;

procedure mnTWordSelection.TypeText(const Text: string);
begin
  GetArea.TypeText(Text);
end;

procedure mnTWordSelection.InsertText(const Text: string);
begin
  GetArea.Range.Text := Text;
end;

procedure mnTWordSelection.GotoBegin;
begin
  while GetArea.MoveUp(wdScreen, 1) >= 1 do Sleep(10);
  while GetArea.MoveLeft(wdCharacter, 1) >= 1 do Sleep(10);
end;

procedure mnTWordSelection.GotoEnd;
begin
  while GetArea.MoveDown(wdScreen, 1) >= 1 do Sleep(10);
  while GetArea.MoveRight(wdCharacter, 1) >= 1 do Sleep(10);
end;

procedure mnTWordSelection.InsertTable(const RowCount, ColumnCount: Integer; const RealLine: Boolean = True);
begin
  FParent.WordDoc.Tables.Add(GetArea.Range, RowCount, ColumnCount, RealLine);
end;

{ mnTWordParagraph }

function mnTWordParagraph.GetArea: Variant;
begin
  Result := FParent.WordDoc.Paragraphs.Item(FParagraphIndex).Range;
end;

procedure mnTWordParagraph.Locate(const AParagraphIndex: Integer);
begin
  FParagraphIndex := AParagraphIndex;
end;

{ mnTWordTable }

function mnTWordTable.GetArea: Variant;
begin
  Result := FParent.WordDoc.Tables.Item(FTableIndex).Range;
end;

function mnTWordTable.GetComObject: Variant;
begin
  Result := FParent.WordDoc.Tables.Item(FTableIndex);
end;

procedure mnTWordTable.Locate(const ATableIndex: Integer);
begin
  FTableIndex := ATableIndex;
end;

function mnTWordTable.GetRowCount: Integer;
begin
  Result := GetComObject.Rows.Count;
end;

procedure mnTWordTable.SetRowCount(const Value: Integer);
var
  OldRowCount: Integer;
  i: Integer;
begin
  OldRowCount := GetRowCount;
  if Value > OldRowCount then
    for i := OldRowCount+1 to Value do AddRow
  else if Value < OldRowCount then
    for i := OldRowCount downto Value+1 do DeleteRow(i);
end;

function mnTWordTable.GetColumnCount: Integer;
begin
  Result := GetComObject.Columns.Count;
end;

procedure mnTWordTable.SetColumnCount(const Value: Integer);
var
  OldColumnCount: Integer;
  i: Integer;
begin
  OldColumnCount := GetColumnCount;
  if Value > OldColumnCount then
    for i := OldColumnCount+1 to Value do AddColumn
  else if Value < OldColumnCount then
    for i := OldColumnCount downto Value+1 do DeleteColumn(i);
end;

function mnTWordTable.AddRow: Integer;
begin
  GetComObject.Rows.Add;
  Result := RowCount;
end;

function mnTWordTable.AddColumn: Integer;
begin
  GetComObject.Columns.Add;
  Result := ColumnCount;
end;

procedure mnTWordTable.DeleteRow(const ARowIndex: Integer);
begin
  GetComObject.Rows.Item(ARowIndex).Delete;
end;

procedure mnTWordTable.DeleteColumn(const AColumnIndex: Integer);
begin
  GetComObject.Columns.Item(AColumnIndex).Delete;
end;

{ mnTWordCell }

function mnTWordCell.GetArea: Variant;
begin
  Result := FParent.WordDoc.Tables.Item(FTableIndex).Cell(FRowIndex, FColumnIndex).Range;
end;

procedure mnTWordCell.Locate(const ATableIndex, ARowIndex, AColumnIndex: Integer);
begin
  FTableIndex := ATableIndex;
  FRowIndex := ARowIndex;
  FColumnIndex := AColumnIndex;
end;

function mnTWordCell.GetActualText: string;
begin
  Result := mnRemoveRight(#13#7, GetText);
end;

{ mnTWordHeader }

function mnTWordHeader.GetArea: Variant;
begin
  Result := FParent.WordDoc.Sections.Item(1).Headers.Item(wdHeaderFooterPrimary).Range;
end;

{ mnTWordFooter }

function mnTWordFooter.GetArea: Variant;
begin
  Result := FParent.WordDoc.Sections.Item(1).Footers.Item(wdHeaderFooterPrimary).Range;
end;

{ mnTWord }

function mnTWord.GetParagraph(AParagraphIndex: Integer): mnTWordParagraph;
var
  i: Integer;
  AParagraph: mnTWordParagraph;
begin
  for i := 0 to FParagraphs.Count-1 do
  begin
    AParagraph := FParagraphs[i] as mnTWordParagraph;
    if AParagraph.ParagraphIndex = AParagraphIndex then
    begin
      Result := AParagraph;
      Exit;
    end;
  end;

  AParagraph := mnTWordParagraph.Create(Self);
  FParagraphs.Add(AParagraph);
  AParagraph.Locate(AParagraphIndex);
  Result := AParagraph;
end;

function mnTWord.GetTable(ATableIndex: Integer): mnTWordTable;
var
  i: Integer;
  ATable: mnTWordTable;
begin
  for i := 0 to FTables.Count-1 do
  begin
    ATable := FTables[i] as mnTWordTable;
    if ATable.TableIndex = ATableIndex then
    begin
      Result := ATable;
      Exit;
    end;
  end;

  ATable := mnTWordTable.Create(Self);
  FTables.Add(ATable);
  ATable.Locate(ATableIndex);
  Result := ATable;
end;

function mnTWord.GetCell(ATableIndex, ARowIndex, AColumnIndex: Integer): mnTWordCell;
var
  i: Integer;
  ACell: mnTWordCell;
begin
  for i := 0 to FCells.Count-1 do
  begin
    ACell := FCells[i] as mnTWordCell;
    if (ACell.TableIndex = ATableIndex) and (ACell.RowIndex = ARowIndex) and (ACell.ColumnIndex = AColumnIndex) then
    begin
      Result := ACell;
      Exit;
    end;
  end;

  ACell := mnTWordCell.Create(Self);
  FCells.Add(ACell);
  ACell.Locate(ATableIndex, ARowIndex, AColumnIndex);
  Result := ACell;
end;

constructor mnTWord.Create;
begin
  WordApp := CreateOleObject('Word.Application');
  WordApp.DisplayAlerts := False;
  WordApp.Options.CheckSpellingAsYouType := False;
  WordApp.Options.CheckGrammarAsYouType := False;
  WordDoc := Unassigned;

  FGlobal := mnTWordGlobal.Create(Self);
  FSelection := mnTWordSelection.Create(Self);
  FParagraphs := TObjectList.Create;
  FTables := TObjectList.Create;
  FCells := TObjectList.Create;
  FHeader := mnTWordHeader.Create(Self);
  FFooter := mnTWordFooter.Create(Self);
end;

destructor mnTWord.Destroy;
begin
  FGlobal.Free;
  FSelection.Free;
  FParagraphs.Free;
  FTables.Free;
  FCells.Free;
  FHeader.Free;
  FFooter.Free;

  Close;
  WordApp.Quit(wdDoNotSaveChanges);
  WordApp := Unassigned;
  inherited;
end;

procedure mnTWord.New;
begin
  Close;
  FFileName := '';
  WordDoc := WordApp.Documents.Add;
end;

procedure mnTWord.Open(const AFileName: string);
begin
  Close;
  FFileName := AFileName;
  WordDoc := WordApp.Documents.Open(FFileName);
end;

procedure mnTWord.Close;
begin
  if not VarIsEmpty(WordDoc) then
  begin
    WordDoc.Close(wdDoNotSaveChanges);
    WordDoc := Unassigned;
  end;
end;

procedure mnTWord.Save;
begin
  mnCreateErrorIf(FFileName = '', SWordFileNameNotAssigned);
  WordDoc.Save;
end;

procedure mnTWord.SaveAs(const AFileName: string);
begin
  FFileName := AFileName;
  WordDoc.SaveAs(FFileName);
end;

function mnTWord.GetVisible: Boolean;
begin
  Result := WordApp.Visible;
end;

procedure mnTWord.SetVisible(const Value: Boolean);
begin
  WordApp.Visible := Value;
end;

function mnTWord.IsSameAs(AnotherWord: mnTWord): Boolean;
begin
  Result := Global.Text = AnotherWord.Global.Text;
end;

function mnTWord.GetParagraphCount: Integer;
begin
  Result := WordDoc.Paragraphs.Count;
end;

function mnTWord.GetTableCount: Integer;
begin
  Result := WordDoc.Tables.Count;
end;

initialization

  OleInitialize(nil);

finalization

  OleUninitialize;

end.
