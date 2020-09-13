object Main: TMain
  Left = 0
  Top = 0
  Caption = 'Finance Manager'
  ClientHeight = 550
  ClientWidth = 1100
  Color = clMoneyGreen
  ParentFont = True
  Menu = mainMenu
  OldCreateOrder = False
  PopupMode = pmAuto
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object lblPlans: TLabel
    Left = 695
    Top = 25
    Width = 104
    Height = 59
    Caption = 'Plans'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Quicksand'
    Font.Style = [fsBold, fsItalic, fsUnderline]
    ParentFont = False
  end
  object pnlTransact: TPanel
    Left = 8
    Top = 25
    Width = 601
    Height = 517
    Color = 11992807
    ParentBackground = False
    TabOrder = 0
    object lblTransactionHeading: TLabel
      Left = 166
      Top = 5
      Width = 249
      Height = 59
      Caption = 'Transactions'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -40
      Font.Name = 'Quicksand'
      Font.Style = [fsBold, fsItalic, fsUnderline]
      ParentFont = False
    end
    object lblCategory: TLabel
      Left = 344
      Top = 232
      Width = 100
      Height = 25
      Caption = 'Category:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblAmount: TLabel
      Left = 64
      Top = 233
      Width = 88
      Height = 25
      Caption = 'Amount:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblComment: TLabel
      Left = 64
      Top = 328
      Width = 106
      Height = 25
      Caption = 'Comment:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object rgTransaction: TRadioGroup
      Left = 64
      Top = 80
      Width = 201
      Height = 121
      Caption = 'Transaction:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -20
      Font.Name = 'Verdana'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Deposit'
        'Withdrawl')
      ParentFont = False
      TabOrder = 0
    end
    object rgType: TRadioGroup
      Left = 344
      Top = 80
      Width = 201
      Height = 121
      Caption = 'Type:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Verdana'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Cash'
        'Card')
      ParentFont = False
      TabOrder = 1
    end
    object cmbCategory: TComboBox
      Left = 344
      Top = 264
      Width = 201
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Verdana'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 2
      Text = 'Food'
      Items.Strings = (
        'Food'
        'Travel'
        'Entertainment'
        'Savings'
        'Health'
        'Education'
        'Fashion'
        'Gift'
        'Other')
    end
    object edtAmount: TEdit
      Left = 64
      Top = 264
      Width = 201
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object btnAdd: TButton
      Left = 240
      Top = 440
      Width = 97
      Height = 49
      Caption = 'Add'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnAddClick
    end
    object edtComment: TEdit
      Left = 64
      Top = 359
      Width = 481
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
  end
  object memPlans: TMemo
    Left = 648
    Top = 90
    Width = 444
    Height = 452
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object btnSave: TButton
    Left = 922
    Top = 35
    Width = 97
    Height = 49
    Caption = 'Save'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnSaveClick
  end
  object mainMenu: TMainMenu
    Left = 16
    Top = 24
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
