// name: eq6.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//

package P
  model A
    Real x;
  equation
    x = i;
  end A;

  constant Integer i = 2;
end P;

model B
  P.A a[3];
end B;

// Result:
// 
// EXPANDED FORM:
// 
// class B
//   Real a[1].x;
//   Real a[2].x;
//   Real a[3].x;
// equation
//   a[1].x = 2;
//   a[2].x = 2;
//   a[3].x = 2;
// end B;
// 
// 
// Found 3 components and 0 parameters.
// class B
//   Real a[1].x;
//   Real a[2].x;
//   Real a[3].x;
// equation
//   a[1].x = 2.0;
//   a[2].x = 2.0;
//   a[3].x = 2.0;
// end B;
// endResult
