object dtmPrincipal: TdtmPrincipal
  OldCreateOrder = True
  Height = 233
  Width = 333
  object ConexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16'
      'AutoEncodeStrings=True')
    TransactIsolationLevel = tiReadCommitted
    Connected = True
    SQLHourGlass = True
    HostName = '.\SQLEXPRESS'
    Port = 1433
    Database = 'vendas'
    User = 'sa'
    Password = 'ciih'
    Protocol = 'mssql'
    LibraryLocation = 
      'C:\Users\cinti\Desktop\Projetos Delphi\Delphi e sql server\ntwdb' +
      'lib.dll'
    Left = 56
    Top = 40
  end
end
