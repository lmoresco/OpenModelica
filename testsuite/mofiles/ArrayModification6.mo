// name:     ArrayModification6
// keywords: array,modification
// status:   correct
// 
// Partial indexing mixed with full indexing.
// Multiple modifiers of same element.
// 

class ArrayModification6
  class A
    Real x[2,2];
  end A;
  A a(x[2] = {2.1, 2.2}, x[2,1] = 13.0); // warning but ok
end ArrayModification6;

// Result:
// class ArrayModification6
//   Real a.x[1,1];
//   Real a.x[1,2];
//   Real a.x[2,1] = 13.0;
//   Real a.x[2,2] = 2.2;
// end ArrayModification6;
// [ArrayModification6.mo:11:5-11:16:writable] Warning: Index modifications: (a.x[2] = {2.1,2.2}, a.x[2,1] = 13.0) for array component: a.x are overlapping. 
// 	The final bindings will be set by the last modifications given for the same index.
// 
// endResult
