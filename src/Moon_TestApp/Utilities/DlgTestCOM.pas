unit DlgTestCOM;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Menus, cxLookAndFeelPainters, cxButtons, DlgTest, mnCOM,
  ComCtrls, Dialogs;

type
  TTestCOMDialog = class(TTestDialog)
    pcCOM: TPageControl;
    tsExcel: TTabSheet;
    tsWord: TTabSheet;
    btnNewExcel: TButton;
    btnCloseExcel: TButton;
    cbExcelAreaType: TComboBox;
    Label1: TLabel;
    gbExcelCellLocation: TGroupBox;
    gbExcelRowLocation: TGroupBox;
    gbExcelColumnLocation: TGroupBox;
    gbExcelRangeLocation: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtExcelCellRowIndex: TEdit;
    edtExcelCellColumnIndex: TEdit;
    edtExcelRowRowIndex: TEdit;
    edtExcelColumnColumnIndex: TEdit;
    edtExcelRangeRightColumnIndex: TEdit;
    edtExcelRangeBottomRowIndex: TEdit;
    edtExcelRangeLeftColumnIndex: TEdit;
    edtExcelRangeTopRowIndex: TEdit;
    btnGetColumnWidth: TButton;
    btnSetColumnWidth: TButton;
    btnGetRowHeight: TButton;
    btnSetRowHeight: TButton;
    btnSetWrapText: TButton;
    btnSetPageBreak: TButton;
    btnSetBorderWeight: TButton;
    btnSetBorderLineStyle: TButton;
    cbExcelBordersIndex: TComboBox;
    cbExcelBorderWeight: TComboBox;
    cbExcelLineStyle: TComboBox;
    btnSetFont: TButton;
    fdExcel: TFontDialog;
    btnSetAlignment: TButton;
    cbExcelHorizontalAlignment: TComboBox;
    cbExcelVerticalAlignment: TComboBox;
    btnClearContents: TButton;
    btnClear: TButton;
    btnCopy: TButton;
    btnPaste: TButton;
    btnMerge: TButton;
    btnUnmerge: TButton;
    btnSetFormatToNormal: TButton;
    gbExcelCellTest: TGroupBox;
    gbExcelRowTest: TGroupBox;
    gbExcelRangeTest: TGroupBox;
    btnGetCellValue: TButton;
    btnSetCellValue: TButton;
    gbExcelColumnTest: TGroupBox;
    gbExcelTest: TGroupBox;
    btnSheetInfo: TButton;
    btnRowColumnCount: TButton;
    btnInsert: TButton;
    btnDelete: TButton;
    btnSetFillColor: TButton;
    cdExcel: TColorDialog;
    btnGetAnchor: TButton;
    btnExcelRowAutoFit: TButton;
    btnExcelColumnAutoFit: TButton;
    gbExcelGlobalTest: TGroupBox;
    btnAutoFitRows: TButton;
    btnAutoFitColumns: TButton;
    btnActiveCell: TButton;
    btnSetPageCenterHeader: TButton;
    btnSetPageCenterFooter: TButton;
    btnSetPageHeaderMargin: TButton;
    btnSetPageFooterMargin: TButton;
    btnSetPageTopMargin: TButton;
    btnSetPageBottomMargin: TButton;
    btnSetPageLeftMargin: TButton;
    btnSetPageRightMargin: TButton;
    btnSetPageCenterHorizontally: TButton;
    btnSetPageCenterVertically: TButton;
    btnSetPagePrintGridLines: TButton;
    btnPrintPreview: TButton;
    btnPrint: TButton;
    btnNewWord: TButton;
    btnCloseWord: TButton;
    Label10: TLabel;
    cbWordAreaType: TComboBox;
    gbWordParagraphLocation: TGroupBox;
    Label11: TLabel;
    edtWordParagraphParagraphIndex: TEdit;
    gbWordTableLocation: TGroupBox;
    Label13: TLabel;
    edtWordTableTableIndex: TEdit;
    gbWordCellLocation: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    edtWordCellTableIndex: TEdit;
    edtWordCellRowIndex: TEdit;
    edtWordCellColumnIndex: TEdit;
    Label12: TLabel;
    gbWordTest: TGroupBox;
    gbWordSelectionTest: TGroupBox;
    gbWordTableTest: TGroupBox;
    btnGetText: TButton;
    btnSetText: TButton;
    btnSetWordFont: TButton;
    fdWord: TFontDialog;
    btnSelect: TButton;
    btnReplace: TButton;
    btnReplaceAll: TButton;
    btnTypeText: TButton;
    btnInsertText: TButton;
    btnGotoBegin: TButton;
    btnGotoEnd: TButton;
    btnInsertTable: TButton;
    btnGetRowCount: TButton;
    btnSetRowCount: TButton;
    btnGetColumnCount: TButton;
    btnSetColumnCount: TButton;
    btnAddRow: TButton;
    btnAddColumn: TButton;
    btnDeleteRow: TButton;
    btnDeleteColumn: TButton;
    btnParagraphCount: TButton;
    btnTableCount: TButton;
    btnCopyWord: TButton;
    btnPasteWord: TButton;
    procedure btnTableCountClick(Sender: TObject);
    procedure btnParagraphCountClick(Sender: TObject);
    procedure btnDeleteColumnClick(Sender: TObject);
    procedure btnDeleteRowClick(Sender: TObject);
    procedure btnAddColumnClick(Sender: TObject);
    procedure btnAddRowClick(Sender: TObject);
    procedure btnSetColumnCountClick(Sender: TObject);
    procedure btnGetColumnCountClick(Sender: TObject);
    procedure btnSetRowCountClick(Sender: TObject);
    procedure btnGetRowCountClick(Sender: TObject);
    procedure btnInsertTableClick(Sender: TObject);
    procedure btnGotoEndClick(Sender: TObject);
    procedure btnGotoBeginClick(Sender: TObject);
    procedure btnInsertTextClick(Sender: TObject);
    procedure btnTypeTextClick(Sender: TObject);
    procedure btnReplaceAllClick(Sender: TObject);
    procedure btnReplaceClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnPasteWordClick(Sender: TObject);
    procedure btnCopyWordClick(Sender: TObject);
    procedure btnSetWordFontClick(Sender: TObject);
    procedure btnSetTextClick(Sender: TObject);
    procedure btnGetTextClick(Sender: TObject);
    procedure cbWordAreaTypeSelect(Sender: TObject);
    procedure btnCloseWordClick(Sender: TObject);
    procedure btnNewWordClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnPrintPreviewClick(Sender: TObject);
    procedure btnSetPagePrintGridLinesClick(Sender: TObject);
    procedure btnSetPageCenterVerticallyClick(Sender: TObject);
    procedure btnSetPageCenterHorizontallyClick(Sender: TObject);
    procedure btnSetPageRightMarginClick(Sender: TObject);
    procedure btnSetPageLeftMarginClick(Sender: TObject);
    procedure btnSetPageBottomMarginClick(Sender: TObject);
    procedure btnSetPageTopMarginClick(Sender: TObject);
    procedure btnSetPageFooterMarginClick(Sender: TObject);
    procedure btnSetPageHeaderMarginClick(Sender: TObject);
    procedure btnSetPageCenterFooterClick(Sender: TObject);
    procedure btnSetPageCenterHeaderClick(Sender: TObject);
    procedure btnRowColumnCountClick(Sender: TObject);
    procedure btnSheetInfoClick(Sender: TObject);
    procedure btnActiveCellClick(Sender: TObject);
    procedure btnExcelColumnAutoFitClick(Sender: TObject);
    procedure btnExcelRowAutoFitClick(Sender: TObject);
    procedure btnSetCellValueClick(Sender: TObject);
    procedure btnGetCellValueClick(Sender: TObject);
    procedure btnAutoFitColumnsClick(Sender: TObject);
    procedure btnAutoFitRowsClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnSetFormatToNormalClick(Sender: TObject);
    procedure btnUnmergeClick(Sender: TObject);
    procedure btnMergeClick(Sender: TObject);
    procedure btnPasteClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnClearContentsClick(Sender: TObject);
    procedure btnSetFillColorClick(Sender: TObject);
    procedure btnSetAlignmentClick(Sender: TObject);
    procedure btnSetFontClick(Sender: TObject);
    procedure btnSetBorderLineStyleClick(Sender: TObject);
    procedure btnSetBorderWeightClick(Sender: TObject);
    procedure btnSetPageBreakClick(Sender: TObject);
    procedure btnSetWrapTextClick(Sender: TObject);
    procedure btnSetRowHeightClick(Sender: TObject);
    procedure btnGetRowHeightClick(Sender: TObject);
    procedure btnSetColumnWidthClick(Sender: TObject);
    procedure btnGetColumnWidthClick(Sender: TObject);
    procedure btnGetAnchorClick(Sender: TObject);
    procedure cbExcelAreaTypeSelect(Sender: TObject);
    procedure btnCloseExcelClick(Sender: TObject);
    procedure btnNewExcelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Excel: mnTExcel;
    Word: mnTWord;
    function ExcelArea: mnTExcelArea;
    function WordArea: mnTWordArea;
  public
    { Public declarations }
  end;

var
  TestCOMDialog: TTestCOMDialog;

implementation

{$R *.dfm}

uses mnDialog, mnSystem, ActiveX;

{ TTestCOMDialog }

function TTestCOMDialog.ExcelArea: mnTExcelArea;
begin
  Result := nil;
  case cbExcelAreaType.ItemIndex of
    0: Result := Excel.Global;
    1: Result := Excel.UsedRange;
    2: Result := Excel.Cells[StrToInt(edtExcelCellRowIndex.Text), StrToInt(edtExcelCellColumnIndex.Text)];
    3: Result := Excel.Rows[StrToInt(edtExcelRowRowIndex.Text)];
    4: Result := Excel.Columns[StrToInt(edtExcelColumnColumnIndex.Text)];
    5: Result := Excel.Range[StrToInt(edtExcelRangeTopRowIndex.Text), StrToInt(edtExcelRangeLeftColumnIndex.Text),
                             StrToInt(edtExcelRangeBottomRowIndex.Text), StrToInt(edtExcelRangeRightColumnIndex.Text)];
  end;
end;

function TTestCOMDialog.WordArea: mnTWordArea;
begin
  Result := nil;
  case cbWordAreaType.ItemIndex of
    0: Result := Word.Global;
    1: Result := Word.Selection;
    2: Result := Word.Paragraphs[StrToInt(edtWordParagraphParagraphIndex.Text)];
    3: Result := Word.Tables[StrToInt(edtWordTableTableIndex.Text)];
    4: Result := Word.Cells[StrToInt(edtWordCellTableIndex.Text),
                            StrToInt(edtWordCellRowIndex.Text), StrToInt(edtWordCellColumnIndex.Text)];
    5: Result := Word.Header;
    6: Result := Word.Footer;
  end;
end;

procedure TTestCOMDialog.FormShow(Sender: TObject);
begin
  inherited;
  Excel := mnTExcel.Create;
  Word := mnTWord.Create;
end;

procedure TTestCOMDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Excel.Free;
  except
  end;
  try
    Word.Free;
  except
  end;
  inherited;
end;

procedure TTestCOMDialog.btnNewExcelClick(Sender: TObject);
var
  i, j: Integer;
begin
  Excel.New;
  Excel.Visible := True;
  for i := 1 to 10 do
    for j := 1 to 10 do
      Excel.Cells[i, j].AsString := IntToStr(i) + Char(Ord('A') + j - 1);
end;

procedure TTestCOMDialog.btnCloseExcelClick(Sender: TObject);
begin
  Excel.Close;
end;

procedure TTestCOMDialog.cbExcelAreaTypeSelect(Sender: TObject);
begin
  gbExcelCellLocation.Visible := False;
  gbExcelRowLocation.Visible := False;
  gbExcelColumnLocation.Visible := False;
  gbExcelRangeLocation.Visible := False;

  gbExcelGlobalTest.Visible := False;
  gbExcelCellTest.Visible := False;
  gbExcelRowTest.Visible := False;
  gbExcelColumnTest.Visible := False;
  gbExcelRangeTest.Visible := False;

  case cbExcelAreaType.ItemIndex of
    0:
    begin
      gbExcelGlobalTest.Visible := True;
    end;
    2:
    begin
      gbExcelCellLocation.Visible := True;
      gbExcelCellTest.Visible := True;
    end;
    3:
    begin
      gbExcelRowLocation.Visible := True;
      gbExcelRowTest.Visible := True;
    end;
    4:
    begin
      gbExcelColumnLocation.Visible := True;
      gbExcelColumnTest.Visible := True;
    end;
    5:
    begin
      gbExcelRangeLocation.Visible := True;
      gbExcelRangeTest.Visible := True;
    end;
  end;
end;

procedure TTestCOMDialog.btnGetAnchorClick(Sender: TObject);
begin
  mnInfoBox('AnchorRowIndex: ' + IntToStr(ExcelArea.AnchorRowIndex) + mnNewLine +
            'AnchorColumnIndex: ' + IntToStr(ExcelArea.AnchorColumnIndex));
end;

procedure TTestCOMDialog.btnGetColumnWidthClick(Sender: TObject);
begin
  mnInfoBox('ColumnWidth: ' + FloatToStr(ExcelArea.ColumnWidth));
end;

procedure TTestCOMDialog.btnSetColumnWidthClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('ColumnWidth', 'Please input the ColumnWidth:',
                  FloatToStr(ExcelArea.ColumnWidth), Value, scIsFloat) then
    ExcelArea.ColumnWidth := StrToFloat(Value);
end;

procedure TTestCOMDialog.btnGetRowHeightClick(Sender: TObject);
begin
  mnInfoBox('RowHeight: ' + FloatToStr(ExcelArea.RowHeight));
end;

procedure TTestCOMDialog.btnSetRowHeightClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('RowHeight', 'Please input the RowHeight:',
                  FloatToStr(ExcelArea.RowHeight), Value, scIsFloat) then
    ExcelArea.RowHeight := StrToFloat(Value);
end;

procedure TTestCOMDialog.btnSetWrapTextClick(Sender: TObject);
begin
  ExcelArea.SetWrapText(mnConfirmBox('Please set the WrapText'));
end;

procedure TTestCOMDialog.btnSetPageBreakClick(Sender: TObject);
begin
  ExcelArea.SetPageBreak(mnConfirmBox('Please set the PageBreak'));
end;

const
  XlBordersIndexs: array [0..8] of TOleEnum = (xlEdgesAll, xlInsideHorizontal, xlInsideVertical,
                 xlDiagonalDown, xlDiagonalUp, xlEdgeBottom, xlEdgeLeft, xlEdgeRight, xlEdgeTop);

  XlBorderWeights: array [0..3] of TOleEnum = (xlHairline, xlMedium, xlThick, xlThin);

  XlLineStyles: array [0..7] of TOleEnum = (xlContinuous, xlDash, xlDashDot, xlDashDotDot, xlDot,
                                            xlDouble, xlSlantDashDot, xlLineStyleNone);


procedure TTestCOMDialog.btnSetBorderWeightClick(Sender: TObject);
begin
  ExcelArea.SetBorderWeight(XlBordersIndexs[cbExcelBordersIndex.ItemIndex],
                            XlBorderWeights[cbExcelBorderWeight.ItemIndex]);
end;

procedure TTestCOMDialog.btnSetBorderLineStyleClick(Sender: TObject);
begin
  ExcelArea.SetBorderLineStyle(XlBordersIndexs[cbExcelBordersIndex.ItemIndex],
                               XlLineStyles[cbExcelLineStyle.ItemIndex]);
end;

procedure TTestCOMDialog.btnSetFontClick(Sender: TObject);
begin
  if fdExcel.Execute then
  begin
    ExcelArea.SetFontName(fdExcel.Font.Name);
    ExcelArea.SetFontSize(fdExcel.Font.Size);
    ExcelArea.SetFontColor(fdExcel.Font.Color);
    ExcelArea.SetFontStyles(fdExcel.Font.Style);
  end;
end;

const
  XlHALignment: array [0..2] of TOleEnum = (xlLeft, xlCenter, xlRight);
  XlVALignment: array [0..2] of TOleEnum = (xlTop, xlCenter, xlBottom);

procedure TTestCOMDialog.btnSetAlignmentClick(Sender: TObject);
begin
  ExcelArea.SetHorizontalAlignment(XlHALignment[cbExcelHorizontalAlignment.ItemIndex]);
  ExcelArea.SetVerticalAlignment(XlVALignment[cbExcelVerticalAlignment.ItemIndex]);
end;

procedure TTestCOMDialog.btnSetFillColorClick(Sender: TObject);
begin
  if cdExcel.Execute then
    ExcelArea.SetFillColor(cdExcel.Color);
end;

procedure TTestCOMDialog.btnClearContentsClick(Sender: TObject);
begin
  ExcelArea.ClearContents;
end;

procedure TTestCOMDialog.btnClearClick(Sender: TObject);
begin
  ExcelArea.Clear;
end;

procedure TTestCOMDialog.btnCopyClick(Sender: TObject);
begin
  ExcelArea.Copy;
end;

procedure TTestCOMDialog.btnPasteClick(Sender: TObject);
begin
  ExcelArea.Paste;
end;

procedure TTestCOMDialog.btnMergeClick(Sender: TObject);
begin
  ExcelArea.Merge;
end;

procedure TTestCOMDialog.btnUnmergeClick(Sender: TObject);
begin
  ExcelArea.Unmerge;
end;

procedure TTestCOMDialog.btnSetFormatToNormalClick(Sender: TObject);
begin
  ExcelArea.SetFormatToNormal;
end;

procedure TTestCOMDialog.btnInsertClick(Sender: TObject);
begin
  ExcelArea.Insert;
end;

procedure TTestCOMDialog.btnDeleteClick(Sender: TObject);
begin
  ExcelArea.Delete;
end;

procedure TTestCOMDialog.btnAutoFitRowsClick(Sender: TObject);
begin
  (ExcelArea as mnTExcelGlobal).AutoFitRows;
end;

procedure TTestCOMDialog.btnAutoFitColumnsClick(Sender: TObject);
begin
  (ExcelArea as mnTExcelGlobal).AutoFitColumns;
end;

procedure TTestCOMDialog.btnGetCellValueClick(Sender: TObject);
begin
  mnInfoBox((ExcelArea as mnTExcelCell).AsString);
end;

procedure TTestCOMDialog.btnSetCellValueClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('Cell Value', 'Please input the Cell Value:', (ExcelArea as mnTExcelCell).AsString, Value) then
    (ExcelArea as mnTExcelCell).Value := Value;
end;

procedure TTestCOMDialog.btnExcelRowAutoFitClick(Sender: TObject);
begin
  (ExcelArea as mnTExcelRow).AutoFit;
end;

procedure TTestCOMDialog.btnExcelColumnAutoFitClick(Sender: TObject);
begin
  (ExcelArea as mnTExcelColumn).AutoFit;
end;

procedure TTestCOMDialog.btnActiveCellClick(Sender: TObject);
begin
  mnInfoBox('ActiveCell: ' + IntToStr(Excel.ActiveCell.RowIndex) + ', ' + IntToStr(Excel.ActiveCell.ColumnIndex));
end;

procedure TTestCOMDialog.btnSheetInfoClick(Sender: TObject);
var
  SheetNames: string;
  i: Integer;
begin
  SheetNames := '';
  for i := 1 to Excel.SheetCount do
  begin
    if SheetNames <> '' then SheetNames := SheetNames + mnNewLine;
    SheetNames := SheetNames + '  ' + Excel.SheetNames[i];
  end;
  mnInfoBox('ActiveSheetIndex: ' + IntToStr(Excel.ActiveSheetIndex) + mnNewLine +
            'SheetCount: ' + IntToStr(Excel.SheetCount) + mnNewLine +
            'SheetNames: ' + mnNewLine +
            SheetNames);
end;

procedure TTestCOMDialog.btnRowColumnCountClick(Sender: TObject);
begin
  mnInfoBox('SimpleRowCount: ' + IntToStr(Excel.SimpleRowCount) + mnNewLine +
            'SimpleColumnCount: ' + IntToStr(Excel.SimpleColumnCount) + mnNewLine +
            'RowCount: ' + IntToStr(Excel.RowCount) + mnNewLine +
            'ColumnCount: ' + IntToStr(Excel.ColumnCount));
end;

procedure TTestCOMDialog.btnSetPageCenterHeaderClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('CenterHeader', 'Please input the CenterHeader:', '', Value, scNotEmpty) then
    Excel.SetPageCenterHeader(Value);
end;

procedure TTestCOMDialog.btnSetPageCenterFooterClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('CenterFooter', 'Please input the CenterFooter:', '', Value, scNotEmpty) then
    Excel.SetPageCenterFooter(Value);
end;

procedure TTestCOMDialog.btnSetPageHeaderMarginClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('HeaderMargin', 'Please input the HeaderMargin:', '', Value, scIsFloat) then
    Excel.SetPageHeaderMargin(StrToFloat(Value));
end;

procedure TTestCOMDialog.btnSetPageFooterMarginClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('FooterMargin', 'Please input the FooterMargin:', '', Value, scIsFloat) then
    Excel.SetPageFooterMargin(StrToFloat(Value));
end;

procedure TTestCOMDialog.btnSetPageTopMarginClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('TopMargin', 'Please input the TopMargin:', '', Value, scIsFloat) then
    Excel.SetPageTopMargin(StrToFloat(Value));
end;

procedure TTestCOMDialog.btnSetPageBottomMarginClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('BottomMargin', 'Please input the BottomMargin:', '', Value, scIsFloat) then
    Excel.SetPageBottomMargin(StrToFloat(Value));
end;

procedure TTestCOMDialog.btnSetPageLeftMarginClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('LeftMargin', 'Please input the LeftMargin:', '', Value, scIsFloat) then
    Excel.SetPageLeftMargin(StrToFloat(Value));
end;

procedure TTestCOMDialog.btnSetPageRightMarginClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('RightMargin', 'Please input the RightMargin:', '', Value, scIsFloat) then
    Excel.SetPageRightMargin(StrToFloat(Value));
end;

procedure TTestCOMDialog.btnSetPageCenterHorizontallyClick(Sender: TObject);
begin
  Excel.SetPageCenterHorizontally(mnConfirmBox('SetPageCenterHorizontally?'));
end;

procedure TTestCOMDialog.btnSetPageCenterVerticallyClick(Sender: TObject);
begin
  Excel.SetPageCenterVertically(mnConfirmBox('SetPageCenterVertically?'));
end;

procedure TTestCOMDialog.btnSetPagePrintGridLinesClick(Sender: TObject);
begin
  Excel.SetPagePrintGridLines(mnConfirmBox('SetPagePrintGridLines?'));
end;

procedure TTestCOMDialog.btnPrintPreviewClick(Sender: TObject);
begin
  Excel.PrintPreview;
end;

procedure TTestCOMDialog.btnPrintClick(Sender: TObject);
begin
  Excel.Print;
end;

procedure TTestCOMDialog.btnNewWordClick(Sender: TObject);
var
  i, j: Integer;
begin
  Word.New;
  Word.Visible := True;

  Word.Selection.TypeText(mnNewLine + '1' + mnNewLine + '2' + mnNewLine);
  Word.Selection.InsertTable(5, 4);
  Word.Selection.GotoBegin;
  for i := 1 to 5 do
    for j := 1 to 4 do
      Word.Cells[1, i, j].Text := IntToStr(i) + Char(Ord('A') + j - 1);
end;

procedure TTestCOMDialog.btnCloseWordClick(Sender: TObject);
begin
  Word.Close;
end;

procedure TTestCOMDialog.cbWordAreaTypeSelect(Sender: TObject);
begin
  gbWordParagraphLocation.Visible := False;
  gbWordTableLocation.Visible := False;
  gbWordCellLocation.Visible := False;

  gbWordSelectionTest.Visible := False;
  gbWordTableTest.Visible := False;

  case cbWordAreaType.ItemIndex of
    1:
    begin
      gbWordSelectionTest.Visible := True;
    end;

    2:
    begin
      gbWordParagraphLocation.Visible := True;
    end;
    3:
    begin
      gbWordTableLocation.Visible := True;
      gbWordTableTest.Visible := True;
    end;
    4:
    begin
      gbWordCellLocation.Visible := True;
    end;
  end;
end;

procedure TTestCOMDialog.btnGetTextClick(Sender: TObject);
begin
  mnInfoBox('Text: ' + mnNewLine + WordArea.Text);
end;

procedure TTestCOMDialog.btnSetTextClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('Text', 'Please input the Text:', '', Value) then
    WordArea.Text := Value;
end;

procedure TTestCOMDialog.btnSetWordFontClick(Sender: TObject);
begin
  if fdWord.Execute then
  begin
    WordArea.SetFontName(fdWord.Font.Name);
    WordArea.SetFontSize(fdWord.Font.Size);
    WordArea.SetFontColor(fdWord.Font.Color);
    WordArea.SetFontStyles(fdWord.Font.Style);
  end;
end;

procedure TTestCOMDialog.btnCopyWordClick(Sender: TObject);
begin
  WordArea.Copy;
end;

procedure TTestCOMDialog.btnPasteWordClick(Sender: TObject);
begin
  WordArea.Paste;
end;

procedure TTestCOMDialog.btnSelectClick(Sender: TObject);
begin
  WordArea.Select;
end;

procedure TTestCOMDialog.btnReplaceClick(Sender: TObject);
var
  OldText, NewText: string;
begin
  if mnEditDialog('OldText', 'Please input the OldText:', '', OldText) then
    if mnEditDialog('NewTest', 'Please input the NewTest:', '', NewText) then
      WordArea.Replace(OldText, NewText);
end;

procedure TTestCOMDialog.btnReplaceAllClick(Sender: TObject);
var
  OldText, NewText: string;
begin
  if mnEditDialog('OldText', 'Please input the OldText:', '', OldText) then
    if mnEditDialog('NewTest', 'Please input the NewTest:', '', NewText) then
      WordArea.ReplaceAll(OldText, NewText);
end;

procedure TTestCOMDialog.btnTypeTextClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('Text', 'Please input the Text:', '', Value) then
    (WordArea as mnTWordSelection).TypeText(Value);
end;

procedure TTestCOMDialog.btnInsertTextClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('Text', 'Please input the Text:', '', Value) then
    (WordArea as mnTWordSelection).InsertText(Value);
end;

procedure TTestCOMDialog.btnGotoBeginClick(Sender: TObject);
begin
  (WordArea as mnTWordSelection).GotoBegin;
end;

procedure TTestCOMDialog.btnGotoEndClick(Sender: TObject);
begin
  (WordArea as mnTWordSelection).GotoEnd;
end;

procedure TTestCOMDialog.btnInsertTableClick(Sender: TObject);
begin
  (WordArea as mnTWordSelection).InsertTable(3, 2, mnConfirmBox('RealLine?'));
end;

procedure TTestCOMDialog.btnGetRowCountClick(Sender: TObject);
begin
  mnInfoBox('RowCount: ' + IntToStr((WordArea as mnTWordTable).RowCount));
end;

procedure TTestCOMDialog.btnSetRowCountClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('RowCount', 'Please input the RowCount:', '', Value, scIsInt) then
    (WordArea as mnTWordTable).RowCount := StrToInt(Value);
end;

procedure TTestCOMDialog.btnGetColumnCountClick(Sender: TObject);
begin
  mnInfoBox('ColumnCount: ' + IntToStr((WordArea as mnTWordTable).ColumnCount));
end;

procedure TTestCOMDialog.btnSetColumnCountClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('ColumnCount', 'Please input the ColumnCount:', '', Value, scIsInt) then
    (WordArea as mnTWordTable).ColumnCount := StrToInt(Value);
end;

procedure TTestCOMDialog.btnAddRowClick(Sender: TObject);
begin
  (WordArea as mnTWordTable).AddRow;
end;

procedure TTestCOMDialog.btnAddColumnClick(Sender: TObject);
begin
  (WordArea as mnTWordTable).AddColumn;
end;

procedure TTestCOMDialog.btnDeleteRowClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('RowIndex', 'Please input the RowIndex:', '', Value, scIsInt) then
    (WordArea as mnTWordTable).DeleteRow(StrToInt(Value));
end;

procedure TTestCOMDialog.btnDeleteColumnClick(Sender: TObject);
var
  Value: string;
begin
  if mnEditDialog('ColumnIndex', 'Please input the ColumnIndex:', '', Value, scIsInt) then
    (WordArea as mnTWordTable).DeleteColumn(StrToInt(Value));
end;

procedure TTestCOMDialog.btnParagraphCountClick(Sender: TObject);
begin
  mnInfoBox('ParagraphCount: ' + IntToStr(Word.ParagraphCount));
end;

procedure TTestCOMDialog.btnTableCountClick(Sender: TObject);
begin
  mnInfoBox('TableCount: ' + IntToStr(Word.TableCount));
end;

end.
