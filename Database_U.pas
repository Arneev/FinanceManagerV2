unit Database_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmMain_U, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Menus, Vcl.ExtCtrls, Vcl.DBCtrls, Helper_U;

type
  TDatabaseForm = class(TForm)
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    TransactionMenu: TMenuItem;
    GraphMenu: TMenuItem;
    DatabaseMenu: TMenuItem;
    CloseMenu: TMenuItem;
    DBNavigator1: TDBNavigator;
    procedure TransactionMenuClick(Sender: TObject);
    procedure GraphMenuClick(Sender: TObject);
    procedure DatabaseMenuClick(Sender: TObject);
    procedure CloseMenuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DatabaseForm: TDatabaseForm;

implementation
 uses Main_U, Graphs_U;

{$R *.dfm}


{$region 'Main Menu'}
  procedure TDatabaseForm.CloseMenuClick(Sender: TObject);
  begin
    Application.MainForm.Close;
    Application.Terminate;
    Exit;
  end;

procedure TDatabaseForm.DatabaseMenuClick(Sender: TObject);
  begin
    Helper_U.ShowForm(Self, Database_U.DatabaseForm);
  end;

procedure TDatabaseForm.FormShow(Sender: TObject);
begin
  with dmMain do
  begin
    adoQuery.Active := False;
    adoQuery.SQL.Text := ('SELECT * FROM Transactions');
    adoQuery.Active := True;
  end;
end;

procedure TDatabaseForm.GraphMenuClick(Sender: TObject);
  begin
    Helper_U.ShowForm(Self, Graphs_U.GraphForm);
  end;

procedure TDatabaseForm.TransactionMenuClick(Sender: TObject);
  begin
    Helper_U.ShowForm(Self, Main_U.Main);
  end;
{$endregion}

end.
