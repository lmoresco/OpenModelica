// name: dim1.mo
// keywords:
// status: correct
//


model B
  parameter Integer n = 3;
  Real x[n];
end B;

model A
  B b;
end A;

// Result:
// 
// EXPANDED FORM:
// 
// class A
//   parameter Integer b.n = 3;
//   Real b.x[1];
//   Real b.x[2];
//   Real b.x[3];
// end A;
// 
// 
// Found 3 components and 1 parameters.
// class A
//   parameter Integer b.n = 3;
//   Real b.x[1];
//   Real b.x[2];
//   Real b.x[3];
// end A;
// endResult
