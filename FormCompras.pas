unit FormCompras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Grids, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFCompras = class(TForm)
    GroupBoxDatosPedido: TGroupBox;
    GroupBoxDatosProveedor: TGroupBox;
    GroupBoxDetalleProductos: TGroupBox;
    GroupBoxTotalPedido: TGroupBox;
    GroupBoxOpciones: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditNumPedido: TEdit;
    EditFecha: TEdit;
    EditNombreProv: TEdit;
    EditDireccionProv: TEdit;
    EditTelefonoProv: TEdit;
    EditTotal: TEdit;
    StringGridDetalleCompra: TStringGrid;
    SpeedButtonGuardarPedido: TSpeedButton;
    SpeedButtonCerrar: TSpeedButton;
    SpeedButtonCalcularTotal: TSpeedButton;
    SpeedButtonAgregarProductos: TSpeedButton;
    SpeedButtonQuitarProducto: TSpeedButton;
    SpeedButtonAgregarProveedor: TSpeedButton;
    SpeedButtonQuitarProveedor: TSpeedButton;
    Timer: TTimer;
    procedure SpeedButtonAgregarProductosClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonCalcularTotalClick(Sender: TObject);
    procedure SpeedButtonCerrarClick(Sender: TObject);
    procedure SpeedButtonQuitarProductoClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure SpeedButtonQuitarProveedorClick(Sender: TObject);
    procedure SpeedButtonAgregarProveedorClick(Sender: TObject);
    procedure SpeedButtonGuardarPedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_Compras, ID_Proveedores, Num_Pedido, Fila : Integer;
    Total, SubTotal : Double;
  end;

var
  FCompras: TFCompras;

implementation

{$R *.dfm}

uses FormProductos, MDatos, FormProveedores, FormPrincipal;

procedure TFCompras.FormActivate(Sender: TObject);
begin
  StringGridDetalleCompra.Cells[0,0] := 'COD';
  StringGridDetalleCompra.Cells[1,0] := 'SERVICIO';
  StringGridDetalleCompra.Cells[2,0] := 'IMPORTE UNITARIO';
  StringGridDetalleCompra.Cells[3,0] := 'CANTIDAD';

  with Datos.FDQueryNumeroPedido do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM sis_num_pedido');
    Open;
    Num_Pedido := Fields.FieldByName('num_pedido').AsInteger;
  end;
  if Num_Pedido = null then
  begin
    Num_Pedido := 1;
    EditNumPedido.Text := IntToStr(Num_Pedido);
  end
  else
  begin
    Num_Pedido := Num_Pedido + 1;
    EditNumPedido.Text := IntToStr(Num_Pedido);
  end;

  ID_Proveedores := 0;
  ID_Compras := 0;

end;

procedure TFCompras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFCompras.SpeedButtonAgregarProductosClick(Sender: TObject);
begin
  FProductos := TFProductos.Create(Self);
  FProductos.EditBuscarProductos.Enabled := False;
  FProductos.DBGridProductos.Visible := False;
  FProductos.DBGridProductosCompras.Visible := True;
  FProductos.SpeedButtonSeleccionarProductoCompras.Visible := True;
  FProductos.SpeedButtonSelectProducto.Visible := False;
  FProductos.ShowModal;
end;

procedure TFCompras.SpeedButtonAgregarProveedorClick(Sender: TObject);
begin
  FProveedores := TFProveedores.Create(Self);
  FProveedores.SpeedButtonSeleccionarProveedor.Enabled := True;
  FProveedores.ShowModal;
end;

procedure TFCompras.SpeedButtonCalcularTotalClick(Sender: TObject);
var
  I : Integer;
begin
  Total := 0;
  for I := 1 to StringGridDetalleCompra.RowCount - 1 do
  begin
    if not StringGridDetalleCompra.Cells[0,I].IsEmpty then
    begin
      SubTotal := StrToFloat(StringGridDetalleCompra.Cells[2,I]) * StrToInt(StringGridDetalleCompra.Cells[3,I]);
      Total := Total + SubTotal;
      EditTotal.Text := FloatToStr(Total);
    end;
  end;
end;

procedure TFCompras.SpeedButtonCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFCompras.SpeedButtonGuardarPedidoClick(Sender: TObject);
var
  J : Integer;
begin
  if ID_Proveedores <> 0 then
  begin
    if EditTotal.Text <> '' then
    begin
      with Datos.FDStoredProcGuardarCompra do
      begin
        Prepare;
        Params.ParamByName('num_pedido').AsInteger := StrToInt(EditNumPedido.Text);
        Params.ParamByName('fecha').AsDateTime := StrToDateTime(EditFecha.Text);
        Params.ParamByName('total').AsFloat := StrToFloat(EditTotal.Text);
        Params.ParamByName('idProv').AsInteger := ID_Proveedores;
        ExecProc;

        if RowsAffected <> 0 then
        begin
          with Datos.FDQueryUltimaCompra do
          begin
            SQL.Clear;
            SQL.Add('SELECT * FROM sis_ultima_compra');
            Open();
            ID_Compras := Fields.FieldByName('id_compras').AsInteger;

            if RecordCount <> 0 then
            begin
              for J := 1 to StringGridDetalleCompra.RowCount do
              begin
                if not StringGridDetalleCompra.Cells[0,J].IsEmpty then
                begin
                  with Datos.FDStoredProcGuardarDetalleCompra do
                  begin
                    Prepare;
                    Params.ParamByName('idComp').AsInteger := ID_Compras;
                    Params.ParamByName('idPro').AsInteger := StrToInt(StringGridDetalleCompra.Cells[0,J]);
                    Params.ParamByName('cant').AsInteger := StrToInt(StringGridDetalleCompra.Cells[3,J]);
                    ExecProc;

                    if RowsAffected <> 0 then
                    begin
                      with Datos.FDStoredProcActualizarStockCompra do
                      begin
                        Prepare;
                        Params.ParamByName('idPro').AsInteger := StrToInt(StringGridDetalleCompra.Cells[0,J]);
                        Params.ParamByName('Cant').AsInteger := StrToInt(StringGridDetalleCompra.Cells[3,J]);
                        ExecProc;
                        Datos.FDTableProductos.Refresh;
                      end;
                    end;
                  end;
                end;
                StringGridDetalleCompra.RowCount := StringGridDetalleCompra.RowCount - 1;
              end;
              if (Datos.FDStoredProcGuardarDetalleCompra.RowsAffected <> 0) and (Datos.FDStoredProcActualizarStockCompra.RowsAffected <> 0) then
              begin
                Datos.FDTableProductosCompras.Refresh;
                ShowMessage('La Compra Se Realizo Correctamente.');
                FCompras.Close;
                FPrincipal.MainMenu.Items[4].Items[0].Click;
              end;
            end
            else
            begin
              ShowMessage('No Se Encontro La Ultima Compra.');
            end;
          end;
        end
        else
        begin
          ShowMessage('Error Al Guardar La Compra.');
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
    ShowMessage('Elija Un Proveedor Para La Generacion Del Pedido.');
  end;
end;

procedure TFCompras.SpeedButtonQuitarProductoClick(Sender: TObject);
var
  I : Integer;
begin
  Fila := StringGridDetalleCompra.Row;

  if not StringGridDetalleCompra.Cells[0,Fila].IsEmpty and (Fila <> 0) then
  begin
    for I := Fila to StringGridDetalleCompra.RowCount-1 do
      begin
        StringGridDetalleCompra.Cells[0,I]:= StringGridDetalleCompra.Cells[0,I+1];
        StringGridDetalleCompra.Cells[1,I]:= StringGridDetalleCompra.Cells[1,I+1];
        StringGridDetalleCompra.Cells[2,I]:= StringGridDetalleCompra.Cells[2,I+1];
        StringGridDetalleCompra.Cells[3,I]:= StringGridDetalleCompra.Cells[3,I+1];
      end;
    StringGridDetalleCompra.RowCount := StringGridDetalleCompra.RowCount - 1;
    SpeedButtonCalcularTotal.Click;
  end
  else
  begin
    ShowMessage('La Fila Esta Vacia. No Se Puede Quitar.');
    EditTotal.Text := IntToStr(0);
  end;
end;

procedure TFCompras.SpeedButtonQuitarProveedorClick(Sender: TObject);
begin
  if (EditNombreProv.Text <> '') and (EditDireccionProv.Text <> '') and (EditTelefonoProv.Text <> '') then
  begin
    EditNombreProv.Clear;
    EditDireccionProv.Clear;
    EditTelefonoProv.Clear;
    ID_Proveedores := 0;
  end
  else
  begin
    ShowMessage('No Hay Proveedores Seleccionados.');
  end;
end;

procedure TFCompras.TimerTimer(Sender: TObject);
begin
  EditFecha.Text := DateTimeToStr(now);
end;

end.
