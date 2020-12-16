unit mnGraphicsTestCase;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit
  being tested.

}

interface

uses
  TestFramework, mnGraphics;

type
  TmnGraphicsTestCase = class(TTestCase)
  strict private
    PixeledImage: mnTPixeledImage;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure testGetColorSeries;
    procedure testSetCanvasClipRect;
    procedure testGetDIBits;
    procedure testSetDIBits;

    procedure testPixeledImage_BoundsRect;
    procedure testPixeledImage_SizeSeries;
    procedure testPixeledImage_Pixels;
    procedure testPixeledImage_Clear;
    procedure testPixeledImage_DrawDC;
    procedure testPixeledImage_DrawBMP;
    procedure testPixeledImage_LoadFromBMPFile;
    procedure testPixeledImage_SaveToBMP;
    procedure testPixeledImage_SaveToBMPFile;
    procedure testPixeledImage_Compare;
    procedure testPixeledImage_CompareSimilarity;
    procedure testPixeledImage_Find;
    procedure testPixeledImage_CopyTo;
  end;

implementation

uses mnDebug, Graphics, mnSystem, mnFile, Types, mnDialog, SysUtils, mnMath;

{ TmnGraphicsTestCase }

procedure TmnGraphicsTestCase.SetUp;
begin
  PixeledImage := mnTPixeledImage.Create;
end;

procedure TmnGraphicsTestCase.TearDown;
begin
  PixeledImage.Free;
end;

procedure TmnGraphicsTestCase.testGetColorSeries;
begin
  Check(mnGetColorR($01234567) = $67);
  Check(mnGetColorG($01234567) = $45);
  Check(mnGetColorB($01234567) = $23);

  Check(mnGetColorR(TColor($89ABCDEF)) = $EF);
  Check(mnGetColorG(TColor($89ABCDEF)) = $CD);
  Check(mnGetColorB(TColor($89ABCDEF)) = $AB);
end;

procedure TmnGraphicsTestCase.testSetCanvasClipRect;
var
  BMP: TBitmap;
begin
  BMP := TBitmap.Create;
  try
    BMP.LoadFromFile(mnTProjectConvention.GetFilesPathSub('Images\BMP.bmp'));
    Check(EqualRect(BMP.Canvas.ClipRect, Rect(0, 0, BMP.Width, BMP.Height)));
    Check(BMP.Canvas.Pixels[1, 1] = $FF00FF);

    mnSetCanvasClipRect(BMP.Canvas, Rect(2, 3, 4, 5));
    Check(EqualRect(BMP.Canvas.ClipRect, Rect(2, 3, 4, 5)));
    Check(BMP.Canvas.Pixels[1, 1] = -1);
  finally
    BMP.Free;
  end;
end;

procedure TmnGraphicsTestCase.testGetDIBits;
var
  BMP: TBitmap;
  Bits: mnTByteArray;

  procedure CheckBit(const X, Y: Integer; const R, G, B: Byte);
  var
    Index: Integer;
  begin
    Index := Y * 20 + X;
    Check(Bits[Index*3+0] = B);
    Check(Bits[Index*3+1] = G);
    Check(Bits[Index*3+2] = R);
  end;

begin
  BMP := TBitmap.Create;
  try
    BMP.LoadFromFile(mnTProjectConvention.GetFilesPathSub('Images\BMP.bmp'));

    // line [0, 19], bits down to up
    CheckEquals(Length(Bits), 0);
    mnGetDIBits(BMP, 0, 20, Bits);
    CheckEquals(Length(Bits), 60*20);
    CheckBit( 0,  0, 255, 0, 255);
    CheckBit( 0,  1, 0, 0, 0);
    CheckBit( 0,  2, 132, 132, 132);
    CheckBit( 1,  2, 206, 206, 206);
    CheckBit(18,  2, 206, 206, 206);
    CheckBit(19,  2, 0, 0, 0);
    CheckBit( 0, 17, 132, 132, 132);
    CheckBit(19, 17, 0, 0, 0);
    CheckBit(19, 19, 255, 0, 255);

    // line [3, 9], bits down to up
    mnGetDIBits(BMP, 3, 7, Bits);
    CheckEquals(Length(Bits), 60*7);
    CheckBit( 0,  0, 132, 132, 132);
    CheckBit( 1,  0, 255, 255, 255);
    CheckBit(15,  0, 255, 255, 255);
    CheckBit(16,  0, 90, 90, 90);
    CheckBit(17,  0, 41, 49, 41);
    CheckBit(18,  0, 206, 206, 206);
    CheckBit(19,  0, 0, 0, 0);
    CheckBit( 0,  6, 132, 132, 132);
    CheckBit( 1,  6, 222, 222, 222);
    CheckBit( 2,  6, 156, 156, 165);
    CheckBit(19,  6, 0, 0, 0);
  finally
    BMP.Free;
  end;
end;

procedure TmnGraphicsTestCase.testSetDIBits;
var
  BMP: TBitmap;
  Bits: mnTByteArray;

  procedure CheckBit(const X, Y: Integer; const R, G, B: Byte);
  begin
    Check(mnGetColorR(BMP.Canvas.Pixels[X, Y]) = R);
    Check(mnGetColorG(BMP.Canvas.Pixels[X, Y]) = G);
    Check(mnGetColorB(BMP.Canvas.Pixels[X, Y]) = B);
  end;

begin
  // get bits
  BMP := TBitmap.Create;
  try
    BMP.LoadFromFile(mnTProjectConvention.GetFilesPathSub('Images\BMP.bmp'));
    mnGetDIBits(BMP, 0, 20, Bits);
  finally
    BMP.Free;
  end;

  BMP := TBitmap.Create;
  try
    BMP.Width := 20;
    BMP.Height := 50;

    // set bits [0, 19] to bmp [10, 29]
    mnSetDIBits(BMP, 10, 20, Bits);
    CheckBit( 0, 29, 255, 0, 255);
    CheckBit( 0, 28, 0, 0, 0);
    CheckBit( 0, 27, 132, 132, 132);
    CheckBit( 1, 27, 206, 206, 206);
    CheckBit(18, 27, 206, 206, 206);
    CheckBit(19, 27, 0, 0, 0);
    CheckBit( 0, 12, 132, 132, 132);
    CheckBit(19, 12, 0, 0, 0);
    CheckBit(19, 10, 255, 0, 255);

    CheckBit( 0, 30, 255, 255, 255);
    CheckBit( 1, 30, 255, 255, 255);
    CheckBit(18, 30, 255, 255, 255);
    CheckBit(19, 30, 255, 255, 255);
    CheckBit( 0,  9, 255, 255, 255);
    CheckBit( 1,  9, 255, 255, 255);
    CheckBit(18,  9, 255, 255, 255);
    CheckBit(19,  9, 255, 255, 255);

    // set bits [0, 6] to bmp [40, 46]
    mnSetDIBits(BMP, 40, 7, Bits);
    CheckBit( 0, 46, 255, 0, 255);
    CheckBit( 0, 45, 0, 0, 0);
    CheckBit( 0, 44, 132, 132, 132);
    CheckBit( 1, 44, 206, 206, 206);
    CheckBit(18, 44, 206, 206, 206);
    CheckBit(19, 44, 0, 0, 0);
    CheckBit( 0, 40, 132, 132, 132);
    CheckBit( 1, 40, 255, 255, 255);
    CheckBit(18, 40, 206, 206, 206);
    CheckBit(19, 40, 0, 0, 0);

    CheckBit( 0, 47, 255, 255, 255);
    CheckBit( 1, 47, 255, 255, 255);
    CheckBit(18, 47, 255, 255, 255);
    CheckBit(19, 47, 255, 255, 255);
    CheckBit( 0, 39, 255, 255, 255);
    CheckBit( 1, 39, 255, 255, 255);
    CheckBit(18, 39, 255, 255, 255);
    CheckBit(19, 39, 255, 255, 255);
  finally
    BMP.Free;
  end;
end;

procedure TmnGraphicsTestCase.testPixeledImage_BoundsRect;
begin
  CheckEquals(PixeledImage.BoundsRect.Left, 0);
  CheckEquals(PixeledImage.BoundsRect.Top, 0);
  CheckEquals(PixeledImage.BoundsRect.Right, 0);
  CheckEquals(PixeledImage.BoundsRect.Bottom, 0);

  PixeledImage.SetSize(10, 20);
  CheckEquals(PixeledImage.BoundsRect.Left, 0);
  CheckEquals(PixeledImage.BoundsRect.Top, 0);
  CheckEquals(PixeledImage.BoundsRect.Right, 10);
  CheckEquals(PixeledImage.BoundsRect.Bottom, 20);
end;

procedure TmnGraphicsTestCase.testPixeledImage_SizeSeries;
begin
  CheckEquals(PixeledImage.Width, 0);
  CheckEquals(PixeledImage.Height, 0);
  try
    PixeledImage.Pixels[0, 0];
    mnNeverGoesHere;
  except
  end;

  PixeledImage.SetSize(10, 20);
  CheckEquals(PixeledImage.Width, 10);
  CheckEquals(PixeledImage.Height, 20);
  PixeledImage.Pixels[9, 19];
  try
    PixeledImage.Pixels[10, 20];
    mnNeverGoesHere;
  except
  end;
end;

procedure TmnGraphicsTestCase.testPixeledImage_Pixels;
begin
  PixeledImage.SetSize(10, 20);
  Check(PixeledImage.Pixels[0, 0] = 0);
  Check(PixeledImage.Pixels[9, 19] = 0);

  PixeledImage.Pixels[9, 19] := clBlue;
  Check(PixeledImage.Pixels[9, 19] = clBlue);
end;

procedure TmnGraphicsTestCase.testPixeledImage_Clear;
begin
  PixeledImage.SetSize(10, 20);
  Check(PixeledImage.Pixels[0, 0] = 0);
  Check(PixeledImage.Pixels[9, 19] = 0);

  PixeledImage.Clear(clBlue);
  Check(PixeledImage.Pixels[0, 0] = clBlue);
  Check(PixeledImage.Pixels[9, 19] = clBlue);
end;

procedure TmnGraphicsTestCase.testPixeledImage_DrawDC;
var
  BMP: TBitmap;
begin
  BMP := TBitmap.Create;
  try
    BMP.LoadFromFile(mnTProjectConvention.GetFilesPathSub('Images\BMP.bmp'));
    CheckEquals(BMP.Width, 20);
    CheckEquals(BMP.Height, 20);
    PixeledImage.SetSize(BMP.Width+1, BMP.Height+1);

    // overload form 1
    PixeledImage.Clear(clBlue);
    PixeledImage.DrawDC(BMP.Canvas.Handle, Rect(11, 8, 17, 12));
    Check(PixeledImage.Pixels[0, 0] = $5A5A5A);
    Check(PixeledImage.Pixels[2, 0] = $293129);
    Check(PixeledImage.Pixels[4, 2] = $FFFFFF);
    Check(PixeledImage.Pixels[5, 3] = $293129);
    Check(PixeledImage.Pixels[5, 4] = clBlue);
    Check(PixeledImage.Pixels[6, 3] = clBlue);
    Check(PixeledImage.Pixels[6, 4] = clBlue);

    PixeledImage.Clear(clBlue);
    PixeledImage.DrawDC(BMP.Canvas.Handle, Rect(11, 8, 17, 12), 18, 18);
    Check(PixeledImage.Pixels[0, 0] = clBlue);
    Check(PixeledImage.Pixels[17, 17] = clBlue);
    Check(PixeledImage.Pixels[17, 18] = clBlue);
    Check(PixeledImage.Pixels[18, 17] = clBlue);
    Check(PixeledImage.Pixels[18, 18] = $5A5A5A);
    Check(PixeledImage.Pixels[20, 18] = $293129);
    Check(PixeledImage.Pixels[19, 20] = $5A5A5A);
    Check(PixeledImage.Pixels[20, 20] = $293129);

    // overload form 2
    PixeledImage.Clear(clBlue);
    PixeledImage.DrawDC(BMP.Canvas.Handle);
    Check(PixeledImage.Pixels[0, 0] = $FF00FF);
    Check(PixeledImage.Pixels[0, 2] = $848484);
    Check(PixeledImage.Pixels[19, 18] = $000000);
    Check(PixeledImage.Pixels[19, 19] = $FF00FF);
    Check(PixeledImage.Pixels[0, 20] = clBlue);
    Check(PixeledImage.Pixels[20, 0] = clBlue);
    Check(PixeledImage.Pixels[19, 20] = clBlue);
    Check(PixeledImage.Pixels[20, 19] = clBlue);
    Check(PixeledImage.Pixels[20, 20] = clBlue);

    PixeledImage.Clear(clBlue);
    PixeledImage.DrawDC(BMP.Canvas.Handle, 10, 10);
    Check(PixeledImage.Pixels[0, 0] = clBlue);
    Check(PixeledImage.Pixels[9, 9] = clBlue);
    Check(PixeledImage.Pixels[9, 10] = clBlue);
    Check(PixeledImage.Pixels[10, 9] = clBlue);
    Check(PixeledImage.Pixels[10, 10] = $FF00FF);
    Check(PixeledImage.Pixels[19, 19] = $FFFFFF);
    Check(PixeledImage.Pixels[20, 20] = $FFFFFF);
  finally
    BMP.Free;
  end;
end;

procedure TmnGraphicsTestCase.testPixeledImage_DrawBMP;
var
  BMP: TBitmap;
begin
  BMP := TBitmap.Create;
  try
    BMP.LoadFromFile(mnTProjectConvention.GetFilesPathSub('Images\BMP.bmp'));
    CheckEquals(BMP.Width, 20);
    CheckEquals(BMP.Height, 20);
    PixeledImage.SetSize(BMP.Width+1, BMP.Height+1);

    // overload form 1
    PixeledImage.Clear(clBlue);
    PixeledImage.DrawBMP(BMP, Rect(11, 8, 17, 12));
    Check(PixeledImage.Pixels[0, 0] = $5A5A5A);
    Check(PixeledImage.Pixels[2, 0] = $293129);
    Check(PixeledImage.Pixels[4, 2] = $FFFFFF);
    Check(PixeledImage.Pixels[5, 3] = $293129);
    Check(PixeledImage.Pixels[5, 4] = clBlue);
    Check(PixeledImage.Pixels[6, 3] = clBlue);
    Check(PixeledImage.Pixels[6, 4] = clBlue);

    PixeledImage.Clear(clBlue);
    PixeledImage.DrawBMP(BMP, Rect(11, 8, 17, 12), 18, 18);
    Check(PixeledImage.Pixels[0, 0] = clBlue);
    Check(PixeledImage.Pixels[17, 17] = clBlue);
    Check(PixeledImage.Pixels[17, 18] = clBlue);
    Check(PixeledImage.Pixels[18, 17] = clBlue);
    Check(PixeledImage.Pixels[18, 18] = $5A5A5A);
    Check(PixeledImage.Pixels[20, 18] = $293129);
    Check(PixeledImage.Pixels[19, 20] = $5A5A5A);
    Check(PixeledImage.Pixels[20, 20] = $293129);

    // overload form 2
    PixeledImage.Clear(clBlue);
    PixeledImage.DrawBMP(BMP);
    Check(PixeledImage.Pixels[0, 0] = $FF00FF);
    Check(PixeledImage.Pixels[0, 2] = $848484);
    Check(PixeledImage.Pixels[19, 18] = $000000);
    Check(PixeledImage.Pixels[19, 19] = $FF00FF);
    Check(PixeledImage.Pixels[0, 20] = clBlue);
    Check(PixeledImage.Pixels[20, 0] = clBlue);
    Check(PixeledImage.Pixels[19, 20] = clBlue);
    Check(PixeledImage.Pixels[20, 19] = clBlue);
    Check(PixeledImage.Pixels[20, 20] = clBlue);

    PixeledImage.Clear(clBlue);
    PixeledImage.DrawBMP(BMP, 10, 10);
    Check(PixeledImage.Pixels[0, 0] = clBlue);
    Check(PixeledImage.Pixels[9, 9] = clBlue);
    Check(PixeledImage.Pixels[9, 10] = clBlue);
    Check(PixeledImage.Pixels[10, 9] = clBlue);
    Check(PixeledImage.Pixels[10, 10] = $FF00FF);
    Check(PixeledImage.Pixels[19, 19] = $FFFFFF);
    Check(PixeledImage.Pixels[20, 20] = $FFFFFF);
  finally
    BMP.Free;
  end;
end;

procedure TmnGraphicsTestCase.testPixeledImage_LoadFromBMPFile;
begin
  PixeledImage.Clear(clBlue);
  PixeledImage.LoadFromBMPFile(mnTProjectConvention.GetFilesPathSub('Images\BMP.bmp'));
  CheckEquals(PixeledImage.Width, 20);
  CheckEquals(PixeledImage.Height, 20);
  Check(PixeledImage.Pixels[0, 0] = $FF00FF);
  Check(PixeledImage.Pixels[0, 2] = $848484);
  Check(PixeledImage.Pixels[19, 18] = $000000);
  Check(PixeledImage.Pixels[19, 19] = $FF00FF);
end;

procedure TmnGraphicsTestCase.testPixeledImage_SaveToBMP;
var
  BMPSrc, BMPDst: TBitmap;
  i, j: Integer;
begin
  BMPSrc := TBitmap.Create;
  BMPDst := TBitmap.Create;
  try
    BMPSrc.LoadFromFile(mnTProjectConvention.GetFilesPathSub('Images\BMP.bmp'));
    PixeledImage.SetSize(BMPSrc.Width, BMPSrc.Height);
    PixeledImage.DrawBMP(BMPSrc);

    // overload form 1
    PixeledImage.SaveToBMP(BMPDst, Rect(2, 3, 4, 6));
    CheckEquals(BMPDst.Width, 4-2);
    CheckEquals(BMPDst.Height, 6-3);
    for i := 0 to BMPDst.Width-1 do
      for j := 0 to BMPDst.Height-1 do
        Check(BMPDst.Canvas.Pixels[i, j] = BMPSrc.Canvas.Pixels[2+i, 3+j]);

    // overload form 2
    PixeledImage.SaveToBMP(BMPDst);
    CheckEquals(BMPDst.Width, BMPSrc.Width);
    CheckEquals(BMPDst.Height, BMPSrc.Height);
    for i := 0 to BMPDst.Width-1 do
      for j := 0 to BMPDst.Height-1 do
        Check(BMPDst.Canvas.Pixels[i, j] = BMPSrc.Canvas.Pixels[i, j]);
  finally
    BMPSrc.Free;
    BMPDst.Free;
  end;
end;

procedure TmnGraphicsTestCase.testPixeledImage_SaveToBMPFile;
var
  BMPSrc, BMPDst: TBitmap;
  BMPSrcFileName, BMPDstFileName: string;
  i, j: Integer;
begin
  BMPSrc := TBitmap.Create;
  BMPDst := TBitmap.Create;
  BMPSrcFileName := mnTProjectConvention.GetFilesPathSub('Images\BMP.bmp');
  BMPDstFileName := mnTProjectConvention.GetTestTempPathSub('BMPDst.bmp');
  try
    BMPSrc.LoadFromFile(BMPSrcFileName);
    PixeledImage.SetSize(BMPSrc.Width, BMPSrc.Height);
    PixeledImage.DrawBMP(BMPSrc);

    // overload form 1
    PixeledImage.SaveToBMPFile(BMPDstFileName, Rect(2, 3, 4, 6));
    BMPDst.LoadFromFile(BMPDstFileName);
    CheckEquals(BMPDst.Width, 4-2);
    CheckEquals(BMPDst.Height, 6-3);
    for i := 0 to BMPDst.Width-1 do
      for j := 0 to BMPDst.Height-1 do
        Check(BMPDst.Canvas.Pixels[i, j] = BMPSrc.Canvas.Pixels[2+i, 3+j]);

    // overload form 2
    PixeledImage.SaveToBMPFile(BMPDstFileName);
    BMPDst.LoadFromFile(BMPDstFileName);
    CheckEquals(BMPDst.Width, BMPSrc.Width);
    CheckEquals(BMPDst.Height, BMPSrc.Height);
    for i := 0 to BMPDst.Width-1 do
      for j := 0 to BMPDst.Height-1 do
        Check(BMPDst.Canvas.Pixels[i, j] = BMPSrc.Canvas.Pixels[i, j]);
    Check(mnIsSameFile(BMPSrcFileName, BMPDstFileName));

    mnDeleteFile(BMPDstFileName);
  finally
    BMPSrc.Free;
    BMPDst.Free;
  end;
end;

procedure TmnGraphicsTestCase.testPixeledImage_Compare;
var
  PI, PICopy, PIRegion: mnTPixeledImage;
begin
  PI := mnTPixeledImage.Create;
  PICopy := mnTPixeledImage.Create;
  PIRegion := mnTPixeledImage.Create;
  try
    PI.LoadFromBMPFile(mnTProjectConvention.GetFilesPathSub('Images\BMP.bmp'));
    PICopy.LoadFromBMPFile(mnTProjectConvention.GetFilesPathSub('Images\BMPCopy.bmp'));
    PIRegion.LoadFromBMPFile(mnTProjectConvention.GetFilesPathSub('Images\BMPRegion.bmp'));

    // overload form 1
    CheckFalse(PI.Compare(PICopy, Rect(0, 0, 9, 9), Rect(0, 0, 7, 7)));
    CheckFalse(PI.Compare(PICopy, Rect(0, 0, 7, 7), Rect(0, 0, 9, 9)));
    Check(PI.Compare(PICopy, Rect(0, 0, 20, 20), Rect(0, 0, 20, 20)));
    Check(PI.Compare(PIRegion, Rect(3, 9, 4, 12), Rect(1, 1, 2, 4)));

    // overload form 2
    CheckFalse(PI.Compare(PICopy, Rect(0, 0, 9, 9)));
    Check(PI.Compare(PICopy, Rect(0, 0, 20, 20)));
    Check(PI.Compare(PIRegion, Rect(2, 8, 11, 15)));

    // overload form 3
    Check(PI.Compare(PICopy));
    CheckFalse(PI.Compare(PIRegion));
  finally
    PI.Free;
    PICopy.Free;
    PIRegion.Free;
  end;
end;

procedure TmnGraphicsTestCase.testPixeledImage_CompareSimilarity;
var
  PI, PICopy, PIRegion, PIWithDifference, PIRegionWithDifference: mnTPixeledImage;
begin
  PI := mnTPixeledImage.Create;
  PICopy := mnTPixeledImage.Create;
  PIRegion := mnTPixeledImage.Create;
  PIWithDifference := mnTPixeledImage.Create;
  PIRegionWithDifference := mnTPixeledImage.Create;
  try
    PI.LoadFromBMPFile(mnTProjectConvention.GetFilesPathSub('Images\BMP.bmp'));
    PICopy.LoadFromBMPFile(mnTProjectConvention.GetFilesPathSub('Images\BMPCopy.bmp'));
    PIRegion.LoadFromBMPFile(mnTProjectConvention.GetFilesPathSub('Images\BMPRegion.bmp'));
    PIWithDifference.LoadFromBMPFile(mnTProjectConvention.GetFilesPathSub('Images\BMPWithDifference.bmp'));
    PIRegionWithDifference.LoadFromBMPFile(mnTProjectConvention.GetFilesPathSub('Images\BMPRegionWithDifference.bmp'));

    // overload form 1
    CheckEquals(PI.CompareSimilarity(PICopy, Rect(0, 0, 9, 9), Rect(0, 0, 7, 7)), 0);
    CheckEquals(PI.CompareSimilarity(PICopy, Rect(0, 0, 7, 7), Rect(0, 0, 9, 9)), 0);
    CheckEquals(PI.CompareSimilarity(PICopy, Rect(0, 0, 20, 20), Rect(0, 0, 20, 20)), 1);
    CheckEquals(PI.CompareSimilarity(PIRegion, Rect(3, 9, 4, 12), Rect(1, 1, 2, 4)), 1);
    CheckEquals(PI.CompareSimilarity(PIWithDifference, Rect(0, 0, 20, 20), Rect(0, 0, 20, 20)), (20*20-3)/(20*20), mnParticle);
    CheckEquals(PI.CompareSimilarity(PIRegionWithDifference, Rect(2, 8, 11, 15), Rect(0, 0, 9, 7)), (9*7-3)/(9*7), mnParticle);

    // overload form 2
    CheckEquals(PI.CompareSimilarity(PICopy, Rect(0, 0, 9, 9)), 0);
    CheckEquals(PI.CompareSimilarity(PICopy, Rect(0, 0, 20, 20)), 1);
    CheckEquals(PI.CompareSimilarity(PIRegion, Rect(2, 8, 11, 15)), 1);
    CheckEquals(PI.CompareSimilarity(PIWithDifference, Rect(0, 0, 20, 20)), (20*20-3)/(20*20), mnParticle);
    CheckEquals(PI.CompareSimilarity(PIRegionWithDifference, Rect(2, 8, 11, 15)), (9*7-3)/(9*7), mnParticle);

    // overload form 3
    CheckEquals(PI.CompareSimilarity(PICopy), 1);
    CheckEquals(PI.CompareSimilarity(PIRegion), 0);
    CheckEquals(PI.CompareSimilarity(PIWithDifference), (20*20-3)/(20*20), mnParticle);
    CheckEquals(PIRegion.CompareSimilarity(PIRegionWithDifference), (9*7-3)/(9*7), mnParticle);
  finally
    PI.Free;
    PICopy.Free;
    PIRegion.Free;
    PIWithDifference.Free;
    PIRegionWithDifference.Free;
  end;
end;

procedure TmnGraphicsTestCase.testPixeledImage_Find;
var
  PI, PICopy, PIRegion: mnTPixeledImage;
  X, Y: Integer;
begin
  PI := mnTPixeledImage.Create;
  PICopy := mnTPixeledImage.Create;
  PIRegion := mnTPixeledImage.Create;
  try
    PI.LoadFromBMPFile(mnTProjectConvention.GetFilesPathSub('Images\BMP.bmp'));
    PICopy.LoadFromBMPFile(mnTProjectConvention.GetFilesPathSub('Images\BMPCopy.bmp'));
    PIRegion.LoadFromBMPFile(mnTProjectConvention.GetFilesPathSub('Images\BMPRegion.bmp'));

    // overload form 1 and 2
    Check(PI.Find(PIRegion, Rect(4, 10, 10, 14), Rect(2, 2, 8, 6), X, Y));
    CheckEquals(X, 4);
    CheckEquals(Y, 10);
    Check(PI.Find(PIRegion, Rect(4, 10, 10, 14), Rect(2, 2, 8, 6)));

    Check(PI.Find(PIRegion, Rect(3, 9, 10, 14), Rect(2, 2, 8, 6), X, Y));
    CheckEquals(X, 4);
    CheckEquals(Y, 10);
    Check(PI.Find(PIRegion, Rect(3, 9, 10, 14), Rect(2, 2, 8, 6)));

    CheckFalse(PI.Find(PIRegion, Rect(5, 11, 10, 14), Rect(2, 2, 8, 6), X, Y));
    CheckFalse(PI.Find(PIRegion, Rect(5, 11, 10, 14), Rect(2, 2, 8, 6)));

    CheckFalse(PI.Find(PIRegion, Rect(4, 10, 9, 13), Rect(2, 2, 8, 6), X, Y));
    CheckFalse(PI.Find(PIRegion, Rect(4, 10, 9, 13), Rect(2, 2, 8, 6)));

    // overload form 3 and 4
    Check(PI.Find(PIRegion, Rect(2, 8, 11, 15), X, Y));
    CheckEquals(X, 2);
    CheckEquals(Y, 8);
    Check(PI.Find(PIRegion, Rect(2, 8, 11, 15)));

    Check(PI.Find(PIRegion, Rect(1, 7, 11, 15), X, Y));
    CheckEquals(X, 2);
    CheckEquals(Y, 8);
    Check(PI.Find(PIRegion, Rect(1, 7, 11, 15)));

    CheckFalse(PI.Find(PIRegion, Rect(3, 9, 11, 15), X, Y));
    CheckFalse(PI.Find(PIRegion, Rect(3, 9, 11, 15)));

    CheckFalse(PI.Find(PIRegion, Rect(2, 8, 10, 14), X, Y));
    CheckFalse(PI.Find(PIRegion, Rect(2, 8, 10, 14)));

    // overload form 5 and 6
    Check(PI.Find(PICopy, X, Y));
    CheckEquals(X, 0);
    CheckEquals(Y, 0);
    Check(PI.Find(PICopy));

    Check(PI.Find(PIRegion, X, Y));
    CheckEquals(X, 2);
    CheckEquals(Y, 8);
    Check(PI.Find(PIRegion));

    CheckFalse(PIRegion.Find(PI, X, Y));
    CheckFalse(PIRegion.Find(PI));
  finally
    PI.Free;
    PICopy.Free;
    PIRegion.Free;
  end;
end;

procedure TmnGraphicsTestCase.testPixeledImage_CopyTo;
var
  PI, PICopy: mnTPixeledImage;
begin
  PI := mnTPixeledImage.Create;
  PICopy := mnTPixeledImage.Create;
  try
    PI.LoadFromBMPFile(mnTProjectConvention.GetFilesPathSub('Images\BMP.bmp'));
    PI.CopyTo(PICopy);
    Check(PI.Compare(PICopy));
  finally
    PI.Free;
    PICopy.Free;
  end;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TmnGraphicsTestCase.Suite);
end.