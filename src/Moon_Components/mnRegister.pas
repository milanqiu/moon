unit mnRegister;

interface

procedure Register;

implementation

uses Classes,
  mnDateRange, mnFileChooser;

procedure Register;
begin
  RegisterComponents('Moon', [mnTDateRange]);
  RegisterComponents('Moon', [mnTFileChooser]);
end;

end.
