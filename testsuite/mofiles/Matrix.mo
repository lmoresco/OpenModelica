// name:     Matrix
// keywords: array, matrix
// status:   correct
// 
// Tests the matrix dimensionality conversion function.
// 

model Matrix
  Real r1[:,:] = matrix(2.0);
  Real r2[:,:] = matrix({1, 2, 3});
  Real r3[:,:] = matrix([1, 2, 3; 4, 5, 6; 7, 8, 9]);
  Real r4[:,:] = matrix([{1},{2},{3};{4},{5},{6}]);
  Real r5[:,:] = matrix([{{1}},{{2}},{{3}};{{4}},{{5}},{{6}}]);
end Matrix;

// Result:
// class Matrix
//   Real r1[1,1] = 2.0;
//   Real r2[1,1] = 1.0;
//   Real r2[2,1] = 2.0;
//   Real r2[3,1] = 3.0;
//   Real r3[1,1] = 1.0;
//   Real r3[1,2] = 2.0;
//   Real r3[1,3] = 3.0;
//   Real r3[2,1] = 4.0;
//   Real r3[2,2] = 5.0;
//   Real r3[2,3] = 6.0;
//   Real r3[3,1] = 7.0;
//   Real r3[3,2] = 8.0;
//   Real r3[3,3] = 9.0;
//   Real r4[1,1] = 1.0;
//   Real r4[1,2] = 2.0;
//   Real r4[1,3] = 3.0;
//   Real r4[2,1] = 4.0;
//   Real r4[2,2] = 5.0;
//   Real r4[2,3] = 6.0;
//   Real r5[1,1] = 1.0;
//   Real r5[1,2] = 2.0;
//   Real r5[1,3] = 3.0;
//   Real r5[2,1] = 4.0;
//   Real r5[2,2] = 5.0;
//   Real r5[2,3] = 6.0;
// end Matrix;
// endResult
