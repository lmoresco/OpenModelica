// name:     RedeclareModifierInvalid1
// keywords: redeclare, modification, replaceable
// status:   incorrect
// 
// Checks that the redeclared component needs to be replaceable.
// 

model m
  Real x;
end m;

model RedeclareModifierInvalid1
  extends m(replaceable Real x = 2.0);
end RedeclareModifierInvalid1;

// Result:
// Error processing file: RedeclareModifierInvalid1.mo
// [RedeclareModifierInvalid1.mo:13:13-13:37:writable] Notification: From here:
// [RedeclareModifierInvalid1.mo:9:3-9:9:writable] Error: Trying to redeclare component x but component not declared as replaceable
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
