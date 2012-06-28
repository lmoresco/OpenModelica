// name: const7.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//
// Correct, but old instantiation fails.
//


model M
  parameter Real A[1, n];
  parameter Integer n = size(A, 1);
end M;

// Result:
// 
// EXPANDED FORM:
// 
// class M
//   parameter Integer n = 1;
//   parameter Real A[1,1];
// end M;
// 
// 
// Found 0 components and 2 parameters.
// Error processing file: const7.mo
// Error: Cyclically dependent constants or parameters found in scope M: {n,A}
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
