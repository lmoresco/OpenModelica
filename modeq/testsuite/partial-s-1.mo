// This file will make the translater fall into infinite recursion.

// Equations:
//
//

class A

  class B
    A x;
  equation
    x.y = 1;
  end B;

  // Commented out for now
  // B b;
  Real y;
end A;
