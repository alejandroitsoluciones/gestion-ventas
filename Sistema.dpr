program Sistema;

uses
  Vcl.Forms,
  FormSesion in 'FormSesion.pas' {FSesion},
  MDatos in 'MDatos.pas' {Datos: TDataModule},
  FormPrincipal in 'FormPrincipal.pas' {FPrincipal},
  FormProductos in 'FormProductos.pas' {FProductos},
  FormOpcionesProductos in 'FormOpcionesProductos.pas' {FOpcionesProductos},
  Vcl.Themes,
  Vcl.Styles,
  FormMarcas in 'FormMarcas.pas' {FMarcas},
  FormOpcionesMarcas in 'FormOpcionesMarcas.pas' {FOpcionesMarcas},
  FormClientes in 'FormClientes.pas' {FClientes},
  FormVentas in 'FormVentas.pas' {FVentas},
  FormCantidad in 'FormCantidad.pas' {FCantidad},
  FormEmpleados in 'FormEmpleados.pas' {FEmpleados},
  FormOpcionesEmpleados in 'FormOpcionesEmpleados.pas' {FOpcionesEmpleados},
  FormCambiarClave in 'FormCambiarClave.pas' {FCambiarClave},
  FormProveedores in 'FormProveedores.pas' {FProveedores},
  FormCompras in 'FormCompras.pas' {FCompras},
  FormCantidadCompras in 'FormCantidadCompras.pas' {FCantidadCompras},
  FormOpcionesClientes in 'FormOpcionesClientes.pas' {FOpcionesClientes},
  FormOpcionesProveedores in 'FormOpcionesProveedores.pas' {FOpcionesProveedores};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFSesion, FSesion);
  Application.CreateForm(TDatos, Datos);
  Application.Run;
end.
