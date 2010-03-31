// name:     ArrayModification11
// keywords: array,modification,unknown
// status:   correct
// 
// Partial indexing
// 

class ArrayModification11
  class A
    Real x[2,2];
  end A;
  A a(x = [1.0,2.0;3.0,4.0]);
end ArrayModification11;

// Result:
// fclass ArrayModification11
// Real a.x[1,1] = 1.0;
// Real a.x[1,2] = 2.0;
// Real a.x[2,1] = 3.0;
// Real a.x[2,2] = 4.0;
// end ArrayModification11;
// endResult
