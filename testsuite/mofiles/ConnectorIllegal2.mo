// name: ConnectorIllegal2
// keywords: connector
// status: incorrect
//
// Tests an illegal connector definition
//

connector IllegalConnector
algorithm
  a := b;
end IllegalConnector;

model ConnectorIllegal2
  IllegalConnector ic;
end ConnectorIllegal2;

// Result:
// Error processing file: ConnectorIllegal2.mo
// [ConnectorIllegal2.mo:14:3-14:22:writable] Error: Variable ic: Algorithm section is not allowed in connector.
// Error: Error occurred while flattening model ConnectorIllegal2
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
