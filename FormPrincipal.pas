unit FormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls;

type
  TFPrincipal = class(TForm)
    MainMenu: TMainMenu;
    Productos1: TMenuItem;
    Proveedores1: TMenuItem;
    Ventas1: TMenuItem;
    Clientes1: TMenuItem;
    Compras1: TMenuItem;
    Usuarios1: TMenuItem;
    Ayuda1: TMenuItem;
    VerProductos1: TMenuItem;
    VerVentas1: TMenuItem;
    VerClientes1: TMenuItem;
    VerUsuarios1: TMenuItem;
    N1: TMenuItem;
    CerrarSesion1: TMenuItem;
    VerCompras1: TMenuItem;
    VerProveedores1: TMenuItem;
    ACercaDe1: TMenuItem;
    AcercaDe2: TMenuItem;
    ImageFondo: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VerProductos1Click(Sender: TObject);
    procedure VerVentas1Click(Sender: TObject);
    procedure VerClientes1Click(Sender: TObject);
    procedure VerUsuarios1Click(Sender: TObject);
    procedure VerProveedores1Click(Sender: TObject);
    procedure VerCompras1Click(Sender: TObject);
    procedure CerrarSesion1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_EMPLEADO : Integer;
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

uses FormProductos, FormVentas, FormClientes, FormFacturaciones, FormEmpleados,
  FormProveedores, FormCompras, FormSesion;
procedure TFPrincipal.CerrarSesion1Click(Sender: TObject);
begin
  ID_EMPLEADO := 0;
  FPrincipal.DestroyWindowHandle;
  FSesion := TFSesion.Create(Self);
  FSesion.ShowModal;
end;

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPrincipal.VerClientes1Click(Sender: TObject);
begin
  FClientes := TFClientes.Create(Self);
  FClientes.SpeedButtonSeleccionarCliente.Enabled := False;
  FClientes.ShowModal;
end;

procedure TFPrincipal.VerCompras1Click(Sender: TObject);
begin
  FCompras := TFCompras.Create(Self);
  FCompras.ShowModal;
end;

procedure TFPrincipal.VerProductos1Click(Sender: TObject);
begin
  FProductos := TFProductos.Create(Self);
  FProductos.DBGridProductos.Visible := True;
  FProductos.DBGridProductosCompras.Visible := False;
  FProductos.SpeedButtonSelectProducto.Enabled := False;
  FProductos.ShowModal;
end;

procedure TFPrincipal.VerProveedores1Click(Sender: TObject);
begin
  FProveedores := TFProveedores.Create(Self);
  FProveedores.SpeedButtonSeleccionarProveedor.Enabled := False;
  FProveedores.ShowModal;
end;

procedure TFPrincipal.VerUsuarios1Click(Sender: TObject);
begin
  FEmpleados := TFEmpleados.Create(Self);
  FEmpleados.ShowModal;
end;

procedure TFPrincipal.VerVentas1Click(Sender: TObject);
begin
  FVentas := TFVentas.Create(Self);
  FVentas.ShowModal;
end;

end.
