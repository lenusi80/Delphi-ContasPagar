object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 595
  Width = 985
  object QrPedido: TADOQuery
    Connection = LigaBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cad_Compra order by empresa')
    Left = 56
    Top = 280
    object QrPedidoCod_Compra: TAutoIncField
      FieldName = 'Cod_Compra'
      ReadOnly = True
    end
    object QrPedidoEmpresa: TWideStringField
      FieldName = 'Empresa'
      Size = 50
    end
    object QrPedidoPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object QrPedidoDataPedido: TDateTimeField
      FieldName = 'DataPedido'
      DisplayFormat = 'dd/mm/yy'
      EditMask = '!99/99/00;1;_'
    end
    object QrPedidoDataEntrega: TDateTimeField
      FieldName = 'DataEntrega'
      DisplayFormat = 'dd/mm/yy'
      EditMask = '!99/99/00;1;_'
    end
    object QrPedidoPzoPagamento: TWideStringField
      FieldName = 'PzoPagamento'
    end
    object QrPedidoCorPedido: TWideStringField
      FieldName = 'CorPedido'
      Size = 25
    end
    object QrPedidoObs: TWideMemoField
      FieldName = 'Obs'
      BlobType = ftWideMemo
    end
    object QrPedidoPedidoFechado: TBooleanField
      FieldName = 'PedidoFechado'
    end
  end
  object DS_Fornecedores: TDataSource
    DataSet = QRFornecedores
    Left = 160
    Top = 160
  end
  object DsQrUsers: TDataSource
    DataSet = QrUsers
    Left = 160
    Top = 216
  end
  object QrUsers: TADOQuery
    Connection = LigaBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Cadsenha')
    Left = 56
    Top = 216
    object QrUserssenha: TWideStringField
      FieldName = 'senha'
    end
  end
  object DSQrPedido: TDataSource
    DataSet = QrPedido
    Left = 160
    Top = 280
  end
  object DlgLocalizaBD: TOpenDialog
    Filter = 'Banco de Dados (*.mdb)|BD.mdb;'
    Left = 848
    Top = 80
  end
  object QRItensCompra: TADOQuery
    Connection = LigaBD
    CursorType = ctStatic
    DataSource = DSQrPedido
    Parameters = <
      item
        Name = 'cod_compra'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '2'
      end>
    SQL.Strings = (
      
        'select * from ItensCompra where cod_compra = :cod_compra order b' +
        'y id_nf = 0')
    Left = 57
    Top = 352
    object QRItensCompraCodDetalhecompra: TAutoIncField
      FieldName = 'CodDetalhecompra'
      ReadOnly = True
    end
    object QRItensCompraId_NF: TIntegerField
      FieldName = 'Id_NF'
    end
    object QRItensCompraCod_Compra: TIntegerField
      FieldName = 'Cod_Compra'
    end
    object QRItensCompraReferencia: TWideStringField
      FieldName = 'Referencia'
    end
    object QRItensCompraTotalItens: TIntegerField
      FieldName = 'TotalItens'
    end
    object QRItensCompraDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object QRItensCompraPrecoUnitario: TBCDField
      FieldName = 'PrecoUnitario'
      DisplayFormat = '0.00'
      Precision = 19
    end
    object QRItensCompraTotal: TBCDField
      FieldName = 'Total'
      DisplayFormat = '0.00'
      Precision = 19
    end
  end
  object DSQRItensCompra: TDataSource
    DataSet = QRItensCompra
    Left = 162
    Top = 352
  end
  object QRCreditos: TADOQuery
    Connection = LigaBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Cad_Creditos')
    Left = 376
    Top = 80
    object QRCreditosCodCredito: TAutoIncField
      FieldName = 'CodCredito'
      ReadOnly = True
    end
    object QRCreditosData: TDateTimeField
      Alignment = taCenter
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yy'
      EditMask = '!99/99/00;1;_'
    end
    object QRCreditosDinheiro: TBCDField
      FieldName = 'Dinheiro'
      currency = True
      Precision = 19
    end
    object QRCreditosChequePre: TBCDField
      FieldName = 'ChequePre'
      currency = True
      Precision = 19
    end
    object QRCreditosCartaoVisa: TBCDField
      FieldName = 'CartaoVisa'
      currency = True
      Precision = 19
    end
    object QRCreditosCartaoCred: TBCDField
      FieldName = 'CartaoCred'
      currency = True
      Precision = 19
    end
  end
  object QRDespDiversas: TADOQuery
    Connection = LigaBD
    CursorType = ctStatic
    BeforeInsert = QRDespDiversasBeforeInsert
    BeforeEdit = QRDespDiversasBeforeEdit
    AfterPost = QRDespDiversasAfterPost
    AfterCancel = QRDespDiversasAfterCancel
    Parameters = <>
    SQL.Strings = (
      
        'select * from Cad_DespDiversas where data between (date() - 30) ' +
        'and (date() + 190)'
      'order by data desc')
    Left = 376
    Top = 144
    object QRDespDiversasCodDebito: TAutoIncField
      FieldName = 'CodDebito'
      ReadOnly = True
    end
    object QRDespDiversasData: TDateTimeField
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yy'
      EditMask = '!99/99/00;1;_'
    end
    object QRDespDiversassituacao: TBooleanField
      FieldName = 'situacao'
      DisplayValues = 'Quitado;Em Aberto'
    end
    object QRDespDiversasValor: TBCDField
      FieldName = 'Valor'
      currency = True
      Precision = 19
    end
    object QRDespDiversasNumero: TWideStringField
      FieldName = 'Numero'
    end
    object QRDespDiversasEmpresa: TWideStringField
      FieldName = 'Empresa'
      Size = 60
    end
    object QRDespDiversasTipoPagamento: TWideStringField
      FieldName = 'TipoPagamento'
      Size = 30
    end
  end
  object DsQRCreditos: TDataSource
    DataSet = QRCreditos
    Left = 488
    Top = 88
  end
  object DsQRDespDiversas: TDataSource
    DataSet = QRDespDiversas
    Left = 488
    Top = 144
  end
  object DS_Vendedores: TDataSource
    DataSet = TB_Vendedores
    Left = 160
    Top = 104
  end
  object TB_Vendedores: TADOTable
    Connection = LigaBD
    CursorType = ctStatic
    TableName = 'Cad_Vendedor'
    Left = 56
    Top = 104
    object TB_VendedoresCodVendedor: TAutoIncField
      FieldName = 'CodVendedor'
      ReadOnly = True
    end
    object TB_VendedoresNome: TWideStringField
      FieldName = 'Nome'
      Size = 50
    end
    object TB_VendedoresTel: TWideStringField
      Alignment = taCenter
      FieldName = 'Tel'
      EditMask = '!\(99\)0000-0000;1;_'
      Size = 25
    end
    object TB_VendedoresTel2: TWideStringField
      Alignment = taCenter
      FieldName = 'Tel2'
      EditMask = '!\(99\)0000-0000;1;_'
      Size = 25
    end
    object TB_VendedoresTel3: TWideStringField
      Alignment = taCenter
      FieldName = 'Tel3'
      EditMask = '!\(99\)0000-0000;1;_'
      Size = 25
    end
    object TB_VendedoresEmail: TWideStringField
      FieldName = 'Email'
      Size = 50
    end
  end
  object LigaBD: TADOConnection
    ConnectOptions = coAsyncConnect
    CursorLocation = clUseServer
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 114
    Top = 48
  end
  object QRFornecedores: TADOQuery
    Connection = LigaBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Cad_Fornec order by empresa')
    Left = 56
    Top = 160
    object QRFornecedoresCod_Empresa: TAutoIncField
      FieldName = 'Cod_Empresa'
      ReadOnly = True
    end
    object QRFornecedoresEmpresa: TWideStringField
      FieldName = 'Empresa'
      Size = 60
    end
    object QRFornecedoresCNPJ: TWideStringField
      FieldName = 'CNPJ'
      EditMask = '990\.000\.000\\9999\-00;1;_'
      Size = 25
    end
    object QRFornecedoresInscEstadual: TWideStringField
      FieldName = 'InscEstadual'
      Size = 25
    end
    object QRFornecedoresVendedor: TWideStringField
      FieldName = 'Vendedor'
      Size = 50
    end
    object QRFornecedoresTelefone: TWideStringField
      FieldName = 'Telefone'
      EditMask = '!\(99\)0000-0000;1;_'
      Size = 15
    end
    object QRFornecedoresFax: TWideStringField
      FieldName = 'Fax'
      EditMask = '!\(99\)0000-0000;1;_'
      Size = 15
    end
    object QRFornecedoresRua: TWideStringField
      FieldName = 'Rua'
      Size = 50
    end
    object QRFornecedoresBairro: TWideStringField
      FieldName = 'Bairro'
      Size = 25
    end
    object QRFornecedoresCidade: TWideStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object QRFornecedoresEstado: TWideStringField
      FieldName = 'Estado'
      Size = 3
    end
    object QRFornecedoresEmail: TWideStringField
      FieldName = 'Email'
      Size = 50
    end
    object QRFornecedoresSite: TWideStringField
      FieldName = 'Site'
      Size = 50
    end
    object QRFornecedoresObs: TWideMemoField
      FieldName = 'Obs'
      BlobType = ftWideMemo
    end
    object QRFornecedoresDesativado: TBooleanField
      FieldName = 'Desativado'
    end
  end
end
