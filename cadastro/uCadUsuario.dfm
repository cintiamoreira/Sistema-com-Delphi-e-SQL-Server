inherited frmCadUsuario: TfrmCadUsuario
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 401
  ClientWidth = 772
  ExplicitWidth = 778
  ExplicitHeight = 430
  PixelsPerInch = 96
  TextHeight = 15
  inherited pgcPrincipal: TPageControl
    Width = 772
    Height = 360
    ActivePage = tabManutencao
    ExplicitWidth = 772
    ExplicitHeight = 360
    inherited tabListagem: TTabSheet
      ExplicitWidth = 764
      ExplicitHeight = 330
      inherited grdListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'usuarioID'
            Width = 205
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 527
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 764
      ExplicitHeight = 330
      object edtUsuarioId: TLabeledEdit
        Tag = 1
        Left = 12
        Top = 48
        Width = 121
        Height = 23
        EditLabel.Width = 39
        EditLabel.Height = 15
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 12
        Top = 104
        Width = 712
        Height = 23
        EditLabel.Width = 40
        EditLabel.Height = 15
        EditLabel.Caption = 'Usu'#225'rio'
        MaxLength = 40
        TabOrder = 1
      end
      object edtSenha: TLabeledEdit
        Tag = 2
        Left = 12
        Top = 160
        Width = 465
        Height = 23
        EditLabel.Width = 32
        EditLabel.Height = 15
        EditLabel.Caption = 'Senha'
        MaxLength = 40
        PasswordChar = '*'
        TabOrder = 2
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 360
    Width = 772
    ExplicitTop = 360
    ExplicitWidth = 772
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
    inherited btnFechar: TBitBtn
      Left = 684
      ExplicitLeft = 684
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT usuarioId,'
      '        Nome,'
      '        Senha'
      'FROM usuarios')
    Left = 652
    object QryListagemusuarioID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'usuarioID'
      ReadOnly = True
    end
    object QryListagemNome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Nome'
      Required = True
      Size = 50
    end
    object QryListagemSenha: TWideStringField
      FieldName = 'Senha'
      Required = True
      Size = 40
    end
  end
  inherited dtsListagem: TDataSource
    Left = 716
  end
end
