// name:     EquationFor2
// keywords: equation,array
// status:   correct
// 
// Test for loops in equations.
// 

class EquationFor2
  constant Integer N = 4;
  Real a[N];
equation
  a[1] = 1.0;
  for i in 1:N-1 loop
    a[i+1] = a[i] + 1.0;
  end for;
end EquationFor2;

// fclass EquationFor2
//   constant Integer N;
//   Real a[1];
//   Real a[2];
//   Real a[3];
//   Real a[4];
// equation
//   N = 4;
//   a[1] = 1.0;
//   a[1 + 1] = a[1] + 1.0;
//   a[2 + 1] = a[2] + 1.0;
//   a[3 + 1] = a[3] + 1.0;
// end EquationFor2;
