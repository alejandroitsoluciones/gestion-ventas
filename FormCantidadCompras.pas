unit FormCantidadCompras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFCantidadCompras = class(TForm)
    Label1: TLabel;
    SpeedButtonAceptar: TSpeedButton;
    EditCantidadCompras: TEdit;
    procedure SpeedButtonAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CantidadCompras : Integer;
  end;

var
  FCantidadCompras: TFCantidadCompras;

implementation

{$R *.dfm}

uses FormCompras;

procedure TFCantidadCompras.SpeedButtonAceptarClick(Sender: TObject);
begin
  CantidadCompras := StrToInt(EditCantidadCompras.Text);
  Close;
end;

end.
