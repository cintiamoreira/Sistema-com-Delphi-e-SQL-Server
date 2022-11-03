unit cCadCategoria;

interface

//Lista de Units
uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     ZConnection,
     ZAbstractConnection,
     ZAbstractRODataset,
     ZAbstractDataset,
     ZDataset,
     System.SysUtils;

type
//Declara��o do tipo da Classe

  TCategoria = class

  private
  //Vari�veis Privadas somente dentro da Classe

    ConexaoDB : TZConnection;
    F_categoriaId : Integer; //Int
    F_descricao : string;    //Varchar

    function getCodigo: Integer;
    function getDescricao: string;

    procedure setCodigo(const Value: Integer);
    procedure setDescricao(const Value: string);

  public
  //Construtor de uma Classe

    constructor Create (aConexao : TZConnection);

    destructor Destroy; override;
    //Destroi a Classe usar o Override por causa de Sobrescrever (Override)
    //Vari�veis p�blicas que podem ser trabalhadas fora da Classe

    function Inserir : Boolean;
    function Atualizar : Boolean;
    function Apagar : Boolean;
    function Selecionar (id : Integer) : Boolean;

  published
  //Vari�veis p�blicas utilizadas para propriedades da Classe para fornecer informa��es em runtime

    property codigo : Integer     read getCodigo     write setCodigo;

    property descricao : string   read getDescricao  write setDescricao;

  end;

implementation
//Corpo da Classe

{ TCategoria }

{$REGION 'Constructor and Destructor'}
constructor TCategoria.Create (aConexao : TZConnection);
begin
  ConexaoDB := aConexao;
end;

destructor TCategoria.Destroy;
begin
  inherited;
end;
{$ENDREGION}

{$REGION 'CRUD'}
function TCategoria.Apagar : Boolean;
var Qry:TZQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'C�digo: '+IntToStr (F_categoriaId) +#13+
                'Descri��o: '+F_descricao,mtConfirmation, [mbYes, mbNo],0)=mrNo
  then begin
      Result := false;
      Abort;
  end;

  try
    Result := True;
    Qry := TZQuery.Create(nil);
    Qry.Connection := ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM categorias ' +
                '   WHERE categoriaId =:categoriaId ');

    Qry.ParamByName('categoriaId').AsInteger := F_categoriaId;

    try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    except
      ConexaoDB.Rollback;
     Result := False;
    end;

  finally
    if Assigned (Qry) then
       FreeAndNil (Qry);
  end;
end;

function TCategoria.Atualizar: Boolean;
var Qry : TZQuery;
begin
  try
    Result := True;
    Qry := TZQuery.Create(nil);
    Qry.Connection := ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE categorias ' +
                '   SET descricao =:descricao ' +
                '   WHERE categoriaId =:categoriaId ');

    Qry.ParamByName('categoriaId').AsInteger := Self.F_categoriaId;
    Qry.ParamByName('descricao').AsString    := Self.F_descricao;

    try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    except
      ConexaoDB.Rollback;
     Result := False;
    end;

  finally
    if Assigned (Qry) then
       FreeAndNil (Qry);
  end;
end;

function TCategoria.Inserir: Boolean;
var Qry : TZQuery;
begin
  try
    Result := True;
    Qry := TZQuery.Create(nil);
    Qry.Connection := ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO categorias (descricao) values (:descricao)');
    Qry.ParamByName('descricao').AsString := Self.F_descricao;

     try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    except
      ConexaoDB.Rollback;
     Result := False;
    end;

  finally
    if Assigned (Qry) then
       FreeAndNil (Qry);
  end;
end;

function TCategoria.Selecionar(id: Integer): Boolean;
var Qry : TZQuery;
begin
    try
      Result := True;
      Qry := TZQuery.Create(nil);
      Qry.Connection := ConexaoDB;
      Qry.SQL.Clear;

      Qry.SQL.Add ('SELECT categoriaId, descricao ' +
                  'FROM categorias ' +
                  'WHERE categoriaId=:categoriaId');

      Qry.ParamByName('categoriaId').AsInteger := id;

      try
        Qry.Open;

        Self.F_categoriaId := Qry.FieldByName('categoriaId').AsInteger;
        Self.F_descricao   := Qry.FieldByName('descricao').AsString;
      except
         Result := False;
      end;

  finally
    if Assigned (Qry) then
       FreeAndNil (Qry);
  end;
end;
{$ENDREGION}


{$REGION 'GETS'}


function TCategoria.getCodigo: Integer;
begin
  Result := Self.F_categoriaId;
end;

function TCategoria.getDescricao: string;
begin
  Result := Self.F_descricao;
end;

{$ENDREGION}


{$REGION 'SETS'}
procedure TCategoria.setCodigo(const Value: Integer);
begin
  Self.F_categoriaId := Value;
end;

procedure TCategoria.setDescricao(const Value: string);
begin
   Self.F_descricao := Value;
end;
{$ENDREGION}


end.
