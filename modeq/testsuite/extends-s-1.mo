// Testing extends clauses

// Equations:
//
//   x.a = 2
//   x.b = 2

class A
  Real a = 1;
end A;

class B
  extends A(a = 2);
  Real b = 2;
end B;

model World
  B x;
end World;
