// name: inst1.mo
// keywords:
// status: correct
//


model A
  replaceable Real x;
end A;

model B
  extends A(redeclare Integer x);
end B;

// Result:
// 
// EXPANDED FORM:
// 
// class B
//   Integer x;
// end B;
// 
// 
// Found 1 components and 0 parameters.
// class B
//   Integer x;
// end B;
// endResult
