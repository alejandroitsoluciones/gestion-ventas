object FMarcas: TFMarcas
  Left = 0
  Top = 0
  Caption = 'Sistemas De Ventas - Marcas'
  ClientHeight = 485
  ClientWidth = 682
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
  object GroupBoxBusqueda: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 676
    Height = 78
    Align = alTop
    Caption = 'Buscar Marca'
    TabOrder = 0
    object EditBuscarMarca: TEdit
      Left = 24
      Top = 32
      Width = 200
      Height = 26
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = EditBuscarMarcaChange
    end
  end
  object GroupBoxOpciones: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 406
    Width = 676
    Height = 76
    Align = alBottom
    Caption = 'Opciones'
    TabOrder = 1
    object SpeedButtonNuevaMarca: TSpeedButton
      Left = 12
      Top = 29
      Width = 120
      Height = 30
      Caption = '&Nueva Marca'
      OnClick = SpeedButtonNuevaMarcaClick
    end
    object SpeedButtonModificarMarca: TSpeedButton
      Left = 138
      Top = 29
      Width = 120
      Height = 30
      Caption = '&Modificar Marca'
      OnClick = SpeedButtonModificarMarcaClick
    end
    object SpeedButtonEliminarMarca: TSpeedButton
      Left = 264
      Top = 29
      Width = 120
      Height = 30
      Caption = '&Eliminar Marca'
      OnClick = SpeedButtonEliminarMarcaClick
    end
    object SpeedButtonCerrar: TSpeedButton
      Left = 390
      Top = 29
      Width = 120
      Height = 30
      Caption = '&Cerrar'
      OnClick = SpeedButtonCerrarClick
    end
  end
  object DBGridMarcas: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 87
    Width = 676
    Height = 313
    Align = alClient
    DataSource = Datos.DataSourceMarcas
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Roboto Lt'
    TitleFont.Style = []
    OnCellClick = DBGridMarcasCellClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id_marcas'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'nombre_marca'
        Title.Alignment = taCenter
        Title.Caption = 'MARCA'
        Visible = True
      end>
  end
end
