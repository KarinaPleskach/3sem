unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TForm5 = class(TForm)
    mmo: TMemo;
    btn1: TBitBtn;
    dlgSave1: TSaveDialog;
    btn2: TButton;
    btn3: TButton;
    img1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm5.FormCreate(Sender: TObject);
var rgn: HRGN;
begin
rgn := CreateRoundRectRgn(0,0,ClientWidth,ClientHeight,40,40);
  SetWindowRgn(Handle, rgn, True);
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  mmo.Lines.Clear;
mmo.Lines[0] := 'Enter your text here...';
end;

procedure TForm5.btn1Click(Sender: TObject);
begin
formStart.show;
form5.Hide;
end;

procedure TForm5.btn2Click(Sender: TObject);
begin
      with dlgSave1, mmo do
      if Execute then
        begin
           Lines.SaveToFile(FileName);
           FileName:=FileName;
        end;
end;

procedure TForm5.btn3Click(Sender: TObject);
begin
if dlgSave1.Execute then
      mmo.Lines.LoadFromFile(dlgSave1.FileName);
end;

end.
