unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TForm2 = class(TForm)
    img1: TImage;
    mmo: TMemo;
    btn1: TBitBtn;
    btn2: TButton;
    btn3: TButton;
    dlgSave1: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.FormShow(Sender: TObject);
begin
  mmo.Lines.Clear;
  mmo.Lines[0] := '¬ведите сюда ваш текст...';
end;

procedure TForm2.btn1Click(Sender: TObject);
begin
  Form2.Hide;
  form1.show;
end;

procedure TForm2.btn3Click(Sender: TObject);
begin
  if dlgSave1.Execute then
    mmo.Lines.LoadFromFile(dlgSave1.FileName);
end;

procedure TForm2.btn2Click(Sender: TObject);
begin
  with dlgSave1, mmo do
  if Execute then
  begin
    Lines.SaveToFile(FileName);
    FileName:=FileName;
  end;
end;

end.
