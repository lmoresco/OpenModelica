// name:     RedeclareFlowEffort
// keywords: modification
// status:   incorrect
// 
// Redeclaration that changes flow/non-flow is not allowed.
//

connector Connector
  flow Real f;
  replaceable Real e;
end Connector;

class RedeclareFlowEffort
  Connector c1, c2(redeclare flow Real e);
equation
  connect(c1, c2);
end RedeclareFlowEffort;
// Result:
// Error processing file: RedeclareFlowEffort.mo
// [RedeclareFlowEffort.mo:8:1-11:14:writable] Error: Connector Connector is not balanced: The number of potential variables (0) is not equal to the number of flow variables (2).
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
