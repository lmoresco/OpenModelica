// name:     EquationFor4
// keywords: equation,array, connect
// status:   correct
// 
// Test for loops in connections.  The size is a parameter.
// 

connector Pin 
  flow Real i;
  Real v;
end Pin;

class EquationFor4
  parameter Integer N = 4;
  Pin p[N];
equation
  for i in 1:N-1 loop
    connect(p[i],p[i+1]);
  end for;
end EquationFor3;

// fclass EquationFor3
// parameter Integer N = 4;
// Real a[1];
// Real a[2];
// Real a[3];
// Real a[4];
// equation
//   a[1] = 1.0;
//   a[2] = a[1] + 1.0;
//   a[3] = a[2] + 1.0;
//   a[4] = a[3] + 1.0;
// end EquationFor3;
