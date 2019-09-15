unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons;

type
  TFormLe = class(TForm)
    img1: TImage;
    btn1: TBitBtn;
    btn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLe: TFormLe;

implementation

uses Unit7, Unit8, Unit5, Unit1;

{$R *.dfm}

procedure TFormLe.FormShow(Sender: TObject);
begin
if floar = 1 then
begin
   btn2.Visible := False;
   btn1.Visible := True;
end;
if floar = 2 then
begin
   btn2.Visible := True;
   btn1.Visible := True;
end;
if floar = 3 then
begin
   btn2.Visible := true;
   btn1.Visible := false;
end;
btn1.Font.Color := clBlack;
btn2.Font.Color := clBlack;
end;

procedure TFormLe.btn1Click(Sender: TObject);
begin
  if floar = 1 then
begin
   form6.imggreenman.Left := 492;
        form6.imggreenman.top := 295;
        form6.show;
        formle.Hide;
end;
if floar = 2 then
begin
   form7.imggreenman.Left := 492;
        form7.imggreenman.top := 295;
        form7.show;
        formle.Hide;
end;
end;

procedure TFormLe.btn2Click(Sender: TObject);
begin
  if floar = 3 then
begin
   form6.imggreenman.Left := 492;
        form6.imggreenman.top := 295;
        form6.show;
        formle.Hide;
end;
if floar = 2 then
begin
   form4.imggreenman.Left := 492;
        form4.imggreenman.top := 295;
        form4.show;
        formle.Hide;
end;
end;

procedure TFormLe.btn2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then
  begin
    if floar = 3 then
      btn2.Font.Color := clGreen;
    if floar = 2 then
      btn2.Font.Color := clGreen;
  end;
end;

end.
