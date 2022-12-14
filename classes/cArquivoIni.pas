unit cArquivoIni;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     System.SysUtils,
     System.IniFiles,
     Vcl.Forms;

type
  TArquivoIni = class
  private

  public
    class function ArquivoIni:string; static;
    class function LerIni(aSecao:String; aEntrada:String):String; static;
    class procedure AtualizarIni(aSecao, aEntrada, aValor: String); static;
end;

implementation

{ TArquivoIni }

class function TArquivoIni.ArquivoIni: string;
begin       //Muda a extens?o do arquivo
  result := ChangeFileExt( Application.ExeName, '.INI' );
end;


class function TArquivoIni.LerIni(aSecao:String; aEntrada:String):String;
var Ini: TIniFile;
begin
  try
    Ini := TIniFile.Create(ArquivoIni);

              //ler a sessao que eu passar
    Result := Ini.ReadString( aSecao, aEntrada, 'NAO ENCONTRADO' );
  finally
    Ini.Free;
  end;
end;


class procedure TArquivoIni.AtualizarIni(aSecao:String; aEntrada:String; aValor:String);
var  Ini: TIniFile;
begin
  try
    Ini := TIniFile.Create(ArquivoIni);
    Ini.WriteString( aSecao, aEntrada, aValor);
  finally
    Ini.Free;
  end;
end;

end.
