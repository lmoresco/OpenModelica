// name:     ArrayModification10
// keywords: array,modification
// status:   correct
// 
// Double multi-dimensional modifications.
// 

class ArrayModification1
  class A
    Real x[2,2];
  end A;
  A a(x[2,1] = 1.0, x[2,2] = 2.0);
end ArrayModification1;

// fclass ArrayModification1
//   Real a.x[1,1];
//   Real a.x[1,2];
//   Real a.x[2,1];
//   Real a.x[2,2];
// equation
//   a.x[2,1] = 1.0;
//   a.x[2,2] = 2.0;
// end ArrayModification1;
