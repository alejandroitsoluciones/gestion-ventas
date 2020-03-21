object FEmpleados: TFEmpleados
  Left = 0
  Top = 0
  Caption = 'Sistema De Ventas - Empleados'
  ClientHeight = 473
  ClientWidth = 779
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
  object GroupBoxBuscarEmpleado: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 773
    Height = 86
    Align = alTop
    Caption = 'Busqueda Empleado'
    TabOrder = 0
    object EditBuscarEmpleado: TEdit
      Left = 16
      Top = 32
      Width = 200
      Height = 26
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = EditBuscarEmpleadoChange
    end
  end
  object DBGridEmpleados: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 95
    Width = 773
    Height = 275
    Align = alClient
    DataSource = Datos.DataSourceEmpleados
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Roboto Lt'
    TitleFont.Style = []
    OnCellClick = DBGridEmpleadosCellClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id_empleados'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Width = 58
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'nombre_empleado'
        Title.Alignment = taCenter
        Title.Caption = 'NOMBRE'
        Width = 240
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'apellido_empleado'
        Title.Alignment = taCenter
        Title.Caption = 'APELLIDO'
        Width = 246
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dni_empleado'
        Title.Alignment = taCenter
        Title.Caption = 'DNI'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'direccion_empleado'
        Title.Alignment = taCenter
        Title.Caption = 'DIRECCION'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'telefono_empleado'
        Title.Alignment = taCenter
        Title.Caption = 'TELEFONO'
        Visible = True
      end>
  end
  object GroupBoxOpciones: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 376
    Width = 773
    Height = 94
    Align = alBottom
    Caption = 'Opciones'
    TabOrder = 2
    object SpeedButtonNuevoEmpleado: TSpeedButton
      Left = 16
      Top = 37
      Width = 140
      Height = 30
      Caption = '&Nuevo Empleado'
      OnClick = SpeedButtonNuevoEmpleadoClick
    end
    object SpeedButtonModificarEmpleado: TSpeedButton
      Left = 163
      Top = 37
      Width = 140
      Height = 30
      Caption = '&Modificar Empleado'
      OnClick = SpeedButtonModificarEmpleadoClick
    end
    object SpeedButtonEliminarEmpleado: TSpeedButton
      Left = 309
      Top = 37
      Width = 140
      Height = 30
      Caption = '&Eliminar Empleado'
      OnClick = SpeedButtonEliminarEmpleadoClick
    end
    object SpeedButtonCambiarClave: TSpeedButton
      Left = 454
      Top = 37
      Width = 140
      Height = 30
      Caption = '&Cambiar Contrase'#241'a'
      OnClick = SpeedButtonCambiarClaveClick
    end
    object SpeedButtonCerrar: TSpeedButton
      Left = 600
      Top = 37
      Width = 140
      Height = 30
      Caption = 'C&errar'
      OnClick = SpeedButtonCerrarClick
    end
  end
end
