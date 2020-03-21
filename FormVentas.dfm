object FVentas: TFVentas
  Left = 0
  Top = 0
  Caption = 'Sistema De Ventas - Facturacion'
  ClientHeight = 533
  ClientWidth = 918
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
  object GroupBoxDatosComprobante: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 912
    Height = 70
    Align = alTop
    Caption = 'Datos De Comprobante'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 29
      Width = 129
      Height = 18
      Caption = 'Numero De Factura'
    end
    object Label2: TLabel
      Left = 327
      Top = 29
      Width = 120
      Height = 18
      Caption = 'Fecha/Hora Venta'
    end
    object EditNumComp: TEdit
      Left = 151
      Top = 26
      Width = 170
      Height = 26
      Alignment = taCenter
      Enabled = False
      NumbersOnly = True
      TabOrder = 0
    end
    object EditFechaHora: TEdit
      Left = 453
      Top = 26
      Width = 170
      Height = 26
      Alignment = taCenter
      Enabled = False
      TabOrder = 1
    end
  end
  object GroupBoxDatosCliente: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 79
    Width = 912
    Height = 106
    Align = alTop
    Caption = 'Datos De Cliente'
    TabOrder = 1
    object Label3: TLabel
      Left = 16
      Top = 63
      Width = 53
      Height = 18
      Caption = 'Nombre'
    end
    object Label4: TLabel
      Left = 278
      Top = 63
      Width = 50
      Height = 18
      Caption = 'Apellido'
    end
    object Label5: TLabel
      Left = 540
      Top = 63
      Width = 61
      Height = 18
      Caption = 'Direccion'
    end
    object SpeedButtonAgregarCliente: TSpeedButton
      Left = 16
      Top = 23
      Width = 150
      Height = 22
      Caption = '&Agregar Cliente'
      OnClick = SpeedButtonAgregarClienteClick
    end
    object SpeedButtonQuitarCliente: TSpeedButton
      Left = 172
      Top = 23
      Width = 150
      Height = 22
      Caption = 'Quitar &Cliente'
      OnClick = SpeedButtonQuitarClienteClick
    end
    object EditNombre: TEdit
      Left = 75
      Top = 60
      Width = 200
      Height = 26
      Alignment = taCenter
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 0
    end
    object EditApellido: TEdit
      Left = 334
      Top = 60
      Width = 200
      Height = 26
      Alignment = taCenter
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 1
    end
    object EditDireccion: TEdit
      Left = 607
      Top = 60
      Width = 290
      Height = 26
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 2
    end
  end
  object GroupBoxDatosDetalles: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 191
    Width = 912
    Height = 193
    Align = alClient
    Caption = 'Detalles'
    TabOrder = 2
    object SpeedButtonBuscarProducto: TSpeedButton
      Left = 16
      Top = 24
      Width = 150
      Height = 22
      Caption = '&Buscar Producto'
      OnClick = SpeedButtonBuscarProductoClick
    end
    object SpeedButtonQuitarProducto: TSpeedButton
      Left = 172
      Top = 24
      Width = 150
      Height = 22
      Caption = 'Quitar &Producto'
      OnClick = SpeedButtonQuitarProductoClick
    end
    object StringGrid: TStringGrid
      AlignWithMargins = True
      Left = 5
      Top = 64
      Width = 902
      Height = 124
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColCount = 4
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 0
      ColWidths = (
        65
        523
        167
        116)
      RowHeights = (
        24
        24)
    end
  end
  object GroupBoxDatosFacturacion: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 390
    Width = 912
    Height = 70
    Align = alBottom
    Caption = 'Datos De Facturacion'
    TabOrder = 3
    DesignSize = (
      912
      70)
    object SpeedButtonCalcularTotal: TSpeedButton
      Left = 16
      Top = 26
      Width = 150
      Height = 26
      Caption = 'Calcular Total'
      Visible = False
      OnClick = SpeedButtonCalcularTotalClick
    end
    object EditTotal: TEdit
      Left = 697
      Top = 26
      Width = 200
      Height = 27
      Alignment = taCenter
      Anchors = [akRight]
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
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
    Top = 466
    Width = 912
    Height = 64
    Align = alBottom
    Caption = 'Opciones'
    TabOrder = 4
    object SpeedButtonGuardar: TSpeedButton
      Left = 16
      Top = 24
      Width = 150
      Height = 30
      Caption = '&Guardar'
      OnClick = SpeedButtonGuardarClick
    end
    object SpeedButtonCerrar: TSpeedButton
      Left = 172
      Top = 24
      Width = 150
      Height = 30
      Caption = 'C&errar'
      OnClick = SpeedButtonCerrarClick
    end
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 688
    Top = 24
  end
end
