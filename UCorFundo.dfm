object FrmCorFundo: TFrmCorFundo
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cor do Fundo'
  ClientHeight = 306
  ClientWidth = 246
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 11
    Width = 194
    Height = 16
    Caption = 'Escolha abaixo a cor desejada'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ColorGrid1: TColorGrid
    Left = 11
    Top = 33
    Width = 224
    Height = 208
    ClickEnablesColor = True
    Ctl3D = False
    ForegroundEnabled = False
    BackgroundEnabled = False
    ParentCtl3D = False
    Selection = 1
    TabOrder = 0
    OnClick = ColorGrid1Click
    OnMouseMove = ColorGrid1MouseMove
  end
  object BitBtn1: TBitBtn
    Left = 11
    Top = 270
    Width = 108
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Default'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 127
    Top = 270
    Width = 108
    Height = 29
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
  object CheckBox1: TCheckBox
    Left = 11
    Top = 247
    Width = 224
    Height = 17
    Caption = 'Colocar Imagem No Fundo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = CheckBox1Click
  end
  object AbreImagem: TOpenPictureDialog
    Left = 152
    Top = 136
  end
end
