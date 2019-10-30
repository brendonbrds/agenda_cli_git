unit URequest;

interface

uses
  System.SysUtils, System.Classes, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TTDMConector = class(TDataModule)
    IdHTTP1: TIdHTTP;
  private
    { Private declarations }
  public
  { Public declarations }
    const
    Token = 'token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsImlhdCI6MTU3MDcyMTkxM30.3vzxGOiM0Ig4KnyXpmEJpH2JUOxpRUsfZesOn81Irvc';
    urlBase = 'http://167.71.177.248:3333/';
  end;

var
  TDMConector: TTDMConector;

implementation

{$R *.dfm}

end.
