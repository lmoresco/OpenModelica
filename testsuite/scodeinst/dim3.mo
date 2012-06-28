// name: dim3.mo
// keywords:
// status: incorrect
//


model A
  parameter Integer n;
  Real x[n] = {1, 2, 3};
end A;

// Result:
// 
// EXPANDED FORM:
// 
// class A
//   parameter Integer n;
// end A;
// 
// 
// Found 0 components and 1 parameters.
// Error processing file: dim3.mo
// Warning: Parameter n has neither value nor start value, and is fixed during initialization (fixed=true)
// [dim3.mo:9:3-9:24:writable] Error: Array dimension must be integer expression in n which has type Integer
// Warning: Parameter n has neither value nor start value, and is fixed during initialization (fixed=true)
// [dim3.mo:9:3-9:24:writable] Error: Array dimension must be integer expression in n which has type Integer
// Error: Error occurred while flattening model A
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
