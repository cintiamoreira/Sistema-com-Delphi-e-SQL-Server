object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 587
  ClientWidth = 867
  Color = 16442595
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = mainPrincipal
  OldCreateOrder = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object StbPrincipal: TStatusBar
    Left = 0
    Top = 568
    Width = 867
    Height = 19
    Panels = <
      item
        Width = 150
      end>
    ExplicitLeft = 504
    ExplicitTop = 576
    ExplicitWidth = 0
  end
  object mainPrincipal: TMainMenu
    Left = 808
    Top = 24
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Cliente1: TMenuItem
        Caption = 'Cliente'
        OnClick = Cliente1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Categoria1: TMenuItem
        Caption = 'Categoria'
        OnClick = Categoria1Click
      end
      object Produto1: TMenuItem
        Caption = 'Produto'
        OnClick = Produto1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object USURIO1: TMenuItem
        Caption = 'USU'#193'RIO'
        OnClick = USURIO1Click
      end
      object ALTERARSENHA1: TMenuItem
        Caption = 'ALTERAR SENHA'
        OnClick = ALTERARSENHA1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object menuFechar: TMenuItem
        Caption = 'Fechar'
        OnClick = menuFecharClick
      end
    end
    object Movimentao1: TMenuItem
      Caption = 'Movimenta'#231#227'o'
      object Vendas1: TMenuItem
        Caption = 'Vendas'
        OnClick = Vendas1Click
      end
    end
    object Relatrio1: TMenuItem
      Caption = 'Relat'#243'rios'
      object CATEGORIA2: TMenuItem
        Caption = 'CATEGORIA'
        OnClick = CATEGORIA2Click
      end
      object Cliente2: TMenuItem
        Caption = 'CLIENTE'
        OnClick = Cliente2Click
      end
      object FICHADECLIENTE1: TMenuItem
        Caption = 'FICHA DE CLIENTE'
        OnClick = FICHADECLIENTE1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Produto2: TMenuItem
        Caption = 'Produto'
        OnClick = Produto2Click
      end
      object PRODUTOSPORCATEGORIA1: TMenuItem
        Caption = 'PRODUTOS POR CATEGORIA'
        OnClick = PRODUTOSPORCATEGORIA1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Vendapordata1: TMenuItem
        Caption = 'Venda por data'
        OnClick = Vendapordata1Click
      end
    end
  end
end
