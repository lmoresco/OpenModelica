// name:     ArrayModification6
// keywords: array,modification
// status:   erroneous
// 
// Partial indexing mixed with full indexing.
// Multiple modifiers of same element.
// 

class ArrayModification6
  class A
    Real x[2,2];
  end A;
  A a(x[2] = 1.0, x[2,1] = 2.0);
end ArrayModification6;

// Result:
// TODO: Needs real error message
// Error processing file: ArrayModification6.mo
// [ArrayModification6.mo:11:5-11:16:readonly] Warning: Variable a.x: Non-array modification '1.0' for array component, possibly due to missing 'each'.
// 
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
