program agendamentos;

uses
  Vcl.Forms,
  UAgendamentos in 'UAgendamentos.pas' {Form1},
  UListaMedicos in 'UListaMedicos.pas' {Form2},
  UListaPacientes in 'UListaPacientes.pas' {Form3},
  URequest in 'URequest.pas' {TDMConector: TDataModule},
  uAgenda in 'uAgenda.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TTDMConector, TDMConector);
  Application.Run;
end.
