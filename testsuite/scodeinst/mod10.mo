// name: mod10.mo
// keywords:
// status: correct
//
//

model A
  Real x;
end A;

model B
  A a(x);
end B;

// Result:
// 
// EXPANDED FORM:
// 
// class B
//   Real a.x;
// end B;
// 
// 
// Found 1 components and 0 parameters.
// class B
//   Real a.x;
// end B;
// endResult
