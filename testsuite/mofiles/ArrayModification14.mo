// name:     ArrayModification14
// keywords: array,modification
// status:   incorrect
// 
// Partial indexing mixed with full indexing.
// Multiple modifiers of same element. 
// Error in the fact that the modifier of a matrix row is not an array!
// 

class ArrayModification6
  class A
    Real x[2,2];
  end A;
  A b(x[2] = 1.0, x[2,1] = 13.0); // not ok as in x[2]=1.0, 1.0 should be an array.
end ArrayModification6;

// Result:
// Error processing file: ArrayModification14.mo
// [ArrayModification14.mo:12:5-12:16:writable] Warning: Index modifications: (b.x[2] = 1.0, b.x[2,1] = 13.0) for array component: b.x are overlapping. 
// 	The final bindings will be set by the last modifications given for the same index.
// [ArrayModification14.mo:12:5-12:16:readonly] Warning: Variable b.x: Non-array modification '1.0' for array component, possibly due to missing 'each'.
// 
// [ArrayModification14.mo:12:5-12:16:writable] Error: Instantiation of array component: b.x failed because index modification: b(x[2]=1.0) is invalid. 
// 	Array component: b.x[2] has more dimensions than binding 1.0.
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
