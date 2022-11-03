inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categorias'
  ClientHeight = 616
  ClientWidth = 917
  ExplicitWidth = 923
  ExplicitHeight = 645
  PixelsPerInch = 96
  TextHeight = 15
  inherited pgcPrincipal: TPageControl
    Width = 917
    Height = 575
    ExplicitWidth = 917
    ExplicitHeight = 575
    inherited tabListagem: TTabSheet
      ExplicitWidth = 909
      ExplicitHeight = 545
      inherited grdListagem: TDBGrid
        Width = 909
        Height = 458
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
      end
      object edtDescricao: TLabeledEdit
        Tag = 2
        Left = 72
        Top = 224
        Width = 465
        Height = 23
        EditLabel.Width = 51
        EditLabel.Height = 15
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 30
        TabOrder = 1
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 575
    Width = 917
    Color = 16442595
    ParentBackground = False
    ExplicitTop = 575
    ExplicitWidth = 917
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
    inherited btnFechar: TBitBtn
      Left = 809
      ExplicitLeft = 809
    end
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
