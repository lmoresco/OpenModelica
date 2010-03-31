// name:     ArrayModification6
// keywords: array,modification
// status:   incorrect
// 
// Partial indexing mixed with full indexing.
// Multiple modifiers of same element.
// 

class ArrayModification6
  class A
    Real x[2,2];
  end A;
  A a(x[2] = 1.0, x[2,1] = 2.0);
end ArrayModification6;

// Result:
// fclass ArrayModification6
//   Real a.x[1,1];
//   Real a.x[1,2];
//   Real a.x[2,1];
//   Real a.x[2,2];
// equation
//   a.x[2,1] = 1.0;
//   a.x[2,2] = 1.0;
//   a.x[2,1] = 2.0;
// end ArrayModification6;
// endResult
