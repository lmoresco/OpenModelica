// name: ConnectorIllegal
// keywords: connector
// status: incorrect
//
// Tests an illegal connector definition
//

connector IllegalConnector
  Integer i;
equation
  i = 2;
end IllegalConnector;

model ConnectorIllegal
  IllegalConnector ic;
end ConnectorIllegal;
