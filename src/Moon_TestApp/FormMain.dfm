object MainForm: TMainForm
  Left = 682
  Top = 202
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'TestApp'
  ClientHeight = 621
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxmclbModule: TcxMCListBox
    Left = 24
    Top = 24
    Width = 297
    Height = 577
    HeaderSections = <
      item
        Text = 'Package'
        Width = 100
      end
      item
        Text = 'Module'
        Width = 200
      end>
    Items.Strings = (
      'Moon_Utilities;mnCOM'
      ';mnControl'
      ';mnDialog'
      ';mnFile'
      ';mnForm'
      ';mnGraphics'
      ';mnNetwork'
      ';mnSystem'
      ';mnTPL'
      ';mnWindows'
      'Moon_Components;mnDateRange'
      ';mnFileChooser'
      ';mnWaitDialog')
    TabOrder = 0
    OnDblClick = cxmclbModuleDblClick
  end
  object cxbtnTest: TcxButton
    Left = 336
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Test'
    TabOrder = 1
    OnClick = cxbtnTestClick
  end
end
