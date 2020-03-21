object Datos: TDatos
  OldCreateOrder = False
  Height = 367
  Width = 834
  object FDConnectionNegocio: TFDConnection
    Params.Strings = (
      'Database=negocio'
      'User_Name=root'
      'Password=p4$$w0rd'
      'Server=localhost'
      'DriverID=FDPhysMySQL')
    LoginPrompt = False
    Left = 48
    Top = 16
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 128
  end
  object FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink
    DriverID = 'FDPhysMySQL'
    VendorLib = 'C:\Program Files (x86)\MySQL\MySQL Server 5.7\lib\libmysql.dll'
    Left = 48
    Top = 72
  end
  object FDQuerySesion: TFDQuery
    Connection = FDConnectionNegocio
    SQL.Strings = (
      'SELECT * FROM usuarios WHERE usuarios.usuario = :USUARIO'
      'AND usuarios.clave = :CLAVE')
    Left = 48
    Top = 184
    ParamData = <
      item
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        Name = 'CLAVE'
        ParamType = ptInput
      end>
  end
  object FDTableProductos: TFDTable
    Connection = FDConnectionNegocio
    UpdateOptions.UpdateTableName = 'negocio.sis_productos'
    TableName = 'negocio.sis_productos'
    Left = 96
    Top = 16
    object FDTableProductosid_productos: TFDAutoIncField
      FieldName = 'id_productos'
      Origin = 'id_productos'
      ReadOnly = True
    end
    object FDTableProductosnombre_producto: TStringField
      FieldName = 'nombre_producto'
      Origin = 'nombre_producto'
      Required = True
      Size = 50
    end
    object FDTableProductosprecio_producto: TBCDField
      FieldName = 'precio_producto'
      Origin = 'precio_producto'
      Required = True
      Precision = 8
      Size = 2
    end
    object FDTableProductosstock_producto: TIntegerField
      FieldName = 'stock_producto'
      Origin = 'stock_producto'
      Required = True
    end
    object FDTableProductosid_marcas: TIntegerField
      FieldName = 'id_marcas'
      Origin = 'id_marcas'
      Required = True
    end
    object FDTableProductosmarcaId: TFDAutoIncField
      FieldName = 'marcaId'
      Origin = 'marcaId'
      ReadOnly = True
    end
    object FDTableProductosnombre_marca: TStringField
      FieldName = 'nombre_marca'
      Origin = 'nombre_marca'
      Required = True
      Size = 50
    end
  end
  object DataSourceProductos: TDataSource
    DataSet = FDTableProductos
    Left = 96
    Top = 72
  end
  object FDQueryComboBoxMarcas: TFDQuery
    Connection = FDConnectionNegocio
    Left = 96
    Top = 128
  end
  object DataSourceBuscarProducto: TDataSource
    DataSet = FDQueryBuscarProducto
    Left = 144
    Top = 16
  end
  object FDTableMarcas: TFDTable
    IndexFieldNames = 'id_marcas'
    Connection = FDConnectionNegocio
    UpdateOptions.UpdateTableName = 'negocio.marcas'
    TableName = 'negocio.marcas'
    Left = 144
    Top = 72
  end
  object DataSourceMarcas: TDataSource
    DataSet = FDTableMarcas
    Left = 144
    Top = 128
  end
  object FDQuerySeleccionEmpleado: TFDQuery
    Connection = FDConnectionNegocio
    Left = 192
    Top = 16
  end
  object FDTableClientes: TFDTable
    IndexFieldNames = 'id_clientes'
    Connection = FDConnectionNegocio
    UpdateOptions.UpdateTableName = 'negocio.clientes'
    TableName = 'negocio.clientes'
    Left = 192
    Top = 72
    object FDTableClientesid_clientes: TFDAutoIncField
      DisplayWidth = 10
      FieldName = 'id_clientes'
      Origin = 'id_clientes'
      ReadOnly = True
    end
    object FDTableClientesnombre_cliente: TStringField
      DisplayWidth = 22
      FieldName = 'nombre_cliente'
      Origin = 'nombre_cliente'
      Required = True
      Size = 50
    end
    object FDTableClientesapellido_cliente: TStringField
      DisplayWidth = 26
      FieldName = 'apellido_cliente'
      Origin = 'apellido_cliente'
      Required = True
      Size = 50
    end
    object FDTableClientesdireccion_cliente: TStringField
      DisplayWidth = 31
      FieldName = 'direccion_cliente'
      Origin = 'direccion_cliente'
      Required = True
      Size = 50
    end
  end
  object DataSourceClientes: TDataSource
    DataSet = FDTableClientes
    Left = 192
    Top = 128
  end
  object FDQueryNumeroComprobante: TFDQuery
    Connection = FDConnectionNegocio
    Left = 96
    Top = 184
  end
  object FDQuerySeleccionClientes: TFDQuery
    Connection = FDConnectionNegocio
    Left = 96
    Top = 240
  end
  object FDQueryUltimaVenta: TFDQuery
    Connection = FDConnectionNegocio
    Left = 288
    Top = 296
  end
  object FDQueryClientes: TFDQuery
    Connection = FDConnectionNegocio
    SQL.Strings = (
      '')
    Left = 240
    Top = 16
    object FDQueryClientesid_clientes: TFDAutoIncField
      FieldName = 'id_clientes'
      Origin = 'id_clientes'
      ReadOnly = True
    end
    object FDQueryClientesnombre_cliente: TStringField
      FieldName = 'nombre_cliente'
      Origin = 'nombre_cliente'
      Required = True
      Size = 50
    end
    object FDQueryClientesapellido_cliente: TStringField
      FieldName = 'apellido_cliente'
      Origin = 'apellido_cliente'
      Required = True
      Size = 50
    end
    object FDQueryClientesdireccion_cliente: TStringField
      FieldName = 'direccion_cliente'
      Origin = 'direccion_cliente'
      Required = True
      Size = 50
    end
  end
  object FDQueryVentas: TFDQuery
    Connection = FDConnectionNegocio
    SQL.Strings = (
      '')
    Left = 240
    Top = 72
    object FDQueryVentasid_ventas: TFDAutoIncField
      FieldName = 'id_ventas'
      Origin = 'id_ventas'
      ReadOnly = True
    end
    object FDQueryVentasnumero_factura: TIntegerField
      FieldName = 'numero_factura'
      Origin = 'numero_factura'
      Required = True
    end
    object FDQueryVentasfecha_venta: TDateTimeField
      FieldName = 'fecha_venta'
      Origin = 'fecha_venta'
      Required = True
    end
    object FDQueryVentastotal_venta: TBCDField
      FieldName = 'total_venta'
      Origin = 'total_venta'
      Required = True
      Precision = 8
      Size = 2
    end
    object FDQueryVentasid_clientes: TIntegerField
      FieldName = 'id_clientes'
      Origin = 'id_clientes'
      Required = True
    end
    object FDQueryVentasid_empleados: TIntegerField
      FieldName = 'id_empleados'
      Origin = 'id_empleados'
      Required = True
    end
  end
  object FDQueryDetalles: TFDQuery
    Connection = FDConnectionNegocio
    SQL.Strings = (
      '')
    Left = 240
    Top = 128
    object FDQueryDetallesidpro: TFDAutoIncField
      FieldName = 'idpro'
      Origin = 'id_productos'
      ReadOnly = True
    end
    object FDQueryDetallesnombre_producto: TStringField
      FieldName = 'nombre_producto'
      Origin = 'nombre_producto'
      Required = True
      Size = 50
    end
    object FDQueryDetallesprecio_producto: TBCDField
      FieldName = 'precio_producto'
      Origin = 'precio_producto'
      Required = True
      Precision = 8
      Size = 2
    end
    object FDQueryDetallescantidad_producto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cantidad_producto'
      Origin = 'cantidad_producto'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDetallesid_productos: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_productos'
      Origin = 'id_productos'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDetallesid_ventas: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_ventas'
      Origin = 'id_ventas'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryDetallesid_ventas_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_ventas_1'
      Origin = 'id_ventas'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object FDTableEmpleados: TFDTable
    IndexFieldNames = 'id_empleados'
    Connection = FDConnectionNegocio
    UpdateOptions.UpdateTableName = 'negocio.empleados'
    TableName = 'negocio.empleados'
    Left = 288
    Top = 16
    object FDTableEmpleadosid_empleados: TFDAutoIncField
      FieldName = 'id_empleados'
      Origin = 'id_empleados'
      ReadOnly = True
    end
    object FDTableEmpleadosnombre_empleado: TStringField
      FieldName = 'nombre_empleado'
      Origin = 'nombre_empleado'
      Required = True
      Size = 50
    end
    object FDTableEmpleadosapellido_empleado: TStringField
      FieldName = 'apellido_empleado'
      Origin = 'apellido_empleado'
      Required = True
      Size = 50
    end
    object FDTableEmpleadosdni_empleado: TStringField
      FieldName = 'dni_empleado'
      Origin = 'dni_empleado'
      Required = True
      Size = 15
    end
    object FDTableEmpleadosdireccion_empleado: TStringField
      FieldName = 'direccion_empleado'
      Origin = 'direccion_empleado'
      Required = True
      Size = 50
    end
    object FDTableEmpleadostelefono_empleado: TStringField
      FieldName = 'telefono_empleado'
      Origin = 'telefono_empleado'
      Required = True
      Size = 15
    end
    object FDTableEmpleadosid_usuarios: TIntegerField
      FieldName = 'id_usuarios'
      Origin = 'id_usuarios'
      Required = True
    end
  end
  object DataSourceEmpleados: TDataSource
    DataSet = FDTableEmpleados
    Left = 288
    Top = 72
  end
  object FDQueryVerificacionUsuario: TFDQuery
    Connection = FDConnectionNegocio
    Left = 288
    Top = 128
  end
  object FDQuerySeleccionarUsuario: TFDQuery
    Connection = FDConnectionNegocio
    Left = 192
    Top = 184
  end
  object FDQuerySelectEmpleado: TFDQuery
    Connection = FDConnectionNegocio
    Left = 192
    Top = 240
  end
  object FDTableProveedores: TFDTable
    IndexFieldNames = 'id_proveedores'
    Connection = FDConnectionNegocio
    UpdateOptions.UpdateTableName = 'negocio.proveedores'
    TableName = 'negocio.proveedores'
    Left = 336
    Top = 16
    object FDTableProveedoresid_proveedores: TFDAutoIncField
      FieldName = 'id_proveedores'
      Origin = 'id_proveedores'
      ReadOnly = True
    end
    object FDTableProveedoresnombre_proveedor: TStringField
      FieldName = 'nombre_proveedor'
      Origin = 'nombre_proveedor'
      Required = True
      Size = 50
    end
    object FDTableProveedoresdireccion_proveedor: TStringField
      FieldName = 'direccion_proveedor'
      Origin = 'direccion_proveedor'
      Required = True
      Size = 50
    end
    object FDTableProveedorescuit_proveedor: TStringField
      FieldName = 'cuit_proveedor'
      Origin = 'cuit_proveedor'
      Required = True
      Size = 15
    end
    object FDTableProveedorestelefono_proveedor: TStringField
      FieldName = 'telefono_proveedor'
      Origin = 'telefono_proveedor'
      Required = True
      Size = 15
    end
  end
  object DataSourceProveedores: TDataSource
    DataSet = FDTableProveedores
    Left = 336
    Top = 72
  end
  object FDQueryStockMinimoProductos: TFDQuery
    Connection = FDConnectionNegocio
    Left = 336
    Top = 128
  end
  object FDTableProductosCompras: TFDTable
    Connection = FDConnectionNegocio
    UpdateOptions.UpdateTableName = 'negocio.sis_productos_compras'
    TableName = 'negocio.sis_productos_compras'
    Left = 240
    Top = 184
    object FDTableProductosComprasid_productos: TFDAutoIncField
      FieldName = 'id_productos'
      Origin = 'id_productos'
      ReadOnly = True
    end
    object FDTableProductosComprasnombre_producto: TStringField
      FieldName = 'nombre_producto'
      Origin = 'nombre_producto'
      Required = True
      Size = 50
    end
    object FDTableProductosComprasprecio_producto: TBCDField
      FieldName = 'precio_producto'
      Origin = 'precio_producto'
      Required = True
      Precision = 8
      Size = 2
    end
    object FDTableProductosComprasstock_producto: TIntegerField
      FieldName = 'stock_producto'
      Origin = 'stock_producto'
      Required = True
    end
    object FDTableProductosComprasid_marcas: TIntegerField
      FieldName = 'id_marcas'
      Origin = 'id_marcas'
      Required = True
    end
    object FDTableProductosComprasmarcaId: TFDAutoIncField
      FieldName = 'marcaId'
      Origin = 'marcaId'
      ReadOnly = True
    end
    object FDTableProductosComprasnombre_marca: TStringField
      FieldName = 'nombre_marca'
      Origin = 'nombre_marca'
      Required = True
      Size = 50
    end
  end
  object DataSourceProductosCompras: TDataSource
    DataSet = FDTableProductosCompras
    Left = 240
    Top = 240
  end
  object FDQueryNumeroPedido: TFDQuery
    Connection = FDConnectionNegocio
    Left = 336
    Top = 184
  end
  object FDQueryGuardarCompra: TFDQuery
    Connection = FDConnectionNegocio
    Left = 336
    Top = 240
  end
  object FDQueryUltimaCompra: TFDQuery
    Connection = FDConnectionNegocio
    Left = 336
    Top = 296
  end
  object FDQuerySeleccionProveedores: TFDQuery
    Connection = FDConnectionNegocio
    Left = 384
    Top = 16
  end
  object DataSourceBuscarCliente: TDataSource
    DataSet = FDQueryBuscarCliente
    Left = 384
    Top = 240
  end
  object FDQuerySeleccionarProveedor: TFDQuery
    Connection = FDConnectionNegocio
    Left = 384
    Top = 128
  end
  object FDQueryBuscarProveedor: TFDQuery
    Connection = FDConnectionNegocio
    Left = 288
    Top = 240
  end
  object DataSourceBuscarProveedor: TDataSource
    DataSet = FDQueryBuscarProveedor
    Left = 384
    Top = 184
  end
  object DataSourceBuscarMarcas: TDataSource
    DataSet = FDQueryBuscarMarcas
    Left = 384
    Top = 296
  end
  object FDQueryBuscarEmpleado: TFDQuery
    Connection = FDConnectionNegocio
    Left = 384
    Top = 72
  end
  object DataSourceBuscarEmpleados: TDataSource
    DataSet = FDQueryBuscarEmpleado
    Left = 288
    Top = 184
  end
  object FDStoredProcValidarIdentidad: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.VALIDAR_IDENTIDAD'
    Left = 48
    Top = 240
    ParamData = <
      item
        Position = 1
        Name = 'dni'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end>
  end
  object FDStoredProcCambiarClave: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.MODIFICAR_CLAVE'
    Left = 48
    Top = 296
    ParamData = <
      item
        Position = 1
        Name = 'idUser'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'clave'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end>
  end
  object FDStoredProcEliminarClientes: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.ELIMINAR_CLIENTE'
    Left = 432
    Top = 16
    ParamData = <
      item
        Position = 1
        Name = 'idCli'
        ParamType = ptInput
      end>
  end
  object FDStoredProcInsertarCliente: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.INSERTAR_CLIENTE'
    Left = 432
    Top = 184
    ParamData = <
      item
        Position = 1
        Name = 'nombre'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 2
        Name = 'apellido'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 3
        Name = 'direccion'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end>
  end
  object FDStoredProcModificarCliente: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.MODIFICAR_CLIENTE'
    Left = 432
    Top = 240
    ParamData = <
      item
        Position = 1
        Name = 'nombre'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 2
        Name = 'apellido'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 3
        Name = 'direccion'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 4
        Name = 'idCli'
        ParamType = ptInput
      end>
  end
  object FDStoredProcEliminarProducto: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.ELIMINAR_PRODUCTO'
    Left = 480
    Top = 128
    ParamData = <
      item
        Position = 1
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object FDStoredProcInsertarProducto: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.INSERTAR_PRODUCTO'
    Left = 480
    Top = 16
    ParamData = <
      item
        Position = 1
        Name = 'nombre_pro'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 2
        Name = 'precio_pro'
        DataType = ftBCD
        Precision = 8
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'stock_pro'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'fk_marca'
        ParamType = ptInput
      end>
  end
  object FDStoredProcModificarProducto: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.MODIFICAR_PRODUCTO'
    Left = 480
    Top = 240
    ParamData = <
      item
        Position = 1
        Name = 'nombre_pro'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 2
        Name = 'precio_pro'
        DataType = ftBCD
        Precision = 8
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'stock_pro'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'fk_marca'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'idPro'
        ParamType = ptInput
      end>
  end
  object FDStoredProcEliminarMarcas: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.ELIMINAR_MARCA'
    Left = 528
    Top = 128
    ParamData = <
      item
        Position = 1
        Name = 'idMar'
        ParamType = ptInput
      end>
  end
  object FDStoredProcInsertarMarca: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.INSERTAR_MARCA'
    Left = 144
    Top = 296
    ParamData = <
      item
        Position = 1
        Name = 'nombre_marca'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end>
  end
  object FDStoredProcModificarMarca: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.MODIFICAR_MARCA'
    Left = 528
    Top = 16
    ParamData = <
      item
        Position = 1
        Name = 'marca'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 2
        Name = 'idMar'
        ParamType = ptInput
      end>
  end
  object FDQueryBuscarMarcas: TFDQuery
    Connection = FDConnectionNegocio
    Left = 432
    Top = 72
  end
  object FDQueryBuscarProducto: TFDQuery
    Connection = FDConnectionNegocio
    Left = 480
    Top = 72
  end
  object FDQueryBuscarCliente: TFDQuery
    Connection = FDConnectionNegocio
    Left = 528
    Top = 72
  end
  object FDQuerySeleccionarMarca: TFDQuery
    Connection = FDConnectionNegocio
    Left = 528
    Top = 184
  end
  object FDQuerySeleccionarProducto: TFDQuery
    Connection = FDConnectionNegocio
    Left = 480
    Top = 184
  end
  object FDQuerySeleccionarCliente: TFDQuery
    Connection = FDConnectionNegocio
    Left = 432
    Top = 128
  end
  object FDStoredProcEliminarProveedor: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.ELIMINAR_PROVEEDOR'
    Left = 576
    Top = 16
    ParamData = <
      item
        Position = 1
        Name = 'idProv'
        ParamType = ptInput
      end>
  end
  object FDStoredProcInsertarProveedor: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.INSERTAR_PROVEEDOR'
    Left = 576
    Top = 72
    ParamData = <
      item
        Position = 1
        Name = 'nombre'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 2
        Name = 'direccion'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 3
        Name = 'cuit'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 4
        Name = 'telefono'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end>
  end
  object FDStoredProcModificarProveedor: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.MODIFICAR_PROVEEDOR'
    Left = 576
    Top = 128
    ParamData = <
      item
        Position = 1
        Name = 'nombre'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 2
        Name = 'direccion'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 3
        Name = 'cuit'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 4
        Name = 'telefono'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 5
        Name = 'idProv'
        ParamType = ptInput
      end>
  end
  object FDStoredProcEliminarEmpleado: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.ELIMINAR_EMPLEADO'
    Left = 624
    Top = 16
    ParamData = <
      item
        Position = 1
        Name = 'idEmp'
        ParamType = ptInput
      end>
  end
  object FDStoredProcInsertarUsuario: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.INSERTAR_USUARIO'
    Left = 624
    Top = 72
    ParamData = <
      item
        Position = 1
        Name = 'u'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 2
        Name = 'p'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
  end
  object FDStoredProcInsertarEmpleado: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.INSERTAR_EMPLEADO'
    Left = 624
    Top = 128
    ParamData = <
      item
        Position = 1
        Name = 'nombre'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 2
        Name = 'apellido'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 3
        Name = 'dni'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 4
        Name = 'direccion'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 5
        Name = 'telefono'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 6
        Name = 'idUser'
        ParamType = ptInput
      end>
  end
  object FDStoredProcModificarEmpleado: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.MODIFICAR_EMPLEADO'
    Left = 96
    Top = 296
    ParamData = <
      item
        Position = 1
        Name = 'nombre'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 2
        Name = 'apellido'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 3
        Name = 'dni'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 4
        Name = 'direccion'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 5
        Name = 'telefono'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 6
        Name = 'idEmp'
        ParamType = ptInput
      end>
  end
  object FDStoredProcGuardarVenta: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.INSERTAR_VENTA'
    Left = 672
    Top = 16
    ParamData = <
      item
        Position = 1
        Name = 'vNF'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'vFH'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'vTV'
        DataType = ftBCD
        Precision = 8
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'vCLI'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'vEMP'
        ParamType = ptInput
      end>
  end
  object FDStoredProcGuardarDetalleVenta: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.INSERTAR_DETALLE_VENTA'
    Left = 672
    Top = 72
    ParamData = <
      item
        Position = 1
        Name = 'dVENT'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'dPRO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'dCANT'
        ParamType = ptInput
      end>
  end
  object FDStoredProcActualizarStockVenta: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.ACTUALIZAR_STOCK'
    Left = 672
    Top = 128
    ParamData = <
      item
        Position = 1
        Name = 'aPRO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'aCANT'
        ParamType = ptInput
      end>
  end
  object FDStoredProcGuardarCompra: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.INSERTAR_COMPRA'
    Left = 720
    Top = 16
    ParamData = <
      item
        Position = 1
        Name = 'num_pedido'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'fecha'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'total'
        DataType = ftBCD
        Precision = 8
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'idProv'
        ParamType = ptInput
      end>
  end
  object FDStoredProcGuardarDetalleCompra: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.INSERTAR_DETALLE_COMPRA'
    Left = 720
    Top = 72
    ParamData = <
      item
        Position = 1
        Name = 'idComp'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'idPro'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'cant'
        ParamType = ptInput
      end>
  end
  object FDStoredProcActualizarStockCompra: TFDStoredProc
    Connection = FDConnectionNegocio
    StoredProcName = 'negocio.ACTUALIZAR_STOCK_COMPRAS'
    Left = 720
    Top = 128
    ParamData = <
      item
        Position = 1
        Name = 'idPro'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'Cant'
        ParamType = ptInput
      end>
  end
end
