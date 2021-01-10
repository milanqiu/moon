unit mnGraphics;

interface

uses Types, Classes, mnSystem, Windows, Graphics;

{--------------------------------
  ��һ����ɫ�õ���R��G��B���֡�
  Tested in TestUnit.
 --------------------------------}
function mnGetColorR(const Color: TColor): Byte; inline;
function mnGetColorG(const Color: TColor): Byte; inline;
function mnGetColorB(const Color: TColor): Byte; inline;

{--------------------------------
  ����Canvas��ClipRect��
  ��׼VCL�У�TCanvas��ClipRect����Ϊֻ����
  ע�⣺�ù�����ʱ�����أ�VCL������޸���ClipRect���п������û��������ͻ��
  Tested in TestUnit.
 --------------------------------}
procedure mnSetCanvasClipRect(Canvas: TCanvas; const Rect: TRect);

{--------------------------------
  �ڵ�(X, Y)��ʹ��Canvas����һ���㡣
  Tested in TestApp.
 --------------------------------}
procedure mnDrawPoint(Canvas: TCanvas; const X, Y: Integer); inline;
{--------------------------------
  �ӵ�(X1, Y)������(X2, Y)��ʹ��Canvas����һ��ˮƽֱ�ߡ������˵㶼��������
  Tested in TestApp.
 --------------------------------}
procedure mnDrawHLine(Canvas: TCanvas; const X1, X2, Y: Integer);
{--------------------------------
  �ӵ�(X, Y1)������(X, Y2)��ʹ��Canvas����һ����ֱֱ�ߡ������˵㶼��������
  Tested in TestApp.
 --------------------------------}
procedure mnDrawVLine(Canvas: TCanvas; const X, Y1, Y2: Integer);

{--------------------------------
  �ڵ�(X, Y)��ʹ��Canvas�����ı��������в�ͬ��ˮƽ�ʹ�ֱ���뷽ʽ�������ı���ʵ��λ�á�
  Tested in TestApp.
 --------------------------------}
procedure mnDrawText(Canvas: TCanvas; const X, Y: Integer; const Text: string;
  const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop);
{--------------------------------
  �ڵ�(X, Y)��ʹ��Canvas����ͼ�񡣿����в�ͬ��ˮƽ�ʹ�ֱ���뷽ʽ������ͼ���ʵ��λ�á�
  Tested in TestApp.
 --------------------------------}
procedure mnDrawGraphic(Canvas: TCanvas; const X, Y: Integer; Graphic: TGraphic;
  const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop);

type
{--------------------------------
  ͼ���б��ڲ�������һϵ�е�ͼ�񣬿ɸ��ݵ���ָ�����һЩ�߼����ơ�
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
    // ��黭���Ƿ���ָ��
    procedure CheckDrawingCanvas;
  public
    // ������ʹ�õĻ���
    property DrawingCanvas: TCanvas read FDrawingCanvas write FDrawingCanvas;
  public
    // �ڵ�(X, Y)�����Ƶ�Index��ͼ�񡣿����в�ͬ��ˮƽ�ʹ�ֱ���뷽ʽ������ͼ���ʵ��λ��
    procedure Draw(const Index: Integer; const X, Y: Integer;
      const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop);

    // �ڵ�(X, Y)�����λ���ָ�������ŵĶ���ͼ��ÿ��ͼ��ļ��ΪSpacing
    // �����в�ͬ��ˮƽ�ʹ�ֱ���뷽ʽ������������ʵ��λ��
    procedure DrawBatch(const Indexes: array of Integer; const X, Y, Spacing: Integer;
      const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop); overload;
    procedure DrawBatch(const Indexes: mnTIntList; const X, Y, Spacing: Integer;
      const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop); overload;

    // Ԥ���ڲ����ɵ�ͼ��ϵ��Ϊ0-9�����֣��ú������ڵ�(X, Y)������һ��������������ÿ�����ֵļ��ΪSpacing
    // �����в�ͬ��ˮƽ�ʹ�ֱ���뷽ʽ������������ʵ��λ��
    procedure DrawInteger(const Value: Integer; const X, Y, Spacing: Integer;
      const HAlign: TAlignment = taLeftJustify; const VAlign: TVerticalAlignment = taAlignTop);
  end;

{--------------------------------
  ��һ��λͼ��õ��豸�޹صĵ����ݡ�
  ���ڲ�ʵ�����ǵ���Windows API��GetDIBits�������˸������õķ�װ��
  BMP����Ҫ�õ����ݵ�λͼ��TopLine����Ҫ�õ����ݵĶ��У�NumLines����Ҫ�õ����ݵ�������
  �õ���������24λRGB�ġ�
  �õ������ݽ�����Bits������ڲ����Bits����ռ䣬��СΪLineWidth * NumLines��
  LineWidth�Ƕ�BMP�Ŀ�ȳ�3��ÿ�������������ֽڱ�ʾ���󣬲��뵽4�ı�����
  Bits�ĸ�ʽ�Ƕ�BMP���������������أ����µ��ϴ����ң�ÿ�������������ֽڴ洢���ֱ���B��G��R��
  Tested in TestUnit.
 --------------------------------}
procedure mnGetDIBits(BMP: TBitmap; const TopLine, NumLines: Integer; var Bits: mnTByteArray);

{--------------------------------
  ���豸�޹صĵ��������õ�λͼ�
  ���ڲ�ʵ�����ǵ���Windows API��SetDIBits�������˸������õķ�װ��
  BMP����Ҫ�������ݵ�λͼ��TopLine����Ҫ�������ݵĶ��У�NumLines����Ҫ�������ݵ�������
  ���õ�������24λRGB�ġ�
  ���õ����ݴ���Bits���СΪLineWidth * NumLines��
  LineWidth�Ƕ�BMP�Ŀ�ȳ�3��ÿ�������������ֽڱ�ʾ���󣬲��뵽4�ı�����
  Bits�ĸ�ʽ�Ƕ�BMP���������������أ����µ��ϴ����ң�ÿ�������������ֽڴ洢���ֱ���B��G��R��
  Tested in TestUnit.
 --------------------------------}
procedure mnSetDIBits(BMP: TBitmap; const TopLine, NumLines: Integer; const Bits: mnTByteArray);

type
{--------------------------------
  ��ɫ�����ء�
 --------------------------------}
  mnTColor = TColor;
  mnTPixel = mnTColor;

{--------------------------------
  ����ͼ��
  �Զ�ά������ʽ�洢ͼƬ��ÿ�����أ����ڶ�ͼƬ��������Ͳ�����
  Tested in TestUnit and TestApp.
 --------------------------------}
  mnTPixeledImage = class
  // ͼ�Ŀ�ȣ��߶ȣ��߽���Σ�������ͼƬ��С
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
  // ��λ�ö�дͼ�����ء�X��Y��0��ʼ�����Խ�磬���׳��쳣
  protected
    FPixels: array of array of mnTPixel;
    function GetPixel(const X, Y: Integer): mnTPixel;
    procedure SetPixel(const X, Y: Integer; const Value: mnTPixel);
  public
    property Pixels[const X, Y: Integer]: mnTPixel read GetPixel write SetPixel;
  public
    // ʹ��ָ������ɫ�������ͼƬ
    procedure Clear(const BgColor: mnTColor = clWhite);
  public
    // ��ͼƬ��(X, Y)��������DC��DCRect���򣬻����ȫ��DC����������ͼƬ����߽�
    procedure DrawDC(DC: HDC; const DCRect: TRect; const X: Integer = 0; const Y: Integer = 0); overload;
    procedure DrawDC(DC: HDC;                      const X: Integer = 0; const Y: Integer = 0); overload;
    // ��ͼƬ��(X, Y)��������BMP��BMPRect���򣬻��������BMP����������ͼƬ����߽�
    procedure DrawBMP(BMP: TBitmap; const BMPRect: TRect; const X: Integer = 0; const Y: Integer = 0); overload;
    procedure DrawBMP(BMP: TBitmap;                       const X: Integer = 0; const Y: Integer = 0); overload;
    // ��ͼƬ��(X, Y)��������ָ�����ڵ�WindowRect���򣬵�������ͼƬ����߽�
    // ��û��ָ�����ڣ��������ĻWindowRect�����ͼ��
    // ������һ��λ��ǰ�ˣ����ڵ�������Ļ��Կɣ���������С����Ҳ���ܱ�hide
    // ������������ʵ�ַ�����ͬ����ʵ�����й����У���һ���ܳɹ���ȡ���ڲ���ϵͳ�汾��Ӧ�ó���Ľ�����Ʒ�ʽ����ȡ���ڵ��������ȵ�
    // ͨ���أ������Ҫ���Ƶ���Ӧ�ó��������ڣ��ʺ���DrawWindowEx��������ӿؼ����ڣ��ʺ���DrawWindow
    procedure DrawWindow  (const WindowRect: TRect; const Window: HWND = 0; const X: Integer = 0; const Y: Integer = 0);
    procedure DrawWindowEx(const WindowRect: TRect; const Window: HWND = 0; const X: Integer = 0; const Y: Integer = 0);
  public
    // ��һ��BMP�ļ���װ��ͼƬ��ͼƬ��С������ΪͬBMP��С���
    procedure LoadFromBMPFile(const FileName: string);
    // ��ͼƬ��Rect���򣬻�����ͼƬ������BMP�У�BMP��С������ΪͬRect�����С��ȣ���ͬ����ͼƬ��С���
    procedure SaveToBMP(BMP: TBitmap; const Rect: TRect); overload;
    procedure SaveToBMP(BMP: TBitmap); overload;
    // ��ͼƬ��Rect���򣬻�����ͼƬ������BMP�ļ��У��ļ��е�BMP��С������ΪͬRect�����С��ȣ���ͬ����ͼƬ��С���
    procedure SaveToBMPFile(const FileName: string; const Rect: TRect); overload;
    procedure SaveToBMPFile(const FileName: string); overload;
  public
    // �ж�ͼƬ��ָ�������Ƿ����һ��ͼƬ��ָ��������ȫ��ͬ������С��ÿ�����أ�����ɫ������ͬ
    // �����������Ŀ�߶���0���򷵻���ͬ
    // ������������ʽ������ͼƬû��ָ�����������Ƚ���������ͼƬ
    function Compare(AnotherImage: mnTPixeledImage; const Rect, AnotherRect: TRect): Boolean; overload;
    function Compare(AnotherImage: mnTPixeledImage; const Rect:              TRect): Boolean; overload;
    function Compare(AnotherImage: mnTPixeledImage                                ): Boolean; overload;
    // �ж�ͼƬ��ָ�����򣬺���һ��ͼƬ��ָ����������ƶȣ���СΪ0�����Ϊ1
    // �����������Ŀ�߶���0�������ƶ�Ϊ1
    // �����������Ĵ�С��һ���������ƶ�Ϊ0
    // �����Сһ���������ƶȵ��ڣ���ɫ����ͬ�����������������������������
    // ������������ʽ������ͼƬû��ָ�����������Ƚ���������ͼƬ
    function CompareSimilarity(AnotherImage: mnTPixeledImage; const Rect, AnotherRect: TRect): Extended; overload;
    function CompareSimilarity(AnotherImage: mnTPixeledImage; const Rect:              TRect): Extended; overload;
    function CompareSimilarity(AnotherImage: mnTPixeledImage                                ): Extended; overload;
    // ��Compare���ƣ���֧�����룬��������һ��ͼƬ����ɫΪMaskColor�����أ�������Ƚ�
    function CompareWithMask(AnotherImage: mnTPixeledImage; const Rect, AnotherRect: TRect; const MaskColor: mnTColor = clWhite): Boolean; overload;
    function CompareWithMask(AnotherImage: mnTPixeledImage; const Rect:              TRect; const MaskColor: mnTColor = clWhite): Boolean; overload;
    function CompareWithMask(AnotherImage: mnTPixeledImage;                                 const MaskColor: mnTColor = clWhite): Boolean; overload;
  public
    // ��ͼƬ��ָ�������ڣ�Ѱ����һ��ͼƬ��ָ�������ͼ�񣬷����Ƿ��ҵ�
    // ����ҵ���X��Y������λ�á�������Ҫλ��ʱ��Ҳ��ʹ��û��X��Y��������ʽ��ע��λ�ô�ͼƬ���Ͻ����𣬶������������Ͻ�����
    // ��������ڴ��ڶ����ȫƥ����������򷵻���λ�õ�Y��С���Ǹ���Y��ͬʱ������X��С���Ǹ�
    // �����Ѱ�ҵ������߶���0���򷵻��ҵ���X��Y������0
    // ������������ʽ������ͼƬû��ָ�����������Ѱ����������ͼƬ
    function Find(PartImage: mnTPixeledImage; const Rect, PartRect: TRect; var X, Y: Integer): Boolean; overload;
    function Find(PartImage: mnTPixeledImage; const Rect, PartRect: TRect):                    Boolean; overload;
    function Find(PartImage: mnTPixeledImage; const Rect:           TRect; var X, Y: Integer): Boolean; overload;
    function Find(PartImage: mnTPixeledImage; const Rect:           TRect):                    Boolean; overload;
    function Find(PartImage: mnTPixeledImage;                              var X, Y: Integer): Boolean; overload;
    function Find(PartImage: mnTPixeledImage):                                                 Boolean; overload;
    // ��Find���ƣ���֧�����룬��������һ��ͼƬ����ɫΪMaskColor�����أ�������Ƚ�
    function FindWithMask(PartImage: mnTPixeledImage; const Rect, PartRect: TRect; var X, Y: Integer; const MaskColor: mnTColor = clWhite): Boolean; overload;
    function FindWithMask(PartImage: mnTPixeledImage; const Rect, PartRect: TRect;                    const MaskColor: mnTColor = clWhite): Boolean; overload;
    function FindWithMask(PartImage: mnTPixeledImage; const Rect:           TRect; var X, Y: Integer; const MaskColor: mnTColor = clWhite): Boolean; overload;
    function FindWithMask(PartImage: mnTPixeledImage; const Rect:           TRect;                    const MaskColor: mnTColor = clWhite): Boolean; overload;
    function FindWithMask(PartImage: mnTPixeledImage;                              var X, Y: Integer; const MaskColor: mnTColor = clWhite): Boolean; overload;
    function FindWithMask(PartImage: mnTPixeledImage;                                                 const MaskColor: mnTColor = clWhite): Boolean; overload;
  public
    // ������ͼƬ���Ƶ���һ��ͼƬ����һ��ͼƬ�Ĵ�С������Ϊͬ����ͼƬ���
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
