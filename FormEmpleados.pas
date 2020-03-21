unit FormEmpleados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids;

type
  TFEmpleados = class(TForm)
    GroupBoxBuscarEmpleado: TGroupBox;
    DBGridEmpleados: TDBGrid;
    GroupBoxOpciones: TGroupBox;
    SpeedButtonNuevoEmpleado: TSpeedButton;
    SpeedButtonModificarEmpleado: TSpeedButton;
    SpeedButtonEliminarEmpleado: TSpeedButton;
    SpeedButtonCambiarClave: TSpeedButton;
    SpeedButtonCerrar: TSpeedButton;
    EditBuscarEmpleado: TEdit;
    procedure SpeedButtonNuevoEmpleadoClick(Sender: TObject);
    procedure SpeedButtonModificarEmpleadoClick(Sender: TObject);
    procedure DBGridEmpleadosCellClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButtonCerrarClick(Sender: TObject);
    procedure SpeedButtonEliminarEmpleadoClick(Sender: TObject);
    procedure SpeedButtonCambiarClaveClick(Sender: TObject);
    procedure EditBuscarEmpleadoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MENSAJE, ID_EMP, ID_USER : Integer;
  end;

var
  FEmpleados: TFEmpleados;

implementation

{$R *.dfm}

uses MDatos, FormOpcionesEmpleados, FormCambiarClave;

procedure TFEmpleados.DBGridEmpleadosCellClick(Column: TColumn);
begin
  if EditBuscarEmpleado.Text = '' then
  begin
    with Datos.FDTableEmpleados do
    begin
      ID_EMP := Datos.FDTableEmpleados.Fields.FieldByName('id_empleados').AsInteger;
      ID_USER := Datos.FDTableEmpleados.Fields.FieldByName('id_usuarios').AsInteger;
    end;
  end
  else
  begin
    with Datos.FDQueryBuscarEmpleado do
    begin
      ID_EMP := Datos.FDTableEmpleados.Fields.FieldByName('id_empleados').AsInteger;
      ID_USER := Datos.FDTableEmpleados.Fields.FieldByName('id_usuarios').AsInteger;
    end;
  end;
  ID_EMP := Datos.FDTableEmpleados.Fields.FieldByName('id_empleados').AsInteger;
  ID_USER := Datos.FDTableEmpleados.Fields.FieldByName('id_usuarios').AsInteger;
end;

procedure TFEmpleados.EditBuscarEmpleadoChange(Sender: TObject);
begin
  if EditBuscarEmpleado.Text = '' then
  begin
    DBGridEmpleados.DataSource := Datos.DataSourceEmpleados;
  end
  else
  begin
    with Datos.FDQueryBuscarEmpleado do
    begin
      SQL.Clear;
      SQL.Add('CALL BUSCAR_EMPLEADO(:NOMBREEMP)');
      Params.ParamByName('NOMBREEMP').AsString := '%'+EditBuscarEmpleado.Text+'%';
      Open();
      Active := True;
    end;
    DBGridEmpleados.DataSource := Datos.DataSourceBuscarEmpleados;
  end;
end;

procedure TFEmpleados.FormActivate(Sender: TObject);
begin
  try
    //Inicializacion de variable ID_EMP; ID_USER.
    ID_EMP := 0;
    ID_USER := 0;
    Datos.FDConnectionNegocio.Connected := True;
  finally
    Datos.FDTableEmpleados.Active := True;
  end;
end;

procedure TFEmpleados.SpeedButtonCambiarClaveClick(Sender: TObject);
begin
  FCambiarClave := TFCambiarClave.Create(Self);
  FCambiarClave.ShowModal;
end;

procedure TFEmpleados.SpeedButtonCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFEmpleados.SpeedButtonEliminarEmpleadoClick(Sender: TObject);
begin
  if ID_EMP <> 0 then
  begin
    MENSAJE := MessageDlg('¿Esta Seguro De Eliminar El Empleado? - Si Elimina El Empleado Se Perderan El Historial De Ventas Del Empleado.',mtConfirmation,[mbYes, mbNo],0);
    if MENSAJE = mrYes then
    begin
      with Datos.FDStoredProcEliminarEmpleado do
      begin
        Prepare;
        Params.ParamByName('idEmp').AsInteger := ID_EMP;
        ExecProc;

        if RowsAffected <> 0 then
        begin
          Datos.FDTableEmpleados.Refresh;
          ShowMessage('El Empleado Fue Eliminado Correctamente.');
        end
        else
        begin
          ShowMessage('Error Al Eliminar Empleado.');
        end;
      end;
    end;
  end
  else
  begin
    ShowMessage('Elija Un Empleado De La Grilla Para Eliminar.');
  end;
end;

procedure TFEmpleados.SpeedButtonModificarEmpleadoClick(Sender: TObject);
begin
  if ID_EMP <> 0 then
  begin
    FOpcionesEmpleados := TFOpcionesEmpleados.Create(Self);

    with Datos.FDQuerySelectEmpleado do
    begin
      SQL.Clear;
      SQL.Add('CALL SELECCION_EMPLEADO(:IDEMPLEADO)');
      Params.ParamByName('IDEMPLEADO').AsInteger := ID_EMP;
      Open();

      FOpcionesEmpleados.EditNombre.Text := Fields.FieldByName('nombre_empleado').AsString;
      FOpcionesEmpleados.EditApellido.Text := Fields.FieldByName('apellido_empleado').AsString;
      FOpcionesEmpleados.EditDNI.Text := Fields.FieldByName('dni_empleado').AsString;
      FOpcionesEmpleados.EditDireccion.Text := Fields.FieldByName('direccion_empleado').AsString;
      FOpcionesEmpleados.EditTelefono.Text := Fields.FieldByName('telefono_empleado').AsString;
      FOpcionesEmpleados.EditUsuario.Enabled := False;
      FOpcionesEmpleados.EditClave.Enabled := False;
      FOpcionesEmpleados.EditConfClave.Enabled := False;
    end;
    FOpcionesEmpleados.SpeedButtonModificarEmpleado.Visible := True;
    FOpcionesEmpleados.SpeedButtonInsertarEmpleado.Visible := False;
    FOpcionesEmpleados.ShowModal;
  end
  else
  begin
    ShowMessage('Seleccione Un Empleado De La Grilla Para Modificar.');
  end;
end;

procedure TFEmpleados.SpeedButtonNuevoEmpleadoClick(Sender: TObject);
begin
  FOpcionesEmpleados := TFOpcionesEmpleados.Create(Self);
  FOpcionesEmpleados.SpeedButtonModificarEmpleado.Visible := False;
  FOpcionesEmpleados.ShowModal;
end;

end.
