//|name:     ConnectFlowEffort
//|keywords: connection,modification
//|status:   incorrect
// 
// Flow and effort variables may not be connected.
//

connector Connector
  flow Real f;
  Real e;
end Connector;

class ConnectFlowEffort
  Connector c1, c2(redeclare flow Real e);
equation
  connect(c1, c2);
end ConnectFlowEffort;
