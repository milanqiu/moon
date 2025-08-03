inherited TestWebBrowserDialog: TTestWebBrowserDialog
  Left = 765
  Top = 244
  Caption = 'TestWebBrowserDialog'
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser: mnTWebBrowser
    Left = 8
    Top = 8
    Width = 433
    Height = 233
    TabOrder = 1
    OnPageComplete = WebBrowserPageComplete
    ControlData = {
      4C000000C02C0000151800000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object btnGet: TButton
    Left = 24
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Get'
    TabOrder = 2
    OnClick = btnGetClick
  end
  object btnPost: TButton
    Left = 112
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Post'
    TabOrder = 3
    OnClick = btnPostClick
  end
  object btnSetBlank: TButton
    Left = 24
    Top = 288
    Width = 75
    Height = 25
    Caption = 'SetBlank'
    TabOrder = 4
    OnClick = btnSetBlankClick
  end
  object btnSetContent: TButton
    Left = 112
    Top = 288
    Width = 75
    Height = 25
    Caption = 'SetContent'
    TabOrder = 5
    OnClick = btnSetContentClick
  end
  object btnGetHTML: TButton
    Left = 24
    Top = 336
    Width = 75
    Height = 25
    Caption = 'GetHTML'
    TabOrder = 6
    OnClick = btnGetHTMLClick
  end
  object btnGetBodyHTML: TButton
    Left = 112
    Top = 336
    Width = 75
    Height = 25
    Caption = 'GetBodyHTML'
    TabOrder = 7
    OnClick = btnGetBodyHTMLClick
  end
  object btnGetBodyText: TButton
    Left = 200
    Top = 336
    Width = 75
    Height = 25
    Caption = 'GetBodyText'
    TabOrder = 8
    OnClick = btnGetBodyTextClick
  end
  object btnTestPKU: TButton
    Left = 288
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Test PKU'
    TabOrder = 9
    OnClick = btnTestPKUClick
  end
  object btnTest12306: TButton
    Left = 288
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Test 12306'
    TabOrder = 10
    OnClick = btnTest12306Click
  end
end
