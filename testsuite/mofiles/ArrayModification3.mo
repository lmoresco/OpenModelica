// name:     ArrayModification3
// keywords: array,modification
// status:   correct
// origstatus:   correct,incomplete model
// 

record R
  Real a,b;
end R;

class ArrayModification3
  class A
    R x[3];
  end A;
  A a(x[2].a = 1.0, x[2].b = 1.0);
end ArrayModification3;

// Result:
// fclass ArrayModification3
//   Real a.x[1].a;
//   Real a.x[1].b;
//   Real a.x[2].a;
//   Real a.x[2].b;
//   Real a.x[3].a;
//   Real a.x[3].b;
// equation
//   a.x[2].a = 1.0;
//   a.x[2].b = 1.0;
// end ArrayModification3;
// endResult
