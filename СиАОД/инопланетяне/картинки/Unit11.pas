unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons;

type
  TFormL = class(TForm)
    img1: TImage;
    b1: TBitBtn;
    b2: TBitBtn;
    b3: TBitBtn;
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormL: TFormL;

implementation

uses Unit5, Unit7, Unit8;

{$R *.dfm}


procedure TFormL.b1Click(Sender: TObject);
begin
        form4.imggreenman.Left := 228;
        form4.imggreenman.top := 97;
        form4.show;
        formL.Hide;
end;

procedure TFormL.b2Click(Sender: TObject);
begin
form6.imggreenman.Left := 228;
        form6.imggreenman.top := 97;
        form6.show;
        formL.Hide;
end;

procedure TFormL.b3Click(Sender: TObject);
begin
form7.imggreenman.Left := 228;
        form7.imggreenman.top := 97;
        form7.show;
        formL.Hide;
end;

procedure TFormL.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = 27 then
b1.Font.Color := clGreen;
end;

procedure TFormL.FormShow(Sender: TObject);
begin
b1.Font.Color :=0;
b2.Font.Color :=0;
b3.Font.Color :=0;
b1.SetFocus;
end;

end.
