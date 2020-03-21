unit FormCantidad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls;

type
  TFCantidad = class(TForm)
    Label1: TLabel;
    EditCantidad: TEdit;
    SpeedButtonAceptar: TSpeedButton;
    procedure SpeedButtonAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Cantidad : Integer;
  end;

var
  FCantidad: TFCantidad;

implementation

{$R *.dfm}

procedure TFCantidad.SpeedButtonAceptarClick(Sender: TObject);
begin
  Cantidad := StrToInt(EditCantidad.Text);
  Close;
end;

end.
