object FOpcionesClientes: TFOpcionesClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 225
  ClientWidth = 351
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
    Left = 24
    Top = 19
    Width = 53
    Height = 18
    Caption = 'Nombre'
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 50
    Height = 18
    Caption = 'Apellido'
  end
  object Label3: TLabel
    Left = 24
    Top = 112
    Width = 61
    Height = 18
    Caption = 'Direccion'
  end
  object SpeedButtonInsertarCliente: TSpeedButton
    Left = 24
    Top = 168
    Width = 90
    Height = 30
    Caption = '&Guardar'
    OnClick = SpeedButtonInsertarClienteClick
  end
  object SpeedButtonUpdateCliente: TSpeedButton
    Left = 24
    Top = 168
    Width = 90
    Height = 30
    Caption = '&Guardar'
    OnClick = SpeedButtonUpdateClienteClick
  end
  object SpeedButtonCerrar: TSpeedButton
    Left = 235
    Top = 168
    Width = 90
    Height = 30
    Caption = '&Cerrar'
    OnClick = SpeedButtonCerrarClick
  end
  object EditNombre: TEdit
    Left = 125
    Top = 16
    Width = 200
    Height = 26
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object EditApellido: TEdit
    Left = 125
    Top = 61
    Width = 200
    Height = 26
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object EditDireccion: TEdit
    Left = 125
    Top = 109
    Width = 200
    Height = 26
    CharCase = ecUpperCase
    TabOrder = 2
  end
end
