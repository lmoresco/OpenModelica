// name:     ScopeModification1
// keywords: scoping,modification
// status:   correct
// 
// In class modifications the scope of the outer class is used for
// looking up variables. Consequently 'a' of the outer class is used 
// in the modification.
//

class ScopeModification1
  class Inner
    Real a;
    Real b;
  end Inner;
  Real a;
  Inner m(b = a);
end ScopeModification1;

// fclass ScopeModification1
//   Real a;
//   Real m.a;
//   Real m.b;
// equation
//   m.b = a;
// end ScopeModification1;
