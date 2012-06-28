// name: dim18
// keywords:
// status: correct
//

model A
  parameter Integer m = 2;
  parameter Integer n = m;
  Real x[n];
end A;

// Result:
// 
// EXPANDED FORM:
// 
// class A
//   parameter Integer m = 2;
//   parameter Integer n = 2;
//   Real x[1];
//   Real x[2];
// end A;
// 
// 
// Found 2 components and 2 parameters.
// class A
//   parameter Integer m = 2;
//   parameter Integer n = m;
//   Real x[1];
//   Real x[2];
// end A;
// endResult
