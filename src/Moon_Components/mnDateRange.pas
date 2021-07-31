unit mnDateRange;

interface

uses Classes, cxDropDownEdit, cxCalendar;

type
{--------------------------------
  供选择的日期范围的种类。分别是：
    自定义范围
    本日，本周，本月，本季度，本年
    上日，上周，上月，上季度，上年
    之前7日，之前1月，之前3月，之前12月
    本周至今，本月至今，本季度至今，本年至今
 --------------------------------}
  mnTDateRangeKind =
    (drkCustom,
     drkToday, drkThisWeek, drkThisMonth, drkThisQuarter, drkThisYear,
     drkYesterday, drkLastWeek, drkLastMonth, drkLastQuarter, drkLastYear,
     drkLatest7Days, drkLatest1Month, drkLatest3Months, drkLatest12Months,
     drkSoFarThisWeek, drkSoFarThisMonth, drkSoFarThisQuarter, drkSoFarThisYear);
  mnTDateRangeKinds = set of mnTDateRangeKind;

{--------------------------------
  选择日期范围的下拉列表控件。
  用于关联一个开始日期的cxDateEdit，一个结束日期的cxDateEdit。
  用户选择一种日期范围时，开始日期和结束日期会自动转换为该范围对应的结果。
  用户也可以直接设置开始日期和结束日期，此时日期范围为“自定义”。
  Tested in TestApp.
 --------------------------------}
  mnTDateRange = class(TcxComboBox)
  private
    FFromDateEdit: TcxDateEdit;
    FToDateEdit: TcxDateEdit;
    procedure SetFromDateEdit(const Value: TcxDateEdit);
    procedure SetToDateEdit(const Value: TcxDateEdit);
  published
    property FromDateEdit: TcxDateEdit read FFromDateEdit write SetFromDateEdit;
    property ToDateEdit: TcxDateEdit read FToDateEdit write SetToDateEdit;
  private
    function GetFromDate: TDateTime;
    procedure SetFromDate(const Value: TDateTime);
    function GetToDate: TDateTime;
    procedure SetToDate(const Value: TDateTime);
  public
    // 开始日期和结束日期
    property FromDate: TDateTime read GetFromDate write SetFromDate;
    property ToDate: TDateTime read GetToDate write SetToDate;
  private
    FOptionsKinds: mnTDateRangeKinds;
    procedure SetOptionsKinds(const Value: mnTDateRangeKinds);
    function GetSelectedKind: mnTDateRangeKind;
    procedure SetSelectedKind(const Value: mnTDateRangeKind);
  published
    // 控制是否显示某些日期范围。缺省为全部显示
    property OptionsKinds: mnTDateRangeKinds read FOptionsKinds write SetOptionsKinds
      default
      [drkCustom,
       drkToday, drkThisWeek, drkThisMonth, drkThisQuarter, drkThisYear,
       drkYesterday, drkLastWeek, drkLastMonth, drkLastQuarter, drkLastYear,
       drkLatest7Days, drkLatest1Month, drkLatest3Months, drkLatest12Months,
       drkSoFarThisWeek, drkSoFarThisMonth, drkSoFarThisQuarter, drkSoFarThisYear];
    // 当前选定的日期范围
    property SelectedKind: mnTDateRangeKind read GetSelectedKind write SetSelectedKind default drkCustom;
  private
    KindIsChanging: Boolean;
    procedure WhenDateEditsPropertiesChange(Sender: TObject);
    procedure WhenChange(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses mnSystem, mnResStrsC, mnTPL, SysUtils, DateUtils, mnDateTime, mnArray;

{$R ..\..\files\Icons\Components\mnDateRange.dcr}

{ mnTDateRange }

procedure mnTDateRange.SetFromDateEdit(const Value: TcxDateEdit);
begin
  if Assigned(FFromDateEdit) then
  begin
    FFromDateEdit.Properties.OnChange := nil;
    FFromDateEdit.Enabled := True;
  end;
  FFromDateEdit := Value;
  FFromDateEdit.Properties.OnChange := WhenDateEditsPropertiesChange;
  FFromDateEdit.Enabled := drkCustom in FOptionsKinds;
end;

procedure mnTDateRange.SetToDateEdit(const Value: TcxDateEdit);
begin
  if Assigned(FToDateEdit) then
  begin
    FToDateEdit.Properties.OnChange := nil;
    FToDateEdit.Enabled := True;
  end;
  FToDateEdit := Value;
  FToDateEdit.Properties.OnChange := WhenDateEditsPropertiesChange;
  FToDateEdit.Enabled := drkCustom in FOptionsKinds;
end;

function mnTDateRange.GetFromDate: TDateTime;
begin
  Result := FromDateEdit.Date;
end;

procedure mnTDateRange.SetFromDate(const Value: TDateTime);
begin
  mnCreateErrorIf(not Assigned(FromDateEdit), SFromDateEditNotAssigned);
  FromDateEdit.Date := Value;
end;

function mnTDateRange.GetToDate: TDateTime;
begin
  Result := ToDateEdit.Date;
end;

procedure mnTDateRange.SetToDate(const Value: TDateTime);
begin
  mnCreateErrorIf(not Assigned(ToDateEdit), SToDateEditNotAssigned);
  ToDateEdit.Date := Value;
end;

procedure mnTDateRange.SetOptionsKinds(const Value: mnTDateRangeKinds);
begin
  FOptionsKinds := Value;
  Properties.Items.Clear;
  if drkCustom           in FOptionsKinds then Properties.Items.Add(SCustom);
  if drkToday            in FOptionsKinds then Properties.Items.Add(SToday);
  if drkThisWeek         in FOptionsKinds then Properties.Items.Add(SThisWeek);
  if drkThisMonth        in FOptionsKinds then Properties.Items.Add(SThisMonth);
  if drkThisQuarter      in FOptionsKinds then Properties.Items.Add(SThisQuarter);
  if drkThisYear         in FOptionsKinds then Properties.Items.Add(SThisYear);
  if drkYesterday        in FOptionsKinds then Properties.Items.Add(SYesterday);
  if drkLastWeek         in FOptionsKinds then Properties.Items.Add(SLastWeek);
  if drkLastMonth        in FOptionsKinds then Properties.Items.Add(SLastMonth);
  if drkLastQuarter      in FOptionsKinds then Properties.Items.Add(SLastQuarter);
  if drkLastYear         in FOptionsKinds then Properties.Items.Add(SLastYear);
  if drkLatest7Days      in FOptionsKinds then Properties.Items.Add(SLatest7Days);
  if drkLatest1Month     in FOptionsKinds then Properties.Items.Add(SLatest1Month);
  if drkLatest3Months    in FOptionsKinds then Properties.Items.Add(SLatest3Months);
  if drkLatest12Months   in FOptionsKinds then Properties.Items.Add(SLatest12Months);
  if drkSoFarThisWeek    in FOptionsKinds then Properties.Items.Add(SSoFarThisWeek);
  if drkSoFarThisMonth   in FOptionsKinds then Properties.Items.Add(SSoFarThisMonth);
  if drkSoFarThisQuarter in FOptionsKinds then Properties.Items.Add(SSoFarThisQuarter);
  if drkSoFarThisYear    in FOptionsKinds then Properties.Items.Add(SSoFarThisYear);

  ItemIndex := mnChooseInt(FOptionsKinds=[], -1, 0);
  if Assigned(FFromDateEdit) then FFromDateEdit.Enabled := drkCustom in FOptionsKinds;
  if Assigned(FToDateEdit) then FToDateEdit.Enabled := drkCustom in FOptionsKinds;
end;

function mnTDateRange.GetSelectedKind: mnTDateRangeKind;
begin
  if ItemIndex = -1 then
    Result := drkCustom
  else
    Result := mnTDateRangeKind(mnIndexOfStrs(Properties.Items[ItemIndex], SDateRangeTexts));
end;

procedure mnTDateRange.SetSelectedKind(const Value: mnTDateRangeKind);
begin
  ItemIndex := Properties.Items.IndexOf(SDateRangeTexts[Integer(Value)]);
end;

procedure mnTDateRange.WhenDateEditsPropertiesChange(Sender: TObject);
begin
  if not KindIsChanging then SelectedKind := drkCustom;
end;

procedure mnTDateRange.WhenChange(Sender: TObject);
var
  AFromDate, AToDate: TDateTime;
begin
  case SelectedKind of
    drkToday:
    begin
      AFromDate := Today;
      AToDate := Today;
    end;
    drkThisWeek:
    begin
      AFromDate := StartOfTheWeek(Today);
      AToDate := Trunc(EndOfTheWeek(Today));
    end;
    drkThisMonth:
    begin
      AFromDate := StartOfTheMonth(Today);
      AToDate := Trunc(EndOfTheMonth(Today));
    end;
    drkThisQuarter:
    begin
      AFromDate := mnStartOfTheQuarter(Today);
      AToDate := Trunc(mnEndOfTheQuarter(Today));
    end;
    drkThisYear:
    begin
      AFromDate := StartOfTheYear(Today);
      AToDate := Trunc(EndOfTheYear(Today));
    end;
    drkYesterday:
    begin
      AFromDate := Yesterday;
      AToDate := Yesterday;
    end;
    drkLastWeek:
    begin
      AFromDate := mnStartOfLastWeek(Today);
      AToDate := Trunc(mnEndOfLastWeek(Today));
    end;
    drkLastMonth:
    begin
      AFromDate := mnStartOfLastMonth(Today);
      AToDate := Trunc(mnEndOfLastMonth(Today));
    end;
    drkLastQuarter:
    begin
      AFromDate := mnStartOfLastQuarter(Today);
      AToDate := Trunc(mnEndOfLastQuarter(Today));
    end;
    drkLastYear:
    begin
      AFromDate := mnStartOfLastYear(Today);
      AToDate := Trunc(mnEndOfLastYear(Today));
    end;
    drkLatest7Days:
    begin
      AFromDate := Today - 6;
      AToDate := Today;
    end;
    drkLatest1Month:
    begin
      AFromDate := IncMonth(Today, -1) + 1;
      AToDate := Today;
    end;
    drkLatest3Months:
    begin
      AFromDate := IncMonth(Today, -3) + 1;
      AToDate := Today;
    end;
    drkLatest12Months:
    begin
      AFromDate := IncMonth(Today, -12) + 1;
      AToDate := Today;
    end;
    drkSoFarThisWeek:
    begin
      AFromDate := StartOfTheWeek(Today);
      AToDate := Today;
    end;
    drkSoFarThisMonth:
    begin
      AFromDate := StartOfTheMonth(Today);
      AToDate := Today;
    end;
    drkSoFarThisQuarter:
    begin
      AFromDate := mnStartOfTheQuarter(Today);
      AToDate := Today;
    end;
    drkSoFarThisYear:
    begin
      AFromDate := StartOfTheYear(Today);
      AToDate := Today;
    end;
    else
    begin
      if ItemIndex = -1 then
      begin
        KindIsChanging := True;
        FromDateEdit.Clear;
        ToDateEdit.Clear;
        KindIsChanging := False;
      end;
      Exit;
    end;
  end;

  try
    KindIsChanging := True;
    FromDate := AFromDate;
    ToDate := AToDate;
  finally
    KindIsChanging := False;
  end;
end;

constructor mnTDateRange.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Properties.DropDownListStyle := lsFixedList;
  Properties.DropDownRows := 12;
  Properties.OnChange := WhenChange;

  OptionsKinds :=
    [drkCustom,
     drkToday, drkThisWeek, drkThisMonth, drkThisQuarter, drkThisYear,
     drkYesterday, drkLastWeek, drkLastMonth, drkLastQuarter, drkLastYear,
     drkLatest7Days, drkLatest1Month, drkLatest3Months, drkLatest12Months,
     drkSoFarThisWeek, drkSoFarThisMonth, drkSoFarThisQuarter, drkSoFarThisYear];
  SelectedKind := drkCustom;

  KindIsChanging := False;
end;

end.
