unit uPessoaController;

interface

uses
  uPessoaModel, System.SysUtils, FireDAC.Comp.Client;

type
  TPessoaController = class
  private
    FPessoaModel: TPessoaModel;

  public
    constructor Create;
    destructor Destroy; override;

    function Gravar: Integer;
    function GravarLote(Qtde: Integer): Boolean;
    function AtualizarRegistroPessoa(ID:Integer): Boolean;
    function ExcluirPessoa(ID:Integer):Boolean;

    property PessoaModel: TPessoaModel read FPessoaModel write FPessoaModel;
  end;

implementation

{ TEnderecoController }


function TPessoaController.AtualizarRegistroPessoa(ID: Integer): Boolean;
begin
  Result := FPessoaModel.AtualizarRegistroPessoa(ID);
end;

constructor TPessoaController.Create;
begin
  FPessoaModel := TPessoaModel.Create;
end;

destructor TPessoaController.Destroy;
begin
  FPessoaModel.Free;

  inherited;
end;

function TPessoaController.ExcluirPessoa(ID: Integer): Boolean;
begin
  Result := FPessoaModel.ExcluirPessoa(ID);
end;

function TPessoaController.Gravar: Integer;
begin
  Result := FPessoaModel.Gravar;
end;

function TPessoaController.GravarLote(Qtde: Integer): Boolean;
begin
  Result := FPessoaModel.GravarLote(Qtde);
end;

end.
