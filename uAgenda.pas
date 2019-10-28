unit uAgenda;

interface

uses
  System.SysUtils, Vcl.Dialogs, idHTTP, IdBaseComponent, IdComponent,
  IdTCPConnection,
  IdTCPClient, URequest, UAgendamentos, IdAuthentication;

var
  lhttp: TIdHTTP;
  Str: String;
  Ureq: TTDMConector;
  UAg: UAgendamentos.TForm1;

implementation

procedure SaveAll;
var
  fparam, dados, mtv_c, medico, paciente, strDate, strTime, strDateTime: string;

const
  _params = '?data_hora=%s&medico=%d&paciente=%d';
  _params_if = '?data_hora=%s&medico=%d&paciente=%d&motivo_cancelamento=%s';

begin

  strDate := DateToStr(UAg.date_picker.Date);
  strTime := TimeToStr(UAg.time_picker.Time);
  strDateTime := 'Data: ' + strDate + ' Horário: ' + strTime;
  mtv_c := UAg.memo_mtvCancel.Text;
  medico := UAg.cod_medico.Text;
  paciente := UAg.cod_paciente.Text;

  if (UAg.check_cancelado.Checked = true) then
  begin
    fparam := _params_if;
    dados := Format(fparam, [strDateTime, medico, paciente, mtv_c])
  end
  else
  begin
    fparam := _params;
    dados := Format(fparam, [strDateTime, medico, paciente]);
  end;

end;

end.
