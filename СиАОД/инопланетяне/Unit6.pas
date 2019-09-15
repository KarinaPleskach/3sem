unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  TForm5 = class(TForm)
    img1: TImage;
    imgman: TImage;
    imggreen: TImage;
    imggreenman: TImage;
    imgalient: TImage;
    tmr: TTimer;
    procedure tmrTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation
 Uses Unit1, Unit9, Unit7;
{$R *.dfm}
var Bool: Boolean;
procedure TForm5.tmrTimer(Sender: TObject);
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
      Form5.Hide;
    end;
  end;
  if (bool) then
  begin
    if i = 5 then
    begin
      field5[i,j] := empty;
      field5[4, 5] := alient;
      imgalient.Left := 426;
      imgalient.Top := 361;
      bool := False;
    end
    else
    begin
       field5[i, j] := empty;
    field5[i+1, j] := alient;
    imgalient.Left := imgalient.Left;
    imgalient.top := imgalient.top + 66;
    end;
  end
  else
  begin
    if i = 1 then
    begin
      bool := True;
      field5[i,j] := empty;
      field5[2, 5] := alient;
      imgalient.Left := 426;
      imgalient.Top := 229;
    end
    else
    begin
      field5[i, j] := empty;
    field5[i-1, j] := alient;
    imgalient.Left := imgalient.Left;
    imgalient.top := imgalient.top - 66;
    end;
  end;
end;

procedure TForm5.FormShow(Sender: TObject);
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
    field5[i, j] := empty;
field5[3, 6] := right;
field5[1, 5] := alient;
imgalient.Left := 426;
imgalient.Top := 163;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  bool := True;
  imgalient.Left := 426;
  imgalient.Top := 163;
end;

procedure TForm5.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (field5[i, j+1] = alient) then
    begin
      form9.Show;
      Form5.Hide;
    end;
    if ((field5[i, j+1] = green) or (field5[i, j+1] = right)) then
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
    if (field5[i, j-1] = alient) then
    begin
      form9.Show;
      Form5.Hide;
    end;
    if ((field5[i, j-1] = green) or (field5[i, j-1] = right)) then
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
    if (field5[i-1, j] = alient) then
    begin
      form9.Show;
      Form5.Hide;
    end;
    if ((field5[i-1, j] = green) or (field5[i-1, j] = right)) then
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
    if (field5[i+1, j] = alient) then
    begin
      form9.Show;
      Form5.Hide;
    end;
    if ((field5[i+1, j] = green) or (field5[i+1, j] = right)) then
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
    if (field5[i, j+1] = alient) then
    begin
      form9.Show;
      Form5.Hide;
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
    if (field5[i, j-1] = alient) then
    begin
      form9.Show;
      Form5.Hide;
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
    if (field5[i-1, j] = alient) then
    begin
      form9.Show;
      Form5.Hide;
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
    if (field5[i+1, j] = alient) then
    begin
      form9.Show;
      Form5.Hide;
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
        form6.imggreenman.Left := 96;
        form6.imggreenman.top := 295;
        form6.show;
        form5.Hide;
        imggreen.Left := 1000;
  end;
  end;

end;

end.
