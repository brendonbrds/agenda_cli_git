unit uAgenda;

interface

uses
  System.SysUtils, Vcl.Dialogs, idHTTP, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, URequest, UAgendamentos, System.JSON,
  System.Classes, IdAuthentication, Vcl.Forms;

var
  idHTTP: TIdHTTP;
  Str: String;
  Ureq: TTDMConector;
  UAg: UAgendamentos.TForm1;
  mtv_c, medico, paciente, strDate, strTime, strDateTime, senddata,
    newDateTime: string;

const
  _URL = Ureq.urlBase;
  _path = 'agenda?' + Ureq.Token;
  _URI = _URL + _path;

  // function SaveAgend(AFormat, AMethod, ARequest: string): string;
function SaveAgend(AFormat, ARequest: string): string;
function json_config_get(medico, paciente, strDateTime, mtv_c: string): string;

implementation

uses
  Winapi.Windows;

{ Envia dados pra api }
function SaveAgend(AFormat, ARequest: string): string;
var
  RBody: TStringStream;
begin
  idHTTP := TIdHTTP.Create();
  RBody := TStringStream.Create(UTF8Encode(ARequest));

  try
    if AFormat = 'json' then
    begin
      idHTTP.Request.Accept := 'text/javascript';
      idHTTP.Request.ContentType := 'application/json';
    end
    else
    begin
      idHTTP.Request.Accept := 'text/xml';
      idHTTP.Request.ContentType := 'text/xml';
    end;
    try
      idHTTP.Request.Method := 'POST';
      idHTTP.Request.CacheControl := 'no-cache';
      Result := idHTTP.Post(_URI, RBody);
    except
      on E: EIdHTTPProtocolException do
        ShowMessage(E.ErrorMessage);
    end;
  finally
    FreeAndNil(RBody);
    FreeAndNil(idHTTP);
  end;
end;

function json_config_get(medico, paciente, strDateTime, mtv_c: string): string;
var
  JSON, response: string;
const
  _prefix = '{';
  _sufix = '}';
begin
  JSON := _prefix + '"medico":' + medico + ',';
  JSON := JSON + '"paciente":' + paciente + ',';
  JSON := JSON + '"data_hora":"' + strDateTime + '",';
  JSON := JSON + '"motivo_cancelamento":"' + mtv_c + '"' + _sufix;

  response := SaveAgend('json', JSON);
  Result := Copy(response, 13, Length(response) - 14);
  Application.MessageBox(PWideChar(response), 'Sucesso', MB_ICONINFORMATION);
end;

function xml_config_get(varname: string): string;
var
  XML, response: string;
begin
  XML := '<parameters><varname>' + varname + '</varname></parameters>';
  response := SaveAgend('xml', XML);
  Result := Copy(response, 9, Length(response) - 17);
end;

end.
