inherited TestDialogDialog: TTestDialogDialog
  Left = 517
  Top = 87
  Caption = 'TestDialog'
  ClientHeight = 465
  ClientWidth = 209
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxbtnOK: TcxButton
    Left = 64
    Top = 424
  end
  object btnInfoBox: TButton
    Left = 24
    Top = 16
    Width = 75
    Height = 25
    Caption = 'InfoBox'
    TabOrder = 1
    OnClick = btnInfoBoxClick
  end
  object btnErrorBox: TButton
    Left = 112
    Top = 16
    Width = 75
    Height = 25
    Caption = 'ErrorBox'
    TabOrder = 2
    OnClick = btnErrorBoxClick
  end
  object btnWarningBox: TButton
    Left = 24
    Top = 56
    Width = 75
    Height = 25
    Caption = 'WarningBox'
    TabOrder = 3
    OnClick = btnWarningBoxClick
  end
  object btnWarningBoxEx: TButton
    Left = 112
    Top = 56
    Width = 75
    Height = 25
    Caption = 'WarningBoxEx'
    TabOrder = 4
    OnClick = btnWarningBoxExClick
  end
  object btnConfirmBoxEx: TButton
    Left = 112
    Top = 96
    Width = 75
    Height = 25
    Caption = 'ConfirmBoxEx'
    TabOrder = 6
    OnClick = btnConfirmBoxExClick
  end
  object btnConfirmBox: TButton
    Left = 24
    Top = 96
    Width = 75
    Height = 25
    Caption = 'ConfirmBox'
    TabOrder = 5
    OnClick = btnConfirmBoxClick
  end
  object btnMemoBox: TButton
    Left = 112
    Top = 136
    Width = 75
    Height = 25
    Caption = 'MemoBox'
    TabOrder = 8
    OnClick = btnMemoBoxClick
  end
  object btnShouldBeBox: TButton
    Left = 24
    Top = 136
    Width = 75
    Height = 25
    Caption = 'ShouldBeBox'
    TabOrder = 7
    OnClick = btnShouldBeBoxClick
  end
  object btnEditDialog: TButton
    Left = 24
    Top = 232
    Width = 75
    Height = 25
    Caption = 'EditDialog'
    TabOrder = 10
    OnClick = btnEditDialogClick
  end
  object cbEditConstraint: TComboBox
    Left = 112
    Top = 234
    Width = 75
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 11
    Items.Strings = (
      'scAny'
      'scNotEmpty'
      'scNotEmptyAbs'
      'scIsInt'
      'scIsFloat'
      'scIsDT'
      'scIsCurr'
      'scNE0'
      'scLT0'
      'scLE0'
      'scGT0'
      'scGE0')
  end
  object btnComboBoxDialog: TButton
    Left = 24
    Top = 272
    Width = 121
    Height = 25
    Caption = 'ComboBoxDialog'
    TabOrder = 12
    OnClick = btnComboBoxDialogClick
  end
  object cbDialogFilter: TComboBox
    Left = 72
    Top = 352
    Width = 73
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 14
    Items.Strings = (
      'All'
      'Text'
      'Excel'
      'Word'
      'XML')
  end
  object btnOpenDialog: TButton
    Left = 24
    Top = 384
    Width = 75
    Height = 25
    Caption = 'OpenDialog'
    TabOrder = 15
    OnClick = btnOpenDialogClick
  end
  object btnSaveDialog: TButton
    Left = 112
    Top = 384
    Width = 75
    Height = 25
    Caption = 'SaveDialog'
    TabOrder = 16
    OnClick = btnSaveDialogClick
  end
  object btnCheckListBoxDialog: TButton
    Left = 24
    Top = 312
    Width = 121
    Height = 25
    Caption = 'CheckListBoxDialog'
    TabOrder = 13
    OnClick = btnCheckListBoxDialogClick
  end
  object btnImageBox: TButton
    Left = 24
    Top = 176
    Width = 75
    Height = 25
    Caption = 'ImageBox'
    TabOrder = 9
    OnClick = btnImageBoxClick
  end
  object OpenDialog: TOpenDialog
    Left = 16
    Top = 424
  end
  object SaveDialog: TSaveDialog
    Left = 168
    Top = 424
  end
end
