unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Menus, uDTMConexao, Enter, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  uFrmAtualizaDB, uCadUsuario, cUsuarioLogado, Vcl.ComCtrls;

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
    CATEGORIA2: TMenuItem;
    FICHADECLIENTE1: TMenuItem;
    PRODUTOSPORCATEGORIA1: TMenuItem;
    USURIO1: TMenuItem;
    N5: TMenuItem;
    ALTERARSENHA1: TMenuItem;
    StbPrincipal: TStatusBar;
    procedure menuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Categoria1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cliente1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure CATEGORIA2Click(Sender: TObject);
    procedure Cliente2Click(Sender: TObject);
    procedure FICHADECLIENTE1Click(Sender: TObject);
    procedure Produto2Click(Sender: TObject);
    procedure PRODUTOSPORCATEGORIA1Click(Sender: TObject);
    procedure Vendapordata1Click(Sender: TObject);
    procedure USURIO1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ALTERARSENHA1Click(Sender: TObject);
  private
    { Private declarations }

    TeclaEnter: TMREnter;
    procedure AtualizacaoBancoDados(aForm: TfrmAtualizaDB);

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  oUsuarioLogado: TUsuarioLogado;



implementation

{$R *.dfm}

uses uCadCategoria, uCadCliente, uCadProduto, uProVenda, uRelCategoria,
 cCadCliente, uRelCadCliente, uRelCadClienteFicha, uRelCadProduto,
  uRelCadProdutoComGrupoCategoria, uSelecionarData, uRelVendaPorData, uLogin, uAlterarSenha;

procedure TfrmPrincipal.Categoria1Click(Sender: TObject);
begin
  frmCadCategoria := TfrmCadCategoria.Create(Self);
  frmCadCategoria.ShowModal;
  frmCadCategoria.Release;
end;

procedure TfrmPrincipal.CATEGORIA2Click(Sender: TObject);
begin
  frmRelCategoria := TfrmRelCategoria.Create(Self);
  frmRelCategoria.Relatorio.PreviewModal;
  frmRelCategoria.Release;
end;

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
  frmCadCliente := TfrmCadCliente.Create (Self);
  frmCadCliente.ShowModal;
  frmCadCliente.Release;
end;

procedure TfrmPrincipal.Cliente2Click(Sender: TObject);
begin
  frmRelCadCliente := TfrmRelCadCliente.Create (Self);
  frmRelCadCliente.Relatorio.PreviewModal;
  frmRelCadCliente.Release;
end;

procedure TfrmPrincipal.FICHADECLIENTE1Click(Sender: TObject);
begin
  frmRelCadClienteFicha := TfrmRelCadClienteFicha.Create (Self);
  frmRelCadClienteFicha.Relatorio.PreviewModal;
  frmRelCadClienteFicha.Release;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(TeclaEnter);
  FreeAndNil(dtmPrincipal);

  if Assigned(oUsuarioLogado) then
     FreeAndNil(oUsuarioLogado);

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

   frmAtualizaDB := TfrmAtualizaDB.Create(self);
   frmAtualizaDB.Show;
   frmAtualizaDB.Refresh;

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

   AtualizacaoBancoDados(frmAtualizaDB);
   frmAtualizaDB.Free;

   TeclaEnter := TMREnter.Create(Self);
   TeclaEnter.FocusEnabled := True;
   TeclaEnter.FocusColor := clInfoBk;

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin

  try
    oUsuarioLogado := TUsuarioLogado.Create;

    frmLogin := TfrmLogin.Create(Self);
    frmLogin.ShowModal;

  finally
    frmLogin.Release;
    StbPrincipal.Panels[0].Text :='USU�RIO: '+oUsuarioLogado.nome;
  end;

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

procedure TfrmPrincipal.Produto2Click(Sender: TObject);
begin
  frmRelCadProduto := TfrmRelCadProduto.Create (Self);
  frmRelCadProduto.Relatorio.PreviewModal;
  frmRelCadProduto.Release;
end;

procedure TfrmPrincipal.PRODUTOSPORCATEGORIA1Click(Sender: TObject);
begin
  frmRelCadProdutoComGrupoCategoria := TfrmRelCadProdutoComGrupoCategoria.Create (Self);
  frmRelCadProdutoComGrupoCategoria.Relatorio.PreviewModal;
  frmRelCadProdutoComGrupoCategoria.Release;
end;

procedure TfrmPrincipal.USURIO1Click(Sender: TObject);
begin
  frmCadUsuario := TfrmCadUsuario.Create (Self);
  frmCadUsuario.ShowModal;
  frmCadUsuario.Release;
end;

procedure TfrmPrincipal.Vendapordata1Click(Sender: TObject);
begin
  Try
    frmSelecionarData := TfrmSelecionarData.Create(Self);
    frmSelecionarData.ShowModal;

    frmRelProVendaPorData:=TfrmRelProVendaPorData.Create(self);
    frmRelProVendaPorData.QryVendas.Close;
    frmRelProVendaPorData.QryVendas.ParamByName('DataInicio').AsDate:=frmSelecionarData.EdtDataInicio.Date;
    frmRelProVendaPorData.QryVendas.ParamByName('DataFim').AsDate:=frmSelecionarData.EdtDataFinal.Date;
    frmRelProVendaPorData.QryVendas.Open;
    frmRelProVendaPorData.Relatorio.PreviewModal;

  finally
    frmSelecionarData.Release;
  end;
end;

procedure TfrmPrincipal.Vendas1Click(Sender: TObject);
begin
  frmProVenda := TfrmProVenda.Create (Self);
  frmProVenda.ShowModal;
  frmProVenda.Release;
end;

procedure TfrmPrincipal.ALTERARSENHA1Click(Sender: TObject);
begin
  frmAlterarSenha := TfrmAlterarSenha.Create (Self);
  frmAlterarSenha.ShowModal;
  frmAlterarSenha.Release;
end;

procedure TfrmPrincipal.AtualizacaoBancoDados(aForm: TfrmAtualizaDB);
begin
  aForm.chkConexao.Checked := true;
  aForm.Refresh;

  DtmPrincipal.QryScriptCategorias.ExecSQL;
  AForm.chkCategoria.Checked := True;
  aForm.Refresh;
  Sleep(100);

  DtmPrincipal.QryScriptProdutos.ExecSQL;
  AForm.chkProduto.Checked := True;
  aForm.Refresh;
  Sleep(100);

  DtmPrincipal.QryScriptClientes.ExecSQL;
  AForm.chkCliente.Checked := True;
  aForm.Refresh;
  Sleep(100);

  DtmPrincipal.QryScriptVendas.ExecSQL;
  AForm.chkVendas.Checked := True;
  aForm.Refresh;
  Sleep(100);

  DtmPrincipal.QryScriptItensVendas.ExecSQL;
  AForm.chkItensVenda.Checked := True;
  aForm.Refresh;
  Sleep(100);

  DtmPrincipal.QryScriptUsuarios.ExecSQL;
  AForm.chkUsuarios.Checked := True;
  aForm.Refresh;
  Sleep(100);

end;

end.
