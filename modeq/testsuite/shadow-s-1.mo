//
// This test shows what shadowing of variable names can do. Especially
// the replacing of equation where the LHS is a simple variable name.
//
// In my opinion, this is a very dubious feature, which I'm not sure
// is a good idea at all.

// The equations should be
//
//   a.x    == 2.0
//   a.b.x  == 3.0
//   a.y[3] == 5.0
//
// the x = 1 equation is shadowed by the modification.

type Real = RealType;

class A
  Real x=1;
  Real y[17];
  class B
    Real x=3;
  end B;
  B b;
equation
  x = 1;
  y[3] = 4;
end A;

model World
  A a(x = 2, y[3] = 5);
end World;
