// name: bindings5.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//

model N
  Real r;
end N;

model M
  N n(each r = 1.0);
end M;

// Result:
// 
// EXPANDED FORM:
// 
// class M
//   Real n.r = 1.0;
// end M;
// 
// 
// Found 1 components and 0 parameters.
// class M
//   Real n.r = 1.0;
// end M;
// endResult
