unit FormVentas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFVentas = class(TForm)
    GroupBoxDatosComprobante: TGroupBox;
    GroupBoxDatosCliente: TGroupBox;
    GroupBoxDatosDetalles: TGroupBox;
    GroupBoxDatosFacturacion: TGroupBox;
    GroupBoxOpciones: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EditNumComp: TEdit;
    EditFechaHora: TEdit;
    EditNombre: TEdit;
    EditApellido: TEdit;
    EditDireccion: TEdit;
    SpeedButtonAgregarCliente: TSpeedButton;
    SpeedButtonQuitarCliente: TSpeedButton;
    SpeedButtonBuscarProducto: TSpeedButton;
    SpeedButtonQuitarProducto: TSpeedButton;
    SpeedButtonCalcularTotal: TSpeedButton;
    SpeedButtonGuardar: TSpeedButton;
    SpeedButtonCerrar: TSpeedButton;
    StringGrid: TStringGrid;
    EditTotal: TEdit;
    Timer: TTimer;
    procedure TimerTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButtonAgregarClienteClick(Sender: TObject);
    procedure SpeedButtonBuscarProductoClick(Sender: TObject);
    procedure SpeedButtonQuitarClienteClick(Sender: TObject);
    procedure SpeedButtonQuitarProductoClick(Sender: TObject);
    procedure SpeedButtonCalcularTotalClick(Sender: TObject);
    procedure SpeedButtonCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonGuardarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Fila, ID_Cliente, ID_Venta, Num_Comp : Integer;
    Total, SubTotal : Double;
  end;

var
  FVentas: TFVentas;

implementation

{$R *.dfm}

uses MDatos, FormClientes, FormProductos, FormPrincipal;

procedure TFVentas.FormActivate(Sender: TObject);
begin
  //Armado De StringGrid
  StringGrid.Cells[0,0] := 'COD';
  StringGrid.Cells[1,0] := 'SERVICIO';
  StringGrid.Cells[2,0] := 'IMPORTE UNITARIO';
  StringGrid.Cells[3,0] := 'CANTIDAD';

  with Datos.FDQueryNumeroComprobante do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM sis_num_comprobante');
    Open;
    Num_Comp := Fields.FieldByName('num_comp').AsInteger;
  end;
  if Num_Comp = null then
  begin
    Num_Comp := 1;
    EditNumComp.Text := IntToStr(Num_Comp);
  end
  else
  begin
    Num_Comp := Num_Comp + 1;
    EditNumComp.Text := IntToStr(Num_Comp);
  end;
  //Inicializacion De Variables.
  ID_Cliente := 0;
  ID_Venta := 0;
end;

procedure TFVentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFVentas.SpeedButtonAgregarClienteClick(Sender: TObject);
begin
  FClientes := TFClientes.Create(Self);
  FClientes.ShowModal;
end;

procedure TFVentas.SpeedButtonBuscarProductoClick(Sender: TObject);
begin
  FProductos := TFProductos.Create(Self);
  FProductos.DBGridProductos.Visible := True;
  FProductos.DBGridProductosCompras.Visible := False;
  FProductos.SpeedButtonSeleccionarProductoCompras.Visible := False;
  FProductos.SpeedButtonSelectProducto.Visible := True;
  FProductos.ShowModal;
end;

procedure TFVentas.SpeedButtonCalcularTotalClick(Sender: TObject);
var
  I : Integer;
begin
  Total := 0;
  for I := 1 to StringGrid.RowCount - 1 do
  begin
    if not StringGrid.Cells[0,I].IsEmpty then
    begin
      SubTotal := StrToFloat(StringGrid.Cells[2,I]) * StrToInt(StringGrid.Cells[3,I]);
      Total := Total + SubTotal;
      EditTotal.Text := FloatToStr(Total);
    end;
  end;
end;

procedure TFVentas.SpeedButtonCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFVentas.SpeedButtonGuardarClick(Sender: TObject);
var
  J : Integer;
begin
  if ID_Cliente <> 0 then
  begin
    if EditTotal.Text <> '' then
    begin
      with Datos.FDStoredProcGuardarVenta do
      begin
        Prepare;
        Params.ParamByName('vNF').AsInteger := StrToInt(EditNumComp.Text);
        Params.ParamByName('vFH').AsDateTime := StrToDateTime(EditFechaHora.Text);
        Params.ParamByName('vTV').AsFloat := StrToFloat(EditTotal.Text);
        Params.ParamByName('vCLI').AsInteger := ID_Cliente;
        Params.ParamByName('vEMP').AsInteger := FPrincipal.ID_EMPLEADO;
        ExecProc;

        if RowsAffected <> 0 then
        begin
          with Datos.FDQueryUltimaVenta do
          begin
            SQL.Clear;
            SQL.Add('SELECT * FROM sis_ultima_venta');
            Open();
            ID_Venta := Fields.FieldByName('id_ventas').AsInteger;

            if RecordCount <> 0 then
            begin
              for J := 1 to StringGrid.RowCount do
              begin
                if not StringGrid.Cells[0,J].IsEmpty then
                begin
                  with Datos.FDStoredProcGuardarDetalleVenta do
                  begin
                    Prepare;
                    Params.ParamByName('dVENT').AsInteger := ID_Venta;
                    Params.ParamByName('dPRO').AsInteger := StrToInt(StringGrid.Cells[0,J]);
                    Params.ParamByName('dCANT').AsInteger := StrToInt(StringGrid.Cells[3,J]);
                    ExecProc;

                    if RowsAffected <> 0 then
                    begin
                      with Datos.FDStoredProcActualizarStockVenta do
                      begin
                        Prepare;
                        Params.ParamByName('aPRO').AsInteger := StrToInt(StringGrid.Cells[0,J]);
                        Params.ParamByName('aCANT').AsInteger := StrToInt(StringGrid.Cells[3,J]);
                        ExecProc;
                        Datos.FDTableProductos.Refresh;
                      end;
                    end;
                  end;
                end;
                StringGrid.RowCount := StringGrid.RowCount - 1;
              end;
              if (Datos.FDStoredProcGuardarDetalleVenta.RowsAffected <> 0) and (Datos.FDStoredProcActualizarStockVenta.RowsAffected <> 0) then
              begin
                with Datos.FDQueryClientes do
                begin
                  SQL.Clear;
                  SQL.Add('CALL SELECCION_CLIENTE(:IDCLIENTE)');
                  Params.ParamByName('IDCLIENTE').AsInteger := ID_Cliente;
                  Open();
                end;
                with Datos.FDQueryVentas do
                begin
                  SQL.Clear;
                  SQL.Add('CALL SELECCION_VENTA(:IDVENTAS)');
                  Params.ParamByName('IDVENTAS').AsInteger := ID_Venta;
                  Open();
                end;
                with Datos.FDQueryDetalles do
                begin
                  SQL.Clear;
                  SQL.Add('CALL SELECCION_DETALLES(:IDVENTAS)');
                  Params.ParamByName('IDVENTAS').AsInteger := ID_Venta;
                  Open();
                end;
                ShowMessage('La Venta Se Realizo Correctamente.');
                //Datos.frxReportVentas.ShowReport();
                FVentas.Close;
                FPrincipal.MainMenu.Items[2].Items[0].Click;
              end;
            end
            else
            begin
              ShowMessage('No Se Encontro La Ultima Venta.');
            end;
          end;
        end
        else
        begin
          ShowMessage('Error Al Guardar La Venta.');
        end;
      end;
    end
    else
    begin
      ShowMessage('Calcule El Total Antes De Guardar.');
    end;
  end
  else
  begin
    ShowMessage('Elija Un Cliente Para La Facturacion.');
  end;
end;

procedure TFVentas.SpeedButtonQuitarClienteClick(Sender: TObject);
begin
  if (EditNombre.Text <> '') and (EditDireccion.Text <> '') and (EditApellido.Text <> '') then
  begin
    EditNombre.Clear;
    EditDireccion.Clear;
    EditApellido.Clear;
    ID_Cliente := 0;
  end
  else
  begin
    ShowMessage('No Hay Clientes Seleccionados.');
  end;
end;

procedure TFVentas.SpeedButtonQuitarProductoClick(Sender: TObject);
var
  I : Integer;
begin
  Fila := StringGrid.Row;

  if not StringGrid.Cells[0,Fila].IsEmpty and (Fila <> 0) then
  begin
    for I := Fila to StringGrid.RowCount-1 do
      begin
        StringGrid.Cells[0,I]:= StringGrid.Cells[0,I+1];
        StringGrid.Cells[1,I]:= StringGrid.Cells[1,I+1];
        StringGrid.Cells[2,I]:= StringGrid.Cells[2,I+1];
        StringGrid.Cells[3,I]:= StringGrid.Cells[3,I+1];
      end;
    StringGrid.RowCount := StringGrid.RowCount - 1;
    SpeedButtonCalcularTotal.Click;
  end
  else
  begin
    ShowMessage('La Fila Esta Vacia. No Se Puede Quitar.');
    EditTotal.Text := IntToStr(0);
  end;
end;

procedure TFVentas.TimerTimer(Sender: TObject);
begin
  EditFechaHora.Text := DateTimeToStr(now);
end;

end.
