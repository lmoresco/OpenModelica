// name:     Scalar
// keywords: array, scalar
// status:   correct
// 
// Tests the scalar dimensionality conversion function.
// 

model Scalar
  Real r1 = scalar({3});
  Real r2 = scalar({{4}});
  Real r3 = scalar({{{5}}});
  Real r4 = scalar([6]);
end Scalar;

// Result:
// class Scalar
//   Real r1 = 3.0;
//   Real r2 = 4.0;
//   Real r3 = 5.0;
//   Real r4 = 6.0;
// end Scalar;
// endResult
