// name: type4.mo
// keywords:
// status: incorrect
// cflags:   +d=scodeInst
//

type RealInput = input Real;
type RealOutput = output RealInput;

model A
  RealInput ri;
  RealOutput ro;
end A;

// Result:
// Error processing file: type4.mo
// [type4.mo:7:1-7:28:writable] Notification: From here:
// [type4.mo:8:1-8:35:writable] Error: Invalid type prefix 'output' on class RealInput, due to existing type prefix 'input'.
// Error: Error occurred while flattening model A
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
