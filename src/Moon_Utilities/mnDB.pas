unit mnDB;

interface

uses IniFiles, Classes, DB, OleDB, mnSystem;

type
{--------------------------------
  数据库类型。目前支持MySQL、SQL Server、Access和Excel四种。
  其中Access仅支持Access 2002-2003及之前版本，Excel仅支持Excel 97-2003及之前版本，且Excel的功能有限。
 --------------------------------}
  mnTDBType = (dbtMySQL, dbtSQLServer, dbtAccess, dbtExcel);

{--------------------------------
  数据库的配置。包含了数据库类型、用户名和密码。
  MySQL和SQL Server数据库还包含了地址、端口和和库名，
  Access和Excel数据库还包含了文件名。
 --------------------------------}
  mnTDBProfile = record
    DBUser: ShortString;
    DBPwd: ShortString;
    case DBType: mnTDBType of
      dbtMySQL, dbtSQLServer:
      (
        DBAddr: ShortString;
        DBPort: ShortString;
        DBName: ShortString;
      );
      dbtAccess, dbtExcel:
      (
        DBFile: ShortString;
      );
  end;

{--------------------------------
  根据数据库配置，返回数据库的名称。对于MySQL和SQL Server数据库是库名，对于Access和Excel数据库是文件名。
  Tested in TestUnit.
 --------------------------------}
function mnDBAppellation(const DBProfile: mnTDBProfile): string;

{--------------------------------
  将数据库配置保存入Ini文件，或从Ini文件载入。
  Tested in TestUnit.
 --------------------------------}
procedure mnSaveDBProfileToIni(const DBProfile: mnTDBProfile; IniFile: TIniFile); overload;
procedure mnSaveDBProfileToIni(const DBProfile: mnTDBProfile; const IniFileName: string); overload;
procedure mnLoadDBProfileFromIni(var DBProfile: mnTDBProfile; IniFile: TIniFile); overload;
procedure mnLoadDBProfileFromIni(var DBProfile: mnTDBProfile; const IniFileName: string); overload;

{--------------------------------
  根据数据库配置，返回数据库的连接字符串。
  Tested in TestUnit.
 --------------------------------}
function mnDBConnStr(const DBProfile: mnTDBProfile): string;
function mnMySQLConnStr(const DBAddr, DBPort, DBName, DBUser, DBPwd: string): string;
function mnSQLServerConnStr(const DBAddr, DBPort, DBName, DBUser, DBPwd: string): string;
function mnAccessConnStr(const DBFile, DBUser, DBPwd: string): string;
function mnExcelConnStr(const DBFile, DBUser, DBPwd: string): string;

{--------------------------------
  测试一个数据库配置或一个连接字符串是否能成功连接。
  Tested in TestUnit.
 --------------------------------}
function mnTestDBConn(const DBProfile: mnTDBProfile): Boolean; overload;
function mnTestDBConn(const DBConnStr: string): Boolean; overload;

{--------------------------------
  将VCL中的TFieldType转换为字符串。
  No test.
 --------------------------------}
function mnFieldTypeToStr(const FieldType: TFieldType): string;
{--------------------------------
  将MFC中的字段类型DBTYPEENUM转换为字符串。
  No test.
 --------------------------------}
function mnMFCFieldTypeToStr(const MFCFieldType: DBTYPEENUM): string;
{--------------------------------
  将MFC中的字段类型DBTYPEENUM转换为Delphi变量类型。
  No test.
 --------------------------------}
function mnMFCFieldTypeToDelphiType(const MFCFieldType: DBTYPEENUM): mnTDelphiType;
{--------------------------------
  判断一个MFC中的字段类型DBTYPEENUM是否是整数类型。
  No test.
 --------------------------------}
function mnMFCFieldTypeIsInt(const MFCFieldType: DBTYPEENUM): Boolean;

implementation

uses SysUtils, ADODB, mnFile;

function mnDBAppellation(const DBProfile: mnTDBProfile): string;
begin
  case DBProfile.DBType of
    dbtMySQL, dbtSQLServer:
      Result := DBProfile.DBName;
    dbtAccess, dbtExcel:
      Result := mnExtractFileNameNoExt(DBProfile.DBFile);
  end;
end;

procedure mnSaveDBProfileToIni(const DBProfile: mnTDBProfile; IniFile: TIniFile); overload;
begin
  IniFile.EraseSection('DBProfile');
  IniFile.WriteInteger('DBProfile', 'DBType', Integer(DBProfile.DBType));
  case DBProfile.DBType of
    dbtMySQL, dbtSQLServer:
    begin
      IniFile.WriteString('DBProfile', 'DBAddr', DBProfile.DBAddr);
      IniFile.WriteString('DBProfile', 'DBPort', DBProfile.DBPort);
      IniFile.WriteString('DBProfile', 'DBName', DBProfile.DBName);
    end;
    dbtAccess, dbtExcel:
    begin
      IniFile.WriteString('DBProfile', 'DBFile', DBProfile.DBFile);
    end;
  end;
  IniFile.WriteString('DBProfile', 'DBUser', DBProfile.DBUser);
  IniFile.WriteString('DBProfile', 'DBPwd', DBProfile.DBPwd);
end;

procedure mnSaveDBProfileToIni(const DBProfile: mnTDBProfile; const IniFileName: string); overload;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(IniFileName);
  try
    mnSaveDBProfileToIni(DBProfile, IniFile);
  finally
    IniFile.Free;
  end;
end;

procedure mnLoadDBProfileFromIni(var DBProfile: mnTDBProfile; IniFile: TIniFile); overload;
begin
  DBProfile.DBType := mnTDBType(IniFile.ReadInteger('DBProfile', 'DBType', 0));
  case DBProfile.DBType of
    dbtMySQL, dbtSQLServer:
    begin
      DBProfile.DBAddr := IniFile.ReadString('DBProfile', 'DBAddr', '');
      DBProfile.DBPort := IniFile.ReadString('DBProfile', 'DBPort', '');
      DBProfile.DBName := IniFile.ReadString('DBProfile', 'DBName', '');
    end;
    dbtAccess, dbtExcel:
    begin
      DBProfile.DBFile := IniFile.ReadString('DBProfile', 'DBFile', '');
    end;
  end;
  DBProfile.DBUser := IniFile.ReadString('DBProfile', 'DBUser', '');
  DBProfile.DBPwd := IniFile.ReadString('DBProfile', 'DBPwd', '');
end;

procedure mnLoadDBProfileFromIni(var DBProfile: mnTDBProfile; const IniFileName: string); overload;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(IniFileName);
  try
    mnLoadDBProfileFromIni(DBProfile, IniFile);
  finally
    IniFile.Free;
  end;
end;

function mnDBConnStr(const DBProfile: mnTDBProfile): string;
begin
  case DBProfile.DBType of
    dbtMySQL:
      Result := mnMySQLConnStr(DBProfile.DBAddr, DBProfile.DBPort, DBProfile.DBName, DBProfile.DBUser, DBProfile.DBPwd);
    dbtSQLServer:
      Result := mnSQLServerConnStr(DBProfile.DBAddr, DBProfile.DBPort, DBProfile.DBName, DBProfile.DBUser, DBProfile.DBPwd);
    dbtAccess:
      Result := mnAccessConnStr(DBProfile.DBFile, DBProfile.DBUser, DBProfile.DBPwd);
    dbtExcel:
      Result := mnExcelConnStr(DBProfile.DBFile, DBProfile.DBUser, DBProfile.DBPwd);
  end;
end;

function mnMySQLConnStr(const DBAddr, DBPort, DBName, DBUser, DBPwd: string): string;
begin
  Result := Format('Driver={MySQL ODBC 5.1 Driver};'
                 + 'Server=%s;'
                 + 'Port=%s;'
                 + 'Database=%s;'
                 + 'User=%s;'
                 + 'Password=%s;'
                 + 'Option=3;',
                 [DBAddr,
                  DBPort,
                  DBName,
                  DBUser,
                  DBPwd]);
end;

function mnSQLServerConnStr(const DBAddr, DBPort, DBName, DBUser, DBPwd: string): string;
begin
  Result := Format('Provider=SQLOLEDB.1;'
                 + 'Workstation ID=%s;'
                 + 'Data Source=%s,%s;'
                 + 'Initial Catalog=%s;'
                 + 'User ID=%s;'
                 + 'Password=%s;'
                 + 'Persist Security Info=True;'
                 + 'Use Procedure for Prepare=1;'
                 + 'Auto Translate=True;'
                 + 'Packet Size=4096;'
                 + 'Use Encryption for Data=False;'
                 + 'Connect Timeout=15;'
                 + 'Tag with column collation when possible=False',
                 [DBAddr,
                  DBAddr,
                  DBPort,
                  DBName,
                  DBUser,
                  DBPwd]);
end;

function mnAccessConnStr(const DBFile, DBUser, DBPwd: string): string;
begin
  Result := Format('Provider=Microsoft.Jet.OLEDB.4.0;'
                 + 'Data Source=%s;'
                 + 'User ID=%s;'
                 + 'Password=%s;'
                 + 'Persist Security Info=True',
                 [DBFile,
                  DBUser,
                  DBPwd]);
end;

function mnExcelConnStr(const DBFile, DBUser, DBPwd: string): string;
begin
  Result := Format('Provider=Microsoft.Jet.OLEDB.4.0;'
                 + 'Data Source=%s;'
                 + 'User ID=%s;'
                 + 'Password=%s;'
                 + 'Persist Security Info=True;'
                 + 'Extended Properties=Excel 8.0',
                 [DBFile,
                  DBUser,
                  DBPwd]);
end;

function mnTestDBConn(const DBProfile: mnTDBProfile): Boolean; overload;
begin
  Result := mnTestDBConn(mnDBConnStr(DBProfile));
end;

function mnTestDBConn(const DBConnStr: string): Boolean; overload;
var
  ADOConn: TADOConnection;
begin
  ADOConn := TADOConnection.Create(nil);
  try
    ADOConn.ConnectionString := DBConnStr;
    ADOConn.LoginPrompt := False;
    try
      ADOConn.Open;
      ADOConn.Close;
      Result := True;
    except
      Result := False;
    end;
  finally
    ADOConn.Free;
  end;
end;

function mnFieldTypeToStr(const FieldType: TFieldType): string;
begin
  case FieldType of
    ftUnknown:     Result := 'Unknown';
    ftString:      Result := 'String';
    ftSmallint:    Result := 'Smallint';
    ftInteger:     Result := 'Integer';
    ftWord:        Result := 'Word';
    ftBoolean:     Result := 'Boolean';
    ftFloat:       Result := 'Float';
    ftCurrency:    Result := 'Currency';
    ftBCD:         Result := 'BCD';
    ftDate:        Result := 'Date';
    ftTime:        Result := 'Time';
    ftDateTime:    Result := 'DateTime';
    ftBytes:       Result := 'Bytes';
    ftVarBytes:    Result := 'VarBytes';
    ftAutoInc:     Result := 'AutoInc';
    ftBlob:        Result := 'Blob';
    ftMemo:        Result := 'Memo';
    ftGraphic:     Result := 'Graphic';
    ftFmtMemo:     Result := 'FmtMemo';
    ftParadoxOle:  Result := 'ParadoxOle';
    ftDBaseOle:    Result := 'DBaseOle';
    ftTypedBinary: Result := 'TypedBinary';
    ftCursor:      Result := 'Cursor';
    ftFixedChar:   Result := 'FixedChar';
    ftWideString:  Result := 'WideString';
    ftLargeint:    Result := 'Largeint';
    ftADT:         Result := 'ADT';
    ftArray:       Result := 'Array';
    ftReference:   Result := 'Reference';
    ftDataSet:     Result := 'DataSet';
    ftOraBlob:     Result := 'OraBlob';
    ftOraClob:     Result := 'OraClob';
    ftVariant:     Result := 'Variant';
    ftInterface:   Result := 'Interface';
    ftIDispatch:   Result := 'IDispatch';
    ftGuid:        Result := 'Guid';
    ftTimeStamp:   Result := 'TimeStamp';
    ftFMTBcd:      Result := 'FMTBcd';
  end;
end;

function mnMFCFieldTypeToStr(const MFCFieldType: DBTYPEENUM): string;
begin
  case MFCFieldType of
    DBTYPE_EMPTY:       Result := '___';
    DBTYPE_NULL:        Result := '___';
    DBTYPE_I2:          Result := 'int16';
    DBTYPE_I4:          Result := 'int32';
    DBTYPE_R4:          Result := 'single';
    DBTYPE_R8:          Result := 'double';
    DBTYPE_CY:          Result := 'currency';
    DBTYPE_DATE:        Result := 'datetime';
    DBTYPE_BSTR:        Result := '___';
    DBTYPE_IDISPATCH:   Result := '___';
    DBTYPE_ERROR:       Result := '___';
    DBTYPE_BOOL:        Result := 'boolean';
    DBTYPE_VARIANT:     Result := '___';
    DBTYPE_IUNKNOWN:    Result := '___';
    DBTYPE_DECIMAL:     Result := '___';
    DBTYPE_UI1:         Result := 'uint8';
    DBTYPE_ARRAY:       Result := '___';
    DBTYPE_BYREF:       Result := '___';
    DBTYPE_I1:          Result := 'int8';
    DBTYPE_UI2:         Result := 'uint16';
    DBTYPE_UI4:         Result := 'uint32';
    DBTYPE_I8:          Result := 'int64';
    DBTYPE_UI8:         Result := 'uint64';
    DBTYPE_GUID:        Result := '___';
    DBTYPE_VECTOR:      Result := '___';
    DBTYPE_RESERVED:    Result := '___';
    DBTYPE_BYTES:       Result := 'binary';
    DBTYPE_STR:         Result := 'string';
    DBTYPE_WSTR:        Result := 'widestring';
    DBTYPE_NUMERIC:     Result := 'decimal';
    DBTYPE_UDT:         Result := '___';
    DBTYPE_DBDATE:      Result := '___';
    DBTYPE_DBTIME:      Result := '___';
    DBTYPE_DBTIMESTAMP: Result := 'datetime';
    DBTYPE_HCHAPTER:    Result := '___';
    DBTYPE_FILETIME:    Result := '___';
    DBTYPE_DBFILETIME:  Result := '___';
    DBTYPE_PROPVARIANT: Result := '___';
    DBTYPE_VARNUMERIC:  Result := '___';
  end;
end;

function mnMFCFieldTypeToDelphiType(const MFCFieldType: DBTYPEENUM): mnTDelphiType;
begin
  case MFCFieldType of
    DBTYPE_EMPTY:       Result := dtOthers;
    DBTYPE_NULL:        Result := dtOthers;
    DBTYPE_I2:          Result := dtSmallint;
    DBTYPE_I4:          Result := dtInteger;
    DBTYPE_R4:          Result := dtSingle;
    DBTYPE_R8:          Result := dtDouble;
    DBTYPE_CY:          Result := dtCurrency;
    DBTYPE_DATE:        Result := dtDateTime;
    DBTYPE_BSTR:        Result := dtOthers;
    DBTYPE_IDISPATCH:   Result := dtOthers;
    DBTYPE_ERROR:       Result := dtOthers;
    DBTYPE_BOOL:        Result := dtBoolean;
    DBTYPE_VARIANT:     Result := dtOthers;
    DBTYPE_IUNKNOWN:    Result := dtOthers;
    DBTYPE_DECIMAL:     Result := dtOthers;
    DBTYPE_UI1:         Result := dtByte;
    DBTYPE_ARRAY:       Result := dtOthers;
    DBTYPE_BYREF:       Result := dtOthers;
    DBTYPE_I1:          Result := dtShortint;
    DBTYPE_UI2:         Result := dtWord;
    DBTYPE_UI4:         Result := dtLongword;
    DBTYPE_I8:          Result := dtInt64;
    DBTYPE_UI8:         Result := dtInt64;
    DBTYPE_GUID:        Result := dtOthers;
    DBTYPE_VECTOR:      Result := dtOthers;
    DBTYPE_RESERVED:    Result := dtOthers;
    DBTYPE_BYTES:       Result := dtString;
    DBTYPE_STR:         Result := dtString;
    DBTYPE_WSTR:        Result := dtString;
    DBTYPE_NUMERIC:     Result := dtDouble;
    DBTYPE_UDT:         Result := dtOthers;
    DBTYPE_DBDATE:      Result := dtOthers;
    DBTYPE_DBTIME:      Result := dtOthers;
    DBTYPE_DBTIMESTAMP: Result := dtDateTime;
    DBTYPE_HCHAPTER:    Result := dtOthers;
    DBTYPE_FILETIME:    Result := dtOthers;
    DBTYPE_DBFILETIME:  Result := dtOthers;
    DBTYPE_PROPVARIANT: Result := dtOthers;
    DBTYPE_VARNUMERIC:  Result := dtOthers;
  else
    Result := dtOthers;
  end;
end;

function mnMFCFieldTypeIsInt(const MFCFieldType: DBTYPEENUM): Boolean;
begin
  Result := (MFCFieldType = DBTYPE_I1) or (MFCFieldType = DBTYPE_I2) or (MFCFieldType = DBTYPE_I4) or (MFCFieldType = DBTYPE_I8) or
            (MFCFieldType = DBTYPE_UI1) or (MFCFieldType = DBTYPE_UI2) or (MFCFieldType = DBTYPE_UI4) or (MFCFieldType = DBTYPE_UI8);
end;

end.
