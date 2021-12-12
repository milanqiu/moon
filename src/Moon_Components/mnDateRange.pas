unit mnDateRange;

interface

uses Classes, cxDropDownEdit, cxCalendar;

type
{--------------------------------
  ��ѡ������ڷ�Χ�����ࡣ�ֱ��ǣ�
    �Զ��巶Χ
    ���գ����ܣ����£������ȣ�����
    ���գ����ܣ����£��ϼ��ȣ�����
    ֮ǰ7�գ�֮ǰ1�£�֮ǰ3�£�֮ǰ12��
    �������񣬱������񣬱��������񣬱�������
 --------------------------------}
  mnTDateRangeKind =
    (drkCustom,
     drkToday, drkThisWeek, drkThisMonth, drkThisQuarter, drkThisYear,
     drkYesterday, drkLastWeek, drkLastMonth, drkLastQuarter, drkLastYear,
     drkLatest7Days, drkLatest1Month, drkLatest3Months, drkLatest12Months,
     drkSoFarThisWeek, drkSoFarThisMonth, drkSoFarThisQuarter, drkSoFarThisYear);
  mnTDateRangeKinds = set of mnTDateRangeKind;

{--------------------------------
  ѡ�����ڷ�Χ�������б�ؼ���
  ���ڹ���һ����ʼ���ڵ�cxDateEdit��һ���������ڵ�cxDateEdit��
  �û�ѡ��һ�����ڷ�Χʱ����ʼ���ںͽ������ڻ��Զ�ת��Ϊ�÷�Χ��Ӧ�Ľ����
  �û�Ҳ����ֱ�����ÿ�ʼ���ںͽ������ڣ���ʱ���ڷ�ΧΪ���Զ��塱��
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
    // ��ʼ���ںͽ�������
    property FromDate: TDateTime read GetFromDate write SetFromDate;
    property ToDate: TDateTime read GetToDate write SetToDate;
  private
    FOptionsKinds: mnTDateRangeKinds;
    procedure SetOptionsKinds(const Value: mnTDateRangeKinds);
    function GetSelectedKind: mnTDateRangeKind;
    procedure SetSelectedKind(const Value: mnTDateRangeKind);
  published
    // �����Ƿ���ʾĳЩ���ڷ�Χ��ȱʡΪȫ����ʾ
    property OptionsKinds: mnTDateRangeKinds read FOptionsKinds write SetOptionsKinds
      default
      [drkCustom,
       drkToday, drkThisWeek, drkThisMonth, drkThisQuarter, drkThisYear,
       drkYesterday, drkLastWeek, drkLastMonth, drkLastQuarter, drkLastYear,
       drkLatest7Days, drkLatest1Month, drkLatest3Months, drkLatest12Months,
       drkSoFarThisWeek, drkSoFarThisMonth, drkSoFarThisQuarter, drkSoFarThisYear];
    // ��ǰѡ�������ڷ�Χ
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
