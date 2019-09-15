unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg;

type
  TForm6 = class(TForm)
    mmo1: TMemo;
    btn1: TBitBtn;
    img1: TImage;
    img2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm6.FormCreate(Sender: TObject);
var rgn: HRGN;
begin
  rgn := CreateRoundRectRgn(0,0,ClientWidth,ClientHeight,40,40);
  SetWindowRgn(Handle, rgn, True);
  with mmo1 do
  begin
    Lines[0] := 'With this program you can encrypt any text with three algorithms. To do this, select the encryption method, the source code and enter the key. The ciphertext file will be created automatically in the same folder as the original file.';
  end;
end;

procedure TForm6.btn1Click(Sender: TObject);
begin
formStart.show;
Form6.Hide;
end;

end.
