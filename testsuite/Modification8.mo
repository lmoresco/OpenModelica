// name:     Modification8
// keywords: modification
// status:   incorrect
// 
// Either this is a priority issue, or it is incorrect.  The
// Manchester minutes says it's incorrect to have two modifiers for
// the same component.
//
// I'm not convinced that it is even possible to enforce this rule.
// 
// Apparently, modifiers of the form a.b are not allowed.  There you go.

class Modification8
  class A
    Real x;
  end A;
  class B
    A a;
  end B;
  B b(a.x = 1.0, a(x = 2.0));
end Modification8;
