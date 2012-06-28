// name: bindings2.mo
// keywords:
// status: correct
//


model A
  Real x;
end A;

model B
  A a[3](x = {1, 2, 3});
end B;

// Result:
// 
// EXPANDED FORM:
// 
// class B
//   Real a[1].x = 1;
//   Real a[2].x = 2;
//   Real a[3].x = 3;
// end B;
// 
// 
// Found 3 components and 0 parameters.
// class B
//   Real a[1].x = 1.0;
//   Real a[2].x = 2.0;
//   Real a[3].x = 3.0;
// end B;
// endResult
