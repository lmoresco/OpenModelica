// name:     XPowers3
// keywords: equation
// status:   incorrect
// 
// The powers of 'x' are defined by using a for loop. The dimension 'n'
// is defined with a constant value but not declared constant. The integer 'n' 
// must be declared as constant or parameter.

model XPowers3
  Integer n = 3;
  Real x = 2.0, xpowers[n];
equation
  xpowers[1] = x;
  for i in 1:n-1 loop
    xpowers[i+1] = xpowers[i] * x;
  end for;
end XPowers3;
