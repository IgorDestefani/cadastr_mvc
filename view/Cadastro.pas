unit Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.JSON,idHTTP,IdSSLOpenSSL, uPessoaController;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Ed_CEP: TEdit;
    Ed_Log: TEdit;
    Ed_Complemento: TEdit;
    Ed_Bairro: TEdit;
    Ed_Cidade: TEdit;
    Ed_UF: TEdit;
    btnSalvar: TButton;
    Button2: TButton;
    btnCancelar: TButton;
    Panel2: TPanel;
    lblNome: TLabel;
    lblCPFCNPJ: TLabel;
    Label5: TLabel;
    Ed_Nome: TEdit;
    Ed_CPF: TEdit;
    Ed_Data: TEdit;
    lblNatureza: TLabel;
    btnInserir: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    Label1: TLabel;
    ED_Sobrenome: TEdit;
    lblSobrenome: TLabel;
    cbNatureza: TComboBox;
    edtInserirLote: TEdit;
    btnInserirLote: TButton;
    lblControle: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirLoteClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
 //   FDM: TDataModule1;
    FIDPessoa: Integer;
    FIDEndereco: Integer;
    FEditar: Boolean;
    FExcluir: Boolean;
    function BuscarCEP(CEP:string): TJSONObject;
    procedure CarregaCep(JSON: TJSONObject);
    procedure LimparCampos;
    function GravarDados(ArrayDML: Boolean; Qtde: Integer):Boolean;
    function ValidarCampos: Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uEnderecoController;

procedure TForm1.btnSalvarClick(Sender: TObject);
begin
  if not ValidarCampos then
    Exit;

  if GravarDados(false, 0) then
    showmessage('Registros inseridos/alterados com sucesso!')
  else
    showmessage('Falha ao inserir os registros!');

end;

procedure TForm1.Button2Click(Sender: TObject);
var
   LJsonObj: TJSONObject;
begin
   if length(Ed_CEP.Text) <> 8 then
   begin
      showMessage('CEP incorreto');
      Ed_CEP.SetFocus;
      exit;
   end;

  TThread.CreateAnonymousThread(procedure
  begin
    LJsonObj := BuscarCEP(Ed_CEP.Text);
    if LJsonOBJ <> nil then
      CarregaCep(LJsonObj)
    else
    begin
      showMessage('CEP inválido ou não encontrado');
      Ed_CEP.SetFocus;
      exit;
    end;
  end).start;
end;

procedure TForm1.btnCancelarClick(Sender: TObject);
begin
  LimparCampos;
end;

procedure TForm1.btnEditarClick(Sender: TObject);
begin
  FEditar := True; 
  lblControle.Caption := 'Edição';
end;

procedure TForm1.btnExcluirClick(Sender: TObject);
begin
  FExcluir := true;
  if GravarDados(false, 0) then
    showmessage('Registro excluído com sucesso.')
end;

procedure TForm1.btnInserirClick(Sender: TObject);
begin
  FEditar := False;
  LimparCampos;
  lblControle.Caption := 'Inserção';
  Ed_Data.Text := DateToStr(Date);
end;

procedure TForm1.btnInserirLoteClick(Sender: TObject);
var
  iLote: Integer;
begin
  if not ValidarCampos then
    Exit;

  FEditar := False;  
  if TryStrToInt(edtInserirLote.Text, iLote) then
  begin
    GravarDados(true, iLote);
    showmessage('Registros inseridos com sucesso.');
  end
  else
  begin
    showmessage('Para gravar em lote, é necessário informar a quantidade de registros.');
    btnInserirLote.SetFocus;
  end;
end;

procedure TForm1.CarregaCep(JSON: TJSONObject);
begin
   Ed_Log.Text         := JSON.Get('logradouro').JsonValue.Value;
   Ed_Cidade.Text      := UpperCase(JSON.Get('localidade').JsonValue.Value);
   Ed_Bairro.Text      := JSON.Get('bairro').JsonValue.Value;
   Ed_UF.Text          := JSON.Get('uf').JsonValue.Value;
   Ed_Complemento.Text := JSON.Get('complemento').JsonValue.Value;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // ReportMemoryLeaksOnShutdown := true;

  FEditar  := False; 
  FExcluir := False;
  
  Ed_Data.Text := DateToStr(Date);
  lblControle.Caption := 'Inserção';
end;

function TForm1.BuscarCEP(CEP: string): TJSONObject;
var
   HTTP: TIdHTTP;
   IDSSLHandler : TIdSSLIOHandlerSocketOpenSSL;
   Response: TStringStream;
begin
   try
      HTTP := TIdHTTP.Create;
      IDSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create;
      HTTP.IOHandler := IDSSLHandler;
      IDSSLHandler.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
      Response := TStringStream.Create('');
      HTTP.Get('https://viacep.com.br/ws/' + String(CEP) + '/json', Response);
      if (HTTP.ResponseCode = 200) and not(Utf8ToAnsi(Response.DataString) = '{'#$A'  "erro": true'#$A'}') then
         Result := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes( Utf8ToAnsi(Response.DataString)), 0) as TJSONObject;
   finally
      FreeAndNil(HTTP);
      FreeAndNil(IDSSLHandler);
      Response.Destroy;
   end;
end;

procedure TForm1.LimparCampos;
begin
  Ed_Nome.Text         := EmptyStr;
  Ed_Sobrenome.Text    := EmptyStr;
  cbNatureza.ItemIndex := 0;
  Ed_CPF.Text          := EmptyStr;
  Ed_Data.Text         := EmptyStr;
  Ed_CEP.Text          := EmptyStr;
  Ed_Log.Text          := EmptyStr;
  Ed_Complemento.Text  := EmptyStr;
  Ed_Bairro.Text       := EmptyStr;
  Ed_Cidade.Text       := EmptyStr;
  Ed_UF.Text           := EmptyStr;
end;

function TForm1.GravarDados(ArrayDML: Boolean; Qtde: Integer):Boolean;
var
  pessoaController: TPessoaController;
  enderecoController: TEnderecoController;
begin
  result := false;
  
  pessoaController := TPessoaController.Create;
  enderecoController := TEnderecoController.Create;
  try

    if FExcluir then
    begin
      result := pessoaController.PessoaModel.ExcluirPessoa(FIDPessoa);
      LimparCampos;
      FExcluir := false;
      Exit;
    end;
    
    pessoaController.PessoaModel.natureza  := cbNatureza.ItemIndex;
    pessoaController.PessoaModel.nome      := Trim(Ed_Nome.Text);
    pessoaController.PessoaModel.sobrenome := Trim(Ed_Sobrenome.Text);
    pessoaController.PessoaModel.documento := Trim(Ed_CPF.Text);
    pessoaController.PessoaModel.data      := Date;

    if not (ArrayDML) and not (FEditar) then
      FIDPessoa := pessoaController.PessoaModel.Gravar
    else if not (FEditar) then
      result := pessoaController.PessoaModel.GravarLote(Qtde)
    else
      result := pessoaController.PessoaModel.AtualizarRegistroPessoa(FIDPessoa);

    enderecoController.EnderecoModel.pessoa_id := FIDPessoa;
    enderecoController.EnderecoModel.cep       := Trim(Ed_CEP.Text);

    if not (ArrayDML) and not (FEditar) then
      FIDEndereco := enderecoController.EnderecoModel.Gravar
    else if not ArrayDML then
      result := enderecoController.EnderecoModel.AtualizarRegistroEndereco(FIDPessoa);
      
    enderecoController.EnderecoModel.endereco_id := FIDEndereco;
    enderecoController.EnderecoModel.uf          := Trim(Ed_UF.Text);
    enderecoController.EnderecoModel.cidade      := Trim(Ed_Cidade.Text);
    enderecoController.EnderecoModel.bairro      := Trim(Ed_Bairro.Text);
    enderecoController.EnderecoModel.logradouro  := Trim(Ed_Log.Text);
    enderecoController.EnderecoModel.complemento := Trim(Ed_Complemento.Text);

    if not (ArrayDML) and not (FEditar)then
      enderecoController.EnderecoModel.GravarIntegracao
    else if not ArrayDML then
      enderecoController.EnderecoModel.AtualizarRegistroEnderecoIntegracao(FIDEndereco);

    if not result then
      result := (FIDEndereco > 0) and (FIDPessoa > 0);
  finally
    if Assigned(pessoaController) then
      FreeAndNil(pessoaController);

    if Assigned(enderecoController) then
      FreeAndNil(enderecoController);
  end;

end;

function TForm1.ValidarCampos: Boolean;
var
  bValidado: Boolean;
begin
  bValidado := True;
  if (Ed_Nome.Text = EmptyStr) or (ED_Sobrenome.Text = EmptyStr) or (Ed_CPF.Text = EmptyStr)then
  begin
    showmessage('Todos os dados da pessoa precisam ser preenchidos.');
    bValidado := False;
  end;

  Result := bValidado;
end;

end.
