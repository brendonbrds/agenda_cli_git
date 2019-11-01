unit UListaMedicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    grid_listaMedico: TDBGrid;
    search_medico_edit: TEdit;
    selabel: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure search_medico_editKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  name: string;

implementation

{$R *.dfm}

uses UConsultas;

procedure TForm2.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    close;
  end;
end;

procedure TForm2.search_medico_editKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    name := search_medico_edit.Text;
    UConsultas.GetMany('medico/?', name);
  end;
end;

end.
