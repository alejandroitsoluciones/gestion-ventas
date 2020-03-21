object FCantidad: TFCantidad
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sistema De Ventas - Cantidad - Ventas'
  ClientHeight = 138
  ClientWidth = 363
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
    Left = 32
    Top = 24
    Width = 58
    Height = 18
    Caption = 'Cantidad'
  end
  object SpeedButtonAceptar: TSpeedButton
    Left = 96
    Top = 72
    Width = 150
    Height = 30
    Caption = '&Aceptar'
    OnClick = SpeedButtonAceptarClick
  end
  object EditCantidad: TEdit
    Left = 109
    Top = 21
    Width = 200
    Height = 26
    Alignment = taCenter
    NumbersOnly = True
    TabOrder = 0
    Text = '1'
  end
end
