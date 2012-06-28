// name: const15.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//
// FAILREASON: Class modifications are not applied, x should be 4.
//

model A
  model B
    constant Integer i = 3;
  end B;
end A;

model C
  extends A(B(i = 4));
  Real x = B.i;
end C;

// Result:
// 
// EXPANDED FORM:
// 
// class C
//   Real x = 4;
// end C;
// 
// 
// Found 1 components and 0 parameters.
// class C
//   Real x = 3.0;
// end C;
// endResult
