// name:     ConnectHierarchical1
// keywords: connect
// status:   correct
// 
// All effort variables are equal to 1. The unknown flow 'a.b.c.f'
// evaluates to -1.
//

connector Connector
  flow Real f;
  Real e;
end Connector;

class B
  Connector c;
end B;

class A
  B b;
  Connector c1, c2(f = 2.0);
equation
  connect(c1, b.c);
end A;

class ConnectHierarchical1
  A a;
  Connector c(e = 1.0, f = 1.0);
equation
  connect(a.c1, a.c2);
  connect(c, a.c1);
end ConnectHierarchical1;

// fclass ConnectHierarchical1
// Real a.b.c.f;
// Real a.b.c.e;
// Real a.c1.f;
// Real a.c1.e;
// Real a.c2.f;
// Real a.c2.e;
// Real c.f;
// Real c.e;
// equation
//   a.c2.f = 2.0;
//   a.c1.e = a.b.c.e;
//   -a.c1.f + a.b.c.f = 0.0;
//   c.f = 1.0;
//   c.e = 1.0;
//   c.e = a.c1.e;
//   a.c1.e = a.c2.e;
//   -c.f + a.c1.f + a.c2.f = 0.0;
//   c.f = 0.0;
// end ConnectHierarchical1;
