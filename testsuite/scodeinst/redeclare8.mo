// name: redeclare8.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//

model A
  replaceable model M
    Real x;
  end M;

  M m;
end A;

model B
  extends A;

  redeclare model M
    Real y;
  end M;
end B;

// Result:
// 
// EXPANDED FORM:
// 
// class B
//   Real m.y;
// end B;
// 
// 
// Found 1 components and 0 parameters.
// class B
//   Real m.y;
// end B;
// endResult
