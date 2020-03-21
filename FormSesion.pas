unit FormSesion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFSesion = class(TForm)
    LabelUsuario: TLabel;
    LabelClave: TLabel;
    EditUsuario: TEdit;
    EditClave: TEdit;
    CheckBoxVerClave: TCheckBox;
    SpeedButtonIniciar: TSpeedButton;
    SpeedButtonCerrar: TSpeedButton;
    procedure CheckBoxVerClaveClick(Sender: TObject);
    procedure SpeedButtonCerrarClick(Sender: TObject);
    procedure SpeedButtonIniciarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_USUARIO, EMPLEADO_ID : Integer;

  end;

var
  FSesion: TFSesion;

implementation

{$R *.dfm}

uses MDatos, FormPrincipal;

procedure TFSesion.CheckBoxVerClaveClick(Sender: TObject);
begin
  //Si el CheckBox fue tildado
  if CheckBoxVerClave.Checked then//Entonces
  begin
    //Modifico la propiedad PasswordChar del TEdit "Clave" por
    //el valor por defecto y ver la clave.
    EditClave.PasswordChar := #0;
  end
  else//Sino
  begin
    //Modifico la propiedad PasswordChar del TEdit para ocultar nuevamente la clave.
    EditClave.PasswordChar := '*';
  end;
end;

procedure TFSesion.SpeedButtonCerrarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFSesion.SpeedButtonIniciarClick(Sender: TObject);
begin
  //Inicializacion de bloque try.
  try
    //Llamado al objeto FDConnection para conectar con el servidor y
    //base de datos.
    Datos.FDConnectionNegocio.Connected := True;
    //Se invoca al objeto FDQuery y se trabaja con sus atributos.
    with Datos.FDQuerySesion do
    begin
      //Setear valor del parametro USUARIO para ejecutar la consulta de validacion
      //de usuario.
      Params.ParamByName('USUARIO').AsString := EditUsuario.Text;
      //Setear valor del parametro CLAVE para ejecutar la consulta de validacion
      //de usuario.
      Params.ParamByName('CLAVE').AsString := EditClave.Text;
      //Se llama al metodo Open del FDQuery para ejecutar una consulta SELECT
      //De otra forma si fuera INSERT, UPDATE, DELETE se llama al metodo
      //ExecSQL.
      Open();
      ID_USUARIO := Fields.FieldByName('id_usuarios').AsInteger;
      //Se evalua el resultado de la consulta llamando al valor del abrituto
      //del objeto FDQuery llamado RecordCount, que contiene el numero
      //las tuplas o filas obtenidas en la consulta.
      //En caso de que sea distinto de cero entonces
      if RecordCount <> 0 then
      begin
        //Se toma los datos del empleado al momento de generar una venta tener
        //identificdo al mismo.
        with Datos.FDQuerySeleccionEmpleado do
        begin
          SQL.Clear;
          SQL.Add('CALL SELECCIONAR_EMPLEADO(:IDUSUARIOS)');
          Params.ParamByName('IDUSUARIOS').AsInteger := ID_USUARIO;
          Open();
          EMPLEADO_ID := Fields.FieldByName('id_empleados').AsInteger;
        end;
        //Cerramos o destruimos el formulacion de sesion.
        FSesion.DestroyWindowHandle;
        //Instanciamos y mostramos el formulario principal.
        FPrincipal := TFPrincipal.Create(Self);
        //Asignacion del resultado (id_empleados) de la consulta anterior que se
        //encuentra en el procedimiento SELECCIONAR_EMPLEADO
        FPrincipal.ID_EMPLEADO := EMPLEADO_ID;
        //Muestro el formulario con el menu principal.
        FPrincipal.ShowModal;
      end
      else //De lo contrario.
      begin
        //Mostramos mensaje de error, Y liberamos los Edit para que vuelva a
        //colocar un usuario y contraseña.
        ShowMessage('Intente Nuevamente');
        EditUsuario.Clear;
        EditClave.Clear;
      end;
    end;
  finally
    //Finalmente se desconecta el servidor y la base de datos una vez logueado
    //por cuestiones de seguridad. En caso de querer hacer alguna otra operacion
    //con la base de datos se procedera a conectar nuevamente llamando al atributo
    //Connected y setando el valor True.
    Datos.FDConnectionNegocio.Connected := False;
  end;
end;

end.
