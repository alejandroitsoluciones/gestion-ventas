unit FormCambiarClave;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFCambiarClave = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButtonCambiarClave: TSpeedButton;
    SpeedButtonCancelar: TSpeedButton;
    EditDNIUser: TEdit;
    EditClave: TEdit;
    EditConfirmarClave: TEdit;
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonCambiarClaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Resultado : Integer;
  end;

var
  FCambiarClave: TFCambiarClave;

implementation

{$R *.dfm}

uses MDatos, FormEmpleados;

procedure TFCambiarClave.SpeedButtonCambiarClaveClick(Sender: TObject);
begin
  if (EditDNIUser.Text <> '') and (EditClave.Text <> '') and (EditConfirmarClave.Text <> '') then
  begin
    with Datos.FDStoredProcValidarIdentidad do
    begin
      Prepare;
      Params.ParamByName('dni').AsString := EditDNIUser.Text;
      Open;
      Resultado := Fields.FieldByName('dni').AsInteger;
    end;
    if Resultado = 1 then
    begin
      if EditClave.Text = EditConfirmarClave.Text then
      begin
        with Datos.FDStoredProcCambiarClave do
        begin
          Prepare;
          Params.ParamByName('idUser').AsInteger := FEmpleados.ID_USER;
          Params.ParamByName('clave').AsString := EditClave.Text;
          ExecProc;

          if RowsAffected <> 0 then
          begin
            ShowMessage('La Clave Fue Modificada.');
          end
          else
          begin
            ShowMessage('Error Al Modificar Clave');
          end;
        end;
      end;
    end
    else
    begin
      ShowMessage('La Identidad Del Usuario Es Invalida.');
    end;
  end
  else
  begin
    ShowMessage('Complete Todos Los Campos Para Modificar Clave.');
  end;
end;

procedure TFCambiarClave.SpeedButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
