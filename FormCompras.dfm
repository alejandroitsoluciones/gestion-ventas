object FCompras: TFCompras
  Left = 0
  Top = 0
  Caption = 'Sistema De Ventas - Compras'
  ClientHeight = 536
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Roboto Lt'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 18
  object GroupBoxDatosPedido: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 844
    Height = 70
    Align = alTop
    Caption = 'Datos Del Pedido'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 123
      Height = 18
      Caption = 'Numero De Pedido'
    end
    object Label2: TLabel
      Left = 351
      Top = 32
      Width = 110
      Height = 18
      Caption = 'Fecha De Pedido'
    end
    object EditNumPedido: TEdit
      Left = 145
      Top = 29
      Width = 200
      Height = 26
      Alignment = taCenter
      Enabled = False
      NumbersOnly = True
      TabOrder = 0
    end
    object EditFecha: TEdit
      Left = 467
      Top = 29
      Width = 200
      Height = 26
      Alignment = taCenter
      Enabled = False
      TabOrder = 1
    end
  end
  object GroupBoxDatosProveedor: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 79
    Width = 844
    Height = 105
    Align = alTop
    Caption = 'Datos Del Proveedor'
    TabOrder = 1
    object Label3: TLabel
      Left = 12
      Top = 60
      Width = 123
      Height = 18
      Caption = 'Nombre Proveedor'
    end
    object Label4: TLabel
      Left = 297
      Top = 60
      Width = 61
      Height = 18
      Caption = 'Direccion'
    end
    object Label5: TLabel
      Left = 620
      Top = 60
      Width = 57
      Height = 18
      Caption = 'Telefono'
    end
    object SpeedButtonAgregarProveedor: TSpeedButton
      Left = 12
      Top = 20
      Width = 150
      Height = 22
      Caption = 'Agregar &Proveedor'
      OnClick = SpeedButtonAgregarProveedorClick
    end
    object SpeedButtonQuitarProveedor: TSpeedButton
      Left = 168
      Top = 20
      Width = 150
      Height = 22
      Caption = '&Quitar Proveedor'
      OnClick = SpeedButtonQuitarProveedorClick
    end
    object EditNombreProv: TEdit
      Left = 141
      Top = 56
      Width = 150
      Height = 26
      Alignment = taCenter
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 0
    end
    object EditDireccionProv: TEdit
      Left = 364
      Top = 56
      Width = 250
      Height = 26
      Alignment = taCenter
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 1
    end
    object EditTelefonoProv: TEdit
      Left = 683
      Top = 56
      Width = 150
      Height = 26
      Alignment = taCenter
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 2
    end
  end
  object GroupBoxDetalleProductos: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 190
    Width = 844
    Height = 204
    Align = alClient
    Caption = 'Detalle'
    TabOrder = 2
    object SpeedButtonAgregarProductos: TSpeedButton
      Left = 12
      Top = 24
      Width = 150
      Height = 22
      Caption = '&Agregar Producto'
      OnClick = SpeedButtonAgregarProductosClick
    end
    object SpeedButtonQuitarProducto: TSpeedButton
      Left = 168
      Top = 24
      Width = 150
      Height = 22
      Caption = 'Quitar Pr&oducto'
      OnClick = SpeedButtonQuitarProductoClick
    end
    object StringGridDetalleCompra: TStringGrid
      Left = 2
      Top = 52
      Width = 840
      Height = 150
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColCount = 4
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 0
      ColWidths = (
        60
        490
        164
        109)
      RowHeights = (
        24
        24)
    end
  end
  object GroupBoxTotalPedido: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 400
    Width = 844
    Height = 66
    Align = alBottom
    Caption = 'Total Pedido'
    TabOrder = 3
    DesignSize = (
      844
      66)
    object Label6: TLabel
      Left = 578
      Top = 27
      Width = 33
      Height = 18
      Anchors = [akRight]
      Caption = 'Total'
    end
    object SpeedButtonCalcularTotal: TSpeedButton
      Left = 24
      Top = 28
      Width = 150
      Height = 22
      Caption = 'Calcular Total'
      Visible = False
      OnClick = SpeedButtonCalcularTotalClick
    end
    object EditTotal: TEdit
      Left = 633
      Top = 24
      Width = 200
      Height = 26
      Alignment = taCenter
      Anchors = [akRight]
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
      Text = '0'
    end
  end
  object GroupBoxOpciones: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 472
    Width = 844
    Height = 61
    Align = alBottom
    Caption = 'Opciones'
    TabOrder = 4
    object SpeedButtonGuardarPedido: TSpeedButton
      Left = 24
      Top = 21
      Width = 150
      Height = 30
      Caption = '&Guardar'
      OnClick = SpeedButtonGuardarPedidoClick
    end
    object SpeedButtonCerrar: TSpeedButton
      Left = 180
      Top = 21
      Width = 150
      Height = 30
      Caption = '&Cerrar'
      OnClick = SpeedButtonCerrarClick
    end
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 715
    Top = 27
  end
end
