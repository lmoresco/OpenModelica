// name:     ArrayModification7
// keywords: array,modification
// status:   correct
// origstatus:   correct, incomplete model
// 
// This tests array modifications where the index is an array, which
// means that the modification modifies a whole slice.
// 

class ArrayModification7
  class A
    Real x[5];
  end A;
  A a(x[2:4] = {2,3,4.5});
end ArrayModification7;

// Result:
// fclass ArrayModification7
//   Real a.x[1];
//   Real a.x[2] = 2.0;
//   Real a.x[3] = 3.0;
//   Real a.x[4] = 4.5;
//   Real a.x[5];
// end ArrayModification7;
// endResult
