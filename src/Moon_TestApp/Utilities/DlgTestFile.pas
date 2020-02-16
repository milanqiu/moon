unit DlgTestFile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DlgTest, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TTestFileDialog = class(TTestDialog)
    btnGetFileTimes: TcxButton;
    procedure btnGetFileTimesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestFileDialog: TTestFileDialog;

implementation

{$R *.dfm}

uses mnFile, mnSystem, mnDialog;

{ TTestFileDialog }

procedure TTestFileDialog.btnGetFileTimesClick(Sender: TObject);
var
  CreationTime, LastWriteTime, LastAccessTime: TDateTime;
begin
  mnGetFileTimes(mnTProjectConvention.GetFilesPathSub('Files\FileTimes.txt'),
    CreationTime, LastWriteTime, LastAccessTime);
  mnInfoBox('CreationTime: ' + DateTimeToStr(CreationTime) + mnNewLine +
            'LastWriteTime: ' + DateTimeToStr(LastWriteTime) + mnNewLine +
            'LastAccessTime: ' + DateTimeToStr(LastAccessTime));
end;

end.
