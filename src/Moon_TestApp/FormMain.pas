unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxMCListBox;

type
  TMainForm = class(TForm)
    cxmclbModule: TcxMCListBox;
    cxbtnTest: TcxButton;
    procedure cxmclbModuleDblClick(Sender: TObject);
    procedure cxbtnTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses mnString, mnTPL;

procedure TMainForm.cxbtnTestClick(Sender: TObject);
var
  DialogName: string;
  i: Integer;
begin
  DialogName := 'Test' + mnTruncLeftOver(';mn', cxmclbModule.Items[cxmclbModule.ItemIndex]) + 'Dialog';

  for i := 0 to Application.ComponentCount-1 do
    if Application.Components[i].Name = DialogName then
      (Application.Components[i] as TForm).ShowModal;
end;

procedure TMainForm.cxmclbModuleDblClick(Sender: TObject);
begin
  cxbtnTest.Click;
end;

end.
