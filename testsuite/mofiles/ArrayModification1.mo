// name:     ArrayModification1
// keywords: array,modification
// status:   correct
// origstatus:   correct,incomplete model
// 
// Simple equation modification of array elements.
// 

class ArrayModification1
  class A
    Real x[3];
  end A;
  A a(x[2] = 1.0);
end ArrayModification1;

// fclass ArrayModification1
//   Real a.x[1];
//   Real a.x[2];
//   Real a.x[3];
// equation
//   a.x[2] = 1.0;
// end ArrayModification1;
