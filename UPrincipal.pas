unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConexao;

type
  TfrmPrincipal = class(TForm)
    mainPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    Movimentao1: TMenuItem;
    Relatrio1: TMenuItem;
    Cliente1: TMenuItem;
    N1: TMenuItem;
    Categoria1: TMenuItem;
    Produto1: TMenuItem;
    N2: TMenuItem;
    menuFechar: TMenuItem;
    Vendas1: TMenuItem;
    Cliente2: TMenuItem;
    N3: TMenuItem;
    Produto2: TMenuItem;
    N4: TMenuItem;
    Vendapordata1: TMenuItem;
    procedure menuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

  {
   dtmConexao :=  TdtmConexao.Create(Self);
   dtmConexao.ConexaoDB.SQLHourGlass := True;
   dtmConexao.ConexaoDB.Protocol := 'mssql';
   dtmConexao.ConexaoDB.LibraryLocation := 'C:\Users\cinti\Desktop\Projetos Delphi\Delphi e sql server\ntwdblib.dll';
   dtmConexao.ConexaoDB.HostName := '.\SQLEXPRESS';
   dtmConexao.ConexaoDB.Port := 1433;
   dtmConexao.ConexaoDB.User := 'sa';
   dtmConexao.ConexaoDB.Password := 'ciih';
   dtmConexao.ConexaoDB.Database := 'vendas';
   dtmConexao.ConexaoDB.Connected := True;

   }

   dtmConexao :=  TdtmConexao.Create(Self);
   with dtmConexao.ConexaoDB do
   begin
     SQLHourGlass := True;
     Protocol := 'mssql';
     LibraryLocation := 'C:\Users\cinti\Desktop\Projetos Delphi\Delphi e sql server\ntwdblib.dll';
     HostName := '.\SQLEXPRESS';
     Port := 1433;
     User := 'sa';
     Password := 'ciih';
     Database := 'vendas';
     Connected := True;

   end;

end;

procedure TfrmPrincipal.menuFecharClick(Sender: TObject);
begin
   Close;
   //ou
   //Application.Terminate;
end;

end.
