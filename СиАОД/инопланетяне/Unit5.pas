unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  TForm4 = class(TForm)
    img1: TImage;
    imgman: TImage;
    imggreen: TImage;
    imggreenman: TImage;
    imgalient: TImage;
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
  Form4: TForm4;

implementation
 uses Unit1, Unit9, Unit11, Unit4, Unit12, Unit3;
{$R *.dfm}
var destination: 1..4;
procedure TForm4.FormShow(Sender: TObject);
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
    field4[i, j] := empty;
field4[0, 2] := green;
field4[3, 0] := green;
field4[3, 6] := green;
field4[6, 3] := right;
field4[1, 1] := alient;
imgalient.Left := 162;
imgalient.Top := 163;
destination := 1;
end;

procedure TForm4.tmrTimer(Sender: TObject);
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
      Form4.Hide;
    end;
  end;
  if destination = 1 then
  begin
    if j = 5 then
    begin
      field4[i,j] := empty;
      field4[2, 5] := alient;
      imgalient.Left := 426;
      imgalient.Top := 163;
      destination := 2;
    end
    else
    begin
       field4[i, j] := empty;
      field4[i, j+1] := alient;
      imgalient.Left := imgalient.Left + 66;
      imgalient.top := imgalient.top;
    end;
  end;
  if destination = 2 then
  begin
    if i = 5 then
    begin
      destination := 3;
      field4[i,j] := empty;
      field4[5, 4] := alient;
      imgalient.Left := 426;
      imgalient.Top := 427;
    end
    else
    begin
       field4[i, j] := empty;
      field4[i+1, j] := alient;
      imgalient.Left := imgalient.Left;
      imgalient.top := imgalient.top+66;
    end;
  end;
  if destination = 3 then
  begin
    if j = 1 then
    begin
      destination := 4;
      field4[i,j] := empty;
      field4[4, 1] := alient;
      imgalient.Left := 162;
      imgalient.Top := 427;
    end
    else
    begin
       field4[i, j] := empty;
      field4[i, j-1] := alient;
      imgalient.Left := imgalient.Left - 66;
      imgalient.top := imgalient.top;
    end;
  end;
  if destination = 4 then
  begin
    if i = 1 then
    begin
      destination := 1;
      field4[i,j] := empty;
      field4[1, 2] := alient;
      imgalient.Left := 228;
      imgalient.Top := 163;
    end
    else
    begin
       field4[i, j] := empty;
      field4[i-1, j] := alient;
      imgalient.Left := imgalient.Left;
      imgalient.top := imgalient.top-66;
    end;
  end;
end;
procedure TForm4.FormCreate(Sender: TObject);
begin
  destination := 1;
  imgalient.Left := 162;
  imgalient.Top := 163;
end;

procedure TForm4.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (field4[i, j+1] = alient) then
    begin
      form9.Show;
      Form4.Hide;
    end;
    if ((field4[i, j+1] = green) or (field4[i, j+1] = right)) then
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
    if (field4[i, j-1] = alient) then
    begin
      form9.Show;
      Form4.Hide;
    end;
    if ((field4[i, j-1] = green) or (field4[i, j-1] = right)) then
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
    if (field4[i-1, j] = alient) then
    begin
      form9.Show;
      Form4.Hide;
    end;
    if ((field4[i-1, j] = green) or (field4[i-1, j] = right)) then
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
    if (field4[i+1, j] = alient) then
    begin
      form9.Show;
      Form4.Hide;
    end;
    if ((field4[i+1, j] = green) or (field4[i+1, j] = right)) then
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
    if (field4[i, j+1] = alient) then
    begin
      form9.Show;
      Form4.Hide;
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
    if (field4[i, j-1] = alient) then
    begin
      form9.Show;
      Form4.Hide;
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
    if (field4[i-1, j] = alient) then
    begin
      form9.Show;
      Form4.Hide;
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
    if (field4[i+1, j] = alient) then
    begin
      form9.Show;
      Form4.Hide;
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
    end;
    if (i = 3)and(j=0) then
    begin
      form3.imggreenman.Left := 492;
      form3.imggreenman.top := 295;
      form3.show;
      form4.Hide;
      imggreen.Left := 1000;
    end;
    if (i = 3) and (j = 6) then
    begin
       floar := 1;
      formle.show;
      form4.Hide;
      imggreen.Left := 1000;

    end;
    if i = 6 then
    begin
        form2.imggreenman.Left := 294;
        form2.imggreenman.top := 97;
        form2.show;
        form4.Hide;
        imggreen.Left := 1000;
    end;
  end;
  end;

end;

end.
