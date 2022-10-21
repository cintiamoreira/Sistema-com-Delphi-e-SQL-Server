unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Menus, uDTMConexao, Enter;

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
    procedure Categoria1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cliente1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
  private
    { Private declarations }

    TeclaEnter: TMREnter;

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategoria, uCadCliente, uCadProduto;

procedure TfrmPrincipal.Categoria1Click(Sender: TObject);
begin
  frmCadCategoria := TfrmCadCategoria.Create(Self);
  frmCadCategoria.ShowModal;
  frmCadCategoria.Release;
end;

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
  frmCadCliente := TfrmCadCliente.Create (Self);
  frmCadCliente.ShowModal;
  frmCadCliente.Release;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(TeclaEnter);
  FreeAndNil(dtmPrincipal);
end;

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

   dtmPrincipal := TdtmPrincipal.Create(Self);
   with dtmPrincipal.ConexaoDB do
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

   TeclaEnter := TMREnter.Create(Self);
   TeclaEnter.FocusEnabled := True;
   TeclaEnter.FocusColor := clInfoBk;

end;

procedure TfrmPrincipal.menuFecharClick(Sender: TObject);
begin
   Close;
   //ou
   //Application.Terminate;
end;

procedure TfrmPrincipal.Produto1Click(Sender: TObject);
begin
  frmCadProduto := TfrmCadProduto.Create (Self);
  frmCadProduto.ShowModal;
  frmCadProduto.Release;
end;

end.
