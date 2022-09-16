object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 302
  ClientWidth = 698
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 362
    Top = 8
    Width = 329
    Height = 285
    TabOrder = 0
    object Label6: TLabel
      Left = 13
      Top = 15
      Width = 23
      Height = 13
      Caption = 'CEP:'
    end
    object Label7: TLabel
      Left = 13
      Top = 62
      Width = 55
      Height = 13
      Caption = 'Logradouro'
    end
    object Label9: TLabel
      Left = 13
      Top = 102
      Width = 65
      Height = 13
      Caption = 'Complemento'
    end
    object Label10: TLabel
      Left = 13
      Top = 140
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object Label11: TLabel
      Left = 13
      Top = 181
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label12: TLabel
      Left = 13
      Top = 222
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object Label14: TLabel
      Left = 13
      Top = 1
      Width = 52
      Height = 13
      Caption = 'Endere'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Ed_CEP: TEdit
      Left = 13
      Top = 28
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Ed_Log: TEdit
      Left = 13
      Top = 76
      Width = 300
      Height = 21
      TabOrder = 1
    end
    object Ed_Complemento: TEdit
      Left = 13
      Top = 116
      Width = 300
      Height = 21
      TabOrder = 2
    end
    object Ed_Bairro: TEdit
      Left = 13
      Top = 154
      Width = 300
      Height = 21
      TabOrder = 3
    end
    object Ed_Cidade: TEdit
      Left = 13
      Top = 195
      Width = 300
      Height = 21
      TabOrder = 4
    end
    object Ed_UF: TEdit
      Left = 13
      Top = 237
      Width = 300
      Height = 21
      TabOrder = 5
    end
  end
  object btnSalvar: TButton
    Left = 97
    Top = 230
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = btnSalvarClick
  end
  object Button2: TButton
    Left = 511
    Top = 34
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object btnCancelar: TButton
    Left = 15
    Top = 268
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object btnInserir: TButton
    Left = 16
    Top = 231
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 5
    OnClick = btnInserirClick
  end
  object btnEditar: TButton
    Left = 179
    Top = 230
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 6
    OnClick = btnEditarClick
  end
  object btnExcluir: TButton
    Left = 265
    Top = 230
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 7
    OnClick = btnExcluirClick
  end
  object Panel2: TPanel
    Left = 15
    Top = 9
    Width = 329
    Height = 216
    TabOrder = 4
    object lblNome: TLabel
      Left = 8
      Top = 28
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object lblCPFCNPJ: TLabel
      Left = 179
      Top = 74
      Width = 52
      Height = 13
      Caption = 'CPF/CNPJ:'
    end
    object Label5: TLabel
      Left = 8
      Top = 159
      Width = 78
      Height = 13
      Caption = 'Data de registro'
    end
    object lblNatureza: TLabel
      Left = 8
      Top = 74
      Width = 48
      Height = 13
      Caption = 'Natureza:'
    end
    object Label1: TLabel
      Left = 8
      Top = 1
      Width = 40
      Height = 13
      Caption = 'Pessoa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSobrenome: TLabel
      Left = 179
      Top = 27
      Width = 58
      Height = 13
      Caption = 'Sobrenome:'
    end
    object lblControle: TLabel
      Left = 268
      Top = 194
      Width = 51
      Height = 13
      Caption = 'lblControle'
    end
    object Ed_Nome: TEdit
      Left = 8
      Top = 41
      Width = 145
      Height = 21
      TabOrder = 0
    end
    object Ed_CPF: TEdit
      Left = 179
      Top = 90
      Width = 145
      Height = 21
      TabOrder = 1
    end
    object Ed_Data: TEdit
      Left = 8
      Top = 178
      Width = 78
      Height = 21
      Color = clScrollBar
      Enabled = False
      TabOrder = 2
    end
    object ED_Sobrenome: TEdit
      Left = 179
      Top = 40
      Width = 145
      Height = 21
      TabOrder = 3
    end
    object cbNatureza: TComboBox
      Left = 8
      Top = 90
      Width = 145
      Height = 21
      ItemIndex = 0
      TabOrder = 4
      Text = 'F'#237'sica'
      Items.Strings = (
        'F'#237'sica'
        'Jur'#237'dica')
    end
  end
  object edtInserirLote: TEdit
    Left = 291
    Top = 269
    Width = 48
    Height = 21
    Alignment = taCenter
    NumbersOnly = True
    TabOrder = 8
    TextHint = 'QTDE'
  end
  object btnInserirLote: TButton
    Left = 210
    Top = 268
    Width = 75
    Height = 25
    Caption = 'Inserir em lote'
    TabOrder = 9
    OnClick = btnInserirLoteClick
  end
end
