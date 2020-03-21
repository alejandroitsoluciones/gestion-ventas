unit FormOpcionesClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls;

type
  TFOpcionesClientes = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditNombre: TEdit;
    EditApellido: TEdit;
    EditDireccion: TEdit;
    SpeedButtonInsertarCliente: TSpeedButton;
    SpeedButtonUpdateCliente: TSpeedButton;
    SpeedButtonCerrar: TSpeedButton;
    procedure SpeedButtonCerrarClick(Sender: TObject);
    procedure SpeedButtonInsertarClienteClick(Sender: TObject);
    procedure SpeedButtonUpdateClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOpcionesClientes: TFOpcionesClientes;

implementation

{$R *.dfm}

uses MDatos, FormClientes;

procedure TFOpcionesClientes.SpeedButtonCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFOpcionesClientes.SpeedButtonInsertarClienteClick(Sender: TObject);
begin
  if (EditNombre.Text <> '') and (EditApellido.Text <> '') and (EditDireccion.Text <> '') then
  begin
    Datos.FDConnectionNegocio.StartTransaction;
    try
      with Datos.FDStoredProcInsertarCliente do
      begin
        Prepare;
        Params.ParamByName('nombre').AsString := EditNombre.Text;
        Params.ParamByName('apellido').AsString := EditApellido.Text;
        Params.ParamByName('direccion').AsString := EditDireccion.Text;
        ExecProc;
      end;
      Datos.FDConnectionNegocio.Commit;
      Datos.FDTableClientes.Refresh;
      ShowMessage('Se Agrego Correctamente El Cliente.');
    except
      Datos.FDConnectionNegocio.Rollback;
      raise;
    end;
  end
  else
  begin
    ShowMessage('Asegurese De Completar Todos Los Campos Para Insertar Un Cliente.');
  end;
end;

procedure TFOpcionesClientes.SpeedButtonUpdateClienteClick(Sender: TObject);
begin
  if (EditNombre.Text <> '') and (EditApellido.Text <> '') and (EditDireccion.Text <> '') then
  begin
    Datos.FDConnectionNegocio.StartTransaction;
    try
      with Datos.FDStoredProcModificarCliente do
      begin
        Prepare;
        Params.ParamByName('nombre').AsString := EditNombre.Text;
        Params.ParamByName('apellido').AsString := EditApellido.Text;
        Params.ParamByName('direccion').AsString := EditDireccion.Text;
        Params.ParamByName('idCli').AsInteger := FClientes.ID_CLIENTES;
        ExecProc;
      end;
      Datos.FDConnectionNegocio.Commit;
      Datos.FDTableClientes.Refresh;
      ShowMessage('El Cliente Se Modifico Correctamente.');
    except
      Datos.FDConnectionNegocio.Rollback;
      raise;
    end;
  end
  else
  begin
    ShowMessage('Asegurese De Completar Todos Los Campos Para Modificar El Cliente.');
  end;
end;

end.
