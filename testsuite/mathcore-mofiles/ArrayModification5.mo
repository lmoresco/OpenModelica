// name:     ArrayModification5
// keywords: array,modification
// status:   correct
// 
// Partial indexing is allowed, see specification v3.0 section 7.2.5.
// 

class ArrayModification5
  class A
    Real x[2,2];
  end A;
  A a(x[2] = {1.0,2.0});
end ArrayModification5;

// fclass ArrayModification5
// Real a.x[1,1];
// Real a.x[1,2];
// Real a.x[2,1] = 1.0;
// Real a.x[2,2] = 2.0;
// end ArrayModification5;
