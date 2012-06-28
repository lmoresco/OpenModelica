// name: eq1.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//

model A
  Real x;
  Real y;
equation
  x = 2;
  y = 3;
end A;

// Result:
// 
// EXPANDED FORM:
// 
// class A
//   Real x;
//   Real y;
// equation
//   x = 2;
//   y = 3;
// end A;
// 
// 
// Found 2 components and 0 parameters.
// class A
//   Real x;
//   Real y;
// equation
//   x = 2.0;
//   y = 3.0;
// end A;
// endResult
