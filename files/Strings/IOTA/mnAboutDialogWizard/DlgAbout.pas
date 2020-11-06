unit DlgAbout;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Menus, cxLookAndFeelPainters, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit;

type
  TAboutDialog = class(TForm)
    cxbtnOK: TcxButton;
    lbProductName: TLabel;
    lbVersion: TLabel;
    lbCopyright: TLabel;
    lbReserved: TLabel;
    lbEmail: TLabel;
    procedure lbEmailClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutDialog: TAboutDialog;

implementation

{$R *.dfm}

uses mnWindows;

const
  AboutInChinese = True;
  ProductName = '';

{ TAboutDialog }

procedure TAboutDialog.FormCreate(Sender: TObject);
begin
  if AboutInChinese then
  begin
    Caption := #$B9#$D8#$D3#$DA;
    lbProductName.Caption := ProductName;
    lbVersion.Caption := #$B0#$E6#$B1#$BE#$BA#$C5#$A3#$BA + mnGetFileVersion(Application.ExeName);
    lbCopyright.Caption := #$B0#$E6#$C8#$A8#$CB#$F9#$D3#$D0#$28#$63#$29#$20#$32#$30#$32#$30#$20#$C7#$F1#$B9#$DB#$E8#$A1;
    lbReserved.Caption := #$B1#$A3#$C1#$F4#$CB#$F9#$D3#$D0#$C8#$A8#$C0#$FB#$A1#$A3;
    lbEmail.Caption := 'Email: product@milanqiu.net';
    cxbtnOK.Caption := #$C8#$B7#$B6#$A8;
  end
  else
  begin
    Caption := 'About';
    lbProductName.Caption := ProductName;
    lbVersion.Caption := 'Version: ' + mnGetFileVersion(Application.ExeName);
    lbCopyright.Caption := 'Copyright(c) 2020 Milan Qiu';
    lbReserved.Caption := 'All rights reserved.';
    lbEmail.Caption := 'Email: product@milanqiu.net';
    cxbtnOK.Caption := 'OK';
  end;
end;

procedure TAboutDialog.lbEmailClick(Sender: TObject);
begin
  mnShellOpen('mailto:product@milanqiu.net');
end;

end.
