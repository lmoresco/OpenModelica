// name:     RedeclareVisibility
// keywords: redeclare, modification, constant
// status:   incorrect
// 
// Checks that it's not allowed to redeclare a protected element.
// 

model m
  protected replaceable Real x;
end m;

model RedeclareVisibility
  extends m(replaceable Real x = 2.0);
end RedeclareVisibility;

// Result:
// Error processing file: RedeclareVisibility.mo
// [RedeclareVisibility.mo:13:13-13:37:writable] Notification: From here:
// [RedeclareVisibility.mo:9:13-9:31:writable] Error: Redeclaration of protected component x is not allowed.
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
