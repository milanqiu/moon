inherited TestFormDialog: TTestFormDialog
  Caption = 'TestForm'
  ClientHeight = 255
  PixelsPerInch = 96
  TextHeight = 13
  object lbCountDown: TLabel [0]
    Left = 248
    Top = 64
    Width = 59
    Height = 13
    Caption = 'Count Down'
  end
  object lbFont: TLabel [1]
    Left = 248
    Top = 144
    Width = 44
    Height = 13
    Caption = #23383#20307'font'
  end
  inherited cxbtnOK: TcxButton
    Left = 192
    Top = 216
  end
  object btnShowFrontalForm: TButton
    Left = 24
    Top = 16
    Width = 201
    Height = 25
    Caption = 'ShowFrontalForm'
    TabOrder = 1
    OnClick = btnShowFrontalFormClick
  end
  object btnEnableDisableAllForms: TButton
    Left = 24
    Top = 56
    Width = 201
    Height = 25
    Caption = 'DisableAllForms then Enable'
    TabOrder = 2
    OnClick = btnEnableDisableAllFormsClick
  end
  object btnFillScreen: TButton
    Left = 24
    Top = 96
    Width = 201
    Height = 25
    Caption = 'FillScreen'
    TabOrder = 3
    OnClick = btnFillScreenClick
  end
  object btnSetStandardFont: TButton
    Left = 24
    Top = 136
    Width = 201
    Height = 25
    Caption = 'SetStandardFont'
    TabOrder = 4
    OnClick = btnSetStandardFontClick
  end
  object btnAppendToSystemMenu: TButton
    Left = 24
    Top = 176
    Width = 201
    Height = 25
    Caption = 'AppendToSystemMenu'
    TabOrder = 5
    OnClick = btnAppendToSystemMenuClick
  end
end
