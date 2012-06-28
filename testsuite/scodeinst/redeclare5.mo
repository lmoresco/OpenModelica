// name: redeclare5.mo
// keywords:
// status: correct
//


model A
  Real x;
end A;

model B
  extends A;
  Real y;
end B;

model C
  replaceable B b extends A(x = 4, y = 6) "hej";
end C;

// Result:
// 
// EXPANDED FORM:
// 
// class C
//   Real b.x;
//   Real b.y;
// end C;
// 
// 
// Found 2 components and 0 parameters.
// class C
//   Real b.x;
//   Real b.y;
// end C;
// endResult
