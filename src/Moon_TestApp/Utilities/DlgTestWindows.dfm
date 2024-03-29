inherited TestWindowsDialog: TTestWindowsDialog
  Left = 603
  Top = 236
  Caption = 'TestWindows'
  ClientHeight = 561
  ClientWidth = 891
  OnClick = FormClick
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  OnMouseUp = FormMouseUp
  OnMouseWheel = FormMouseWheel
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxbtnOK: TcxButton
    Left = 408
    Top = 528
  end
  object pcTestWindows: TPageControl
    Left = 16
    Top = 8
    Width = 857
    Height = 505
    ActivePage = tsMisc
    TabOrder = 1
    object tsMisc: TTabSheet
      Caption = 'tsMisc'
      object Label11: TLabel
        Left = 24
        Top = 216
        Width = 145
        Height = 13
        Caption = 'Drag any file to this window...'
      end
      object Label12: TLabel
        Left = 26
        Top = 182
        Width = 38
        Height = 13
        Caption = 'ExeFile:'
      end
      object btnCreateDesktop: TButton
        Left = 24
        Top = 16
        Width = 97
        Height = 25
        Caption = 'CreateDesktop'
        TabOrder = 0
        OnClick = btnCreateDesktopClick
      end
      object btnCloseDesktop: TButton
        Left = 128
        Top = 16
        Width = 97
        Height = 25
        Caption = 'CloseDesktop'
        TabOrder = 1
        OnClick = btnCloseDesktopClick
      end
      object btnCreateProcess: TButton
        Left = 24
        Top = 56
        Width = 120
        Height = 25
        Caption = 'CreateProcess'
        TabOrder = 2
        OnClick = btnCreateProcessClick
      end
      object btnTerminateProcess: TButton
        Left = 152
        Top = 56
        Width = 120
        Height = 25
        Caption = 'TerminateProcess'
        TabOrder = 3
        OnClick = btnTerminateProcessClick
      end
      object btnHasProcessExited: TButton
        Left = 280
        Top = 56
        Width = 120
        Height = 25
        Caption = 'HasProcessExited'
        TabOrder = 4
        OnClick = btnHasProcessExitedClick
      end
      object btnReportWhenProcessExited: TButton
        Left = 408
        Top = 56
        Width = 140
        Height = 25
        Caption = 'ReportWhenProcessExited'
        TabOrder = 5
        OnClick = btnReportWhenProcessExitedClick
      end
      object cbUseNewDesktop: TCheckBox
        Left = 664
        Top = 60
        Width = 121
        Height = 17
        Caption = 'Use New Desktop'
        TabOrder = 6
      end
      object ShellOpenNotepad: TButton
        Left = 24
        Top = 96
        Width = 105
        Height = 25
        Caption = 'ShellOpenNotepad'
        TabOrder = 7
        OnClick = ShellOpenNotepadClick
      end
      object ShellOpenC: TButton
        Left = 136
        Top = 96
        Width = 105
        Height = 25
        Caption = 'ShellOpenC'
        TabOrder = 8
        OnClick = ShellOpenCClick
      end
      object btnGetFileVersion: TButton
        Left = 312
        Top = 96
        Width = 105
        Height = 25
        Caption = 'GetFileVersion'
        TabOrder = 9
        OnClick = btnGetFileVersionClick
      end
      object btnLocalhostName: TButton
        Left = 424
        Top = 96
        Width = 89
        Height = 25
        Caption = 'LocalhostName'
        TabOrder = 10
        OnClick = btnLocalhostNameClick
      end
      object btnTempPath: TButton
        Left = 520
        Top = 96
        Width = 75
        Height = 25
        Caption = 'TempPath'
        TabOrder = 11
        OnClick = btnTempPathClick
      end
      object btnShutDown: TButton
        Left = 24
        Top = 136
        Width = 75
        Height = 25
        Caption = 'ShutDown'
        TabOrder = 12
        OnClick = btnShutDownClick
      end
      object btnReboot: TButton
        Left = 104
        Top = 136
        Width = 75
        Height = 25
        Caption = 'Reboot'
        TabOrder = 13
        OnClick = btnRebootClick
      end
      object btnLogoff: TButton
        Left = 184
        Top = 136
        Width = 75
        Height = 25
        Caption = 'Logoff'
        TabOrder = 14
        OnClick = btnLogoffClick
      end
      object btnOSLanguage: TButton
        Left = 312
        Top = 136
        Width = 75
        Height = 25
        Caption = 'OSLanguage'
        TabOrder = 15
        OnClick = btnOSLanguageClick
      end
      object cbShowWindow: TCheckBox
        Left = 568
        Top = 60
        Width = 97
        Height = 17
        Caption = 'Show Window'
        Checked = True
        State = cbChecked
        TabOrder = 16
      end
      object edtExeFile: TEdit
        Left = 96
        Top = 178
        Width = 121
        Height = 21
        TabOrder = 17
      end
      object cbExeFileCaseSensitive: TCheckBox
        Left = 240
        Top = 180
        Width = 169
        Height = 17
        Caption = 'Exe File Case Sensitive'
        TabOrder = 18
      end
      object cbExeFileWholeWordOnly: TCheckBox
        Left = 384
        Top = 180
        Width = 169
        Height = 17
        Caption = 'Exe File Whole Word Only'
        TabOrder = 19
      end
      object btnFindProcessesAndOpenProcess: TButton
        Left = 544
        Top = 176
        Width = 169
        Height = 25
        Caption = 'FindProcesses && OpenProcess'
        TabOrder = 20
        OnClick = btnFindProcessesAndOpenProcessClick
      end
      object btnFindFirstProcess: TButton
        Left = 720
        Top = 176
        Width = 105
        Height = 25
        Caption = 'FindFirstProcess'
        TabOrder = 21
        OnClick = btnFindFirstProcessClick
      end
    end
    object tsKeyMouse: TTabSheet
      Caption = 'tsKeyMouse'
      ImageIndex = 1
      object lbMouseMsg1: TLabel
        Left = 24
        Top = 40
        Width = 64
        Height = 13
        Caption = 'lbMouseMsg1'
      end
      object lbMouseMsg2: TLabel
        Left = 24
        Top = 64
        Width = 64
        Height = 13
        Caption = 'lbMouseMsg2'
      end
      object lbMouseClick: TLabel
        Left = 536
        Top = 88
        Width = 60
        Height = 13
        Caption = 'lbMouseClick'
      end
      object Label1: TLabel
        Left = 24
        Top = 200
        Width = 67
        Height = 13
        Caption = 'Pressed keys:'
      end
      object lbKeyPress: TLabel
        Left = 96
        Top = 200
        Width = 52
        Height = 13
        Caption = 'lbKeyPress'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label3: TLabel
        Left = 296
        Top = 112
        Width = 55
        Height = 13
        Caption = 'Mouse pos:'
      end
      object lbMousePos: TLabel
        Left = 360
        Top = 112
        Width = 56
        Height = 13
        Caption = 'lbMousePos'
      end
      object lbMouseMsg3: TLabel
        Left = 24
        Top = 88
        Width = 64
        Height = 13
        Caption = 'lbMouseMsg3'
      end
      object lbMouseMsg4: TLabel
        Left = 24
        Top = 112
        Width = 64
        Height = 13
        Caption = 'lbMouseMsg4'
      end
      object pnTestPanel: TPanel
        Left = 296
        Top = 16
        Width = 185
        Height = 65
        Caption = 'pnTestPanel'
        TabOrder = 0
      end
      object cbInspectMouseMsg: TCheckBox
        Left = 24
        Top = 16
        Width = 137
        Height = 17
        Caption = 'Inspect Mouse Message'
        TabOrder = 1
      end
      object btnMouseClick: TButton
        Left = 536
        Top = 16
        Width = 75
        Height = 25
        Caption = 'MouseClick'
        TabOrder = 2
        OnClick = btnMouseClickClick
      end
      object btnMouseDblClick: TButton
        Left = 616
        Top = 16
        Width = 75
        Height = 25
        Caption = 'DblClick'
        TabOrder = 3
        OnClick = btnMouseDblClickClick
      end
      object btnMouseRightClick: TButton
        Left = 696
        Top = 16
        Width = 75
        Height = 25
        Caption = 'RightClick'
        TabOrder = 4
        OnClick = btnMouseRightClickClick
      end
      object btnIsKeyPressed: TButton
        Left = 128
        Top = 168
        Width = 89
        Height = 25
        Caption = 'IsKeyPressed'
        TabOrder = 5
        OnClick = btnIsKeyPressedClick
      end
      object btnIsVKeyPressed: TButton
        Left = 24
        Top = 168
        Width = 89
        Height = 25
        Caption = 'IsVKeyPressed'
        TabOrder = 6
        OnClick = btnIsVKeyPressedClick
      end
      object btnCtrlC: TButton
        Left = 24
        Top = 224
        Width = 57
        Height = 25
        Caption = 'Ctrl + C'
        TabOrder = 7
        OnClick = btnCtrlCClick
      end
      object btnCtrlV: TButton
        Left = 88
        Top = 224
        Width = 57
        Height = 25
        Caption = 'Ctrl + V'
        TabOrder = 8
        OnClick = btnCtrlVClick
      end
      object btnKeyPress: TButton
        Left = 160
        Top = 224
        Width = 89
        Height = 25
        Caption = 'KeyPress'
        TabOrder = 9
        OnClick = btnKeyPressClick
      end
      object edtTo: TEdit
        Left = 144
        Top = 264
        Width = 105
        Height = 21
        TabOrder = 10
        Text = 'edtTo'
      end
      object edtFrom: TEdit
        Left = 24
        Top = 264
        Width = 105
        Height = 21
        TabOrder = 11
        Text = 'edtFrom'
      end
      object btnMouseWheel: TButton
        Left = 536
        Top = 48
        Width = 75
        Height = 25
        Caption = 'Wheel'
        TabOrder = 12
        OnClick = btnMouseWheelClick
      end
    end
    object tsWindow: TTabSheet
      Caption = 'tsWindow'
      ImageIndex = 2
      object lbCurrWindow: TLabel
        Left = 24
        Top = 192
        Width = 67
        Height = 13
        Caption = 'lbCurrWindow'
      end
      object lbCurrWindowClassName: TLabel
        Left = 24
        Top = 216
        Width = 119
        Height = 13
        Caption = 'lbCurrWindowClassName'
      end
      object lbCurrWindowCaption: TLabel
        Left = 24
        Top = 240
        Width = 104
        Height = 13
        Caption = 'lbCurrWindowCaption'
      end
      object Label8: TLabel
        Left = 24
        Top = 12
        Width = 77
        Height = 13
        Caption = 'Parent Window:'
      end
      object Label9: TLabel
        Left = 42
        Top = 36
        Width = 59
        Height = 13
        Caption = 'Class Name:'
      end
      object Label10: TLabel
        Left = 60
        Top = 60
        Width = 41
        Height = 13
        Caption = 'Caption:'
      end
      object btnGetWindowsCaptions: TButton
        Left = 184
        Top = 104
        Width = 150
        Height = 25
        Caption = 'GetWindowsCaptions'
        TabOrder = 9
        OnClick = btnGetWindowsCaptionsClick
      end
      object btnGetWindowsClassNames: TButton
        Left = 24
        Top = 104
        Width = 150
        Height = 25
        Caption = 'GetWindowsClassNames'
        TabOrder = 8
        OnClick = btnGetWindowsClassNamesClick
      end
      object btnPostVKeyToWindow: TButton
        Left = 24
        Top = 296
        Width = 150
        Height = 25
        Caption = 'PostVKeyToWindow'
        TabOrder = 14
        OnClick = btnPostVKeyToWindowClick
      end
      object btnPostKeyToWindow: TButton
        Left = 24
        Top = 328
        Width = 150
        Height = 25
        Caption = 'PostKeyToWindow'
        TabOrder = 16
        OnClick = btnPostKeyToWindowClick
      end
      object cbVKey: TComboBox
        Left = 344
        Top = 298
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 15
        Text = 'VK_F1'
        Items.Strings = (
          'VK_F1'
          'VK_F2'
          'VK_F3'
          'VK_RETURN'
          'VK_LEFT'
          'VK_RIGHT'
          'VK_UP'
          'VK_DOWN'
          'VK_NUMPAD5'
          'VK_NUMLOCK')
      end
      object cbKey: TEdit
        Left = 192
        Top = 330
        Width = 121
        Height = 21
        TabOrder = 17
        Text = 'cbKey'
      end
      object btnGotoCurrWindowLeftTop: TButton
        Left = 24
        Top = 264
        Width = 150
        Height = 25
        Caption = 'GotoCurrWindowLeftTop'
        TabOrder = 13
        OnClick = btnGotoCurrWindowLeftTopClick
      end
      object edtParentWindow: TEdit
        Left = 112
        Top = 8
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object edtClassName: TEdit
        Left = 112
        Top = 32
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object edtCaption: TEdit
        Left = 112
        Top = 56
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object cbClassNameCaseSensitive: TCheckBox
        Left = 272
        Top = 34
        Width = 169
        Height = 17
        Caption = 'Class Name Case Sensitive'
        TabOrder = 2
      end
      object cbClassNameWholeWordOnly: TCheckBox
        Left = 432
        Top = 34
        Width = 169
        Height = 17
        Caption = 'Class Name Whole Word Only'
        TabOrder = 3
      end
      object cbCaptionCaseSensitive: TCheckBox
        Left = 272
        Top = 58
        Width = 169
        Height = 17
        Caption = 'Caption Case Sensitive'
        TabOrder = 5
      end
      object cbCaptionWholeWordOnly: TCheckBox
        Left = 432
        Top = 58
        Width = 169
        Height = 17
        Caption = 'Caption Whole Word Only'
        TabOrder = 6
      end
      object cbVisibleRequired: TCheckBox
        Left = 112
        Top = 80
        Width = 169
        Height = 17
        Caption = 'Visible Required'
        TabOrder = 7
      end
      object btnGetWindowsDescriptions: TButton
        Left = 344
        Top = 104
        Width = 150
        Height = 25
        Caption = 'GetWindowsDescriptions'
        TabOrder = 10
        OnClick = btnGetWindowsDescriptionsClick
      end
      object btnFindFirstWindow: TButton
        Left = 24
        Top = 152
        Width = 150
        Height = 25
        Caption = 'FindFirstWindow'
        TabOrder = 12
        OnClick = btnFindFirstWindowClick
      end
      object btnPostSysVKeyToWindow: TButton
        Left = 184
        Top = 296
        Width = 150
        Height = 25
        Caption = 'PostSysVKeyToWindow'
        TabOrder = 18
        OnClick = btnPostSysVKeyToWindowClick
      end
      object btnSleepUntilWindowIsPresent: TButton
        Left = 24
        Top = 376
        Width = 153
        Height = 25
        Caption = 'SleepUntilWindowIsPresent'
        TabOrder = 19
        OnClick = btnSleepUntilWindowIsPresentClick
      end
      object btnSleepUntilWindowIsAbsent: TButton
        Left = 184
        Top = 376
        Width = 153
        Height = 25
        Caption = 'SleepUntilWindowIsAbsent'
        TabOrder = 20
        OnClick = btnSleepUntilWindowIsAbsentClick
      end
      object btnSleepUntilWindowContainsImage: TButton
        Left = 24
        Top = 408
        Width = 225
        Height = 25
        Caption = 'SleepUntilWindowContainsImage'
        TabOrder = 22
        OnClick = btnSleepUntilWindowContainsImageClick
      end
      object btnSleepAndClickUntilWindowContainsImage: TButton
        Left = 256
        Top = 408
        Width = 225
        Height = 25
        Caption = 'SleepAndClickUntilWindowContainsImage'
        TabOrder = 23
        OnClick = btnSleepAndClickUntilWindowContainsImageClick
      end
      object btnClickWindow: TButton
        Left = 184
        Top = 440
        Width = 153
        Height = 25
        Caption = 'ClickWindow'
        TabOrder = 25
        OnClick = btnClickWindowClick
      end
      object btnSetCursorPosOnWindow: TButton
        Left = 24
        Top = 440
        Width = 153
        Height = 25
        Caption = 'SetCursorPosOnWindow'
        TabOrder = 24
        OnClick = btnSetCursorPosOnWindowClick
      end
      object btnSleepUntilWindowIsForeground: TButton
        Left = 344
        Top = 376
        Width = 177
        Height = 25
        Caption = 'SleepUntilWindowIsForeground'
        TabOrder = 21
        OnClick = btnSleepUntilWindowIsForegroundClick
      end
      object btnGetAllWindowsDescriptions: TButton
        Left = 504
        Top = 104
        Width = 150
        Height = 25
        Caption = 'GetAllWindowsDescriptions'
        TabOrder = 11
        OnClick = btnGetAllWindowsDescriptionsClick
      end
    end
    object tsSnap: TTabSheet
      Caption = 'tsSnap'
      ImageIndex = 3
      object Label2: TLabel
        Left = 24
        Top = 28
        Width = 126
        Height = 13
        Caption = 'Color of screen at cursor: '
      end
      object lbScreenColor: TLabel
        Left = 160
        Top = 20
        Width = 115
        Height = 23
        Caption = 'lbScreenColor'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label4: TLabel
        Left = 24
        Top = 108
        Width = 23
        Height = 13
        Caption = 'Left:'
      end
      object Label5: TLabel
        Left = 24
        Top = 132
        Width = 22
        Height = 13
        Caption = 'Top:'
      end
      object Label6: TLabel
        Left = 24
        Top = 156
        Width = 32
        Height = 13
        Caption = 'Width:'
      end
      object Label7: TLabel
        Left = 24
        Top = 180
        Width = 35
        Height = 13
        Caption = 'Height:'
      end
      object btnSnapWindow: TButton
        Left = 24
        Top = 64
        Width = 75
        Height = 25
        Caption = 'Snap Window'
        TabOrder = 0
        OnClick = btnSnapWindowClick
      end
      object edtLeft: TEdit
        Left = 64
        Top = 104
        Width = 75
        Height = 21
        TabOrder = 1
        Text = '0'
      end
      object edtTop: TEdit
        Left = 64
        Top = 128
        Width = 75
        Height = 21
        TabOrder = 2
        Text = '0'
      end
      object edtWidth: TEdit
        Left = 64
        Top = 152
        Width = 75
        Height = 21
        TabOrder = 3
        Text = '800'
      end
      object edtHeight: TEdit
        Left = 64
        Top = 176
        Width = 75
        Height = 21
        TabOrder = 4
        Text = '600'
      end
      object sbScreen: TScrollBox
        Left = 160
        Top = 64
        Width = 641
        Height = 345
        TabOrder = 5
        object imgScreen: TImage
          Left = 32
          Top = 24
          Width = 105
          Height = 105
        end
      end
      object btnSnapWindowEx: TButton
        Left = 24
        Top = 216
        Width = 89
        Height = 25
        Caption = 'Snap Window Ex'
        TabOrder = 6
        OnClick = btnSnapWindowExClick
      end
    end
  end
  object odChooseProcess: TOpenDialog
    DefaultExt = 'exe'
    Filter = 'Executable Files (*.exe)|*.exe'
    Left = 16
    Top = 520
  end
  object appeTestWindows: TApplicationEvents
    OnMessage = appeTestWindowsMessage
    Left = 48
    Top = 520
  end
  object tmrTestWindows: TTimer
    Interval = 500
    OnTimer = tmrTestWindowsTimer
    Left = 80
    Top = 520
  end
end
