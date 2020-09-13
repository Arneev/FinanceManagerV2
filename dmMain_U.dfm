object dmMain: TdmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 595
  Width = 864
  object adoConnec: TADOConnection
    ConnectionString = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=MainDB.mdb;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 80
    Top = 56
  end
  object adoTable: TADOTable
    Connection = adoConnec
    CursorType = ctStatic
    TableName = 'Transactions'
    Left = 176
    Top = 56
  end
  object adoQuery: TADOQuery
    Connection = adoConnec
    CursorType = ctStatic
    DataSource = dataSource
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Transactions')
    Left = 344
    Top = 56
  end
  object dataSource: TDataSource
    DataSet = adoTable
    OnDataChange = dataSourceDataChange
    Left = 264
    Top = 56
  end
end
