unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    img1: TImage;
    imgman: TImage;
    imggreen: TImage;
    imggreenman: TImage;
    imgalient: TImage;
    imgalient2: TImage;
    tmr: TTimer;
    procedure FormShow(Sender: TObject);
    procedure tmrTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit1, Unit9, Unit4, Unit3;
{$R *.dfm}



procedure TForm1.FormShow(Sender: TObject);
var i, j: Integer;
begin
if start = 0 then
  begin
    start := 1;
    imgman.Left := 294;
    imgman.Top := 295;
  end{
else
  begin
    j := (imgman.Left - 88) div 66;
    i := (imgman.Top - 80) div 66;
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  end};
FielD1[3, 3] := empty;
i := 0;
for j := 0 to 2 do
  field1[i, j] := empty;
field1[i, 3] := green;
for j := 4 to 6 do
  field1[i, j] := empty;
i := 1;
for j := 0 to 6 do
  field1[i, j] := empty;
i := 2;
for j := 0 to 5 do
  field1[i, j] := empty;
field1[i, 6] := alient;
i := 3;
for j := 0 to 2 do
  field1[i, j] := empty;
for j := 4 to 5 do
  field1[i, j] := empty;
field1[i, 6] := right;
i := 4;
field1[i, 0] := alient;
for j := 1 to 6 do
  field1[i, j] := empty;
for i := 5 to 6 do
  for j := 0 to 6 do
    field1[i, j] := empty;
imgalient.Left := 96;
imgalient.Top := 361;
imgalient2.Left := 492;
imgalient2.Top := 229;
end;

procedure TForm1.tmrTimer(Sender: TObject);
var i, j, a, b: Integer;
begin
  j := (imgalient.Left - 96) div 66;
    i := (imgalient.Top - 97) div 66;
    if true then
  begin
    b := (imgman.Left - 96) div 66;
    a := (imgman.Top - 97) div 66;
    if (a = i) and (b = j) then
    begin
      form9.Show;
      Form1.Hide;
    end;

    j := (imgalient2.Left - 96) div 66;
    i := (imgalient2.Top - 97) div 66;
    b := (imgman.Left - 96) div 66;
    a := (imgman.Top - 97) div 66;
    if (a = i) and (b = j) then
    begin
      form9.Show;
      Form1.Hide;
    end;
  end;
  j := (imgalient.Left - 96) div 66;
    i := (imgalient.Top - 97) div 66;
if (j = 4) then
  begin
    field1[i, j] := empty;
    field1[1, 5] := alient;
    imgalient.Left := 426;
    imgalient.Top := 163;
  end
  else
  begin
    if (j = 5) then
    begin
      field1[i, j] := empty;
      field1[4, 0] := alient;
      imgalient.Left := 96;
      imgalient.Top := 361;
    end
    else
    begin
    j := (imgalient.Left - 96) div 66;
    i := (imgalient.Top - 97) div 66;
    field1[i, j] := empty;
    field1[i - 1, j + 1] := alient;
    imgalient.Left := imgalient.Left + 66;
    imgalient.top := imgalient.top - 66;
    end;
  end;
  j := (imgalient2.Left - 96) div 66;
  i := (imgalient2.Top - 97) div 66;
if (j = 2) then
  begin
    field1[i, j] := empty;
    field1[5, 1] := alient;
    imgalient2.Left := 162;
    imgalient2.Top := 427;
  end
  else
  begin
    if (j = 1) then
    begin
      field1[i, j]:= empty;
      Field1[2, 6] := alient;
      imgalient2.Left := 492;
      imgalient2.Top := 229;
    end
    else
    begin
    field1[i, j] := empty;
    field1[i + 1, j - 1] := alient;
    imgalient2.Left := imgalient2.Left - 66;
    imgalient2.Top := imgalient2.Top + 66;
    end;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  imgalient.Left := 96;
  imgalient.Top := 361;
  imgalient2.Left := 492;
  imgalient2.Top := 229;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var i, j, a, b: Integer;
begin
  if imgman.Left < 600 then
  begin
  j := (imgman.Left - 96) div 66;
  i := (imgman.Top - 97) div 66;

  if (Key = 27) then
  begin
    imggreen.Left := 492;
    imggreen.Top := 295;
  end;

  if (Key = 39) then
  begin
    if j = 6 then
    else
    begin
    if (field1[i, j+1] = alient) then
    begin
      form9.Show;
      Form1.Hide;
    end;
    if ((field1[i, j+1] = green) or (field1[i, j+1] = right)) then
    begin
      imggreenman.left := imgman.Left + 66;
      imggreenman.Top := imgman.Top;
      imgman.Left := 1000;
    end
    else
    begin
      imgman.Left := imgman.Left + 66;
    end;
    end;
  end;

  if (Key = 37) then
  begin
    if j = 0 then
    else
    begin
    if (field1[i, j-1] = alient) then
    begin
      form9.Show;
      Form1.Hide;
    end;
    if ((field1[i, j-1] = green) or (field1[i, j-1] = right)) then
    begin
      imggreenman.left := imgman.Left - 66;
      imggreenman.Top := imgman.Top;
      imgman.Left := 1000;
    end
    else
    begin
      imgman.Left := imgman.Left - 66;
    end;
    end;
  end;

  if (Key = 38) then
  begin
    if i = 0 then
    else
    begin
    if (field1[i-1, j] = alient) then
    begin
      form9.Show;
      Form1.Hide;
    end;
    if ((field1[i-1, j] = green) or (field1[i-1, j] = right)) then
    begin
      imggreenman.left := imgman.Left;
      imggreenman.Top := imgman.Top - 66;
      imgman.Left := 1000;
    end
    else
    begin
      imgman.top := imgman.top - 66;
    end;
    end;
  end;

  if (Key = 40) then
  begin
    if i = 6 then
    else
    begin
    if (field1[i+1, j] = alient) then
    begin
      form9.Show;
      Form1.Hide;
    end;
    if ((field1[i+1, j] = green) or (field1[i+1, j] = right)) then
    begin
      imggreenman.left := imgman.Left;
      imggreenman.Top := imgman.Top + 66;
      imgman.Left := 1000;
    end
    else
    begin
      imgman.top := imgman.top + 66;
    end;
    end;
  end;
  end
  else
  begin
  j := (imggreenman.Left - 96) div 66;
  i := (imggreenman.Top - 97) div 66;

  if (Key = 27) then
  begin
    if (i = 3) and (j = 6) then
    else
      begin
        imggreen.left := 492;
        imggreen.Top := 295;
      end;
  end;

  if (Key = 39) then
  begin
    if j = 6 then
    else
    begin
    if (field1[i, j+1] = alient) then
    begin
      form9.Show;
      Form1.Hide;
    end
    else
    begin
      imgman.Top := imggreenman.Top;
      imgman.Left := imggreenman.Left + 66;
      imggreenman.Left := 1000;
    end;
    end;
  end;

  if (Key = 37) then
  begin
    if j = 0 then
    else
    begin
    if (field1[i, j-1] = alient) then
    begin
      form9.Show;
      Form1.Hide;
    end
    else
    begin
      imgman.Top := imggreenman.Top;
      imgman.Left := imggreenman.Left - 66;
      imggreenman.Left := 1000;
    end;
    end;
  end;
  if (Key = 38) then
  begin
    if i = 0 then
    else
    begin
    if (field1[i-1, j] = alient) then
    begin
      form9.Show;
      Form1.Hide;
    end
    else
    begin
      imgman.Top := imggreenman.Top-66;
      imgman.Left := imggreenman.Left;
      imggreenman.Left := 1000;
    end;
    end;
  end;

  if (Key = 40) then
  begin
    if i = 6 then
    else
    begin
    if (field1[i+1, j] = alient) then
    begin
      form9.Show;
      Form1.Hide;
    end
    else
    begin
      imgman.Top := imggreenman.Top+66;
      imgman.Left := imggreenman.Left;
      imggreenman.Left := 1000;
    end;
    end;
  end;

  if (Key = 13) then
  begin
    if i = 0 then
    begin
      form3.imggreenman.Left := 294;
      form3.imggreenman.top := 493;
      form3.show;
      form1.Hide;
      imggreen.Left := 1000;
    end
    else
    begin
      form2.imggreenman.Left := 96;
      form2.imggreenman.top := 295;
      form2.show;
      form1.Hide;
      imggreen.Left := 1000;
    end;
  end;
  end;

end;

end.
