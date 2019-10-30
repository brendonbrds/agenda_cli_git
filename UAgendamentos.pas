unit UAgendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, System.JSON, URequest, DateUtils;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    btn_adicionar: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_excluir: TSpeedButton;
    cod_medico: TEdit;
    Label1: TLabel;
    name_medico: TEdit;
    cod_paciente: TEdit;
    Label2: TLabel;
    name_paciente: TEdit;
    Label3: TLabel;
    date_picker: TDateTimePicker;
    check_cancelado: TCheckBox;
    Label4: TLabel;
    memo_mtvCancel: TMemo;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    btn_editar: TSpeedButton;
    Panel4: TPanel;
    grid_listaAgend: TDBGrid;
    time_picker: TDateTimePicker;
    IdHTTP1: TIdHTTP;
    procedure btn_adicionarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure clear;
    procedure check_canceladoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cod_medicoKeyPress(Sender: TObject; var Key: Char);
    procedure cod_pacienteKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  UReq: TTDMConector;

implementation

{$R *.dfm}

uses UListaMedicos, UListaPacientes, uAgenda;

procedure TForm1.btn_adicionarClick(Sender: TObject);
begin

  cod_medico.Enabled := true;
  cod_paciente.Enabled := true;
  date_picker.Enabled := true;
  time_picker.Enabled := true

end;

procedure TForm1.check_canceladoClick(Sender: TObject);
begin
  if check_cancelado.Checked = true then
  begin
    memo_mtvCancel.Enabled := true;
  end
  else
  begin
    memo_mtvCancel.Enabled := false;
  end;
end;

procedure TForm1.clear;
begin
  cod_medico.Text := '';
  cod_paciente.Text := '';
  name_medico.Text := '';
  name_paciente.Text := '';
  memo_mtvCancel.Text := '';

end;

procedure TForm1.cod_medicoKeyPress(Sender: TObject; var Key: Char);
var
  lURL, id, retorno: String;
  lResponse: TStringStream;
  jsonObj: TJSONObject;
begin
  // se o ENTER for pressionado
  if Key = #13 then
    // se o campo estiver vazio
    if (cod_medico.Text = '') then
      Form2.Show
    else if StrToInt(cod_medico.Text) > 0 then
    begin
      // aqui busca o nome do medido da api
      id := cod_medico.Text;
      // ShowMessage(id);
      lResponse := TStringStream.Create('');

      try
        lURL := UReq.urlBase + 'medico/' + id + '?' + UReq.Token;
        IdHTTP1.Get(lURL, lResponse);
        lResponse.Position := 0;
        jsonObj := TJSONObject.ParseJSONValue(lResponse.DataString)
          as TJSONObject;
        retorno := jsonObj.GetValue('nome').Value;
        // ShowMessage('Nome: ' + retorno);
        name_medico.Text := retorno;
      finally
        lResponse.Free();
      end;
    end;

end;

procedure TForm1.cod_pacienteKeyPress(Sender: TObject; var Key: Char);
var
  lURL, id, retorno: String;
  lResponse: TStringStream;
  jsonObj: TJSONObject;
begin
  // se o ENTER for pressionado
  if Key = #13 then
    // se o campo estiver vazio
    if cod_paciente.Text = '' then
      Form3.Show
    else if StrToInt(cod_paciente.Text) > 0 then
    begin
      id := cod_paciente.Text;
      lResponse := TStringStream.Create('');
      try
        lURL := UReq.urlBase + 'paciente/' + id + '?' + UReq.Token;
        IdHTTP1.Get(lURL, lResponse);
        lResponse.Position := 0;
        jsonObj := TJSONObject.ParseJSONValue(lResponse.DataString)
          as TJSONObject;
        retorno := jsonObj.GetValue('nome').Value;
        // ShowMessage('Nome: ' + retorno);
        name_paciente.Text := retorno;
      finally
        lResponse.Free();
      end;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo_mtvCancel.Text := '';
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    close;
  end;
end;

procedure TForm1.btn_salvarClick(Sender: TObject);
var
  retorno, fparam, mtv_c, medico, paciente, strDate, strTime, strDateTime,
    dados, URL, senddata, uri, newDateTime: string;
  StreamRetorno, JsonStreamEnvio: TStringStream;
  TSData: TStringList;

  // const
  // _params = 'data_hora=%s&medico=%s&paciente=%s';
  // _params_if = 'data_hora=%s&medico=%d&paciente=%d&motivo_cancelamento=%s';

begin

  if (cod_medico.Text = '') or (cod_paciente.Text = '') then
  begin
    ShowMessage('Campos vazios!');
  end;

  if (check_cancelado.Checked = true) and (memo_mtvCancel.Text = '') then
  begin
    ShowMessage('Aten��o! Voc� n�o informou o motivo do cancelamento');

  end;

  // retorno := Self.Save;
  strTime := TimeToStr(time_picker.Time);
  strDate := FormatDateTime('yyyy/mm/dd', date_picker.Date);
  strDateTime := strDate + ' ' + strTime;
  mtv_c := memo_mtvCancel.Text;
  medico := cod_medico.Text;
  paciente := cod_paciente.Text;
//  ShowMessage(strDateTime);

  // if (check_cancelado.Checked = true) then
  // begin
  // fparam := _params_if;
  // dados := Format(fparam, [strDateTime, medico, paciente, mtv_c]);
  // end
  // else
  // begin
  // fparam := _params;
  // dados := Format(fparam, [strDateTime, medico, paciente]);
  // end;

  URL := 'http://167.71.177.248:3333/agenda?';
  // JsonStreamEnvio := TStringStream.Create('');
  StreamRetorno := TStringStream.Create('');
  TSData := TStringList.Create;
  try
    // IdHTTP1.Request.clear;
    IdHTTP1.Request.Charset := 'utf-8';
    IdHTTP1.Request.CacheControl := 'no-cache';
    // IdHTTP1.Request.BasicAuthentication := true;
    // IdHTTP1.Request.Username := 'estagiario';
    // IdHTTP1.Request.Password := '@D5estagio2019';
    IdHTTP1.Request.clear;

    try
      TSData.Add('medico=' + medico);
      TSData.Add('paciente=' + paciente);
      TSData.Add('data_hora=' + strDateTime);
      TSData.Add('motivo_cancelamento=' + mtv_c);
      // TSData.Add('medico=' + medico);
      IdHTTP1.Post(URL + UReq.Token, TSData, StreamRetorno);
      StreamRetorno.Position := 0;

    except

      on E: EIdHTTPProtocolException do

        ShowMessage(E.ErrorMessage);
    end;
  finally
    // ShowMessage(TSData.Text);
    TSData.Free();
    StreamRetorno.Free();
    ShowMessage('Dados Cadastrados!');
  end;

  cod_medico.Enabled := false;
  cod_paciente.Enabled := false;
  date_picker.Enabled := false;
  time_picker.Enabled := false;
  check_cancelado.Checked := false;

  // !chamar a procedure clear por �ltimo
  clear;
end;

end.
