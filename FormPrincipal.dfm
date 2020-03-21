object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Sistema De Ventas'
  ClientHeight = 421
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Roboto Lt'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 18
  object ImageFondo: TImage
    Left = 0
    Top = 0
    Width = 519
    Height = 421
    Align = alClient
    Center = True
    Proportional = True
    ExplicitLeft = 272
    ExplicitTop = 160
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object MainMenu: TMainMenu
    Left = 248
    Top = 176
    object Productos1: TMenuItem
      Caption = '&Productos'
      object VerProductos1: TMenuItem
        Caption = 'Ver Productos'
        OnClick = VerProductos1Click
      end
    end
    object Proveedores1: TMenuItem
      Caption = 'Pr&oveedores'
      object VerProveedores1: TMenuItem
        Caption = '&Ver Proveedores'
        OnClick = VerProveedores1Click
      end
    end
    object Ventas1: TMenuItem
      Caption = '&Ventas'
      object VerVentas1: TMenuItem
        Caption = '&Ver Ventas'
        OnClick = VerVentas1Click
      end
    end
    object Clientes1: TMenuItem
      Caption = '&Clientes'
      object VerClientes1: TMenuItem
        Caption = '&Ver Clientes'
        OnClick = VerClientes1Click
      end
    end
    object Compras1: TMenuItem
      Caption = 'Co&mpras'
      object VerCompras1: TMenuItem
        Caption = '&Ver Compras'
        OnClick = VerCompras1Click
      end
    end
    object Usuarios1: TMenuItem
      Caption = '&Usuarios'
      object VerUsuarios1: TMenuItem
        Caption = '&Ver Usuarios'
        OnClick = VerUsuarios1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object CerrarSesion1: TMenuItem
        Caption = '&Cerrar Sesion'
        OnClick = CerrarSesion1Click
      end
    end
    object Ayuda1: TMenuItem
      Caption = '&Ayuda'
      object ACercaDe1: TMenuItem
        Caption = 'Manual De Usuario'
      end
      object AcercaDe2: TMenuItem
        Caption = 'Acerca De...'
      end
    end
  end
end
