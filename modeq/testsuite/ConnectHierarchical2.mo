//|name:     ConnectHierarchical2
//|keywords: connect
//|status:   erroneous
// 
// All effort variables are equal to 1. The unknown flow 'a.b.c.f'
// evaluates to 3, even though the same connections as in 
// ConnectHierarchical1 are established ('a.b.c.f' evaluates to -1 
// there).
// <Ruediger: possibly not more than one outer connector should be 
// allowed in a connection set?>
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
  connect(c1, c2);
end A;

class ConnectHierarchical2
  A a;
  Connector c(e = 1.0, f = 1.0);
equation
  connect(c, a.c1);
end ConnectHierarchical2;

// fclass ConnectHierarchical2
//   Real a.b.c.f;
//   Real a.b.c.e;
//   Real a.c1.f;
//   Real a.c1.e;
//   Real a.c2.f;
//   Real a.c2.e;
//   Real c.f;
//   Real c.e;
// equation
//   a.c2.f = 2.0;
//   a.c1.e = a.b.c.e;
//   a.b.c.e = a.c2.e;
//   -a.c1.f + a.b.c.f + -a.c2.f = 0.0;
//   c.f = 1.0;
//   c.e = 1.0;
//   c.e = a.c1.e;
//   -c.f + a.c1.f = 0.0;
// end ConnectHierarchical2;



