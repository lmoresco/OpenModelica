// name:Test16.mo 
// keywords:  This tests the array statements with alternative declaration
// status: correct
 
 class Arraytest2
  Real n = 1, m = 4, k = 5;
  Real    Voltage;
  Real[3]    positionvector   = {1, 2, 3};
  Real[3,3]    identitymatrix = {{1, 0, 0}, {0, 1, 0}, {0, 0, 1}};
  Integer arr3d[n,m,k];
  Boolean[2] truthvalues     = {false, true};
  Voltage[10] voltagevector;
end Arraytest2;


// succeed
// omcc- v.2012