// Testing extends clauses

//  x.a == 1.0
//  x.b == 2.0

type Real = RealType;

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
