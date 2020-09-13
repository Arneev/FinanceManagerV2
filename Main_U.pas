unit Main_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  dmMain_U, Helper_U;

type
  TMain = class(TForm)
    pnlTransact: TPanel;
    mainMenu: TMainMenu;
    TransactionMenu: TMenuItem;
    GraphMenu: TMenuItem;
    DatabaseMenu: TMenuItem;
    lblTransactionHeading: TLabel;
    rgTransaction: TRadioGroup;
    rgType: TRadioGroup;
    cmbCategory: TComboBox;
    lblCategory: TLabel;
    edtAmount: TEdit;
    lblAmount: TLabel;
    btnAdd: TButton;
    memPlans: TMemo;
    CloseMenu: TMenuItem;
    lblPlans: TLabel;
    btnSave: TButton;
    lblComment: TLabel;
    edtComment: TEdit;
    procedure btnAddClick(Sender: TObject);
    procedure TransactionMenuClick(Sender: TObject);
    procedure GraphMenuClick(Sender: TObject);
    procedure CloseMenuClick(Sender: TObject);
    procedure DatabaseMenuClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation
  uses Graphs_U, Database_U;

  const
    fileName = 'plans.txt';

{$R *.dfm}

{$region 'Transactions'}
  {$region 'Transactions Getting & Setting'}
    procedure getTransVals(var isDeposit : Boolean; var isCard : Boolean;
                      var category : String; var amount : Integer;
                      var comment : String; var dateIn : TDateTime);
    begin

        isDeposit := (Main.rgTransaction.ItemIndex = 0);
        isCard := (Main.rgType.ItemIndex = 1);
        amount := StrToInt(Main.edtAmount.Text);
        category := Main.cmbCategory.Text;
        comment := Main.edtComment.Text;
        dateIn := Now;
    end;

    procedure clearTransVals();
    begin

      Main.rgTransaction.ItemIndex := 0;
      Main.rgType.ItemIndex := 0;
      Main.edtAmount.Text := '';
      Main.cmbCategory.ItemIndex := 0;
      Main.edtComment.Text := '';

    end;
{$endregion}

  Function addToDB(isDeposit : Boolean; isCard : Boolean;
                    category : String; amount : Integer;
                    comment : String; dateIn : TDateTime) : Boolean;
  var
    sQuery : String;
  begin

    sQuery := 'INSERT INTO Transactions (isDeposit,isCard,' +
             'Category, Amount, Comment, DateIn) VALUES(' +
              isDeposit.ToString + ',' + isCard.ToString + ',' +
              QuotedStr(category) + ',' + amount.ToString + ',' +
              QuotedStr(comment) + ',' + QuotedStr(DateToStr(dateIn)) + ')';

    with dmMain.adoQuery do
    begin
       SQL.Clear;
       SQL.Add(sQuery);
       Result := ExecSQL = 1;
    end;


  end;

{$endregion}

{$region 'Plans'}

  procedure savePlans();
  var
    tf : TextFile;
  begin
    if not FileExists(fileName) then
    begin
      FileCreate(fileName);
    end;

    AssignFile(tf,fileName);

    Reset(tf);
    Rewrite(tf);
    Reset(tf);

    CloseFile(tf);

    Main.memPlans.Lines.SaveToFile(fileName);
  end;

  procedure loadPlans();
  var
    tf : TextFile;
    sTemp : String;
  begin
    if not FileExists(fileName) then
    begin
      FileCreate(fileName);
    end;

    AssignFile(tf,fileName);
    Reset(tf);

    while not eof(tf) do
    begin
      Readln(tf,sTemp);
      Main.memPlans.Lines.Add(sTemp);
    end;

    CloseFile(tf);

  end;

{$endregion}

procedure TMain.btnAddClick(Sender: TObject);
var
  isDepost, isCard : Boolean;
  amount : Integer;
  category, comment : String;
  dateIn : TDateTime;
begin

  try
    getTransVals(isDepost,isCard,category,amount,comment,dateIn);
  except
    ShowMessage('Failed to get values from user input');
  end;

  try

    if (isDepost = True) then
    begin
      category := '';
    end;

    if addToDB(isDepost,isCard,category,amount,comment,dateIn) then
    begin
      ShowMessage('Added :)');
    end
    else
    begin
        ShowMessage('Failed :/');
    end;
  except
    ShowMessage('Failed to Add to Database');
  end;

  clearTransVals();

end;

procedure TMain.btnSaveClick(Sender: TObject);
begin
  savePlans();
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  loadPlans();
end;

{$region 'Main Menu'}

procedure TMain.CloseMenuClick(Sender: TObject);
  begin
    Application.MainForm.Close;
    Application.Terminate;
    Exit;
  end;

procedure TMain.DatabaseMenuClick(Sender: TObject);
  begin
    Helper_U.ShowForm(Self, Database_U.DatabaseForm);
  end;

procedure TMain.GraphMenuClick(Sender: TObject);
  begin
    Helper_U.ShowForm(Self, Graphs_U.GraphForm);
  end;

procedure TMain.TransactionMenuClick(Sender: TObject);
  begin
    Helper_U.ShowForm(Self, Main_U.Main);
  end;
{$endregion}
end.
