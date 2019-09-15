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
    btnhint: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure tmrTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit1;
{$R *.dfm}



procedure TForm1.FormShow(Sender: TObject);
var i, j: Integer;
begin
if start = 0 then
  begin
    start := 1;
    field1[3, 3] := empty;
    imgman.Left := 286;
    imgman.Top := 278;
  end
else
  begin
    FielD1[3, 3] := empty;
  end;
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
imgalient.Left := 88;
imgalient.Top := 344;
imgalient2.Left := 484;
imgalient2.Top := 212;
end;

procedure TForm1.tmrTimer(Sender: TObject);
var i, j: Integer;
begin
if (imgalient.Left = 352) then
  begin
    field1[0, 4] := empty;
    field1[4, 0] := alient;
    imgalient.Left := 88;
    imgalient.Top := 344;
  end
  else
  begin
    j := (imgalient.Left - 88) div 66;
    i := (imgalient.Top - 80) div 66;
    field1[i, j] := empty;
    field1[i - 1, j + 1] := alient;
    imgalient.Left := imgalient.Left + 66;
    imgalient.top := imgalient.top - 66;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  imgalient.Left := 88;
  imgalient.Top := 344;
  imgalient2.Left := 484;
  imgalient2.Top := 212;
end;

end.
