inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categorias'
  ClientHeight = 616
  ClientWidth = 917
  ExplicitWidth = 929
  ExplicitHeight = 654
  TextHeight = 15
  object Label1: TLabel [0]
    Left = 88
    Top = 0
    Width = 34
    Height = 15
    Caption = 'Label1'
  end
  inherited pgcPrincipal: TPageControl
    Width = 917
    Height = 575
    ExplicitWidth = 913
    ExplicitHeight = 574
    inherited tabListagem: TTabSheet
      ExplicitWidth = 909
      ExplicitHeight = 545
      inherited grdListagem: TDBGrid
        Left = 3
        Top = 89
        Width = 903
        Height = 454
        Align = alNone
        Columns = <
          item
            Expanded = False
            FieldName = 'categoriaId'
            Width = 136
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 567
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 909
      ExplicitHeight = 545
      object edtCategoriaId: TLabeledEdit
        Left = 72
        Top = 152
        Width = 121
        Height = 23
        EditLabel.Width = 39
        EditLabel.Height = 15
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
        Text = ''
      end
      object edtDescricao: TLabeledEdit
        Left = 72
        Top = 224
        Width = 465
        Height = 23
        EditLabel.Width = 51
        EditLabel.Height = 15
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 30
        TabOrder = 1
        Text = ''
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 575
    Width = 917
    ExplicitTop = 574
    ExplicitWidth = 913
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
    inherited btnFechar: TBitBtn
      Left = 809
      ExplicitLeft = 805
    end
  end
  inherited pnlListagem: TPanel
    Left = 0
    Width = 909
    ExplicitLeft = 0
    ExplicitWidth = 909
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT categoriaId,'
      #9#9'descricao'
      #9#9'FROM categorias')
    object intgrfldQryListagemcategoriaId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object wdstrngfldQryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
end
