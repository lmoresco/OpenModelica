// name:     ArrayModification2
// keywords: array,modification
// status:   correct
// origstatus:   correct,incomplete model
// 
// Simple equation modification of array elements.
// 

class ArrayModification2
  class A
    Real x[3];
  end A;
  A a(x[2] = 1.0, x[3] = 2.0);
end ArrayModification2;

// Result:
// fclass ArrayModification2
//   Real a.x[1];
//   Real a.x[2];
//   Real a.x[3];
// equation
//   a.x[2] = 1.0;
//   a.x[3] = 2.0;
// end ArrayModification2;
// endResult
