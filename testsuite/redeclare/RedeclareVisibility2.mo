// name:     RedeclareVisibility2
// keywords: redeclare, modification, constant
// status:   incorrect
// 
// Checks that it's not allowed to redeclare a protected element.
// 

model M
  protected replaceable Real x;
end M;

model RedeclareVisibility2
  M m(replaceable Real x = 2.0);
end RedeclareVisibility2;

// Result:
// Error processing file: RedeclareVisibility2.mo
// [RedeclareVisibility2.mo:13:3-13:32:writable] Notification: From here:
// [RedeclareVisibility2.mo:9:13-9:31:writable] Error: Redeclaration of protected component x is not allowed.
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
