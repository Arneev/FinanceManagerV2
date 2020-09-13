unit dmMain_U;

interface

uses
  System.SysUtils, System.Classes,
   Data.Win.ADODB, Data.DB, Dialogs,
   Winapi.Windows;

type
  TdmMain = class(TDataModule)
    adoConnec: TADOConnection;
    adoTable: TADOTable;
    adoQuery: TADOQuery;
    dataSource: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure dataSourceDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMain: TdmMain;

implementation

  const
  DBName = 'MainDB.mdb';



{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure sortDB();
var
  adoConnec : TADOConnection;
  adoTable : TADOTable;
  adoQuery : TADOQuery;
begin

  adoConnec := dmMain.adoConnec;

  if NOT adoConnec.Connected then
  begin
    adoTable := dmMain.adoTable;
    adoQuery := dmMain.adoQuery;

    adoConnec.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=MainDB.mdb;';
    adoConnec.LoginPrompt := False;
    adoConnec.Connected := True;

    adoTable.Active := True;

    adoQuery.Active := True;
  end;

end;

procedure TdmMain.DataModuleCreate(Sender: TObject);
begin

  sortDB();

end;




procedure TdmMain.dataSourceDataChange(Sender: TObject; Field: TField);
begin
  //Not sure
end;

end.
