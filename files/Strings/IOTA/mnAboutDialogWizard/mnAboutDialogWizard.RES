        ��  ��                  #  4   ��
 A B O U T D I A L O G       0         unit DlgAbout;

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
 9  <   ��
 A B O U T D I A L O G D F M         0         object AboutDialog: TAboutDialog
  Left = 354
  Top = 151
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 184
  ClientWidth = 357
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbProductName: TLabel
    Left = 16
    Top = 16
    Width = 72
    Height = 13
    Caption = 'lbProductName'
  end
  object lbVersion: TLabel
    Left = 16
    Top = 40
    Width = 43
    Height = 13
    Caption = 'lbVersion'
  end
  object lbCopyright: TLabel
    Left = 16
    Top = 64
    Width = 55
    Height = 13
    Caption = 'lbCopyright'
  end
  object lbEmail: TLabel
    Left = 16
    Top = 112
    Width = 32
    Height = 13
    Cursor = crHandPoint
    Caption = 'lbEmail'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = lbEmailClick
  end
  object lbReserved: TLabel
    Left = 16
    Top = 88
    Width = 54
    Height = 13
    Caption = 'lbReserved'
  end
  object cxbtnOK: TcxButton
    Left = 144
    Top = 144
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
end
   