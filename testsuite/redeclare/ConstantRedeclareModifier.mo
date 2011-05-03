// name:     ConstantRedeclareModifier
// keywords: redeclare, modification, constant
// status:   incorrect
// 
// Checks that it's not allowed to redeclare a component declared as constant.
// 

model m
  replaceable constant Real x;
end m;

model ConstantRedeclareModifier
  extends m(replaceable Real x = 2.0);
end ConstantRedeclareModifier;

// Result:
// Error processing file: ConstantRedeclareModifier.mo
// [ConstantRedeclareModifier.mo:13:13-13:37:writable] Notification: From here:
// [ConstantRedeclareModifier.mo:9:3-9:30:writable] Error: Redeclaration of constant component x is not allowed.
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
