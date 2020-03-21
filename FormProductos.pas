unit FormProductos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Menus;

type
  TFProductos = class(TForm)
    DBGridProductos: TDBGrid;
    EditBuscarProductos: TEdit;
    SpeedButtonNuevoProducto: TSpeedButton;
    SpeedButtonModificarProducto: TSpeedButton;
    SpeedButtonEliminarProducto: TSpeedButton;
    SpeedButtonCerrar: TSpeedButton;
    SpeedButtonSelectProducto: TSpeedButton;
    GroupBoxSearch: TGroupBox;
    GroupBoxOpciones: TGroupBox;
    MainMenuProductos: TMainMenu;
    Marcas1: TMenuItem;
    VerMarcas1: TMenuItem;
    GroupBoxReferencia: TGroupBox;
    Label1: TLabel;
    EditColor: TEdit;
    SpeedButtonSeleccionarProductoCompras: TSpeedButton;
    DBGridProductosCompras: TDBGrid;
    procedure SpeedButtonNuevoProductoClick(Sender: TObject);
    procedure DBGridProductosCellClick(Column: TColumn);
    procedure SpeedButtonModificarProductoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButtonCerrarClick(Sender: TObject);
    procedure SpeedButtonEliminarProductoClick(Sender: TObject);
    procedure EditBuscarProductosChange(Sender: TObject);
    procedure DBGridProductosTitleClick(Column: TColumn);
    procedure VerMarcas1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonSelectProductoClick(Sender: TObject);
    procedure DBGridProductosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButtonSeleccionarProductoComprasClick(Sender: TObject);
    procedure DBGridProductosComprasCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_PRODUCTOS : Integer;
    MENSAJE : Integer;
  end;

var
  FProductos: TFProductos;

implementation

{$R *.dfm}

uses MDatos, FormOpcionesProductos, FormMarcas, FormCantidad, FormVentas,
  FormCompras, FormCantidadCompras;

procedure TFProductos.DBGridProductosCellClick(Column: TColumn);
begin
  if EditBuscarProductos.Text = '' then
  begin
    with Datos.FDTableProductos do
    begin
      ID_PRODUCTOS := Fields.FieldByName('id_productos').AsInteger;
    end;
    DBGridProductos.DataSource := Datos.DataSourceProductos;
  end
  else
  begin
    with Datos.FDQueryBuscarProducto do
    begin
      ID_PRODUCTOS := Fields.FieldByName('id_productos').AsInteger;
    end;
    DBGridProductos.DataSource := Datos.DataSourceBuscarProducto;
  end;
end;


procedure TFProductos.DBGridProductosComprasCellClick(Column: TColumn);
begin
  with Datos.FDTableProductosCompras do
  begin
    ID_PRODUCTOS := Fields.FieldByName('id_productos').AsInteger;
  end;
end;

procedure TFProductos.DBGridProductosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  I : Integer;
begin
  //Se consulta la vista creada llamada sis_productos_compras,
  //para saber el stock minimo de productos.
  with Datos.FDQueryStockMinimoProductos do
  begin
    SQL.Clear;
    //Llamado al metodo Open para ejecutar una consulta SELECT
    Open('SELECT * FROM sis_productos_compras');
  end;
  //Se recorre el resultado de la consulta, desde I = 1 hasta la cantidad de
  //registros obtenidos en la vista.
  for I := 1 to Datos.FDQueryStockMinimoProductos.RecordCount do
  begin
    //Si el stock_producto es mayor que 1 y menor que 100 entonces.
    if (Datos.FDTableProductos.Fields.FieldByName('stock_producto').AsInteger > 1)
    and (Datos.FDTableProductos.Fields.FieldByName('stock_producto').AsInteger < 20) then
    begin
      //Cambio de color a la fila del DBGridProductos.
      DBGridProductos.Canvas.Brush.Color := clRed;//Seteado de color Rojo.
    end;
    //
    Datos.FDQueryStockMinimoProductos.Next;
  end;
  //Parametros del DrawColumnCell del DBGridProductos para poder ver el color.
  DBGridProductos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFProductos.DBGridProductosTitleClick(Column: TColumn);
begin
  //Procedimientos para ordenar los registros al hacer clic en el titulo de del
  //DBGridProductos
  if Datos.FDTableProductos.IndexFieldNames = Column.FieldName then
  begin
    Datos.FDTableProductos.IndexFieldNames := Column.FieldName + ':D';
  end
  else
  begin
    Datos.FDTableProductos.IndexFieldNames := Column.FieldName;
  end;
end;

procedure TFProductos.EditBuscarProductosChange(Sender: TObject);
begin
  //Si el TEdit esta vacio, entonces.
  if EditBuscarProductos.Text = '' then
  begin
    //Seteado de DataSource de DBGridProductos -> DataSourceProductos que esta
    //vinculado con el FDTableProductos.
    DBGridProductos.DataSource := Datos.DataSourceProductos;
  end
  else
  begin
    with Datos.FDQueryBuscarProducto do
    begin
      SQL.Clear;
      SQL.Add('CALL BUSCAR_PRODUCTO (:nombre_pro)');
      //Seteado de parametro NOMBREPRO.
      Params.ParamByName('nombre_pro').AsString := '%'+EditBuscarProductos.Text+'%';
      //Se llama al metodo Open del FDStoredProc para ejecutar una consulta SELECT que
      //se encuentra en el procedimiento BUSCAR_PRODUCTO.
      Open;
    end;
    //Seteado de DataSource de DBGridProductos -> DataSourceBuscarProducto que esta
    //vinculado al FDQueryBuscarProducto.
    DBGridProductos.DataSource := Datos.DataSourceBuscarProducto;
  end;
end;

procedure TFProductos.FormActivate(Sender: TObject);
begin
  try
    //Inicializacion de variable ID_PRODUCTOS.
    ID_PRODUCTOS := 0;
    Datos.FDConnectionNegocio.Connected := True;    
  finally
    Datos.FDTableProductos.Active := True;
    Datos.FDTableProductosCompras.Active := True;
  end;
end;

procedure TFProductos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Se setea el Action para liberar de memoria del Formulario cuando se cierra.
  Action := caFree;
end;

procedure TFProductos.SpeedButtonCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFProductos.SpeedButtonEliminarProductoClick(Sender: TObject);
begin
  //Pregunta si se ha seleccionado un producto.
  if ID_PRODUCTOS <> 0 then
  begin
    //Se Muestra Mensaje.
    MENSAJE := MessageDlg('¿Esta Seguro De Eliminar El Producto? - Si Elimina El Producto Se Perdera El Registro En El Detalle De Ventas y De Compras',mtConfirmation,[mbYes, mbNo],0);
    //Si el modalResult es Yes entonces.
    if MENSAJE = mrYes then
    begin
      //Se inicia una nueva transaccion desde el FDConnection.
      //Para mas informacion. - http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Managing_Transactions_(FireDAC)
      Datos.FDConnectionNegocio.StartTransaction;
      //Inicializacion de bloque try
      try
        with Datos.FDStoredProcEliminarProducto do
        begin
          Prepare;
          //Seteado de parametro para eliminar.
          Params.ParamByName('ID').AsInteger := ID_PRODUCTOS;
          //Se utiliza el procedimiento ExecProc para poder ejecutar una instruccion SQL
          //de tipo DELETE que se encuentra en el procedimiento ELIMINAR_PRODUCTO
          ExecProc;
        end;
        //Se postea la transaccion.
        Datos.FDConnectionNegocio.Commit;
        //Se hace un refresh del FDTableProductos para ver los cambios.
        Datos.FDTableProductos.Refresh;
        //Se muestra un mensaje de que se elimino correctamente.
        ShowMessage('El Producto Se Ha Eliminado Correctamente.');
      except//En caso de que ocurra alguna excepción
        //Se ejecuta un Rollback para deshacer los cambios.
        Datos.FDConnectionNegocio.Rollback;
        raise;
      end;
    end;
  end
  else
  begin
    ShowMessage('Elija Un Producto De La Grilla Para Eliminar.');
  end;
end;

procedure TFProductos.SpeedButtonModificarProductoClick(Sender: TObject);
begin
  //Pregunta si se ha seleccionado un producto.
  if ID_PRODUCTOS <> 0 then
  begin
    //Se instancia el fomulario de Opciones de Productos.
    FOpcionesProductos := TFOpcionesProductos.Create(Self);
    //Seteado de Caption de FOpcionesProductos.
    FOpcionesProductos.Caption := 'Modificar Producto';
    //Se coloca como visible el boton Update y se oculta el boton Insert
    //Para evitar que se produzca un error.
    FOpcionesProductos.SpeedButtonUpdateProductos.Visible := True;
    FOpcionesProductos.SpeedButtonInsertProducto.Visible := False;
    //--------------------------------------------------------------------------
    with Datos.FDQuerySeleccionarProducto do
    begin
      SQL.Clear;
      SQL.Add('CALL SELECCION_PRODUCTO (:idPro)');
      Params.ParamByName('idPro').AsInteger := ID_PRODUCTOS;
      //Se llama al metodo Open del FDStoredProc para ejecutar una consulta SELECT que
      //se encuentra en el procedimiento SELECCION_PRODUCTO
      Open;
      //Se setean los componentes del FOpcionesProductos "TEdit, TComboBox".
      FOpcionesProductos.EditNombrePro.Text := Fields.FieldByName('nombre_producto').AsString;
      FOpcionesProductos.EditPrecioPro.Text := FloatToStr(Fields.FieldByName('precio_producto').AsFloat);
      FOpcionesProductos.EditStockPro.Text := IntToStr(Fields.FieldByName('stock_producto').AsInteger);
      FOpcionesProductos.ID_MARCA := Fields.FieldByName('id_marcas').AsInteger;
    end;
    //Se llama el procedimiento para llenar el ComboBox para que pueda seleccionar
    //una marca distinta a la actual.
    FOpcionesProductos.llenarComboBox;
    //Se coloca el valor de ID_MARCA al ItemIndex.
    //IMPORTANTE - Se le resta -1 a ID_MARCA porque el ComboBox toma sus Items
    //como un Array dinamico que va desde 0 hasta n-1.
    FOpcionesProductos.ComboBoxMarca.ItemIndex := FOpcionesProductos.ID_MARCA - 1;
    //Se muestra el FOpcionesProductos.
    FOpcionesProductos.ShowModal;
    //Funciona Correctamente.
  end
  else
  begin
    ShowMessage('Seleccione Un Producto De La Grilla Para Modificar.');
    //Funciona.
  end;
end;

procedure TFProductos.SpeedButtonNuevoProductoClick(Sender: TObject);
begin
  //Instancia de FOpcionesProductos.
  FOpcionesProductos := TFOpcionesProductos.Create(Self);
  //Seteado de Caption de FOpcionesProductos.
  FOpcionesProductos.Caption := 'Nuevo Producto';
  //Llamado al procedimiento llenarComboBox que se encuentra implementando en FOpcionesProductos
  FOpcionesProductos.llenarComboBox;
  //Oculto el boton para actualizar y dejo a la vista el boton insertar.
  FOpcionesProductos.SpeedButtonUpdateProductos.Visible := False;
  //Muestro el FOpcionesProductos.
  FOpcionesProductos.ShowModal;
end;

procedure TFProductos.SpeedButtonSeleccionarProductoComprasClick(
  Sender: TObject);
begin
  //Se evalua si se selecciono el producto de la grilla.
  if ID_PRODUCTOS <> 0 then
  begin
    //Se realiza la consulta para extraer los datos del producto seleccionado.
    with Datos.FDQuerySeleccionarProducto do
    begin
      SQL.Clear;
      SQL.Add('CALL SELECCION_PRODUCTO (:idPro)');
      //Seteado de parametro IDPRODUCTO
      Params.ParamByName('idPro').AsInteger := ID_PRODUCTOS;
      //Se llama al metodo Open del FDStoredProc para ejecutar una consulta SELECT que
      //se encuentra en el procedimiento SELECCION_PRODUCTO
      Open;
      //Se instancia el FCantidadCompras para guardar la cantidad de productos.
      FCantidadCompras := TFCantidadCompras.Create(Self);
      //Se muestra FCantidadCompras
      FCantidadCompras.ShowModal;
      //Seteado del StringGrid que esta en FCompras que contiene el detalle del pedido (Compras.)
      FCompras.StringGridDetalleCompra.Cells[0,FCompras.StringGridDetalleCompra.RowCount - 1] := IntToStr(Fields.FieldByName('id_productos').AsInteger);
      FCompras.StringGridDetalleCompra.Cells[1,FCompras.StringGridDetalleCompra.RowCount - 1] := Fields.FieldByName('nombre_producto').AsString;
      FCompras.StringGridDetalleCompra.Cells[2,FCompras.StringGridDetalleCompra.RowCount - 1] := CurrToStr(Fields.FieldByName('precio_producto').AsCurrency);
      FCompras.StringGridDetalleCompra.Cells[3,FCompras.StringGridDetalleCompra.RowCount - 1] := IntToStr(FCantidadCompras.CantidadCompras);
      //Agregar otra fila al StringGrid despues de agregar el producto anterior.
      FCompras.StringGridDetalleCompra.RowCount := FCompras.StringGridDetalleCompra.RowCount + 1;
      //Se hace un click en el boton SpeedButtonCalcularTotal para calcular automaticamente el subtotal de la Compra
      FCompras.SpeedButtonCalcularTotal.Click;
      //Se Cierra el FProductos
      FProductos.Close;
    end;
  end
  else
  begin
    ShowMessage('Seleccione Un Producto Para Añadir Al Detalle Del Pedido.');
  end;
end;

procedure TFProductos.SpeedButtonSelectProductoClick(Sender: TObject);
begin
  //Se evalua si se selecciono el producto de la grilla.
  if ID_PRODUCTOS <> 0 then
  begin
    //Se realiza la consulta para extraer los datos del producto seleccionado.
    with Datos.FDQuerySeleccionarProducto do
    begin
      SQL.Clear;
      SQL.Add('CALL SELECCION_PRODUCTO (:idPro)');
      //Seteado de parametro IDPRODUCTO
      Params.ParamByName('idPro').AsInteger := ID_PRODUCTOS;
      //Se llama al metodo Open del FDStoredProc para ejecutar una consulta SELECT que
      //se encuentra en el procedimiento SELECCION_PRODUCTO
      Open;
      //Se instancia el FCantidad para guardar la cantidad de productos.
      FCantidad := TFCantidad.Create(Self);
      //Se muestra el FCantidad.
      FCantidad.ShowModal;
      //Seteado del StringGrid que esta en FVentas que contiene el detalle de la venta (Ventas).
      FVentas.StringGrid.Cells[0,FVentas.StringGrid.RowCount - 1] := IntToStr(Fields.FieldByName('id_productos').AsInteger);
      FVentas.StringGrid.Cells[1,FVentas.StringGrid.RowCount - 1] := Fields.FieldByName('nombre_producto').AsString;
      FVentas.StringGrid.Cells[2,FVentas.StringGrid.RowCount - 1] := CurrToStr(Fields.FieldByName('precio_producto').AsCurrency);
      FVentas.StringGrid.Cells[3,FVentas.StringGrid.RowCount - 1] := IntToStr(FCantidad.Cantidad);
      //Agregar otra fila al StringGrid despues de agregar el producto anterior.
      FVentas.StringGrid.RowCount := FVentas.StringGrid.RowCount + 1;
      //Se hace un click en el boton SpeedButtonCalcularTotal para calcular automaticamente el subtotal de la Venta
      FVentas.SpeedButtonCalcularTotal.Click;
      //Se Cierra el FProductos
      FProductos.Close;
    end;
  end
  else
  begin
    ShowMessage('Seleccione Un Producto Para Añadir Al Detalle De Factura.');
  end;
end;

procedure TFProductos.VerMarcas1Click(Sender: TObject);
begin
  //Se instancia FMarcas
  FMarcas := TFMarcas.Create(Self);
  //Se muestra FMarcas.
  FMarcas.ShowModal;
end;

end.
