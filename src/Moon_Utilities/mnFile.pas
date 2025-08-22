unit mnFile;

interface

{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}

uses Classes, mnString;

{--------------------------------
  ��һ���ļ�����ȥ����չ�������Դ��뵥�����ļ�����Ҳ���԰����ļ�·����
  Tested in TestUnit.
 --------------------------------}
function mnExtractFileNoExt(const FileName: string): string;
{--------------------------------
  ��һ���ļ�������ȡ�������ļ�·������չ���ĵ����ļ�����
  Tested in TestUnit.
 --------------------------------}
function mnExtractPureFileName(const FileName: string): string;

{--------------------------------
  ����һ��·�����ļ��ĸ�·����
  Tested in TestUnit.
 --------------------------------}
function mnExtractParentPath(const PathOrFileName: string): string;

{--------------------------------
  ����һ��·��������֤��·���ԡ�\����β��
  Tested in TestUnit.
 --------------------------------}
function mnCorrectPath(const PathName: string): string;

{--------------------------------
  ����һ��Ŀ¼������֤��Ŀ¼���ԡ�\����β��
  Tested in TestUnit.
 --------------------------------}
function mnCorrectDir(const DirName: string): string;

{--------------------------------
  ��һ���ļ������Ϻ�׺�����Դ��뵥�����ļ�����Ҳ���԰����ļ�·����
  Tested in TestUnit.
 --------------------------------}
function mnAppendFileNameSuffix(const FileName, Suffix: string): string;

{--------------------------------
  ����ָ��·���������·�����ļ���ת��Ϊ����·�����ļ�����
  Tested in TestUnit.
 --------------------------------}
function mnGetAbsoluteFileName(const BasePath, RelativeFileName: string): string;
{--------------------------------
  ����ָ��·����������·�����ļ���ת��Ϊ���·�����ļ�����
  Tested in TestUnit.
 --------------------------------}
function mnGetRelativeFileName(const BasePath, AbsoluteFileName: string): string;

{--------------------------------
  �����ļ�������Ϊ������
  ���ԣ���
 --------------------------------}
procedure mnSetFileAttributeNormal(const FileName: string);

type
{--------------------------------
  ���ڵ���mnGetFileList����ʱ�����������ָ�����÷�ʽ��
    floIncludePath����������·����
    floIncludeExt��������չ����
    floDirectoryOnly��ֻ����Ŀ¼��
    floFileOnly��ֻ�����ļ�����floDirectoryOnly����ͬʱʹ�á�
 --------------------------------}
  mnTFileListOption = (floIncludePath, floIncludeExt, floDirectoryOnly, floFileOnly);
  mnTFileListOptions = set of mnTFileListOption;

{--------------------------------
  ���ݴ���*��?��ͨ������ļ���ģʽ�����������ļ���Ȼ���ļ������浽OutFileList�
  ע�⣺OutFileList֮ǰ�洢���������ɱ��������ᱻ��ա�
  ע�⣺�ò��Ҳ���recursive��ʽ�������������ļ��С�
  Tested in TestUnit.
 --------------------------------}
procedure mnGetFileList(const FileNamePattern: string; OutFileList: TStrings;
  const FileListOptions: mnTFileListOptions = [floIncludePath, floIncludeExt]);

{--------------------------------
  ��ָ��·���У����ݴ���*��?��ͨ������ļ���ģʽ�����������ļ���Ȼ���ļ������浽OutFileList�
  ע�⣺OutFileList֮ǰ�洢���������ɱ��������ᱻ��ա�
  ע�⣺�ò�����recursive��ʽ�ģ������ָ��·���µ��������ļ��С�
  ע�⣺FileNamePattern���ϸ���ļ���ģʽ�����ܴ���·����Ϣ��
  Tested in TestUnit.
 --------------------------------}
procedure mnSearchFile(const Path: string; const FileNamePattern: string; OutFileList: TStrings;
  const FileListOptions: mnTFileListOptions = [floIncludePath, floIncludeExt]);

{--------------------------------
  ɾ��ָ����Ŀ¼�����۸�Ŀ¼�Ƿ�Ϊ�ա�
  �����Ƿ�ɹ�ɾ����
  ע�⣺�����Dir��Ŀ¼������˲����ԡ�\����β������ɾ��ʧ�ܡ�
  Tested in TestUnit.
 --------------------------------}
function mnDeleteDir(const Dir: string): Boolean;

{--------------------------------
  �����ļ��������Ƿ��Ƴɹ���
  ��Ŀ���ļ��Ѿ�����ʱ�����FailIfExistsΪTrue������ʧ�ܣ����򸲸�Ŀ���ļ���
  Tested in TestUnit.
 --------------------------------}
function mnCopyFile(const FromFileName, ToFileName: string; const FailIfExists: Boolean = False): Boolean;
{--------------------------------
  ɾ���ļ��������Ƿ�ɾ���ɹ���
  Tested in TestUnit.
 --------------------------------}
function mnDeleteFile(const FileName: string): Boolean;

{--------------------------------
  �õ�ָ���ļ��Ĵ�С��
  Tested in TestUnit.
 --------------------------------}
function mnGetFileSize(const FileName: string): Integer;

{$IFDEF MSWINDOWS}
{--------------------------------
  �õ�ָ���ļ��Ĵ���ʱ�䡢����޸�ʱ���������ʱ�䡣
  Tested in TestApp.
 --------------------------------}
procedure mnGetFileTimes(const FileName: string; var CreationTime, LastWriteTime: TDateTime); overload;
procedure mnGetFileTimes(const FileName: string; var CreationTime, LastWriteTime, LastAccessTime: TDateTime); overload;
{$ENDIF}

{--------------------------------
  ����ָ���ļ��Ƿ���ڲ��ɶ�д��
  Tested in TestUnit.
 --------------------------------}
function mnCanFileBeRW(const FileName: string): Boolean;

{--------------------------------
  ��ָ���ļ�������װ�ص��ַ��������֧���ı�ģʽ��Ҳ֧�ֶ����ơ�
  Tested in TestUnit.
 --------------------------------}
function mnLoadStrFromFile(const FileName: string): string;
{--------------------------------
  ���ַ�����ֵ���浽ָ���ļ������֧���ı�ģʽ��Ҳ֧�ֶ����ơ�
  Tested in TestUnit.
 --------------------------------}
procedure mnSaveStrToFile(const S: string; const FileName: string);
{--------------------------------
  ���ַ�����ֵ���ӵ�ָ���ļ���ĩβ������֧���ı�ģʽ��Ҳ֧�ֶ����ơ�
  Tested in TestUnit.
 --------------------------------}
procedure mnAppendStrToFile(const S: string; const FileName: string);

{--------------------------------
  �ж������ļ��������Ƿ���ͬ��
  Tested in TestUnit.
 --------------------------------}
function mnIsSameFile(const FileNameA, FileNameB: string): Boolean; inline;
{--------------------------------
  �ж�����Excel��Word�ļ��������Ƿ���ͬ��
  Tested in TestUnit.
 --------------------------------}
function mnIsSameExcelFile(const FileNameA, FileNameB: string): Boolean;
function mnIsSameWordFile(const FileNameA, FileNameB: string): Boolean;

{--------------------------------
  ����ͷ�ֽڣ��õ��ı��ļ��ı��뷽ʽ��
  Tested in TestUnit.
 --------------------------------}
function mnGetTextFileEncoding(const FileName: string): mnTTextEncoding;

{--------------------------------
  ��֤һ���ļ��Ƿ���ڡ���������ڣ��׳���ϢΪErrorMsg���쳣��
  ErrorMsg���԰���һ��%s���쳣��Ϣ�����ļ��������
  ���ErrorMsgû�и�ֵ����ʹ��ȱʡ���쳣��Ϣ��
  Tested in TestUnit.
 --------------------------------}
procedure mnValidateFileExists(const FileName: string; const ErrorMsg: string = '');

implementation

uses SysUtils, StrUtils, Windows, ShLwApi, mnSystem, ShellAPI, mnCOM, mnResStrsU,
  mnDateTime;

function mnExtractFileNoExt(const FileName: string): string;
begin
  Result := Copy(FileName, 1, Length(FileName) - Length(ExtractFileExt(Filename)));
end;

function mnExtractPureFileName(const FileName: string): string;
begin
  Result := mnExtractFileNoExt(ExtractFileName(FileName));
end;

function mnExtractParentPath(const PathOrFileName: string): string;
begin
  Result := mnTruncRightOverDelimiter('\', mnTruncRightOverDelimiter('\', PathOrFileName)) + '\';
end;

function mnCorrectPath(const PathName: string): string;
begin
  if RightBStr(PathName, 1) <> '\' then Result := PathName + '\'
  else Result := PathName;
end;

function mnCorrectDir(const DirName: string): string;
begin
  if RightBStr(DirName, 1) = '\' then Result := mnTruncBRight(DirName, 1)
  else Result := DirName;
end;

function mnAppendFileNameSuffix(const FileName, Suffix: string): string;
begin
  Result := mnExtractFileNoExt(FileName) + Suffix + ExtractFileExt(Filename);
end;

function mnGetAbsoluteFileName(const BasePath, RelativeFileName: string): string;
var
  Path: array [0..MAX_PATH] of Char;
begin
  FillChar(Path, MAX_PATH+1, 0);
  PathCombine(Path, PChar(BasePath), PChar(RelativeFileName));
  Result := Path;
end;

function mnGetRelativeFileName(const BasePath, AbsoluteFileName: string): string;
var
  Path: array [0..MAX_PATH] of Char;
begin
  FillChar(Path, MAX_PATH+1, 0);
  PathRelativePathTo(Path, PChar(BasePath), FILE_ATTRIBUTE_DIRECTORY, PChar(AbsoluteFileName), FILE_ATTRIBUTE_NORMAL);
  Result := Path;
end;

procedure mnSetFileAttributeNormal(const FileName: string);
begin
  SetFileAttributes(PChar(FileName), FILE_ATTRIBUTE_NORMAL);
end;

procedure mnGetFileList(const FileNamePattern: string; OutFileList: TStrings;
  const FileListOptions: mnTFileListOptions = [floIncludePath, floIncludeExt]);
var
  sr: TSearchRec;
  FileName: string;
begin
  try
    if FindFirst(FileNamePattern, faAnyFile, sr) = 0 then
    begin
      repeat
        FileName := sr.Name;
        if (FileName <> '.') and (FileName <> '..') then
        begin
          if floDirectoryOnly in FileListOptions then
            if (sr.Attr and faDirectory) = 0 then Continue;
          if floFileOnly in FileListOptions then
            if (sr.Attr and faDirectory) <> 0 then Continue;
          if floIncludePath in FileListOptions then FileName := ExtractFilePath(FileNamePattern) + FileName;
          if not (floIncludeExt in FileListOptions) then FileName := mnExtractFileNoExt(FileName);
          OutFileList.Append(FileName);
        end;
      until FindNext(sr) <> 0;
    end;
  finally
    SysUtils.FindClose(sr);
  end;
end;

procedure mnSearchFile(const Path: string; const FileNamePattern: string; OutFileList: TStrings;
  const FileListOptions: mnTFileListOptions = [floIncludePath, floIncludeExt]);
var
  SubDirs: mnTStrList;
  SubDir: string;
begin
  mnGetFileList(Path + FileNamePattern, OutFileList, FileListOptions);

  SubDirs := mnTStrList.Create;
  try
    mnGetFileList(Path + '*', SubDirs, [floIncludePath, floIncludeExt, floDirectoryOnly]);
    for SubDir in SubDirs do
      mnSearchFile(SubDir + '\', FileNamePattern, OutFileList, FileListOptions);
  finally
    SubDirs.Free;
  end;
end;

function mnDeleteDir(const Dir: string): Boolean;
var
  lpFileOp: TSHFileOpStruct;
begin
  FillChar(lpFileOp, SizeOf(lpFileOp), 0);
  lpFileOp.wFunc := FO_DELETE;
  lpFileOp.pFrom := PChar(Dir + #0);
  lpFileOp.pTo := PChar(#0);
  lpFileOp.fFlags := FOF_NOCONFIRMATION or FOF_SILENT;
  Result := SHFileOperation(lpFileOp) = 0;
end;

function mnCopyFile(const FromFileName, ToFileName: string; const FailIfExists: Boolean = False): Boolean;
begin
  Result := Windows.CopyFile(PChar(FromFileName), PChar(ToFileName), FailIfExists);
end;

function mnDeleteFile(const FileName: string): Boolean;
begin
  Result := SysUtils.DeleteFile(FileName);
end;

function mnGetFileSize(const FileName: string): Integer;
var
  Stream: TStream;
begin
  mnValidateFileExists(FileName);

  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    Result := Stream.Size - Stream.Position;
  finally
    Stream.Free;
  end;
end;

{$IFDEF MSWINDOWS}

procedure mnGetFileTimes(const FileName: string; var CreationTime, LastWriteTime: TDateTime); overload;
var
  LastAccessTime: TDateTime;
begin
  mnGetFileTimes(FileName, CreationTime, LastWriteTime, LastAccessTime);
end;

procedure mnGetFileTimes(const FileName: string; var CreationTime, LastWriteTime, LastAccessTime: TDateTime); overload;
var
  tr: TSearchRec;
begin
  mnValidateFileExists(FileName);

  FindFirst(FileName, faAnyFile, tr);
  CreationTime := mnFileTimeToLocalToDateTime(tr.FindData.ftCreationTime);
  LastWriteTime := mnFileTimeToLocalToDateTime(tr.FindData.ftLastWriteTime);
  LastAccessTime := mnFileTimeToLocalToDateTime(tr.FindData.ftLastAccessTime);
end;

{$ENDIF}

function mnCanFileBeRW(const FileName: string): Boolean;
var
  HFileHandle: HFILE;
begin
  HFileHandle := INVALID_HANDLE_VALUE;
  try
    HFileHandle := CreateFile(PChar(FileName), GENERIC_READ or GENERIC_WRITE, 0, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    Result := HFileHandle <> INVALID_HANDLE_VALUE;
  finally
    if HFileHandle <> INVALID_HANDLE_VALUE then
      CloseHandle(HFileHandle);
  end;
end;

function mnLoadStrFromFile(const FileName: string): string;
var
  Stream: TStream;
  Size: Integer;
begin
  mnValidateFileExists(FileName);

  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    Size := Stream.Size - Stream.Position;
    SetString(Result, nil, Size);
    Stream.ReadBuffer(Pointer(Result)^, Size);
  finally
    Stream.Free;
  end;
end;

procedure mnSaveStrToFile(const S: string; const FileName: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    Stream.WriteBuffer(Pointer(S)^, Length(S));
  finally
    Stream.Free;
  end;
end;

procedure mnAppendStrToFile(const S: string; const FileName: string);
var
  Stream: TStream;
begin
  if FileExists(FileName) then
    Stream := TFileStream.Create(FileName, fmOpenReadWrite)
  else
    Stream := TFileStream.Create(FileName, fmCreate);
  try
    Stream.Seek(0, soEnd);
    Stream.WriteBuffer(Pointer(S)^, Length(S));
  finally
    Stream.Free;
  end;
end;

function mnIsSameFile(const FileNameA, FileNameB: string): Boolean; inline;
begin
  Result := mnLoadStrFromFile(FileNameA) = mnLoadStrFromFile(FileNameB);
end;

function mnIsSameExcelFile(const FileNameA, FileNameB: string): Boolean;

var
  ExcelA, ExcelB: mnTExcel;
begin
  ExcelA := mnTExcel.Create;
  ExcelB := mnTExcel.Create;
  try
    ExcelA.Open(FileNameA);
    ExcelB.Open(FileNameB);
    Result := ExcelA.IsSameAs(ExcelB);
  finally
    ExcelA.Free;
    ExcelB.Free;
  end;
end;

function mnIsSameWordFile(const FileNameA, FileNameB: string): Boolean;
var
  WordA, WordB: mnTWord;
begin
  WordA := mnTWord.Create;
  WordB := mnTWord.Create;
  try
    WordA.Open(FileNameA);
    WordB.Open(FileNameB);
    Result := WordA.IsSameAs(WordB);
  finally
    WordA.Free;
    WordB.Free;
  end;
end;

function mnGetTextFileEncoding(const FileName: string): mnTTextEncoding;
begin
  Result := mnGetTextEncoding(mnLoadStrFromFile(FileName));
end;

procedure mnValidateFileExists(const FileName: string; const ErrorMsg: string = '');
begin
  mnCreateErrorIf(not FileExists(FileName),
                  mnChangeStr(ErrorMsg, roEQ, '', SFileNotExists),
                  [FileName]);
end;

end.
