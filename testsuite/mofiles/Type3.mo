// name:     Type3
// keywords: type
// status:   incorrect
// 
// This should give a type error because the expression i/4 is of
// type Real.

class Type3
  Integer i = 16;
  Real x[100];
equation
  x[i/4] = 0.5;
end Type3;
// Result:
// Error processing file: Type3.mo
// [Type3.mo:12:3-12:15:writable] Error: Illegal subscript [i / 4] for dimensions 100 in component <NO COMPONENT>
// [Type3.mo:12:3-12:15:writable] Error: Variable x[i / 4] not found in scope Type3
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
