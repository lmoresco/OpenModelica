// name: func3.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//


function _
  input Real x;
  output Real y;
algorithm
  y := x;
end _;

model A
  Real x = _(3.0);
end A;

// Result:
// 
// EXPANDED FORM:
// 
// function _
//   input Real x;
//   output Real y;
// algorithm
//   y := x;
// end _;
// 
// class A
//   Real x = _(3.0);
// end A;
// 
// 
// Found 1 components and 0 parameters.
// function _
//   input Real x;
//   output Real y;
// algorithm
//   y := x;
// end _;
// 
// class A
//   Real x = 3.0;
// end A;
// endResult
