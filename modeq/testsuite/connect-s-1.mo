// Equations:
//
//   b[1].a.c.r.b == b[1].c.r.b
//   b[1].a.c.y + -b[1].c.y == 0.0
//   b[2].a.c.r.b == b[2].c.r.b
//   b[2].a.c.y + -b[2].c.y == 0.0
//   b[3].a.c.r.b == b[3].c.r.b
//   b[3].a.c.y + -b[3].c.y == 0.0
//   b[1].c.r.b == b[2].c.r.b
//   b[2].c.r.b == b[3].c.r.b
//   b[3].c.r.b == c.r.b
//   b[1].c.y + b[2].c.y + b[3].c.y + -c.y == 0.0
//

type Real = RealType;

class C

  record R
    Real b[10];
  end R;

  flow Real y;
  R r;

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
  B b[3];
  C c;
equation
  connect(b[1].c, b[2].c);
  connect(b[2].c, b[1+2].c);
  connect(b[4-1].c, c);
end World;
