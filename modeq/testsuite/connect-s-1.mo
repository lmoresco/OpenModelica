// fclass World
// equation
//   b1.a.c.x = b1.c.x;
//   b1.a.c.y + -b1.c.y = 0.0;
//   b2.a.c.x = b2.c.x;
//   b2.a.c.y + -b2.c.y = 0.0;
//   b3.a.c.x = b3.c.x;
//   b3.a.c.y + -b3.c.y = 0.0;
//   b1.c.x = b2.c.x;
//   b2.c.x = b3.c.x;
//   b3.c.x = cw.x;
//   b1.c.y + b2.c.y + b3.c.y + -cw.y = 0.0;
// end World;

type Real = RealType;

class C
  flow Real y;
  Real x;
end A;

model A
  C c;
end A;

model B
  C c;
  A a;
equation
  connect(a.c, c);
end B;

model World
  B b1,b2,b3;
  C cw;
equation
  connect(b1.c, b2.c);
  connect(b2.c, b3.c);
  connect(b3.c, cw);
end World;
