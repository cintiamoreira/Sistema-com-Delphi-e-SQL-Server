unit uRelCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, uDTMConexao,
  RLReport, RLFilters, RLPDFFilter, RLXLSFilter, RLXLSXFilter;

type
  TfrmRelCategoria = class(TForm)
    Relatorio: TRLReport;
    QryCategorias: TZQuery;
    dtsCategorias: TDataSource;
    QryCategoriascategoriaId: TIntegerField;
    QryCategoriasdescricao: TWideStringField;
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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  frmRelCategoria: TfrmRelCategoria;

implementation

{$R *.dfm}

procedure TfrmRelCategoria.FormCreate(Sender: TObject);
begin
   QryCategorias.Open;
end;

procedure TfrmRelCategoria.FormDestroy(Sender: TObject);
begin
   QryCategorias.Close;
end;

end.
