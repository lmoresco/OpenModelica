// name: redeclare6.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//


model A
  replaceable Integer x;
end A;

model B
  extends A(redeclare replaceable Integer x = 2);
end B;

model C
  extends B(redeclare Real x = 3);
end C;

// Result:
// 
// EXPANDED FORM:
// 
// class C
//   Real x = 3;
// end C;
// 
// 
// Found 1 components and 0 parameters.
// class C
//   Real x;
// end C;
// endResult
