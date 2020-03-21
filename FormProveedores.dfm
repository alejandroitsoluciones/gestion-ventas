object FProveedores: TFProveedores
  Left = 0
  Top = 0
  Caption = 'Sistema De Ventas - Proveedores'
  ClientHeight = 525
  ClientWidth = 1026
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Roboto Lt'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 18
  object GroupBoxBuscarProveedores: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1020
    Height = 105
    Align = alTop
    Caption = 'Buscar Proveedores'
    TabOrder = 0
    object EditBuscarProveedor: TEdit
      Left = 16
      Top = 40
      Width = 200
      Height = 26
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = EditBuscarProveedorChange
    end
  end
  object GroupBoxOpciones: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 400
    Width = 1020
    Height = 122
    Align = alBottom
    Caption = 'Opciones'
    TabOrder = 1
    object SpeedButtonNuevoProveedor: TSpeedButton
      Left = 16
      Top = 36
      Width = 150
      Height = 30
      Caption = '&Nuevo Proveedor'
      OnClick = SpeedButtonNuevoProveedorClick
    end
    object SpeedButtonModficarProveedor: TSpeedButton
      Left = 172
      Top = 36
      Width = 150
      Height = 30
      Caption = '&Modificar Proveedor'
      OnClick = SpeedButtonModficarProveedorClick
    end
    object SpeedButtonEliminarProveedor: TSpeedButton
      Left = 328
      Top = 36
      Width = 150
      Height = 30
      Caption = '&Eliminar Proveedor'
      OnClick = SpeedButtonEliminarProveedorClick
    end
    object SpeedButtonCerrar: TSpeedButton
      Left = 484
      Top = 36
      Width = 150
      Height = 30
      Caption = '&Cerrar'
      OnClick = SpeedButtonCerrarClick
    end
    object SpeedButtonSeleccionarProveedor: TSpeedButton
      Left = 16
      Top = 72
      Width = 161
      Height = 30
      Caption = '&Seleccionar Proveedor'
      OnClick = SpeedButtonSeleccionarProveedorClick
    end
  end
  object DBGridProveedores: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 114
    Width = 1020
    Height = 280
    Align = alClient
    DataSource = Datos.DataSourceProveedores
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Roboto Lt'
    TitleFont.Style = []
    OnCellClick = DBGridProveedoresCellClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id_proveedores'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'nombre_proveedor'
        Title.Alignment = taCenter
        Title.Caption = 'NOMBRE'
        Width = 331
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'direccion_proveedor'
        Title.Alignment = taCenter
        Title.Caption = 'DIRECCION'
        Width = 328
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cuit_proveedor'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 165
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'telefono_proveedor'
        Title.Alignment = taCenter
        Title.Caption = 'TELEFONO'
        Width = 108
        Visible = True
      end>
  end
end
