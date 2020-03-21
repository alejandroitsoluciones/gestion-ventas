unit FormOpcionesMarcas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls;

type
  TFOpcionesMarcas = class(TForm)
    Label1: TLabel;
    EditNombreMarca: TEdit;
    SpeedButtonInsertMarca: TSpeedButton;
    SpeedButtonUpdateMarca: TSpeedButton;
    SpeedButtonCerrar: TSpeedButton;
    procedure SpeedButtonInsertMarcaClick(Sender: TObject);
    procedure SpeedButtonUpdateMarcaClick(Sender: TObject);
    procedure SpeedButtonCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOpcionesMarcas: TFOpcionesMarcas;

implementation

{$R *.dfm}

uses MDatos, FormMarcas;


procedure TFOpcionesMarcas.SpeedButtonCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFOpcionesMarcas.SpeedButtonInsertMarcaClick(Sender: TObject);
begin
  if EditNombreMarca.Text <> '' then
  begin
    Datos.FDConnectionNegocio.StartTransaction;
    try
      with Datos.FDStoredProcInsertarMarca do
      begin
        Prepare;
        Params.ParamByName('nombre_marca').AsString := EditNombreMarca.Text;
        ExecProc;
      end;
      Datos.FDConnectionNegocio.Commit;
      Datos.FDTableMarcas.Refresh;
      ShowMessage('La Marca Fue Agregada Correctamente.');
    except
      Datos.FDConnectionNegocio.Rollback;
      raise;
    end;
  end
  else
  begin
    ShowMessage('Complete El Campo Para Guardar.');
  end;
end;

procedure TFOpcionesMarcas.SpeedButtonUpdateMarcaClick(Sender: TObject);
begin
  if (EditNombreMarca.Text <> '') then
  begin
    Datos.FDConnectionNegocio.StartTransaction;
    try
      with Datos.FDStoredProcModificarMarca do
      begin
        Prepare;
        Params.ParamByName('marca').AsString := EditNombreMarca.Text;
        Params.ParamByName('idMar').AsInteger := FMarcas.ID_MARCAS;
        ExecProc;
      end;
      Datos.FDConnectionNegocio.Commit;
      Datos.FDTableMarcas.Refresh;
      ShowMessage('La Marca Se Modifico Correctamente.');
    except
      Datos.FDConnectionNegocio.Rollback;
      raise;
    end;
  end
  else
  begin
    ShowMessage('Asegurese De Completar Todos Los Campos Para Modificar La Marca.');
  end;
end;

end.
