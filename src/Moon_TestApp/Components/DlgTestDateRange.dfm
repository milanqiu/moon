inherited TestDateRangeDialog: TTestDateRangeDialog
  Caption = 'TestDateRangeDialog'
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 24
    Top = 28
    Width = 54
    Height = 13
    Caption = 'From Date:'
  end
  object Label2: TLabel [1]
    Left = 24
    Top = 60
    Width = 42
    Height = 13
    Caption = 'To Date:'
  end
  object cxdeFromDate: TcxDateEdit
    Left = 88
    Top = 24
    TabOrder = 1
    Width = 121
  end
  object cxdeToDate: TcxDateEdit
    Left = 88
    Top = 56
    TabOrder = 2
    Width = 121
  end
  object mndrDateRange: mnTDateRange
    Left = 88
    Top = 88
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 12
    Properties.Items.Strings = (
      'Custom'
      'Today'
      'This Week'
      'This Month'
      'This Quarter'
      'This Year'
      'Yesterday'
      'Last Week'
      'Last Month'
      'Last Quarter'
      'Last Year'
      'Latest 7 Days'
      'Latest 1 Month'
      'Latest 3 Months'
      'Latest 12 Months'
      'So Far This Week'
      'So Far This Month'
      'So Far This Quarter'
      'So Far This Year')
    TabOrder = 3
    Text = 'Custom'
    FromDateEdit = cxdeFromDate
    ToDateEdit = cxdeToDate
    Width = 121
  end
  object btnGet: TButton
    Left = 88
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Get'
    TabOrder = 4
    OnClick = btnGetClick
  end
end
