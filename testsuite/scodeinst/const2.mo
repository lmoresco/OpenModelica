// name: const2.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//


model A
  package P
    constant Integer i = 2;
  end P;

  Real x[P.i];
end A;

// Result:
// 
// EXPANDED FORM:
// 
// class A
//   Real x[1];
//   Real x[2];
// end A;
// 
// 
// Found 2 components and 0 parameters.
// class A
//   Real x[1];
//   Real x[2];
// end A;
// endResult
