// Modifications

// This file tests simple modifications of variables

// Equations:
//
//   m.j   = 3.0
//   m.f.q = 2.0
//   n.j   = 1.0
//   n.f.q = 5.0
//   o.j   = 1.0
//   o.f.q = 3.0 eller 4.0 ?
//   p.j   = 1.0
//   p.f.q = 3.0 eller 4.0 ?

type Real = RealType;

model Motor

  model Foo
    parameter Real q;
  end Foo;
  
  parameter Real j = 1.0;
  Foo f(q=2);

end motor;

model World
  Motor m(j = 3.0);
  Motor n(f(q=5.0));
  Motor o(Foo(q=3.0), f(q=4.0));
  Motor p(f(q=4.0), Foo(q=3.0));
end World;
