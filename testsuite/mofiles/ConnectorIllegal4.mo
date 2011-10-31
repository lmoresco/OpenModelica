// name: ConnectorIllegal4
// keywords: connector
// status: incorrect
//
// Tests an illegal connector definition
//

connector IllegalConnector = flow Real;

model ConnectorIllegal4
  IllegalConnector ic;
end ConnectorIllegal4;

// Result:
// Error processing file: ConnectorIllegal4.mo
// [ConnectorIllegal4.mo:8:1-8:39:writable] Warning: Connector IllegalConnector is not balanced: The number of potential variables (0) is not equal to the number of flow variables (1).
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
