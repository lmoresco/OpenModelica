// name:     ConnectFlowEffort
// keywords: connect,modification
// status:   incorrect
// 
// Flow and effort variables may not be connected.
//

connector Connector1
  Real e;
end Connector1;

connector Connector2
  flow Real e;
end Connector2;

class ConnectFlowEffort
  Connector1 c1;
  Connector2 c2;
equation
  connect(c1, c2);
end ConnectFlowEffort;
