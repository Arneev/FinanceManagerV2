unit Helper_U;

interface
uses
  VCL.Forms;

  procedure ShowForm(OldForm, NewForm : TForm);

implementation

procedure ShowForm(OldForm, NewForm : TForm);
begin
  OldForm.Hide;
  NewForm.Top := OldForm.Top;
  NewForm.Left := OldForm.Left;
  NewForm.Show;
end;

Function singleQuote(str : String) : String;
begin
  Result := '' + str + '';
end;

end.
