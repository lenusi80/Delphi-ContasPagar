object FrmAltSenhas: TFrmAltSenhas
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Altera'#231#227'o de Senhas'
  ClientHeight = 230
  ClientWidth = 272
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 7
    Top = 7
    Width = 258
    Height = 216
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 35
      Width = 51
      Height = 19
      Caption = 'Empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 13
      Top = 66
      Width = 78
      Height = 19
      Caption = 'Senha Atual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 14
      Top = 97
      Width = 75
      Height = 19
      Caption = 'Nova Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 13
      Top = 128
      Width = 45
      Height = 19
      Caption = 'Repetir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 77
      Top = 32
      Width = 158
      Height = 22
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Century Gothic'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object Edit2: TEdit
      Left = 112
      Top = 63
      Width = 123
      Height = 22
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Century Gothic'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
      OnEnter = Edit1Enter
      OnExit = Edit2Exit
    end
    object Edit3: TEdit
      Left = 112
      Top = 94
      Width = 123
      Height = 22
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Century Gothic'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object Edit4: TEdit
      Left = 112
      Top = 125
      Width = 123
      Height = 22
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Century Gothic'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 3
      OnEnter = Edit1Enter
      OnExit = Edit4Exit
    end
    object BitBtn1: TBitBtn
      Left = 22
      Top = 176
      Width = 101
      Height = 25
      Caption = 'OK'
      TabOrder = 4
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
      Left = 135
      Top = 176
      Width = 101
      Height = 25
      TabOrder = 5
      Kind = bkCancel
    end
  end
end
