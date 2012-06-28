// name: redeclare2.mo
// keywords:
// status: correct
//


model A
  replaceable Real x;
end A;

model B
  A a(redeclare parameter Real x);
end B;

// Result:
// 
// EXPANDED FORM:
// 
// class B
//   parameter Real a.x;
// end B;
// 
// 
// Found 0 components and 1 parameters.
// class B
//   parameter Real a.x;
// end B;
// endResult
