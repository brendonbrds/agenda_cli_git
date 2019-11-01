unit UConsultas;

interface

uses
  System.SysUtils, Vcl.Forms, IdHTTP, URequest, UAgendamentos,
  System.JSON;

var
  IdHTTP: TIdHTTP;
  Ureq: TTDMConector;
  UAg: UAgendamentos.TForm1;

function GetMany(path, name: string): string;

implementation

uses
  System.Classes, Vcl.Dialogs;

function GetMany(path, name: string): string;
var
  jsonOBJ: TJSONObject;
  response: TStringStream;
  url, retorno: string;

begin
  IdHTTP := TIdHTTP.Create();
  response := TStringStream.Create();
  try
    url := Ureq.urlBase + path + Ureq.Token;
    IdHTTP.Get(url, response);
    response.Position := 0;
    jsonOBJ := TJSONObject.ParseJSONValue(response.DataString) as TJSONObject;
    retorno := jsonOBJ.GetValue('codigo').Value;

  finally
    response.Free();
    jsonOBJ.Free();
  end;

end;

end.
