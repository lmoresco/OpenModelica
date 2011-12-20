// name:     ArrayModification1
// keywords: array, modification
// status:   incorrect
// 
// Subscripted modifiers are not allowed.
// 

class ArrayModification1
  class A
    Real x[3];
  end A;
  A a(x[2] = 1.0);
end ArrayModification1;

// Result:
// Error processing file: ArrayModification1.mo
// [ArrayModification1.mo:12:7-12:17:writable] Error: Subscripted modifier is illegal.
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
