// name:     Redeclare1
// keywords: redeclare,type
// status:   correct
// 
// Redeclaration and subtyping.
// 

model A
  Real x;
end A;

model B
  extends A;
  Real z;
end B;

model M
  A a(x(unit = "m"));
equation
  a.x = 17.0;
end M;

model Redeclare1
  M m(redeclare B a);
equation
  m.z = m.x;
end Redeclare1;
