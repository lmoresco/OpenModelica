// name:     Overwriting2
// keywords: modification,equation,unknown
// status:   correct
// 
// The modification for `x' does not overwrite the equation.  Or does it?
//

class Overwriting2
  Real x = 5.0;
equation
  x = 2.0;
end Overwriting2;

// fclass Overwriting2
//   Real x;
// equation
//   x = 5.0;
//   x = 2.0;
// end Overwriting2;
