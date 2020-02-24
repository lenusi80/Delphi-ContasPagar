object FrmFiltroRelatorio: TFrmFiltroRelatorio
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Op'#231#245'es'
  ClientHeight = 206
  ClientWidth = 382
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 3
    Width = 366
    Height = 153
    TabOrder = 0
    object Label1: TLabel
      Left = 27
      Top = 58
      Width = 86
      Height = 13
      AutoSize = False
      Caption = 'Fornecedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Default'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 27
      Top = 13
      Width = 65
      Height = 13
      AutoSize = False
      Caption = 'Per'#237'odo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Default'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 27
      Top = 104
      Width = 98
      Height = 13
      AutoSize = False
      Caption = 'N'#186' Documento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Default'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 27
      Top = 32
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
      Left = 181
      Top = 32
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
    object Edit1: TEdit
      Left = 27
      Top = 119
      Width = 121
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
      OnEnter = MaskEdit1Enter
      OnExit = MaskEdit1Exit
      OnKeyPress = Edit1KeyPress
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 27
      Top = 73
      Width = 316
      Height = 22
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Default'
      Font.Style = [fsBold]
      KeyField = 'Cod_Empresa'
      ListField = 'Empresa'
      ListSource = DM.DS_Fornecedores
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      OnEnter = MaskEdit1Enter
      OnExit = MaskEdit1Exit
      OnKeyUp = DBLookupComboBox1KeyUp
    end
    object DateTimePicker1: TDateTimePicker
      Left = 48
      Top = 28
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
      Left = 199
      Top = 28
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
      OnCloseUp = DateTimePicker2CloseUp
    end
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 161
    Width = 176
    Height = 39
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Default'
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
  object BitBtn2: TBitBtn
    Left = 198
    Top = 161
    Width = 176
    Height = 39
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Default'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
end
