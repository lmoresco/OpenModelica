

//  b1.a.c.r.b == b1.c.r.b
//  b1.a.c.y + -b1.c.y == 0.0
//  b2.a.c.r.b == b2.c.r.b
//  b2.a.c.y + -b2.c.y == 0.0
//  b3.a.c.r.b == b3.c.r.b
//  b3.a.c.y + -b3.c.y == 0.0
//  b1.c.r.b == b2.c.r.b
//  b2.c.r.b == b3.c.r.b
//  b3.c.r.b == c.r.b
//  b1.c.y + b2.c.y + b3.c.y + -c.y == 0.0

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
