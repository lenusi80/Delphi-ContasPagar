object FrmNf: TFrmNf
  Left = 0
  Top = 0
  AlphaBlendValue = 240
  BorderStyle = bsDialog
  Caption = 'Cadastro  de Notas Fiscais e Boletos'
  ClientHeight = 580
  ClientWidth = 752
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = cl3DDkShadow
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl2: TPageControl
    Left = 1
    Top = 2
    Width = 750
    Height = 576
    ActivePage = TabSheet1
    BiDiMode = bdLeftToRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MultiLine = True
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Consulta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Highlighted = True
      ImageIndex = 1
      ParentFont = False
      OnExit = TabSheet1Exit
      OnShow = TabSheet1Show
      object Label32: TLabel
        Left = 11
        Top = 95
        Width = 44
        Height = 16
        BiDiMode = bdLeftToRight
        Caption = 'Pedidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Default'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label33: TLabel
        Left = 11
        Top = 404
        Width = 146
        Height = 16
        BiDiMode = bdLeftToRight
        Caption = 'Notas Fiscais dos Pedidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Default'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
      end
      object DBGrid1: TDBGrid
        Left = 11
        Top = 109
        Width = 720
        Height = 294
        Hint = 
          'Quando a linha estiver em "vermelho" significa que o Pedido foi'#13 +
          #10'                    parcialmente recebido at'#233' o momento. '
        Color = clWhite
        Ctl3D = False
        DataSource = DSPedido
        FixedColor = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -16
        TitleFont.Name = 'Calibri'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Pedido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Pedido'
            Width = 78
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DataPedido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier'
            Font.Style = []
            Title.Alignment = taCenter
            Width = 95
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DataEntrega'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier'
            Font.Style = []
            Title.Alignment = taCenter
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Empresa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier'
            Font.Style = []
            Title.Caption = 'Nome/Raz'#227'o Social'
            Width = 422
            Visible = True
          end>
      end
      object GroupBox8: TGroupBox
        Left = 11
        Top = -1
        Width = 720
        Height = 96
        Caption = 'Filtros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAppWorkSpace
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label11: TLabel
          Left = 26
          Top = 54
          Width = 100
          Height = 13
          BiDiMode = bdLeftToRight
          Caption = 'Nome a Pesquisar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Default'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
        end
        object Label15: TLabel
          Left = 488
          Top = 54
          Width = 107
          Height = 13
          BiDiMode = bdLeftToRight
          Caption = 'Campo a Pesquisar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Default'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
        end
        object ComboBox1: TComboBox
          Left = 488
          Top = 66
          Width = 209
          Height = 24
          BiDiMode = bdLeftToRight
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Default'
          Font.Style = [fsBold]
          ItemHeight = 16
          ParentBiDiMode = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          Text = 'Empresa'
          OnChange = ComboBox1Change
          Items.Strings = (
            'Empresa'
            'Pedido')
        end
        object Edit1: TEdit
          Left = 26
          Top = 67
          Width = 433
          Height = 22
          BiDiMode = bdLeftToRight
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Default'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnChange = Edit1Change
        end
        object RadioGroup1: TRadioGroup
          AlignWithMargins = True
          Left = 26
          Top = 17
          Width = 671
          Height = 35
          BiDiMode = bdLeftToRight
          Columns = 2
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemIndex = 0
          Items.Strings = (
            'Pedidos Parciais/Abertos'
            'Pedidos Fechados')
          ParentBiDiMode = False
          ParentBackground = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          OnClick = RadioGroup1Click
        end
      end
      object DBGrid6: TDBGrid
        Left = 11
        Top = 418
        Width = 720
        Height = 122
        Hint = 
          'Quando a linha estiver em "vermelho" significa que a Nota Fiscal' +
          #13#10'                                 ainda est'#225' sem "T'#237'tulos".'
        Color = clWhite
        Ctl3D = False
        DataSource = DsNF
        FixedColor = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -16
        TitleFont.Name = 'Calibri'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = DBGrid6DrawColumnCell
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NumeroNF'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Courier'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Nota Fiscal'
            Width = 130
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DataEntrega'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier'
            Font.Style = []
            Title.Alignment = taCenter
            Width = 103
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Desconto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier'
            Font.Style = []
            Title.Alignment = taCenter
            Width = 100
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Nota Fiscal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabVisible = False
      OnShow = TabSheet2Show
      object v: TGroupBox
        Left = 3
        Top = 2
        Width = 734
        Height = 153
        Caption = 'Pedido'
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAppWorkSpace
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        object Label1: TLabel
          Left = 12
          Top = 18
          Width = 38
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = DBEdit1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Default'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 11
          Top = 58
          Width = 49
          Height = 13
          Caption = 'Empresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Default'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 115
          Top = 18
          Width = 54
          Height = 13
          Caption = 'N'#186' Pedido'
          FocusControl = DBEdit3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Default'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 12
          Top = 97
          Width = 73
          Height = 13
          Caption = 'Observa'#231#245'es'
          FocusControl = DBMemo1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Default'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 332
          Top = 21
          Width = 104
          Height = 13
          Caption = 'Prazo_Pagamento'
          FocusControl = DBEdit2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Default'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 237
          Top = 20
          Width = 72
          Height = 13
          Caption = 'Data_Pedido'
          FocusControl = DBEdit5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Default'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 643
          Top = 21
          Width = 77
          Height = 13
          Caption = 'Cor do Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Default'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 414
          Top = 59
          Width = 90
          Height = 16
          BiDiMode = bdLeftToRight
          Caption = 'Total de Itens'
          FocusControl = DBEdit7
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
        end
        object Label14: TLabel
          Left = 542
          Top = 59
          Width = 70
          Height = 16
          BiDiMode = bdLeftToRight
          Caption = 'Valor Total'
          FocusControl = DBEdit8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 12
          Top = 33
          Width = 97
          Height = 25
          TabStop = False
          Color = clInactiveCaptionText
          Ctl3D = False
          DataField = 'Cod_Compra'
          DataSource = DSPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 115
          Top = 33
          Width = 117
          Height = 25
          TabStop = False
          Ctl3D = False
          DataField = 'Pedido'
          DataSource = DSPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          OnEnter = DBEdit3Enter
          OnExit = DBEdit3Exit
        end
        object DBMemo1: TDBMemo
          Left = 12
          Top = 112
          Width = 711
          Height = 32
          TabStop = False
          Ctl3D = False
          DataField = 'Obs'
          DataSource = DM.DSQrPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Default'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit2: TDBEdit
          Left = 332
          Top = 36
          Width = 305
          Height = 22
          TabStop = False
          Ctl3D = False
          DataField = 'PzoPagamento'
          DataSource = DSPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Default'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          OnEnter = DBEdit3Enter
          OnExit = DBEdit3Exit
        end
        object DBEdit9: TDBEdit
          Left = 12
          Top = 73
          Width = 381
          Height = 22
          TabStop = False
          Ctl3D = False
          DataField = 'Empresa'
          DataSource = DSPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Default'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit5: TDBEdit
          Left = 237
          Top = 36
          Width = 90
          Height = 22
          TabStop = False
          Ctl3D = False
          DataField = 'DataPedido'
          DataSource = DSPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Default'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object Panel1: TPanel
          Left = 643
          Top = 36
          Width = 80
          Height = 22
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'WST_Swed'
          Font.Style = []
          ParentBackground = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
        end
        object DBEdit7: TDBEdit
          Left = 414
          Top = 75
          Width = 107
          Height = 25
          TabStop = False
          BiDiMode = bdLeftToRight
          Color = clSilver
          DataField = 'Totalitens'
          DataSource = DsSomatoriaPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit8: TDBEdit
          Left = 542
          Top = 75
          Width = 181
          Height = 25
          TabStop = False
          BiDiMode = bdLeftToRight
          Color = clSilver
          DataField = 'TotalGeral'
          DataSource = DsSomatoriaPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 471
        Width = 734
        Height = 68
        Caption = 'Op'#231#245'es'
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAppWorkSpace
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        object BitBtn2: TBitBtn
          Left = 377
          Top = 17
          Width = 181
          Height = 41
          BiDiMode = bdLeftToRight
          Caption = 'Sair'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 0
          OnClick = BitBtn2Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
            03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
            0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
            0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
            0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
            0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
            0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
            0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
            0333337F777FFFFF7F3333000000000003333377777777777333}
          NumGlyphs = 2
        end
        object BitBtn3: TBitBtn
          Left = 176
          Top = 17
          Width = 181
          Height = 41
          BiDiMode = bdLeftToRight
          Caption = 'Trocar Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 1
          WordWrap = True
          OnClick = BitBtn3Click
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000D30E0000D30E0000000100000001000031843100318C
            3100299C3100319C310031AD3100318C3900398C39003194390039943900319C
            390031A5390031B53900398C42003994420042944200399C420031A5420039A5
            420031B5420039B5420042944A004A944A00399C4A0039A54A0042A54A0039AD
            4A0039BD4A00429C5200529C520042A5520042AD520039BD520042BD52005AA5
            5A004AAD5A0042B55A004AB55A0042C65A005AA5630063A563004AB563004ABD
            630042C663004AC6630063A56B0052BD6B0052C66B004ACE6B006BA5730052C6
            73004ACE730052CE73005ACE730073AD7B007BB57B0052CE7B005ACE7B0052D6
            7B005AD67B007BAD840052D684005AD6840063D684005ADE840084B58C005ADE
            8C0063DE8C0063E78C006BE78C006BE7940073E794006BEF940073EF9C0073F7
            9C0073F7A5007BF7A5007BFFA500FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D4D4D4D4D4D
            4D4D0F264D4D4D4D4D4D4D4D4D4D4D4D4D4D401D4D4D4D4D4D4D4D4D4D4D4D4D
            4D4D224B223B4D4D4D4D4D4D4D4D4D4D4D4D284946054D4D4D4D4D360D4D4D4D
            4D4D40484944274D4D4D4D3633164D4D4D2645484849144D4D4D4D363337164D
            0D3845454848144D4D4D4D36333331002E4243454545144D4D4D4D362B2F3337
            3D3D42424522274D4D4D4D362B2B33333D3D3F42380D4D4D4D4D4D3620252B2F
            33373D3D144D4D4D4D4D4D3620202B2B333339284D4D4D4D4D4D4D36131A2025
            2B2F3337054D4D4D4D4D4D36131320202B2B2F331E144D4D4D4D4D36040B131A
            20252B2F3333144D4D4D4D3603030909111117171E1E0D0C4D4D}
        end
      end
      object GroupBox3: TGroupBox
        Left = 3
        Top = 158
        Width = 734
        Height = 312
        BiDiMode = bdLeftToRight
        Caption = 'NF'
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAppWorkSpace
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBiDiMode = False
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        object Label4: TLabel
          Left = 10
          Top = 288
          Width = 90
          Height = 16
          BiDiMode = bdLeftToRight
          Caption = 'Total de Itens'
          FocusControl = DBEdit4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
        end
        object Label6: TLabel
          Left = 224
          Top = 288
          Width = 108
          Height = 16
          BiDiMode = bdLeftToRight
          Caption = 'Valor Total da NF'
          FocusControl = DBEdit6
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
        end
        object Label20: TLabel
          Left = 490
          Top = 288
          Width = 90
          Height = 16
          BiDiMode = bdLeftToRight
          Caption = 'Total c/ Desc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
        end
        object Label25: TLabel
          Left = 581
          Top = 279
          Width = 142
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BiDiMode = bdLeftToRight
          Color = clYellow
          EllipsisPosition = epEndEllipsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Default'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Transparent = False
          Layout = tlCenter
        end
        object DBGrid5: TDBGrid
          Left = 295
          Top = 20
          Width = 428
          Height = 87
          Hint = 
            'Quando a linha estiver em "vermelho" significa que a Nota Fiscal' +
            ' est'#225' sem '#13#10'                                          "Titulos" ' +
            'cadastrados.'
          TabStop = False
          DataSource = DsNF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clAppWorkSpace
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clAppWorkSpace
          TitleFont.Height = -13
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGrid5DrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'NumeroNF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clDefault
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ReadOnly = True
              Title.Caption = 'N'#186' NF'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'Default'
              Title.Font.Style = []
              Width = 137
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DataEntrega'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clDefault
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Caption = 'Data Entrega'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'Default'
              Title.Font.Style = []
              Width = 140
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Desconto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clDefault
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Caption = 'Desc %'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'Default'
              Title.Font.Style = []
              Width = 113
              Visible = True
            end>
        end
        object GroupBox6: TGroupBox
          Left = 10
          Top = 114
          Width = 713
          Height = 158
          Caption = 'Itens da Nota Fiscal'
          TabOrder = 2
          object DBGrid4: TDBGrid
            Left = 97
            Top = 18
            Width = 610
            Height = 132
            TabStop = False
            Color = clSilver
            DataSource = DSItensNF
            FixedColor = clActiveBorder
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clAppWorkSpace
            TitleFont.Height = -13
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'Referencia'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -12
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Title.Caption = 'Refer'#234'ncia'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -13
                Title.Font.Name = 'Default'
                Title.Font.Style = []
                Width = 99
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Descricao'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clDefault
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Title.Caption = 'Descri'#231#227'o'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -13
                Title.Font.Name = 'Default'
                Title.Font.Style = []
                Width = 197
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'TotalItens'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clDefault
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Title.Caption = 'Total Itens'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -13
                Title.Font.Name = 'Default'
                Title.Font.Style = []
                Width = 69
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PrecoUnitario'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clDefault
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Title.Caption = 'Pre'#231'o Unit'#225'rio'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -13
                Title.Font.Name = 'Default'
                Title.Font.Style = []
                Width = 95
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Total'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clDefault
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -13
                Title.Font.Name = 'Default'
                Title.Font.Style = []
                Width = 111
                Visible = True
              end>
          end
          object BitBtn9: TBitBtn
            Left = 6
            Top = 20
            Width = 87
            Height = 62
            Caption = ' Adicionar   >>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            TabStop = False
            WordWrap = True
            OnClick = BitBtn9Click
          end
          object BitBtn10: TBitBtn
            Left = 6
            Top = 88
            Width = 87
            Height = 62
            Caption = '   Excluir     <<'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            TabStop = False
            WordWrap = True
            OnClick = BitBtn10Click
          end
        end
        object BitBtn1: TBitBtn
          Left = 14
          Top = 67
          Width = 266
          Height = 41
          BiDiMode = bdLeftToRight
          Caption = 'Cadastro de  T'#237'tulos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 3
          TabStop = False
          WordWrap = True
          OnClick = BitBtn1Click
        end
        object BitBtn7: TBitBtn
          Left = 152
          Top = 20
          Width = 128
          Height = 41
          BiDiMode = bdLeftToRight
          Caption = 'Excluir NF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 4
          TabStop = False
          OnClick = BitBtn7Click
        end
        object BitBtn11: TBitBtn
          Left = 14
          Top = 20
          Width = 128
          Height = 41
          BiDiMode = bdLeftToRight
          Caption = 'Adicionar NF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 0
          WordWrap = True
          OnClick = BitBtn11Click
        end
        object DBEdit4: TDBEdit
          Left = 104
          Top = 279
          Width = 107
          Height = 25
          TabStop = False
          BiDiMode = bdLeftToRight
          Color = clSilver
          DataField = 'Totalitens'
          DataSource = DsSomatoriaNF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit6: TDBEdit
          Left = 335
          Top = 279
          Width = 143
          Height = 25
          TabStop = False
          BiDiMode = bdLeftToRight
          Color = clSilver
          DataField = 'TotalGeral'
          DataSource = DsSomatoriaNF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object Panel2: TPanel
          Left = 294
          Top = 15
          Width = 429
          Height = 97
          TabOrder = 7
          Visible = False
          object GroupBox7: TGroupBox
            Left = 1
            Top = 1
            Width = 427
            Height = 95
            Align = alClient
            TabOrder = 0
            object Label21: TLabel
              Left = 8
              Top = 13
              Width = 83
              Height = 13
              Caption = 'N'#186' Nota Fiscal'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label22: TLabel
              Left = 140
              Top = 13
              Width = 76
              Height = 13
              Caption = 'Data Entrega'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label23: TLabel
              Left = 297
              Top = 13
              Width = 68
              Height = 13
              Caption = 'Desconto %'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Edit6: TEdit
              Left = 8
              Top = 27
              Width = 121
              Height = 22
              Ctl3D = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              OnKeyPress = Edit6KeyPress
            end
            object Edit7: TEdit
              Left = 295
              Top = 27
              Width = 121
              Height = 22
              Ctl3D = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 2
              Text = '0'
              OnKeyPress = Edit7KeyPress
            end
            object MaskEdit1: TMaskEdit
              Left = 139
              Top = 27
              Width = 146
              Height = 22
              BiDiMode = bdLeftToRight
              Ctl3D = False
              EditMask = '!99/99/00;1;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MaxLength = 8
              ParentBiDiMode = False
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 1
              Text = '  /  /  '
            end
            object BitBtn12: TBitBtn
              Left = 99
              Top = 59
              Width = 105
              Height = 25
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              OnClick = BitBtn12Click
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333330000333333333333333333333333F33333333333
                00003333344333333333333333388F3333333333000033334224333333333333
                338338F3333333330000333422224333333333333833338F3333333300003342
                222224333333333383333338F3333333000034222A22224333333338F338F333
                8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
                33333338F83338F338F33333000033A33333A222433333338333338F338F3333
                0000333333333A222433333333333338F338F33300003333333333A222433333
                333333338F338F33000033333333333A222433333333333338F338F300003333
                33333333A222433333333333338F338F00003333333333333A22433333333333
                3338F38F000033333333333333A223333333333333338F830000333333333333
                333A333333333333333338330000333333333333333333333333333333333333
                0000}
              NumGlyphs = 2
            end
            object BitBtn13: TBitBtn
              Left = 223
              Top = 59
              Width = 105
              Height = 25
              Cancel = True
              Caption = 'Cancelar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              TabStop = False
              OnClick = BitBtn13Click
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                333333333333333333333333000033338833333333333333333F333333333333
                0000333911833333983333333388F333333F3333000033391118333911833333
                38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
                911118111118333338F3338F833338F3000033333911111111833333338F3338
                3333F8330000333333911111183333333338F333333F83330000333333311111
                8333333333338F3333383333000033333339111183333333333338F333833333
                00003333339111118333333333333833338F3333000033333911181118333333
                33338333338F333300003333911183911183333333383338F338F33300003333
                9118333911183333338F33838F338F33000033333913333391113333338FF833
                38F338F300003333333333333919333333388333338FFF830000333333333333
                3333333333333333333888330000333333333333333333333333333333333333
                0000}
              NumGlyphs = 2
            end
          end
        end
      end
      object Panel3: TPanel
        Left = 110
        Top = 63
        Width = 610
        Height = 227
        BevelInner = bvRaised
        BiDiMode = bdLeftToRight
        Color = clGray
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Locked = True
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        Visible = False
        object Label24: TLabel
          Left = 13
          Top = 12
          Width = 32
          Height = 19
          Caption = 'NF: '
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object Label31: TLabel
          Left = 42
          Top = 7
          Width = 147
          Height = 24
          Alignment = taCenter
          AutoSize = False
          BiDiMode = bdLeftToRight
          Color = clWhite
          EllipsisPosition = epEndEllipsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBiDiMode = False
          ParentColor = False
          ParentFont = False
          Transparent = False
          Layout = tlCenter
        end
        object Shape1: TShape
          Left = 2
          Top = 182
          Width = 606
          Height = 43
          Align = alBottom
          Brush.Color = clBlack
          ExplicitLeft = 3
          ExplicitTop = 184
          ExplicitWidth = 621
        end
        object BitBtn14: TBitBtn
          Left = 491
          Top = 189
          Width = 108
          Height = 29
          Cancel = True
          Caption = 'Fechar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = BitBtn14Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF1897CC1F9FD11293CBFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1696CB
            9AF3FB6CEAF830B1DC30B1DC30B1DC1EA0D31293CBFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF1696CB90E2F287FFFF7FFBFF81FAFF7DF4FF73
            EEFE69E2F830B1DC30B1DC23A5D5FF00FFFF00FFFF00FFFF00FFFF00FF1696CB
            72CBE696FEFF77F6FF78F3FF77F2FF76F2FF76F0FF77F0FF7DF3FF5AD3F2199A
            D0FF00FFFF00FFFF00FFFF00FF1696CB30B1DC95EBF878F8FF78F3FF77F2FF75
            F0FF74EEFE72EDFE73EDFF5CD5F33CBBE3FF00FFFF00FFFF00FFFF00FF1696CB
            60DDF030B1DC87FEFF74F4FF77F2FF035E06046F0A037308025F0557D3F25ED8
            F3189CCFFF00FFFF00FFFF00FF1696CB7AF7FC30B1DC92E2F292EBF88FEDFA89
            F4FF72EFFF036F07058A0C0367066DE3FA3EBFE3FF00FFFF00FFFF00FF1696CB
            86FEFF6CEEFA30B1DC30B1DC30B1DC30B1DC9DEFFB77F0FF04770A05890C67E2
            FA66E3F80F92CAFF00FFFF00FF1696CB82FBFF7EFAFF7DFAFF7DF8FF77F4FF51
            D4EF30B1DC87DAF004670A0C9A1803690698F3FF2EAAD7FF00FFFF00FF1696CB
            83FCFF7BF8FF79F6FF78F3FF79F4FF7AF7FF69EAFB30B1DC0A73121CB0330A80
            1332A5D41F9ACFFF00FFFF00FF1696CB8EFFFF7BFBFF79F7FF7AF6FF76E7F878
            E6F87DEAFB01590436CB5F2DC5511CB035015904FF00FFFF00FFFF00FF1392CA
            1696CB87F2FA88F4FC6CE3F61899CE1392CA1696CB1797CC01590441E0730159
            04FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1696CB1C99CE1898CCFF00FFFF
            00FFFF00FFFF00FFFF00FF015904FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
        object BitBtn15: TBitBtn
          Left = 130
          Top = 189
          Width = 167
          Height = 29
          Cancel = True
          Caption = '&Adicionar Todos '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = BitBtn15Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FF00104C001460001872001872001462001150FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0015640015640020980026B800
            27BC0027BC0027BA00209C00166C00166CFF00FFFF00FFFF00FFFF00FFFF00FF
            001874001C880028C00028C20027BC0026B80027BC0027BC0028C00028C2001D
            8A001150FF00FFFF00FFFF00FF001874001F94002CD2002AC80027BC0026B86A
            80D6BAC5EC183BC00027BA0027BC0028C2001D8A00166CFF00FFFF00FF001874
            002EDE002DD8002ACA0027BC526CD0F2F4FBFFFFFFA3B1E60229BB0027BA0027
            BC0028C200166CFF00FF00197A0025B40032F0002DD80028C2546ED3F6F7FDFF
            FFFFFFFFFFFFFFFF92A3E20229BB0027BA0028C000209C00146000197A002FE0
            0032F0002EDE5D76D8F7F8FDFDFDFEF8F9FDFDFDFEFAFBFEFFFFFF8A9CDF052B
            BB0027BE0025B2001460001E900034F80034FA0034FAEDF0FEFFFFFF89A0F5BC
            C9F9FFFFFF8093DCE3E7F7FFFFFF93A4E20027BC0027BC00166A0021A02552FF
            0B3EFF0034FCDEE5FF96ACFF0035FFB9C8FFFFFFFF3C5ACD4965CEF5F7FCAAB7
            E80027BE0027BC0018720021A04168FF335DFF0033F4204DFC083AFC0034FCBD
            CAFDFFFFFF4A69E0002CD22247D60E37D3002AC80026B80015660021A0335DFF
            819BFF0035FF0032F20034FC0034FCBDCAFEFFFFFF4A6BE8002DDA002DDA002C
            D2002ACA0023AA001566FF00FF0031ECA9BBFF5D7FFF0030E80032F00034FCBE
            CBFEFFFFFF4B6DED002DDA002CD6002BCE002CD4001E8EFF00FFFF00FF0031EC
            436AFFC7D3FF5B7DFF0034FA0031EEC0CDFEFFFFFF4A6DF0002FE2002EDE002F
            E00029C4001E8EFF00FFFF00FFFF00FF002CD25D7FFFD3DCFF97ADFF3F67FF1F
            4EFF0D3FFF1344FF1344FF0539FF002CD6001D8AFF00FFFF00FFFF00FFFF00FF
            FF00FF335DFF335DFF95ABFFBFCCFFA7B9FF8DA5FF7390FF3962FF002FE0002F
            E0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0030E81747FF2D
            59FF2552FF0034FC0029C6FF00FFFF00FFFF00FFFF00FFFF00FF}
        end
        object BitBtn16: TBitBtn
          Left = 12
          Top = 189
          Width = 108
          Height = 29
          Cancel = True
          Caption = 'Adicionar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = BitBtn16Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FF013002014103025104025104014303013302FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF014503014503037808039C0B03
            9F0C039F0C039D0C027E09014D04014D04FF00FFFF00FFFF00FFFF00FFFF00FF
            034F0903650904A30D03A60C03A00B029E0A039F0C03A00C03A50C03A60C0269
            06013402FF00FFFF00FFFF00FF044F09066B110AAB1F07A415049E0D029D0A54
            C45CAAE3B010A61B039E0C03A00C03A70C026A06024C04FF00FFFF00FF044F09
            10AC300DAB2809A41C039E0F3EBC48EEFAEFFFFFFF90DA97049F0D039E0C039F
            0C03A70C024C04FF00FF0357060D822317B6410EA92D05A01341BD4BF3FBF4FF
            FFFFFFFFFFFFFFFF7ED486049F0D039E0C03A50C037B0801420303570617A341
            18B54A11AB344CC158F4FCF6FCFEFCF6FCF7FCFEFCF8FCF8FFFFFF75D17D05A0
            0F03A10C03960A01420306680D21B1511EB75120B54FEBF8EFFFFFFF84D99AB7
            E9C5FFFFFF69CC72DCF4DEFFFFFF7FD48703A00C039F0C014A040874123EBD69
            2ABA5C21B553DEF6E798E1B422B655BAEBCEFFFFFF2CB53735B841F2FBF398DD
            9E03A00C039F0C02520506780E54C57A44C6741CB24E36BD6626B75822B554BB
            EBCCFFFFFF41C05B0CA62721B03913AA2C07A518039D0C01460306780E4CBD69
            83DDA722B6551CB24E22B55422B554BCEBCEFFFFFF46C2670FAA300FAA2E0CA6
            2706A716038C0A014603FF00FF21A336AAE7C568D08E16AF481BB14C22B554BD
            EBCFFFFFFF4CC56F10A9310EA7290BA42009AF1C036B0AFF00FFFF00FF21A336
            56C573C5F0D866CF8C20B45219B14CBFEDD0FFFFFF4CC67513AC3C12AA340FB0
            2D0A991F036B0AFF00FFFF00FFFF00FF1399236ACC88D0F4E39AE1B650C77A38
            BD672CBA5D30BB602FBC5D23BC4F11A33006620FFF00FFFF00FFFF00FFFF00FF
            FF00FF4BBF674BBF6798E1B5BDEED4A7E7C490E0B178D99F49C7791B9D3D1B9D
            3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1DA43538B45446
            BC6642B8632BA649138C2AFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
        object BitBtn17: TBitBtn
          Left = 307
          Top = 189
          Width = 108
          Height = 29
          Cancel = True
          Caption = '&Estornar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = BitBtn17Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FF331400451B00572200572200471C00361600FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF491C00491C00803200A54100AA
            4200AA4200A74100843400511F00511F00FF00FFFF00FFFF00FFFF00FFFF00FF
            5923006E2B00AF4400B14500AA4200A54100AA4200AA4200AF4400B14500702C
            00361600FF00FFFF00FFFF00FF5923007B3000C54D00B84800AA4200A54100E7
            CAAFFFFFFFC07231A74100AA4200B14500702C00511F00FF00FFFF00FF592300
            D45300CC5000BB4900AA4200A74100E7C9ACFFFFFFC07332A74100A74100AA42
            00B14500511F00FF00FF5F2500A03F00EB5C00CC5000B14500AC4300A74100E7
            C9ABFFFFFFC07231A74100A74100A74100AF4400843400451B005F2500D75400
            EB5C00D45300BB5910AC4703AC4300E9C9ABFFFFFFC07231A74100B25711AC4A
            05AC43009E3E00451B00772E00F66000F86200F86200FBE7D4EFB47EE35900F7
            CEA6FFFFFFBA6825C07230FBF7F2E1BA95AA4200AA42004F1F00893500FF7813
            FF6A04FB6300FFF3E7FFFFFFFFB26FFFD3AAFFFFFFD59A66F4E7DAFFFFFFD9A7
            7AAC4300AA4200572200893500FF8829FF801EF05E00FC9742FFFAF4FFFEFCFF
            FAF6FFFEFCFEFBF8FFFFFFE2A670C44F01B84800A541004B1D00893500FF801E
            FFAD67FF6400EE5D00FC923AFFF8F3FFFFFFFFFFFFFFFFFFEAAF79CF5200C54D
            00BB4900953A004B1D00FF00FFE65A00FFC693FF9842E15800EB5C00FC9138FF
            F6EEFFFFFFF3BD8CCF5200CA4F00C04B00C74E00752D00FF00FFFF00FFE65A00
            FF892BFFDAB7FF9741F86200E95B00FB9E4FFED1A7E6670BD95500D45300D754
            00B44600752D00FF00FFFF00FFFF00FFC54D00FF9842FFE2C6FFBB7FFF8728FF
            750FFF6B05FF6E08FF6E08FF6701CA4F00702C00FF00FFFF00FFFF00FFFF00FF
            FF00FFFF801EFF801EFFBA7DFFD5ADFFC591FFB574FFA558FF8323D75400D754
            00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE15800FF700AFF
            7D19FF7813FB6300B64700FF00FFFF00FFFF00FFFF00FFFF00FF}
        end
        object DBGrid2: TDBGrid
          Left = 2
          Top = 34
          Width = 606
          Height = 148
          TabStop = False
          Align = alBottom
          BiDiMode = bdLeftToRight
          Ctl3D = False
          DataSource = DsItensPedido
          FixedColor = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentBiDiMode = False
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          OnDblClick = DBGrid2DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Referencia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Title.Caption = 'Refer'#234'ncia'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'Default'
              Title.Font.Style = []
              Width = 102
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Title.Caption = 'Descri'#231#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'Default'
              Title.Font.Style = []
              Width = 207
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'TotalItens'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Title.Caption = 'Total Itens'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'Default'
              Title.Font.Style = []
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PrecoUnitario'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Title.Caption = 'Pre'#231'o Unit'#225'rio'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'Default'
              Title.Font.Style = []
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'Default'
              Title.Font.Style = []
              Width = 108
              Visible = True
            end>
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Pagamento'
      ImageIndex = 2
      TabVisible = False
      OnShow = TabSheet3Show
      object GroupBox2: TGroupBox
        Left = 6
        Top = 176
        Width = 730
        Height = 365
        Caption = 'Parcelas'
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAppWorkSpace
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        object Label29: TLabel
          Left = 17
          Top = 341
          Width = 81
          Height = 16
          BiDiMode = bdLeftToRight
          Caption = 'N'#186' de T'#237'tulos'
          FocusControl = DBEdit10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
        end
        object Label30: TLabel
          Left = 231
          Top = 341
          Width = 105
          Height = 16
          BiDiMode = bdLeftToRight
          Caption = 'Total dos T'#237'tulos'
          FocusControl = DBEdit14
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
        end
        object DBGrid3: TDBGrid
          Left = 6
          Top = 20
          Width = 719
          Height = 301
          Hint = 
            'Quando a linha estiver na cor "Verde" significa que o T'#237'tulo j'#225' ' +
            'foi Quitado.'
          Align = alCustom
          BiDiMode = bdLeftToRight
          Ctl3D = False
          DataSource = DSBoletosCompra
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Arial'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = DBGrid3DrawColumnCell
          OnKeyDown = DBGrid3KeyDown
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NumeroParcela'
              ReadOnly = True
              Title.Caption = 'Parcela'
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NumeroNF'
              Title.Caption = 'N'#186' NF ou Doc'
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FormaPagamento'
              Width = 150
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DataVencimento'
              Title.Caption = 'Vencimento'
              Width = 106
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ValorParcela'
              Title.Caption = 'Valor Parcela'
              Width = 164
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Quitado'
              ReadOnly = True
              Width = 61
              Visible = True
            end>
        end
        object DBEdit10: TDBEdit
          Left = 103
          Top = 332
          Width = 74
          Height = 25
          TabStop = False
          BiDiMode = bdLeftToRight
          Color = clSilver
          DataField = 'TotalParcelas'
          DataSource = DsSomatoriaTitulos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit14: TDBEdit
          Left = 342
          Top = 332
          Width = 156
          Height = 25
          TabStop = False
          BiDiMode = bdLeftToRight
          Color = clSilver
          DataField = 'TotalGeral'
          DataSource = DsSomatoriaTitulos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object BitBtn19: TBitBtn
          Left = 512
          Top = 332
          Width = 101
          Height = 25
          Caption = 'Adicionar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          Visible = False
          OnClick = BitBtn19Click
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000666666666666666666666666666666666666000066666666FFF666666666
            666666FFF666666600006666666800F66666666666666877F666666600006666
            666800F66666666666666877F666666600006666666800F66666666666666877
            F666666600006666FFF600FFFFF6666666FFF777FFFFF6660000666800000000
            00F66666687777777777F666000066680000000000F66666687777777777F666
            000066688888006888666666688888777888666600006666666800F666666666
            66666877F666666600006666666800F66666666666666877F666666600006666
            666800F66666666666666877F666666600006666666888666666666666666888
            6666666600006666666666666666666666666666666666660000666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000}
          NumGlyphs = 2
        end
        object BitBtn20: TBitBtn
          Left = 619
          Top = 332
          Width = 101
          Height = 25
          Caption = 'Excluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          Visible = False
          OnClick = BitBtn20Click
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666666666666666666660000666668666666666666666666666666666666
            0000666608866666666666666686666666666666000066691086666688666666
            6888666666666666000066691088666008866666688866666886666600006669
            1108869110866666688886668888666600006666911089111066666666888868
            8888666600006666911191110666666666888888888666660000666669111110
            6666666666688888886666660000666666911108866666666666888886666666
            0000666666911110866666666666888888666666000066666911011088666666
            6668888888666666000066666910691108866666666888688886666600006666
            9106669110886666668886668888666600006666910666691108666666888666
            6888866600006666696666669106666666686666668886660000666666666666
            6966666666666666666866660000666666666666666666666666666666666666
            0000}
          NumGlyphs = 2
        end
      end
      object GroupBox4: TGroupBox
        Left = 6
        Top = -5
        Width = 730
        Height = 176
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object Label9: TLabel
          Left = 17
          Top = 77
          Width = 111
          Height = 14
          Caption = 'Forma Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Default'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 552
          Top = 77
          Width = 78
          Height = 14
          Caption = 'Valor Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Default'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 434
          Top = 77
          Width = 76
          Height = 14
          Caption = 'Qtd Parcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Default'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 266
          Top = 77
          Width = 105
          Height = 14
          Caption = 'Data Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Default'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object GroupBox5: TGroupBox
          Left = 17
          Top = 18
          Width = 695
          Height = 50
          BiDiMode = bdLeftToRight
          Caption = 'Informa'#231#245'es do Pedido'
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clAppWorkSpace
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBiDiMode = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 8
          object Label19: TLabel
            Left = 143
            Top = 22
            Width = 79
            Height = 19
            BiDiMode = bdLeftToRight
            Caption = 'Total itens'
            FocusControl = DBEdit11
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object Label17: TLabel
            Left = 425
            Top = 22
            Width = 102
            Height = 19
            BiDiMode = bdLeftToRight
            Caption = 'Total c/ Desc.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object Label26: TLabel
            Left = 297
            Top = 22
            Width = 63
            Height = 19
            BiDiMode = bdLeftToRight
            Caption = 'Desc. %'
            FocusControl = DBEdit12
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object Label27: TLabel
            Left = 11
            Top = 22
            Width = 22
            Height = 19
            BiDiMode = bdLeftToRight
            Caption = 'NF'
            FocusControl = DBEdit11
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
          end
          object Label28: TLabel
            Left = 533
            Top = 19
            Width = 147
            Height = 22
            Alignment = taCenter
            AutoSize = False
            BiDiMode = bdLeftToRight
            Color = clYellow
            EllipsisPosition = epEndEllipsis
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Default'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            Transparent = False
            Layout = tlCenter
          end
          object DBEdit11: TDBEdit
            Left = 225
            Top = 19
            Width = 63
            Height = 22
            TabStop = False
            BiDiMode = bdLeftToRight
            Ctl3D = False
            DataField = 'Totalitens'
            DataSource = DsSomatoriaNF
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Default'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit12: TDBEdit
            Left = 363
            Top = 19
            Width = 54
            Height = 22
            TabStop = False
            BiDiMode = bdLeftToRight
            Ctl3D = False
            DataField = 'Desconto'
            DataSource = DsNF
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Default'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit13: TDBEdit
            Left = 36
            Top = 19
            Width = 98
            Height = 25
            TabStop = False
            BiDiMode = bdLeftToRight
            Color = clMedGray
            Ctl3D = False
            DataField = 'NumeroNF'
            DataSource = DsNF
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Default'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
        end
        object BitBtn4: TBitBtn
          Left = 17
          Top = 139
          Width = 176
          Height = 25
          Caption = 'Gerar Parcelas'
          TabOrder = 4
          OnClick = BitBtn4Click
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object UpDown1: TUpDown
          Left = 521
          Top = 94
          Width = 16
          Height = 22
          Associate = Edit5
          Min = 1
          Position = 1
          TabOrder = 5
        end
        object Edit5: TEdit
          Left = 434
          Top = 94
          Width = 87
          Height = 22
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Default'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          Text = '1'
          OnChange = Edit5Change
          OnEnter = DBEdit3Enter
          OnExit = DBEdit3Exit
        end
        object Edit2: TEdit
          Left = 552
          Top = 94
          Width = 160
          Height = 22
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Default'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          OnEnter = Edit2Enter
          OnExit = DBEdit3Exit
          OnKeyPress = Edit2KeyPress
        end
        object ComboBox2: TComboBox
          Left = 17
          Top = 94
          Width = 237
          Height = 24
          Ctl3D = False
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Default'
          Font.Style = [fsBold]
          ItemHeight = 16
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnClick = ComboBox2Click
          Items.Strings = (
            'Boleto'
            'Cheque'
            'Avista')
        end
        object BitBtn5: TBitBtn
          Left = 532
          Top = 139
          Width = 87
          Height = 25
          Caption = 'Voltar'
          TabOrder = 6
          TabStop = False
          OnClick = BitBtn5Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333333333333333333333333333333333333333333333FF333333333333
            3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
            E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
            E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
            E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
            000033333373FF77777733333330003333333333333777333333333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
        end
        object BitBtn6: TBitBtn
          Left = 199
          Top = 139
          Width = 140
          Height = 25
          Caption = 'Cancelar T'#237'tulos'
          Enabled = False
          TabOrder = 7
          TabStop = False
          OnClick = BitBtn6Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
            3333333777333777FF3333993333339993333377FF3333377FF3399993333339
            993337777FF3333377F3393999333333993337F777FF333337FF993399933333
            399377F3777FF333377F993339993333399377F33777FF33377F993333999333
            399377F333777FF3377F993333399933399377F3333777FF377F993333339993
            399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
            99333773FF3333777733339993333339933333773FFFFFF77333333999999999
            3333333777333777333333333999993333333333377777333333}
          NumGlyphs = 2
        end
        object DateTimePicker1: TDateTimePicker
          Left = 266
          Top = 94
          Width = 156
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
        object BitBtn8: TBitBtn
          Left = 625
          Top = 139
          Width = 87
          Height = 25
          Caption = 'Sair'
          TabOrder = 9
          TabStop = False
          OnClick = BitBtn8Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
            03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
            0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
            0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
            0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
            0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
            0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
            0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
            0333337F777FFFFF7F3333000000000003333377777777777333}
          NumGlyphs = 2
        end
        object BitBtn18: TBitBtn
          Left = 345
          Top = 139
          Width = 140
          Height = 25
          Caption = 'Estornar Pgto'
          Enabled = False
          TabOrder = 10
          TabStop = False
          OnClick = BitBtn18Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          NumGlyphs = 2
        end
        object BitBtn21: TBitBtn
          Left = 17
          Top = 139
          Width = 176
          Height = 25
          Caption = 'Adicionar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          Visible = False
          OnClick = BitBtn21Click
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
      end
    end
  end
  object Pedido: TADOQuery
    Active = True
    Connection = DM.LigaBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select * from cad_compra where pedidofechado = false and dataent' +
        'rega between (date() - 180) and (date() + 190) order by empresa')
    Left = 137
    Top = 407
    object PedidoCod_Compra: TAutoIncField
      FieldName = 'Cod_Compra'
      ReadOnly = True
    end
    object PedidoEmpresa: TWideStringField
      FieldName = 'Empresa'
      Size = 50
    end
    object PedidoPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object PedidoDataPedido: TDateTimeField
      FieldName = 'DataPedido'
      DisplayFormat = 'dd.mm.yy'
    end
    object PedidoDataEntrega: TDateTimeField
      FieldName = 'DataEntrega'
      DisplayFormat = 'dd.mm.yy'
    end
    object PedidoPzoPagamento: TWideStringField
      FieldName = 'PzoPagamento'
    end
    object PedidoPedidoFechado: TBooleanField
      FieldName = 'PedidoFechado'
    end
    object PedidoObs: TWideMemoField
      FieldName = 'Obs'
      BlobType = ftWideMemo
    end
    object PedidoCorPedido: TWideStringField
      FieldName = 'CorPedido'
      Size = 25
    end
  end
  object DSPedido: TDataSource
    DataSet = Pedido
    Left = 169
    Top = 407
  end
  object DsSomatoriaNF: TDataSource
    DataSet = SomatoriaNF
    Left = 504
    Top = 406
  end
  object SomatoriaNF: TADOQuery
    Active = True
    Connection = DM.LigaBD
    CursorType = ctStatic
    DataSource = DsNF
    Parameters = <
      item
        Name = 'Id_NF'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Value = 1297
      end>
    SQL.Strings = (
      
        'select sum(totalitens) as Totalitens, sum(total) as TotalGeral f' +
        'rom Itenscompra where Id_NF = :Id_NF')
    Left = 472
    Top = 406
    object SomatoriaNFTotalitens: TFloatField
      FieldName = 'Totalitens'
    end
    object SomatoriaNFTotalGeral: TBCDField
      FieldName = 'TotalGeral'
      currency = True
      Precision = 19
    end
  end
  object BoletosCompra: TADOQuery
    Active = True
    Connection = DM.LigaBD
    CursorLocation = clUseServer
    DataSource = DsNF
    Parameters = <
      item
        Name = 'Id_NF'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Value = 1297
      end>
    SQL.Strings = (
      'select * from boletoscompra  where Id_NF = :Id_NF'
      '')
    Left = 332
    Top = 406
    object BoletosCompraCodInteno: TAutoIncField
      FieldName = 'CodInteno'
      ReadOnly = True
    end
    object BoletosCompraId_NF: TIntegerField
      FieldName = 'Id_NF'
    end
    object BoletosCompraEmpresa: TWideStringField
      FieldName = 'Empresa'
      Size = 50
    end
    object BoletosCompraNumeroNF: TIntegerField
      FieldName = 'NumeroNF'
    end
    object BoletosCompraNumeroParcela: TWideStringField
      FieldName = 'NumeroParcela'
      Size = 10
    end
    object BoletosCompraDataVencimento: TDateTimeField
      FieldName = 'DataVencimento'
      DisplayFormat = 'dd/mm/yy'
      EditMask = '!99/99/00;1;_'
    end
    object BoletosCompraDataPagamento: TDateTimeField
      FieldName = 'DataPagamento'
      DisplayFormat = 'dd/mm/yy'
      EditMask = '!99/99/00;1;_'
    end
    object BoletosCompraValorParcela: TBCDField
      FieldName = 'ValorParcela'
      currency = True
      Precision = 19
    end
    object BoletosCompraDesconto: TIntegerField
      FieldName = 'Desconto'
    end
    object BoletosCompraQuitado: TBooleanField
      FieldName = 'Quitado'
      DisplayValues = 'Sim;N'#227'o'
    end
    object BoletosCompraFormaPagamento: TWideStringField
      FieldName = 'FormaPagamento'
      Size = 10
    end
  end
  object DSBoletosCompra: TDataSource
    DataSet = BoletosCompra
    Left = 364
    Top = 406
  end
  object ItensNF: TADOQuery
    Active = True
    Connection = DM.LigaBD
    CursorLocation = clUseServer
    DataSource = DsNF
    Parameters = <
      item
        Name = 'Id_NF'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Value = 1297
      end>
    SQL.Strings = (
      
        'select * from ItensCompra where Id_NF = :Id_NF order by descrica' +
        'o')
    Left = 263
    Top = 407
    object ItensNFCodDetalhecompra: TAutoIncField
      FieldName = 'CodDetalhecompra'
      ReadOnly = True
    end
    object ItensNFCod_Compra: TIntegerField
      FieldName = 'Cod_Compra'
    end
    object ItensNFReferencia: TWideStringField
      FieldName = 'Referencia'
    end
    object ItensNFTotalItens: TIntegerField
      FieldName = 'TotalItens'
    end
    object ItensNFDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object ItensNFPrecoUnitario: TBCDField
      FieldName = 'PrecoUnitario'
      DisplayFormat = '0.00'
      Precision = 19
    end
    object ItensNFTotal: TBCDField
      FieldName = 'Total'
      DisplayFormat = '0.00'
      Precision = 19
    end
    object ItensNFId_NF: TIntegerField
      FieldName = 'Id_NF'
    end
  end
  object DSItensNF: TDataSource
    DataSet = ItensNF
    Left = 295
    Top = 407
  end
  object NF: TADOQuery
    Active = True
    Connection = DM.LigaBD
    CursorType = ctStatic
    DataSource = DSPedido
    Parameters = <
      item
        Name = 'cod_compra'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Value = 564
      end>
    SQL.Strings = (
      'select * from cad_NF where cod_compra = :cod_compra ')
    Left = 200
    Top = 408
    object NFId_NF: TAutoIncField
      FieldName = 'Id_NF'
      ReadOnly = True
    end
    object NFCod_Compra: TIntegerField
      FieldName = 'Cod_Compra'
    end
    object NFNumeroNF: TIntegerField
      FieldName = 'NumeroNF'
    end
    object NFDataEntrega: TDateTimeField
      FieldName = 'DataEntrega'
      DisplayFormat = 'dd/mm/yy'
    end
    object NFDesconto: TIntegerField
      FieldName = 'Desconto'
    end
  end
  object ItensPedido: TADOQuery
    Active = True
    Connection = DM.LigaBD
    CursorType = ctStatic
    DataSource = DSPedido
    Parameters = <
      item
        Name = 'Cod_compra'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Value = 564
      end>
    SQL.Strings = (
      
        'select * from ItensCompra where id_nf = 0 and cod_compra = :Cod_' +
        'compra order by descricao')
    Left = 600
    Top = 405
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
  object DsNF: TDataSource
    DataSet = NF
    OnDataChange = DsNFDataChange
    Left = 232
    Top = 408
  end
  object DsItensPedido: TDataSource
    DataSet = ItensPedido
    Left = 632
    Top = 405
  end
  object SomatoriaPedido: TADOQuery
    Active = True
    Connection = DM.LigaBD
    CursorType = ctStatic
    DataSource = DSPedido
    Parameters = <
      item
        Name = 'Cod_Compra'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Value = 564
      end>
    SQL.Strings = (
      
        'select sum(totalitens) as Totalitens, sum(total) as TotalGeral f' +
        'rom Itenscompra where Cod_Compra = :Cod_Compra')
    Left = 408
    Top = 406
    object FloatField1: TFloatField
      FieldName = 'Totalitens'
    end
    object BCDField1: TBCDField
      FieldName = 'TotalGeral'
      currency = True
      Precision = 19
    end
  end
  object DsSomatoriaPedido: TDataSource
    DataSet = SomatoriaPedido
    Left = 440
    Top = 406
  end
  object SomatoriaTitulos: TADOQuery
    Active = True
    Connection = DM.LigaBD
    CursorType = ctStatic
    DataSource = DsNF
    Parameters = <
      item
        Name = 'Id_NF'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Value = 1297
      end>
    SQL.Strings = (
      
        'select count(numeroparcela) as TotalParcelas, sum(valorparcela) ' +
        'as TotalGeral  from boletoscompra  where Id_NF = :Id_NF'
      '')
    Left = 536
    Top = 406
    object SomatoriaTitulosTotalParcelas: TIntegerField
      FieldName = 'TotalParcelas'
    end
    object SomatoriaTitulosTotalGeral: TBCDField
      FieldName = 'TotalGeral'
      currency = True
      Precision = 19
    end
  end
  object DsSomatoriaTitulos: TDataSource
    DataSet = SomatoriaTitulos
    Left = 568
    Top = 406
  end
  object PedidosParcial: TADOQuery
    Active = True
    Connection = DM.LigaBD
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      
        'select * from Cad_Compra where pedidofechado = false and Cod_Com' +
        'pra = some (select Cod_Compra from Cad_NF) ')
    Left = 512
    Top = 376
    object PedidosParcialCod_Compra: TAutoIncField
      FieldName = 'Cod_Compra'
      ReadOnly = True
    end
  end
  object DsPedidosParcial: TDataSource
    DataSet = PedidosParcial
    Left = 544
    Top = 376
  end
  object DSNfSemBoletos: TDataSource
    DataSet = NfsComBoletos
    Left = 472
    Top = 376
  end
  object NfsComBoletos: TADOQuery
    Active = True
    Connection = DM.LigaBD
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      
        'select * from cad_NF where id_nf = some (select id_nf  from bole' +
        'toscompra) ')
    Left = 440
    Top = 376
    object NfsComBoletosId_NF: TAutoIncField
      FieldName = 'Id_NF'
      ReadOnly = True
    end
    object NfsComBoletosCod_Compra: TIntegerField
      FieldName = 'Cod_Compra'
    end
    object NfsComBoletosNumeroNF: TIntegerField
      FieldName = 'NumeroNF'
    end
    object NfsComBoletosDataEntrega: TDateTimeField
      FieldName = 'DataEntrega'
    end
    object NfsComBoletosDesconto: TIntegerField
      FieldName = 'Desconto'
    end
  end
end
