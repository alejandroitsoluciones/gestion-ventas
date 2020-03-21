object FClientes: TFClientes
  Left = 0
  Top = 0
  Caption = 'Sistema De Ventas - Clientes'
  ClientHeight = 505
  ClientWidth = 829
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
  object GroupBoxBuscarCliente: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 823
    Height = 105
    Align = alTop
    Caption = 'Buscar Clientes'
    TabOrder = 0
    object EditBuscarCli: TEdit
      Left = 16
      Top = 40
      Width = 200
      Height = 26
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = EditBuscarCliChange
    end
  end
  object GroupBoxOpciones: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 397
    Width = 823
    Height = 105
    Align = alBottom
    Caption = 'Opciones'
    TabOrder = 1
    object SpeedButtonNuevoCliente: TSpeedButton
      Left = 16
      Top = 24
      Width = 150
      Height = 30
      Caption = '&Nuevo Cliente'
      OnClick = SpeedButtonNuevoClienteClick
    end
    object SpeedButtonModificarCliente: TSpeedButton
      Left = 172
      Top = 24
      Width = 150
      Height = 30
      Caption = '&Modificar Cliente'
      OnClick = SpeedButtonModificarClienteClick
    end
    object SpeedButtonCerrar: TSpeedButton
      Left = 484
      Top = 24
      Width = 150
      Height = 30
      Caption = '&Cerrar'
      OnClick = SpeedButtonCerrarClick
    end
    object SpeedButtonEliminarCliente: TSpeedButton
      Left = 328
      Top = 24
      Width = 150
      Height = 30
      Caption = '&Eliminar Cliente'
      OnClick = SpeedButtonEliminarClienteClick
    end
    object SpeedButtonSeleccionarCliente: TSpeedButton
      Left = 16
      Top = 60
      Width = 150
      Height = 30
      Caption = '&Seleccionar Cliente'
      OnClick = SpeedButtonSeleccionarClienteClick
    end
  end
  object DBGridClientes: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 114
    Width = 823
    Height = 277
    Align = alClient
    DataSource = Datos.DataSourceClientes
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Roboto Lt'
    TitleFont.Style = []
    OnCellClick = DBGridClientesCellClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id_clientes'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Width = 59
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'nombre_cliente'
        Title.Alignment = taCenter
        Title.Caption = 'NOMBRE'
        Width = 207
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'apellido_cliente'
        Title.Alignment = taCenter
        Title.Caption = 'APELLIDO'
        Width = 203
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'direccion_cliente'
        Title.Alignment = taCenter
        Title.Caption = 'DIRECCION'
        Width = 301
        Visible = True
      end>
  end
end
