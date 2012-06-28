// name: func6.mo
// keywords:
// status: incorrect
//

model A
  Real x;
end A;

function f
  input A a;
  output Real x;
algorithm
  x := a.x;
end f;

model M
  A a;
  Real x = f(a);
end M;

// Result:
// SCodeInst.instFunction failed: f
// Error processing file: func6.mo
// [func6.mo:11:3-11:12:writable] Error: Invalid type A for function component a.
// Error: Error occurred while flattening model M
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
