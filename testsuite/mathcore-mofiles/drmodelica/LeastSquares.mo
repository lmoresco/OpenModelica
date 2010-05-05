// name:     LeastSquares
// keywords: external function, array
// status:   correct


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

// Result:
// function ls
// input Real A;
// input Real B;
// output Real Ares = A;
// output Real x;
// protected Integer lwork = min(size(A,1),size(A,2)) + 32 * max(max(size(A,1),size(A,2)),size(B,2));
// protected Real work;
// protected Integer info;
// protected String transposed = "NNNN";
// 
// external "C";
// end ls;
// 
// fclass LeastSquares
// Real in1[1,1] = 1.0;
// Real in1[1,2] = 3.0;
// Real in1[2,1] = 4.0;
// Real in1[2,2] = 1.0;
// Real in2[1,1] = 4.0;
// Real in2[1,2] = 2.0;
// Real in2[2,1] = 5.0;
// Real in2[2,2] = 3.0;
// Real x[1,1];
// Real x[1,2];
// Real x[2,1];
// Real x[2,2];
// equation
//   (x,_) = ls({{in1[1,1],in1[1,2]},{in1[2,1],in1[2,2]}},{{in2[1,1],in2[1,2]},{in2[2,1],in2[2,2]}});
// end LeastSquares;
// endResult
