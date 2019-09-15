unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  TForm7 = class(TForm)
    img1: TImage;
    imgman: TImage;
    imggreen: TImage;
    imggreenman: TImage;
    imgalient: TImage;
    tmr: TTimer;
    procedure tmrTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation
Uses Unit1, Unit9, Unit11, Unit12;
{$R *.dfm}
var destination: 1..4;
procedure TForm7.tmrTimer(Sender: TObject);
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
      Form7.Hide;
    end;
  end;
  if destination = 1 then
  begin
    if j = 5 then
    begin
      destination := 2;
      field7[i,j] := empty;
      field7[2, 5] := alient;
      imgalient.Left := 426;
      imgalient.Top := 163;
    end
    else
    begin
       field7[i, j] := empty;
      field7[i, j+1] := alient;
      imgalient.Left := imgalient.Left + 66;
      imgalient.top := imgalient.top;
    end;
  end;
  if destination = 2 then
  begin
    if i = 5 then
    begin
      destination := 3;
      field7[i,j] := empty;
      field7[5, 4] := alient;
      imgalient.Left := 426;
      imgalient.Top := 427;
    end
    else
    begin
       field7[i, j] := empty;
      field7[i+1, j] := alient;
      imgalient.Left := imgalient.Left;
      imgalient.top := imgalient.top+66;
    end;
  end;
  if destination = 3 then
  begin
    if j = 1 then
    begin
      destination := 4;
      field7[i,j] := empty;
      field7[4, 1] := alient;
      imgalient.Left := 162;
      imgalient.Top := 427;
    end
    else
    begin
       field7[i, j] := empty;
      field7[i, j-1] := alient;
      imgalient.Left := imgalient.Left - 66;
      imgalient.top := imgalient.top;
    end;
  end;
  if destination = 4 then
  begin
    if i = 1 then
    begin
      destination := 1;
      field7[i,j] := empty;
      field7[1, 2] := alient;
      imgalient.Left := 228;
      imgalient.Top := 163;
    end
    else
    begin
       field7[i, j] := empty;
      field7[i-1, j] := alient;
      imgalient.Left := imgalient.Left;
      imgalient.top := imgalient.top-66;
    end;
  end;
end;

procedure TForm7.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (field7[i, j+1] = alient) then
    begin
      form9.Show;
      Form7.Hide;
    end;
    if ((field7[i, j+1] = green) or (field7[i, j+1] = right)) then
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
    if (field7[i, j-1] = alient) then
    begin
      form9.Show;
      Form7.Hide;
    end;
    if ((field7[i, j-1] = green) or (field7[i, j-1] = right)) then
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
    if (field7[i-1, j] = alient) then
    begin
      form9.Show;
      Form7.Hide;
    end;
    if ((field7[i-1, j] = green) or (field7[i-1, j] = right)) then
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
    if (field7[i+1, j] = alient) then
    begin
      form9.Show;
      Form7.Hide;
    end;
    if ((field7[i+1, j] = green) or (field7[i+1, j] = right)) then
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
    if (field7[i, j+1] = alient) then
    begin
      form9.Show;
      Form7.Hide;
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
    if (field7[i, j-1] = alient) then
    begin
      form9.Show;
      Form7.Hide;
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
    if (field7[i-1, j] = alient) then
    begin
      form9.Show;
      Form7.Hide;
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
    if (field7[i+1, j] = alient) then
    begin
      form9.Show;
      Form7.Hide;
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
      form7.Hide;
      imggreen.Left := 1000;
    end
    else
    begin
      floar := 3;
        formle.show;
        form7.Hide;
        imggreen.Left := 1000;

    end;
  end;
  end;

end;

procedure TForm7.FormShow(Sender: TObject);
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
    field7[i, j] := empty;
field7[0, 2] := right;
field7[3, 6] := green;
field7[1, 1] := alient;
imgalient.Left := 162;
imgalient.Top := 163;
destination := 1;
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
  destination := 1;
  imgalient.Left := 162;
  imgalient.Top := 163;
end;

end.
