// This should fail. Either because the variable y is not
// instantiated, or, even better, because A does not meet the
// requirements for a package

class A
  Real y;
  class B
    Real x;
  equation
    x = y;
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
