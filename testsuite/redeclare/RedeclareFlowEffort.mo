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
// [RedeclareFlowEffort.mo:8:1-11:14:writable] Warning: Connector Connector is not balanced: The number of potential variables (0) is not equal to the number of flow variables (2).
// [RedeclareFlowEffort.mo:16:3-16:18:writable] Error: Cannot connect flow component c2.e to non-flow component c1.e
// [RedeclareFlowEffort.mo:16:3-16:18:writable] Error: The type of variables c1 and c2 (Connector connector and Connector connector) are inconsistent in connect equations
// Error: Error occurred while flattening model RedeclareFlowEffort
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
