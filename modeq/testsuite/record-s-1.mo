// This file tests that records work.
//
// THe implicit equation "x = 16" should not be counted as a "real"
// equation, as that would break the record restricion.

type Real = RealType;

record A
  Real x = 17;
end A;

model World
  A a(x=18);
end World;

// Equations:
//
//   a.x = 18
//
