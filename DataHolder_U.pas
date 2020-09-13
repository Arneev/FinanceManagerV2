unit DataHolder_U;

interface

type
  DataHolder = class
    public
      isDeposit, isCard : Boolean;
      Category, Comment : String;
      Amount : Integer;

      constructor Create(_isDeposit,
       _isCard : Boolean; _Category,
        _Comment : String; _Amount : Integer);
  end;

implementation

constructor DataHolder.Create(_isDeposit,
       _isCard : Boolean; _Category,
        _Comment : String; _Amount : Integer);
begin
  isDeposit := _isDeposit;
  isCard := _isCard;
  Category := _Category;
  Comment := _Comment;
  Amount := _Amount;
end;

end.
