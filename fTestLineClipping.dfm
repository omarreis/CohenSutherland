object Form1: TForm1
  Left = 489
  Top = 122
  Width = 721
  Height = 539
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  PixelsPerInch = 96
  TextHeight = 13
  object lab1: TLabel
    Left = 120
    Top = 16
    Width = 14
    Height = 13
    Caption = 'x0:'
  end
  object lab2: TLabel
    Left = 120
    Top = 40
    Width = 14
    Height = 13
    Caption = 'y0:'
  end
  object lab3: TLabel
    Left = 232
    Top = 16
    Width = 14
    Height = 13
    Caption = 'x1:'
  end
  object lab4: TLabel
    Left = 232
    Top = 40
    Width = 14
    Height = 13
    Caption = 'y1:'
  end
  object edX0: TEdit
    Left = 142
    Top = 12
    Width = 67
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    Text = '100'
  end
  object edY0: TEdit
    Left = 142
    Top = 36
    Width = 67
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    Text = '100'
  end
  object edX1: TEdit
    Left = 254
    Top = 12
    Width = 67
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    Text = '400'
  end
  object edY1: TEdit
    Left = 254
    Top = 36
    Width = 67
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
    Text = '500'
  end
  object btnClipAndDraw: TButton
    Left = 352
    Top = 20
    Width = 105
    Height = 25
    Caption = 'Clip n Draw'
    TabOrder = 4
    OnClick = btnClipAndDrawClick
  end
end
