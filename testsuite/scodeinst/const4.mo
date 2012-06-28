// name: const4.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//


class P
  constant Integer i = 3;
end P;

model A
  P p[2](i = {1, 2});
  Real x[2] = p.i;
end A;

// Result:
// 
// EXPANDED FORM:
// 
// class A
//   Real x[1] = 1;
//   Real x[2] = 2;
// end A;
// 
// 
// Found 2 components and 0 parameters.
// class A
//   constant Integer p[1].i = 1;
//   constant Integer p[2].i = 2;
//   Real x[1] = 1.0;
//   Real x[2] = 1.0;
// end A;
// endResult
