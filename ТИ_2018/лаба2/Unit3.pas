unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TForm3 = class(TForm)
    img2: TImage;
    img1: TImage;
    mmo1: TMemo;
    btn1: TBitBtn;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm3.btn1Click(Sender: TObject);
begin
  form1.show;
  form3.hide;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  mmo1.Lines[0] := 'Данная программа реализует алгоритм потокового шифрования. Выберите исходный файл, введите начальное значение регистра и запомните его (оно вам понадобится при дешифрировании). Результатом программы будут зашифрованный и расшифрованный файл.';
end;

end.
