// Testing extends clauses

// Equations:
//
//   x.a = 2.0
//   x.b = 2.0

class A
  Real a = 1.0;
end A;

class B
  extends A(a = 2.0);
  Real b = 2.0;
end B;

model World
  B x;
end World;
