unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Spin, Menus, ExtCtrls, Math;

const
  n = 9;

type
  Tmatr = array[0..n, 0..n] of Integer;
  TForm1 = class(TForm)
    Enter: TStringGrid;
    menu: TMainMenu;
    File1: TMenuItem;
    Open: TMenuItem;
    Save: TMenuItem;
    Save_as: TMenuItem;
    Clear: TMenuItem;
    Run: TMenuItem;
    Exit: TMenuItem;
    Open_Dialog: TOpenDialog;
    Save_Dialog: TSaveDialog;
    chkAutomatic: TCheckBox;
    procedure OpenClick(Sender: TObject);
    procedure LoToSG(name : string);
    procedure SaveClick(Sender: TObject);
    procedure Save_asClick(Sender: TObject);
    procedure SaveMatr(name : String);
    procedure ClearClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure RunClick(Sender: TObject);
    procedure chkAutomaticClick(Sender: TObject);
    procedure Randomise();
  end;

var
  Form1: TForm1;
  File_Name : string;
  matr : Tmatr;

implementation

{$R *.dfm}

procedure TForm1.OpenClick(Sender: TObject);
begin
  if Open_Dialog.Execute then
    begin
      File_Name := Open_Dialog.FileName;
      LoToSG(File_Name);
    end;
end;

procedure TForm1.LoToSG(name : string);
var
  f : TextFile;
  i, j, value: Integer;
begin
  AssignFile(F, name);
  Reset(F);
  for i := 0 to n do
    for j := 0 to n do
      begin
        Readln(F, value);
        Enter.Cells[j, i] := FloatToStr(value)
      end;
  CloseFile(F);
end;

procedure TForm1.SaveClick(Sender: TObject);
begin
  if File_Name <> ''
    then SaveMatr(File_Name)
    else Save_as.Click;
end;

procedure TForm1.SaveMatr(name : String);
var
  i, j, element : Integer;
  F : TextFile;
begin
  AssignFile(F, name);
  Rewrite(F);
  for i := 0 to n do
    for j := 0 to n do
      begin
        element := matr[i, j];
        Writeln(F, element);
      end;
  CloseFile(F);
end;

procedure TForm1.Save_asClick(Sender: TObject);
begin
  if Save_Dialog.Execute then
    begin
      SaveMatr(Save_Dialog.FileName);
      File_Name := Save_Dialog.FileName;
    end;
end;

procedure TForm1.ClearClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to n do
    Enter.Rows[i].Clear;
  File_Name := '';
end;

procedure TForm1.ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.RunClick(Sender: TObject);
var
  i, j: Integer;
  MappingCols, MappingRows, temp: Tmatr;
begin
  for i := 0 to n do
    for j := 0 to n do
      if Enter.Cells[j, i] <> ''
        then matr[i, j] := StrToInt(Enter.Cells[j, i])
        else matr[i, j] := 0;

  for i := 0 to n do
    for j := 0 to n do
      MappingRows[i, j] := j;

  for i := 0 to n do
    for j := 0 to n do
      MappingCols[i, j] := i;

  for i := 0 to n do
    for j := 0 to n do
      temp[i, j] := matr[MappingRows[i, j], MappingCols[i, j]];

  matr := temp;

  for i := 0 to n do
    for j := 0 to n do
      Enter.Cells[j, i] := IntToStr(matr[i, j]);
end;

procedure TForm1.Randomise();
var
  i, j : Integer;
begin
  for i := 0 to n do
    for j := 0 to n do
      Enter.Cells[j, i] := IntToStr(Random(1000)-500);
end;

procedure TForm1.chkAutomaticClick(Sender: TObject);
begin
  if chkAutomatic.Checked
    then Randomise()
    else Clear.Click;
end;

end.
