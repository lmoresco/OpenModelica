// name:     Constant1
// keywords: declaration
// status:   correct
// 
// Basic constant definitions.
// 

class Constant1
  constant Real PI = 3.14159265358979;
  constant Integer N = 17;
  Real x;
equation
  x = 2.0 * PI;
end Constant1;

// fclass Constant1
//   constant Real PI;
//   constant Integer N;
//   Real x;
// equation
//   PI = 3.14159265358979;
//   N = 17;
//   x = 2.0 * PI;
// end Constant1;
