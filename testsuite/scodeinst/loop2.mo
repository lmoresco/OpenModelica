// name: loop2.mo
// keywords:
// status: correct
//


model A
  Real x = x + 1;
end A;

// Result:
// 
// EXPANDED FORM:
// 
// class A
//   Real x = x + 1;
// end A;
// 
// 
// Found 1 components and 0 parameters.
// class A
//   Real x = 1.0 + x;
// end A;
// endResult
