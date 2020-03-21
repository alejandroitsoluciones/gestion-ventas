unit FormFacturaciones;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Menus;

type
  TFFacturaciones = class(TForm)
    PanelClientes: TPanel;
    PanelVentas: TPanel;
    PanelDetalleVentas: TPanel;
    DBGridClientes: TDBGrid;
    DBGridVentas: TDBGrid;
    DBGridDetalleVentas: TDBGrid;
    GroupBoxOpciones: TGroupBox;
    SpeedButtonImprimir: TSpeedButton;
    SpeedButtonAnularCompra: TSpeedButton;
    SpeedButtonCerrar: TSpeedButton;
    MainMenuVentas: TMainMenu;
    Ventas1: TMenuItem;
    NuevaVenta1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFacturaciones: TFFacturaciones;

implementation

{$R *.dfm}

uses MDatos, FormVentas;

end.
