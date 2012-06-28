// name: ih1.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//


model A
  Real x;
  Real y;
equation
  y = 1.0;
end A;

model B
  A a;
end B;

model C
  B b;
equation
  b.a.x = 2.0;
end C;

// Result:
// 
// EXPANDED FORM:
// 
// class C
//   Real b.a.x;
//   Real b.a.y;
// equation
//   b.a.y = 1.0;
//   b.a.x = 2.0;
// end C;
// 
// 
// Found 2 components and 0 parameters.
// class C
//   Real b.a.x;
//   Real b.a.y;
// equation
//   b.a.y = 1.0;
//   b.a.x = 2.0;
// end C;
// endResult
