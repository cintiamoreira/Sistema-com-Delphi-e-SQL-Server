unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,

  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, uDTMConexao, uEnum;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tabListagem: TTabSheet;
    tabManutencao: TTabSheet;
    pnlListagem: TPanel;
    mskPesquisar: TMaskEdit;
    btnPesquisar: TBitBtn;
    grdListagem: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnNavigator: TDBNavigator;
    btnCancelar: TBitBtn;
    btnApagar: TBitBtn;
    btnGravar: TBitBtn;
    btnFechar: TBitBtn;
    QryListagem: TZQuery;
    dtsListagem: TDataSource;
    lblIndice: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure mskPesquisarChange(Sender: TObject);

private
    { Private declarations }

  EstadoDoCadastro : TEstadoDoCadastro;

  procedure
    ControlarBotoes
    (btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar: TBitBtn;
    Navegador : TDBNavigator;
    pgcPrincipal: TPageControl;
    Flag : Boolean);

  procedure ControlarIndiceTab (pgcPrincipal: TPageControl; indice: Integer);
    function RetornarCampoTraduzido(Campo: string): string;
    procedure ExibirLabelIndice(Campo: string; aLabel: TLabel);

public
    { Public declarations }

    IndiceAtual : string;

  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

//Procedimento de Controle de Tela
procedure TfrmTelaHeranca.ControlarBotoes
  (btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar: TBitBtn;
  Navegador : TDBNavigator;
  pgcPrincipal: TPageControl;
  Flag : Boolean);

begin

  btnNovo.Enabled := Flag;
  btnApagar.Enabled := Flag;
  btnAlterar.Enabled := Flag;
  btnCancelar.Enabled := not (Flag);
  btnGravar.Enabled := not (Flag);
  Navegador.Enabled := Flag;
  pgcPrincipal.Pages[0].TabVisible := Flag;
end;


procedure TfrmTelaHeranca.ControlarIndiceTab (pgcPrincipal: TPageControl; indice:Integer);
begin
  if (pgcPrincipal.Pages[Indice].TabVisible) then
  pgcPrincipal.TabIndex := Indice;
end;


function TfrmTelaHeranca.RetornarCampoTraduzido (Campo : string) : string;
var i : Integer;

begin
  for I := 0 to QryListagem.Fields.Count -1 do begin
    if  QryListagem.Fields[i].FieldName=Campo then begin
        Result := QryListagem.Fields[i].DisplayLabel;
        Break;
    end;
  end;
    
end;

procedure TfrmTelaHeranca.ExibirLabelIndice (Campo: string; aLabel : TLabel);
begin        
  aLabel.Caption := RetornarCampoTraduzido(Campo);
end;      

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
   
   ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar, btnNavigator, pgcPrincipal, false);
   
   EstadoDoCadastro := ecInserir;

end;      

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar, btnNavigator, pgcPrincipal, false);

  EstadoDoCadastro := ecAlterar;

end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar, btnNavigator, pgcPrincipal, true);
  ControlarIndiceTab(pgcPrincipal, 0);

  EstadoDoCadastro := ecNenhum;

end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar, btnNavigator, pgcPrincipal, true);
  ControlarIndiceTab(pgcPrincipal, 0);

  EstadoDoCadastro := ecNenhum;

end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
  Try
    ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar, btnNavigator, pgcPrincipal, true);
    ControlarIndiceTab(pgcPrincipal, 0);

    if (EstadoDoCadastro = ecInserir ) then
        ShowMessage('Inserir')

    else if (EstadoDoCadastro = ecAlterar) then
        ShowMessage ('Alterado')

    else
        ShowMessage ('Nada aconteceu');

  finally
    EstadoDoCadastro := ecNenhum;
  end;
end;

procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QryListagem.Close;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
   
  QryListagem.Connection := dtmConexao.ConexaoDB;
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar, btnNavigator, pgcPrincipal, true);
  dtsListagem.DataSet := QryListagem;
  grdListagem.DataSource := dtsListagem;
  grdListagem.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,
                          dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,
                          dgCancelOnExit,dgTitleClick,dgTitleHotTrack];
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
  if (QryListagem.SQL.Text <> EmptyStr) then begin
      QryListagem.IndexFieldNames := IndiceAtual;
      ExibirLabelIndice(IndiceAtual, lblIndice);
      QryListagem.Open;
  end;
  
  ControlarIndiceTab(pgcPrincipal, 0);
  
end;

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
  IndiceAtual := Column.FieldName;
  QryListagem.IndexFieldNames := IndiceAtual;
  ExibirLabelIndice(IndiceAtual, lblIndice);   
end;
                                   
procedure TfrmTelaHeranca.mskPesquisarChange(Sender: TObject);
begin
  QryListagem.Locate(IndiceAtual, TMaskEdit (Sender).Text, [loPartialKey, loCaseInsensitive]);
end;

end.
