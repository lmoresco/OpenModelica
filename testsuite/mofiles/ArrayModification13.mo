// name:     ArrayModification13
// keywords: array,modification
// status:   correct
// 
// Partial indexing mixed with array binding.
// Multiple modifiers of the array elements vs. the entire array .
// 

class C1
  Real x[3];
end C1;

class C2 = C1(x=ones(3), x[2]=2); // Error: x[2] designated twice

// Result:
// class C2
//   Real x[1] = 1.0;
//   Real x[2] = 2.0;
//   Real x[3] = 1.0;
// end C2;
// [ArrayModification13.mo:10:3-10:12:writable] Warning: Index modifications: (x[2] = 2) are overlapping with array binding modification x={1,1,1} for array component: x. 
// 	The final bindings will be set by the last index modification given for the same index.
// 
// endResult
