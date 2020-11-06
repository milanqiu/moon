object CommonDialog: TCommonDialog
  Left = 497
  Top = 275
  BorderStyle = bsDialog
  Caption = 'Common'
  ClientHeight = 283
  ClientWidth = 450
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxbtnOK: TcxButton
    Left = 152
    Top = 240
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object cxbtnCancel: TcxButton
    Left = 240
    Top = 240
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
end
