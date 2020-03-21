object FOpcionesProveedores: TFOpcionesProveedores
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 278
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Roboto Lt'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 36
    Top = 16
    Width = 53
    Height = 18
    Caption = 'Nombre'
  end
  object Label2: TLabel
    Left = 36
    Top = 72
    Width = 61
    Height = 18
    Caption = 'Direccion'
  end
  object Label3: TLabel
    Left = 36
    Top = 123
    Width = 33
    Height = 18
    Caption = 'CUIT'
  end
  object Label4: TLabel
    Left = 36
    Top = 176
    Width = 57
    Height = 18
    Caption = 'Telefono'
  end
  object SpeedButtonInsertarProveedores: TSpeedButton
    Left = 36
    Top = 224
    Width = 90
    Height = 30
    Caption = '&Guardar'
    OnClick = SpeedButtonInsertarProveedoresClick
  end
  object SpeedButtonUpdateProveedores: TSpeedButton
    Left = 36
    Top = 224
    Width = 90
    Height = 30
    Caption = '&Guardar'
    Visible = False
    OnClick = SpeedButtonUpdateProveedoresClick
  end
  object SpeedButtonCerrar: TSpeedButton
    Left = 246
    Top = 224
    Width = 90
    Height = 30
    Caption = '&Cerrar'
    OnClick = SpeedButtonCerrarClick
  end
  object EditNombre: TEdit
    Left = 136
    Top = 13
    Width = 200
    Height = 26
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object EditDireccion: TEdit
    Left = 136
    Top = 69
    Width = 200
    Height = 26
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object EditCuit: TEdit
    Left = 136
    Top = 120
    Width = 200
    Height = 26
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object EditTelefono: TEdit
    Left = 136
    Top = 173
    Width = 200
    Height = 26
    CharCase = ecUpperCase
    NumbersOnly = True
    TabOrder = 3
  end
end
