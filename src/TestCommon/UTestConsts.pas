unit UTestConsts;

interface

uses Math;

const
  // variants
  Var_0 = 'str0';
  Var_1 = MaxInt;
  Var_2 = MinExtended;
  Var_3 = 30192.3680555556; // 1982-08-29 08:50
  Var_4 = True;

  // strings
  Str_0: string = 'str0';
  Str_1: string = 'str1';
  Str_2: string = 'str2';
  Str_3: string = 'str23';
  Str_4: string = 'str234';

  // integers
  Int_0: Integer = MaxInt;
  Int_1: Integer = -2147483648;
  Int_2: Integer = 0;
  Int_3: Integer = 1;
  Int_4: Integer = -1;

  // floats
  Float_0: Extended = 10000000000000000000.000000001;
  Float_1: Extended = -10000000000000000000.000000001;
  Float_2: Extended = 0.0;
  Float_3: Extended = 123.45;
  Float_4: Extended = -67.89;

  // datetimes
  DT_0: TDateTime = 30192.3680555556; // 1982-08-29 08:50
  DT_1: TDateTime = 39668.8388888889; // 2008-08-08 20:08
  DT_2: TDateTime = 30192;            // 1982-08-29
  DT_3: TDateTime = 39668;            // 2008-08-08
  DT_4: TDateTime = 53529.6191435185; // 2046-07-21 14:51:34

  // currencies
  Curr_0: Currency = 123.45;
  Curr_1: Currency = 678.9;
  Curr_2: Currency = 12345.6789;
  Curr_3: Currency = 12345.678;
  Curr_4: Currency = 12345.67;

  // booleans
  Bool_0: Boolean = True;
  Bool_1: Boolean = False;
  Bool_2: Boolean = True;
  Bool_3: Boolean = False;
  Bool_4: Boolean = True;

var
  // strings of variants
  Str_Of_Var_0: String;
  Str_Of_Var_1: String;
  Str_Of_Var_2: String;
  Str_Of_Var_3: String;
  Str_Of_Var_4: String;

  // strings of integers
  Str_Of_Int_0: String;
  Str_Of_Int_1: String;
  Str_Of_Int_2: String;
  Str_Of_Int_3: String;
  Str_Of_Int_4: String;

  // strings of floats
  Str_Of_Float_0: String;
  Str_Of_Float_1: String;
  Str_Of_Float_2: String;
  Str_Of_Float_3: String;
  Str_Of_Float_4: String;

  // strings of datetimes
  Str_Of_DT_0: String;
  Str_Of_DT_1: String;
  Str_Of_DT_2: String;
  Str_Of_DT_3: String;
  Str_Of_DT_4: String;

  // strings of currencies
  Str_Of_Curr_0: String;
  Str_Of_Curr_1: String;
  Str_Of_Curr_2: String;
  Str_Of_Curr_3: String;
  Str_Of_Curr_4: String;

  // strings of booleans
  Str_Of_Bool_0: String;
  Str_Of_Bool_1: String;
  Str_Of_Bool_2: String;
  Str_Of_Bool_3: String;
  Str_Of_Bool_4: String;

const
  // strings name-value
  Str_NameValue_0: string = '3=str0';
  Str_NameValue_1: string = '0=str1';
  Str_NameValue_2: string = '2=str2';
  Str_NameValue_3: string = '4=str23';
  Str_NameValue_4: string = '2=str234';

const
  // different encoding texts: Œ“√«a
  Text_Ansi = #$CE#$D2#$C3#$C7#$61;
  Text_UnicodeLE = #$11#$62#$EC#$4E#$61#$00;
  Text_UnicodeBE = #$62#$11#$4E#$EC#$00#$61;
  Text_UTF8 = #$E6#$88#$91#$E4#$BB#$AC#$61;
  Text_UnicodeLE_WithBOM = #$FF#$FE + #$11#$62#$EC#$4E#$61#$00;
  Text_UnicodeBE_WithBOM = #$FE#$FF + #$62#$11#$4E#$EC#$00#$61;
  Text_UTF8_WithBOM = #$EF#$BB#$BF + #$E6#$88#$91#$E4#$BB#$AC#$61;

const
  Host = 'http://test.q2asia.com/gwangmyeongseong-web/';
  Url_Get = Host + 'GetServlet';
  Url_Post = Host + 'PostServlet';
  Url_Fake = Host + 'Fake.html';
  Params_Get = '?Param1=a1&Param2=%E5%95%8A';
  Params_Post = 'Param1=a1'#13#10'Param2='#$E5#$95#$8A;
  Page_Get = 'Method: get<br>Param1: a1<br>Param2: '#$E5#$95#$8A;
  Page_Post = 'Method: post<br>Param1: a1<br>Param2: '#$E5#$95#$8A;
  Page_Not_Found = 'HTTP/1.1 404 Not Found';

implementation

uses SysUtils, Variants, mnSystem;

initialization

  Str_Of_Var_0 := VarToStr(Var_0);
  Str_Of_Var_1 := VarToStr(Var_1);
  Str_Of_Var_2 := VarToStr(Var_2);
  Str_Of_Var_3 := VarToStr(Var_3);
  Str_Of_Var_4 := VarToStr(Var_4);

  Str_Of_Int_0 := IntToStr(Int_0);
  Str_Of_Int_1 := IntToStr(Int_1);
  Str_Of_Int_2 := IntToStr(Int_2);
  Str_Of_Int_3 := IntToStr(Int_3);
  Str_Of_Int_4 := IntToStr(Int_4);

  Str_Of_Float_0 := FloatToStr(Float_0);
  Str_Of_Float_1 := FloatToStr(Float_1);
  Str_Of_Float_2 := FloatToStr(Float_2);
  Str_Of_Float_3 := FloatToStr(Float_3);
  Str_Of_Float_4 := FloatToStr(Float_4);

  Str_Of_DT_0 := DateTimeToStr(DT_0);
  Str_Of_DT_1 := DateTimeToStr(DT_1);
  Str_Of_DT_2 := DateTimeToStr(DT_2);
  Str_Of_DT_3 := DateTimeToStr(DT_3);
  Str_Of_DT_4 := DateTimeToStr(DT_4);

  Str_Of_Curr_0 := CurrToStr(Curr_0);
  Str_Of_Curr_1 := CurrToStr(Curr_1);
  Str_Of_Curr_2 := CurrToStr(Curr_2);
  Str_Of_Curr_3 := CurrToStr(Curr_3);
  Str_Of_Curr_4 := CurrToStr(Curr_4);

  Str_Of_Bool_0 := mnBoolToStr(Bool_0);
  Str_Of_Bool_1 := mnBoolToStr(Bool_1);
  Str_Of_Bool_2 := mnBoolToStr(Bool_2);
  Str_Of_Bool_3 := mnBoolToStr(Bool_3);
  Str_Of_Bool_4 := mnBoolToStr(Bool_4);

end.
