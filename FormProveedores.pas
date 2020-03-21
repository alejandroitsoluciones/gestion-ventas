unit FormProveedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TFProveedores = class(TForm)
    GroupBoxBuscarProveedores: TGroupBox;
    GroupBoxOpciones: TGroupBox;
    DBGridProveedores: TDBGrid;
    EditBuscarProveedor: TEdit;
    SpeedButtonNuevoProveedor: TSpeedButton;
    SpeedButtonModficarProveedor: TSpeedButton;
    SpeedButtonEliminarProveedor: TSpeedButton;
    SpeedButtonCerrar: TSpeedButton;
    SpeedButtonSeleccionarProveedor: TSpeedButton;
    procedure SpeedButtonSeleccionarProveedorClick(Sender: TObject);
    procedure SpeedButtonCerrarClick(Sender: TObject);
    procedure DBGridProveedoresCellClick(Column: TColumn);
    procedure SpeedButtonNuevoProveedorClick(Sender: TObject);
    procedure SpeedButtonModficarProveedorClick(Sender: TObject);
    procedure SpeedButtonEliminarProveedorClick(Sender: TObject);
    procedure EditBuscarProveedorChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MENSAJE, ID_PROVEEDORES : Integer;
  end;

var
  FProveedores: TFProveedores;

implementation

{$R *.dfm}

uses MDatos, FormCompras, FormOpcionesProveedores;

procedure TFProveedores.DBGridProveedoresCellClick(Column: TColumn);
begin
  //Pregunta si el TEdit esta vacio. Si esta vacio entonces.
  if EditBuscarProveedor.Text = '' then
  begin
    //Asignacion del valor de id_proveedores a la variable de ID_PROVEEDORES
    //del FDTableProveedores.
    with Datos.FDTableProveedores do
    begin
      ID_PROVEEDORES := Fields.FieldByName('id_proveedores').AsInteger;
    end;
  end
  else//Sino.
  begin
    //Asignacion del valor de id_proveedores a la variable de ID_PROVEEDORES
    //del FDQueryBuscarProveedor.
    with Datos.FDQueryBuscarProveedor do
    begin
      ID_PROVEEDORES := Fields.FieldByName('id_proveedores').AsInteger;
    end;
  end;
end;

procedure TFProveedores.EditBuscarProveedorChange(Sender: TObject);
begin
  //Si el TEdit esta vacio, entonces.
  if EditBuscarProveedor.Text = '' then
  begin
    //Seteado de DataSource de DBGridProveedores -> DataSourceProveedores que esta
    //vinculado con el FDTableProveedores.
    DBGridProveedores.DataSource := Datos.DataSourceProveedores;
  end
  else
  begin
    //Llamado al procedimiento BUSCAR_PROVEEDOR.
    with Datos.FDQueryBuscarProveedor do
    begin
      SQL.Clear;
      //Llamado al procedimiento BUSCAR_PROVEEDOR.
      SQL.Add('CALL BUSCAR_PROVEEDOR(:NOMBREPROV)');
      //Seteado de parametro NOMBREPROV.
      Params.ParamByName('NOMBREPROV').AsString := '%'+EditBuscarProveedor.Text+'%';
      //Se llama al metodo Open del FDQuery para ejecutar una consulta SELECT que
      //se encuentra en el procedimiento BUSCAR_PROVEEDOR.
      Open();
      //Se activa el FDQuery para ver los registros obtenidos.
      Active := True;
    end;
    //Seteado de DataSource de DBGridProveedores -> DataSourceBuscarProveedor que esta
    //vinculado al FDQueryBuscarProveedor.
    DBGridProveedores.DataSource := Datos.DataSourceBuscarProveedor;
  end;
end;

procedure TFProveedores.FormActivate(Sender: TObject);
begin
  try
    //Inicializacion de variable ID_PROVEEDORES.
    ID_PROVEEDORES := 0;
    Datos.FDConnectionNegocio.Connected := True;
  finally
    Datos.FDTableProveedores.Active := True;
  end;
end;

procedure TFProveedores.SpeedButtonCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFProveedores.SpeedButtonEliminarProveedorClick(Sender: TObject);
begin
  //Pregunta si se ha seleccionado un proveedor.
  if ID_PROVEEDORES <> 0 then
  begin
    //Se Muestra Mensaje.
    MENSAJE := MessageDlg('¿Esta Seguro De Eliminar El Proveedor? - Si Elimina El Proveedor Se Perderan Los Registros De Las Compras Que Hayan Realizado A Ese Proveedor',mtConfirmation,[mbYes, mbNo],0);
    //Si el modalResult es Yes entonces.
    if MENSAJE = mrYes then
    begin
      //Se inicia una nueva transaccion desde el FDConnection.
      //Para mas informacion. - http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Managing_Transactions_(FireDAC)
      Datos.FDConnectionNegocio.StartTransaction;
      //Inicializacion de bloque try
      try
        with Datos.FDStoredProcEliminarProveedor do
        begin
          Prepare;
          //Seteado de parametro para eliminar.
          Params.ParamByName('idProv').AsInteger := ID_PROVEEDORES;
          //Se utiliza el procedimiento ExecSQL para poder ejecutar una instruccion SQL
          //de tipo DELETE que se encuentra en el procedimiento ELIMINAR_PROVEEDOR
          ExecProc;
        end;
        //Se postea la transaccion.
        Datos.FDConnectionNegocio.Commit;
        //Se hace un refresh del FDTableProductos para ver los cambios.
        Datos.FDTableProveedores.Refresh;
        //Se muestra un mensaje de que se elimino correctamente.
        ShowMessage('El Cliente Se Ha Eliminado Correctamente.');
      except//En caso de que ocurra alguna excepción
        //Se ejecuta un Rollback para deshacer los cambios.
        Datos.FDConnectionNegocio.Rollback;
        raise;
      end;
    end;
  end
  else
  begin
    ShowMessage('Elija Un Proveedor De La Grilla Para Eliminar.');
  end;
end;

procedure TFProveedores.SpeedButtonModficarProveedorClick(Sender: TObject);
begin
  //Pregunta si se ha seleccionado un proveedores.
  if ID_PROVEEDORES <> 0 then
  begin
    //Se instancia el fomulario de Opciones de Proveedores.
    FOpcionesProveedores := TFOpcionesProveedores.Create(Self);
    //Seteado de Caption de FOpcionesProveedores.
    FOpcionesProveedores.Caption := 'Modificar Un Proveedor';
    //Se coloca como visible el boton Update y se oculta el boton Insert
    //Para evitar que se produzca un error.
    FOpcionesProveedores.SpeedButtonInsertarProveedores.Visible := False;
    FOpcionesProveedores.SpeedButtonUpdateProveedores.Visible := True;

    with Datos.FDQuerySeleccionarProveedor do
    begin
      //Se realiza una consulta para mostrar los datos del Proveedor que se esta
      //por modificar.
      SQL.Clear;
      SQL.Add('CALL SELECCION_PROVEEDOR(:IDPROVEEDOR)');
      Params.ParamByName('IDPROVEEDOR').AsInteger := ID_PROVEEDORES;
      //Se llama al metodo Open del FDQuery para ejecutar una consulta SELECT que
      //se encuentra en el procedimiento SELECCION_PROVEEDOR
      Open();
      //Seteado de los componentes que estan en FOpcionesProveedores.
      FOpcionesProveedores.EditNombre.Text := Fields.FieldByName('nombre_proveedor').AsString;
      FOpcionesProveedores.EditDireccion.Text := Fields.FieldByName('direccion_proveedor').AsString;
      FOpcionesProveedores.EditCuit.Text := Fields.FieldByName('cuit_proveedor').AsString;
      FOpcionesProveedores.EditTelefono.Text := Fields.FieldByName('telefono_proveedor').AsString;
    end;
    //Se muestra el FOpcionesProveedores.
    FOpcionesProveedores.ShowModal;
  end
  else
  begin
    ShowMessage('Elija Un Proveedor Para Modificar.');
  end;
end;

procedure TFProveedores.SpeedButtonNuevoProveedorClick(Sender: TObject);
begin
  //Instancia de FOpcionesProveedores.
  FOpcionesProveedores := TFOpcionesProveedores.Create(Self);
  //Seteado de Caption de FOpcionesProveedores.
  FOpcionesProveedores.Caption := 'Nuevo Proveedor';
  //Oculto el boton para actualizar y dejo a la vista el boton insertar.
  FOpcionesProveedores.SpeedButtonInsertarProveedores.Visible := True;
  FOpcionesProveedores.SpeedButtonUpdateProveedores.Visible := False;
  //Muestro el FOpcionesProveedores.
  FOpcionesProveedores.ShowModal;
end;

procedure TFProveedores.SpeedButtonSeleccionarProveedorClick(Sender: TObject);
begin
  //Se evalua si se selecciono el proveedor de la grilla.
  if ID_PROVEEDORES <> 0 then
  begin
    //Se realiza la consulta para extraer los datos del proveedor seleccionado.
    with Datos.FDQuerySeleccionProveedores do
    begin
      SQL.Clear;
      //Llamado del procedimiento SELECCION_PROVEEDOR
      SQL.Add('CALL SELECCION_PROVEEDOR(:IDPROVEEDOR)');
      //Seteado de parametro IDPROVEEDOR
      Params.ParamByName('IDPROVEEDOR').AsInteger := ID_PROVEEDORES;
      //Se llama al metodo Open del FDQuery para ejecutar una consulta SELECT que
      //se encuentra en el procedimiento SELECCION_PROVEEDOR
      Open();
      //Seteado de variables y componentes de FCompras.
      FCompras.EditNombreProv.Text := Fields.FieldByName('nombre_proveedor').AsString;
      FCompras.EditDireccionProv.Text := Fields.FieldByName('direccion_proveedor').AsString;
      FCompras.EditTelefonoProv.Text := Fields.FieldByName('telefono_proveedor').AsString;
      FCompras.ID_Proveedores := ID_PROVEEDORES;
    end;
    //Se Cierra FProveedores.
    FProveedores.Close;
  end
  else
  begin
    ShowMessage('Seleccione Un Proveedor De La Grilla Para Agregar Al Pedido.');
  end;
end;

end.
