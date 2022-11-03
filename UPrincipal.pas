unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Menus, uDTMConexao, Enter, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  uFrmAtualizaDB, uCadUsuario, cUsuarioLogado, Vcl.ComCtrls, ZDbcIntfs,
  cAtualizacaoBancoDeDados, System.UITypes;

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
    Image1: TImage;

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
     uRelCadProdutoComGrupoCategoria, uSelecionarData, uRelVendaPorData,
     uLogin, uAlterarSenha, cArquivoIni;

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
  DtmPrincipal:=TDtmPrincipal.Create(self);     //Instancia o DataModule
  DtmPrincipal.ConexaoDB.SQLHourGlass:=True;    //Habilita o Cursor em cada transa��o no banco de dados
  DtmPrincipal.ConexaoDB.LibraryLocation:=ExtractFilePath(Application.ExeName)+'ntwdblib.dll';  //Seta a DLL para conexao do SQL
  DtmPrincipal.ConexaoDB.Protocol:='mssql';  //Protocolo do banco de dados
  DtmPrincipal.ConexaoDB.HostName:='.\INSTANCIA'; //Instancia do SQLServer
  DtmPrincipal.ConexaoDB.Port:=1433;          //Porta do SQL Server
  DtmPrincipal.ConexaoDB.User := 'sa';  //Usuario do Banco de Dados
  DtmPrincipal.ConexaoDB.Password:='SENHA';  //Senha do Usu�rio do banco
  DtmPrincipal.ConexaoDB.Database:='BANCODEDADOS';  //Nome do Banco de Dados
  DtmPrincipal.ConexaoDB.Connected:=True;  //Faz a Conex�o do Banco
  }
{  DtmPrincipal:=TDtmPrincipal.Create(self);     //Instancia o DataModule
  with DtmPrincipal.ConexaoDB do begin
    SQLHourGlass:=True;    //Habilita o Cursor em cada transa��o no banco de dados
    LibraryLocation:=ExtractFilePath(Application.ExeName)+'ntwdblib.dll';  //Seta a DLL para conexao do SQL
    Protocol:='mssql';  //Protocolo do banco de dados
    HostName:='.\SERVERCURSO'; //Instancia do SQLServer
    Port:=1433;          //Porta do SQL Server
    User := 'sa';  //Usuario do Banco de Dados
    Password:='mudar@123';  //Senha do Usu�rio do banco
    Database:='vendas';  //Nome do Banco de Dados
    Connected:=True;  //Faz a Conex�o do Banco
  end;
  }

  if not FileExists(TArquivoIni.ArquivoIni) then
  begin
    TArquivoIni.AtualizarIni('SERVER', 'TipoDataBase', 'MSSQL');
    TArquivoIni.AtualizarIni('SERVER', 'HostName', '.\');
    TArquivoIni.AtualizarIni('SERVER', 'Port', '1433');
    TArquivoIni.AtualizarIni('SERVER', 'User', 'sa');
    TArquivoIni.AtualizarIni('SERVER', 'Password', 'ciih');
    TArquivoIni.AtualizarIni('SERVER', 'Database', 'vendas');

    MessageDlg('Arquivo '+ TArquivoIni.ArquivoIni +' CRIADO com sucesso' +#13+
               'CONFIGURE o arquivo antes de inicializar a aplica��o',MtInformation,[mbok],0);
    Application.Terminate;

  end
  else
  begin
    frmAtualizaDB:=TfrmAtualizaDB.Create(self);
    frmAtualizaDB.Show;
    frmAtualizaDB.Refresh;

    dtmPrincipal:=TDtmPrincipal.Create(self);     //Instancia o DataModule
    with DtmPrincipal.ConexaoDB do
    begin
      Connected:=False;
      SQLHourGlass:=False;
      if TArquivoIni.LerIni('SERVER','TipoDataBase')='MSSQL' then
         Protocol:='mssql';  //Protocolo do banco de dados
      LibraryLocation:='C:\Users\cinti\Desktop\Projetos Delphi\Delphi e sql server\ntwdblib.dll';
      HostName:= TArquivoIni.LerIni('SERVER','HostName'); //Instancia do SQLServer
      Port    := StrToInt(TArquivoIni.LerIni('SERVER','Port'));  //Porta do SQL Server
      User    := TArquivoIni.LerIni('SERVER','User');  //Usuario do Banco de Dados
      Password:= TArquivoIni.LerIni('SERVER','Password');  //Senha do Usu�rio do banco
      Database:= TArquivoIni.LerIni('SERVER','DataBase');;  //Nome do Banco de Dados
      AutoCommit:= True;
      TransactIsolationLevel:=tiReadCommitted;
      Connected:=True;  //Faz a Conex�o do Banco
    end;
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
var oAtualizarMSSQL:TAtualizaBancoDadosMSSQL;
begin
  //aForm.chkConexao.Checked := true;
  aForm.Refresh;

  try
    oAtualizarMSSQL := TAtualizaBancoDadosMSSQL.Create(dtmPrincipal.ConexaoDB);
    oAtualizarMSSQL.AtualizarBancoDeDadosMSSQL;
  finally
    if Assigned(oAtualizarMSSQL) then
       FreeAndNil(oAtualizarMSSQL);
  end;

end;
end.
