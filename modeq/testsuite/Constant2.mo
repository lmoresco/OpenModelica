// name:     Constant2
// keywords: declaration,type
// status:   correct
// 
// Constants and their use in expressions. This tests that the
// translator checks that the equation modifications are constant.
// 

model Constant2
  constant Real A = 5.0;
  constant Real B = A;
  constant Real C = B + 1.0;
  constant Real D = C - A;
  constant Integer E = 3;
  constant Integer F = E + 4;
end Constant2;

// fclass Constant2
//   constant Real A;
//   constant Real B;
//   constant Real C;
//   constant Real D;
//   constant Integer E;
//   constant Integer F;
// equation
//   A = 5.0;
//   B = A;
//   C = B + 1.0;
//   D = C - A;
//   E = 3;
//   F = E + 4;
// end Constant2;
