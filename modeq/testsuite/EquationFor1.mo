// name:     EquationFor1
// keywords: equation,array
// status:   correct
// 
// Test for loops in equations.
// 

class EquationFor1
  Real a[5];
protected
  Integer i;
equation
  a[1] = 1.0;
  for i in [2,3,4,5] loop
    a[i] = a[i-1] + 1.0;
  end for;
end EquationFor1;

// fclass EquationFor1
//   Integer i;
//   Real a[1];
//   Real a[2];
//   Real a[3];
//   Real a[4];
//   Real a[5];
// equation
//   a[1] = 1.0;
//   a[2] = a[1] + 1.0;
//   a[3] = a[2] + 1.0;
//   a[4] = a[3] + 1.0;
//   a[5] = a[4] + 1.0;
// end EquationFor1;
