// The question is whether the last equation should be "b.x = C" or
// "b.c = A.C". I think the latter is more correct.

class A
  constant Real C = 17.0;
  class B
    Real x;
  equation
    x = C;
  end B;
  B b;
end A;

// Equations:
//
//  C = 17.0
//  b.x = A.C
//
