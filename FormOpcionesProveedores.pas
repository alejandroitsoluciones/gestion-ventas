unit FormOpcionesProveedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls;

type
  TFOpcionesProveedores = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditNombre: TEdit;
    EditDireccion: TEdit;
    EditCuit: TEdit;
    EditTelefono: TEdit;
    SpeedButtonInsertarProveedores: TSpeedButton;
    SpeedButtonUpdateProveedores: TSpeedButton;
    SpeedButtonCerrar: TSpeedButton;
    procedure SpeedButtonCerrarClick(Sender: TObject);
    procedure SpeedButtonInsertarProveedoresClick(Sender: TObject);
    procedure SpeedButtonUpdateProveedoresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOpcionesProveedores: TFOpcionesProveedores;

implementation

{$R *.dfm}

uses MDatos, FormProveedores;

procedure TFOpcionesProveedores.SpeedButtonCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFOpcionesProveedores.SpeedButtonInsertarProveedoresClick(
  Sender: TObject);
begin
  //Verificacion de los TEdit para que no esten vacios.
  if (EditNombre.Text <> '')  and (EditDireccion.Text <> '') and (EditCuit.Text <> '') and (EditTelefono.Text <> '') then
  begin
    //Se inicia una nueva transaccion desde el FDConnection.
    //Para mas informacion. - http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Managing_Transactions_(FireDAC)
    Datos.FDConnectionNegocio.StartTransaction;
    //Inicializacion de bloque try
    try
      with Datos.FDStoredProcInsertarProveedor do
      begin
        Prepare;
        //Seteado de parametros.
        Params.ParamByName('nombre').AsString := EditNombre.Text;
        Params.ParamByName('direccion').AsString := EditDireccion.Text;
        Params.ParamByName('cuit').AsString := EditCuit.Text;
        Params.ParamByName('telefono').AsString := EditTelefono.Text;
        //Se utiliza el procedimiento ExecProc para poder ejecutar una instruccion SQL
        //de tipo INSERT que se encuentra en el procedimiento INSERTAR_PROVEEDOR
        ExecProc;
      end;
      //Se postea la transaccion.
      Datos.FDConnectionNegocio.Commit;
      //Se hace un refresh del FDTableProveedores para ver los cambios.
      Datos.FDTableProveedores.Refresh;
      //Se muestra el mensaje de que se agrego correctamente.
      ShowMessage('Se Agrego Correctamente El Proveedor.');
    except//En caso de que ocurra alguna excepción
      //Se ejecuta un Rollback para deshacer los cambios.
      Datos.FDConnectionNegocio.Rollback;
      raise;
    end;
  end
  else
  begin
    ShowMessage('Asegurese De Completar Los Campos Antes De Guardar.');
  end;
end;

procedure TFOpcionesProveedores.SpeedButtonUpdateProveedoresClick(
  Sender: TObject);
begin
  //Verificacion de los TEdit para que no esten vacios.
  if (EditNombre.Text <> '')  and (EditDireccion.Text <> '') and (EditCuit.Text <> '') and (EditTelefono.Text <> '') then
  begin
    //Se inicia una nueva transaccion desde el FDConnection.
    //Para mas informacion. - http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Managing_Transactions_(FireDAC)
    Datos.FDConnectionNegocio.StartTransaction;
    //Inicializacion de bloque try
    try
      with Datos.FDStoredProcModificarProveedor do
      begin
        Prepare;
        //Seteado de parametros.
        Params.ParamByName('nombre').AsString := EditNombre.Text;
        Params.ParamByName('direccion').AsString := EditDireccion.Text;
        Params.ParamByName('cuit').AsString := EditCuit.Text;
        Params.ParamByName('telefono').AsString := EditTelefono.Text;
        Params.ParamByName('idProv').AsInteger := FProveedores.ID_PROVEEDORES;
        //Se utiliza el procedimiento ExecProc para poder ejecutar una instruccion SQL
        //de tipo UPDATE que se encuentra en el procedimiento MODIFICAR_PROVEEDOR
        ExecProc;
      end;
      //Se postea la transaccion.
      Datos.FDConnectionNegocio.Commit;
      //Se hace un refresh del FDTableProveedores para ver los cambios.
      Datos.FDTableProveedores.Refresh;
      //Se muestra el mensaje de que se agrego correctamente.
      ShowMessage('Se Modifico Correctamente El Proveedor.');
    except//En caso de que ocurra alguna excepción
      //Se ejecuta un Rollback para deshacer los cambios.
      Datos.FDConnectionNegocio.Rollback;
      raise;
    end;
  end
  else
  begin
    ShowMessage('Asegurese De Completar Los Campos Antes De Guardar.');
  end;
end;

end.
