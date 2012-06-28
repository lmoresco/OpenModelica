// name: loop3.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//


model A
  parameter Integer n = 2;
  parameter Real x[2, 3];
  parameter Integer i = size(x, n);
end A;

// Result:
// 
// EXPANDED FORM:
// 
// class A
//   parameter Integer n = 2;
//   parameter Real x[1,1];
//   parameter Real x[1,2];
//   parameter Real x[1,3];
//   parameter Real x[2,1];
//   parameter Real x[2,2];
//   parameter Real x[2,3];
//   parameter Integer i = 3;
// end A;
// 
// 
// Found 0 components and 8 parameters.
// class A
//   parameter Integer n = 2;
//   parameter Real x[1,1];
//   parameter Real x[1,2];
//   parameter Real x[1,3];
//   parameter Real x[2,1];
//   parameter Real x[2,2];
//   parameter Real x[2,3];
//   parameter Integer i = size(x, n);
// end A;
// Warning: Parameter x has neither value nor start value, and is fixed during initialization (fixed=true)
// 
// endResult
