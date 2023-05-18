inherited TestWaitDialogDialog: TTestWaitDialogDialog
  Caption = 'TestWaitDialogDialog'
  ClientHeight = 149
  ClientWidth = 334
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxbtnOK: TcxButton
    Left = 136
    Top = 112
  end
  object cbCanCancel: TCheckBox
    Left = 40
    Top = 32
    Width = 97
    Height = 17
    Caption = 'Can Cancel'
    Checked = True
    State = cbChecked
    TabOrder = 1
  end
  object cbHasGauge: TCheckBox
    Left = 40
    Top = 56
    Width = 97
    Height = 17
    Caption = 'Has Gauge'
    TabOrder = 2
  end
  object cbCancelAfter5Secs: TCheckBox
    Left = 40
    Top = 80
    Width = 137
    Height = 17
    Caption = 'Cancel After 5 Secs'
    TabOrder = 3
  end
  object btnShow: TButton
    Left = 216
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Show'
    TabOrder = 4
    OnClick = btnShowClick
  end
  object wdMain: mnTWaitDialog
    Caption = 'WaitDialog for test'
    Prompt = 'Please wait......'
    MsgConfirmCancel = 'Confirm to cancel?'
    MsgCancelled = 'Dialog has been cancelled'
    Left = 160
    Top = 16
  end
  object tmrCancel: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = tmrCancelTimer
    Left = 192
    Top = 16
  end
end
