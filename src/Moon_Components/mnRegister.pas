unit mnRegister;

interface

procedure Register;

implementation

uses Classes,
  mnDateRange, mnFileChooser, mnWaitDialog;

procedure Register;
begin
  RegisterComponents('Moon', [mnTDateRange]);
  RegisterComponents('Moon', [mnTFileChooser]);
  RegisterComponents('Moon', [mnTWaitDialog]);
end;

end.
