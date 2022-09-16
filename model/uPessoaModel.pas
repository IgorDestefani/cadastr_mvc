unit uPessoaModel;

interface

type
  TPessoaModel = class
  private
    Fsobrenome: String;
    Fnatureza: Integer;
    Fdocumento: String;
    Fnome: String;
    Fdata: TDate;
    Fpessoa_id: Integer;
    procedure Setdata(const Value: TDate);
    procedure Setdocumento(const Value: String);
    procedure Setnatureza(const Value: Integer);
    procedure Setnome(const Value: String);
    procedure Setsobrenome(const Value: String);
    procedure Setpessoa_id(const Value: Integer);
  public
    function Gravar: Integer;
    function GravarLote(Qtde: Integer): Boolean;
    function AtualizarRegistroPessoa(ID:Integer): Boolean;
    function ExcluirPessoa(ID:Integer):Boolean;

    property pessoa_id: Integer read Fpessoa_id write Setpessoa_id;
    property natureza: Integer read Fnatureza write Setnatureza;
    property documento: String read Fdocumento write Setdocumento;
    property nome: String read Fnome write Setnome;
    property sobrenome: String read Fsobrenome write Setsobrenome;
    property data: TDate read Fdata write Setdata;
    constructor create;
    destructor destroy; override;
  end;

implementation

{ TPessoaModel }

uses dmCadastro, System.SysUtils;

function TPessoaModel.AtualizarRegistroPessoa(ID: Integer): Boolean;
var
  DAO: TDataModule1;
begin
  DAO := TDataModule1.create(nil);
  try
    Result := DAO.AtualizarPessoa(self, ID);
  finally
    if Assigned(DAO) then
      FreeAndNil(DAO);
  end;
end;

constructor TPessoaModel.create;
begin

end;

destructor TPessoaModel.destroy;
begin

  inherited;
end;

function TPessoaModel.ExcluirPessoa(ID: Integer): Boolean;
var
  DAO: TDataModule1;
begin
  DAO := TDataModule1.create(nil);
  try
    Result := DAO.ExcluirPessoa(ID);
  finally
    if Assigned(DAO) then
      FreeAndNil(DAO);
  end;
end;

function TPessoaModel.Gravar: Integer;
var
  DAO: TDataModule1;
begin
  DAO := TDataModule1.create(nil);
  try
    Result := DAO.InserirPessoa(self);
  finally
    if Assigned(DAO) then
      FreeAndNil(DAO);
  end;
end;

function TPessoaModel.GravarLote(Qtde: Integer): Boolean;
var
  DAO: TDataModule1;
begin
  DAO := TDataModule1.create(nil);
  try
    Result := DAO.InserirPessoaLote(self, Qtde);
  finally
    if Assigned(DAO) then
      FreeAndNil(DAO);
  end;
end;

procedure TPessoaModel.Setdata(const Value: TDate);
begin
  Fdata := Value;
end;

procedure TPessoaModel.Setdocumento(const Value: String);
begin
  Fdocumento := Value;
end;

procedure TPessoaModel.Setnatureza(const Value: Integer);
begin
  Fnatureza := Value;
end;

procedure TPessoaModel.Setnome(const Value: String);
begin
  Fnome := Value;
end;

procedure TPessoaModel.Setpessoa_id(const Value: Integer);
begin
  Fpessoa_id := Value;
end;

procedure TPessoaModel.Setsobrenome(const Value: String);
begin
  Fsobrenome := Value;
end;

end.
