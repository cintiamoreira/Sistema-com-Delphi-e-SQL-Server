unit uAlterarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, System.UITypes;

type
  TfrmAlterarSenha = class(TForm)
    edtSenhaAtual: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtRepetirNovaSenha: TEdit;
    btnFechar: TBitBtn;
    btnAlterar: TBitBtn;
    Label3: TLabel;
    edtSenhaNova: TEdit;
    lblUsuarioLogado: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);

  private
    procedure LimparEdits;
    { Private declarations }

  public

    { Public declarations }
  end;

var
  frmAlterarSenha: TfrmAlterarSenha;

implementation

{$R *.dfm}

Uses cCadUsuario, uPrincipal, uDTMConexao;

procedure TfrmAlterarSenha.btnAlterarClick(Sender: TObject);

Var oUsuario:TUsuario;

begin
  if (edtSenhaAtual.Text=oUsuarioLogado.senha) then
     begin
      if (edtSenhaNova.Text=edtRepetirNovaSenha.Text) then
        begin

          try
          oUsuario:=TUsuario.Create(DtmPrincipal.ConexaoDB);
          oUsuario.codigo := oUsuarioLogado.codigo;
          oUsuario.senha  := edtSenhaNova.Text;
          oUsuario.AlterarSenha;
          oUsuarioLogado.senha := edtSenhaNova.Text;

          MessageDlg('SENHA Alterada',MtInformation,[mbok],0);
          LimparEdits;

            finally
            FreeAndNil(oUsuario);
            end;

        end

      else
      begin
      MessageDlg('SENHAS digitadas n�o coincidem,',mtinformation,[mbok],0);
      edtSenhaNova.SetFocus;
      end;

      end

  else
    begin
    MessageDlg('SENHA ATUAL est� inv�lida',mtinformation,[mbok],0);
    end;
end;

procedure TfrmAlterarSenha.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAlterarSenha.FormShow(Sender: TObject);
begin
  LimparEdits;
end;

procedure TfrmAlterarSenha.LimparEdits;

begin
  edtSenhaAtual.Clear;
  edtSenhaNova.Clear;
  edtRepetirNovaSenha.Clear;

  lblUsuarioLogado.Caption := oUsuarioLogado.nome;
end;
end.
