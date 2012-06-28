// name: const13.mo
// keywords:
// status: correct
//

model A
  package D
    constant Real y;
  end D;

  package B
    extends D;
    constant Real x;
  end B;
end A;

model C
  A a(B(x = 3.0));
  Real y = a.B.y;
end C;

// Result:
// 
// EXPANDED FORM:
// 
// class C
//   Real y = 0;
// end C;
// 
// 
// Found 1 components and 0 parameters.
// class C
//   Real y = a.B.y;
// end C;
// [const13.mo:19:3-19:17:writable] Error: No constant value for variable a.B.y in scope C.
// 
// endResult
