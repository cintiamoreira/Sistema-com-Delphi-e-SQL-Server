unit uRelVendaPorData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, uDTMConexao,
  RLReport, RLFilters, RLPDFFilter, RLXLSFilter, RLXLSXFilter;

type
  TfrmRelProVendaPorData = class(TForm)
    QryVendas: TZQuery;
    dtsVendas: TDataSource;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSXFilter1: TRLXLSXFilter;
    RLXLSFilter1: TRLXLSFilter;
    Relatorio: TRLReport;
    Cabecalho: TRLBand;
    RLDraw1: TRLDraw;
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
    RLDBText4: TRLDBText;
    RLBand2: TRLBand;
    RLPanel1: TRLPanel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    BandaDoGrupo: TRLGroup;
    RLBand3: TRLBand;
    RLLabel7: TRLLabel;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLLabel8: TRLLabel;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDraw3: TRLDraw;
    RLLabel9: TRLLabel;
    QryVendasvendaId: TIntegerField;
    QryVendasclienteId: TIntegerField;
    QryVendasnome: TWideStringField;
    QryVendasdataVenda: TDateTimeField;
    QryVendastotalVenda: TFloatField;
    RLBand5: TRLBand;
    RLDraw4: TRLDraw;
    RLLabel6: TRLLabel;
    RLDBResult2: TRLDBResult;
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  frmRelProVendaPorData: TfrmRelProVendaPorData;

implementation

{$R *.dfm}

procedure TfrmRelProVendaPorData.FormDestroy(Sender: TObject);
begin
   QryVendas.Close;
end;

end.
