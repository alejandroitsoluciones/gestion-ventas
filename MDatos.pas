unit MDatos;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI;

type
  TDatos = class(TDataModule)
    FDConnectionNegocio: TFDConnection;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDQuerySesion: TFDQuery;
    FDTableProductos: TFDTable;
    DataSourceProductos: TDataSource;
    FDQueryComboBoxMarcas: TFDQuery;
    FDTableProductosid_productos: TFDAutoIncField;
    FDTableProductosnombre_producto: TStringField;
    FDTableProductosprecio_producto: TBCDField;
    FDTableProductosstock_producto: TIntegerField;
    FDTableProductosid_marcas: TIntegerField;
    FDTableProductosmarcaId: TFDAutoIncField;
    FDTableProductosnombre_marca: TStringField;
    DataSourceBuscarProducto: TDataSource;
    FDTableMarcas: TFDTable;
    DataSourceMarcas: TDataSource;
    FDQuerySeleccionEmpleado: TFDQuery;
    FDTableClientes: TFDTable;
    DataSourceClientes: TDataSource;
    FDQueryNumeroComprobante: TFDQuery;
    FDQuerySeleccionClientes: TFDQuery;
    FDQueryUltimaVenta: TFDQuery;
    FDTableClientesid_clientes: TFDAutoIncField;
    FDTableClientesnombre_cliente: TStringField;
    FDTableClientesapellido_cliente: TStringField;
    FDTableClientesdireccion_cliente: TStringField;
    FDQueryClientes: TFDQuery;
    FDQueryVentas: TFDQuery;
    FDQueryDetalles: TFDQuery;
    FDQueryClientesid_clientes: TFDAutoIncField;
    FDQueryClientesnombre_cliente: TStringField;
    FDQueryClientesapellido_cliente: TStringField;
    FDQueryClientesdireccion_cliente: TStringField;
    FDQueryVentasid_ventas: TFDAutoIncField;
    FDQueryVentasnumero_factura: TIntegerField;
    FDQueryVentasfecha_venta: TDateTimeField;
    FDQueryVentastotal_venta: TBCDField;
    FDQueryVentasid_clientes: TIntegerField;
    FDQueryVentasid_empleados: TIntegerField;
    FDQueryDetallesidpro: TFDAutoIncField;
    FDQueryDetallesnombre_producto: TStringField;
    FDQueryDetallesprecio_producto: TBCDField;
    FDQueryDetallescantidad_producto: TIntegerField;
    FDQueryDetallesid_productos: TIntegerField;
    FDQueryDetallesid_ventas: TIntegerField;
    FDQueryDetallesid_ventas_1: TIntegerField;
    FDTableEmpleados: TFDTable;
    FDTableEmpleadosid_empleados: TFDAutoIncField;
    FDTableEmpleadosnombre_empleado: TStringField;
    FDTableEmpleadosapellido_empleado: TStringField;
    FDTableEmpleadosdni_empleado: TStringField;
    FDTableEmpleadosdireccion_empleado: TStringField;
    FDTableEmpleadostelefono_empleado: TStringField;
    FDTableEmpleadosid_usuarios: TIntegerField;
    DataSourceEmpleados: TDataSource;
    FDQueryVerificacionUsuario: TFDQuery;
    FDQuerySeleccionarUsuario: TFDQuery;
    FDQuerySelectEmpleado: TFDQuery;
    FDTableProveedores: TFDTable;
    DataSourceProveedores: TDataSource;
    FDTableProveedoresid_proveedores: TFDAutoIncField;
    FDTableProveedoresnombre_proveedor: TStringField;
    FDTableProveedoresdireccion_proveedor: TStringField;
    FDTableProveedorescuit_proveedor: TStringField;
    FDTableProveedorestelefono_proveedor: TStringField;
    FDQueryStockMinimoProductos: TFDQuery;
    FDTableProductosCompras: TFDTable;
    FDTableProductosComprasid_productos: TFDAutoIncField;
    FDTableProductosComprasnombre_producto: TStringField;
    FDTableProductosComprasprecio_producto: TBCDField;
    FDTableProductosComprasstock_producto: TIntegerField;
    FDTableProductosComprasid_marcas: TIntegerField;
    FDTableProductosComprasmarcaId: TFDAutoIncField;
    FDTableProductosComprasnombre_marca: TStringField;
    DataSourceProductosCompras: TDataSource;
    FDQueryNumeroPedido: TFDQuery;
    FDQueryGuardarCompra: TFDQuery;
    FDQueryUltimaCompra: TFDQuery;
    FDQuerySeleccionProveedores: TFDQuery;
    DataSourceBuscarCliente: TDataSource;
    FDQuerySeleccionarProveedor: TFDQuery;
    FDQueryBuscarProveedor: TFDQuery;
    DataSourceBuscarProveedor: TDataSource;
    DataSourceBuscarMarcas: TDataSource;
    FDQueryBuscarEmpleado: TFDQuery;
    DataSourceBuscarEmpleados: TDataSource;
    FDStoredProcValidarIdentidad: TFDStoredProc;
    FDStoredProcCambiarClave: TFDStoredProc;
    FDStoredProcEliminarClientes: TFDStoredProc;
    FDStoredProcInsertarCliente: TFDStoredProc;
    FDStoredProcModificarCliente: TFDStoredProc;
    FDStoredProcEliminarProducto: TFDStoredProc;
    FDStoredProcInsertarProducto: TFDStoredProc;
    FDStoredProcModificarProducto: TFDStoredProc;
    FDStoredProcEliminarMarcas: TFDStoredProc;
    FDStoredProcInsertarMarca: TFDStoredProc;
    FDStoredProcModificarMarca: TFDStoredProc;
    FDQueryBuscarMarcas: TFDQuery;
    FDQueryBuscarProducto: TFDQuery;
    FDQueryBuscarCliente: TFDQuery;
    FDQuerySeleccionarMarca: TFDQuery;
    FDQuerySeleccionarProducto: TFDQuery;
    FDQuerySeleccionarCliente: TFDQuery;
    FDStoredProcEliminarProveedor: TFDStoredProc;
    FDStoredProcInsertarProveedor: TFDStoredProc;
    FDStoredProcModificarProveedor: TFDStoredProc;
    FDStoredProcEliminarEmpleado: TFDStoredProc;
    FDStoredProcInsertarUsuario: TFDStoredProc;
    FDStoredProcInsertarEmpleado: TFDStoredProc;
    FDStoredProcModificarEmpleado: TFDStoredProc;
    FDStoredProcGuardarVenta: TFDStoredProc;
    FDStoredProcGuardarDetalleVenta: TFDStoredProc;
    FDStoredProcActualizarStockVenta: TFDStoredProc;
    FDStoredProcGuardarCompra: TFDStoredProc;
    FDStoredProcGuardarDetalleCompra: TFDStoredProc;
    FDStoredProcActualizarStockCompra: TFDStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Datos: TDatos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
