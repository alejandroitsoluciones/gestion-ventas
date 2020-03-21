object FOpcionesProductos: TFOpcionesProductos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 232
  ClientWidth = 344
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
  object Label1: TLabel
    Left = 18
    Top = 16
    Width = 56
    Height = 18
    Caption = 'Nombre:'
  end
  object Label2: TLabel
    Left = 18
    Top = 56
    Width = 41
    Height = 18
    Caption = 'Precio'
  end
  object Label3: TLabel
    Left = 18
    Top = 96
    Width = 37
    Height = 18
    Caption = 'Stock'
  end
  object Label4: TLabel
    Left = 18
    Top = 136
    Width = 42
    Height = 18
    Caption = 'Marca'
  end
  object SpeedButtonInsertProducto: TSpeedButton
    Left = 18
    Top = 176
    Width = 75
    Height = 30
    Caption = '&Guardar'
    OnClick = SpeedButtonInsertProductoClick
  end
  object SpeedButtonUpdateProductos: TSpeedButton
    Left = 18
    Top = 176
    Width = 75
    Height = 30
    Caption = '&Guardar'
    OnClick = SpeedButtonUpdateProductosClick
  end
  object SpeedButtonCerrar: TSpeedButton
    Left = 241
    Top = 176
    Width = 75
    Height = 30
    Caption = '&Cerrar'
    OnClick = SpeedButtonCerrarClick
  end
  object EditNombrePro: TEdit
    Left = 96
    Top = 13
    Width = 220
    Height = 26
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object EditPrecioPro: TEdit
    Left = 96
    Top = 53
    Width = 220
    Height = 26
    TabOrder = 1
  end
  object EditStockPro: TEdit
    Left = 96
    Top = 93
    Width = 220
    Height = 26
    NumbersOnly = True
    TabOrder = 2
  end
  object ComboBoxMarca: TComboBox
    Left = 96
    Top = 133
    Width = 220
    Height = 26
    Style = csDropDownList
    CharCase = ecUpperCase
    TabOrder = 3
    OnSelect = ComboBoxMarcaSelect
  end
end
