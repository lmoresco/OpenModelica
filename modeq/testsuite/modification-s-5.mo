//
// This file tests equation modifications, and in particular what
// happens if the variable is being used on the right-hand side.
//
// I don't think this is an error, so no error or warning message
// should be produced. The type checker should, for instance know how
// the variable is declared.

class A
  Real x = 17 + x;
end A;

// Equations
//
//   x = real(17) +(real) x
//
