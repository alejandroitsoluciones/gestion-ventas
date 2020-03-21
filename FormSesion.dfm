object FSesion: TFSesion
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Inicio De Sesion - Sistema De Ventas'
  ClientHeight = 213
  ClientWidth = 391
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
  object LabelUsuario: TLabel
    Left = 47
    Top = 30
    Width = 50
    Height = 18
    Caption = 'Usuario'
  end
  object LabelClave: TLabel
    Left = 38
    Top = 86
    Width = 76
    Height = 18
    Caption = 'Contrase'#241'a'
  end
  object SpeedButtonIniciar: TSpeedButton
    Left = 43
    Top = 156
    Width = 75
    Height = 30
    Caption = '&Iniciar'
    OnClick = SpeedButtonIniciarClick
  end
  object SpeedButtonCerrar: TSpeedButton
    Left = 270
    Top = 156
    Width = 75
    Height = 30
    Caption = '&Cerrar'
    OnClick = SpeedButtonCerrarClick
  end
  object EditUsuario: TEdit
    Left = 145
    Top = 27
    Width = 200
    Height = 26
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object EditClave: TEdit
    Left = 145
    Top = 83
    Width = 200
    Height = 26
    CharCase = ecUpperCase
    PasswordChar = '*'
    TabOrder = 1
  end
  object CheckBoxVerClave: TCheckBox
    Left = 145
    Top = 115
    Width = 200
    Height = 17
    Caption = 'Ver Contrase'#241'a'
    TabOrder = 2
    OnClick = CheckBoxVerClaveClick
  end
end
