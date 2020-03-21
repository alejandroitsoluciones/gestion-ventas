object FOpcionesMarcas: TFOpcionesMarcas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 136
  ClientWidth = 400
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
    Width = 121
    Height = 18
    Caption = 'Nombre De Marca'
  end
  object SpeedButtonInsertMarca: TSpeedButton
    Left = 24
    Top = 80
    Width = 70
    Height = 30
    Caption = '&Guardar'
    OnClick = SpeedButtonInsertMarcaClick
  end
  object SpeedButtonUpdateMarca: TSpeedButton
    Left = 24
    Top = 80
    Width = 70
    Height = 30
    Caption = '&Guardar'
    OnClick = SpeedButtonUpdateMarcaClick
  end
  object SpeedButtonCerrar: TSpeedButton
    Left = 306
    Top = 80
    Width = 70
    Height = 30
    Caption = '&Cerrar'
    OnClick = SpeedButtonCerrarClick
  end
  object EditNombreMarca: TEdit
    Left = 176
    Top = 21
    Width = 200
    Height = 26
    CharCase = ecUpperCase
    TabOrder = 0
  end
end
