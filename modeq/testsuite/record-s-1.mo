// This file tests that records work.
//
// THe implicit equation "x = 16" should not be counted as a "real"
// equation, as that would break the record restricion.

type Real = RealType;

record A
  Real x = 17.0;
end A;

model World
  A a(x=18.0);
end World;

// fclass World
//   Real a.x;
// equation
//   a.x = 18.0;
// end World;
