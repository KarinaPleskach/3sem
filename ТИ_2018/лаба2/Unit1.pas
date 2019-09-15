unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, jpeg, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    edtName: TEdit;
    btnFileOpen: TBitBtn;
    dlgOpendlg4: TOpenDialog;
    edtkey: TEdit;
    img1: TImage;
    lbl2: TLabel;
    lbl1: TLabel;
    mmotest: TMemo;
    btnen: TButton;
    btnde: TButton;
    mm1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    lbl3: TLabel;
    mmofile: TMemo;
    mmotext: TMemo;
    lbl4: TLabel;
    procedure btnOpenFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtkeyChange(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure btnenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3;

{$R *.dfm}

type
  mass = array[1..26] of byte;

var
  FName, OutputLine, keyline: string;
  InputFile: file;
  OutputFile: Text;
  x: Byte;
  number: Integer;
  bool: Boolean;
  key: mass;

function ByteToStrBits(x: byte): string;
var
  i: Integer;
begin
  result:= '';
  for i:= 1 to 8 do
  begin
    if x mod 2 = 0 then
      result:= '0' + Result
    else
      result:= '1' + Result;
    x:= x div 2;
  end;
end;

function strtobits(keyline: string): Byte;
begin
  Result := 0;
  Result := 128*(StrToInt(keyline[1])) + 64*(StrToInt(keyline[2])) + 32*(StrToInt(keyline[3])) + 16*(StrToInt(keyline[4])) + 8*(StrToInt(keyline[5])) + 4*(StrToInt(keyline[6])) + 2*(StrToInt(keyline[7])) + 1*(StrToInt(keyline[8]));
end;

procedure TForm1.btnOpenFileClick(Sender: TObject);
begin
  if dlgOpendlg4.Execute then
      begin
          mmotest.Text := '';
          mmofile.Text := '';
          mmotext.Text := '';
          FName := dlgOpendlg4.FileName;
          edtName.Text := FName;
          keyline := '';
      end;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  mmotest.Text := '';
  mmofile.Text := '';
  mmotext.Text := '';
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  edtKey.setfocus;
  mmotest.Text := '';
  mmofile.Text := '';
  mmotext.Text := '';
end;

procedure TForm1.edtkeyChange(Sender: TObject);
var i, j, k: Integer;                                            
var dop: string;
begin
  i := Length(edtkey.Text);
  if i = 0 then
    bool := false
  else
  if i = 26 then
  begin
     if ((edtkey.Text[i] = '1') or (edtkey.Text[i] = '0')) then
       bool := True
     else
     begin
       bool := False;
       dop := edtkey.Text;
       edtkey.Text := '';
       for j := 1 to (i - 1) do
         edtkey.Text := edtkey.Text + dop[j];
       edtkey.SelStart := Length(edtkey.Text);
     end;
  end
  else
  if i > 26 then
  begin
    dop := edtkey.Text;
    edtkey.Text := '';
    for j := 1 to (i - 1) do
      edtkey.Text := edtkey.Text + dop[j];
    edtkey.SelStart := Length(edtkey.Text);
  end
  else
  begin
    bool := False;
    for k := 1 to i do
    begin
      if ((edtkey.Text[k] = '1') or (edtkey.Text[k] = '0')) then
      else
      begin
        dop := edtkey.Text;
        edtkey.Text := '';
        for j := 1 to (k - 1) do
          edtkey.Text := edtkey.Text + dop[j];
        for j := (k + 1) to i do
          edtkey.Text := edtkey.Text + dop[j];
        edtkey.SelStart := Length(edtkey.Text);
      end;
    end;
  end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  WinExec('calc.exe', SW_SHOWNORMAL);
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  form3.show;
  form1.hide;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  form2.show;
  form1.Hide;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  form2.show;
  form1.Hide;
end;

procedure keylinecreate(number: Integer; var keyline: string; var key: mass; var mmotest: TMemo);
var i, j, keyxor: Integer;
begin
  keyline := '';
  for i := 1 to 8 do
  begin
    keyline := keyline + IntToStr(Key[1]);
    keyxor := key[1] xor key[19] xor key[20] xor key[26];
    for j := 2 to 26 do
    begin
      key[j-1] := KEY[j];
    end;
    key[26] := keyxor;
  end;
  if (number >= 1) and (number < 15) then
    mmotest.text := mmotest.text + keyline + ' ';
end;

procedure TForm1.btnenClick(Sender: TObject);
var i: Integer;
var keybyte, resline: byte;
var resstr, realline: string;
begin
  number := 0;
  mmotest.Text := '';
  mmofile.Text := '';
  mmotext.Text := '';
  OutputLine := '';
  realline := '';
  if not bool then
  begin
    ShowMessage('Ключ введен неправильно, попробуйте снова');
    edtkey.Text := '';
    edtkey.SetFocus;
  end
  else
  begin
  if fname = '' then
  begin
    ShowMessage('Выберите исходный файл');
  end
  else
  begin
  if bool then
  begin
    for i := 1 to 26 do
    begin
      key[i] := StrToInt(edtkey.Text[i]);
    end;
    AssignFile(InputFile, FName);
    Reset(InputFile, 1);
    while (not Eof(InputFile)) do
    begin
      number := number + 1;
      keylinecreate(number, keyline, key, mmotest);
      keybyte := strtobits(keyline);
      BlockRead(InputFile, x, 1);
      resline := x xor keybyte;
      outputline := OutputLine + Char(resline);
      if (number >= 1) and (number < 15) then
      begin
        mmofile.text := mmofile.text + ByteToStrBits(resline) + ' ';
        realline := realline + ByteToStrBits(x) + ' ';
      end;
    end;
    if number >= 15 then
    begin
      mmotest.Text := mmotest.Text + '-------> ' + keyline;
      mmofile.Text := mmofile.Text + '-------> ' + ByteToStrBits(resline);
      realline := realline + '-------> ' + ByteToStrBits(x);
    end;
    mmotext.Text := realline;
    CloseFile(InputFile);
    Insert('_шифр', FName, (Length(FName)-3));
    AssignFile(outputfile, FName);
    Rewrite(outputfile);
    for i := 1 to Length(outputLine) do
      Write(Outputfile, outputline[i]);
    CloseFile(outputfile);
    ShowMessage('Результат работы был записан в: ' + FName);
    FName := '';
    edtName.Text := '<---Выберите исходный файл';
  end;
  end;
  end;
end;

end.
