unit mnRegister;

interface

procedure Register;

implementation

uses Classes,
  mnDateRange, mnFileChooser, mnWaitDialog, mnWebBrowser;

procedure Register;
begin
  RegisterComponents('Moon', [mnTDateRange]);
  RegisterComponents('Moon', [mnTFileChooser]);
  RegisterComponents('Moon', [mnTWaitDialog]);
  RegisterComponents('Moon', [mnTWebBrowser]);
end;

end.
