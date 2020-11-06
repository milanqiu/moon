object AboutDialog: TAboutDialog
  Left = 354
  Top = 151
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 184
  ClientWidth = 357
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbProductName: TLabel
    Left = 16
    Top = 16
    Width = 72
    Height = 13
    Caption = 'lbProductName'
  end
  object lbVersion: TLabel
    Left = 16
    Top = 40
    Width = 43
    Height = 13
    Caption = 'lbVersion'
  end
  object lbCopyright: TLabel
    Left = 16
    Top = 64
    Width = 55
    Height = 13
    Caption = 'lbCopyright'
  end
  object lbEmail: TLabel
    Left = 16
    Top = 112
    Width = 32
    Height = 13
    Cursor = crHandPoint
    Caption = 'lbEmail'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = lbEmailClick
  end
  object lbReserved: TLabel
    Left = 16
    Top = 88
    Width = 54
    Height = 13
    Caption = 'lbReserved'
  end
  object cxbtnOK: TcxButton
    Left = 144
    Top = 144
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
end
