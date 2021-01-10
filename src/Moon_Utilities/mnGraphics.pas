unit mnGraphics;

interface

uses Types, Classes, mnSystem, Windows, Graphics;

{--------------------------------
  从一个颜色得到其R、G、B部分。
  Tested in TestUnit.
 --------------------------------}
function mnGetColorR(const Color: TColor): Byte; inline;
function mnGetColorG(const Color: TColor): Byte; inline;
function mnGetColorB(const Color: TColor): Byte; inline;

{--------------------------------
  设置Canvas的ClipRect。
  标准VCL中，TCanvas的ClipRect属性为只读。
  注意：该功能用时需慎重，VCL自身会修改其ClipRect，有可能与用户设置起冲突。
  Tested in TestUnit.
 --------------------------------}
procedure mnSetCanvasClipRect(Canvas: TCanvas; const Rect: TRect);

{--------------------------------
  在点(X, Y)处使用Canvas绘制一个点。
  Tested in TestApp.
 --------------------------------}
procedure mnDrawPoint(Canvas: TCanvas; const X, Y: Integer); inline;
{--------------------------------
  从点(X1, Y)处往点(X2, Y)处使用Canvas绘制一条水平直线。两个端点都被包括。
  Tested in TestApp.
 --------------------------------}
procedure mnDrawHLine(Canvas: TCanvas; const X1, X2, Y: Integer);
{--------------------------------
  从点(X, Y1)处往点(X, Y2)处使用Canvas绘制一条竖直直线。两个端点都被包括。
  Tested in TestApp.
 --------------------------------}
procedure mnDrawVLine(Canvas: TCanvas; const X, Y1, Y2: Integer);

{--------------------------------
  在点(X, Y)处使用Canvas绘制文本。可以有不同的水平和垂直对齐方式来决定文本的实际位置。
  Tested in TestApp.
 --------------------------------}
procedure mnDrawText(Canvas: TCanvas; const X, Y: Integer; const Text: string;
  const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop);
{--------------------------------
  在点(X, Y)处使用Canvas绘制图像。可以有不同的水平和垂直对齐方式来决定图像的实际位置。
  Tested in TestApp.
 --------------------------------}
procedure mnDrawGraphic(Canvas: TCanvas; const X, Y: Integer; Graphic: TGraphic;
  const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop);

type
{--------------------------------
  图像列表，内部容纳了一系列的图像，可根据调用指令进行一些高级绘制。
  Tested in TestApp.
 --------------------------------}
  mnTGraphicList = class(mnTObjList)
  protected
    function GetGraphic(Index: Integer): TGraphic;
  public
    function Add(AGraphic: TGraphic): Integer;
    procedure Insert(Index: Integer; AGraphic: TGraphic);
    property Items[Index: Integer]: TGraphic read GetGraphic; default;
  protected
    FDrawingCanvas: TCanvas;
    // 检查画布是否已指定
    procedure CheckDrawingCanvas;
  public
    // 绘制所使用的画布
    property DrawingCanvas: TCanvas read FDrawingCanvas write FDrawingCanvas;
  public
    // 在点(X, Y)处绘制第Index张图像。可以有不同的水平和垂直对齐方式来决定图像的实际位置
    procedure Draw(const Index: Integer; const X, Y: Integer;
      const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop);

    // 在点(X, Y)处依次绘制指定索引号的多张图像，每张图像的间隔为Spacing
    // 可以有不同的水平和垂直对齐方式来决定整数的实际位置
    procedure DrawBatch(const Indexes: array of Integer; const X, Y, Spacing: Integer;
      const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop); overload;
    procedure DrawBatch(const Indexes: mnTIntList; const X, Y, Spacing: Integer;
      const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop); overload;

    // 预设内部容纳的图像系列为0-9的数字，该函数将在点(X, Y)处绘制一个整数，整数内每个数字的间隔为Spacing
    // 可以有不同的水平和垂直对齐方式来决定整数的实际位置
    procedure DrawInteger(const Value: Integer; const X, Y, Spacing: Integer;
      const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop);
  end;

{--------------------------------
  从一个位图里得到设备无关的点数据。
  其内部实质上是调用Windows API的GetDIBits，但作了更加良好的封装。
  BMP是需要得到数据的位图，TopLine是需要得到数据的顶行，NumLines是需要得到数据的行数。
  得到的数据是24位RGB的。
  得到的数据将存在Bits里，函数内部会给Bits分配空间，大小为LineWidth * NumLines。
  LineWidth是对BMP的宽度乘3（每个像素用三个字节表示）后，补齐到4的倍数。
  Bits的格式是对BMP的所需区域内像素，从下到上从左到右，每个像素用三个字节存储，分别是B、G、R。
  Tested in TestUnit.
 --------------------------------}
procedure mnGetDIBits(BMP: TBitmap; const TopLine, NumLines: Integer; var Bits: mnTByteArray);

{--------------------------------
  将设备无关的点数据设置到位图里。
  其内部实质上是调用Windows API的SetDIBits，但作了更加良好的封装。
  BMP是需要设置数据的位图，TopLine是需要设置数据的顶行，NumLines是需要设置数据的行数。
  设置的数据是24位RGB的。
  设置的数据存在Bits里，大小为LineWidth * NumLines。
  LineWidth是对BMP的宽度乘3（每个像素用三个字节表示）后，补齐到4的倍数。
  Bits的格式是对BMP的设置区域内像素，从下到上从左到右，每个像素用三个字节存储，分别是B、G、R。
  Tested in TestUnit.
 --------------------------------}
procedure mnSetDIBits(BMP: TBitmap; const TopLine, NumLines: Integer; const Bits: mnTByteArray);

type
{--------------------------------
  颜色和像素。
 --------------------------------}
  mnTColor = TColor;
  mnTPixel = mnTColor;

{--------------------------------
  像素图。
  以二维数组形式存储图片的每个像素，便于对图片进行运算和操作。
  Tested in TestUnit and TestApp.
 --------------------------------}
  mnTPixeledImage = class
  // 图的宽度，高度，边界矩形，和设置图片大小
  protected
    FWidth: Integer;
    FHeight: Integer;
    function GetBoundsRect: TRect;
  public
    property Width: Integer read FWidth;
    property Height: Integer read FHeight;
    property BoundsRect: TRect read GetBoundsRect;
    procedure SetSize(const AWidth, AHeight: Integer); overload;
    procedure SetSize(const ARect: TRect); overload;
  // 按位置读写图的像素。X和Y从0开始。如果越界，会抛出异常
  protected
    FPixels: array of array of mnTPixel;
    function GetPixel(const X, Y: Integer): mnTPixel;
    procedure SetPixel(const X, Y: Integer; const Value: mnTPixel);
  public
    property Pixels[const X, Y: Integer]: mnTPixel read GetPixel write SetPixel;
  public
    // 使用指定背景色清除整张图片
    procedure Clear(const BgColor: mnTColor = clWhite);
  public
    // 在图片的(X, Y)处，绘制DC中DCRect区域，或绘制全部DC，但不超出图片本身边界
    procedure DrawDC(DC: HDC; const DCRect: TRect; const X: Integer = 0; const Y: Integer = 0); overload;
    procedure DrawDC(DC: HDC;                      const X: Integer = 0; const Y: Integer = 0); overload;
    // 在图片的(X, Y)处，绘制BMP中BMPRect区域，或绘制整张BMP，但不超出图片本身边界
    procedure DrawBMP(BMP: TBitmap; const BMPRect: TRect; const X: Integer = 0; const Y: Integer = 0); overload;
    procedure DrawBMP(BMP: TBitmap;                       const X: Integer = 0; const Y: Integer = 0); overload;
    // 在图片的(X, Y)处，绘制指定窗口的WindowRect区域，但不超出图片本身边界
    // 若没有指定窗口，则绘制屏幕WindowRect区域的图像
    // 该区域不一定位于前端，被遮挡或在屏幕外皆可，但不能最小化，也不能被hide
    // 这两个函数的实现方法不同，在实际运行过程中，不一定能成功，取决于操作系统版本、应用程序的界面绘制方式、截取窗口的特征，等等
    // 通常地，如果需要绘制的是应用程序主窗口，适合用DrawWindowEx；如果是子控件窗口，适合用DrawWindow
    procedure DrawWindow  (const WindowRect: TRect; const Window: HWND = 0; const X: Integer = 0; const Y: Integer = 0);
    procedure DrawWindowEx(const WindowRect: TRect; const Window: HWND = 0; const X: Integer = 0; const Y: Integer = 0);
  public
    // 从一个BMP文件里装载图片，图片大小将设置为同BMP大小相等
    procedure LoadFromBMPFile(const FileName: string);
    // 将图片的Rect区域，或整张图片，存入BMP中，BMP大小将设置为同Rect区域大小相等，或同整张图片大小相等
    procedure SaveToBMP(BMP: TBitmap; const Rect: TRect); overload;
    procedure SaveToBMP(BMP: TBitmap); overload;
    // 将图片的Rect区域，或整张图片，存入BMP文件中，文件中的BMP大小将设置为同Rect区域大小相等，或同整张图片大小相等
    procedure SaveToBMPFile(const FileName: string; const Rect: TRect); overload;
    procedure SaveToBMPFile(const FileName: string); overload;
  public
    // 判断图片的指定区域，是否和另一张图片的指定区域完全相同，即大小和每个像素（的颜色）都相同
    // 如果两个区域的宽高都是0，则返回相同
    // 在其它重载形式里，如果有图片没有指定区域，则代表比较它的整张图片
    function Compare(AnotherImage: mnTPixeledImage; const Rect, AnotherRect: TRect): Boolean; overload;
    function Compare(AnotherImage: mnTPixeledImage; const Rect:              TRect): Boolean; overload;
    function Compare(AnotherImage: mnTPixeledImage                                ): Boolean; overload;
    // 判断图片的指定区域，和另一张图片的指定区域的相似度，最小为0，最大为1
    // 如果两个区域的宽高都是0，则相似度为1
    // 如果两个区域的大小不一样，则相似度为0
    // 如果大小一样，则相似度等于（颜色）相同的像素数量除以区域的总像素数量
    // 在其它重载形式里，如果有图片没有指定区域，则代表比较它的整张图片
    function CompareSimilarity(AnotherImage: mnTPixeledImage; const Rect, AnotherRect: TRect): Extended; overload;
    function CompareSimilarity(AnotherImage: mnTPixeledImage; const Rect:              TRect): Extended; overload;
    function CompareSimilarity(AnotherImage: mnTPixeledImage                                ): Extended; overload;
    // 和Compare类似，但支持掩码，即忽略另一张图片里颜色为MaskColor的像素，不参与比较
    function CompareWithMask(AnotherImage: mnTPixeledImage; const Rect, AnotherRect: TRect; const MaskColor: mnTColor = clWhite): Boolean; overload;
    function CompareWithMask(AnotherImage: mnTPixeledImage; const Rect:              TRect; const MaskColor: mnTColor = clWhite): Boolean; overload;
    function CompareWithMask(AnotherImage: mnTPixeledImage;                                 const MaskColor: mnTColor = clWhite): Boolean; overload;
  public
    // 在图片的指定区域内，寻找另一张图片的指定区域的图像，返回是否找到
    // 如果找到，X和Y返回其位置。当不需要位置时，也可使用没有X和Y的重载形式。注意位置从图片左上角算起，而不从区域左上角算起
    // 如果区域内存在多个完全匹配的子区域，则返回其位置的Y最小的那个。Y相同时，返回X最小的那个
    // 如果被寻找的区域宽高都是0，则返回找到，X和Y都返回0
    // 在其它重载形式里，如果有图片没有指定区域，则代表寻找它的整张图片
    function Find(PartImage: mnTPixeledImage; const Rect, PartRect: TRect; var X, Y: Integer): Boolean; overload;
    function Find(PartImage: mnTPixeledImage; const Rect, PartRect: TRect):                    Boolean; overload;
    function Find(PartImage: mnTPixeledImage; const Rect:           TRect; var X, Y: Integer): Boolean; overload;
    function Find(PartImage: mnTPixeledImage; const Rect:           TRect):                    Boolean; overload;
    function Find(PartImage: mnTPixeledImage;                              var X, Y: Integer): Boolean; overload;
    function Find(PartImage: mnTPixeledImage):                                                 Boolean; overload;
    // 和Find类似，但支持掩码，即忽略另一张图片里颜色为MaskColor的像素，不参与比较
    function FindWithMask(PartImage: mnTPixeledImage; const Rect, PartRect: TRect; var X, Y: Integer; const MaskColor: mnTColor = clWhite): Boolean; overload;
    function FindWithMask(PartImage: mnTPixeledImage; const Rect, PartRect: TRect;                    const MaskColor: mnTColor = clWhite): Boolean; overload;
    function FindWithMask(PartImage: mnTPixeledImage; const Rect:           TRect; var X, Y: Integer; const MaskColor: mnTColor = clWhite): Boolean; overload;
    function FindWithMask(PartImage: mnTPixeledImage; const Rect:           TRect;                    const MaskColor: mnTColor = clWhite): Boolean; overload;
    function FindWithMask(PartImage: mnTPixeledImage;                              var X, Y: Integer; const MaskColor: mnTColor = clWhite): Boolean; overload;
    function FindWithMask(PartImage: mnTPixeledImage;                                                 const MaskColor: mnTColor = clWhite): Boolean; overload;
  public
    // 将整张图片复制到另一张图片，另一张图片的大小将设置为同这张图片相等
    procedure CopyTo(AnotherImage: mnTPixeledImage);
  end;

implementation

uses SysUtils, mnMath, Math, mnWindows, mnResStrsU, mnDialog;

function mnGetColorR(const Color: TColor): Byte; inline;
begin
  Result := Lo(Color);
end;

function mnGetColorG(const Color: TColor): Byte; inline;
begin
  Result := Hi(Color);
end;

function mnGetColorB(const Color: TColor): Byte; inline;
begin
  Result := (Color and $FF0000) shr 16;
end;

procedure mnSetCanvasClipRect(Canvas: TCanvas; const Rect: TRect);
begin
  SelectClipRgn(Canvas.Handle, CreateRectRgn(Rect.Left, Rect.Top, Rect.Right, Rect.Bottom));
end;

procedure mnDrawPoint(Canvas: TCanvas; const X, Y: Integer); inline;
begin
  Canvas.MoveTo(X, Y);
  Canvas.LineTo(X+1, Y+1);
end;

procedure mnDrawHLine(Canvas: TCanvas; const X1, X2, Y: Integer);
begin
  Canvas.MoveTo(X1, Y);
  if X1 <= X2 then
    Canvas.LineTo(X2+1, Y)
  else
    Canvas.LineTo(X2-1, Y);
end;

procedure mnDrawVLine(Canvas: TCanvas; const X, Y1, Y2: Integer);
begin
  Canvas.MoveTo(X, Y1);
  if Y1 <= Y2 then
    Canvas.LineTo(X, Y2+1)
  else
    Canvas.LineTo(X, Y2-1);
end;

procedure mnDrawText(Canvas: TCanvas; const X, Y: Integer; const Text: string;
  const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop);
begin
  Canvas.TextOut(mnAdjustX(X, Canvas.TextWidth(Text), HAlign),
                 mnAdjustY(Y, Canvas.TextHeight(Text), VAlign),
                 Text);
end;

procedure mnDrawGraphic(Canvas: TCanvas; const X, Y: Integer; Graphic: TGraphic;
  const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop);
begin
  Canvas.Draw(mnAdjustX(X, Graphic.Width, HAlign),
              mnAdjustY(Y, Graphic.Height, VAlign),
              Graphic);
end;

{ mnTGraphicList }

function mnTGraphicList.GetGraphic(Index: Integer): TGraphic;
begin
  Result := TGraphic(Get(Index));
end;

function mnTGraphicList.Add(AGraphic: TGraphic): Integer;
begin
  Result := inherited Add(AGraphic);
end;

procedure mnTGraphicList.Insert(Index: Integer; AGraphic: TGraphic);
begin
  inherited Insert(Index, AGraphic);
end;

procedure mnTGraphicList.CheckDrawingCanvas;
begin
  mnCreateErrorIf(not Assigned(FDrawingCanvas), SDrawingCanvasNotAssigned);
end;

procedure mnTGraphicList.Draw(const Index: Integer; const X, Y: Integer;
  const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop);
begin
  CheckDrawingCanvas;
  mnCreateErrorIf(not mnBetweenIE(Index, 0, Count), SGraphicListIndexError, [Index, Count]);
  mnDrawGraphic(DrawingCanvas, X, Y, GetGraphic(Index), HAlign, VAlign);
end;

procedure mnTGraphicList.DrawBatch(const Indexes: array of Integer; const X, Y, Spacing: Integer;
  const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop);
var
  SumWidth, MaxHeight: Integer;
  Index: Integer;
  G: TGraphic;
  PosX, PosY: Integer;
begin
  CheckDrawingCanvas;

  SumWidth := 0;
  MaxHeight := 0;
  for Index in Indexes do
  begin
    mnCreateErrorIf(not mnBetweenIE(Index, 0, Count), SGraphicListIndexError, [Index, Count]);
    G := GetGraphic(Index);
    SumWidth := SumWidth + G.Width;
    MaxHeight := Max(MaxHeight, G.Height);
  end;
  SumWidth := SumWidth + (Length(Indexes)-1) * Spacing;

  PosX := mnAdjustX(X, SumWidth, HAlign);
  PosY := mnAdjustY(Y, MaxHeight, VAlign);
  for Index in Indexes do
  begin
    G := GetGraphic(Index);
    DrawingCanvas.Draw(PosX, PosY, G);
    PosX := PosX + G.Width + Spacing;
  end;
end;

procedure mnTGraphicList.DrawBatch(const Indexes: mnTIntList; const X, Y, Spacing: Integer;
  const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop);
var
  SumWidth, MaxHeight: Integer;
  Index: Integer;
  G: TGraphic;
  PosX, PosY: Integer;
begin
  CheckDrawingCanvas;

  SumWidth := 0;
  MaxHeight := 0;
  for Index in Indexes do
  begin
    mnCreateErrorIf(not mnBetweenIE(Index, 0, Count), SGraphicListIndexError, [Index, Count]);
    G := GetGraphic(Index);
    SumWidth := SumWidth + G.Width;
    MaxHeight := Max(MaxHeight, G.Height);
  end;
  SumWidth := SumWidth + (Indexes.Count-1) * Spacing;

  PosX := mnAdjustX(X, SumWidth, HAlign);
  PosY := mnAdjustY(Y, MaxHeight, VAlign);
  for Index in Indexes do
  begin
    G := GetGraphic(Index);
    DrawingCanvas.Draw(PosX, PosY, G);
    PosX := PosX + G.Width + Spacing;
  end;
end;

procedure mnTGraphicList.DrawInteger(const Value: Integer; const X, Y, Spacing: Integer;
  const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop);
var
  Indexes: mnTIntList;
  ValueStr: string;
  ch: Char;
begin
  Indexes := mnTIntList.Create;
  try
    ValueStr := IntToStr(Value);
    for ch in ValueStr do
      Indexes.Add(mnCharToDigitInt(ch));
    DrawBatch(Indexes, X, Y, Spacing, HAlign, VAlign);
  finally
    Indexes.Free;
  end;
end;

procedure mnGetDIBits(BMP: TBitmap; const TopLine, NumLines: Integer; var Bits: mnTByteArray);
var
  Width, Height, LineWidth: Integer;
  BMPInfo: TBitmapInfo;
begin
  Width := BMP.Width;
  Height := BMP.Height;
  LineWidth := mnAlignInt(Width*3, 4);

  with BMPInfo.bmiHeader do
  begin
    biSize := SizeOf(TBitmapInfoHeader);
    biWidth := Width;
    biHeight := Height;
    biPlanes := 1;
    biBitCount := 24;
    biCompression := BI_RGB;
    biSizeImage := 0;
    biXPelsPerMeter := 0;
    biYPelsPerMeter := 0;
    biClrUsed := 0;
    biClrImportant := 0;
  end;

  SetLength(Bits, LineWidth*NumLines);
  GetDIBits(BMP.Canvas.Handle, BMP.Handle, Height-TopLine-NumLines, NumLines, Bits, BMPInfo, DIB_RGB_COLORS);
end;

procedure mnSetDIBits(BMP: TBitmap; const TopLine, NumLines: Integer; const Bits: mnTByteArray);
var
  Width, Height: Integer;
  BMPInfo: TBitmapInfo;
begin
  Width := BMP.Width;
  Height := BMP.Height;

  with BMPInfo.bmiHeader do
  begin
    biSize := SizeOf(TBitmapInfoHeader);
    biWidth := Width;
    biHeight := Height;
    biPlanes := 1;
    biBitCount := 24;
    biCompression := BI_RGB;
    biSizeImage := 0;
    biXPelsPerMeter := 0;
    biYPelsPerMeter := 0;
    biClrUsed := 0;
    biClrImportant := 0;
  end;

  SetDIBits(BMP.Canvas.Handle, BMP.Handle, Height-TopLine-NumLines, NumLines, Bits, BMPInfo, DIB_RGB_COLORS);
end;

{ mnTPixeledImage }

function mnTPixeledImage.GetBoundsRect: TRect;
begin
  Result := Bounds(0, 0, FWidth, FHeight);
end;

procedure mnTPixeledImage.SetSize(const AWidth, AHeight: Integer);
begin
  FWidth := AWidth;
  FHeight := AHeight;
  SetLength(FPixels, FWidth, FHeight);
end;

procedure mnTPixeledImage.SetSize(const ARect: TRect);
begin
  FWidth := mnRectWidth(ARect);
  FHeight := mnRectHeight(ARect);
  SetLength(FPixels, FWidth, FHeight);
end;

function mnTPixeledImage.GetPixel(const X, Y: Integer): mnTPixel;
begin
  Result := FPixels[X, Y];
end;

procedure mnTPixeledImage.SetPixel(const X, Y: Integer; const Value: mnTPixel);
begin
  FPixels[X, Y] := Value;
end;

procedure mnTPixeledImage.Clear(const BgColor: mnTColor);
var
  i, j: Integer;
begin
  for i := 0 to Width-1 do
    for j := 0 to Height-1 do
      Pixels[i, j] := BgColor;
end;

procedure mnTPixeledImage.DrawDC(DC: HDC; const DCRect: TRect; const X: Integer = 0; const Y: Integer = 0);
var
  i, j: Integer;
  XEnd, YEnd: Integer;
begin
  XEnd := Min(Width, X + mnRectWidth(DCRect));
  YEnd := Min(Height, Y + mnRectHeight(DCRect));

  for i := X to XEnd-1 do
    for j := Y to YEnd-1 do
      Pixels[i, j] := Windows.GetPixel(DC, DCRect.Left+i-X, DCRect.Top+j-Y);
end;

procedure mnTPixeledImage.DrawDC(DC: HDC;                      const X: Integer = 0; const Y: Integer = 0);
var
  i, j: Integer;
  Pixel: COLORREF;
begin
  for i := X to Width-1 do
    for j := Y to Height-1 do
    begin
      Pixel := Windows.GetPixel(DC, i-X, j-Y);
      if Pixel = CLR_INVALID then
      begin
        if j = Y then Exit
        else Continue;
      end
      else
        Pixels[i, j] := Pixel;
    end;
end;

procedure mnTPixeledImage.DrawBMP(BMP: TBitmap; const BMPRect: TRect; const X: Integer = 0; const Y: Integer = 0);
var
  i, j: Integer;
  XEnd, YEnd: Integer;
  Bits: mnTByteArray;
  LineWidth: Integer;
  Offset: Integer;
begin
  XEnd := Min(Width, X + mnRectWidth(BMPRect));
  YEnd := Min(Height, Y + mnRectHeight(BMPRect));

  mnGetDIBits(BMP, BMPRect.Top, YEnd-Y, Bits);
  LineWidth := mnAlignInt(BMP.Width*3, 4);
  for i := X to XEnd-1 do
    for j := Y to YEnd-1 do
    begin
      Offset := (YEnd-j-1) * LineWidth + (BMPRect.Left+i-X) * 3;
      Pixels[i, j] := (Bits[Offset] shl 16) + (Bits[Offset+1] shl 8) + Bits[Offset+2];
    end;
end;

procedure mnTPixeledImage.DrawBMP(BMP: TBitmap;                       const X: Integer = 0; const Y: Integer = 0);
begin
  DrawBMP(BMP, Rect(0, 0, BMP.Width, BMP.Height), X, Y);
end;

procedure mnTPixeledImage.DrawWindow  (const WindowRect: TRect; const Window: HWND = 0; const X: Integer = 0; const Y: Integer = 0);
var
  BMP: TBitmap;
begin
  BMP := TBitmap.Create;
  try
    BMP.Width := mnRectWidth(WindowRect);
    BMP.Height := mnRectHeight(WindowRect);
    mnSnapWindow(BMP.Canvas, WindowRect, Window);
    DrawBMP(BMP, X, Y);
  finally
    BMP.Free;
  end;
end;

procedure mnTPixeledImage.DrawWindowEx(const WindowRect: TRect; const Window: HWND = 0; const X: Integer = 0; const Y: Integer = 0);
var
  BMP: TBitmap;
begin
  BMP := TBitmap.Create;
  try
    BMP.Width := mnRectWidth(WindowRect);
    BMP.Height := mnRectHeight(WindowRect);
    mnSnapWindowEx(BMP.Canvas, WindowRect, Window);
    DrawBMP(BMP, X, Y);
  finally
    BMP.Free;
  end;
end;

procedure mnTPixeledImage.LoadFromBMPFile(const FileName: string);
var
  BMP: TBitmap;
begin
  BMP := TBitmap.Create;
  try
    BMP.LoadFromFile(FileName);
    SetSize(BMP.Width, BMP.Height);
    DrawBMP(BMP);
  finally
    BMP.Free;
  end;
end;

procedure mnTPixeledImage.SaveToBMP(BMP: TBitmap; const Rect: TRect);
var
  i, j: Integer;
  X, Y, XEnd, YEnd: Integer;
  Bits: mnTByteArray;
  LineWidth: Integer;
  Offset: Integer;
begin
  X := Rect.Left;
  Y := Rect.Top;
  XEnd := Min(Width, Rect.Right);
  YEnd := Min(Height, Rect.Bottom);

  BMP.Width := XEnd - X;
  BMP.Height := YEnd - Y;

  LineWidth := mnAlignInt(BMP.Width*3, 4);
  SetLength(Bits, LineWidth*BMP.Height);
  for i := X to XEnd-1 do
    for j := Y to YEnd-1 do
    begin
      Offset := (YEnd-j-1) * LineWidth + (i-X) * 3;
      Bits[Offset] := mnGetColorB(Pixels[i, j]);
      Bits[Offset+1] := mnGetColorG(Pixels[i, j]);
      Bits[Offset+2] := mnGetColorR(Pixels[i, j]);
    end;
  mnSetDIBits(BMP, 0, YEnd-Y, Bits);
end;

procedure mnTPixeledImage.SaveToBMP(BMP: TBitmap);
begin
  SaveToBMP(BMP, BoundsRect);
end;

procedure mnTPixeledImage.SaveToBMPFile(const FileName: string; const Rect: TRect);
var
  BMP: TBitmap;
begin
  BMP := TBitmap.Create;
  try
    SaveToBMP(BMP, Rect);
    BMP.PixelFormat := pf24Bit;
    BMP.SaveToFile(FileName);
  finally
    BMP.Free;
  end;
end;

procedure mnTPixeledImage.SaveToBMPFile(const FileName: string);
begin
  SaveToBMPFile(FileName, BoundsRect);
end;

function mnTPixeledImage.Compare(AnotherImage: mnTPixeledImage; const Rect, AnotherRect: TRect): Boolean;
var
  Width, Height, XA, YA, XB, YB: Integer;
  i, j: Integer;
begin
  Result := mnEqualRectSize(Rect, AnotherRect);
  if not Result then Exit;

  Width := mnRectWidth(Rect);
  Height := mnRectHeight(Rect);
  XA := Rect.Left;
  YA := Rect.Top;
  XB := AnotherRect.Left;
  YB := AnotherRect.Top;
  for j := 0 to Height-1 do
    for i := 0 to Width-1 do
    begin
      Result := Pixels[XA+i, YA+j] = AnotherImage.Pixels[XB+i, YB+j];
      if not Result then Exit;
    end;
  Result := True;
end;

function mnTPixeledImage.Compare(AnotherImage: mnTPixeledImage; const Rect:              TRect): Boolean;
begin
  Result := Compare(AnotherImage, Rect, AnotherImage.BoundsRect);
end;

function mnTPixeledImage.Compare(AnotherImage: mnTPixeledImage                                ): Boolean;
begin
  Result := Compare(AnotherImage, BoundsRect, AnotherImage.BoundsRect);
end;

function mnTPixeledImage.CompareSimilarity(AnotherImage: mnTPixeledImage; const Rect, AnotherRect: TRect): Extended;
var
  Width, Height, XA, YA, XB, YB: Integer;
  i, j: Integer;
  SamePixelCount: Integer;
begin
  if not mnEqualRectSize(Rect, AnotherRect) then
  begin
    Result := 0;
    Exit;
  end;
  if (mnRectWidth(Rect) = 0) and (mnRectHeight(Rect) = 0) then
  begin
    Result := 1;
    Exit;
  end;

  SamePixelCount := 0;
  Width := mnRectWidth(Rect);
  Height := mnRectHeight(Rect);
  XA := Rect.Left;
  YA := Rect.Top;
  XB := AnotherRect.Left;
  YB := AnotherRect.Top;
  for j := 0 to Height-1 do
    for i := 0 to Width-1 do
    begin
      if Pixels[XA+i, YA+j] = AnotherImage.Pixels[XB+i, YB+j] then Inc(SamePixelCount);
    end;
  Result := SamePixelCount / (Width * Height);
end;

function mnTPixeledImage.CompareSimilarity(AnotherImage: mnTPixeledImage; const Rect:              TRect): Extended;
begin
  Result := CompareSimilarity(AnotherImage, Rect, AnotherImage.BoundsRect);
end;

function mnTPixeledImage.CompareSimilarity(AnotherImage: mnTPixeledImage                                ): Extended;
begin
  Result := CompareSimilarity(AnotherImage, BoundsRect, AnotherImage.BoundsRect);
end;

function mnTPixeledImage.CompareWithMask(AnotherImage: mnTPixeledImage; const Rect, AnotherRect: TRect; const MaskColor: mnTColor = clWhite): Boolean;
var
  Width, Height, XA, YA, XB, YB: Integer;
  i, j: Integer;
begin
  Result := mnEqualRectSize(Rect, AnotherRect);
  if not Result then Exit;

  Width := mnRectWidth(Rect);
  Height := mnRectHeight(Rect);
  XA := Rect.Left;
  YA := Rect.Top;
  XB := AnotherRect.Left;
  YB := AnotherRect.Top;
  for j := 0 to Height-1 do
    for i := 0 to Width-1 do
      if AnotherImage.Pixels[XB+i, YB+j] <> MaskColor then
      begin
        Result := Pixels[XA+i, YA+j] = AnotherImage.Pixels[XB+i, YB+j];
        if not Result then Exit;
      end;
  Result := True;
end;

function mnTPixeledImage.CompareWithMask(AnotherImage: mnTPixeledImage; const Rect:              TRect; const MaskColor: mnTColor = clWhite): Boolean;
begin
  Result := CompareWithMask(AnotherImage, Rect, AnotherImage.BoundsRect, MaskColor);
end;

function mnTPixeledImage.CompareWithMask(AnotherImage: mnTPixeledImage;                                 const MaskColor: mnTColor = clWhite): Boolean;
begin
  Result := CompareWithMask(AnotherImage, BoundsRect, AnotherImage.BoundsRect, MaskColor);
end;

function mnTPixeledImage.Find(PartImage: mnTPixeledImage; const Rect, PartRect: TRect; var X, Y: Integer): Boolean;
var
  Width, Height, WidthPart, HeightPart: Integer;
  XA, YA, XB, YB: Integer;
  i, j, m, n: Integer;
label
  Break2;
begin
  Width := mnRectWidth(Rect);
  Height := mnRectHeight(Rect);
  WidthPart := mnRectWidth(PartRect);
  HeightPart := mnRectHeight(PartRect);
  XA := Rect.Left;
  YA := Rect.Top;
  XB := PartRect.Left;
  YB := PartRect.Top;

  for j := 0 to Height-HeightPart do
    for i := 0 to Width-WidthPart do
    begin
      Result := True;
      for n := 0 to HeightPart-1 do
        for m := 0 to WidthPart-1 do
          if Pixels[XA+i+m, YA+j+n] <> PartImage.Pixels[XB+m, YB+n] then
          begin
            Result := False;
            goto Break2;
          end;
      Break2:
      if Result then
      begin
        X := XA+i;
        Y := YA+j;
        Exit;
      end;
    end;
  Result := False;
end;

function mnTPixeledImage.Find(PartImage: mnTPixeledImage; const Rect, PartRect: TRect):                    Boolean;
var
  X, Y: Integer;
begin
  Result := Find(PartImage, Rect, PartRect, X, Y);
end;

function mnTPixeledImage.Find(PartImage: mnTPixeledImage; const Rect:           TRect; var X, Y: Integer): Boolean;
begin
  Result := Find(PartImage, Rect, PartImage.BoundsRect, X, Y);
end;

function mnTPixeledImage.Find(PartImage: mnTPixeledImage; const Rect:           TRect):                    Boolean;
var
  X, Y: Integer;
begin
  Result := Find(PartImage, Rect, PartImage.BoundsRect, X, Y);
end;

function mnTPixeledImage.Find(PartImage: mnTPixeledImage;                              var X, Y: Integer): Boolean;
begin
  Result := Find(PartImage, BoundsRect, PartImage.BoundsRect, X, Y);
end;

function mnTPixeledImage.Find(PartImage: mnTPixeledImage):                                                 Boolean;
var
  X, Y: Integer;
begin
  Result := Find(PartImage, BoundsRect, PartImage.BoundsRect, X, Y);
end;

function mnTPixeledImage.FindWithMask(PartImage: mnTPixeledImage; const Rect, PartRect: TRect; var X, Y: Integer; const MaskColor: mnTColor = clWhite): Boolean;
var
  Width, Height, WidthPart, HeightPart: Integer;
  XA, YA, XB, YB: Integer;
  i, j, m, n: Integer;
label
  Break2;
begin
  Width := mnRectWidth(Rect);
  Height := mnRectHeight(Rect);
  WidthPart := mnRectWidth(PartRect);
  HeightPart := mnRectHeight(PartRect);
  XA := Rect.Left;
  YA := Rect.Top;
  XB := PartRect.Left;
  YB := PartRect.Top;

  for j := 0 to Height-HeightPart do
    for i := 0 to Width-WidthPart do
    begin
      Result := True;
      for n := 0 to HeightPart-1 do
        for m := 0 to WidthPart-1 do
          if PartImage.Pixels[XB+m, YB+n] <> MaskColor then
            if Pixels[XA+i+m, YA+j+n] <> PartImage.Pixels[XB+m, YB+n] then
            begin
              Result := False;
              goto Break2;
            end;
      Break2:
      if Result then
      begin
        X := XA+i;
        Y := YA+j;
        Exit;
      end;
    end;
  Result := False;
end;

function mnTPixeledImage.FindWithMask(PartImage: mnTPixeledImage; const Rect, PartRect: TRect;                    const MaskColor: mnTColor = clWhite): Boolean;
var
  X, Y: Integer;
begin
  Result := FindWithMask(PartImage, Rect, PartRect, X, Y, MaskColor);
end;

function mnTPixeledImage.FindWithMask(PartImage: mnTPixeledImage; const Rect:           TRect; var X, Y: Integer; const MaskColor: mnTColor = clWhite): Boolean;
begin
  Result := FindWithMask(PartImage, Rect, PartImage.BoundsRect, X, Y, MaskColor);
end;

function mnTPixeledImage.FindWithMask(PartImage: mnTPixeledImage; const Rect:           TRect;                    const MaskColor: mnTColor = clWhite): Boolean;
var
  X, Y: Integer;
begin
  Result := FindWithMask(PartImage, Rect, PartImage.BoundsRect, X, Y, MaskColor);
end;

function mnTPixeledImage.FindWithMask(PartImage: mnTPixeledImage;                              var X, Y: Integer; const MaskColor: mnTColor = clWhite): Boolean;
begin
  Result := FindWithMask(PartImage, BoundsRect, PartImage.BoundsRect, X, Y, MaskColor);
end;

function mnTPixeledImage.FindWithMask(PartImage: mnTPixeledImage;                                                 const MaskColor: mnTColor = clWhite): Boolean;
var
  X, Y: Integer;
begin
  Result := FindWithMask(PartImage, BoundsRect, PartImage.BoundsRect, X, Y, MaskColor);
end;

procedure mnTPixeledImage.CopyTo(AnotherImage: mnTPixeledImage);
var
  i, j: Integer;
begin
  AnotherImage.SetSize(Width, Height);
  for i := 0 to Width-1 do
    for j := 0 to Height-1 do
      AnotherImage.Pixels[i, j] := Pixels[i, j];
end;

end.
