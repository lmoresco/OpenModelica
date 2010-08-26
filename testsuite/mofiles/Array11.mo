// name:     Array11
// keywords: matrix
// status:   correct
// 
// Fixes bug #38
// 

model Array11
  Real y[:,:] = [1;2];
end Array11;

// Result:
// class Array11
// Real y[1,1] = 1.0;
// Real y[2,1] = 2.0;
// end Array11;
// endResult
