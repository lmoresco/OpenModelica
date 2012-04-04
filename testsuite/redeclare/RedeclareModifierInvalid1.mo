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
// [RedeclareModifierInvalid1.mo:13:3-13:38:writable] Notification: From here:
// [RedeclareModifierInvalid1.mo:9:3-9:9:writable] Error: Trying to redeclare component x but component not declared as replaceable
// Error: Error occurred while flattening model RedeclareModifierInvalid1
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
