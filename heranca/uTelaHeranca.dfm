object frmTelaHeranca: TfrmTelaHeranca
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Informe aqui o t'#237'tulo'
  ClientHeight = 441
  ClientWidth = 933
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 933
    Height = 400
    ActivePage = tabListagem
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 929
    ExplicitHeight = 399
    object tabListagem: TTabSheet
      Caption = 'Listagem'
      object grdListagem: TDBGrid
        Left = 0
        Top = 0
        Width = 925
        Height = 370
        Align = alClient
        DataSource = dtsListagem
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnTitleClick = grdListagemTitleClick
      end
    end
    object tabManutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 1
      OnShow = FormShow
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 400
    Width = 933
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 399
    ExplicitWidth = 929
    DesignSize = (
      933
      41)
    object btnNovo: TBitBtn
      Left = 16
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnAlterar: TBitBtn
      Left = 97
      Top = 6
      Width = 75
      Height = 26
      Caption = '&Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnNavigator: TDBNavigator
      Left = 536
      Top = 6
      Width = 224
      Height = 25
      DataSource = dtsListagem
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 2
    end
    object btnCancelar: TBitBtn
      Left = 178
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 3
      OnClick = btnCancelarClick
    end
    object btnApagar: TBitBtn
      Left = 340
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apaga&r'
      TabOrder = 4
      OnClick = btnApagarClick
    end
    object btnGravar: TBitBtn
      Left = 259
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 5
      OnClick = btnGravarClick
    end
    object btnFechar: TBitBtn
      Left = 837
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Fechar'
      TabOrder = 6
      OnClick = btnFecharClick
      ExplicitLeft = 833
    end
  end
  object pnlListagem: TPanel
    Left = 8
    Top = 26
    Width = 917
    Height = 87
    TabOrder = 2
    object lblIndice: TLabel
      Left = 24
      Top = 12
      Width = 88
      Height = 15
      Caption = 'Campo Pesquisa'
    end
    object mskPesquisar: TMaskEdit
      Left = 24
      Top = 33
      Width = 490
      Height = 23
      TabOrder = 0
      Text = ''
      TextHint = 'Digite aqui'
      OnChange = mskPesquisarChange
    end
    object btnPesquisar: TBitBtn
      Left = 528
      Top = 33
      Width = 93
      Height = 23
      Caption = '&Pesquisar'
      TabOrder = 1
      Visible = False
    end
  end
  object QryListagem: TZQuery
    Connection = dtmConexao.ConexaoDB
    Params = <>
    Left = 732
    Top = 42
  end
  object dtsListagem: TDataSource
    DataSet = QryListagem
    Left = 828
    Top = 42
  end
end
