unit FormOpcionesEmpleados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls;

type
  TFOpcionesEmpleados = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EditNombre: TEdit;
    EditApellido: TEdit;
    EditDNI: TEdit;
    EditDireccion: TEdit;
    EditTelefono: TEdit;
    EditUsuario: TEdit;
    EditClave: TEdit;
    EditConfClave: TEdit;
    SpeedButtonInsertarEmpleado: TSpeedButton;
    SpeedButtonModificarEmpleado: TSpeedButton;
    SpeedButtonCerrar: TSpeedButton;
    procedure SpeedButtonInsertarEmpleadoClick(Sender: TObject);
    procedure SpeedButtonCerrarClick(Sender: TObject);
    procedure SpeedButtonModificarEmpleadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    USUARIO_REPETIDO : Integer;
    ULTIMO_USUARIO : Integer;
  end;

var
  FOpcionesEmpleados: TFOpcionesEmpleados;

implementation

{$R *.dfm}

uses MDatos, FormEmpleados;

procedure TFOpcionesEmpleados.SpeedButtonCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFOpcionesEmpleados.SpeedButtonInsertarEmpleadoClick(Sender: TObject);
begin
  if (EditNombre.Text <> '') and (EditApellido.Text <> '') and (EditDNI.Text <> '')
  and (EditDireccion.Text <> '') and (EditTelefono.Text <> '') and (EditUsuario.Text <> '')
  and (EditClave.Text <> '') and (EditConfClave.Text <> '') then
  begin
    if EditClave.Text = EditConfClave.Text then
    begin
      with Datos.FDQueryVerificacionUsuario do
      begin
        SQL.Clear;
        SQL.Add('CALL USUARIO_REPETIDO(:USUARIO)');
        Params.ParamByName('USUARIO').AsString := EditUsuario.Text;
        Open();
        USUARIO_REPETIDO := Fields.FieldByName('usuario').AsInteger;
      end;
      if USUARIO_REPETIDO = 0 then
      begin
        with Datos.FDStoredProcInsertarUsuario do
        begin
          Prepare;
          Params.ParamByName('u').AsString := EditUsuario.Text;
          Params.ParamByName('p').AsString := EditClave.Text;
          ExecProc;

          if RowsAffected <> 0 then
          begin
            with Datos.FDQuerySeleccionarUsuario do
            begin
              SQL.Clear;
              SQL.Add('SELECT * FROM sis_seleccionar_usuario');
              Open();
              ULTIMO_USUARIO := Fields.FieldByName('ultimo_usuario').AsInteger;
            end;
            with Datos.FDStoredProcInsertarEmpleado do
            begin
              Prepare;
              Params.ParamByName('nombre').AsString := EditNombre.Text;
              Params.ParamByName('apellido').AsString := EditApellido.Text;
              Params.ParamByName('dni').AsString := EditDNI.Text;
              Params.ParamByName('direccion').AsString := EditDireccion.Text;
              Params.ParamByName('telefono').AsString := EditTelefono.Text;
              Params.ParamByName('idUser').AsInteger := ULTIMO_USUARIO;
              ExecProc;

              if RowsAffected <> 0 then
              begin
                Datos.FDTableEmpleados.Refresh;
                ShowMessage('El Usuario Para El Empleado, Fue Creado Correctamente.');
                Close;
              end
              else
              begin
                ShowMessage('Ocurrio Un Error Al Momento De Insertar El Empleado.');
              end;
            end;
          end
          else
          begin
            ShowMessage('Error Al Insertar Usuario.');
          end;
        end;
      end
      else
      begin
        ShowMessage('El Usuario Que Intenta Guardar Ya Esta Registrado. Intente Nuevamente.');
      end;
    end
    else
    begin
      ShowMessage('Las Contraseñas No Coinciden.');
    end;
  end
  else
  begin
    ShowMessage('Asegurese De Completar Todos Los Campos Antes De Guardar.');
  end;
end;

procedure TFOpcionesEmpleados.SpeedButtonModificarEmpleadoClick(
  Sender: TObject);
begin
  if (EditNombre.Text <> '') and (EditApellido.Text <> '') and (EditDNI.Text <> '')
  and (EditDireccion.Text <> '') and (EditTelefono.Text <> '') then
  begin
    with Datos.FDStoredProcModificarEmpleado do
    begin
      Params.ParamByName('nombre').AsString := EditNombre.Text;
      Params.ParamByName('apellido').AsString := EditApellido.Text;
      Params.ParamByName('dni').AsString := EditDNI.Text;
      Params.ParamByName('direccion').AsString := EditDireccion.Text;
      Params.ParamByName('telefono').AsString := EditTelefono.Text;
      Params.ParamByName('idEmp').AsInteger := FEmpleados.ID_EMP;
      ExecProc;

      if RowsAffected <> 0 then
      begin
        Datos.FDTableEmpleados.Refresh;
        ShowMessage('El Empleado Ha Sido Modificado Correctamente.');
        Close;
      end
      else
      begin
        ShowMessage('Error Al Actualizar El Empleado.');
      end;
    end;
  end
  else
  begin
    ShowMessage('Asegurese De Completar Todos Los Campos Antes De Guardar.');
  end;
end;

end.
