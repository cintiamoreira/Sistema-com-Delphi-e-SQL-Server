unit uRelCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, uDTMConexao,
  RLReport, RLFilters, RLPDFFilter, RLXLSFilter, RLXLSXFilter;

type
  TfrmRelCadProduto = class(TForm)
    Relatorio: TRLReport;
    QryProdutos: TZQuery;
    dtsProdutos: TDataSource;
    Cabecalho: TRLBand;
    RLDraw1: TRLDraw;
    RLPDFFilter1: TRLPDFFilter;
    Rodape: TRLBand;
    RLDraw2: TRLDraw;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand2: TRLBand;
    RLPanel1: TRLPanel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLXLSXFilter1: TRLXLSXFilter;
    RLXLSFilter1: TRLXLSFilter;
    QryProdutosprodutoId: TIntegerField;
    QryProdutosNome: TWideStringField;
    QryProdutosValor: TFloatField;
    QryProdutosQuantidade: TFloatField;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  frmRelCadProduto: TfrmRelCadProduto;

implementation

{$R *.dfm}

procedure TfrmRelCadProduto.FormCreate(Sender: TObject);
begin
   QryProdutos.Open;
end;

procedure TfrmRelCadProduto.FormDestroy(Sender: TObject);
begin
   QryProdutos.Close;
end;

end.
