inherited TestTPLDialog: TTestTPLDialog
  Left = 473
  Top = 115
  Caption = 'TestTPL'
  ClientHeight = 611
  ClientWidth = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxbtnOK: TcxButton
    Left = 312
    Top = 576
  end
  object cxgTeacher: TcxGrid
    Left = 8
    Top = 8
    Width = 250
    Height = 361
    TabOrder = 1
    object cxgdbtvTeacher: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      object cxgdbcTeacherID: TcxGridDBColumn
        DataBinding.FieldName = 'TeacherID'
        PropertiesClassName = 'TcxCalcEditProperties'
        Width = 100
      end
      object cxgdbcTeacherName: TcxGridDBColumn
        DataBinding.FieldName = 'TeacherName'
        Width = 100
      end
    end
    object cxglTeacher: TcxGridLevel
      GridView = cxgdbtvTeacher
    end
  end
  object edtDecimalDigits: TEdit
    Left = 264
    Top = 8
    Width = 129
    Height = 21
    TabOrder = 2
    Text = '2'
  end
  object btnSetTeacherIDPrecision: TButton
    Left = 264
    Top = 40
    Width = 129
    Height = 25
    Caption = 'SetTeacherIDPrecision'
    TabOrder = 3
  end
  object btnSetTeacherNamePrecision: TButton
    Left = 264
    Top = 72
    Width = 129
    Height = 25
    Caption = 'SetTeacherNamePrecision'
    TabOrder = 4
  end
  object cxmScroll: TcxMemo
    Left = 264
    Top = 208
    Lines.Strings = (
      'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
      
        'cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc' +
        'c'
      'dddddddddddddddddddddddddddddddddddddddddddddddddddddd'
      'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'
      
        'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff' +
        'fffffffffffffffff'
      'gggggggggggggggggggggggggggggggggggggggggggggggggggggg')
    Properties.ScrollBars = ssBoth
    TabOrder = 5
    Height = 89
    Width = 129
  end
  object cxteScroll: TcxTextEdit
    Left = 264
    Top = 304
    TabOrder = 6
    Text = 'aaaaaaabbbbbbbcccccccdddddddeeeeeee'
    Width = 129
  end
  object btnScrollToEnd: TButton
    Left = 288
    Top = 336
    Width = 75
    Height = 25
    Caption = 'ScrollToEnd'
    TabOrder = 7
  end
  object cxmclbSelected: TcxMCListBox
    Left = 264
    Top = 376
    Width = 121
    Height = 97
    HeaderSections = <
      item
        Text = '#1'
        Width = 56
      end
      item
        Text = '#2'
      end>
    Items.Strings = (
      'a;A'
      'b;B'
      'c;C'
      'd;D')
    TabOrder = 8
  end
  object cxcbSelected: TcxComboBox
    Left = 137
    Top = 376
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      '1'
      '2'
      '3'
      '4')
    TabOrder = 9
    Width = 121
  end
  object cxlbSelected: TcxListBox
    Left = 8
    Top = 376
    Width = 121
    Height = 97
    ItemHeight = 13
    Items.Strings = (
      '1'
      '2'
      '3'
      '4')
    TabOrder = 10
  end
  object btnSelectedItem: TButton
    Left = 136
    Top = 408
    Width = 120
    Height = 25
    Caption = 'SelectedItem'
    TabOrder = 11
  end
  object btnSelectedAttachedInt: TButton
    Left = 136
    Top = 440
    Width = 120
    Height = 25
    Caption = 'SelectedAttachedInt'
    TabOrder = 12
  end
  object btnIndexOfAttachedInt: TButton
    Left = 136
    Top = 472
    Width = 120
    Height = 25
    Caption = 'IndexOfAttachedInt'
    TabOrder = 13
  end
  object cxccbTags: TcxCheckComboBox
    Left = 16
    Top = 512
    Properties.Items = <
      item
        Description = 'aaa'
        Tag = 1
      end
      item
        Description = 'bbb'
        Tag = 2
      end
      item
        Description = 'ccc'
        Tag = 3
      end
      item
        Description = 'ddd'
        Tag = 4
      end>
    TabOrder = 14
    Width = 121
  end
  object cxccbLoad: TcxCheckComboBox
    Left = 16
    Top = 544
    Properties.Items = <>
    TabOrder = 15
    Width = 121
  end
  object DrawItemCustom: TcxComboBox
    Left = 16
    Top = 576
    Properties.Items.Strings = (
      'Draw'
      'Item'
      'Custom')
    TabOrder = 16
    Text = 'DrawItemCustom'
    Width = 121
  end
  object btnLoad: TButton
    Left = 144
    Top = 544
    Width = 75
    Height = 25
    Caption = 'Load'
    TabOrder = 17
  end
  object CheckedTags: TButton
    Left = 144
    Top = 512
    Width = 75
    Height = 25
    Caption = 'CheckedTags'
    TabOrder = 18
  end
  object btnCheckByTags: TButton
    Left = 224
    Top = 512
    Width = 75
    Height = 25
    Caption = 'CheckByTags'
    TabOrder = 19
  end
end
