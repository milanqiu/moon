inherited TestNetworkDialog: TTestNetworkDialog
  Caption = 'TestNetwork'
  ClientHeight = 260
  ClientWidth = 543
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxbtnOK: TcxButton
    Left = 232
    Top = 224
  end
  object btnHTTPGet: TButton
    Left = 24
    Top = 24
    Width = 110
    Height = 25
    Caption = 'HTTPGet'
    TabOrder = 1
    OnClick = btnHTTPGetClick
  end
  object btnHTTPGet6: TButton
    Left = 152
    Top = 24
    Width = 110
    Height = 25
    Caption = 'HTTPGet6'
    TabOrder = 2
    OnClick = btnHTTPGet6Click
  end
  object btnHTTPGetFail: TButton
    Left = 280
    Top = 24
    Width = 110
    Height = 25
    Caption = 'HTTPGetFail'
    TabOrder = 3
    OnClick = btnHTTPGetFailClick
  end
  object btnHTTPGetFail6: TButton
    Left = 408
    Top = 24
    Width = 110
    Height = 25
    Caption = 'HTTPGetFail6'
    TabOrder = 4
    OnClick = btnHTTPGetFail6Click
  end
  object btnHTTPPost: TButton
    Left = 24
    Top = 64
    Width = 110
    Height = 25
    Caption = 'HTTPPost'
    TabOrder = 5
    OnClick = btnHTTPPostClick
  end
  object btnHTTPPost6: TButton
    Left = 152
    Top = 64
    Width = 110
    Height = 25
    Caption = 'HTTPPost6'
    TabOrder = 6
    OnClick = btnHTTPPost6Click
  end
  object btnHTTPPostFail: TButton
    Left = 280
    Top = 64
    Width = 110
    Height = 25
    Caption = 'HTTPPostFail'
    TabOrder = 7
    OnClick = btnHTTPPostFailClick
  end
  object btnHTTPPostFail6: TButton
    Left = 408
    Top = 64
    Width = 110
    Height = 25
    Caption = 'HTTPPostFail6'
    TabOrder = 8
    OnClick = btnHTTPPostFail6Click
  end
  object btnThreadHTTPGet: TButton
    Left = 24
    Top = 104
    Width = 110
    Height = 25
    Caption = 'ThreadHTTPGet'
    TabOrder = 9
    OnClick = btnThreadHTTPGetClick
  end
  object btnThreadHTTPGet6: TButton
    Left = 152
    Top = 104
    Width = 110
    Height = 25
    Caption = 'ThreadHTTPGet6'
    TabOrder = 10
    OnClick = btnThreadHTTPGet6Click
  end
  object btnThreadHTTPGetFail: TButton
    Left = 280
    Top = 104
    Width = 110
    Height = 25
    Caption = 'ThreadHTTPGetFail'
    TabOrder = 11
    OnClick = btnThreadHTTPGetFailClick
  end
  object btnThreadHTTPGetFail6: TButton
    Left = 408
    Top = 104
    Width = 110
    Height = 25
    Caption = 'ThreadHTTPGetFail6'
    TabOrder = 12
    OnClick = btnThreadHTTPGetFail6Click
  end
  object btnThreadHTTPPost: TButton
    Left = 24
    Top = 144
    Width = 110
    Height = 25
    Caption = 'ThreadHTTPPost'
    TabOrder = 13
    OnClick = btnThreadHTTPPostClick
  end
  object btnThreadHTTPPost6: TButton
    Left = 152
    Top = 144
    Width = 110
    Height = 25
    Caption = 'ThreadHTTPPost6'
    TabOrder = 14
    OnClick = btnThreadHTTPPost6Click
  end
  object btnThreadHTTPPostFail: TButton
    Left = 280
    Top = 144
    Width = 110
    Height = 25
    Caption = 'ThreadHTTPPostFail'
    TabOrder = 15
    OnClick = btnThreadHTTPPostFailClick
  end
  object btnThreadHTTPPostFail6: TButton
    Left = 408
    Top = 144
    Width = 110
    Height = 25
    Caption = 'ThreadHTTPPostFail6'
    TabOrder = 16
    OnClick = btnThreadHTTPPostFail6Click
  end
  object btnThreadHTTPTerminate: TButton
    Left = 211
    Top = 184
    Width = 120
    Height = 25
    Caption = 'ThreadHTTPTerminate'
    TabOrder = 17
    OnClick = btnThreadHTTPTerminateClick
  end
end
