object DMRelatorios: TDMRelatorios
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 576
  Width = 750
  object Relatorios: TfrReport
    Dataset = frDBGeral
    InitialZoom = pzPageWidth
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbExit]
    OnGetValue = RelatoriosGetValue
    Left = 428
    Top = 24
    ReportForm = {17000000}
  end
  object QRGeral: TADOQuery
    Active = True
    Connection = DM.LigaBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from boletoscompra')
    Left = 52
    Top = 16
  end
  object frDBGeral: TfrDBDataSet
    DataSet = QRGeral
    Left = 116
    Top = 16
  end
  object FrPedidosAbertos: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    OnGetValue = FrPedidosAbertosGetValue
    Left = 428
    Top = 80
    ReportForm = {17000000}
  end
  object Itens: TfrUserDataset
    OnCheckEOF = ItensCheckEOF
    OnFirst = ItensFirst
    OnNext = ItensNext
    Left = 444
    Top = 432
  end
  object BoletosNF: TfrUserDataset
    OnCheckEOF = BoletosNFCheckEOF
    OnFirst = BoletosNFFirst
    OnNext = BoletosNFNext
    Left = 188
    Top = 360
  end
  object NF: TfrUserDataset
    OnCheckEOF = NFCheckEOF
    OnFirst = NFFirst
    OnNext = NFNext
    Left = 188
    Top = 128
  end
  object QrNF: TADOQuery
    Connection = DM.LigaBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select Cad_NF.Id_NF, Cad_NF.Cod_Compra, Cad_NF.NumeroNF, Cad_NF.' +
        'DataEntrega, Cad_NF.Desconto, Cad_Compra.Empresa,  Cad_Compra.Pe' +
        'dido,'
      
        'Cad_compra.Cod_Compra from cad_compra INNER JOIN  Cad_Nf on Cad_' +
        'NF.Cod_Compra = Cad_compra.Cod_Compra where pedidofechado = true' +
        '  '
      'order by Cad_NF.NumeroNF')
    Left = 44
    Top = 128
    object QrNFId_NF: TAutoIncField
      FieldName = 'Id_NF'
      ReadOnly = True
    end
    object QrNFCad_NfCod_Compra: TIntegerField
      FieldName = 'Cad_Nf.Cod_Compra'
    end
    object QrNFNumeroNF: TIntegerField
      FieldName = 'NumeroNF'
    end
    object QrNFDataEntrega: TDateTimeField
      FieldName = 'DataEntrega'
    end
    object QrNFDesconto: TIntegerField
      FieldName = 'Desconto'
    end
    object QrNFEmpresa: TWideStringField
      FieldName = 'Empresa'
      Size = 50
    end
    object QrNFPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object QrNFcad_compraCod_Compra: TAutoIncField
      FieldName = 'cad_compra.Cod_Compra'
      ReadOnly = True
    end
  end
  object QrItens: TADOQuery
    Connection = DM.LigaBD
    CursorType = ctStatic
    DataSource = DsQrNF
    Parameters = <
      item
        Name = 'Id_NF'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Value = 53
      end>
    SQL.Strings = (
      'select * from ItensCompra where Id_NF = :Id_NF')
    Left = 44
    Top = 192
    object QrItensCodDetalhecompra: TAutoIncField
      FieldName = 'CodDetalhecompra'
      ReadOnly = True
    end
    object QrItensCod_Compra: TIntegerField
      FieldName = 'Cod_Compra'
    end
    object QrItensId_NF: TIntegerField
      FieldName = 'Id_NF'
    end
    object QrItensReferencia: TWideStringField
      FieldName = 'Referencia'
    end
    object QrItensDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object QrItensTotalItens: TIntegerField
      FieldName = 'TotalItens'
    end
    object QrItensPrecoUnitario: TBCDField
      FieldName = 'PrecoUnitario'
      Precision = 19
    end
    object QrItensTotal: TBCDField
      FieldName = 'Total'
      Precision = 19
    end
  end
  object QrBoletos: TADOQuery
    Connection = DM.LigaBD
    CursorType = ctStatic
    DataSource = DsQrNF
    Parameters = <
      item
        Name = 'Id_NF'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Value = 10
      end>
    SQL.Strings = (
      'select * from boletoscompra  where Id_NF = :Id_NF')
    Left = 36
    Top = 360
    object QrBoletosCodInteno: TAutoIncField
      FieldName = 'CodInteno'
      ReadOnly = True
    end
    object QrBoletosId_NF: TIntegerField
      FieldName = 'Id_NF'
    end
    object QrBoletosEmpresa: TWideStringField
      FieldName = 'Empresa'
      Size = 60
    end
    object QrBoletosNumeroNF: TIntegerField
      FieldName = 'NumeroNF'
    end
    object QrBoletosNumeroParcela: TWideStringField
      FieldName = 'NumeroParcela'
      Size = 10
    end
    object QrBoletosDataVencimento: TDateTimeField
      FieldName = 'DataVencimento'
    end
    object QrBoletosDataPagamento: TDateTimeField
      FieldName = 'DataPagamento'
    end
    object QrBoletosValorParcela: TBCDField
      FieldName = 'ValorParcela'
      Precision = 19
    end
    object QrBoletosDesconto: TIntegerField
      FieldName = 'Desconto'
    end
    object QrBoletosQuitado: TBooleanField
      FieldName = 'Quitado'
    end
    object QrBoletosFormaPagamento: TWideStringField
      FieldName = 'FormaPagamento'
      Size = 10
    end
  end
  object DsQrNF: TDataSource
    DataSet = QrNF
    Left = 108
    Top = 128
  end
  object DsQrItens: TDataSource
    DataSet = QrItens
    Left = 108
    Top = 192
  end
  object DsQrBoletos: TDataSource
    DataSet = QrBoletos
    Left = 100
    Top = 360
  end
  object ItensNF: TfrUserDataset
    OnCheckEOF = ItensNFCheckEOF
    OnFirst = ItensNFFirst
    OnNext = ItensNFNext
    Left = 188
    Top = 192
  end
  object UDPedido: TfrUserDataset
    OnCheckEOF = UDPedidoCheckEOF
    OnFirst = UDPedidoFirst
    OnNext = UDPedidoNext
    Left = 436
    Top = 296
  end
  object QRCreditos: TADOQuery
    Connection = DM.LigaBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select sum(dinheiro) as TotDinheiro,  sum(chequepre) as TotChequ' +
        'e,  '
      
        'sum(CartaoVisa) as TotVisa, sum(CartaoCred) as TotCred from Cad_' +
        'Creditos')
    Left = 44
    Top = 440
    object QRCreditosTotDinheiro: TBCDField
      FieldName = 'TotDinheiro'
      Precision = 19
    end
    object QRCreditosTotCheque: TBCDField
      FieldName = 'TotCheque'
      Precision = 19
    end
    object QRCreditosTotVisa: TBCDField
      FieldName = 'TotVisa'
      Precision = 19
    end
    object QRCreditosTotCred: TBCDField
      FieldName = 'TotCred'
      Precision = 19
    end
  end
  object QRtitulos: TADOQuery
    Connection = DM.LigaBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select sum(valorparcela) as TotalPago from BoletosCompra where q' +
        'uitado = true')
    Left = 204
    Top = 440
    object QRtitulosTotalPago: TBCDField
      FieldName = 'TotalPago'
      Precision = 19
    end
  end
  object QRDespDiversas: TADOQuery
    Connection = DM.LigaBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select sum(Valor) as ValorTotal from Cad_DespDiversas where situ' +
        'acao = false'
      ' ')
    Left = 124
    Top = 440
    object QRDespDiversasValorTotal: TBCDField
      FieldName = 'ValorTotal'
      Precision = 19
    end
  end
  object QrPedido: TADOQuery
    Connection = DM.LigaBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select * from Cad_Compra where pedidofechado = true order by emp' +
        'resa')
    Left = 292
    Top = 296
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
    end
    object QrPedidoDataEntrega: TDateTimeField
      FieldName = 'DataEntrega'
    end
    object QrPedidoPzoPagamento: TWideStringField
      FieldName = 'PzoPagamento'
      Size = 50
    end
    object QrPedidoPedidoFechado: TBooleanField
      FieldName = 'PedidoFechado'
    end
    object QrPedidoObs: TWideMemoField
      FieldName = 'Obs'
      BlobType = ftWideMemo
    end
    object QrPedidoCorPedido: TWideStringField
      FieldName = 'CorPedido'
      Size = 25
    end
  end
  object UDNfPedidos: TfrUserDataset
    OnCheckEOF = UDNfPedidosCheckEOF
    OnFirst = UDNfPedidosFirst
    OnNext = UDNfPedidosNext
    Left = 444
    Top = 360
  end
  object QrNfPedidos: TADOQuery
    Connection = DM.LigaBD
    CursorType = ctStatic
    DataSource = DsQrPedido
    Parameters = <
      item
        Name = 'Cod_Compra'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Value = 31
      end>
    SQL.Strings = (
      'select * from Cad_Nf where Cod_Compra = :Cod_Compra ')
    Left = 292
    Top = 360
    object QrNfPedidosId_NF: TAutoIncField
      FieldName = 'Id_NF'
      ReadOnly = True
    end
    object QrNfPedidosCod_Compra: TIntegerField
      FieldName = 'Cod_Compra'
    end
    object QrNfPedidosNumeroNF: TIntegerField
      FieldName = 'NumeroNF'
    end
    object QrNfPedidosDataEntrega: TDateTimeField
      FieldName = 'DataEntrega'
    end
    object QrNfPedidosDesconto: TIntegerField
      FieldName = 'Desconto'
    end
  end
  object DsQrPedido: TDataSource
    DataSet = QrPedido
    Left = 364
    Top = 298
  end
  object DsQrNfPedidos: TDataSource
    DataSet = QrNfPedidos
    Left = 364
    Top = 360
  end
  object ItensPedido: TADOQuery
    Connection = DM.LigaBD
    CursorType = ctStatic
    DataSource = DsQrPedido
    Parameters = <
      item
        Name = 'Cod_Compra'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Value = 30
      end>
    SQL.Strings = (
      'select * from ItensCompra where Cod_Compra = :Cod_Compra')
    Left = 292
    Top = 432
    object ItensPedidoCodDetalhecompra: TAutoIncField
      FieldName = 'CodDetalhecompra'
      ReadOnly = True
    end
    object ItensPedidoCod_Compra: TIntegerField
      FieldName = 'Cod_Compra'
    end
    object ItensPedidoId_NF: TIntegerField
      FieldName = 'Id_NF'
    end
    object ItensPedidoReferencia: TWideStringField
      FieldName = 'Referencia'
    end
    object ItensPedidoDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object ItensPedidoTotalItens: TIntegerField
      FieldName = 'TotalItens'
    end
    object ItensPedidoPrecoUnitario: TBCDField
      FieldName = 'PrecoUnitario'
      Precision = 19
    end
    object ItensPedidoTotal: TBCDField
      FieldName = 'Total'
      Precision = 19
    end
  end
  object DsItensPedido: TDataSource
    DataSet = ItensPedido
    Left = 364
    Top = 432
  end
  object balancete: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    OnGetValue = balanceteGetValue
    OnProgress = balanceteProgress
    Left = 428
    Top = 136
    ReportForm = {17000000}
  end
  object CreditoDebito: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    OnGetValue = CreditoDebitoGetValue
    Left = 428
    Top = 192
    ReportForm = {17000000}
  end
  object QRTitulosAPagar: TADOQuery
    Connection = DM.LigaBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select sum(valorparcela) as TotalAPagar from BoletosCompra where' +
        ' quitado = False')
    Left = 188
    Top = 496
    object QRTitulosAPagarTotalAPagar: TBCDField
      FieldName = 'TotalAPagar'
      Precision = 19
    end
  end
  object QRDespDiversAPagar: TADOQuery
    Connection = DM.LigaBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select sum(Valor) as ValorTotal from Cad_DespDiversas where situ' +
        'acao = false')
    Left = 68
    Top = 496
    object QRDespDiversAPagarValorTotal: TBCDField
      FieldName = 'ValorTotal'
      Precision = 19
    end
  end
  object QrItensPedido: TADOQuery
    Connection = DM.LigaBD
    CursorType = ctStatic
    DataSource = DsQrNF
    Parameters = <
      item
        Name = 'Cad_NF.Cod_Compra'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Value = 17
      end>
    SQL.Strings = (
      
        'select sum(totalitens) as TotalItensPedido from ItensCompra wher' +
        'e  Cod_Compra = :Cad_NF.Cod_Compra')
    Left = 36
    Top = 264
    object QrItensPedidoTotalItensPedido: TFloatField
      FieldName = 'TotalItensPedido'
    end
  end
  object DsQrItensPedido: TDataSource
    DataSet = QrItensPedido
    Left = 124
    Top = 264
  end
  object frUserDataset1: TfrUserDataset
    Left = 284
    Top = 48
  end
end
