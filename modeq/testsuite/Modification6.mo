// name:     Modification6
// keywords: modification,unknown
// status:   correct
// 
// This file tests modification precedence.
//

model M
  model Foo
    parameter Real q = 1.0;
  end Foo;
  Foo f(q=2.0);
end M;

model Modification6
  M m1(Foo(q=3.0), f(q=4.0));
  M m2(f(q=4.0), Foo(q=3.0));
end Modification6;

// fclass Modification6
//   parameter Real m1.f.q;
//   parameter Real m2.f.q;
// equation
//   m1.f.q = 3.0;
//   m2.f.q = 3.0;
// end Modification6;
