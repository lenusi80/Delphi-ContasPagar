object FrmFiltroRelatorio2: TFrmFiltroRelatorio2
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Op'#231#245'es'
  ClientHeight = 177
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn2: TBitBtn
    Left = 194
    Top = 134
    Width = 180
    Height = 39
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object BitBtn1: TBitBtn
    Left = 5
    Top = 134
    Width = 180
    Height = 39
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
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
  object GroupBox1: TGroupBox
    Left = 5
    Top = 1
    Width = 369
    Height = 128
    TabOrder = 2
    object Label4: TLabel
      Left = 10
      Top = 74
      Width = 65
      Height = 13
      AutoSize = False
      Caption = 'Data'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 265
      Top = 74
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'Ano'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 110
      Top = 74
      Width = 68
      Height = 13
      AutoSize = False
      Caption = 'M'#234's'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object DateTimePicker1: TDateTimePicker
      Left = 10
      Top = 90
      Width = 98
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvSpace
      BevelKind = bkFlat
      CalAlignment = dtaRight
      Date = 0.383523761571268500
      Time = 0.383523761571268500
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = [fsBold]
      ParseInput = True
      ParentFont = False
      TabOrder = 0
    end
    object RadioGroup1: TRadioGroup
      Left = 10
      Top = 15
      Width = 349
      Height = 49
      Caption = 'Escolha uma op'#231#227'o de Pesquisa'
      Columns = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Hoje'
        'Outro Dia'
        'M'#234's')
      ParentFont = False
      TabOrder = 1
      OnClick = RadioGroup1Click
    end
    object ComboBox1: TComboBox
      Left = 110
      Top = 90
      Width = 152
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 2
      Items.Strings = (
        'JANEIRO'
        'FEVEREIRO'
        'MAR'#199'O'
        'ABRIL'
        'MAIO'
        'JUNHO'
        'JULHO'
        'AGOSTO'
        'SETEMBRO'
        'OUTUBRO'
        'NOVEMBRO'
        'DEZEMBRO'
        'ANO INTEIRO')
    end
    object Edit1: TEdit
      Left = 265
      Top = 90
      Width = 76
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Text = '1980'
    end
    object UpDown1: TUpDown
      Left = 341
      Top = 90
      Width = 17
      Height = 21
      Associate = Edit1
      Enabled = False
      Min = 1980
      Max = 2030
      Position = 1980
      TabOrder = 4
      Thousands = False
    end
  end
end
