inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categorias'
  ClientHeight = 616
  ClientWidth = 917
  ExplicitWidth = 929
  ExplicitHeight = 654
  TextHeight = 15
  inherited pgcPrincipal: TPageControl
    Width = 917
    Height = 575
    ExplicitWidth = 913
    ExplicitHeight = 574
    inherited tabListagem: TTabSheet
      ExplicitWidth = 909
      ExplicitHeight = 545
      inherited grdListagem: TDBGrid
        Left = -3
        Top = 88
        Width = 1067
        Height = 729
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
        Tag = 1
        Left = 20
        Top = 120
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
        Tag = 2
        Left = 20
        Top = 184
        Width = 537
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
    DesignSize = (
      917
      41)
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
    inherited btnFechar: TBitBtn
      Left = 797
      ExplicitLeft = 793
    end
  end
  inherited pnlListagem: TPanel
    Left = 0
    ExplicitLeft = 0
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
