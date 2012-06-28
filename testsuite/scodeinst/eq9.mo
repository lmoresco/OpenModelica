// name: eq9.mo
// keywords:
// status: correct
//
//

model A
  constant Integer j;
  package P
    constant Integer i = j;
  end P;
end A;

model B
  A a[3];
  Real x[3], y[3];
equation
  x = a.P.i .* y;
end B;

model C
  B b[2](each a(j = {1, 2, 3}));
end C;

// Result:
// 
// EXPANDED FORM:
// 
// class C
//   Real b[1].x[1];
//   Real b[1].x[2];
//   Real b[1].x[3];
//   Real b[1].y[1];
//   Real b[1].y[2];
//   Real b[1].y[3];
//   Real b[2].x[1];
//   Real b[2].x[2];
//   Real b[2].x[3];
//   Real b[2].y[1];
//   Real b[2].y[2];
//   Real b[2].y[3];
// equation
//   b[1].x[1] = 1 * b[1].y[1];
//   b[1].x[2] = 2 * b[1].y[2];
//   b[1].x[3] = 3 * b[1].y[3];
//   b[2].x[1] = 1 * b[2].y[1];
//   b[2].x[2] = 2 * b[2].y[2];
//   b[2].x[3] = 3 * b[2].y[3];
// end C;
// 
// 
// Found 12 components and 0 parameters.
// class C
//   constant Integer b[1].a[1].j = 1;
//   constant Integer b[1].a[2].j = 2;
//   constant Integer b[1].a[3].j = 3;
//   Real b[1].x[1];
//   Real b[1].x[2];
//   Real b[1].x[3];
//   Real b[1].y[1];
//   Real b[1].y[2];
//   Real b[1].y[3];
//   constant Integer b[2].a[1].j = 1;
//   constant Integer b[2].a[2].j = 2;
//   constant Integer b[2].a[3].j = 3;
//   Real b[2].x[1];
//   Real b[2].x[2];
//   Real b[2].x[3];
//   Real b[2].y[1];
//   Real b[2].y[2];
//   Real b[2].y[3];
// equation
//   b[1].x[1] = b[1].y[1];
//   b[1].x[2] = b[1].y[2];
//   b[1].x[3] = b[1].y[3];
//   b[2].x[1] = b[2].y[1];
//   b[2].x[2] = b[2].y[2];
//   b[2].x[3] = b[2].y[3];
// end C;
// endResult
