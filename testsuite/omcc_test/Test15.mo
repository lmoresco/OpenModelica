// name:Test15.mo
// keywords: This tests the array statements declaration
// status: correct
 
 class Arraytest2
  Real n = 1, m = 4, k = 5;
  Real    Voltage;
  Real    positionvector[3]   = {1, 2, 3};
  Real    identitymatrix[3,3] = {{1, 0, 0}, {0, 1, 0}, {0, 0, 1}};
  Integer arr3d[n,m,k];
  Boolean truthvalues[2]     = {false, true};
  Voltage voltagevector[10];
end Arraytest2;


// succeed
// omcc- v.2012