// name: type3.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//
//

type MyReal = Real[2];
type MyReal2 = MyReal[4];

model A
  MyReal x[3];
  Real[2] y[3];
  MyReal2 z[1];
end A;

// Result:
// 
// EXPANDED FORM:
// 
// class A
//   Real x[1,1];
//   Real x[1,2];
//   Real x[2,1];
//   Real x[2,2];
//   Real x[3,1];
//   Real x[3,2];
//   Real y[1,1];
//   Real y[1,2];
//   Real y[2,1];
//   Real y[2,2];
//   Real y[3,1];
//   Real y[3,2];
//   (MyReal type bc:Real) z[1,1,1];
//   (MyReal type bc:Real) z[1,1,2];
//   (MyReal type bc:Real) z[1,2,1];
//   (MyReal type bc:Real) z[1,2,2];
//   (MyReal type bc:Real) z[1,3,1];
//   (MyReal type bc:Real) z[1,3,2];
//   (MyReal type bc:Real) z[1,4,1];
//   (MyReal type bc:Real) z[1,4,2];
// end A;
// 
// 
// Found 20 components and 0 parameters.
// class A
//   Real x[1];
//   Real x[2];
//   Real y[1,1];
//   Real y[1,2];
//   Real y[2,1];
//   Real y[2,2];
//   Real y[3,1];
//   Real y[3,2];
//   Real z[1,1];
//   Real z[1,2];
//   Real z[2,1];
//   Real z[2,2];
//   Real z[3,1];
//   Real z[3,2];
//   Real z[4,1];
//   Real z[4,2];
// end A;
// endResult
