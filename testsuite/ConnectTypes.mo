// name:     ConnectTypes
// keywords: connect,type
// status:   correct
// 
// Check generation of connection equations. 
// Parameters and constants should generate assertions
// (used for size-parameters in Modelica.Blocks).

connector Connector
  Real e[n];
  Integer d;
  parameter Integer p;
  parameter Integer n=1;
  constant Real c=2;
end Connector;

class A
  Connector c;
end A;

class ConnectTypes
  A a(c(p=4));
  Connector c(p=4);
equation
  connect(c, a.c);
  c.e={time};
  c.d=4;
end ConnectTypes;

// fclass ConnectTypes
//   Real a.c.e[1];
//   parameter Real a.c.p=4;
//   parameter Integer a.c.n=1;
//   constant Real a.c.c=2;
//   Integer a.c.d;
//   Real c.e[1];
//   parameter Real c.p=4;
//   parameter Integer c.n=1;
//   constant Real c.c;
//   Integer c.d;
// equation
//   c.e[1] = time;
//   c.d = 4;
//   c.d = a.c.d;
//   c.e[1] = a.c.e[1];
//   assert(c.p==a.c.p,"...");
//   assert(c.c==a.c.c,"...");
// end ConnectTypes;
