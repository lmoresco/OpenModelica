// name:     Overwriting1
// keywords: modification,equation,unknown
// status:   correct
// 
// The modification for 'x' replaces the equation in the original
// class. Or maybe not.
//

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
