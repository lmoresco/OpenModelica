// name:     ABCDsystem
// keywords: array
// status:  incorrect
// 
// Using empty arrays.
// 

model ABCDsystem
  parameter Integer n = 0;
  Real u[5] = {15, 4, 3, 9, 11};
  Real x[n];
  Real y[3];
  Real A[n, n], B[n, 5], C[3, n];
  Real D[3, 5] = fill(1, 3, 5);
equation
  der(x) = A*x + B*u;             // This will disappear since x is empty 
  y = C*x + D*u;                  // Which is: y = D*u
end ABCDsystem;


