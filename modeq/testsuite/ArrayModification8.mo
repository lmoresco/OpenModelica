// name:     ArrayModification8
// keywords: array,modification,unknown
// status:   correct
// 
// This tests array modifications where the whole array is equated to
// an array expression.
// 

class ArrayModification8
  class A
    Real x[3];
  end A;
  A a(x = [1.0,2.0,3.0]);
end ArrayModification8;

// fclass ArrayModification8
//   Real    a.x[1];
//   Real    a.x[2];
//   Real    a.x[3];
// equation
//   a.x[1] = 1.0;
//   a.x[2] = 2.0;
//   a.x[3] = 3.0;
// end ArrayModification8;
