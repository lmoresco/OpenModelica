// name: ConnectorComponents
// keywords: connector
// status: correct
//
// Tests declaration and instantiation of a connector with components
//

connector TestConnector
  Real r;
end TestConnector;

model ConnectorComponents
  TestConnector tc1;
  Real r;
equation
  tc1.r = 3.0;
  r = tc1.r;
end ConnectorComponents;

// Result:
// class ConnectorComponents
// Real tc1.r;
// Real r;
// equation
//   tc1.r = 3.0;
//   r = tc1.r;
// end ConnectorComponents;
// endResult
