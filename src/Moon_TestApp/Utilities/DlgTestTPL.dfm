inherited TestTPLDialog: TTestTPLDialog
  Left = 473
  Top = 115
  Caption = 'TestTPL'
  ClientHeight = 611
  ClientWidth = 436
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxbtnOK: TcxButton
    Left = 336
    Top = 576
  end
  object pcTestTPL: TPageControl
    Left = 16
    Top = 16
    Width = 401
    Height = 553
    ActivePage = tsMisc
    TabOrder = 1
    object tsMisc: TTabSheet
      Caption = 'Misc'
      object cxmScroll: TcxMemo
        Left = 8
        Top = 8
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
        TabOrder = 0
        Height = 89
        Width = 129
      end
      object cxteScroll: TcxTextEdit
        Left = 8
        Top = 104
        TabOrder = 1
        Text = 'aaaaaaabbbbbbbcccccccdddddddeeeeeeefffffffggggggg'
        Width = 129
      end
      object btnScrollToEnd: TButton
        Left = 62
        Top = 128
        Width = 75
        Height = 25
        Caption = 'ScrollToEnd'
        TabOrder = 2
        OnClick = btnScrollToEndClick
      end
      object cxlbSelected: TcxListBox
        Left = 8
        Top = 176
        Width = 120
        Height = 97
        ItemHeight = 13
        Items.Strings = (
          '1'
          '2'
          '3'
          '4')
        TabOrder = 3
      end
      object cxcbSelected: TcxComboBox
        Left = 137
        Top = 176
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '1'
          '2'
          '3'
          '4')
        TabOrder = 4
        Width = 120
      end
      object cxmclbSelected: TcxMCListBox
        Left = 264
        Top = 176
        Width = 120
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
        TabOrder = 5
      end
      object btnSelectedItem: TButton
        Left = 136
        Top = 216
        Width = 120
        Height = 25
        Caption = 'SelectedItem'
        TabOrder = 6
        OnClick = btnSelectedItemClick
      end
      object btnSelectedAttachedInt: TButton
        Left = 136
        Top = 248
        Width = 120
        Height = 25
        Caption = 'SelectedAttachedInt'
        TabOrder = 7
        OnClick = btnSelectedAttachedIntClick
      end
      object btnIndexOfAttachedInt: TButton
        Left = 136
        Top = 280
        Width = 120
        Height = 25
        Caption = 'IndexOfAttachedInt'
        TabOrder = 8
        OnClick = btnIndexOfAttachedIntClick
      end
      object cxccbTags: TcxCheckComboBox
        Left = 8
        Top = 320
        Properties.Items = <
          item
            Description = 'aaa'
            Tag = 111
          end
          item
            Description = 'bbb'
            Tag = 222
          end
          item
            Description = 'ccc'
            Tag = 333
          end
          item
            Description = 'ddd'
            Tag = 444
          end>
        TabOrder = 9
        Width = 121
      end
      object CheckedTags: TButton
        Left = 136
        Top = 316
        Width = 75
        Height = 25
        Caption = 'CheckedTags'
        TabOrder = 10
        OnClick = CheckedTagsClick
      end
      object btnCheckByTags: TButton
        Left = 216
        Top = 316
        Width = 75
        Height = 25
        Caption = 'CheckByTags'
        TabOrder = 11
        OnClick = btnCheckByTagsClick
      end
      object cxccbLoad: TcxCheckComboBox
        Left = 8
        Top = 352
        Properties.Items = <>
        TabOrder = 12
        Width = 121
      end
      object btnLoad: TButton
        Left = 136
        Top = 348
        Width = 75
        Height = 25
        Caption = 'Load'
        TabOrder = 13
        OnClick = btnLoadClick
      end
      object DrawItemCustom: TcxComboBox
        Left = 8
        Top = 384
        Properties.Items.Strings = (
          'Draw'
          'Item'
          'Custom')
        Properties.OnDrawItem = DrawItemCustomPropertiesDrawItem
        TabOrder = 14
        Text = 'DrawItemCustom'
        Width = 121
      end
    end
    object tsGrid: TTabSheet
      Caption = 'Grid'
      ImageIndex = 1
    end
  end
end
