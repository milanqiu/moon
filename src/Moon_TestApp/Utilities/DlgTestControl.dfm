inherited TestControlDialog: TTestControlDialog
  Left = 377
  Top = 142
  Caption = 'TestControl'
  ClientHeight = 493
  ClientWidth = 681
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxbtnOK: TcxButton
    Left = 320
    Top = 456
  end
  object gbPointAndControl: TGroupBox
    Left = 16
    Top = 16
    Width = 217
    Height = 201
    Caption = 'gbPointAndControl'
    TabOrder = 1
    object pnControl: TPanel
      Left = 16
      Top = 24
      Width = 185
      Height = 89
      Caption = 'pnControl'
      TabOrder = 0
    end
    object btnPointInControl: TButton
      Left = 16
      Top = 160
      Width = 105
      Height = 25
      Caption = 'PointInControl'
      TabOrder = 1
      OnClick = btnPointInControlClick
    end
    object btnGetControlTopLeftAndBottomRight: TButton
      Left = 16
      Top = 128
      Width = 185
      Height = 25
      Caption = 'GetControlTopLeftAndBottomRight'
      TabOrder = 2
      OnClick = btnGetControlTopLeftAndBottomRightClick
    end
  end
  object gbControlTextAndValidate: TGroupBox
    Left = 16
    Top = 232
    Width = 345
    Height = 209
    Caption = 'gbControlTextAndValidate'
    TabOrder = 2
    object edtEdit: TEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'edtEdit'
    end
    object btnGetEditText: TButton
      Left = 160
      Top = 32
      Width = 75
      Height = 25
      Caption = 'GetEditText'
      TabOrder = 2
      OnClick = btnGetEditTextClick
    end
    object cxteEdit: TcxTextEdit
      Left = 16
      Top = 48
      TabOrder = 1
      Text = 'cxteEdit'
      Width = 121
    end
    object btnValidateNotEmpty: TButton
      Left = 96
      Top = 72
      Width = 97
      Height = 25
      Caption = 'ValidateNotEmpty'
      TabOrder = 3
      OnClick = btnValidateNotEmptyClick
    end
    object btnValidateIsInt: TButton
      Left = 16
      Top = 104
      Width = 75
      Height = 25
      Caption = 'ValidateIsInt'
      TabOrder = 4
      OnClick = btnValidateIsIntClick
    end
    object btnValidateIsFloat: TButton
      Left = 96
      Top = 104
      Width = 75
      Height = 25
      Caption = 'ValidateIsFloat'
      TabOrder = 5
      OnClick = btnValidateIsFloatClick
    end
    object btnValidateIsDT: TButton
      Left = 176
      Top = 104
      Width = 75
      Height = 25
      Caption = 'ValidateIsDT'
      TabOrder = 6
      OnClick = btnValidateIsDTClick
    end
    object btnValidateIsCurr: TButton
      Left = 256
      Top = 104
      Width = 75
      Height = 25
      Caption = 'ValidateIsCurr'
      TabOrder = 7
      OnClick = btnValidateIsCurrClick
    end
    object btnValidateNE0: TButton
      Left = 16
      Top = 136
      Width = 75
      Height = 25
      Caption = 'ValidateNE0'
      TabOrder = 8
      OnClick = btnValidateNE0Click
    end
    object btnValidateLT0: TButton
      Left = 16
      Top = 168
      Width = 75
      Height = 25
      Caption = 'ValidateLT0'
      TabOrder = 9
      OnClick = btnValidateLT0Click
    end
    object btnValidateLE0: TButton
      Left = 96
      Top = 168
      Width = 75
      Height = 25
      Caption = 'ValidateLE0'
      TabOrder = 10
      OnClick = btnValidateLE0Click
    end
    object btnValidateGT0: TButton
      Left = 176
      Top = 168
      Width = 75
      Height = 25
      Caption = 'ValidateGT0'
      TabOrder = 11
      OnClick = btnValidateGT0Click
    end
    object btnValidateGE0: TButton
      Left = 256
      Top = 168
      Width = 75
      Height = 25
      Caption = 'ValidateGE0'
      TabOrder = 12
      OnClick = btnValidateGE0Click
    end
    object btnValidateNotEmptyAbs: TButton
      Left = 200
      Top = 72
      Width = 121
      Height = 25
      Caption = 'ValidateNotEmptyAbs'
      TabOrder = 13
      OnClick = btnValidateNotEmptyAbsClick
    end
    object btnValidateAny: TButton
      Left = 16
      Top = 72
      Width = 73
      Height = 25
      Caption = 'ValidateAny'
      TabOrder = 14
      OnClick = btnValidateAnyClick
    end
  end
  object gbEdit: TGroupBox
    Left = 370
    Top = 16
    Width = 297
    Height = 225
    Caption = 'gbEdit'
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 128
      Height = 13
      Caption = 'Press SHIFT to insert text.'
    end
    object Label2: TLabel
      Left = 16
      Top = 40
      Width = 141
      Height = 13
      Caption = 'Press POPUP to popup menu.'
    end
    object reRichEdit: TRichEdit
      Left = 16
      Top = 96
      Width = 265
      Height = 113
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'reRichEdit')
      ParentFont = False
      TabOrder = 0
      OnKeyDown = reRichEditKeyDown
    end
    object teEdit: TcxTextEdit
      Left = 16
      Top = 64
      TabOrder = 1
      Text = 'teEdit'
      OnKeyDown = teEditKeyDown
      Width = 265
    end
  end
  object btnGetSelText: TButton
    Left = 576
    Top = 48
    Width = 75
    Height = 25
    Caption = 'GetSelText'
    TabOrder = 4
    OnClick = btnGetSelTextClick
  end
  object pmEdit: TPopupMenu
    Left = 538
    Top = 40
    object aaa1: TMenuItem
      Caption = 'abc'
    end
    object xyz1: TMenuItem
      Caption = 'xyz'
    end
  end
end
