// name: bindings1.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//


model A
  constant Real x = 2 * y;
  constant Real z = 5;
  constant Real y = 3 + z;
end A;

// Result:
// 
// EXPANDED FORM:
// 
// class A
// end A;
// 
// 
// Found 0 components and 0 parameters.
// class A
//   constant Real z = 5.0;
//   constant Real y = 8.0;
//   constant Real x = 16.0;
// end A;
// endResult
