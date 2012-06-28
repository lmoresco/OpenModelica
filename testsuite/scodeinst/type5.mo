// name: type5.mo
// keywords:
// status: incorrect
//

type RealInput = input Real;
type RealOutput = output Real;

model A
  RealInput ri;
  input RealOutput ro;
end A;

// Result:
// Error processing file: type5.mo
// [type5.mo:7:1-7:30:writable] Notification: From here:
// [type5.mo:11:3-11:22:writable] Error: Invalid type prefix 'input' on variable ro, due to existing type prefix 'output'.
// Error: Error occurred while flattening model A
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
