// name:     ArrayModification12
// keywords: array,modification,unknown
// status:   correct
// 
// This tests array modifications where the index is an array, which
// means that the modification modifies a whole slice.  Thus, the
// expression in the modification should be a vector of reals.
// 

class ArrayModification12
  class A
    Real x[5];
  end A;
  A a(x[2:4] = [1.0,2.0,3.0]);
end ArrayModification12;

// fclass ArrayModification12
//   Real a.x[1];
//   Real a.x[2];
//   Real a.x[3];
//   Real a.x[4];
//   Real a.x[5];
// equation
//   a.x[2] = 1.0;
//   a.x[3] = 2.0;
//   a.x[4] = 3.0;
// end ArrayModification12;
