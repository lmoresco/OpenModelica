// name: mod3.mo
// keywords:
// status: incorrect
// cflags:   +d=scodeInst
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
// [mod3.mo:14:7-14:15:writable] Error: Subscripted modifier is illegal.
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
