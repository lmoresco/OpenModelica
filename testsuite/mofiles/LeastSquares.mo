// name:     LeastSquares
// keywords: external function, array
// status:   correct
//
// Drmodelica: 9.2 External Functions (p. 311)
// 

function ls "Solves a linear least squares problem"
  input Real A[:,:];
  input Real B[:,:];
  output Real Ares[size(A,1), size(A,2)] = A;
  output Real x[size(A,2), size(B,2)];

protected
  Integer lwork = min(size(A,1),size(A,2)) + max(max(size(A,1),size(A,2)),size(B,2))*32;
  Real work[lwork];
  Integer info;
  String transposed = "NNNN";  // Workaround for passing character data to Fortran routine
  external "FORTRAN 77"
   dgesl(transposed, 100, size(A,1), size(A,2), size(B,2), Ares, size(A,1), B, size(B,1), work, lwork, info);
end ls;

model LeastSquares
  Real in1[2,2]={{1,3}, {4,1}};
  Real in2[2,2]={{4,2}, {5,3}};
  Real x[2,2];

equation
  x = ls(in1, in2);
end LeastSquares;
