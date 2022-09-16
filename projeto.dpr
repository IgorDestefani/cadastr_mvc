program projeto;

uses
  Vcl.Forms,
  Cadastro in 'view\Cadastro.pas' {Form1},
  dmCadastro in 'module\dmCadastro.pas' {DataModule1: TDataModule},
  uPessoaModel in 'model\uPessoaModel.pas',
  uEnderecoModel in 'model\uEnderecoModel.pas',
  uSQL in 'sql\uSQL.pas',
  uEnderecoController in 'controller\uEnderecoController.pas',
  uPessoaController in 'controller\uPessoaController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
