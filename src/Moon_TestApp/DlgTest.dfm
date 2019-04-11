object TestDialog: TTestDialog
  Left = 456
  Top = 240
  BorderStyle = bsDialog
  Caption = 'Test'
  ClientHeight = 433
  ClientWidth = 451
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxbtnOK: TcxButton
    Left = 192
    Top = 392
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
end
