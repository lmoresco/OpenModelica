// name:     ArrayModification3
// keywords: array,modification
// status:   correct
// 

class ArrayModification3
  class A
    Real x[3];
  end A;
  A a(x[2].min = 1.0, x[2].start = 1.0);
end ArrayModification3;

// fclass ArrayModification3
//   Real a.x[1];
//   Real a.x[2];
//   Real a.x[3];
// equation
//   a.x[2].min = 1.0;
//   a.x[2].start = 1.0;
// end ArrayModification3;
