//|name:     Overwriting1
//|keywords: modification,equation
//|status:   correct
// 
// The modification for 'x' replaces the equation in the original class.
//

partial class A
  Real x, u;
equation
  x = 2.0 * u;
end A;

class Overwriting1 = A(x = 5.0);

// fclass Overwriting1
//   Real x;
//   String x.unit;
//   Real u;
//   String u.unit;
// equation
//   x = 5.0;
// end Overwriting1;
