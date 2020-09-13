object DatabaseForm: TDatabaseForm
  Left = 0
  Top = 0
  Caption = 'Finance Manager'
  ClientHeight = 550
  ClientWidth = 1100
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object DBGrid1: TDBGrid
    Left = 16
    Top = 16
    Width = 1065
    Height = 433
    DataSource = dmMain.dataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 469
    Width = 1060
    Height = 57
    DataSource = dmMain.dataSource
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 16
    object TransactionMenu: TMenuItem
      Caption = 'Transaction'
      OnClick = TransactionMenuClick
    end
    object GraphMenu: TMenuItem
      Caption = 'Graphs'
      OnClick = GraphMenuClick
    end
    object DatabaseMenu: TMenuItem
      Caption = 'Database'
      OnClick = DatabaseMenuClick
    end
    object CloseMenu: TMenuItem
      Caption = 'Close'
      OnClick = CloseMenuClick
    end
  end
end
