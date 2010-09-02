// name:     Reductions
// keywords: reductions
// status:   correct
// 
// Tests flattening of non-constant reductions.
// 

model Reductions
  parameter Integer n = 5;
  Real A[n];
  Real B[n];
  Real c;
  Real d;
  Real e;
  Real f;
equation
  c = sum(A[i]^2 + B[i]^2 for i in 1:n);
  d = product(A[i]^2 + B[i]^2 for i in 1:n);
  e = max(A[i]^2 + B[i]^2 for i in 1:n);
  f = min(A[i]^2 + B[i]^2 for i in 1:n);
end Reductions;

// Result:
// class Reductions
//   parameter Integer n = 5;
//   Real A[1];
//   Real A[2];
//   Real A[3];
//   Real A[4];
//   Real A[5];
//   Real B[1];
//   Real B[2];
//   Real B[3];
//   Real B[4];
//   Real B[5];
//   Real c;
//   Real d;
//   Real e;
//   Real f;
// equation
//   c = A[1] ^ 2.0 + (B[1] ^ 2.0 + (A[2] ^ 2.0 + (B[2] ^ 2.0 + (A[3] ^ 2.0 + (B[3] ^ 2.0 + (A[4] ^ 2.0 + (B[4] ^ 2.0 + (A[5] ^ 2.0 + B[5] ^ 2.0))))))));
//   d = (A[1] ^ 2.0 + B[1] ^ 2.0) * ((A[2] ^ 2.0 + B[2] ^ 2.0) * ((A[3] ^ 2.0 + B[3] ^ 2.0) * ((A[4] ^ 2.0 + B[4] ^ 2.0) * (A[5] ^ 2.0 + B[5] ^ 2.0))));
//   e = <reduction>max(A[i] ^ 2.0 + B[i] ^ 2.0 for i in 1:n);
//   f = <reduction>min(A[i] ^ 2.0 + B[i] ^ 2.0 for i in 1:n);
// end Reductions;
// endResult
