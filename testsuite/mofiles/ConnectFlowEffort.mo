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
// Result:
// -Inst.connectComponents failed
// Error processing file: ConnectFlowEffort.mo
// [ConnectFlowEffort.mo:20:3-20:3:writable] Error: Cannot connect flow component c2.e to non-flow component c1.e
// [ConnectFlowEffort.mo:20:3-20:3:writable] Error: The type of variables c1 and c2 (Connector1 connector and Connector2 connector) are inconsistent in connect equations
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
