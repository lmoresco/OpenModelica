// name:     ArrayModification7
// keywords: array,modification,unknown
// status:   incorrect
// 
// This tests array modifications where the index is an array, which
// means that the modification modifies a whole slice.  Thus, the
// expression in the modification should be a vector of reals.
// 

class ArrayModification7
  class A
    Real x[5];
  end A;
  A a(x[2:4] = 1.0);
end ArrayModification7;
