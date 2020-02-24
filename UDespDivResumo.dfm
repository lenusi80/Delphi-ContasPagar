object FrmDespDivResumo: TFrmDespDivResumo
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Resumo Despesas Diversas'
  ClientHeight = 399
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox8: TGroupBox
    Left = 3
    Top = 4
    Width = 549
    Height = 336
    Caption = 'Filtro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clAppWorkSpace
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label7: TLabel
      Left = 12
      Top = 74
      Width = 15
      Height = 13
      Caption = 'De'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 173
      Top = 74
      Width = 8
      Height = 13
      Caption = 'A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 12
      Top = 16
      Width = 100
      Height = 13
      BiDiMode = bdLeftToRight
      Caption = 'Nome a Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object DateTimePicker1: TDateTimePicker
      Left = 33
      Top = 66
      Width = 125
      Height = 24
      BevelInner = bvNone
      BevelOuter = bvSpace
      BevelKind = bkFlat
      CalAlignment = dtaRight
      Date = 0.383523761571268500
      Time = 0.383523761571268500
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Default'
      Font.Style = [fsBold]
      ParseInput = True
      ParentFont = False
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 187
      Top = 66
      Width = 125
      Height = 24
      BevelInner = bvNone
      BevelOuter = bvSpace
      BevelKind = bkFlat
      CalAlignment = dtaRight
      Date = 0.383523761571268500
      Time = 0.383523761571268500
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Default'
      Font.Style = [fsBold]
      ParseInput = True
      ParentFont = False
      TabOrder = 1
    end
    object BitBtn4: TBitBtn
      Left = 455
      Top = 32
      Width = 72
      Height = 48
      Caption = 'Ok'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn4Click
    end
    object CheckBox1: TCheckBox
      Left = 332
      Top = 70
      Width = 103
      Height = 17
      Caption = 'Quitados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clAppWorkSpace
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 96
      Width = 545
      Height = 238
      Align = alBottom
      Color = clWhite
      Ctl3D = False
      DataSource = DSFiltro
      FixedColor = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Calibri'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'temp'
          Title.Alignment = taCenter
          Title.Caption = 'OK'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'Calibri'
          Title.Font.Style = [fsBold]
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Courier'
          Font.Style = [fsBold]
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -16
          Title.Font.Name = 'Calibri'
          Title.Font.Style = [fsBold]
          Width = 92
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'situacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier'
          Font.Style = []
          Title.Caption = 'Situa'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -16
          Title.Font.Name = 'Calibri'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier'
          Font.Style = []
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -16
          Title.Font.Name = 'Calibri'
          Title.Font.Style = [fsBold]
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Numero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier'
          Font.Style = []
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -16
          Title.Font.Name = 'Calibri'
          Title.Font.Style = [fsBold]
          Width = 206
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
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -16
          Title.Font.Name = 'Calibri'
          Title.Font.Style = [fsBold]
          Width = 321
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TipoPagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier'
          Font.Style = []
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -16
          Title.Font.Name = 'Calibri'
          Title.Font.Style = [fsBold]
          Width = 277
          Visible = True
        end>
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 12
      Top = 32
      Width = 425
      Height = 25
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Default'
      Font.Style = [fsBold]
      KeyField = 'Cod_Empresa'
      ListField = 'Empresa'
      ListSource = DM.DS_Fornecedores
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
      OnKeyUp = DBLookupComboBox2KeyUp
    end
  end
  object Button1: TButton
    Left = 12
    Top = 352
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
    Left = 138
    Top = 352
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
    Left = 343
    Top = 352
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
  object QRFiltro: TADOQuery
    Active = True
    Connection = DM.LigaBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select * from Cad_DespDiversas where data between (date() - 30) ' +
        'and (date() + 190)'
      'order by data desc')
    Left = 212
    Top = 210
    object QRFiltroCodDebito: TAutoIncField
      FieldName = 'CodDebito'
      ReadOnly = True
    end
    object QRFiltroData: TDateTimeField
      FieldName = 'Data'
    end
    object QRFiltroEmpresa: TWideStringField
      FieldName = 'Empresa'
      Size = 60
    end
    object QRFiltroTipoPagamento: TWideStringField
      FieldName = 'TipoPagamento'
      Size = 30
    end
    object QRFiltroNumero: TWideStringField
      FieldName = 'Numero'
    end
    object QRFiltroValor: TBCDField
      FieldName = 'Valor'
      currency = True
      Precision = 19
    end
    object QRFiltrosituacao: TBooleanField
      FieldName = 'situacao'
      DisplayValues = 'Quitado;Em Aberto'
    end
    object QRFiltrotemp: TWideStringField
      FieldName = 'temp'
      Size = 10
    end
  end
  object DSFiltro: TDataSource
    DataSet = QRFiltro
    Left = 254
    Top = 210
  end
end
