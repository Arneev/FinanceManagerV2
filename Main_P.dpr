program Main_P;

uses
  Vcl.Forms,
  Main_U in 'Main_U.pas' {Main},
  dmMain_U in 'dmMain_U.pas' {dmMain: TDataModule},
  Database_U in 'Database_U.pas' {DatabaseForm},
  Graphs_U in 'Graphs_U.pas' {GraphForm},
  Helper_U in 'Helper_U.pas',
  DataHolder_U in 'DataHolder_U.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TDatabaseForm, DatabaseForm);
  Application.CreateForm(TGraphForm, GraphForm);
  Application.Run;
end.
