// name:     ArrayModification9
// keywords: array,modification
// status:   correct
// origstatus:   correct, incomplete model
// 
// Full indexing of a multidimensional array.
// 

class ArrayModification9
  class A
    Real x[2,2];
  end A;
  A a(x[1,2] = 2.0);
end ArrayModification9;

// Result:
// fclass ArrayModification9
//   Real a.x[1,1];
//   Real a.x[1,2] = 2.0;
//   Real a.x[2,1];
//   Real a.x[2,2];
// end ArrayModification9;
// endResult
