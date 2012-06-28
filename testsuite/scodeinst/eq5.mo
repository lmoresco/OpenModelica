// name: eq5.mo
// keywords:
// status: correct
//

model A
  constant Integer j;
  package P
    constant Integer i = j;
  end P;
end A;

model B
  A a[3](j = {1, 2, 3});
  Real x[3], y[3];
equation
  x = a.P.i .* y;
end B;

// Result:
// 
// EXPANDED FORM:
// 
// class B
//   Real x[1];
//   Real x[2];
//   Real x[3];
//   Real y[1];
//   Real y[2];
//   Real y[3];
// equation
//   x[1] = 1 * y[1];
//   x[2] = 2 * y[2];
//   x[3] = 3 * y[3];
// end B;
// 
// 
// Found 6 components and 0 parameters.
// class B
//   constant Integer a[1].j = 1;
//   constant Integer a[2].j = 2;
//   constant Integer a[3].j = 3;
//   Real x[1];
//   Real x[2];
//   Real x[3];
//   Real y[1];
//   Real y[2];
//   Real y[3];
// equation
//   x[1] = y[1];
//   x[2] = y[2];
//   x[3] = y[3];
// end B;
// endResult
