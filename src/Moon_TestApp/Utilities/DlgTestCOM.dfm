inherited TestCOMDialog: TTestCOMDialog
  Top = 96
  Caption = 'TestCOM'
  ClientHeight = 599
  ClientWidth = 798
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxbtnOK: TcxButton
    Left = 376
    Top = 568
  end
  object pcCOM: TPageControl
    Left = 0
    Top = 0
    Width = 798
    Height = 561
    ActivePage = tsExcel
    Align = alTop
    TabOrder = 1
    object tsExcel: TTabSheet
      Caption = 'Excel'
      object Label1: TLabel
        Left = 96
        Top = 16
        Width = 27
        Height = 13
        Caption = 'Area:'
      end
      object btnNewExcel: TButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = 'NewExcel'
        TabOrder = 0
        OnClick = btnNewExcelClick
      end
      object btnCloseExcel: TButton
        Left = 8
        Top = 40
        Width = 75
        Height = 25
        Caption = 'CloseExcel'
        TabOrder = 1
        OnClick = btnCloseExcelClick
      end
      object cbExcelAreaType: TComboBox
        Left = 136
        Top = 12
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 2
        Text = 'Global'
        OnSelect = cbExcelAreaTypeSelect
        Items.Strings = (
          'Global'
          'UsedRange'
          'Cell'
          'Row'
          'Column'
          'Range')
      end
      object btnGetColumnWidth: TButton
        Left = 96
        Top = 80
        Width = 90
        Height = 25
        Caption = 'GetColumnWidth'
        TabOrder = 7
        OnClick = btnGetColumnWidthClick
      end
      object btnSetColumnWidth: TButton
        Left = 192
        Top = 80
        Width = 90
        Height = 25
        Caption = 'SetColumnWidth'
        TabOrder = 8
        OnClick = btnSetColumnWidthClick
      end
      object btnGetRowHeight: TButton
        Left = 96
        Top = 112
        Width = 90
        Height = 25
        Caption = 'GetRowHeight'
        TabOrder = 9
        OnClick = btnGetRowHeightClick
      end
      object btnSetRowHeight: TButton
        Left = 192
        Top = 112
        Width = 90
        Height = 25
        Caption = 'SetRowHeight'
        TabOrder = 10
        OnClick = btnSetRowHeightClick
      end
      object btnSetWrapText: TButton
        Left = 96
        Top = 160
        Width = 90
        Height = 25
        Caption = 'SetWrapText'
        TabOrder = 11
        OnClick = btnSetWrapTextClick
      end
      object gbExcelCellLocation: TGroupBox
        Left = 296
        Top = 8
        Width = 161
        Height = 89
        Caption = 'gbExcelCellLocation'
        TabOrder = 3
        Visible = False
        object Label2: TLabel
          Left = 16
          Top = 28
          Width = 53
          Height = 13
          Caption = 'RowIndex:'
        end
        object Label3: TLabel
          Left = 16
          Top = 52
          Width = 67
          Height = 13
          Caption = 'ColumnIndex:'
        end
        object edtExcelCellRowIndex: TEdit
          Left = 88
          Top = 24
          Width = 50
          Height = 21
          TabOrder = 0
          Text = '2'
        end
        object edtExcelCellColumnIndex: TEdit
          Left = 88
          Top = 48
          Width = 50
          Height = 21
          TabOrder = 1
          Text = '3'
        end
      end
      object gbExcelRowLocation: TGroupBox
        Left = 296
        Top = 8
        Width = 161
        Height = 65
        Caption = 'gbExcelRowLocation'
        TabOrder = 4
        Visible = False
        object Label4: TLabel
          Left = 16
          Top = 28
          Width = 53
          Height = 13
          Caption = 'RowIndex:'
        end
        object edtExcelRowRowIndex: TEdit
          Left = 88
          Top = 24
          Width = 50
          Height = 21
          TabOrder = 0
          Text = '4'
        end
      end
      object gbExcelColumnLocation: TGroupBox
        Left = 296
        Top = 8
        Width = 161
        Height = 65
        Caption = 'gbExcelColumnLocation'
        TabOrder = 5
        Visible = False
        object Label5: TLabel
          Left = 16
          Top = 28
          Width = 67
          Height = 13
          Caption = 'ColumnIndex:'
        end
        object edtExcelColumnColumnIndex: TEdit
          Left = 88
          Top = 24
          Width = 50
          Height = 21
          TabOrder = 0
          Text = '5'
        end
      end
      object gbExcelRangeLocation: TGroupBox
        Left = 296
        Top = 8
        Width = 185
        Height = 137
        Caption = 'gbExcelRangeLocation'
        TabOrder = 6
        Visible = False
        object Label6: TLabel
          Left = 16
          Top = 28
          Width = 71
          Height = 13
          Caption = 'TopRowIndex:'
        end
        object Label7: TLabel
          Left = 16
          Top = 52
          Width = 86
          Height = 13
          Caption = 'LeftColumnIndex:'
        end
        object Label8: TLabel
          Left = 16
          Top = 76
          Width = 87
          Height = 13
          Caption = 'BottomRowIndex:'
        end
        object Label9: TLabel
          Left = 16
          Top = 100
          Width = 92
          Height = 13
          Caption = 'RightColumnIndex:'
        end
        object edtExcelRangeRightColumnIndex: TEdit
          Left = 112
          Top = 96
          Width = 50
          Height = 21
          TabOrder = 0
          Text = '10'
        end
        object edtExcelRangeBottomRowIndex: TEdit
          Left = 112
          Top = 72
          Width = 50
          Height = 21
          TabOrder = 1
          Text = '8'
        end
        object edtExcelRangeLeftColumnIndex: TEdit
          Left = 112
          Top = 48
          Width = 50
          Height = 21
          TabOrder = 2
          Text = '7'
        end
        object edtExcelRangeTopRowIndex: TEdit
          Left = 112
          Top = 24
          Width = 50
          Height = 21
          TabOrder = 3
          Text = '6'
        end
      end
      object btnSetPageBreak: TButton
        Left = 192
        Top = 160
        Width = 90
        Height = 25
        Caption = 'SetPageBreak'
        TabOrder = 12
        OnClick = btnSetPageBreakClick
      end
      object btnSetBorderWeight: TButton
        Left = 96
        Top = 192
        Width = 100
        Height = 25
        Caption = 'SetBorderWeight'
        TabOrder = 13
        OnClick = btnSetBorderWeightClick
      end
      object btnSetBorderLineStyle: TButton
        Left = 96
        Top = 224
        Width = 100
        Height = 25
        Caption = 'SetBorderLineStyle'
        TabOrder = 14
        OnClick = btnSetBorderLineStyleClick
      end
      object cbExcelBordersIndex: TComboBox
        Left = 208
        Top = 208
        Width = 105
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 15
        Text = 'xlEdgesAll'
        Items.Strings = (
          'xlEdgesAll'
          'xlInsideHorizontal'
          'xlInsideVertical'
          'xlDiagonalDown'
          'xlDiagonalUp'
          'xlEdgeBottom'
          'xlEdgeLeft'
          'xlEdgeRight'
          'xlEdgeTop')
      end
      object cbExcelBorderWeight: TComboBox
        Left = 320
        Top = 194
        Width = 105
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 3
        TabOrder = 16
        Text = 'xlThin'
        Items.Strings = (
          'xlHairline'
          'xlMedium'
          'xlThick'
          'xlThin')
      end
      object cbExcelLineStyle: TComboBox
        Left = 320
        Top = 226
        Width = 105
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 1
        TabOrder = 17
        Text = 'xlDash'
        Items.Strings = (
          'xlContinuous'
          'xlDash'
          'xlDashDot'
          'xlDashDotDot'
          'xlDot'
          'xlDouble'
          'xlSlantDashDot'
          'xlLineStyleNone')
      end
      object btnSetFont: TButton
        Left = 96
        Top = 256
        Width = 100
        Height = 25
        Caption = 'SetFont'
        TabOrder = 18
        OnClick = btnSetFontClick
      end
      object btnSetAlignment: TButton
        Left = 96
        Top = 288
        Width = 100
        Height = 25
        Caption = 'SetAlignment'
        TabOrder = 19
        OnClick = btnSetAlignmentClick
      end
      object cbExcelHorizontalAlignment: TComboBox
        Left = 208
        Top = 290
        Width = 105
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 1
        TabOrder = 20
        Text = 'xlCenter'
        Items.Strings = (
          'xlLeft'
          'xlCenter'
          'xlRight')
      end
      object cbExcelVerticalAlignment: TComboBox
        Left = 320
        Top = 290
        Width = 105
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 1
        TabOrder = 21
        Text = 'xlCenter'
        Items.Strings = (
          'xlTop'
          'xlCenter'
          'xlBottom')
      end
      object btnClearContents: TButton
        Left = 96
        Top = 368
        Width = 90
        Height = 25
        Caption = 'ClearContents'
        TabOrder = 22
        OnClick = btnClearContentsClick
      end
      object btnClear: TButton
        Left = 192
        Top = 368
        Width = 90
        Height = 25
        Caption = 'Clear'
        TabOrder = 23
        OnClick = btnClearClick
      end
      object btnCopy: TButton
        Left = 96
        Top = 400
        Width = 90
        Height = 25
        Caption = 'Copy'
        TabOrder = 24
        OnClick = btnCopyClick
      end
      object btnPaste: TButton
        Left = 192
        Top = 400
        Width = 90
        Height = 25
        Caption = 'Paste'
        TabOrder = 25
        OnClick = btnPasteClick
      end
      object btnMerge: TButton
        Left = 96
        Top = 432
        Width = 90
        Height = 25
        Caption = 'Merge'
        TabOrder = 26
        OnClick = btnMergeClick
      end
      object btnUnmerge: TButton
        Left = 192
        Top = 432
        Width = 90
        Height = 25
        Caption = 'Unmerge'
        TabOrder = 27
        OnClick = btnUnmergeClick
      end
      object btnSetFormatToNormal: TButton
        Left = 96
        Top = 464
        Width = 100
        Height = 25
        Caption = 'SetFormatToNormal'
        TabOrder = 28
        OnClick = btnSetFormatToNormalClick
      end
      object gbExcelCellTest: TGroupBox
        Left = 496
        Top = 16
        Width = 185
        Height = 105
        Caption = 'gbExcelCellTest'
        TabOrder = 29
        Visible = False
        object btnGetCellValue: TButton
          Left = 16
          Top = 24
          Width = 100
          Height = 25
          Caption = 'GetCellValue'
          TabOrder = 0
          OnClick = btnGetCellValueClick
        end
        object btnSetCellValue: TButton
          Left = 16
          Top = 56
          Width = 100
          Height = 25
          Caption = 'SetCellValue'
          TabOrder = 1
          OnClick = btnSetCellValueClick
        end
      end
      object gbExcelRowTest: TGroupBox
        Left = 496
        Top = 16
        Width = 185
        Height = 105
        Caption = 'gbExcelRowTest'
        TabOrder = 30
        Visible = False
        object btnExcelRowAutoFit: TButton
          Left = 16
          Top = 24
          Width = 100
          Height = 25
          Caption = 'ExcelRowAutoFit'
          TabOrder = 0
          OnClick = btnExcelRowAutoFitClick
        end
      end
      object gbExcelRangeTest: TGroupBox
        Left = 496
        Top = 16
        Width = 185
        Height = 105
        Caption = 'gbExcelRangeTest'
        TabOrder = 31
        Visible = False
      end
      object gbExcelColumnTest: TGroupBox
        Left = 496
        Top = 16
        Width = 185
        Height = 105
        Caption = 'gbExcelColumnTest'
        TabOrder = 32
        Visible = False
        object btnExcelColumnAutoFit: TButton
          Left = 16
          Top = 24
          Width = 100
          Height = 25
          Caption = 'ExcelColumnAutoFit'
          TabOrder = 0
          OnClick = btnExcelColumnAutoFitClick
        end
      end
      object gbExcelTest: TGroupBox
        Left = 496
        Top = 136
        Width = 281
        Height = 361
        Caption = 'gbExcelTest'
        TabOrder = 33
        object btnSheetInfo: TButton
          Left = 16
          Top = 48
          Width = 100
          Height = 25
          Caption = 'SheetInfo'
          TabOrder = 0
          OnClick = btnSheetInfoClick
        end
        object btnRowColumnCount: TButton
          Left = 16
          Top = 80
          Width = 100
          Height = 25
          Caption = 'RowColumnCount'
          TabOrder = 1
          OnClick = btnRowColumnCountClick
        end
        object btnActiveCell: TButton
          Left = 16
          Top = 16
          Width = 100
          Height = 25
          Caption = 'ActiveCell'
          TabOrder = 2
          OnClick = btnActiveCellClick
        end
        object btnSetPageCenterHeader: TButton
          Left = 16
          Top = 128
          Width = 120
          Height = 25
          Caption = 'SetPageCenterHeader'
          TabOrder = 3
          OnClick = btnSetPageCenterHeaderClick
        end
        object btnSetPageCenterFooter: TButton
          Left = 144
          Top = 128
          Width = 120
          Height = 25
          Caption = 'SetPageCenterFooter'
          TabOrder = 4
          OnClick = btnSetPageCenterFooterClick
        end
        object btnSetPageHeaderMargin: TButton
          Left = 16
          Top = 160
          Width = 120
          Height = 25
          Caption = 'SetPageHeaderMargin'
          TabOrder = 5
          OnClick = btnSetPageHeaderMarginClick
        end
        object btnSetPageFooterMargin: TButton
          Left = 144
          Top = 160
          Width = 120
          Height = 25
          Caption = 'SetPageFooterMargin'
          TabOrder = 6
          OnClick = btnSetPageFooterMarginClick
        end
        object btnSetPageTopMargin: TButton
          Left = 16
          Top = 192
          Width = 120
          Height = 25
          Caption = 'SetPageTopMargin'
          TabOrder = 7
          OnClick = btnSetPageTopMarginClick
        end
        object btnSetPageBottomMargin: TButton
          Left = 144
          Top = 192
          Width = 120
          Height = 25
          Caption = 'SetPageBottomMargin'
          TabOrder = 8
          OnClick = btnSetPageBottomMarginClick
        end
        object btnSetPageLeftMargin: TButton
          Left = 16
          Top = 224
          Width = 120
          Height = 25
          Caption = 'SetPageLeftMargin'
          TabOrder = 9
          OnClick = btnSetPageLeftMarginClick
        end
        object btnSetPageRightMargin: TButton
          Left = 144
          Top = 224
          Width = 120
          Height = 25
          Caption = 'SetPageRightMargin'
          TabOrder = 10
          OnClick = btnSetPageRightMarginClick
        end
        object btnSetPageCenterHorizontally: TButton
          Left = 16
          Top = 256
          Width = 120
          Height = 25
          Caption = 'SetPageCenterHorizontally'
          TabOrder = 11
          OnClick = btnSetPageCenterHorizontallyClick
        end
        object btnSetPageCenterVertically: TButton
          Left = 144
          Top = 256
          Width = 120
          Height = 25
          Caption = 'SetPageCenterVertically'
          TabOrder = 12
          OnClick = btnSetPageCenterVerticallyClick
        end
        object btnSetPagePrintGridLines: TButton
          Left = 16
          Top = 288
          Width = 120
          Height = 25
          Caption = 'SetPagePrintGridLines'
          TabOrder = 13
          OnClick = btnSetPagePrintGridLinesClick
        end
        object btnPrintPreview: TButton
          Left = 16
          Top = 320
          Width = 100
          Height = 25
          Caption = 'PrintPreview'
          TabOrder = 14
          OnClick = btnPrintPreviewClick
        end
        object btnPrint: TButton
          Left = 128
          Top = 320
          Width = 100
          Height = 25
          Caption = 'Print'
          TabOrder = 15
          OnClick = btnPrintClick
        end
      end
      object btnInsert: TButton
        Left = 96
        Top = 496
        Width = 90
        Height = 25
        Caption = 'Insert'
        TabOrder = 34
        OnClick = btnInsertClick
      end
      object btnDelete: TButton
        Left = 192
        Top = 496
        Width = 90
        Height = 25
        Caption = 'Delete'
        TabOrder = 35
        OnClick = btnDeleteClick
      end
      object btnSetFillColor: TButton
        Left = 96
        Top = 320
        Width = 100
        Height = 25
        Caption = 'SetFillColor'
        TabOrder = 36
        OnClick = btnSetFillColorClick
      end
      object btnGetAnchor: TButton
        Left = 96
        Top = 48
        Width = 90
        Height = 25
        Caption = 'GetAnchor'
        TabOrder = 37
        OnClick = btnGetAnchorClick
      end
      object gbExcelGlobalTest: TGroupBox
        Left = 496
        Top = 16
        Width = 185
        Height = 105
        Caption = 'gbExcelGlobalTest'
        TabOrder = 38
        object btnAutoFitRows: TButton
          Left = 16
          Top = 24
          Width = 100
          Height = 25
          Caption = 'AutoFitRows'
          TabOrder = 0
          OnClick = btnAutoFitRowsClick
        end
        object btnAutoFitColumns: TButton
          Left = 16
          Top = 56
          Width = 100
          Height = 25
          Caption = 'AutoFitColumns'
          TabOrder = 1
          OnClick = btnAutoFitColumnsClick
        end
      end
    end
    object tsWord: TTabSheet
      Caption = 'Word'
      ImageIndex = 1
      object Label10: TLabel
        Left = 96
        Top = 16
        Width = 27
        Height = 13
        Caption = 'Area:'
      end
      object btnNewWord: TButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = 'NewWord'
        TabOrder = 0
        OnClick = btnNewWordClick
      end
      object btnCloseWord: TButton
        Left = 8
        Top = 40
        Width = 75
        Height = 25
        Caption = 'CloseWord'
        TabOrder = 1
        OnClick = btnCloseWordClick
      end
      object cbWordAreaType: TComboBox
        Left = 136
        Top = 12
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 2
        Text = 'Global'
        OnSelect = cbWordAreaTypeSelect
        Items.Strings = (
          'Global'
          'Selection'
          'Paragraph'
          'Table'
          'Cell'
          'Header'
          'Footer')
      end
      object gbWordParagraphLocation: TGroupBox
        Left = 296
        Top = 8
        Width = 169
        Height = 65
        Caption = 'gbWordParagraphLocation'
        TabOrder = 3
        Visible = False
        object Label11: TLabel
          Left = 16
          Top = 28
          Width = 82
          Height = 13
          Caption = 'ParagraphIndex:'
        end
        object edtWordParagraphParagraphIndex: TEdit
          Left = 104
          Top = 24
          Width = 50
          Height = 21
          TabOrder = 0
          Text = '2'
        end
      end
      object gbWordTableLocation: TGroupBox
        Left = 296
        Top = 8
        Width = 169
        Height = 65
        Caption = 'gbWordTableLocation'
        TabOrder = 4
        Visible = False
        object Label13: TLabel
          Left = 16
          Top = 28
          Width = 58
          Height = 13
          Caption = 'TableIndex:'
        end
        object edtWordTableTableIndex: TEdit
          Left = 104
          Top = 24
          Width = 50
          Height = 21
          TabOrder = 0
          Text = '1'
        end
      end
      object gbWordCellLocation: TGroupBox
        Left = 296
        Top = 8
        Width = 169
        Height = 105
        Caption = 'gbWordCellLocation'
        TabOrder = 5
        Visible = False
        object Label15: TLabel
          Left = 16
          Top = 52
          Width = 53
          Height = 13
          Caption = 'RowIndex:'
        end
        object Label16: TLabel
          Left = 16
          Top = 76
          Width = 67
          Height = 13
          Caption = 'ColumnIndex:'
        end
        object Label12: TLabel
          Left = 16
          Top = 28
          Width = 58
          Height = 13
          Caption = 'TableIndex:'
        end
        object edtWordCellTableIndex: TEdit
          Left = 104
          Top = 24
          Width = 50
          Height = 21
          TabOrder = 0
          Text = '1'
        end
        object edtWordCellRowIndex: TEdit
          Left = 104
          Top = 48
          Width = 50
          Height = 21
          TabOrder = 1
          Text = '2'
        end
        object edtWordCellColumnIndex: TEdit
          Left = 104
          Top = 72
          Width = 50
          Height = 21
          TabOrder = 2
          Text = '3'
        end
      end
      object gbWordTest: TGroupBox
        Left = 480
        Top = 200
        Width = 217
        Height = 137
        Caption = 'gbWordTest'
        TabOrder = 6
        object btnParagraphCount: TButton
          Left = 16
          Top = 24
          Width = 90
          Height = 25
          Caption = 'ParagraphCount'
          TabOrder = 0
          OnClick = btnParagraphCountClick
        end
        object btnTableCount: TButton
          Left = 16
          Top = 56
          Width = 90
          Height = 25
          Caption = 'TableCount'
          TabOrder = 1
          OnClick = btnTableCountClick
        end
      end
      object gbWordSelectionTest: TGroupBox
        Left = 480
        Top = 16
        Width = 185
        Height = 137
        Caption = 'gbWordSelectionTest'
        TabOrder = 7
        Visible = False
        object btnTypeText: TButton
          Left = 16
          Top = 24
          Width = 75
          Height = 25
          Caption = 'TypeText'
          TabOrder = 0
          OnClick = btnTypeTextClick
        end
        object btnInsertText: TButton
          Left = 96
          Top = 24
          Width = 75
          Height = 25
          Caption = 'InsertText'
          TabOrder = 1
          OnClick = btnInsertTextClick
        end
        object btnGotoBegin: TButton
          Left = 16
          Top = 56
          Width = 75
          Height = 25
          Caption = 'GotoBegin'
          TabOrder = 2
          OnClick = btnGotoBeginClick
        end
        object btnGotoEnd: TButton
          Left = 96
          Top = 56
          Width = 75
          Height = 25
          Caption = 'GotoEnd'
          TabOrder = 3
          OnClick = btnGotoEndClick
        end
        object btnInsertTable: TButton
          Left = 16
          Top = 88
          Width = 75
          Height = 25
          Caption = 'InsertTable'
          TabOrder = 4
          OnClick = btnInsertTableClick
        end
      end
      object gbWordTableTest: TGroupBox
        Left = 480
        Top = 16
        Width = 217
        Height = 169
        Caption = 'gbWordTableTest'
        TabOrder = 8
        Visible = False
        object btnGetRowCount: TButton
          Left = 16
          Top = 24
          Width = 90
          Height = 25
          Caption = 'GetRowCount'
          TabOrder = 0
          OnClick = btnGetRowCountClick
        end
        object btnSetRowCount: TButton
          Left = 112
          Top = 24
          Width = 90
          Height = 25
          Caption = 'SetRowCount'
          TabOrder = 1
          OnClick = btnSetRowCountClick
        end
        object btnGetColumnCount: TButton
          Left = 16
          Top = 56
          Width = 90
          Height = 25
          Caption = 'GetColumnCount'
          TabOrder = 2
          OnClick = btnGetColumnCountClick
        end
        object btnSetColumnCount: TButton
          Left = 112
          Top = 56
          Width = 90
          Height = 25
          Caption = 'SetColumnCount'
          TabOrder = 3
          OnClick = btnSetColumnCountClick
        end
        object btnAddRow: TButton
          Left = 16
          Top = 88
          Width = 90
          Height = 25
          Caption = 'AddRow'
          TabOrder = 4
          OnClick = btnAddRowClick
        end
        object btnAddColumn: TButton
          Left = 112
          Top = 88
          Width = 90
          Height = 25
          Caption = 'AddColumn'
          TabOrder = 5
          OnClick = btnAddColumnClick
        end
        object btnDeleteRow: TButton
          Left = 16
          Top = 120
          Width = 90
          Height = 25
          Caption = 'DeleteRow'
          TabOrder = 6
          OnClick = btnDeleteRowClick
        end
        object btnDeleteColumn: TButton
          Left = 112
          Top = 120
          Width = 90
          Height = 25
          Caption = 'DeleteColumn'
          TabOrder = 7
          OnClick = btnDeleteColumnClick
        end
      end
      object btnGetText: TButton
        Left = 96
        Top = 48
        Width = 90
        Height = 25
        Caption = 'GetText'
        TabOrder = 9
        OnClick = btnGetTextClick
      end
      object btnSetText: TButton
        Left = 192
        Top = 48
        Width = 90
        Height = 25
        Caption = 'SetText'
        TabOrder = 10
        OnClick = btnSetTextClick
      end
      object btnSetWordFont: TButton
        Left = 96
        Top = 80
        Width = 90
        Height = 25
        Caption = 'SetFont'
        TabOrder = 11
        OnClick = btnSetWordFontClick
      end
      object btnSelect: TButton
        Left = 96
        Top = 144
        Width = 90
        Height = 25
        Caption = 'Select'
        TabOrder = 12
        OnClick = btnSelectClick
      end
      object btnReplace: TButton
        Left = 96
        Top = 176
        Width = 90
        Height = 25
        Caption = 'Replace'
        TabOrder = 13
        OnClick = btnReplaceClick
      end
      object btnReplaceAll: TButton
        Left = 192
        Top = 176
        Width = 90
        Height = 25
        Caption = 'ReplaceAll'
        TabOrder = 14
        OnClick = btnReplaceAllClick
      end
      object btnCopyWord: TButton
        Left = 96
        Top = 112
        Width = 90
        Height = 25
        Caption = 'Copy'
        TabOrder = 15
        OnClick = btnCopyWordClick
      end
      object btnPasteWord: TButton
        Left = 192
        Top = 112
        Width = 90
        Height = 25
        Caption = 'Paste'
        TabOrder = 16
        OnClick = btnPasteWordClick
      end
    end
  end
  object fdExcel: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 68
    Top = 280
  end
  object cdExcel: TColorDialog
    Left = 68
    Top = 344
  end
  object fdWord: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 68
    Top = 104
  end
end
