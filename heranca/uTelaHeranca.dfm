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
  OnCreate = FormCreate
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
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object tabManutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 1
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
    object btnNovo: TBitBtn
      Left = 16
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Novo'
      TabOrder = 0
    end
    object btnAlterar: TBitBtn
      Left = 97
      Top = 6
      Width = 75
      Height = 26
      Caption = '&Alterar'
      TabOrder = 1
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
    end
    object btnApagar: TBitBtn
      Left = 340
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apaga&r'
      TabOrder = 4
    end
    object btnGravar: TBitBtn
      Left = 259
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 5
    end
    object btnFechar: TBitBtn
      Left = 845
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 6
      OnClick = btnFecharClick
    end
  end
  object pnlListagem: TPanel
    Left = 4
    Top = 26
    Width = 929
    Height = 87
    TabOrder = 2
    object mskPesquisar: TMaskEdit
      Left = 12
      Top = 24
      Width = 514
      Height = 23
      TabOrder = 0
      Text = ''
      TextHint = 'Digite aqui'
    end
    object btnPesquisar: TBitBtn
      Left = 532
      Top = 24
      Width = 93
      Height = 23
      Caption = '&Pesquisar'
      TabOrder = 1
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