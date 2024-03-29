unit mnDBTestCase;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit
  being tested.

}

interface

uses
  TestFramework;

type
  TmnDBTestCase = class(TTestCase)
  strict private
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure testDBAppellation;
    procedure testSaveLoadDBProfileWithIni;
    procedure testDBConnSeries;
  end;

implementation

uses mnDB, mnSystem, mnFile;

{ TmnDBTestCase }

procedure TmnDBTestCase.SetUp;
begin
end;

procedure TmnDBTestCase.TearDown;
begin
end;

procedure TmnDBTestCase.testDBAppellation;
var
  DBProfile: mnTDBProfile;
begin
  DBProfile.DBUser := 'U';
  DBProfile.DBPwd  := '*';
  DBProfile.DBType := dbtMySQL;
  DBProfile.DBAddr := 'A';
  DBProfile.DBPort := 'P';
  DBProfile.DBName := 'N';
  CheckEquals(mnDBAppellation(DBProfile), 'N');

  DBProfile.DBType := dbtAccess;
  DBProfile.DBAddr := '';
  DBProfile.DBPort := '';
  DBProfile.DBName := '';
  DBProfile.DBFile := 'C:\E\F.mdb';
  CheckEquals(mnDBAppellation(DBProfile), 'F');
end;

procedure TmnDBTestCase.testSaveLoadDBProfileWithIni;
var
  IniFileName: string;
  DBProfile, DBProfile2: mnTDBProfile;
begin
  IniFileName := mnTProjectConvention.GetTestTempPathSub('DBProfile.ini');

  DBProfile.DBUser := 'U';
  DBProfile.DBPwd  := '*';
  DBProfile.DBType := dbtMySQL;
  DBProfile.DBAddr := 'A';
  DBProfile.DBPort := 'P';
  DBProfile.DBName := 'N';
  mnSaveDBProfileToIni(DBProfile, IniFileName);
  CheckEquals(mnLoadStrFromFile(IniFileName),
    '[DBProfile]' + mnNewLine +
    'DBType=0' + mnNewLine +
    'DBAddr=A' + mnNewLine +
    'DBPort=P' + mnNewLine +
    'DBName=N' + mnNewLine +
    'DBUser=U' + mnNewLine +
    'DBPwd=*' + mnNewLine);

  mnLoadDBProfileFromIni(DBProfile2, IniFileName);
  CheckEquals(DBProfile2.DBUser, 'U');
  CheckEquals(DBProfile2.DBPwd,  '*');
  Check(DBProfile2.DBType = dbtMySQL);
  CheckEquals(DBProfile2.DBAddr, 'A');
  CheckEquals(DBProfile2.DBPort, 'P');
  CheckEquals(DBProfile2.DBName, 'N');

  DBProfile.DBUser := 'U';
  DBProfile.DBPwd  := '*';
  DBProfile.DBType := dbtAccess;
  DBProfile.DBFile := 'C:\E\F.mdb';
  mnSaveDBProfileToIni(DBProfile, IniFileName);
  CheckEquals(mnLoadStrFromFile(IniFileName),
    '[DBProfile]' + mnNewLine +
    'DBType=2' + mnNewLine +
    'DBFile=C:\E\F.mdb' + mnNewLine +
    'DBUser=U' + mnNewLine +
    'DBPwd=*' + mnNewLine);

  mnLoadDBProfileFromIni(DBProfile2, IniFileName);
  CheckEquals(DBProfile2.DBUser, 'U');
  CheckEquals(DBProfile2.DBPwd,  '*');
  Check(DBProfile2.DBType = dbtAccess);
  CheckEquals(DBProfile2.DBFile, 'C:\E\F.mdb');

  mnDeleteFile(IniFileName);
end;

procedure TmnDBTestCase.testDBConnSeries;
var
  DBProfile: mnTDBProfile;
begin
  mnLoadDBProfileFromIni(DBProfile, mnTProjectConvention.GetFilesPathSub('Databases\DBProfile_MySQL.ini'));
  Check(mnTestDBConn(DBProfile));

  mnLoadDBProfileFromIni(DBProfile, mnTProjectConvention.GetFilesPathSub('Databases\DBProfile_SQLServer.ini'));
  Check(mnTestDBConn(DBProfile));

  mnLoadDBProfileFromIni(DBProfile, mnTProjectConvention.GetFilesPathSub('Databases\DBProfile_Access.ini'));
  Check(mnTestDBConn(DBProfile));

  mnLoadDBProfileFromIni(DBProfile, mnTProjectConvention.GetFilesPathSub('Databases\DBProfile_Excel.ini'));
  Check(mnTestDBConn(DBProfile));
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TmnDBTestCase.Suite);
end.