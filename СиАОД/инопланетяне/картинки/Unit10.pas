unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TFormEnd = class(TForm)
    img1: TImage;
    lbl1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEnd: TFormEnd;

implementation

{$R *.dfm}

procedure TFormEnd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

end.
