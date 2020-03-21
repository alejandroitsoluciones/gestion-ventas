object FCambiarClave: TFCambiarClave
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sistema De Ventas - Cambiar Clave De Sesion'
  ClientHeight = 218
  ClientWidth = 393
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
    Top = 24
    Width = 93
    Height = 18
    Caption = 'DNI Empleado'
  end
  object Label2: TLabel
    Left = 16
    Top = 73
    Width = 122
    Height = 18
    Caption = 'Nueva Contrase'#241'a'
  end
  object Label3: TLabel
    Left = 8
    Top = 128
    Width = 145
    Height = 18
    Caption = 'Confirmar Contrase'#241'a'
  end
  object SpeedButtonCambiarClave: TSpeedButton
    Left = 24
    Top = 168
    Width = 129
    Height = 30
    Caption = '&Cambiar Clave'
    OnClick = SpeedButtonCambiarClaveClick
  end
  object SpeedButtonCancelar: TSpeedButton
    Left = 278
    Top = 168
    Width = 90
    Height = 30
    Caption = 'C&ancelar'
    OnClick = SpeedButtonCancelarClick
  end
  object EditDNIUser: TEdit
    Left = 168
    Top = 21
    Width = 200
    Height = 26
    NumbersOnly = True
    TabOrder = 0
  end
  object EditClave: TEdit
    Left = 168
    Top = 70
    Width = 200
    Height = 26
    PasswordChar = '*'
    TabOrder = 1
  end
  object EditConfirmarClave: TEdit
    Left = 168
    Top = 120
    Width = 200
    Height = 26
    PasswordChar = '*'
    TabOrder = 2
  end
end
