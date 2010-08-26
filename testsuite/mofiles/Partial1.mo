// name:     Partial1
// keywords: partial
// status:   incorrect
// 
// This is a test of the `partial' keyword.  The class `A' is declared
// as `partial' which means that it cannot be instantiated.
// 

partial class A
  Real x;
end A;

model Partial1
  A a;
end Partial1;
// Result:
// Error processing file: Partial1.mo
// [Partial1.mo:14:3-14:6:readonly] Error: Variable a: Illegal to instantiate partial class A
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
