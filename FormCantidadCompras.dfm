object FCantidadCompras: TFCantidadCompras
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sistema De Ventas - Cantiad - Compras'
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
    Left = 40
    Top = 32
    Width = 58
    Height = 18
    Caption = 'Cantidad'
  end
  object SpeedButtonAceptar: TSpeedButton
    Left = 104
    Top = 80
    Width = 150
    Height = 30
    Caption = '&Aceptar'
    OnClick = SpeedButtonAceptarClick
  end
  object EditCantidadCompras: TEdit
    Left = 117
    Top = 29
    Width = 200
    Height = 26
    Alignment = taCenter
    NumbersOnly = True
    TabOrder = 0
    Text = '1'
  end
end
