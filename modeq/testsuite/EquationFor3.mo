// name:     EquationFor3
// keywords: equation,array
// status:   correct
// 
// Test for loops in equations.  The size is a parameter.
// 

class EquationFor3
  parameter Integer N = 4;
  Real a[N];
protected
  Integer i;
equation
  a[1] = 1.0;
  for i in 1:N-1 loop
    a[i+1] = a[i] + 1.0;
  end for;
end EquationFor3;

// fclass EquationFor3
//   Integer i;
//   parameter Integer N;
//   Real a[1];
//   Real a[2];
//   Real a[3];
//   Real a[4];
// equation
//   N = 4;
//   a[1] = 1.0;
//   a[2] = a[1] + 1.0;
//   a[3] = a[2] + 1.0;
//   a[4] = a[3] + 1.0;
// end EquationFor3;
