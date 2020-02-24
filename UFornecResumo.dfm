object frmResumoFornecedores: TfrmResumoFornecedores
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Resumo Fornecedores'
  ClientHeight = 470
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 559
    Height = 403
    Color = clWhite
    Ctl3D = False
    DataSource = DataSource1
    FixedColor = clOlive
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBackground
    TitleFont.Height = -11
    TitleFont.Name = 'SimHei'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'temp'
        Title.Alignment = taCenter
        Title.Caption = 'OK'
        Title.Color = clYellow
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBackground
        Title.Font.Height = -16
        Title.Font.Name = 'Calibri'
        Title.Font.Style = [fsBold]
        Width = 43
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Cod_Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'Cod'
        Title.Color = clYellow
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBackground
        Title.Font.Height = -16
        Title.Font.Name = 'Calibri'
        Title.Font.Style = [fsBold]
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier'
        Font.Style = []
        Title.Caption = ' Nome/Raz'#227'oSocial'
        Title.Color = clYellow
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -16
        Title.Font.Name = 'Calibri'
        Title.Font.Style = [fsBold]
        Width = 422
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier'
        Font.Style = []
        Title.Color = clYellow
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -16
        Title.Font.Name = 'Calibri'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'InscEstadual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier'
        Font.Style = []
        Title.Color = clYellow
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -16
        Title.Font.Name = 'Calibri'
        Title.Font.Style = [fsBold]
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier'
        Font.Style = []
        Title.Color = clYellow
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -16
        Title.Font.Name = 'Calibri'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Fax'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier'
        Font.Style = []
        Title.Color = clYellow
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -16
        Title.Font.Name = 'Calibri'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vendedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier'
        Font.Style = []
        Title.Color = clYellow
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -16
        Title.Font.Name = 'Calibri'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 26
    Top = 427
    Width = 111
    Height = 35
    BiDiMode = bdLeftToRight
    Caption = 'Limpar Todos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 152
    Top = 427
    Width = 137
    Height = 35
    Caption = 'Selecionar Todos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 358
    Top = 427
    Width = 195
    Height = 35
    BiDiMode = bdLeftToRight
    Caption = 'Imprimir Selecionados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 3
    OnClick = Button3Click
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 328
    Top = 164
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = DM.LigaBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cad_Fornec order by empresa')
    Left = 368
    Top = 164
    object ADOQuery1temp: TWideStringField
      DisplayWidth = 12
      FieldName = 'temp'
      Size = 10
    end
    object ADOQuery1Cod_Empresa: TAutoIncField
      DisplayWidth = 15
      FieldName = 'Cod_Empresa'
      ReadOnly = True
    end
    object ADOQuery1Empresa: TWideStringField
      DisplayWidth = 72
      FieldName = 'Empresa'
      Size = 60
    end
    object ADOQuery1CNPJ: TWideStringField
      DisplayWidth = 30
      FieldName = 'CNPJ'
      Size = 25
    end
    object ADOQuery1InscEstadual: TWideStringField
      DisplayWidth = 30
      FieldName = 'InscEstadual'
      Size = 25
    end
    object ADOQuery1Vendedor: TWideStringField
      DisplayWidth = 60
      FieldName = 'Vendedor'
      Size = 50
    end
    object ADOQuery1Telefone: TWideStringField
      DisplayWidth = 18
      FieldName = 'Telefone'
      Size = 15
    end
    object ADOQuery1Fax: TWideStringField
      DisplayWidth = 18
      FieldName = 'Fax'
      Size = 15
    end
    object ADOQuery1Rua: TWideStringField
      DisplayWidth = 60
      FieldName = 'Rua'
      Size = 50
    end
    object ADOQuery1Bairro: TWideStringField
      DisplayWidth = 30
      FieldName = 'Bairro'
      Size = 25
    end
    object ADOQuery1Cidade: TWideStringField
      DisplayWidth = 36
      FieldName = 'Cidade'
      Size = 30
    end
    object ADOQuery1Estado: TWideStringField
      DisplayWidth = 7
      FieldName = 'Estado'
      Size = 3
    end
    object ADOQuery1Email: TWideStringField
      DisplayWidth = 60
      FieldName = 'Email'
      Size = 50
    end
    object ADOQuery1Site: TWideStringField
      DisplayWidth = 60
      FieldName = 'Site'
      Size = 50
    end
    object ADOQuery1Obs: TWideMemoField
      DisplayWidth = 12
      FieldName = 'Obs'
      BlobType = ftWideMemo
    end
  end
end
