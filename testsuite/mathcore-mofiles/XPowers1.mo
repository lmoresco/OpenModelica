// name:     XPowers1
// keywords: equation,array
// status:   correct
// 
// The powers of 'x' are defined by using array syntax. The dimension  
// 'n' needs to be fixed in order to expand the formulation. 
// Furthermore 'n' is treated fixed in the declaration of 'xpowers'.
//
// This also uses multiplication of an array with a scalar.
//

model XPowers1
  constant Integer n = 3;
  Real x = 2.0, xpowers[n];
equation
  xpowers[1] = x;
  xpowers[2:n] = xpowers[1:n-1] * x;
end XPowers1;

// Result:
// fclass XPowers1
// constant Integer n = 3;
// Real x = 2.0;
// Real xpowers[1];
// Real xpowers[2];
// Real xpowers[3];
// equation
//   xpowers[1] = x;
//   xpowers[2] = x * xpowers[1];
//   xpowers[3] = x * xpowers[2];
// end XPowers1;
// endResult
