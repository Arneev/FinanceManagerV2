unit Graphs_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Helper_U, VclTee.TeeGDIPlus,
  Vcl.StdCtrls, VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart, DateUtils, Vcl.ExtCtrls, dmMain_U,
  VCLTee.Series;

type
  TGraphForm = class(TForm)
    MainMenu2: TMainMenu;
    TransactionMenu: TMenuItem;
    GraphMenu: TMenuItem;
    DatabaseMenu: TMenuItem;
    CloseMenu: TMenuItem;
    pnlSort: TPanel;
    pnlGraph: TPanel;
    pnlStats: TPanel;
    tcMain: TChart;
    lblSortBy: TLabel;
    cmbSort: TComboBox;
    lblShow: TLabel;
    cmbShow: TComboBox;
    lblForm: TLabel;
    cmbForm: TComboBox;
    btnDisplay: TButton;
    lblStatHeading: TLabel;
    lblTotMoney: TLabel;
    lblTotCash: TLabel;
    lblTotCard: TLabel;
    lblTotGain: TLabel;
    lblTotSpent: TLabel;
    Series1: TBarSeries;
    Series2: TPieSeries;
    procedure TransactionMenuClick(Sender: TObject);
    procedure GraphMenuClick(Sender: TObject);
    procedure DatabaseMenuClick(Sender: TObject);
    procedure CloseMenuClick(Sender: TObject);
    procedure btnDisplayClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GraphForm: TGraphForm;

implementation
  uses Main_U, Database_U, DataHolder_U;

{$R *.dfm}

{$region 'Functions Display'}

procedure getStatCompos(var lblTotMoney, lblTotCash,
                        lblTotCard, lblTotGain,
                        lblTotSpent : TLabel);
  begin

    lblTotMoney := GraphForm.lblTotMoney;
    lblTotCash := GraphForm.lblTotCash;
    lblTotCard := GraphForm.lblTotCard;
    lblTotGain := GraphForm.lblTotGain;
    lblTotSpent := GraphForm.lblTotSpent;

  end;

Function getSQLData(sQuery : String) : TArray<DataHolder>;
var
  dhArr : TArray<DataHolder>;
  i : Integer;

  isDeposit, isCard : Boolean;
  Category, Comment : String;
  Amount : Integer;
begin

  with dmMain_U.dmMain do
  begin
    
    adoQuery.Active := False;
    adoQuery.SQL.Clear;
    adoQuery.SQL.Text := sQuery;    

    try
      adoQuery.Active := True;
    except
      ShowMessage('Query failed with : ' + (sQuery));
    end;

    adoQuery.First;

    while (not adoQuery.Eof) do
    begin

      isDeposit := adoQuery['isDeposit'];
      isCard := adoQuery['isCard'];
      Category := adoQuery['Category'];
      Amount := adoQuery['Amount'];
      Comment := adoQuery['Comment'];

      dhArr := dhArr + [DataHolder.Create(isDeposit,
       isCard, Category, Comment, Amount)];

       adoQuery.Next;
    end;

    Result := dhArr;

  end;




end;

Function countTotMoney(dhArr : TArray<DataHolder>) : Integer;
var
  size, i, iCount: Integer;
begin

  size := Length(dhArr);
  iCount := 0;

  for i := 0 to size - 1 do
  begin
    if (dhArr[i].isDeposit = True) then
    begin
      iCount := iCount + dhArr[i].Amount;
    end
    else
    begin
      iCount := iCount - dhArr[i].Amount;
    end;
  end;

  Result := iCount;

end;

Function countTotCard(dhArr : TArray<DataHolder>) : Integer;
var
  size, i, iCount: Integer;
begin

  size := Length(dhArr);
  iCount := 0;

  for i := 0 to size - 1 do
  begin
  
    if (dhArr[i].isCard = True) then
    begin
      if (dhArr[i].isDeposit = True ) then
      begin
        iCount := iCount + dhArr[i].Amount;
      end
      else
      begin
        iCount := iCount - dhArr[i].Amount;
      end;
    end;
    
  end;

  Result := iCount;

end;

Function countTotCash(dhArr : TArray<DataHolder>) : Integer;
begin

  Result := countTotMoney(dhArr) - countTotCard(dhArr);

end;

Function countCategory(dhArr : TArray<DataHolder>) : TArray<Integer>;
var
  size, i: Integer;
  catTot : TArray<Integer>;
begin

  SetLength(catTot, 9);
  size := Length(dhArr);

  for i := 0 to 8 do
  begin
    catTot[i] := 0;
  end;

  for i := 0 to size - 1 do
  begin

    if (dhArr[i].Category = 'Food') then
    begin
      catTot[0] := catTot[0] + dhArr[i].Amount;
    end

    else if (dhArr[i].Category = 'Travel') then
    begin
      catTot[1] := catTot[1] + dhArr[i].Amount;
    end

    else if (dhArr[i].Category = 'Entertainment') then
    begin
      catTot[2] := catTot[2] + dhArr[i].Amount;
    end

    else if (dhArr[i].Category = 'Savings') then
    begin
      catTot[3] := catTot[3] + dhArr[i].Amount;
    end

    else if (dhArr[i].Category = 'Health') then
    begin
      catTot[4] := catTot[4] + dhArr[i].Amount;
    end

    else if (dhArr[i].Category = 'Education') then
    begin
      catTot[5] := catTot[5] + dhArr[i].Amount;
    end

    else if (dhArr[i].Category = 'Fashion') then
    begin
      catTot[6] := catTot[6] + dhArr[i].Amount;
    end

    else if (dhArr[i].Category = 'Gift') then
    begin
      catTot[7] := catTot[7] + dhArr[i].Amount;
    end

    else if (dhArr[i].Category = 'Other') then
    begin
      catTot[8] := catTot[8] + dhArr[i].Amount;
    end;
         
    
  end;

  Result := catTot;
    
end;

Function countTotSpent(dhArr : TArray<DataHolder>) : Integer;
var
  size, i, iCount: Integer;
begin

  size := Length(dhArr);
  iCount := 0;

  for i := 0 to size - 1 do
  begin
    if (dhArr[i].isDeposit = False) then
    begin
      iCount := iCount + dhArr[i].Amount;
    end;
  end;

  Result := iCount;

end;

Function countTotSpentCard(dhArr : TArray<DataHolder>) : Integer;
var
  size, i, iCount: Integer;
begin

  size := Length(dhArr);
  iCount := 0;

  for i := 0 to size - 1 do
  begin
  
    if (dhArr[i].isCard = True) then
    begin
      if (dhArr[i].isDeposit = False ) then
      begin
        iCount := iCount + dhArr[i].Amount;
      end;
    end;
    
  end;

  Result := iCount;

end;

Function countTotSpentCash(dhArr : TArray<DataHolder>) : Integer;
begin

  Result := countTotSpent(dhArr) - countTotSpentCard(dhArr);

end;

Function countTotGain(dhArr : TArray<DataHolder>) : Integer;
var
  size, i, iCount: Integer;
begin

  size := Length(dhArr);
  iCount := 0;

  for i := 0 to size - 1 do
  begin
    if (dhArr[i].isDeposit = True) then
    begin
      iCount := iCount + dhArr[i].Amount;
    end;
  end;

  Result := iCount;

end;

Function countTotGainCard(dhArr : TArray<DataHolder>) : Integer;
var
  size, i, iCount: Integer;
begin

  size := Length(dhArr);
  iCount := 0;

  for i := 0 to size - 1 do
  begin
  
    if (dhArr[i].isCard = True) then
    begin
      if (dhArr[i].isDeposit = True ) then
      begin
        iCount := iCount + dhArr[i].Amount;
      end;
    end;
    
  end;

  Result := iCount;

end;

Function countTotGainCash(dhArr : TArray<DataHolder>) : Integer;
begin

  Result := countTotGain(dhArr) - countTotGainCard(dhArr);

end;


{$endregion}

{$region 'General Stats Sort'}
procedure sortOutGeneralStats();
var 
  dhArr : TArray<DataHolder>;

  lblTotMoney, lblTotCash,
  lblTotCard, lblTotGain,
  lblTotSpent : TLabel;

  totMoney, totCard, totCash,
  totGainMonth, totSpentMonth : Integer;

  toUseDate : TDate;
begin

  getStatCompos(lblTotMoney, lblTotCash,
                lblTotCard, lblTotGain,
                lblTotSpent);

  dhArr := getSQLData('SELECT * FROM Transactions');

  totMoney := countTotMoney(dhArr);
  totCard := countTotCard(dhArr);
  totCash := totMoney - totCard;

  toUseDate := IncMonth(Date(), -1);

  dhArr := getSQLData('SELECT * FROM Transactions ' +
   'WHERE DateIn >= ' + ('#' + DateToStr(toUseDate) + '#'));

  totGainMonth := countTotGain(dhArr);
  totSpentMonth :=  countTotSpent(dhArr);

  lblTotMoney.Caption := 'Total Money is R' + IntToStr(totMoney);
  lblTotCash.Caption := 'Total Cash is R' + IntToStr(totCash);
  lblTotCard.Caption := 'Total Card is R' + IntToStr(totCard);
  lblTotGain.Caption := 'Total Money Gain this Month is R' + IntToStr(totGainMonth);
  lblTotSpent.Caption := 'Total Money Spent this Month is R' + IntToStr(totSpentMonth);

end;
{$endregion}

//Display OnClick
procedure TGraphForm.btnDisplayClick(Sender: TObject);
var
 category : TArray<Integer>;
 dhArr : TArray<DataHolder>;
 totCard, totCash, timePos, totSpent, totHave : Integer;
 isCat, isPercent : Boolean;
 sQuery : String;
 toUseDate : TDate;
begin

  timePos := cmbSort.ItemIndex;
  isCat := cmbShow.ItemIndex = 1;
  isPercent := cmbForm.ItemIndex = 0;

  sQuery := 'SELECT * FROM Transactions WHERE ';

  if (timePos = 0) then
  begin
    toUseDate := IncDay(Date(), -1);
    sQuery := sQuery +'DateIn >= #' +
               DateToStr(toUseDate) + '#';
  end

  else if (timePos = 1) then
  begin
    toUseDate := IncMonth(Date(), -1);
    sQuery := sQuery +'DateIn >= #'
              + DateToStr(toUseDate) + '#';
  end

  else if (timePos = 2) then
  begin
    toUseDate := IncYear(Date(), -1);
    sQuery := sQuery + 'DateIn >= #'
             + DateToStr(toUseDate) + '#';
  end

  else
  begin
    sQuery := sQuery + '1=1';
  end;

  dhArr := getSQLData(sQuery);

  category := countCategory(dhArr);
  totCard := countTotCard(dhArr);
  totCash := countTotCash(dhArr);

  tcMain.Series[0].Visible := not isPercent;
  tcMain.Series[1].Visible := isPercent;

  tcMain.Series[0].Clear;
  tcMain.Series[1].Clear;

  if (isCat) then
  begin

    tcMain.BottomAxis.Title.Text := 'Category';
    tcMain.LeftAxis.Title.Text := 'Amount (Spent)';
    tcMain.Title.Caption := 'Amount Spent per Category';

      totSpent := countTotSpent(dhArr);

      if (isPercent = True) then
      begin
      //value , label , colour
        tcMain.Series[1].Add((category[0]*100)/totSpent, 'Food');
        tcMain.Series[1].Add((category[1]*100)/totSpent, 'Travel');
        tcMain.Series[1].Add((category[2]*100)/totSpent, 'Entertainment');
        tcMain.Series[1].Add((category[3]*100)/totSpent, 'Savings');
        tcMain.Series[1].Add((category[4]*100)/totSpent, 'Health');
        tcMain.Series[1].Add((category[5]*100)/totSpent, 'Education');
        tcMain.Series[1].Add((category[6]*100)/totSpent, 'Fashion');
        tcMain.Series[1].Add((category[7]*100)/totSpent, 'Gift');
        tcMain.Series[1].Add((category[8]*100)/totSpent, 'Other');
      end
      else
      begin
        tcMain.Series[0].Add(category[0], 'Food');
        tcMain.Series[0].Add(category[1], 'Travel');
        tcMain.Series[0].Add(category[2], 'Entertainment');
        tcMain.Series[0].Add(category[3], 'Savings');
        tcMain.Series[0].Add(category[4], 'Health');
        tcMain.Series[0].Add(category[5], 'Education');
        tcMain.Series[0].Add(category[6], 'Fashion');
        tcMain.Series[0].Add(category[7], 'Gift');
        tcMain.Series[0].Add(category[8], 'Other');
      end;


  end
  else
  begin

    tcMain.BottomAxis.Title.Text := 'Form of Money';
    tcMain.LeftAxis.Title.Text := 'Amount (Total)';
    tcMain.Title.Caption := 'Cards vs Cash Amount';

      totHave := totCash + totCard;

      if (isPercent = True) then
      begin
      //value , label , colour
        tcMain.Series[1].Add((totCash*100)/totHave, 'Cash');
        tcMain.Series[1].Add((totCard*100)/totHave, 'Card');
      end
      else
      begin
        tcMain.Series[0].Add(totCash, 'Cash');
        tcMain.Series[0].Add(totCard, 'Card');
      end;


  end;


end;


//Form Show
procedure TGraphForm.FormShow(Sender: TObject);
begin
  sortOutGeneralStats();
end;

{$region 'Main Menu'}

procedure TGraphForm.CloseMenuClick(Sender: TObject);
  begin
    Application.MainForm.Close;
    Application.Terminate;
    Exit;
  end;

  procedure TGraphForm.DatabaseMenuClick(Sender: TObject);
  begin
    Helper_U.ShowForm(Self, Database_U.DatabaseForm);
  end;




procedure TGraphForm.GraphMenuClick(Sender: TObject);
  begin
    Helper_U.ShowForm(Self, Graphs_U.GraphForm);
  end;

  procedure TGraphForm.TransactionMenuClick(Sender: TObject);
  begin
    Helper_U.ShowForm(Self, Main_U.Main);
  end;
{$endregion}

end.
