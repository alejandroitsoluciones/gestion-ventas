object FFacturaciones: TFFacturaciones
  Left = 0
  Top = 0
  Caption = 'Sistema De Ventas - Facturaciones'
  ClientHeight = 631
  ClientWidth = 1025
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Roboto Lt'
  Font.Style = []
  Menu = MainMenuVentas
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 18
  object PanelClientes: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1019
    Height = 35
    Align = alTop
    Caption = 'Clientes'
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 1025
  end
  object PanelVentas: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 170
    Width = 1019
    Height = 35
    Align = alTop
    Caption = 'Ventas'
    TabOrder = 1
    ExplicitLeft = 0
    ExplicitTop = 155
    ExplicitWidth = 1025
  end
  object PanelDetalleVentas: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 332
    Width = 1019
    Height = 35
    Align = alTop
    Caption = 'Detalles De Facturaciones'
    TabOrder = 2
    ExplicitLeft = 0
    ExplicitTop = 305
    ExplicitWidth = 1025
  end
  object DBGridClientes: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 1019
    Height = 120
    Align = alTop
    DataSource = Datos.DataSourceClientes
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Roboto Lt'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id_clientes'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'nombre_cliente'
        Title.Alignment = taCenter
        Title.Caption = 'NOMBRE DE CLIENTE'
        Width = 297
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'apellido_cliente'
        Title.Alignment = taCenter
        Title.Caption = 'APELLIDO DE CLIENTE'
        Width = 305
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'direccion_cliente'
        Title.Alignment = taCenter
        Title.Caption = 'DIRECCION'
        Width = 283
        Visible = True
      end>
  end
  object DBGridVentas: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 211
    Width = 1019
    Height = 115
    Align = alTop
    DataSource = Datos.DataSourceVentas
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Roboto Lt'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id_ventas'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'numero_factura'
        Title.Alignment = taCenter
        Title.Caption = 'NUMERO DE FACTURA'
        Width = 312
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fecha_venta'
        Title.Alignment = taCenter
        Title.Caption = 'FECHA/HORA DE VENTA'
        Width = 353
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'total_venta'
        Title.Alignment = taCenter
        Title.Caption = 'TOTAL'
        Visible = True
      end>
  end
  object DBGridDetalleVentas: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 373
    Width = 1019
    Height = 174
    Align = alClient
    DataSource = Datos.DataSourceDetalleVentas
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 5
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Roboto Lt'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'idPro'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'nombre_producto'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRIPCION - NOMBRE PRODUCTO'
        Width = 499
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'precio_producto'
        Title.Alignment = taCenter
        Title.Caption = 'PRECIO UNITARIO'
        Width = 176
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cantidad_producto'
        Title.Alignment = taCenter
        Title.Caption = 'CANTIDAD'
        Width = 94
        Visible = True
      end>
  end
  object GroupBoxOpciones: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 553
    Width = 1019
    Height = 75
    Align = alBottom
    Caption = 'Opciones'
    TabOrder = 6
    ExplicitTop = 440
    object SpeedButtonImprimir: TSpeedButton
      Left = 9
      Top = 29
      Width = 150
      Height = 30
      Caption = '&Imprimir'
    end
    object SpeedButtonAnularCompra: TSpeedButton
      Left = 165
      Top = 29
      Width = 150
      Height = 30
      Caption = '&Anular Venta'
    end
    object SpeedButtonCerrar: TSpeedButton
      Left = 321
      Top = 29
      Width = 150
      Height = 30
      Caption = '&Cerrar'
    end
  end
  object MainMenuVentas: TMainMenu
    Left = 504
    Top = 320
    object Ventas1: TMenuItem
      Caption = '&Ventas'
      object NuevaVenta1: TMenuItem
        Caption = 'Nueva Venta'
      end
    end
  end
end
