// name: inst2.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//


model A
  replaceable model B
    Real x;
  end B;

  B b;
end A;

model C
  extends A;

  redeclare model B
    Real y;
  end B;
end C;

// Result:
// 
// EXPANDED FORM:
// 
// class C
//   Real b.y;
// end C;
// 
// 
// Found 1 components and 0 parameters.
// class C
//   Real b.y;
// end C;
// endResult
