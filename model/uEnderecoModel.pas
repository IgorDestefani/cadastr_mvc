unit uEnderecoModel;

interface

uses
  System.SysUtils;

type
  TEnderecoModel = class
  private
    FIDEndereco: Integer;
    Flogradouro: string;
    Fbairro: string;
    Fpessoa_id: Integer;
    Fuf: string;
    Fcep: string;
    Fcomplemento: string;
    Fcidade: string;
    Fendereco_id: Integer;
    procedure Setbairro(const Value: string);
    procedure Setcep(const Value: string);
    procedure Setcidade(const Value: string);
    procedure Setcomplemento(const Value: string);
    procedure Setlogradouro(const Value: string);
    procedure Setpessoa_id(const Value: Integer);
    procedure Setuf(const Value: string);
    procedure Setendereco_id(const Value: Integer);
  public
    function Gravar: Integer;
    procedure GravarIntegracao;
    function AtualizarRegistroEndereco(ID:Integer):Boolean;
    procedure AtualizarRegistroEnderecoIntegracao(ID:Integer);

    property endereco_id: Integer read Fendereco_id write Setendereco_id;
    property pessoa_id: Integer read Fpessoa_id write Setpessoa_id;
    property cep: string read Fcep write Setcep;
    property uf: string read Fuf write Setuf;
    property cidade: string read Fcidade write Setcidade;
    property bairro: string read Fbairro write Setbairro;
    property logradouro: string read Flogradouro write Setlogradouro;
    property complemento : string read Fcomplemento write Setcomplemento;
  end;

implementation

{ TEnderecoModel }

uses dmCadastro;


function TEnderecoModel.AtualizarRegistroEndereco(ID: Integer): Boolean;
var
  DAO: TDataModule1;
begin
  DAO := TDataModule1.create(nil);
  try
    Result := DAO.AtualizarEndereco(self, ID);
  finally
    if Assigned(DAO) then
      FreeAndNil(DAO);
  end;
end;

procedure TEnderecoModel.AtualizarRegistroEnderecoIntegracao(
  ID: Integer);
var
  DAO: TDataModule1;
begin
  DAO := TDataModule1.create(nil);
  try
    DAO.AtualizarEnderecoIntegracao(self, ID);
  finally
    if Assigned(DAO) then
      FreeAndNil(DAO);
  end;
end;

function TEnderecoModel.Gravar: Integer;
var
  DAO: TDataModule1;
begin
  DAO := TDataModule1.create(nil);
  try
    Result := DAO.InserirEndereco(self);
  finally
    if Assigned(DAO) then
      FreeAndNil(DAO);
  end;
end;

procedure TEnderecoModel.GravarIntegracao;
var
  DAO: TDataModule1;
begin
  DAO := TDataModule1.create(nil);
  try
    DAO.InserirEnderecoIntegracao(self);
  finally
    if Assigned(DAO) then
      FreeAndNil(DAO);
  end;
end;

procedure TEnderecoModel.Setbairro(const Value: string);
begin
  Fbairro := Value;
end;

procedure TEnderecoModel.Setcep(const Value: string);
begin
  Fcep := Value;
end;

procedure TEnderecoModel.Setcidade(const Value: string);
begin
  Fcidade := Value;
end;

procedure TEnderecoModel.Setcomplemento(const Value: string);
begin
  Fcomplemento := Value;
end;

procedure TEnderecoModel.Setendereco_id(const Value: Integer);
begin
  Fendereco_id := Value;
end;

procedure TEnderecoModel.Setlogradouro(const Value: string);
begin
  Flogradouro := Value;
end;

procedure TEnderecoModel.Setpessoa_id(const Value: Integer);
begin
  Fpessoa_id := Value;
end;

procedure TEnderecoModel.Setuf(const Value: string);
begin
  Fuf := Value;
end;

end.
