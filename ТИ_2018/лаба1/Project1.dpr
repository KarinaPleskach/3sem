program Project1;

uses
  Forms,
  Unit1 in '..\..\..\Œ¿»œ\Î‡·˚\SnakeDemo\Unit1.pas' {FormStart},
  Unit2 in '..\..\..\Œ¿»œ\Î‡·˚\SnakeDemo\Unit2.pas' {Form2},
  Unit3 in '..\..\..\Œ¿»œ\Î‡·˚\SnakeDemo\Unit3.pas' {Form3},
  Unit4 in '..\..\..\Œ¿»œ\Î‡·˚\SnakeDemo\Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Form5},
  Unit6 in 'Unit6.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormStart, FormStart);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
