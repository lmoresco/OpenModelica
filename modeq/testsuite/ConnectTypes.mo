// name:     ConnectTypes
// keywords: connect,type,unknown
// status:   correct
// 
// Check generation of connection equations. No equations should be 
// generated for parameters and constants. <Ruediger: not sure>
//

connector Connector
  Real e;
  parameter Real p;
  discrete Real d;
  constant Real c;
end Connector;

class A
  Connector c;
end A;

class ConnectTypes
  A a;
  Connector c;
equation
  connect(c, a.c);
end ConnectTypes;

// fclass ConnectTypes
//   Real a.c.e;
//   parameter Real a.c.p;
//   discrete Real a.c.d;
//   constant Real a.c.c;
//   Real c.e;
//   parameter Real c.p;
//   discrete Real c.d;
//   constant Real c.c;
// equation
//   c.c = a.c.c;
//   c.d = a.c.d;
//   c.p = a.c.p;
//   c.e = a.c.e;
// end ConnectTypes;
