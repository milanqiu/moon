        ��  ��                    8   ��
 M D I C H I L D F O R M         0         unit FormMDIChild;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TMDIChildForm = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MDIChildForm: TMDIChildForm;

implementation

{$R *.dfm}

{ TMDIChildForm }

procedure TMDIChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
 �  <   ��
 M D I C H I L D F O R M D F M       0         object MDIChildForm: TMDIChildForm
  Left = 149
  Top = 65
  Width = 798
  Height = 568
  Caption = 'MDIChild'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
end
