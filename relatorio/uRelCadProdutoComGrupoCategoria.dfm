object frmRelCadProdutoComGrupoCategoria: TfrmRelCadProdutoComGrupoCategoria
  Left = 0
  Top = 0
  Caption = 'frmRelCadProdutoComGrupoCategoria'
  ClientHeight = 758
  ClientWidth = 802
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Relatorio: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = dtsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    object Cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 75
      BandType = btColumnHeader
      object TRLLabel
        Left = 3
        Top = 16
        Width = 408
        Height = 25
        Caption = 'LISTAGEM DE PRODUTOS POR CATEGORIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 46
        Width = 718
        Height = 29
        Align = faBottom
        DrawKind = dkLine
        Pen.Width = 2
      end
    end
    object Rodape: TRLBand
      Left = 38
      Top = 273
      Width = 718
      Height = 49
      BandType = btFooter
      Transparent = False
      object RLDraw2: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 29
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 3
        Top = 24
        Width = 65
        Height = 16
        Info = itFullDate
        Text = ''
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 629
        Top = 24
        Width = 95
        Height = 16
        Info = itPageNumber
        Text = ''
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 688
        Top = 24
        Width = 121
        Height = 16
        Info = itLastPageNumber
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 661
        Top = 24
        Width = 8
        Height = 16
        Caption = '/'
      end
      object RLLabel2: TRLLabel
        Left = 567
        Top = 24
        Width = 53
        Height = 16
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object BandaDoGrupo: TRLGroup
      Left = 38
      Top = 113
      Width = 718
      Height = 160
      DataFields = 'categoriaId'
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 22
        BandType = btHeader
        Color = 16051965
        ParentColor = False
        Transparent = False
        object RLLabel7: TRLLabel
          Left = 0
          Top = 4
          Width = 72
          Height = 15
          Caption = 'CATEGORIA:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBText5: TRLDBText
          Left = 75
          Top = 4
          Width = 25
          Height = 16
          Alignment = taRightJustify
          DataField = 'categoriaId'
          DataSource = dtsProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText6: TRLDBText
          Left = 125
          Top = 4
          Width = 117
          Height = 16
          DataField = 'DescricaoCategoria'
          DataSource = dtsProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLLabel8: TRLLabel
          Left = 110
          Top = 1
          Width = 8
          Height = 16
          Caption = '-'
          Transparent = False
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 22
        Width = 718
        Height = 24
        BandType = btColumnHeader
        object RLPanel1: TRLPanel
          Left = 0
          Top = 0
          Width = 718
          Height = 24
          Align = faClient
          Color = clInfoBk
          ParentColor = False
          Transparent = False
          object RLLabel3: TRLLabel
            Left = 0
            Top = 2
            Width = 49
            Height = 16
            Caption = 'C'#243'digo'
            Transparent = False
          end
          object RLLabel4: TRLLabel
            Left = 87
            Top = 2
            Width = 60
            Height = 16
            Caption = 'Produtos'
            Transparent = False
          end
          object RLLabel5: TRLLabel
            Left = 676
            Top = 2
            Width = 38
            Height = 16
            Alignment = taRightJustify
            Caption = 'Valor'
            Transparent = False
          end
          object RLLabel6: TRLLabel
            Left = 418
            Top = 2
            Width = 54
            Height = 16
            Caption = 'Estoque'
            Transparent = False
          end
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 46
        Width = 718
        Height = 24
        object RLDBText1: TRLDBText
          Left = 3
          Top = 6
          Width = 57
          Height = 16
          DataField = 'produtoId'
          DataSource = dtsProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 87
          Top = 6
          Width = 38
          Height = 16
          DataField = 'Nome'
          DataSource = dtsProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 402
          Top = 5
          Width = 70
          Height = 16
          Alignment = taRightJustify
          DataField = 'Quantidade'
          DataSource = dtsProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 680
          Top = 6
          Width = 34
          Height = 16
          Alignment = taRightJustify
          DataField = 'Valor'
          DataSource = dtsProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 70
        Width = 718
        Height = 75
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 430
          Top = 15
          Width = 42
          Height = 16
          Alignment = taRightJustify
          DataField = 'Quantidade'
          DataSource = dtsProdutos
          Info = riSum
          Text = ''
        end
        object RLDraw3: TRLDraw
          Left = 212
          Top = 2
          Width = 506
          Height = 17
          DrawKind = dkLine
        end
        object RLLabel9: TRLLabel
          Left = 212
          Top = 15
          Width = 197
          Height = 15
          Caption = 'Quantidade Estoque por Categoria:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
        object RLLabel10: TRLLabel
          Left = 515
          Top = 15
          Width = 148
          Height = 15
          Caption = 'M'#233'dia Valor por Categoria:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
        object RLDBResult2: TRLDBResult
          Left = 672
          Top = 15
          Width = 42
          Height = 16
          Alignment = taRightJustify
          DataField = 'Valor'
          DataSource = dtsProdutos
          Info = riAverage
          Text = ''
        end
      end
    end
  end
  object QryProdutos: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    Active = True
    SQL.Strings = (
      'Select produtos.produtoId,'
      '       produtos.Nome,'
      '       produtos.Descricao,'
      '       produtos.Valor,'
      '       produtos.Quantidade,'
      '       produtos.categoriaId,'
      '       categorias.descricao AS DescricaoCategoria'
      'FROM produtos'
      
        '        LEFT JOIN categorias on categorias.CategoriaId = produto' +
        's.CategoriaId'
      'ORDER BY produtos.CategoriaId, produtos.produtoId')
    Params = <>
    Left = 584
    Top = 544
    object QryProdutosprodutoId: TIntegerField
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object QryProdutosNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
    object QryProdutosDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object QryProdutosValor: TFloatField
      FieldName = 'Valor'
    end
    object QryProdutosQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object QryProdutoscategoriaId: TIntegerField
      FieldName = 'categoriaId'
    end
    object QryProdutosDescricaoCategoria: TWideStringField
      FieldName = 'DescricaoCategoria'
      Size = 30
    end
  end
  object dtsProdutos: TDataSource
    DataSet = QryProdutos
    Left = 664
    Top = 544
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.0.1 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 632
    Top = 616
  end
  object RLXLSXFilter1: TRLXLSXFilter
    DisplayName = 'Planilha Excel'
    Left = 584
    Top = 680
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel 97-2013'
    Left = 680
    Top = 680
  end
end
