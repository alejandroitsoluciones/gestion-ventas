unit FormMarcas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids;

type
  TFMarcas = class(TForm)
    GroupBoxBusqueda: TGroupBox;
    GroupBoxOpciones: TGroupBox;
    DBGridMarcas: TDBGrid;
    SpeedButtonNuevaMarca: TSpeedButton;
    SpeedButtonModificarMarca: TSpeedButton;
    SpeedButtonEliminarMarca: TSpeedButton;
    SpeedButtonCerrar: TSpeedButton;
    EditBuscarMarca: TEdit;
    procedure SpeedButtonCerrarClick(Sender: TObject);
    procedure SpeedButtonNuevaMarcaClick(Sender: TObject);
    procedure SpeedButtonModificarMarcaClick(Sender: TObject);
    procedure DBGridMarcasCellClick(Column: TColumn);
    procedure SpeedButtonEliminarMarcaClick(Sender: TObject);
    procedure EditBuscarMarcaChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MENSAJE, ID_MARCAS : Integer;
  end;

var
  FMarcas: TFMarcas;

implementation

{$R *.dfm}

uses MDatos, FormOpcionesMarcas;

procedure TFMarcas.DBGridMarcasCellClick(Column: TColumn);
begin
  if EditBuscarMarca.Text = '' then
  begin
    with Datos.FDTableMarcas do
    begin
      ID_MARCAS := Fields.FieldByName('id_marcas').AsInteger;
    end;
  end
  else
  begin
    with Datos.FDQueryBuscarMarcas do
    begin
      ID_MARCAS := Fields.FieldByName('id_marcas').AsInteger;
    end;
  end;
end;

procedure TFMarcas.EditBuscarMarcaChange(Sender: TObject);
begin
  if EditBuscarMarca.Text = '' then
  begin
    DBGridMarcas.DataSource := Datos.DataSourceMarcas;
  end
  else
  begin
    with Datos.FDQueryBuscarMarcas do
    begin
      SQL.Clear;
      SQL.Add('CALL BUSCAR_MARCA (:nombre_mar)');
      Params.ParamByName('nombre_mar').AsString := '%'+EditBuscarMarca.Text+'%';
      Open;
    end;
    DBGridMarcas.DataSource := Datos.DataSourceBuscarMarcas;
  end;
end;

procedure TFMarcas.FormActivate(Sender: TObject);
begin
  try
    //Inicializacion de variable ID_MARCAS.
    ID_MARCAS := 0;
    Datos.FDConnectionNegocio.Connected := True;
  finally
    Datos.FDTableMarcas.Active := True;
  end;

end;

procedure TFMarcas.SpeedButtonCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFMarcas.SpeedButtonEliminarMarcaClick(Sender: TObject);
begin
  if ID_MARCAS <> 0 then
  begin
    MENSAJE := MessageDlg('¿Esta Seguro De Eliminar La Marca? - Si La Marca Se Perderan Los Productos De La Marca',mtConfirmation,[mbYes, mbNo],0);
    if MENSAJE = mrYes then
    begin
      Datos.FDConnectionNegocio.StartTransaction;
      try
        with Datos.FDStoredProcEliminarMarcas do
        begin
          Prepare;
          Params.ParamByName('idMar').AsInteger := ID_MARCAS;
          ExecProc;
        end;
        Datos.FDConnectionNegocio.Commit;
        Datos.FDTableMarcas.Refresh;
        ShowMessage('La Marca Se Ha Eliminado Correctamente.');
      except
        Datos.FDConnectionNegocio.Rollback;
        raise;
      end;
    end;
  end
  else
  begin
    ShowMessage('Elija Una Marca De La Grilla Para Eliminar.');
  end;
end;

procedure TFMarcas.SpeedButtonModificarMarcaClick(Sender: TObject);
begin
  if ID_MARCAS <> 0 then
  begin
    FOpcionesMarcas := TFOpcionesMarcas.Create(Self);
    FOpcionesMarcas.Caption := 'Modificar Marca';
    with Datos.FDQuerySeleccionarMarca do
    begin
      SQL.Clear;
      SQL.Add('CALL SELECCION_MARCA (:idMar)');
      Params.ParamByName('idMar').AsInteger := ID_MARCAS;
      Open;

      FOpcionesMarcas.EditNombreMarca.Text := Fields.FieldByName('nombre_marca').AsString;
    end;

    FOpcionesMarcas.SpeedButtonInsertMarca.Visible := False;
    FOpcionesMarcas.SpeedButtonUpdateMarca.Visible := True;
    FOpcionesMarcas.ShowModal;
  end
  else
  begin
    ShowMessage('Elija Una Marca Para Modificar.');
  end;
end;

procedure TFMarcas.SpeedButtonNuevaMarcaClick(Sender: TObject);
begin
  FOpcionesMarcas := TFOpcionesMarcas.Create(Self);
  FOpcionesMarcas.Caption := 'Nueva Marca';
  FOpcionesMarcas.SpeedButtonUpdateMarca.Visible := False;
  FOpcionesMarcas.ShowModal;
end;

end.
