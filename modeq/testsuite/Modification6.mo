//|name:     Modification6
//|keywords: modification,unknown
//|status:   correct
// 
// This file tests modification precedence.
//

model Motor
  model Foo
    parameter Real q = 1.0;
  end Foo;
  Foo f(q=2.0);
end Motor;

model Modification1
  Motor m1(Foo(q=3.0), f(q=4.0));
  Motor m2(f(q=4.0), Foo(q=3.0));
end Modification1;

// fclass Modification1
//   parameter Real m1.f.q;
//   parameter Real m2.f.q;
// equation
//   m1.f.q = 3.0;
//   m2.f.q = 3.0;
// end Modification1;
