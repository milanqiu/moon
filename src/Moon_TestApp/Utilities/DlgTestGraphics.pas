unit DlgTestGraphics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DlgTest, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ComCtrls,
  ExtCtrls;

type
  TTestGraphicsDialog = class(TTestDialog)
    pcTestGraphics: TPageControl;
    tsPixeledImage: TTabSheet;
    lbCurrWindow: TLabel;
    lbCurrWindowClassName: TLabel;
    lbCurrWindowCaption: TLabel;
    edtFindWindow: TEdit;
    btnFindWindowByCaptionSub: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtLeft: TEdit;
    edtTop: TEdit;
    edtWidth: TEdit;
    edtHeight: TEdit;
    sbScreen: TScrollBox;
    imgScreen: TImage;
    tsCanvas: TTabSheet;
    gbCanvas: TGroupBox;
    Bevel1: TBevel;
    pbCanvas: TPaintBox;
    rgHAlign: TRadioGroup;
    rgVAlign: TRadioGroup;
    rgContent: TRadioGroup;
    procedure btnDrawWindowExClick(Sender: TObject);
    procedure btnDrawWindowClick(Sender: TObject);
    procedure btnFindWindowByCaptionSubClick(Sender: TObject);
    procedure rgContentClick(Sender: TObject);
    procedure rgVAlignClick(Sender: TObject);
    procedure rgHAlignClick(Sender: TObject);
    procedure pbCanvasPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestGraphicsDialog: TTestGraphicsDialog;

implementation

{$R *.dfm}

uses mnGraphics, mnWindows, mnSystem;

procedure TTestGraphicsDialog.FormCreate(Sender: TObject);
begin
  edtWidth.Text := IntToStr(Screen.Width);
  edtHeight.Text := IntToStr(Screen.Height);
end;

procedure TTestGraphicsDialog.pbCanvasPaint(Sender: TObject);
var
  X, Y: Integer;
  HAlign: TAlignment;
  VAlign: TVerticalAlignment;
  BMP: TBitmap;
  GraphicList: mnTGraphicList;
  i: Integer;
begin
  X := pbCanvas.ClientWidth div 2;
  Y := pbCanvas.ClientHeight div 2;

  pbCanvas.Canvas.Font.Color := clGray;
  case rgHAlign.ItemIndex of
    1: HAlign := taCenter;
    2: HAlign := taRightJustify;
  else
    HAlign := taLeftJustify;
  end;
  case rgVAlign.ItemIndex of
    1: VAlign := taVerticalCenter;
    2: VAlign := taAlignBottom;
  else
    VAlign := taAlignTop;
  end;

  case rgContent.ItemIndex of
    0: mnDrawText(pbCanvas.Canvas, X, Y, 'Text', HAlign, VAlign);
    1:
    begin
      BMP := TBitmap.Create;
      try
        BMP.LoadFromFile(mnTProjectConvention.GetFilesPathSub('Images\BMP.bmp'));
        mnDrawGraphic(pbCanvas.Canvas, X, Y, BMP, HAlign, VAlign);
      finally
        BMP.Free;
      end;
    end;
    2:
    begin
      mnDrawHLine(pbCanvas.Canvas, X-10, X+10, Y-2);
      mnDrawHLine(pbCanvas.Canvas, X+10, X-10, Y+2);
      mnDrawVLine(pbCanvas.Canvas, X-2, Y-10, Y+10);
      mnDrawVLine(pbCanvas.Canvas, X+2, Y+10, Y-10);
    end;
    3, 4, 5:
    begin
      GraphicList := mnTGraphicList.Create;
      try
        for i := 0 to 9 do
        begin
          BMP := TBitmap.Create;
          BMP.LoadFromFile(mnTProjectConvention.GetFilesPathSub('Images\Numbers\' + IntToStr(i) + '.bmp'));
          GraphicList.Add(BMP);
        end;
        GraphicList.DrawingCanvas := pbCanvas.Canvas;
        case rgContent.ItemIndex of
          3: GraphicList.Draw(8, X, Y, HAlign, VAlign);
          4: GraphicList.DrawBatch([0, 2, 9], X, Y, 10, HAlign, VAlign);
          5: GraphicList.DrawInteger(1982, X, Y, 5, HAlign, VAlign);
        end;
      finally
        GraphicList.Free;
      end;
    end;
  end;

  pbCanvas.Canvas.Pen.Color := clRed;
  mnDrawPoint(pbCanvas.Canvas, X, Y);
end;

procedure TTestGraphicsDialog.rgHAlignClick(Sender: TObject);
begin
  pbCanvas.Repaint;
end;

procedure TTestGraphicsDialog.rgVAlignClick(Sender: TObject);
begin
  pbCanvas.Repaint;
end;

procedure TTestGraphicsDialog.rgContentClick(Sender: TObject);
begin
  pbCanvas.Repaint;
end;

var
  CurrWindow: HWND;

procedure TTestGraphicsDialog.btnFindWindowByCaptionSubClick(Sender: TObject);
var
  Option: mnTFindWindowsOption;
begin
  Option := mnDefaultFindWindowsOption;
  Option.Caption := edtFindWindow.Text;
  CurrWindow := mnFindFirstWindow(Option);
  lbCurrWindow.Caption := IntToStr(CurrWindow);
  lbCurrWindowClassName.Caption := mnGetWindowClassName(CurrWindow);
  lbCurrWindowCaption.Caption := mnGetWindowCaption(CurrWindow);
end;

procedure TTestGraphicsDialog.btnDrawWindowClick(Sender: TObject);
var
  ARect: TRect;
  PixeledImage: mnTPixeledImage;
begin
  ARect.Left := StrToInt(edtLeft.Text);
  ARect.Top := StrToInt(edtTop.Text);
  ARect.Right := ARect.Left + StrToInt(edtWidth.Text);
  ARect.Bottom := ARect.Top + StrToInt(edtHeight.Text);

  sbScreen.ScrollBy(-2000, -2000);
  imgScreen.Left := 0;
  imgScreen.Top := 0;
  imgScreen.Width := StrToInt(edtWidth.Text);
  imgScreen.Height := StrToInt(edtHeight.Text);

  PixeledImage := mnTPixeledImage.Create;
  try
    PixeledImage.SetSize(StrToInt(edtWidth.Text), StrToInt(edtHeight.Text));
    PixeledImage.DrawWindow(ARect, CurrWindow);
    PixeledImage.SaveToBMP(imgScreen.Picture.Bitmap);
  finally
    PixeledImage.Free;
  end;
end;

procedure TTestGraphicsDialog.btnDrawWindowExClick(Sender: TObject);
var
  ARect: TRect;
  PixeledImage: mnTPixeledImage;
begin
  ARect.Left := StrToInt(edtLeft.Text);
  ARect.Top := StrToInt(edtTop.Text);
  ARect.Right := ARect.Left + StrToInt(edtWidth.Text);
  ARect.Bottom := ARect.Top + StrToInt(edtHeight.Text);

  sbScreen.ScrollBy(-2000, -2000);
  imgScreen.Left := 0;
  imgScreen.Top := 0;
  imgScreen.Width := StrToInt(edtWidth.Text);
  imgScreen.Height := StrToInt(edtHeight.Text);

  PixeledImage := mnTPixeledImage.Create;
  try
    PixeledImage.SetSize(StrToInt(edtWidth.Text), StrToInt(edtHeight.Text));
    PixeledImage.DrawWindowEx(ARect, CurrWindow);
    PixeledImage.SaveToBMP(imgScreen.Picture.Bitmap);
  finally
    PixeledImage.Free;
  end;    
end;

end.
