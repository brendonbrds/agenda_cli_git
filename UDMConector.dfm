object TDMConexao: TTDMConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 257
  Width = 376
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 168
    Top = 56
  end
  object RESTClient1: TRESTClient
    Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Params = <>
    HandleRedirects = True
    Left = 64
    Top = 56
  end
  object RESTResponse1: TRESTResponse
    Left = 264
    Top = 56
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    FieldDefs = <>
    Left = 168
    Top = 144
  end
end
