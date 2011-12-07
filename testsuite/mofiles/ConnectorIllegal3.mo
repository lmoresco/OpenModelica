// name: ConnectorIllegal3
// keywords: connector
// status: incorrect
//
// Tests an illegal connector definition
//

connector IllegalConnector = Real;

model ConnectorIllegal3
  IllegalConnector ic;
end ConnectorIllegal3;

// Result:
// Error processing file: ConnectorIllegal3.mo
// [ConnectorIllegal3.mo:8:1-8:34:writable] Error: Connector IllegalConnector is not balanced: The number of potential variables (1) is not equal to the number of flow variables (0).
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
