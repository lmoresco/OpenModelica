//|name:     Overwriting3
//|keywords: modification,equation
//|status:   correct
// 
// The initialization for 'x' does not overwrite the algorithm.
//

class Overwriting3
  Real x = 5.0;
algorithm
  x := 2.0;
end Overwriting3;

// fclass Overwriting3
//   Real x;
//   String x.unit;
// equation
//   x = 5.0;
// algorithm
//   x := 2.0;
// end Overwriting3;
