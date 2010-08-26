// name: ConnectorIllegal
// keywords: connector
// status: incorrect
//
// Tests an illegal connector definition
//

connector IllegalConnector
  Integer i;
equation
  i = 2;
end IllegalConnector;

model ConnectorIllegal
  IllegalConnector ic;
end ConnectorIllegal;
// Result:
// Error processing file: ConnectorIllegal.mo
// Error: In class IllegalConnector, equations not allowed in connectors
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
