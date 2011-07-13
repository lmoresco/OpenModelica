// name: ReturnError
// status: incorrect

model ReturnError
algorithm
  return;
end ReturnError;

// Result:
// Error processing file: ReturnError.mo
// [ReturnError.mo:6:3-6:9:writable] Error: Failed to instantiate statement:
// return;
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
