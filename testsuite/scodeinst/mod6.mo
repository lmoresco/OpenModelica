// name: mod6.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//


model A
  Real x = 1.0;
end A;

model B
  A a(x = 2.0);
end B;

// Result:
// 
// EXPANDED FORM:
// 
// class B
//   Real a.x = 2.0;
// end B;
// 
// 
// Found 1 components and 0 parameters.
// class B
//   Real a.x = 2.0;
// end B;
// endResult
