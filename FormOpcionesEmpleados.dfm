object FOpcionesEmpleados: TFOpcionesEmpleados
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 511
  ClientWidth = 441
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
    Left = 30
    Top = 21
    Width = 53
    Height = 18
    Caption = 'Nombre'
  end
  object Label2: TLabel
    Left = 30
    Top = 70
    Width = 50
    Height = 18
    Caption = 'Apellido'
  end
  object Label3: TLabel
    Left = 30
    Top = 122
    Width = 37
    Height = 18
    Caption = 'D.N.I.'
  end
  object Label4: TLabel
    Left = 30
    Top = 174
    Width = 61
    Height = 18
    Caption = 'Direccion'
  end
  object Label5: TLabel
    Left = 30
    Top = 228
    Width = 57
    Height = 18
    Caption = 'Telefono'
  end
  object Label6: TLabel
    Left = 30
    Top = 283
    Width = 50
    Height = 18
    Caption = 'Usuario'
  end
  object Label7: TLabel
    Left = 30
    Top = 335
    Width = 76
    Height = 18
    Caption = 'Contrase'#241'a'
  end
  object Label8: TLabel
    Left = 30
    Top = 395
    Width = 145
    Height = 18
    Caption = 'Confirmar Contrase'#241'a'
  end
  object SpeedButtonInsertarEmpleado: TSpeedButton
    Left = 30
    Top = 448
    Width = 90
    Height = 30
    Caption = '&Guardar'
    OnClick = SpeedButtonInsertarEmpleadoClick
  end
  object SpeedButtonModificarEmpleado: TSpeedButton
    Left = 30
    Top = 448
    Width = 90
    Height = 30
    Caption = '&Guardar'
    OnClick = SpeedButtonModificarEmpleadoClick
  end
  object SpeedButtonCerrar: TSpeedButton
    Left = 306
    Top = 448
    Width = 90
    Height = 30
    Caption = '&Cerrar'
    OnClick = SpeedButtonCerrarClick
  end
  object EditNombre: TEdit
    Left = 196
    Top = 18
    Width = 200
    Height = 26
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object EditApellido: TEdit
    Left = 196
    Top = 67
    Width = 200
    Height = 26
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object EditDNI: TEdit
    Left = 196
    Top = 119
    Width = 200
    Height = 26
    NumbersOnly = True
    TabOrder = 2
  end
  object EditDireccion: TEdit
    Left = 196
    Top = 171
    Width = 200
    Height = 26
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object EditTelefono: TEdit
    Left = 196
    Top = 225
    Width = 200
    Height = 26
    NumbersOnly = True
    TabOrder = 4
  end
  object EditUsuario: TEdit
    Left = 196
    Top = 280
    Width = 200
    Height = 26
    TabOrder = 5
  end
  object EditClave: TEdit
    Left = 196
    Top = 332
    Width = 200
    Height = 26
    PasswordChar = '*'
    TabOrder = 6
  end
  object EditConfClave: TEdit
    Left = 196
    Top = 392
    Width = 200
    Height = 26
    PasswordChar = '*'
    TabOrder = 7
  end
end
