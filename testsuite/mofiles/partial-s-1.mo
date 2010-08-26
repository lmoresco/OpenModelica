// name:     partial-s-1
// keywords: local class, declaration
// status:   incorrect

// Creating a dependency in the instantiation should give an error, not hang 
// the compiler

class A

  class B
    A x;
  equation
    x.y = 1;
  end B;

  // Commented out for now
   B b;
  Real y;
end A;

// Result:
// enter error message here
// endResult
