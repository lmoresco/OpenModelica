// name:     XPowers2
// keywords: equation
// status:   correct
// 
// The powers of 'x' are defined by using a for loop. The dimension 'n'
// needs to be fixed in order to expand the formulation. Furthermore 'n'
// is treated fixed in the declaration of 'xpowers'.
//

model XPowers2
  Integer i;
  constant Integer n = 3;
  Real x = 2.0, xpowers[n];
equation
  xpowers[1] = x;
  for i in 1:n-1 loop
    xpowers[i+1] = xpowers[i] * x;
  end for;
end XPowers2;

// fclass XPowers2
//   Integer i;
//   constant Integer n;
//   Real x;
//   Real xpowers[1];
//   Real xpowers[2];
//   Real xpowers[3];
// equation
//   n = 3;
//   x = 2.0;
//   xpowers[1] = x;
//   xpowers[1 + 1] = xpowers[1] * x;
//   xpowers[2 + 1] = xpowers[2] * x;
// end XPowers2;
