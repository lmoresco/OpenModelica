// name:     RedeclareFlowEffort
// keywords: modification
// status:   incorrect
// 
// Redeclaration that changes flow/non-flow is not allowed.
//

connector Connector
  flow Real f;
  Real e;
end Connector;

class RedeclareFlowEffort
  Connector c1, c2(redeclare flow Real e);
equation
  connect(c1, c2);
end RedeclareFlowEffort;
