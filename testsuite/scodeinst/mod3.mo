// name: mod3.mo
// keywords:
// status: incorrect
//


model A
  Real x[2];
end A;

model B
  input Integer n;
  A a(x[n] = 2);
end B;

// Result:
// Error processing file: mod3.mo
// [mod3.mo:13:7-13:15:writable] Error: Subscripted modifier is illegal.
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
