
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
//  A.b.x = A.C
//
