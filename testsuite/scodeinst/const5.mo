// name: const5.mo
// keywords:
// status: correct
//
// Correct, but old instantiation goes into infinite loop.
//


model A
  Real x[P.n];
end A;

package P
  constant Integer n = 2;
  constant A a;
end P;

// Result:
// 
// EXPANDED FORM:
// 
// class P
// end P;
// 
// 
// Found 0 components and 0 parameters.
// endResult
