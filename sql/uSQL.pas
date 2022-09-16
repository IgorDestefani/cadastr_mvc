unit uSQL;

interface

type
  TSQL = class
    public
      function RetornarSQLInsertPessoa: String;
      function RetornarSQLInsertPessoaLote: String;
      function RetornarSQLInsertEndereco: String;
      function RetornarSQLInsertEnderecoIntegracao: String;
      function AlterarSQLPessoa: String;
      function AlterarSQLEndereco: String;
      function AlterarSQLEnderecoIntegracao: String;
      function ExcluirSQLPessoa: String;
  end;

implementation

{ TSQL }

function TSQL.RetornarSQLInsertEndereco: String;
const
  SQL = ' INSERT INTO public.endereco( ' +
        '     idpessoa, dscep) ' +
	      '     VALUES (?, ?) returning idendereco;';
begin
  Result := SQL;
end;

function TSQL.RetornarSQLInsertEnderecoIntegracao: String;
const
  SQL = ' INSERT INTO public.endereco_integracao( ' +
	      '     idendereco, dsuf, nmcidade, nmbairro, nmlogradouro, dscomplemento) ' +
	      '     VALUES (?, ?, ?, ?, ?, ?); ';
begin
  Result := SQL;
end;

function TSQL.RetornarSQLInsertPessoa: String;
const
  SQL = ' INSERT INTO public.pessoa( ' +
	      '    flnatureza, dsdocumento, nmprimeiro, nmsegundo, dtregistro) ' +
	      '    VALUES (?, ?, ?, ?, ?) returning idpessoa;';
begin
  Result := SQL;
end;

function TSQL.RetornarSQLInsertPessoaLote: String;
const
  SQL = ' INSERT INTO public.pessoa( ' +
	      '    flnatureza, dsdocumento, nmprimeiro, nmsegundo, dtregistro) ' +
	      '    VALUES (?, ?, ?, ?, ?) ;';
begin
  Result := SQL;
end;

function TSQL.AlterarSQLEndereco: String;
const
  SQL = ' UPDATE public.endereco ' +
           ' SET dscep=? ' +
           ' WHERE idpessoa = ?;';
begin
  Result := SQL;
end;

function TSQL.AlterarSQLEnderecoIntegracao: String;
const
  SQL = ' UPDATE public.endereco_integracao ' +
           ' SET dsuf=?, nmcidade=?, nmbairro=?, nmlogradouro=?, dscomplemento=? ' +
           ' WHERE idendereco = ?;';
begin
  Result := SQL;
end;

function TSQL.AlterarSQLPessoa: String;
const
  SQL = ' UPDATE public.pessoa ' +
           ' SET flnatureza=?, dsdocumento=?, nmprimeiro=?, nmsegundo=?, dtregistro=? ' +
           ' WHERE idpessoa = ?;';
begin
  Result := SQL;
end;

function TSQL.ExcluirSQLPessoa: String;
const
  SQL = ' DELETE FROM public.pessoa ' +
	        ' WHERE idpessoa = ?;';
begin
  Result := SQL;
end;

end.
