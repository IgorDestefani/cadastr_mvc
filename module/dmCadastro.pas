unit dmCadastro;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, uPessoaModel, uSQL, Firedac.dapt, uEnderecoModel;

type
  TDataModule1 = class(TDataModule)
    connection: TFDConnection;
    cursor: TFDGUIxWaitCursor;
    link: TFDPhysPgDriverLink;
  private
    { Private declarations }
  public
    { Public declarations }
    function InserirPessoa(pessoa: TPessoaModel): Integer;
    function InserirEndereco(endereco: TEnderecoModel): Integer;
    procedure InserirEnderecoIntegracao(endereco: TEnderecoModel);
    function InserirPessoaLote(pessoa: TPessoaModel; Qtde: Integer): Boolean;
    function AtualizarPessoa(pessoa: TPessoaModel; ID:Integer): Boolean;
    function AtualizarEndereco(endereco: TEnderecoModel; ID:Integer): Boolean;
    procedure AtualizarEnderecoIntegracao(endereco: TEnderecoModel; ID:Integer);
    function ExcluirPessoa(ID:Integer): Boolean;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}


{$R *.dfm}

{ TDataModule1 }

function TDataModule1.AtualizarEndereco(endereco: TEnderecoModel;
  ID: Integer): Boolean;
var
  QRY: TFDQuery;
  SQL: TSQL;
  sSQL: String;
begin
  SQL := TSQL.Create;
  QRY := TFDQuery.Create(nil);
  QRY.Connection := connection;
  try
    sSQL := SQL.AlterarSQLEndereco;
    try
      QRY.ExecSQL(sSQL,
                 [endereco.cep,
                  ID]);

      result := QRY.RowsAffected > 0;

    except on E: Exception do
      raise Exception.Create('Falha ao atualizar o registro ' + sLineBreak + e.Message);
    end;
  finally
    if Assigned(QRY) then
      FreeAndNil(QRY);

    if Assigned(SQL) then
      FreeAndNil(SQL)
  end;
end;

procedure TDataModule1.AtualizarEnderecoIntegracao(endereco: TEnderecoModel;
  ID: Integer);
var
  QRY: TFDQuery;
  SQL: TSQL;
  sSQL: String;
begin
  SQL := TSQL.Create;
  QRY := TFDQuery.Create(nil);
  QRY.Connection := connection;
  try
    sSQL := SQL.AlterarSQLEnderecoIntegracao;
    try
      QRY.ExecSQL(sSQL,
                 [endereco.uf,
                  endereco.cidade,
                  endereco.bairro,
                  endereco.logradouro,
                  endereco.complemento,
                  ID]);

    except on E: Exception do
      raise Exception.Create('Falha ao atualizar o registro ' + sLineBreak + e.Message);
    end;
  finally
    if Assigned(QRY) then
      FreeAndNil(QRY);

    if Assigned(SQL) then
      FreeAndNil(SQL)
  end;
end;


function TDataModule1.AtualizarPessoa(pessoa: TPessoaModel;
  ID: Integer): Boolean;
var
  QRY: TFDQuery;
  SQL: TSQL;
  sSQL: String;
begin
  SQL := TSQL.Create;
  QRY := TFDQuery.Create(nil);
  QRY.Connection := connection;
  try
    sSQL := SQL.AlterarSQLPessoa;
    try
      QRY.ExecSQL(sSQL,
                 [pessoa.natureza,
                  pessoa.documento,
                  pessoa.nome,
                  pessoa.sobrenome,
                  Date,
                  ID]);

      result := QRY.RowsAffected > 0;

    except on E: Exception do
      raise Exception.Create('Falha ao atualizar o registro ' + sLineBreak + e.Message);
    end;
  finally
    if Assigned(QRY) then
      FreeAndNil(QRY);

    if Assigned(SQL) then
      FreeAndNil(SQL)
  end;
end;

function TDataModule1.ExcluirPessoa(ID: Integer): Boolean;
var
  QRY: TFDQuery;
  SQL: TSQL;
  sSQL: String;
begin
  SQL := TSQL.Create;
  QRY := TFDQuery.Create(nil);
  QRY.Connection := connection;
  try
    sSQL := SQL.ExcluirSQLPessoa;
    try
      QRY.ExecSQL(sSQL,
                 [ID]);

      result := QRY.RowsAffected > 0;

    except on E: Exception do
      raise Exception.Create('Falha ao excluir o registro ' + sLineBreak + e.Message);
    end;
  finally
    if Assigned(QRY) then
      FreeAndNil(QRY);

    if Assigned(SQL) then
      FreeAndNil(SQL)
  end;
end;

function TDataModule1.InserirEndereco(endereco: TEnderecoModel): Integer;
var
  QRY: TFDQuery;
  SQL: TSQL;
  sSQL: String;
begin
  SQL := TSQL.Create;
  QRY := TFDQuery.Create(nil);
  QRY.Connection := connection;
  try
    sSQL := SQL.RetornarSQLInsertEndereco;
    try
      QRY.Open(sSQL,
              [endereco.pessoa_id,
               endereco.cep]);

      if not QRY.IsEmpty then
        Result := QRY.Fields[0].AsInteger;

    except on E: Exception do
      raise Exception.Create('Falha ao cadastrar o endereço ' + sLineBreak + e.Message);
    end;
  finally
    if Assigned(QRY) then
      FreeAndNil(QRY);

    if Assigned(SQL) then
      FreeAndNil(SQL)
  end;
end;

procedure TDataModule1.InserirEnderecoIntegracao(endereco: TEnderecoModel);
var
  QRY: TFDQuery;
  SQL: TSQL;
  sSQL: String;
begin
  SQL := TSQL.Create;
  QRY := TFDQuery.Create(nil);
  QRY.Connection := connection;
  try
    sSQL := SQL.RetornarSQLInsertEnderecoIntegracao;
    try
      QRY.ExecSQL(sSQL,
                 [endereco.endereco_id,
                  endereco.uf,
                  endereco.cidade,
                  endereco.bairro,
                  endereco.logradouro,
                  endereco.complemento]);

    except on E: Exception do
      raise Exception.Create('Falha ao cadastrar o endereço ' + sLineBreak + e.Message);
    end;
  finally
    if Assigned(QRY) then
      FreeAndNil(QRY);

    if Assigned(SQL) then
      FreeAndNil(SQL)
  end;
end;

function TDataModule1.InserirPessoa(pessoa: TPessoaModel): Integer;
var
  QRY: TFDQuery;
  SQL: TSQL;
  sSQL: String;
begin
  SQL := TSQL.Create;
  QRY := TFDQuery.Create(nil);
  QRY.Connection := connection;
  try
    sSQL := SQL.RetornarSQLInsertPessoa;
    try
      QRY.Open(sSQL,
              [pessoa.natureza,
               pessoa.documento,
               pessoa.nome,
               pessoa.sobrenome,
               Date]);

      if not QRY.IsEmpty then
        Result := QRY.Fields[0].AsInteger;

    except on E: Exception do
      raise Exception.Create('Falha ao cadastrar a pessoa ' + sLineBreak + e.Message);
    end;
  finally
    if Assigned(QRY) then
      FreeAndNil(QRY);

    if Assigned(SQL) then
      FreeAndNil(SQL)
  end;
end;

function TDataModule1.InserirPessoaLote(pessoa: TPessoaModel;
  Qtde: Integer): Boolean;
var
  QRY: TFDQuery;
  SQL: TSQL;
  sSQL: String;
  I, Processado: Integer;
begin
  SQL := TSQL.Create;
  QRY := TFDQuery.Create(nil);
  QRY.Connection := connection;
  try
    sSQL := SQL.RetornarSQLInsertPessoaLote;
    QRY.SQL.Text := sSQL;

    QRY.Params[0].DataType := ftInteger;
    QRY.Params[1].DataType := ftString;
    QRY.Params[2].DataType := ftString;
    QRY.Params[3].DataType := ftString;
    QRY.Params[3].DataType := ftDate;

    try
      while Qtde > 0 do
      begin
        if Qtde > 8000 then
          Processado := 8000
        else
          Processado := Qtde;

        Connection.StartTransaction;

        QRY.Params.ArraySize := 0;
        for I := 0 to Pred(Processado) do
        begin
          QRY.Params.ArraySize := QRY.Params.ArraySize + 1;
          QRY.Params[0].AsIntegers[I] := pessoa.natureza;
          QRY.Params[1].AsStrings[I]  := pessoa.documento;
          QRY.Params[2].AsStrings[I]  := pessoa.nome;
          QRY.Params[3].AsStrings[I]  := pessoa.sobrenome;
          QRY.Params[4].AsDates[I]    := pessoa.data;
        end;

        if QRY.Params.ArraySize > 0 then
          QRY.Execute(QRY.Params.ArraySize,0);

        if connection.InTransaction then
          connection.Commit;

        Qtde := Qtde - Processado;
      end;

      Result := QRY.RowsAffected > 0;

    except on E: Exception do
    begin
      if connection.InTransaction then
        connection.Rollback;
      end;
    end;
  finally
    if Assigned(QRY) then
      FreeAndNil(QRY);

    if Assigned(SQL) then
      FreeAndNil(SQL)
  end;
end;

end.
