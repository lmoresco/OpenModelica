// name:     Overwriting1
// keywords: modification,equation
// status:   correct
// 
// The modification does not overwrite the equation

partial class A
  Real x, u;
equation
  x = 2.0 * u;
end A;

class Overwriting1 = A(x = 5.0);

// fclass Overwriting1
//   Real x;
//   Real u;
// equation
//   x = 5.0;
//   x = 2.0 * u;
// end Overwriting1;
