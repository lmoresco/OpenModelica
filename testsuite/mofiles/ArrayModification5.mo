// name:     ArrayModification5
// keywords: array,modification
// status:   incorrect
// 
// Partial indexing is not allowed.
// 

class ArrayModification5
  class A
    Real x[2,2];
  end A;
  A a(x[2] = {1.0,2.0});
end ArrayModification5;

// fclass ArrayModification5
//   Real    a.x[1,1];
//   Real    a.x[1,2];
//   Real    a.x[2,1];
//   Real    a.x[2,2];
// equation
//   a.x[2,1] = 1.0;
//   a.x[2,2] = 2.0;
// end ArrayModification5;
