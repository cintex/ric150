unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm2 = class(TForm)
    RichEdit1: TRichEdit;
    procedure FormShow(Sender: TObject);
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
form2.Width:=form1.Width+150;
form2.Height:=form1.Height;
form2.Left:=round(screen.Width/2);
form2.Top:=round(screen.Height/2-Form2.Height/2);
form1.Left:=round(screen.Width/2)-408;
form1.Top:=round(screen.Height/2-Form1.Height/2);
end;

end.
