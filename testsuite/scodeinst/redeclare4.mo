// name: redeclare4.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//


type T1 = Real(start = 1.0);
type T2 = Real(start = 2.0);

model A
  replaceable T1 x;
  replaceable T1 y;
end A;

model B
  A a(redeclare T2 x, y);
end B;

model C
  extends B(a.x = 3);
end C;

// Result:
// 
// EXPANDED FORM:
// 
// class C
//   Real(start=2.0) a.x = 3;
//   Real(start=1.0) a.y;
// end C;
// 
// 
// Found 2 components and 0 parameters.
// class C
//   Real a.x(start = 2.0) = 3.0;
//   Real a.y(start = 1.0);
// end C;
// endResult
