// name:     XPowers1
// keywords: equation
// status:   correct
// 
// The powers of 'x' are defined by using array syntax. The dimension  
// 'n' needs to be fixed in order to expand the formulation. 
// Furthermore 'n' is treated fixed in the declaration of 'xpowers'.
//

model XPowers1
  constant Integer n = 3;
  Real x = 2.0, xpowers[n];
equation
  xpowers[1] = x;
  xpowers[2:n] = xpowers[1:n-1] * x;
end XPowers1;

// fclass XPowers1
//   Integer n;
//   Real x;
//   Real xpowers[3];
// equation
//   n = 3;
//   x = 2.0;
//   xpowers[1] = x;
//   xpowers[2] = xpowers[1] * x;
//   xpowers[3] = xpowers[2] * x;
// end XPowers1;
