
model World
  constant Real A = 5;
  constant Real B = A;
  constant Real C = B + 1;
  constant Integer D = 3;
  constant Integer E = D + 4;
  Real x[E] = 1:E;
end World;

// Equations:
//
//   A = 5
//   B = 5
//   C = 6
//
