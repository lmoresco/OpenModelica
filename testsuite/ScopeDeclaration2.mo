// name:     ScopeDeclaration2
// keywords: scoping,declaration
// status:   correct
// 
// An element (e.g. a variable) is added to the partially instantiated 
// parent AFTER the element has been completely instantiated.
//

class ScopeDeclaration2
  constant Real a = 3.0;
  class B
    Real a(min = a);
  end B;
  B b;
end ScopeDeclaration2;

// fclass ScopeDeclaration2
//   constant Real a;
//   Real b.a;
//   parameter Real b.a.min;
// equation
//   a = 3.0;
//   b.a.min = a;
//   assert(b.a >= b.a.min);
// end ScopeDeclaration2;
