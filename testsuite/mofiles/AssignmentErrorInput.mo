// name: AssignmentErrorInput
// status: incorrect

model AssignmentErrorInput
  input Real r;
algorithm
  r := 3.0;
end AssignmentErrorInput;
// Result:
// Error processing file: AssignmentErrorInput.mo
// [AssignmentErrorInput.mo:7:3-7:11:writable] Error: Trying to assign to input component r
// Error: Error occurred while flattening model AssignmentErrorInput
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
