        ��  ��                  �  8   ��
 C O M M O N D I A L O G         0         unit DlgCommon;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Menus, cxLookAndFeelPainters, cxButtons;

type
  TCommonDialog = class(TForm)
    cxbtnOK: TcxButton;
    cxbtnCancel: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure ValidateBeforeSubmit;
  public
    { Public declarations }
  end;

var
  CommonDialog: TCommonDialog;

implementation

{$R *.dfm}

{ TCommonDialog }

procedure TCommonDialog.ValidateBeforeSubmit;
begin

end;

procedure TCommonDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrOK then ValidateBeforeSubmit;
end;

end.
�  <   ��
 C O M M O N D I A L O G D F M       0         object CommonDialog: TCommonDialog
  Left = 497
  Top = 275
  BorderStyle = bsDialog
  Caption = 'Common'
  ClientHeight = 283
  ClientWidth = 450
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxbtnOK: TcxButton
    Left = 152
    Top = 240
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object cxbtnCancel: TcxButton
    Left = 240
    Top = 240
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
end
