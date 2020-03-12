unit AboutProgram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TAbout = class(TForm)
    Picture: TImage;
    Line1: TLabel;
    Line2: TLabel;
    Line3: TLabel;
    OK: TButton;
    LLine4: TLabel;
    procedure OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  About: TAbout;

implementation

{$R *.dfm}

procedure TAbout.OKClick(Sender: TObject);
begin
  About.Close;
end;

end.
