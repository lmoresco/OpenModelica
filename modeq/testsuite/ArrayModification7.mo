// name:     ArrayModification7
// keywords: array,modification,unknown
// status:   incorrect
// 
// This tests array modifications where the index is an array, which
// means that the modification modifies a whole slice.
// 

class ArrayModification7
  class A
    Real x[5];
  end A;
  A a(x[2:4] = 1.0);
end ArrayModification7;

// fclass ArrayModification7
//   Real    a.x[1];
//   Real    a.x[2];
//   Real    a.x[3];
//   Real    a.x[4];
//   Real    a.x[5];
// equation
//   a.x[2] = 1.0;
//   a.x[3] = 1.0;
//   a.x[4] = 1.0;
// end ArrayModification7;
