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
      ZDataset;

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

    function Gravar : Boolean;
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
function TCategoria.Apagar: Boolean;
begin
  ShowMessage('Apagado');
  Result := True;
end;

function TCategoria.Atualizar: Boolean;
begin
  ShowMessage('Atualizado');
  Result := True;
end;

function TCategoria.Gravar: Boolean;
begin
  ShowMessage('Gravado');
  Result := True;
end;

function TCategoria.Selecionar(id: Integer): Boolean;
begin
  Result := True;
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