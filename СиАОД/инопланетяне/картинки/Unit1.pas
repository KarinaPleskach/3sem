unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TFormStart = class(TForm)
    img1: TImage;
    Label1: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    btnStart: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormStart: TFormStart;

type
  Tcell = (empty, alient, right, green);

var field1, field2, field3, field4, field5, field6, field7: array of array of Tcell;

var start: Integer;
floar : 1..3;

implementation

Uses Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, Unit8;

{$R *.dfm}



procedure TFormStart.FormCreate(Sender: TObject);
begin
   SetLength(field1, 7, 7);
   SetLength(field2, 7, 7);
   SetLength(field3, 7, 7);
   SetLength(field4, 7, 7);
   SetLength(field5, 7, 7);
   SetLength(field6, 7, 7);
   SetLength(field7, 7, 7);
   start := 0;
end;

procedure TFormStart.btnStartClick(Sender: TObject);
var i: Integer;
begin
   Randomize;
   i := Random(7) + 1;
   case i of
     1: Form1.Show;
     2: Form2.Show;
     3: Form3.Show;
     4: Form4.Show;
     5: Form5.Show;
     6: Form6.Show;
     7: Form7.Show;
   end;
   FormStart.Hide;
end;

end.
