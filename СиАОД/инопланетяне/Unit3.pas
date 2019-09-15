unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  TForm2 = class(TForm)
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
  Form2: TForm2;

implementation
Uses Unit1, Unit9, Unit4, Unit5, Unit2, Unit10;
{$R *.dfm}

procedure TForm2.FormShow(Sender: TObject);
var i, j: Integer;
begin
if start = 0 then
  begin
    start := 1;
    imgman.Left := 294;
    imgman.Top := 295;
  end;
for i := 0 to 6 do
  for j := 0 to 6 do
    field2[i, j] := empty;
field2[0, 3] := green;
field2[3, 0] := green;
field2[6, 3] := right;
field2[1, 0] := alient;
field2[5, 0] := alient;
imgalient.Left := 96;
imgalient.Top := 163;
imgalient2.Left := 96;
imgalient2.Top := 427;
end;

procedure TForm2.tmrTimer(Sender: TObject);
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
      Form2.Hide;
    end;

    j := (imgalient2.Left - 96) div 66;
    i := (imgalient2.Top - 97) div 66;
    b := (imgman.Left - 96) div 66;
    a := (imgman.Top - 97) div 66;
    if (a = i) and (b = j) then
    begin
      form9.Show;
      Form2.Hide;
    end;
  end;
  j := (imgalient.Left - 96) div 66;
    i := (imgalient.Top - 97) div 66;
if (j = 6) then
  begin
    field2[i, j] := empty;
    field2[1, 0] := alient;
    imgalient.Left := 96;
    imgalient.Top := 163;
  end
  else
  begin
    field2[i, j] := empty;
    field2[i, j + 1] := alient;
    imgalient.Left := imgalient.Left + 66;
    imgalient.top := imgalient.top;
  end;
  j := (imgalient2.Left - 96) div 66;
  i := (imgalient2.Top - 97) div 66;
if (j = 6) then
  begin
    field2[i, j] := empty;
    field2[5, 0] := alient;
    imgalient2.Left := 96;
    imgalient2.Top := 427;
  end
  else
  begin
    field2[i, j] := empty;
    field2[i, j + 1] := alient;
    imgalient2.Left := imgalient2.Left + 66;
    imgalient2.Top := imgalient2.Top;
  end;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  imgalient.Left := 96;
  imgalient.Top := 163;
  imgalient2.Left := 96;
  imgalient2.Top := 427;
end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i, j, a, b: Integer;
begin
  if imgman.Left < 600 then
  begin
  j := (imgman.Left - 96) div 66;
  i := (imgman.Top - 97) div 66;

  if (Key = 27) then
  begin
    imggreen.Left := 294;
    imggreen.Top := 493;
  end;

  if (Key = 39) then
  begin
    if j = 6 then
    else
    begin
    if (field2[i, j+1] = alient) then
    begin
      form9.Show;
      Form2.Hide;
    end;
    if ((field2[i, j+1] = green) or (field2[i, j+1] = right)) then
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
    if (field2[i, j-1] = alient) then
    begin
      form9.Show;
      Form2.Hide;
    end;
    if ((field2[i, j-1] = green) or (field2[i, j-1] = right)) then
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
    if (field2[i-1, j] = alient) then
    begin
      form9.Show;
      Form2.Hide;
    end;
    if ((field2[i-1, j] = green) or (field2[i-1, j] = right)) then
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
    if (field2[i+1, j] = alient) then
    begin
      form9.Show;
      Form2.Hide;
    end;
    if ((field2[i+1, j] = green) or (field2[i+1, j] = right)) then
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
    if (i = 6) and (j = 3) then
    else
      begin
        imggreen.left := 294;
        imggreen.Top := 493;
      end;
  end;

  if (Key = 39) then
  begin
    if j = 6 then
    else
    begin
    if (field2[i, j+1] = alient) then
    begin
      form9.Show;
      Form2.Hide;
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
    if (field2[i, j-1] = alient) then
    begin
      form9.Show;
      Form2.Hide;
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
    if (field2[i-1, j] = alient) then
    begin
      form9.Show;
      Form2.Hide;
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
    if (field2[i+1, j] = alient) then
    begin
      form9.Show;
      Form2.Hide;
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
      form4.imggreenman.Left := 294;
      form4.imggreenman.top := 493;
      form4.show;
      form2.Hide;
      imggreen.Left := 1000;
    end
    else
    begin
      if i = 3 then
      begin
        form1.imggreenman.Left := 492;
        form1.imggreenman.top := 295;
        form1.show;
        form2.Hide;
        imggreen.Left := 1000;
      end
      else
      begin
      formend.show;
      form2.Hide;
      end;
    end;
  end;
  end;

end;

end.
