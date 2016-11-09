unit NewLibrary_Intf;

{----------------------------------------------------------------------------}
{ This unit was automatically generated by the RemObjects SDK after reading  }
{ the RODL file associated with this project .                               }
{                                                                            }
{ Do not modify this unit manually, or your changes will be lost when this   }
{ unit is regenerated the next time you compile the project.                 }
{----------------------------------------------------------------------------}

{$I RemObjects.inc}

interface

uses
  {vcl:} Classes, TypInfo,
  {RemObjects:} uROXMLIntf, uROClasses, uROClient, uROTypes, uROClientIntf;

const
  //RBK modification: storing timestamp of generation, to be able to check version mismatch between client and server
  //RBK modification, done in: "\Lib\Componenten\RemObjects SDK for Delphi\Source\CodeGen\uRODLToPascalIntf.pas"
  C_GenerateDateTime = '18-09-2013 15:29:06:712 by amussche';

const
  { Library ID }
  LibraryUID = '{37BBB078-915E-4B4D-B5CB-FD43C7359A58}';
  TargetNamespace = '';

  { Service Interface ID's }
  INewService_IID : TGUID = '{5C59475D-E65E-4634-998F-B2DE324E381B}';

type
  TSeekOrigin = Classes.TSeekOrigin; // fake declaration
  { Forward declarations }
  INewService = interface;


  { INewService }
  INewService = interface
    ['{5C59475D-E65E-4634-998F-B2DE324E381B}']
    function Sum(const a: Integer; const b: Integer): Integer;
    function LongDurationIntermediateSocketIOResults(const aDuration_ms: Integer; const aSleep_ms: Integer): Integer;
  end;

  { CoNewService }
  CoNewService = class
    class function Create(const aMessage: IROMessage; aTransportChannel: IROTransportChannel): INewService;
  end;

  { TNewService_Proxy }
  TNewService_Proxy = class(TROProxy, INewService)
  protected
    function __GetInterfaceName:string; override;

    function Sum(const a: Integer; const b: Integer): Integer;
    function LongDurationIntermediateSocketIOResults(const aDuration_ms: Integer; const aSleep_ms: Integer): Integer;
  end;

implementation

uses
  {vcl:} SysUtils,
  {RemObjects:} uROEventRepository, uROSerializer, uRORes;

{ CoNewService }

class function CoNewService.Create(const aMessage: IROMessage; aTransportChannel: IROTransportChannel): INewService;
begin
  Result := TNewService_Proxy.Create(aMessage, aTransportChannel);
end;

{ TNewService_Proxy }

function TNewService_Proxy.__GetInterfaceName:string;
begin
  Result := 'NewService';
end;

function TNewService_Proxy.Sum(const a: Integer; const b: Integer): Integer;
var
  lMessage: IROMessage;
  lTransportChannel: IROTransportChannel;
begin
  lMessage := __GetMessage;
  lTransportChannel := __TransportChannel;
  try
    lMessage.InitializeRequestMessage(lTransportChannel, 'NewLibrary', __InterfaceName, 'Sum');
    lMessage.Write('a', TypeInfo(Integer), a, []);
    lMessage.Write('b', TypeInfo(Integer), b, []);
    lMessage.Finalize;

    lTransportChannel.Dispatch(lMessage);

    lMessage.Read('Result', TypeInfo(Integer), Result, []);
  finally
    lMessage.UnsetAttributes(lTransportChannel);
    lMessage.FreeStream;
    lMessage := nil;
    lTransportChannel := nil;
  end;
end;

function TNewService_Proxy.LongDurationIntermediateSocketIOResults(const aDuration_ms: Integer; const aSleep_ms: Integer): Integer;
var
  lMessage: IROMessage;
  lTransportChannel: IROTransportChannel;
begin
  lMessage := __GetMessage;
  lTransportChannel := __TransportChannel;
  try
    lMessage.InitializeRequestMessage(lTransportChannel, 'NewLibrary', __InterfaceName, 'LongDurationIntermediateSocketIOResults');
    lMessage.Write('aDuration_ms', TypeInfo(Integer), aDuration_ms, []);
    lMessage.Write('aSleep_ms', TypeInfo(Integer), aSleep_ms, []);
    lMessage.Finalize;

    lTransportChannel.Dispatch(lMessage);

    lMessage.Read('Result', TypeInfo(Integer), Result, []);
  finally
    lMessage.UnsetAttributes(lTransportChannel);
    lMessage.FreeStream;
    lMessage := nil;
    lTransportChannel := nil;
  end;
end;

initialization
  RegisterProxyClass(INewService_IID, TNewService_Proxy);


finalization
  UnregisterProxyClass(INewService_IID);


end.
