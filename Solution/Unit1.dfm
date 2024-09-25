object Form1: TForm1
  Left = 398
  Top = 22
  Width = 808
  Height = 382
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = menu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Enter: TStringGrid
    Left = 7
    Top = 9
    Width = 770
    Height = 264
    ColCount = 10
    DefaultColWidth = 75
    FixedCols = 0
    RowCount = 10
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
    TabOrder = 0
  end
  object chkAutomatic: TCheckBox
    Left = 16
    Top = 288
    Width = 97
    Height = 17
    Caption = 'Automatic'
    TabOrder = 1
    OnClick = chkAutomaticClick
  end
  object menu: TMainMenu
    Left = 745
    Top = 15
    object File1: TMenuItem
      Caption = 'File'
      object Open: TMenuItem
        Caption = 'Open'
        OnClick = OpenClick
      end
      object Save: TMenuItem
        Caption = 'Save'
        OnClick = SaveClick
      end
      object Save_as: TMenuItem
        Caption = 'Save as'
        OnClick = Save_asClick
      end
      object Clear: TMenuItem
        Caption = 'Clear'
        OnClick = ClearClick
      end
    end
    object Run: TMenuItem
      Caption = 'Run'
      OnClick = RunClick
    end
    object Exit: TMenuItem
      Caption = 'Exit'
      OnClick = ExitClick
    end
  end
  object Open_Dialog: TOpenDialog
    Left = 791
    Top = 15
  end
  object Save_Dialog: TSaveDialog
    Left = 843
    Top = 15
  end
end
