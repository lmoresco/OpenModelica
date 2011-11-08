// name:     RedeclareModifierInvalid2
// keywords: redeclare, modification, replaceable
// status:   incorrect
// 
// Checks that the redeclared class needs to be replaceable.
// 

model m
  model m2 end m2;
end m;

model RedeclareModifierInvalid2
  model m3 end m3;
  extends m(redeclare model m2 = m3);
end RedeclareModifierInvalid2;

// Result:
// Error processing file: RedeclareModifierInvalid2.mo
// [RedeclareModifierInvalid2.mo:14:3-14:37:writable] Notification: From here:
// [RedeclareModifierInvalid2.mo:9:3-9:18:writable] Error: Trying to redeclare model m2 but model not declared as replaceable
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
