model A
  Real x;
end A;

model B
  extends A;
  Real y = 1;
  Real z;
end B;

model M
  A a(x(unit = "m"));
equation
  a.x = 17.0;
end M;

model World
  M m(redeclare B a);
equation
  m.z = m.x;
end World;
