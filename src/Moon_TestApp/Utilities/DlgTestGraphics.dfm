inherited TestGraphicsDialog: TTestGraphicsDialog
  Left = 972
  Top = 160
  Caption = 'TestGraphics'
  ClientHeight = 498
  ClientWidth = 854
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxbtnOK: TcxButton
    Left = 392
    Top = 464
  end
  object pcTestGraphics: TPageControl
    Left = 16
    Top = 16
    Width = 825
    Height = 433
    ActivePage = tsCanvas
    TabOrder = 1
    object tsCanvas: TTabSheet
      Caption = 'Canvas'
      object gbCanvas: TGroupBox
        Left = 18
        Top = 8
        Width = 297
        Height = 385
        Caption = 'gbCanvas'
        TabOrder = 0
        object Bevel1: TBevel
          Left = 16
          Top = 24
          Width = 265
          Height = 153
        end
        object pbCanvas: TPaintBox
          Left = 17
          Top = 25
          Width = 263
          Height = 151
          OnPaint = pbCanvasPaint
        end
        object rgHAlign: TRadioGroup
          Left = 16
          Top = 192
          Width = 129
          Height = 65
          Caption = 'rgHAlign'
          ItemIndex = 1
          Items.Strings = (
            'taLeftJustify'
            'taCenter'
            'taRightJustify')
          TabOrder = 0
          OnClick = rgHAlignClick
        end
        object rgVAlign: TRadioGroup
          Left = 160
          Top = 192
          Width = 121
          Height = 65
          Caption = 'rgVAlign'
          ItemIndex = 1
          Items.Strings = (
            'taAlignTop'
            'taVerticalCenter'
            'taAlignBottom')
          TabOrder = 1
          OnClick = rgVAlignClick
        end
        object rgContent: TRadioGroup
          Left = 72
          Top = 264
          Width = 161
          Height = 105
          Caption = 'rgContent'
          ItemIndex = 0
          Items.Strings = (
            'Text'
            'Image'
            'HLine, VLine'
            'GraphicList.Draw'
            'GraphicList.DrawBatch'
            'GraphicList.DrawInteger')
          TabOrder = 2
          OnClick = rgContentClick
        end
      end
    end
    object tsPixeledImage: TTabSheet
      Caption = 'PixeledImage'
      object lbCurrWindow: TLabel
        Left = 16
        Top = 8
        Width = 67
        Height = 13
        Caption = 'lbCurrWindow'
      end
      object lbCurrWindowClassName: TLabel
        Left = 16
        Top = 32
        Width = 119
        Height = 13
        Caption = 'lbCurrWindowClassName'
      end
      object lbCurrWindowCaption: TLabel
        Left = 16
        Top = 56
        Width = 104
        Height = 13
        Caption = 'lbCurrWindowCaption'
      end
      object Label4: TLabel
        Left = 16
        Top = 244
        Width = 23
        Height = 13
        Caption = 'Left:'
      end
      object Label5: TLabel
        Left = 16
        Top = 268
        Width = 22
        Height = 13
        Caption = 'Top:'
      end
      object Label6: TLabel
        Left = 16
        Top = 292
        Width = 32
        Height = 13
        Caption = 'Width:'
      end
      object Label7: TLabel
        Left = 16
        Top = 316
        Width = 35
        Height = 13
        Caption = 'Height:'
      end
      object edtFindWindow: TEdit
        Left = 16
        Top = 80
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'edtFindWindow'
      end
      object btnFindWindowByCaptionSub: TButton
        Left = 16
        Top = 112
        Width = 129
        Height = 25
        Caption = 'FindWindowByCaptionSub'
        TabOrder = 1
        OnClick = btnFindWindowByCaptionSubClick
      end
      object btnDrawWindow: TButton
        Left = 16
        Top = 208
        Width = 121
        Height = 25
        Caption = 'DrawWindow'
        TabOrder = 2
        OnClick = btnDrawWindowClick
      end
      object edtLeft: TEdit
        Left = 56
        Top = 240
        Width = 75
        Height = 21
        TabOrder = 3
        Text = '0'
      end
      object edtTop: TEdit
        Left = 56
        Top = 264
        Width = 75
        Height = 21
        TabOrder = 4
        Text = '0'
      end
      object edtWidth: TEdit
        Left = 56
        Top = 288
        Width = 75
        Height = 21
        TabOrder = 5
        Text = '800'
      end
      object edtHeight: TEdit
        Left = 56
        Top = 312
        Width = 75
        Height = 21
        TabOrder = 6
        Text = '600'
      end
      object sbScreen: TScrollBox
        Left = 160
        Top = 40
        Width = 641
        Height = 345
        TabOrder = 7
        object imgScreen: TImage
          Left = 32
          Top = 24
          Width = 105
          Height = 105
        end
      end
      object btnDrawWindowEx: TButton
        Left = 16
        Top = 344
        Width = 121
        Height = 25
        Caption = 'DrawWindowEx'
        TabOrder = 8
        OnClick = btnDrawWindowExClick
      end
    end
  end
end
