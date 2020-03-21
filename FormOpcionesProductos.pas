unit FormOpcionesProductos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls;

type
  TFOpcionesProductos = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditNombrePro: TEdit;
    EditPrecioPro: TEdit;
    EditStockPro: TEdit;
    ComboBoxMarca: TComboBox;
    SpeedButtonInsertProducto: TSpeedButton;
    SpeedButtonUpdateProductos: TSpeedButton;
    SpeedButtonCerrar: TSpeedButton;
    procedure llenarComboBox();
    procedure SpeedButtonInsertProductoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBoxMarcaSelect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonUpdateProductosClick(Sender: TObject);
    procedure SpeedButtonCerrarClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    ID_MARCA : Integer;
  end;

var
  FOpcionesProductos: TFOpcionesProductos;

implementation

{$R *.dfm}

uses MDatos, FormProductos;

{ TFOpcionesProductos }

procedure TFOpcionesProductos.ComboBoxMarcaSelect(Sender: TObject);
begin
  ID_MARCA := ComboBoxMarca.ItemIndex + 1;
end;

procedure TFOpcionesProductos.FormActivate(Sender: TObject);
begin
  ID_MARCA := 0;
end;

procedure TFOpcionesProductos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ID_MARCA := 0;
end;

procedure TFOpcionesProductos.llenarComboBox;
begin
  Datos.FDQueryComboBoxMarcas.SQL.Clear;
  Datos.FDQueryComboBoxMarcas.SQL.Add('SELECT * FROM marcas');
  Datos.FDQueryComboBoxMarcas.Open();
  while not Datos.FDQueryComboBoxMarcas.Eof do
  begin
    with Datos.FDQueryComboBoxMarcas do
    begin
      ComboBoxMarca.Items.Add(Fields.FieldByName('nombre_marca').AsString);
    end;
    Datos.FDQueryComboBoxMarcas.Next;
  end;
end;

procedure TFOpcionesProductos.SpeedButtonCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFOpcionesProductos.SpeedButtonInsertProductoClick(Sender: TObject);
begin
  //Se validan los componentes TEdit y la variable ID_MARCA para poder insertar
  //Un registro en la tabla Productos.
  if (EditNombrePro.Text <> '') and (EditPrecioPro.Text <> '') and (EditStockPro.Text <> '') and (ID_MARCA <> 0) then
  begin
    //Se inicia una nueva transaccion.
    Datos.FDConnectionNegocio.StartTransaction;
    // INICIO - BLOQUE TRY
    try
      with Datos.FDStoredProcInsertarProducto do
      begin
        Prepare;
        //Seteado de Parametros para poder ejecutar el procedimiento almacenado.
        Params.ParamByName('nombre_pro').AsString := EditNombrePro.Text;
        Params.ParamByName('precio_pro').AsFloat := StrToFloat(EditPrecioPro.Text);
        Params.ParamByName('stock_pro').AsInteger := StrToInt(EditStockPro.Text);
        Params.ParamByName('fk_marca').AsInteger := ID_MARCA;
        ExecProc;
      end;
      //Se guardan los datos en la base de datos utilizando el Commit de la transaccion.
      Datos.FDConnectionNegocio.Commit;
      //Se realiza un Refresh de la tabla Productos para mostrar el producto insertado.
      Datos.FDTableProductos.Refresh;
      //Se muestra mensaje.
      ShowMessage('El Producto Se Inserto Correctamente.');
    except
      //En caso de algun error se utiliza un Rollback.
      Datos.FDConnectionNegocio.Rollback;
      raise;
    end;
  end
  else
  begin
    ShowMessage('Antes De Guardar, Asegurese De Completar Todos Los Campos.');
  end;
end;

procedure TFOpcionesProductos.SpeedButtonUpdateProductosClick(Sender: TObject);
begin
  //Se validan los componentes TEdit y la variable ID_MARCA para poder insertar
  //Un registro en la tabla Productos.
  if (EditNombrePro.Text <> '') and (EditPrecioPro.Text <> '') and (EditStockPro.Text <> '') and (ID_MARCA <> 0) then
  begin
    //Se inicia una nueva transaccion.
    Datos.FDConnectionNegocio.StartTransaction;
    // INICIO - BLOQUE TRY
    try
      with Datos.FDStoredProcModificarProducto do
      begin
        Prepare;
        //Seteado de Parametros para poder ejecutar el procedimiento almacenado.
        Params.ParamByName('nombre_pro').AsString := EditNombrePro.Text;
        Params.ParamByName('precio_pro').AsFloat := StrToFloat(EditPrecioPro.Text);
        Params.ParamByName('stock_pro').AsInteger := StrToInt(EditStockPro.Text);
        Params.ParamByName('fk_marca').AsInteger := ID_MARCA;
        Params.ParamByName('idPro').AsInteger := FProductos.ID_PRODUCTOS;
        //Se ejecuta el procedimiento.
        ExecProc;
      end;
      //Se guardan los datos en la base de datos utilizando el Commit de la transaccion.
      Datos.FDConnectionNegocio.Commit;
      //Se realiza un Refresh de la tabla Productos para mostrar el producto insertado.
      Datos.FDTableProductos.Refresh;
      //Se muestra mensaje.
      ShowMessage('El Producto Se Actualizo Correctamente.');
    except
      //En caso de algun error se utiliza un Rollback.
      Datos.FDConnectionNegocio.Rollback;
      raise;
    end;
  end
  else
  begin
    ShowMessage('Asegurese De Completar Todos Los Campos.');
  end;
end;

end.
