// name:     ScopeDeclaration2
// keywords: scoping,declaration
// status:   incorrect
// 
// An element is visible in its entire scope.
// The following is thus incorrect since the minimum
// value is not a parameter-expression.

class ScopeDeclaration2
  constant Real a = 3.0;
  class B
    Real a(min = a);
  end B;
  B b;
end ScopeDeclaration2;

// fclass ScopeDeclaration2
//   constant Real a=3.0;
//   Real b.a;
//   parameter Real b.a.min=b.a;// Illegal.
// equation
//   assert(b.a >= b.a.min,"...");
// end ScopeDeclaration2;
