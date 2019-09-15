unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  TForm6 = class(TForm)
    img1: TImage;
    imgman: TImage;
    imggreen: TImage;
    imggreenman: TImage;
    imgalient: TImage;
    tmr: TTimer;
    imgalient2: TImage;
    procedure tmrTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation
uses Unit1, Unit9, Unit11, Unit5, Unit6, Unit12;
{$R *.dfm}


procedure TForm6.tmrTimer(Sender: TObject);
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
      Form6.Hide;
    end;

    j := (imgalient2.Left - 96) div 66;
    i := (imgalient2.Top - 97) div 66;
    b := (imgman.Left - 96) div 66;
    a := (imgman.Top - 97) div 66;
    if (a = i) and (b = j) then
    begin
      form9.Show;
      Form6.Hide;
    end;
  end;
  j := (imgalient.Left - 96) div 66;
    i := (imgalient.Top - 97) div 66;
if (j = 4) then
  begin
    field6[i, j] := empty;
    field6[1, 5] := alient;
    imgalient.Left := 426;
    imgalient.Top := 163;
  end
  else
  begin
    if (j = 5) then
    begin
      field6[i, j] := empty;
      field6[4, 0] := alient;
      imgalient.Left := 96;
      imgalient.Top := 361;
    end
    else
    begin
    j := (imgalient.Left - 96) div 66;
    i := (imgalient.Top - 97) div 66;
    field6[i, j] := empty;
    field6[i - 1, j + 1] := alient;
    imgalient.Left := imgalient.Left + 66;
    imgalient.top := imgalient.top - 66;
    end;
  end;
  j := (imgalient2.Left - 96) div 66;
  i := (imgalient2.Top - 97) div 66;
if (j = 2) then
  begin
    field6[i, j] := empty;
    field6[5, 1] := alient;
    imgalient2.Left := 162;
    imgalient2.Top := 427;
  end
  else
  begin
    if (j = 1) then
    begin
      field6[i, j]:= empty;
      Field6[2, 6] := alient;
      imgalient2.Left := 492;
      imgalient2.Top := 229;
    end
    else
    begin
    field6[i, j] := empty;
    field6[i + 1, j - 1] := alient;
    imgalient2.Left := imgalient2.Left - 66;
    imgalient2.Top := imgalient2.Top + 66;
    end;
  end;

end;

procedure TForm6.FormShow(Sender: TObject);
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
    field6[i, j] := empty;
field6[3, 6] := green;
field6[3, 0] := green;
field6[0, 2] := right;
field6[4, 0] := alient;
field6[2, 6] := alient;
imgalient.Left := 96;
imgalient.Top := 361;
imgalient2.Left := 492;
imgalient2.Top := 229;
end;

procedure TForm6.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i, j, a, b: Integer;
begin
  if imgman.Left < 600 then
  begin
  j := (imgman.Left - 96) div 66;
  i := (imgman.Top - 97) div 66;

  if (Key = 27) then
  begin
    imggreen.Left := 228;
    imggreen.Top := 97;
  end;

  if (Key = 39) then
  begin
    if j = 6 then
    else
    begin
    if (field6[i, j+1] = alient) then
    begin
      form9.Show;
      Form6.Hide;
    end;
    if ((field6[i, j+1] = green) or (field6[i, j+1] = right)) then
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
    if (field6[i, j-1] = alient) then
    begin
      form9.Show;
      Form6.Hide;
    end;
    if ((field6[i, j-1] = green) or (field6[i, j-1] = right)) then
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
    if (field6[i-1, j] = alient) then
    begin
      form9.Show;
      Form6.Hide;
    end;
    if ((field6[i-1, j] = green) or (field6[i-1, j] = right)) then
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
    if (field6[i+1, j] = alient) then
    begin
      form9.Show;
      Form6.Hide;
    end;
    if ((field6[i+1, j] = green) or (field6[i+1, j] = right)) then
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
    if (i = 0) and (j = 2) then
    else
      begin
        imggreen.left := 228;
        imggreen.Top := 97;
      end;
  end;

  if (Key = 39) then
  begin
    if j = 6 then
    else
    begin
    if (field6[i, j+1] = alient) then
    begin
      form9.Show;
      Form6.Hide;
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
    if (field6[i, j-1] = alient) then
    begin
      form9.Show;
      Form6.Hide;
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
    if (field6[i-1, j] = alient) then
    begin
      form9.Show;
      Form6.Hide;
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
    if (field6[i+1, j] = alient) then
    begin
      form9.Show;
      Form6.Hide;
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
      formL.show;
      form4.Hide;
      imggreen.Left := 1000;
    end
    else
    begin
      if (i = 3)and(j=0) then
      begin
        form5.imggreenman.Left := 492;
        form5.imggreenman.top := 295;
        form5.show;
        form6.Hide;
        imggreen.Left := 1000;
      end
      else
      begin
        floar := 2;
      formle.show;
      form4.Hide;
      imggreen.Left := 1000;

      end;
    end;
  end;
  end;

end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  imgalient.Left := 96;
  imgalient.Top := 361;
  imgalient2.Left := 492;
  imgalient2.Top := 229;
end;

end.
