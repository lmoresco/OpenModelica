// name:     ArrayModification2
// keywords: array, modification
// status:   incorrect
// 
// Subscripted modifiers are not allowed.
// 

class ArrayModification2
  class A
    Real x[3];
  end A;
  
  extends A(x[2] = 1.0);
end ArrayModification2;

// Result:
// Error processing file: ArrayModification2.mo
// [ArrayModification2.mo:13:13-13:23:writable] Error: Subscripted modifier is illegal.
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
