
class A
  constant Real C = 17.0;
  class B
    Real x;
  equation
    x = C;
  end B;
  B b;
end A;

class M
  A.B b;
end M;


// Equations:
//
//  M.b.x = A.C
//
