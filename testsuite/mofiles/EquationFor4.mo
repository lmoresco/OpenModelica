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

// fclass EquationFor4
// parameter Integer N = 4;
// Real p[1].i;
// Real p[1].v;
// Real p[2].i;
// Real p[2].v;
// Real p[3].i;
// Real p[3].v;
// Real p[4].i;
// Real p[4].v;
// equation 
//  p[1].v = p[2].v;
//  p[2].v = p[3].v;
//  p[3].v = p[4].v;
//  -p[1].i + -p[2].i + -p[3].i + -p[4].i = 0.0;
// end EquationFor4;