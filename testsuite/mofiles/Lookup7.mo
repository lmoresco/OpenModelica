// name:     Lookup7
// keywords: scoping
// status:   incorrect
// 
// Modelica uses lexical scoping.
// 

class A
  Real x = y;
end A;

class Lookup7
  Real y;
  A a;
end Lookup7;
// Result:
// Error processing file: Lookup7.mo
// [Lookup7.mo:14:3-14:6:readonly] Error: Variable a: Variable y not found in scope A
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
