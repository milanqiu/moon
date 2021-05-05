unit mnRegister;

interface

procedure Register;

implementation

uses Classes,
  mnDateRange;

procedure Register;
begin
  RegisterComponents('Moon', [mnTDateRange]);
end;

end.
