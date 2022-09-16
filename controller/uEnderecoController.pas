unit uEnderecoController;

interface

uses
  uEnderecoModel, System.SysUtils, FireDAC.Comp.Client;

type
  TEnderecoController = class
  private
    FEndereco: TEnderecoModel;

  public
    constructor Create;
    destructor Destroy; override;

    function Gravar: Integer;
    procedure GravarIntegracao;
    function AtualizarRegistroEndereco(ID:Integer): Boolean;
    procedure AtualizarRegistroEnderecoIntegracao(ID:Integer);

    property EnderecoModel: TEnderecoModel read FEndereco write FEndereco;
  end;

implementation

{ TEnderecoController }


function TEnderecoController.AtualizarRegistroEndereco(ID: Integer): Boolean;
begin
  result := FEndereco.AtualizarRegistroEndereco(ID);
end;

procedure TEnderecoController.AtualizarRegistroEnderecoIntegracao(
  ID: Integer);
begin
  FEndereco.AtualizarRegistroEnderecoIntegracao(ID);
end;

constructor TEnderecoController.Create;
begin
  FEndereco := TEnderecoModel.Create;
end;

destructor TEnderecoController.Destroy;
begin
  FEndereco.Free;

  inherited;
end;

function TEnderecoController.Gravar: Integer;
begin
  Result := FEndereco.Gravar;
end;

procedure TEnderecoController.GravarIntegracao;
begin
  FEndereco.GravarIntegracao;
end;

end.
