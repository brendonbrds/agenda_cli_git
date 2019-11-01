unit UConsultas;

interface

uses
  System.SysUtils, Vcl.Dialogs, Vcl.Forms, IdHTTP, URequest, UAgendamentos;

var
  IdHTTP: TIdHTTP;
  Ureq: TTDMConector;
  UAg: UAgendamentos.TForm1;

implementation

function GetMany(name: string): string;
begin

end;

end.
