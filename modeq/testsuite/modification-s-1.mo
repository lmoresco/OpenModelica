// Modifications

// This file tests simple modifications of variables

// Equations:
//
//   m.j   = 3
//   m.f.q = 2
//   n.j   = 1
//   n.f.q = 5
//   o.j   = 1
//   o.f.q = 3 eller 4 ?
//   p.j   = 1
//   p.f.q = 3 eller 4 ?

type Real = RealType;

model Motor

  model Foo
    parameter Real q;
  end Foo;
  
  parameter Real j = 1;
  Foo f(q=2);

end motor;

model World
  Motor m(j = 3);
  Motor n(f(q=5));
  Motor o(Foo(q=3), f(q=4));
  Motor p(f(q=4), Foo(q=3));
end World;
