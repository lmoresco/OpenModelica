// name: mod8.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//


model A
  Real x;
end A;

model B
  Real y;
  A a(x = y);
end B;

// Result:
// 
// EXPANDED FORM:
// 
// class B
//   Real y;
//   Real a.x = y;
// end B;
// 
// 
// Found 2 components and 0 parameters.
// class B
//   Real y;
//   Real a.x = y;
// end B;
// endResult
