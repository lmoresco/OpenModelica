// name: redeclare1.mo
// keywords:
// status: incorrect
// cflags:   +d=scodeInst
//


model A
  replaceable Real x;
end A;

model B
  A a(redeclare model x = A);
end B;

model C
  replaceable model M = A;
end C;

model D
  extends C(redeclare Real M);
end D;

// Result:
// Error processing file: redeclare1.mo
// [redeclare1.mo:21:3-21:30:writable] Notification: From here:
// [redeclare1.mo:17:15-17:26:writable] Error: Invalid redeclaration of model M as a component.
// Error: Error occurred while flattening model D
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
