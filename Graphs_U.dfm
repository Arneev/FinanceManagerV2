object GraphForm: TGraphForm
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
  Menu = MainMenu2
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object pnlSort: TPanel
    Left = 8
    Top = 464
    Width = 1084
    Height = 78
    Color = 16777135
    ParentBackground = False
    TabOrder = 0
    object lblSortBy: TLabel
      Left = 16
      Top = 24
      Width = 93
      Height = 35
      Caption = 'Sort By:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -30
      Font.Name = 'Tw Cen MT'
      Font.Style = []
      ParentFont = False
    end
    object lblShow: TLabel
      Left = 347
      Top = 24
      Width = 70
      Height = 35
      Caption = 'Show:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -30
      Font.Name = 'Tw Cen MT'
      Font.Style = []
      ParentFont = False
    end
    object lblForm: TLabel
      Left = 680
      Top = 24
      Width = 65
      Height = 35
      Caption = 'Form:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -30
      Font.Name = 'Tw Cen MT'
      Font.Style = []
      ParentFont = False
    end
    object cmbSort: TComboBox
      Left = 123
      Top = 24
      Width = 185
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Verdana'
      Font.Style = []
      ItemIndex = 3
      ParentFont = False
      TabOrder = 0
      Text = 'All of Time'
      Items.Strings = (
        'Day'
        'Month'
        'Year'
        'All of Time')
    end
    object cmbShow: TComboBox
      Left = 431
      Top = 24
      Width = 217
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Verdana'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 1
      Text = 'Cards vs. Cash'
      Items.Strings = (
        'Cards vs. Cash'
        'Category')
    end
    object cmbForm: TComboBox
      Left = 751
      Top = 24
      Width = 162
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Verdana'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 2
      Text = 'Percentage'
      Items.Strings = (
        'Percentage'
        'Amount')
    end
    object btnDisplay: TButton
      Left = 952
      Top = 16
      Width = 120
      Height = 49
      Caption = 'Display'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnDisplayClick
    end
  end
  object pnlGraph: TPanel
    Left = 423
    Top = 8
    Width = 669
    Height = 441
    Color = 33023
    ParentBackground = False
    TabOrder = 1
    object tcMain: TChart
      Left = 16
      Top = 12
      Width = 641
      Height = 417
      Title.Font.Color = 3815126
      Title.Font.Height = -18
      Title.Text.Strings = (
        'Amount Spent per Category')
      BottomAxis.Title.Caption = 'Category'
      BottomAxis.Title.Font.Height = -17
      BottomAxis.Title.Font.Style = [fsBold]
      LeftAxis.Title.Caption = 'Amount (Spent)'
      LeftAxis.Title.Font.Height = -17
      LeftAxis.Title.Font.Style = [fsBold]
      View3D = False
      View3DOptions.Elevation = 315
      View3DOptions.Orthogonal = False
      View3DOptions.Perspective = 0
      View3DOptions.Rotation = 360
      Color = 14286846
      TabOrder = 0
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 19
      object Series1: TBarSeries
        Title = 'Bar'
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
        Data = {0000000000}
      end
      object Series2: TPieSeries
        Title = 'Pie'
        XValues.Order = loAscending
        YValues.Name = 'Pie'
        YValues.Order = loNone
        Frame.InnerBrush.BackColor = clRed
        Frame.InnerBrush.Gradient.EndColor = clGray
        Frame.InnerBrush.Gradient.MidColor = clWhite
        Frame.InnerBrush.Gradient.StartColor = 4210752
        Frame.InnerBrush.Gradient.Visible = True
        Frame.MiddleBrush.BackColor = clYellow
        Frame.MiddleBrush.Gradient.EndColor = 8553090
        Frame.MiddleBrush.Gradient.MidColor = clWhite
        Frame.MiddleBrush.Gradient.StartColor = clGray
        Frame.MiddleBrush.Gradient.Visible = True
        Frame.OuterBrush.BackColor = clGreen
        Frame.OuterBrush.Gradient.EndColor = 4210752
        Frame.OuterBrush.Gradient.MidColor = clWhite
        Frame.OuterBrush.Gradient.StartColor = clSilver
        Frame.OuterBrush.Gradient.Visible = True
        Frame.Width = 4
        OtherSlice.Legend.Visible = False
      end
    end
  end
  object pnlStats: TPanel
    Left = 8
    Top = 8
    Width = 409
    Height = 441
    Color = 11992807
    ParentBackground = False
    TabOrder = 2
    object lblStatHeading: TLabel
      Left = 123
      Top = 12
      Width = 143
      Height = 49
      Caption = 'Statistics'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Quicksand'
      Font.Style = [fsBold, fsItalic, fsUnderline]
      ParentFont = False
    end
    object lblTotMoney: TLabel
      Left = 24
      Top = 96
      Width = 179
      Height = 18
      Caption = 'Total Money is R4806'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = -1
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotCash: TLabel
      Left = 24
      Top = 160
      Width = 143
      Height = 18
      Caption = 'Total Cash is R50'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = -1
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotCard: TLabel
      Left = 24
      Top = 228
      Width = 163
      Height = 18
      Caption = 'Total Card is R4700'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = -1
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotGain: TLabel
      Left = 24
      Top = 296
      Width = 320
      Height = 18
      Caption = 'Total Money Gained this Month is R500'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = -1
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotSpent: TLabel
      Left = 24
      Top = 368
      Width = 312
      Height = 18
      Caption = 'Total Money Spent this Month is R200'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = -1
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object MainMenu2: TMainMenu
    Left = 16
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
