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
    img1: TImage;
    lbl2: TLabel;
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
    lbl1: TLabel;
    lbl5: TLabel;
    edtKeyp: TEdit;
    edtKeyq: TEdit;
    lbl6: TLabel;
    edtKeyn: TEdit;
    lbl7: TLabel;
    edtKeyb: TEdit;
    imgok: TImage;
    imgokp: TImage;
    imgokq: TImage;
    imgokb: TImage;
    imgno: TImage;
    imgnoq: TImage;
    imgnop: TImage;
    imgnob: TImage;
    procedure btnOpenFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure btnenClick(Sender: TObject);
    procedure edtKeypChange(Sender: TObject);
    procedure edtKeyqChange(Sender: TObject);
    procedure edtKeybChange(Sender: TObject);
    procedure btndeClick(Sender: TObject);
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

var
  FName, OutputLine, keylinep, keylineq, keylineb, keylinen, OutputLine1, OutputLine2, OutputLine3, OutputLine4: string;
  keyq, keyp, keyb, keyn: Int64;
  InputFile: file;
  OutputFile, OutputFile1, OutputFile2, OutputFile3, OutputFile4: file;
  x: Byte;
  number, xint: Integer;
  boolp, boolq, boolb: Boolean;

procedure TForm1.btnOpenFileClick(Sender: TObject);
begin
  if dlgOpendlg4.Execute then
      begin
          mmofile.Text := '';
          mmotext.Text := '';
          FName := dlgOpendlg4.FileName;
          edtName.Text := FName;
          keylinep := '';
          keylineq := '';
          keylineb := '';
          keylinen := '';
      end;
end;

function Prime(num: Integer): Boolean;
var bool: Boolean;
var i: integer;
begin
  if (num < 2) then
    bool := False
  else
    bool := True;

  for i := 2 to num do
  begin
    if (i > (num/i)) then
      Break;
    if ((num mod i) = 0) then
    begin
      bool := False;
      Break;
    end;
  end;

  Result := bool;
end;

procedure TForm1.edtKeypChange(Sender: TObject);
var i, j: Integer;
var dop: string;
begin
  i := Length(edtkeyp.Text);
  if i = 0 then
    boolp := false
  else
  if (i = 1) then
  begin
    if (edtkeyp.Text[i] in ['1'..'9']) then
       boolp := True
    else
    begin
      boolp := False;
      edtkeyp.Text := '';
    end;
  end
  else
  begin
    if (edtKeyp.Text[i] in ['0'..'9']) then
      boolp := True
    else
    begin
      dop := edtkeyp.Text;
      edtkeyp.Text := '';
      for j := 1 to (i - 1) do
        edtkeyp.Text := edtkeyp.Text + dop[j];
      edtkeyp.SelStart := Length(edtkeyp.Text);
    end;
  end;

  if boolp then
  begin
    i := StrToInt(edtKeyp.Text);
    boolp := Prime(i);
  end;

  if ((i-3)mod 4 <> 0) then
    boolp := False;

  if boolp then
    keyp := i;

  if (boolp) and (boolq) then
  begin
    edtKeyn.Text := IntToStr(keyq*keyp);
    keyn := keyq * keyp;
    if keyn >= 255 then
    begin
      imgok.left := 416;
      imgok.top := 120;
      imgno.left := 500;
    end
    else
    begin
      imgok.left := 500;
      imgno.left := 416;
      imgno.top := 120;
    end;
  end
  else
  begin
    edtKeyn.Text := '-';
     imgok.left := 500;
      imgno.left := 416;
      imgno.top := 120;
  end;

  if boolp then
  begin
    imgokp.left := 160;
    imgokp.top := 96;
    imgnop.left := 500;
  end
  else
  begin
    imgokp.left := 500;
    imgnop.left := 160;
    imgnop.top := 96;
  end;
end;

procedure TForm1.edtKeyqChange(Sender: TObject);
var i, j: Integer;
var dop: string;
begin
  i := Length(edtkeyq.Text);
  if i = 0 then
    boolq := false
  else
  if (i = 1) then
  begin
    if (edtkeyq.Text[i] in ['1'..'9']) then
       boolq := True
    else
    begin
      boolq := False;
      edtkeyq.Text := '';
    end;
  end
  else
  begin
    if (edtKeyq.Text[i] in ['0'..'9']) then
      boolq := True
    else
    begin
      dop := edtkeyq.Text;
      edtkeyq.Text := '';
      for j := 1 to (i - 1) do
        edtkeyq.Text := edtkeyq.Text + dop[j];
      edtkeyq.SelStart := Length(edtkeyq.Text);
    end;
  end;

  if boolq then
  begin
    i := StrToInt(edtKeyq.Text);
    boolq := Prime(i);
  end;

  if ((i-3)mod 4 <> 0) then
    boolq := False;

  if boolq then
    keyq := i;

  if (boolp) and (boolq) then
  begin
    edtKeyn.Text := IntToStr(keyq*keyp);
    keyn := keyq * keyp;
    if keyn >= 255 then
    begin
      imgok.left := 416;
      imgok.top := 120;
      imgno.left := 500;
    end
    else
    begin
      imgok.left := 500;
      imgno.left := 416;
      imgno.top := 120;
    end;
  end
  else
  begin
    edtKeyn.Text := '-';
     imgok.left := 500;
      imgno.left := 416;
      imgno.top := 120;
  end;

  if boolq then
  begin
    imgokq.left := 336;
    imgokq.top := 96;
    imgnoq.left := 500;
  end
  else
  begin
    imgokq.left := 500;
    imgnoq.left := 336;
    imgnoq.top := 96;
  end;
end;

procedure TForm1.edtKeybChange(Sender: TObject);
var i, j: Integer;
var dop: string;
begin
  i := Length(edtkeyb.Text);
  if i = 0 then
    boolb := false
  else
  if (i = 1) then
  begin
    if (edtkeyb.Text[i] in ['1'..'9']) then
       boolb := True
    else
    begin
      boolb := False;
      edtkeyb.Text := '';
    end;
  end
  else
  begin
    if (edtKeyb.Text[i] in ['0'..'9']) then
      boolb := True
    else
    begin
      dop := edtkeyb.Text;
      edtkeyb.Text := '';
      for j := 1 to (i - 1) do
        edtkeyb.Text := edtkeyb.Text + dop[j];
      edtkeyb.SelStart := Length(edtkeyb.Text);
    end;
  end;

  if boolb then
    keyb := StrToInt(edtKeyb.Text);

  if (boolp) and (boolq) and (boolb) then
    if keyb >= keyn then
        boolb := false;

  if boolb then
  begin
    imgokb.left := 160;
    imgokb.top := 152;
    imgnob.left := 500;
  end
  else
  begin
    imgokb.left := 500;
    imgnob.left := 160;
    imgnob.top := 152;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  mmofile.Text := '';
  mmotext.Text := '';
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  edtKeyp.setfocus;
  mmofile.Text := '';
  mmotext.Text := '';
  edtKeyn.Text := '-';
  edtKeyp.Text := '';
  edtKeyq.Text := '';
  edtKeyb.Text := '';
  boolp := False;
  boolq := False;
  boolb := False;
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

procedure TForm1.btnenClick(Sender: TObject);
var i: Integer;
var resline: integer;
var resstr, realline: string;
begin
  if keyn < 256 then
    ShowMessage('Слишком маленькое n, если код символа > n, то дешифрирование будет некорректным.');
  number := 0;
  mmofile.Text := '';
  mmotext.Text := '';
  OutputLine := '';
  realline := '';
  resstr := '';
  if not (boolp and boolq and boolb) then
  begin
    if not(boolp) then
    begin
      ShowMessage('Ключ p введен неправильно, попробуйте снова');
      edtkeyp.Text := '';
      edtkeyp.SetFocus;
    end
    else if not(boolq) then
    begin
      ShowMessage('Ключ q введен неправильно, попробуйте снова');
      edtkeyq.Text := '';
      edtkeyq.SetFocus;
    end
    else if not (boolb) then
    begin
      ShowMessage('Ключ b введен неправильно, попробуйте снова');
      edtkeyb.Text := '';
      edtkeyb.SetFocus;
    end;
  end
  else
  begin
    if fname = '' then
    begin
      ShowMessage('Выберите исходный файл');
    end
    else
    begin
      AssignFile(InputFile, FName);
      Reset(InputFile, 1);

      Insert('_шифр', FName, (Length(FName)-3));
      AssignFile(outputfile, FName);
      Rewrite(outputfile, 4);

      while (not Eof(InputFile)) do
      begin
        number := number + 1;
        BlockRead(InputFile, x, 1);
        resline := x*(x+keyb) mod keyn;

        BlockWrite(OutputFile, resline, 4);

        //outputline := OutputLine + Char(resline);
        if (number >= 1) and (number < 15) then
        begin
          resstr := resstr + IntToStr(resline) + ' ';
          realline := realline + inttostr(x) + ' ';
        end;
      end;
      if number >= 15 then
      begin
        resstr := resstr + '-------> ' + IntToStr(resline);
        realline := realline + '-------> ' + intToStr(x);
      end;
      mmotext.Text := realline;
      mmofile.Text := resstr;
      CloseFile(InputFile);
      //Insert('_шифр', FName, (Length(FName)-3));
      //AssignFile(outputfile, FName);
      //Rewrite(outputfile);
      //for i := 1 to Length(outputLine) do
      //  Write(Outputfile, outputline[i]);
      CloseFile(outputfile);
      ShowMessage('Результат работы был записан в: ' + FName);
      FName := '';
      edtName.Text := '<---Выберите исходный файл';
    end;
  end;
end;

function Power(num: integer; d: Int64): Int64;
var i: Integer;
begin
  Result := 1;
  for i := 1 to num do
    Result := Result * d;
end;

procedure evclid(a:Int64; b: Int64; var x1: int64; var y1: int64);
var d0, d1, x0, y0, d2, x2, y2: Integer;
begin
  d0 := a;
  d1 := b;
  x0 := 1;
  x1 := 0;
  y0 := 0;
  y1 := 1;
  while d1>1 do
  begin
    b := d0 div d1;
    d2 := d0 mod d1;
    x2 := x0 - b * x1;
    y2 := y0 - b * y1;
    d0 := d1;
    d1 := d2;
    x0 := x1;
    x1 := x2;
    y0 := y1;
    y1 := y2;
  end
end;

function fast_exp(a: INT64; z: INT64; n: INT64): Int64;
var a1, z1: Int64;
begin
  a1 := a;
  z1 := z;
  x := 1;
  while z1 <> 0 do
  begin
    while (z1 mod 2) = 0 do
    begin
      z1 := z1 div 2;
      a1 := (a1*a1) mod n;
    end;
    z1 := z1 -  1;
    x := (x*a1) mod n;
  end;
  Result := x;
end;

procedure TForm1.btndeClick(Sender: TObject);
var i: Integer;
 bigD, mp, mq, yp, yq: Int64;
var resline1, resline2, resline3, resline4, d1, d2, d3, d4: integer;
var resstr1, resstr2, resstr3, resstr4, realline: string;
begin
  number := 0;
  mmofile.Text := '';
  mmotext.Text := '';
  OutputLine1 := '';
  OutputLine2 := '';
  OutputLine3 := '';
  OutputLine4 := '';
  realline := '';
  resstr1 := '';
  resstr2 := '';
  resstr3 := '';
  resstr4 := '';
  if not (boolp and boolq and boolb) then
  begin
    if not(boolp) then
    begin
      ShowMessage('Ключ p введен неправильно, попробуйте снова');
      edtkeyp.Text := '';
      edtkeyp.SetFocus;
    end
    else if not(boolq) then
    begin
      ShowMessage('Ключ q введен неправильно, попробуйте снова');
      edtkeyq.Text := '';
      edtkeyq.SetFocus;
    end
    else if not (boolb) then
    begin
      ShowMessage('Ключ b введен неправильно, попробуйте снова');
      edtkeyb.Text := '';
      edtkeyb.SetFocus;
    end;
  end
  else
  begin
    if fname = '' then
    begin
      ShowMessage('Выберите исходный файл');
    end
    else
    begin
      AssignFile(InputFile, FName);
      Reset(InputFile, 4);

      i := Pos('_шифр', FName);
          if (i = 0) then
            Insert('_дешифр', FName, (Length(FName)-3))
          else
            insert('де', FName, (Length(FName)-7));
    ShowMessage('Результат работы был записан в: ' + FName);

      Insert('1', FName, (Length(FName)-3));
      AssignFile(outputfile1, FName);
      Rewrite(outputfile1, 1);
      //ShowMessage('Результат работы был записан в: ' + FName);

      FName[(Length(FName)-4)] := '2';
      AssignFile(outputfile2, FName);
      Rewrite(outputfile2, 1);
      //ShowMessage('Результат работы был записан в: ' + FName);

      FName[(Length(FName)-4)] := '3';
      AssignFile(outputfile3, FName);
      Rewrite(OutputFile3, 1);
      //ShowMessage('Результат работы был записан в: ' + FName);

      FName[(Length(FName)-4)] := '4';
      AssignFile(outputfile4, FName);
      Rewrite(OutputFile4, 1);
      //ShowMessage('Результат работы был записан в: ' + FName);

      while (not Eof(InputFile)) do
      begin
        number := number + 1;
        BlockRead(InputFile, xint, 4);
        bigD := (keyb*keyb+4*xint)mod keyn;
        //ShowMessage(IntToStr(bigD));
        mp := fast_exp(bigD, Trunc((keyp+1)/4), keyp);
        //mp := Power(Trunc((keyp+1)/4), bigD) mod keyp;
        //ShowMessage(IntToStr(Power(Trunc((keyp+1)/4), bigD)));
        //ShowMessage(IntToStr(mp));
        mq := fast_exp(bigD, Trunc((keyq+1)/4), keyq);
        //mq := Power(Trunc((keyq+1)/4), bigD) mod keyq;
        evclid(keyp, keyq, yp, yq);
        //ShowMessage(IntToStr(yp));
        //ShowMessage(IntToStr(yq));
        d1 := (yp*keyp*mq+yq*keyq*mp) mod keyn;
        if d1 < 0 then
          d1 := d1 + keyn;
        d2 := keyn - d1;
        d3 := (yp*keyp*mq-yq*keyq*mp) mod keyn;
        if d3 < 0 then
          d3 := d3 + keyn;
        d4 := keyn - d3;
        if ((d1 - keyb) mod 2) = 0 then
          begin
          resline1 := trunc(((-(keyb))+d1)/2) mod keyn;
          if resline1 < 0 then
            resline1 := resline1 + keyn;
          end
        else
          begin
          resline1 := trunc(((-(keyb))+keyn+d1)/2) mod keyn;
          if resline1 < 0 then
            resline1 := resline1 + keyn;
          end;

        if (d2 - keyb) mod 2 = 0 then
          begin
          resline2 := trunc(((-(keyb))+d2)/2) mod keyn;
          if resline2 < 0 then
            resline2 := resline2 + keyn;
          end
        else
          begin
          resline2 := trunc(((-(keyb))+keyn+d2)/2) mod keyn;
          if resline2 < 0 then
            resline2 := resline2 + keyn;
          end;

        if (d3 - keyb) mod 2 = 0 then
          begin
          resline3 := trunc(((-(keyb))+d3)/2) mod keyn;
          if resline3 < 0 then
            resline3 := resline3 + keyn;
          end
        else
          begin
          resline3 := trunc(((-(keyb))+keyn+d3)/2) mod keyn;
          if resline3 < 0 then
            resline3 := resline3 + keyn;
          end;

        if (d4 - keyb) mod 2 = 0 then
          begin
          resline4 := trunc(((-(keyb))+d4)/2) mod keyn;
          if resline4 < 0 then
            resline4 := resline4 + keyn;
          end
        else
          begin
          resline4 := trunc(((-(keyb))+keyn+d4)/2) mod keyn;
          if resline4 < 0 then
            resline4 := resline4 + keyn;
          end;

        BlockWrite(OutputFile1, Char(resline1), 1);
        BlockWrite(OutputFile2, Char(resline2), 1);
        BlockWrite(OutputFile3, char(resline3), 1);
        BlockWrite(OutputFile4, Char(resline4), 1);

//        outputline1 := OutputLine1 + Char(resline1);
//        outputline2 := OutputLine2 + Char(resline2);
//        outputline3 := OutputLine3 + Char(resline3);
//        outputline4 := OutputLine4 + Char(resline4);
        if (number >= 1) and (number < 15) then
        begin
          resstr1 := resstr1 + IntToStr(resline1) + ' ';
          resstr2 := resstr2 + IntToStr(resline2) + ' ';
          resstr3 := resstr3 + IntToStr(resline3) + ' ';
          resstr4 := resstr4 + IntToStr(resline4) + ' ';
          realline := realline + inttostr(xint) + ' ';
        end;
      end;
      if number >= 15 then
      begin
        resstr1 := resstr1 + '-------> ' + IntToStr(resline1);
        resstr2 := resstr2 + '-------> ' + IntToStr(resline2);
        resstr3 := resstr3 + '-------> ' + IntToStr(resline3);
        resstr4 := resstr4 + '-------> ' + IntToStr(resline4);
        realline := realline + '-------> ' + intToStr(xint);
      end;
      mmotext.Text := realline;
      mmofile.Text := resstr1 + ' или ' + resstr2 + ' или ' + resstr3+ ' или ' + resstr4;
      CloseFile(InputFile);
//      i := Pos('_шифр', FName);
//          if (i = 0) then
//            Insert('_дешифр', FName, (Length(FName)-3))
//          else
//            insert('де', FName, (Length(FName)-7));
//
//      Insert('1', FName, (Length(FName)-3));
//      AssignFile(outputfile, FName);
//      Rewrite(outputfile);
//      for i := 1 to Length(outputLine1) do
//        Write(Outputfile, outputline1[i]);
      CloseFile(outputfile1);
//      ShowMessage('Результат работы был записан в: ' + FName);
//
//      FName[(Length(FName)-4)] := '2';
//      AssignFile(outputfile, FName);
//      Rewrite(outputfile);
//      for i := 1 to Length(outputLine2) do
//        Write(Outputfile, outputline2[i]);
      CloseFile(outputfile2);
//      ShowMessage('Результат работы был записан в: ' + FName);
//
//      FName[(Length(FName)-4)] := '3';
//      AssignFile(outputfile, FName);
//      Rewrite(outputfile);
//      for i := 1 to Length(outputLine3) do
//        Write(Outputfile, outputline3[i]);
      CloseFile(outputfile3);
//      ShowMessage('Результат работы был записан в: ' + FName);
//
//      FName[(Length(FName)-4)] := '4';
//      AssignFile(outputfile, FName);
//      Rewrite(outputfile);
//      for i := 1 to Length(outputLine4) do
//        Write(Outputfile, outputline4[i]);
      CloseFile(outputfile4);
//      ShowMessage('Результат работы был записан в: ' + FName);


      FName := '';
      //edtKeyp.Text := '';
      //edtKeyq.Text := '';
      //edtKeyb.Text  := '';

      edtName.Text := '<---Выберите исходный файл';
    end;
  end;
end;

end.
