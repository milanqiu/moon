unit mnFile;

interface

{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}

uses Classes, mnString;

{--------------------------------
  从一个文件名中去除扩展名。可以传入单纯的文件名，也可以包含文件路径。
  Tested in TestUnit.
 --------------------------------}
function mnExtractFileNoExt(const FileName: string): string;
{--------------------------------
  从一个文件名中提取出不含文件路径和扩展名的单纯文件名。
  Tested in TestUnit.
 --------------------------------}
function mnExtractPureFileName(const FileName: string): string;

{--------------------------------
  返回一个路径或文件的父路径。
  Tested in TestUnit.
 --------------------------------}
function mnExtractParentPath(const PathOrFileName: string): string;

{--------------------------------
  纠正一个路径。即保证该路径以“\”结尾。
  Tested in TestUnit.
 --------------------------------}
function mnCorrectPath(const PathName: string): string;

{--------------------------------
  纠正一个目录。即保证该目录不以“\”结尾。
  Tested in TestUnit.
 --------------------------------}
function mnCorrectDir(const DirName: string): string;

{--------------------------------
  给一个文件名加上后缀。可以传入单纯的文件名，也可以包含文件路径。
  Tested in TestUnit.
 --------------------------------}
function mnAppendFileNameSuffix(const FileName, Suffix: string): string;

{--------------------------------
  基于指定路径，将相对路径的文件名转换为绝对路径的文件名。
  Tested in TestUnit.
 --------------------------------}
function mnGetAbsoluteFileName(const BasePath, RelativeFileName: string): string;
{--------------------------------
  基于指定路径，将绝对路径的文件名转换为相对路径的文件名。
  Tested in TestUnit.
 --------------------------------}
function mnGetRelativeFileName(const BasePath, AbsoluteFileName: string): string;

{--------------------------------
  设置文件的属性为正常。
  测试：略
 --------------------------------}
procedure mnSetFileAttributeNormal(const FileName: string);

type
{--------------------------------
  用于调用mnGetFileList函数时传入参数，以指定调用方式。
    floIncludePath：包含完整路径。
    floIncludeExt：包含扩展名。
    floDirectoryOnly：只查找目录。
    floFileOnly：只查找文件。与floDirectoryOnly不能同时使用。
 --------------------------------}
  mnTFileListOption = (floIncludePath, floIncludeExt, floDirectoryOnly, floFileOnly);
  mnTFileListOptions = set of mnTFileListOption;

{--------------------------------
  根据带有*和?等通配符的文件名模式，查找所有文件，然后将文件名保存到OutFileList里。
  注意：OutFileList之前存储的内容依旧保留，不会被清空。
  注意：该查找并非recursive方式，即不查找子文件夹。
  Tested in TestUnit.
 --------------------------------}
procedure mnGetFileList(const FileNamePattern: string; OutFileList: TStrings;
  const FileListOptions: mnTFileListOptions = [floIncludePath, floIncludeExt]);

{--------------------------------
  在指定路径中，根据带有*和?等通配符的文件名模式，查找所有文件，然后将文件名保存到OutFileList里。
  注意：OutFileList之前存储的内容依旧保留，不会被清空。
  注意：该查找是recursive方式的，会查找指定路径下的所有子文件夹。
  注意：FileNamePattern是严格的文件名模式，不能带有路径信息。
  Tested in TestUnit.
 --------------------------------}
procedure mnSearchFile(const Path: string; const FileNamePattern: string; OutFileList: TStrings;
  const FileListOptions: mnTFileListOptions = [floIncludePath, floIncludeExt]);

{--------------------------------
  删除指定的目录，无论该目录是否为空。
  返回是否成功删除。
  注意：传入的Dir是目录名，因此不能以“\”结尾，否则将删除失败。
  Tested in TestUnit.
 --------------------------------}
function mnDeleteDir(const Dir: string): Boolean;

{--------------------------------
  复制文件，返回是否复制成功。
  当目标文件已经存在时，如果FailIfExists为True，则复制失败，否则覆盖目标文件。
  Tested in TestUnit.
 --------------------------------}
function mnCopyFile(const FromFileName, ToFileName: string; const FailIfExists: Boolean = False): Boolean;
{--------------------------------
  删除文件，返回是否删除成功。
  Tested in TestUnit.
 --------------------------------}
function mnDeleteFile(const FileName: string): Boolean;

{--------------------------------
  得到指定文件的大小。
  Tested in TestUnit.
 --------------------------------}
function mnGetFileSize(const FileName: string): Integer;

{$IFDEF MSWINDOWS}
{--------------------------------
  得到指定文件的创建时间、最后修改时间和最后访问时间。
  Tested in TestApp.
 --------------------------------}
procedure mnGetFileTimes(const FileName: string; var CreationTime, LastWriteTime: TDateTime); overload;
procedure mnGetFileTimes(const FileName: string; var CreationTime, LastWriteTime, LastAccessTime: TDateTime); overload;
{$ENDIF}

{--------------------------------
  返回指定文件是否存在并可读写。
  Tested in TestUnit.
 --------------------------------}
function mnCanFileBeRW(const FileName: string): Boolean;

{--------------------------------
  将指定文件的内容装载到字符串里。不单支持文本模式，也支持二进制。
  Tested in TestUnit.
 --------------------------------}
function mnLoadStrFromFile(const FileName: string): string;
{--------------------------------
  将字符串的值保存到指定文件里。不单支持文本模式，也支持二进制。
  Tested in TestUnit.
 --------------------------------}
procedure mnSaveStrToFile(const S: string; const FileName: string);
{--------------------------------
  将字符串的值附加到指定文件的末尾。不单支持文本模式，也支持二进制。
  Tested in TestUnit.
 --------------------------------}
procedure mnAppendStrToFile(const S: string; const FileName: string);

{--------------------------------
  判断两个文件的内容是否相同。
  Tested in TestUnit.
 --------------------------------}
function mnIsSameFile(const FileNameA, FileNameB: string): Boolean; inline;
{--------------------------------
  判断两个Excel或Word文件的内容是否相同。
  Tested in TestUnit.
 --------------------------------}
function mnIsSameExcelFile(const FileNameA, FileNameB: string): Boolean;
function mnIsSameWordFile(const FileNameA, FileNameB: string): Boolean;

{--------------------------------
  根据头字节，得到文本文件的编码方式。
  Tested in TestUnit.
 --------------------------------}
function mnGetTextFileEncoding(const FileName: string): mnTTextEncoding;

{--------------------------------
  验证一个文件是否存在。如果不存在，抛出消息为ErrorMsg的异常。
  ErrorMsg可以包含一个%s，异常消息会用文件名替代。
  如果ErrorMsg没有赋值，则使用缺省的异常消息。
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
