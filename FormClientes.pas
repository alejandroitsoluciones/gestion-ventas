unit FormClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls;

type
  TFClientes = class(TForm)
    GroupBoxBuscarCliente: TGroupBox;
    GroupBoxOpciones: TGroupBox;
    DBGridClientes: TDBGrid;
    SpeedButtonNuevoCliente: TSpeedButton;
    SpeedButtonModificarCliente: TSpeedButton;
    SpeedButtonCerrar: TSpeedButton;
    SpeedButtonEliminarCliente: TSpeedButton;
    SpeedButtonSeleccionarCliente: TSpeedButton;
    EditBuscarCli: TEdit;
    procedure DBGridClientesCellClick(Column: TColumn);
    procedure SpeedButtonSeleccionarClienteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButtonCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonNuevoClienteClick(Sender: TObject);
    procedure SpeedButtonModificarClienteClick(Sender: TObject);
    procedure SpeedButtonEliminarClienteClick(Sender: TObject);
    procedure EditBuscarCliChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MENSAJE, ID_CLIENTES : Integer;
  end;

var
  FClientes: TFClientes;

implementation

{$R *.dfm}

uses MDatos, FormVentas, FormOpcionesClientes;

procedure TFClientes.DBGridClientesCellClick(Column: TColumn);
begin
  if EditBuscarCli.Text = '' then
  begin
    with Datos.FDTableClientes do
    begin
      ID_CLIENTES := Fields.FieldByName('id_clientes').AsInteger;
    end;
  end
  else
  begin
    with Datos.FDQueryBuscarCliente do
    begin
      ID_CLIENTES := Fields.FieldByName('id_clientes').AsInteger;
    end;
  end;
end;

procedure TFClientes.EditBuscarCliChange(Sender: TObject);
begin
  if EditBuscarCli.Text = '' then
  begin
    DBGridClientes.DataSource := Datos.DataSourceClientes;
  end
  else
  begin
    with Datos.FDQueryBuscarCliente do
    begin
      SQL.Clear;
      SQL.Add('CALL BUSCAR_CLIENTE (:nombre_cli)');
      Params.ParamByName('nombre_cli').AsString := '%'+EditBuscarCli.Text+'%';
      Open;
    end;
    DBGridClientes.DataSource := Datos.DataSourceBuscarCliente;
  end;
end;

procedure TFClientes.FormActivate(Sender: TObject);
begin
  try
    //Inicializacion de variable ID_CLIENTES.
    ID_CLIENTES := 0;
    Datos.FDConnectionNegocio.Connected := True;
  finally
    Datos.FDTableClientes.Active := True;
  end;
end;

procedure TFClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFClientes.SpeedButtonCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFClientes.SpeedButtonEliminarClienteClick(Sender: TObject);
begin
  if ID_CLIENTES <> 0 then
  begin
    MENSAJE := MessageDlg('¿Esta Seguro De Eliminar El Cliente? - Si Elimina El Cliente Se Perderan Los Registros De Las Compras Que Haya Realizado',mtConfirmation,[mbYes, mbNo],0);
    if MENSAJE = mrYes then
    begin
      Datos.FDConnectionNegocio.StartTransaction;
      try
        with Datos.FDStoredProcEliminarClientes do
        begin
          Prepare;
          Params.ParamByName('idCli').AsInteger := ID_CLIENTES;
          ExecProc;
        end;
        Datos.FDConnectionNegocio.Commit;
        Datos.FDTableClientes.Refresh;
        ShowMessage('El Cliente Se Ha Eliminado Correctamente.');
      except
        Datos.FDConnectionNegocio.Rollback;
        raise;
      end;
    end;
  end
  else
  begin
    ShowMessage('Elija Un Cliente De La Grilla Para Eliminar.');
  end;
end;

procedure TFClientes.SpeedButtonModificarClienteClick(Sender: TObject);
begin
  if ID_CLIENTES <> 0 then
  begin
    FOpcionesClientes := TFOpcionesClientes.Create(Self);
    FOpcionesClientes.Caption := 'Modificar Un Cliente';
    with Datos.FDQuerySeleccionarCliente do
    begin
      SQL.Clear;
      SQL.Add('CALL SELECCION_CLIENTE (:idCli)');
      Params.ParamByName('idCli').AsInteger := ID_CLIENTES;
      Open;

      FOpcionesClientes.EditNombre.Text := Fields.FieldByName('nombre_cliente').AsString;
      FOpcionesClientes.EditApellido.Text := Fields.FieldByName('apellido_cliente').AsString;
      FOpcionesClientes.EditDireccion.Text := Fields.FieldByName('direccion_cliente').AsString;
    end;

    FOpcionesClientes.SpeedButtonInsertarCliente.Visible := False;
    FOpcionesClientes.SpeedButtonUpdateCliente.Visible := True;
    FOpcionesClientes.ShowModal;
  end
  else
  begin
    ShowMessage('Elija Un Cliente Para Modificar.');
  end;
end;

procedure TFClientes.SpeedButtonNuevoClienteClick(Sender: TObject);
begin
  FOpcionesClientes := TFOpcionesClientes.Create(Self);
  FOpcionesClientes.Caption := 'Insertar Nuevo Cliente';
  FOpcionesClientes.SpeedButtonUpdateCliente.Visible := False;
  FOpcionesClientes.SpeedButtonInsertarCliente.Visible := True;
  FOpcionesClientes.ShowModal;
end;

procedure TFClientes.SpeedButtonSeleccionarClienteClick(Sender: TObject);
begin
  if ID_CLIENTES <> 0 then
  begin
    with Datos.FDQuerySeleccionarCliente do
    begin
      SQL.Clear;
      SQL.Add('CALL SELECCION_CLIENTE (:idCli)');
      Params.ParamByName('idCli').AsInteger := ID_CLIENTES;
      Open;

      FVentas.EditNombre.Text := Fields.FieldByName('nombre_cliente').AsString;
      FVentas.EditApellido.Text := Fields.FieldByName('apellido_cliente').AsString;
      FVentas.EditDireccion.Text := Fields.FieldByName('direccion_cliente').AsString;
      FVentas.ID_Cliente := ID_CLIENTES;
    end;
    FClientes.Close;
  end
  else
  begin
    ShowMessage('Seleccione Un Cliente De La Grilla Para Agregar A La Factura.');
  end;
end;

end.
