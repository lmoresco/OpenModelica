// name:     Modification9
// keywords: modification,equation,array
// status:   incorrect
// 
// Two arguments of a modifier shall not designate the same element.
//

class E
  Real x[3,3] = zeros(3,3);
end E;

class Modification9 = E(x=identity(3), x[1]=2); // Error: x[1] defined twice

// Result:
// Error processing file: Modification9.mo
// [Modification9.mo:9:3-9:27:writable] Warning: Index modifications: (x[1] = 2) are overlapping with array binding modification x={{1,0,0},{0,1,0},{0,0,1}} for array component: x. 
// 	The final bindings will be set by the last index modification given for the same index.
// [Modification9.mo:9:3-9:27:readonly] Warning: Variable x: Non-array modification '2' for array component, possibly due to missing 'each'.
// 
// [Modification9.mo:9:3-9:27:writable] Error: Instantiation of array component: x failed because index modification: (x[1]=2) is invalid. 
// 	Array component: x[1] has more dimensions than binding 2.
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
