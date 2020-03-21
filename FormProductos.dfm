object FProductos: TFProductos
  Left = 0
  Top = 0
  Caption = 'Sistemas De Ventas - Productos'
  ClientHeight = 532
  ClientWidth = 991
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Roboto Lt'
  Font.Style = []
  Menu = MainMenuProductos
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 18
  object GroupBoxOpciones: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 408
    Width = 985
    Height = 121
    Align = alBottom
    Caption = 'Opciones'
    TabOrder = 2
    object SpeedButtonCerrar: TSpeedButton
      Left = 485
      Top = 24
      Width = 150
      Height = 30
      Caption = '&Cerrar'
      OnClick = SpeedButtonCerrarClick
    end
    object SpeedButtonEliminarProducto: TSpeedButton
      Left = 329
      Top = 24
      Width = 150
      Height = 30
      Caption = '&Eliminar Producto'
      OnClick = SpeedButtonEliminarProductoClick
    end
    object SpeedButtonModificarProducto: TSpeedButton
      Left = 173
      Top = 24
      Width = 150
      Height = 30
      Caption = 'Modificar &Producto'
      OnClick = SpeedButtonModificarProductoClick
    end
    object SpeedButtonNuevoProducto: TSpeedButton
      Left = 17
      Top = 24
      Width = 150
      Height = 30
      Caption = '&Nuevo Producto'
      OnClick = SpeedButtonNuevoProductoClick
    end
    object SpeedButtonSelectProducto: TSpeedButton
      Left = 17
      Top = 70
      Width = 150
      Height = 30
      Caption = 'Seleccionar Producto'
      OnClick = SpeedButtonSelectProductoClick
    end
    object SpeedButtonSeleccionarProductoCompras: TSpeedButton
      Left = 17
      Top = 70
      Width = 150
      Height = 30
      Caption = '&Seleccionar Producto'
      Visible = False
      OnClick = SpeedButtonSeleccionarProductoComprasClick
    end
    object GroupBoxReferencia: TGroupBox
      Left = 664
      Top = 20
      Width = 319
      Height = 99
      Align = alRight
      Caption = 'Referencias'
      TabOrder = 0
      object Label1: TLabel
        Left = 36
        Top = 48
        Width = 182
        Height = 18
        Caption = 'Producto Con Stock Minimo'
      end
      object EditColor: TEdit
        Left = 232
        Top = 45
        Width = 26
        Height = 26
        Color = clRed
        Enabled = False
        TabOrder = 0
      end
    end
  end
  object DBGridProductos: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 114
    Width = 985
    Height = 288
    Align = alClient
    DataSource = Datos.DataSourceProductos
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Roboto Lt'
    TitleFont.Style = []
    OnCellClick = DBGridProductosCellClick
    OnDrawColumnCell = DBGridProductosDrawColumnCell
    OnTitleClick = DBGridProductosTitleClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id_productos'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'nombre_producto'
        Title.Alignment = taCenter
        Title.Caption = 'NOMBRE DE PRODUCTO'
        Width = 430
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'precio_producto'
        Title.Alignment = taCenter
        Title.Caption = 'PRECIO'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'stock_producto'
        Title.Alignment = taCenter
        Title.Caption = 'STOCK'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'nombre_marca'
        Title.Alignment = taCenter
        Title.Caption = 'MARCA'
        Width = 244
        Visible = True
      end>
  end
  object GroupBoxSearch: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 985
    Height = 105
    Align = alTop
    Caption = 'Buscar Producto'
    TabOrder = 1
    object EditBuscarProductos: TEdit
      Left = 17
      Top = 39
      Width = 200
      Height = 26
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = EditBuscarProductosChange
    end
  end
  object DBGridProductosCompras: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 114
    Width = 985
    Height = 288
    Align = alClient
    DataSource = Datos.DataSourceProductosCompras
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Roboto Lt'
    TitleFont.Style = []
    OnCellClick = DBGridProductosComprasCellClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id_productos'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'nombre_producto'
        Title.Alignment = taCenter
        Title.Caption = 'NOMBRE'
        Width = 504
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'precio_producto'
        Title.Alignment = taCenter
        Title.Caption = 'PRECIO'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'stock_producto'
        Title.Alignment = taCenter
        Title.Caption = 'STOCK'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'nombre_marca'
        Title.Alignment = taCenter
        Title.Caption = 'MARCA'
        Width = 176
        Visible = True
      end>
  end
  object MainMenuProductos: TMainMenu
    Left = 360
    Top = 272
    object Marcas1: TMenuItem
      Caption = '&Marcas'
      object VerMarcas1: TMenuItem
        Caption = '&Ver Marcas'
        OnClick = VerMarcas1Click
      end
    end
  end
end
